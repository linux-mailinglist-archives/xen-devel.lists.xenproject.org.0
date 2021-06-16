Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F83A9DF7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143288.264214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlc-0007pv-7U; Wed, 16 Jun 2021 14:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143288.264214; Wed, 16 Jun 2021 14:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlb-0007js-UV; Wed, 16 Jun 2021 14:43:43 +0000
Received: by outflank-mailman (input) for mailman id 143288;
 Wed, 16 Jun 2021 14:43:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlZ-0007AL-2j
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlY-0004F5-9d; Wed, 16 Jun 2021 14:43:40 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlY-0007D0-1H; Wed, 16 Jun 2021 14:43:40 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=xS2Ezk6IKf2znuGkPh4eU4xq2n4H9YnKOyWflMAxdpI=; b=rTI2FWbDmwOU+ZmJRYSDmZq+x
	Urw587evNvAsBzxoNv4yyEvVa3DN3rzzXLATjbW2U+u0iQ4JPV5cEEapLQLirpv+pdqB1TciCzf+V
	E9c2zPhuhG61R7p/A2q6dZazkAPyr+HWWffWt1ynbjUBCaNgreQxRPZEiZXHy/DUcVGu8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 09/10] tools/xenstored: Dump delayed requests
Date: Wed, 16 Jun 2021 15:43:23 +0100
Message-Id: <20210616144324.31652-10-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, only Live-Update request can be delayed. In a follow-up,
we will want to delay more requests (e.g. transaction start).
Therefore we want to preserve delayed requests across Live-Update.

Delayed requests are just complete "in" buffer. So the code is
refactored to allow sharing the code to dump "in" buffer.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 42 +++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 5b7ab7f74013..9eca58682b51 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2403,25 +2403,47 @@ const char *dump_state_global(FILE *fp)
 	return NULL;
 }
 
+static const char *dump_input_buffered_data(FILE *fp,
+					    const struct buffered_data *in,
+					    unsigned int *total_len)
+{
+	unsigned int hlen = in->inhdr ? in->used : sizeof(in->hdr);
+
+	*total_len += hlen;
+	if (fp && fwrite(&in->hdr, hlen, 1, fp) != 1)
+		return "Dump read data error";
+	if (!in->inhdr && in->used) {
+		*total_len += in->used;
+		if (fp && fwrite(in->buffer, in->used, 1, fp) != 1)
+			return "Dump read data error";
+	}
+
+	return NULL;
+}
+
 /* Called twice: first with fp == NULL to get length, then for writing data. */
 const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
 				     struct xs_state_connection *sc)
 {
 	unsigned int len = 0, used;
-	struct buffered_data *out, *in = c->in;
+	struct buffered_data *out;
 	bool partial = true;
+	struct delayed_request *req;
+	const char *ret;
 
-	if (in) {
-		len = in->inhdr ? in->used : sizeof(in->hdr);
-		if (fp && fwrite(&in->hdr, len, 1, fp) != 1)
-			return "Dump read data error";
-		if (!in->inhdr && in->used) {
-			len += in->used;
-			if (fp && fwrite(in->buffer, in->used, 1, fp) != 1)
-				return "Dump read data error";
-		}
+	/* Dump any command that was delayed */
+	list_for_each_entry(req, &c->delayed, list) {
+		if (req->func != process_delayed_message)
+			continue;
+
+		assert(!req->in->inhdr);
+		if ((ret = dump_input_buffered_data(fp, req->in, &len)))
+			return ret;
 	}
 
+	if (c->in && (ret = dump_input_buffered_data(fp, c->in, &len)))
+		return ret;
+
 	if (sc) {
 		sc->data_in_len = len;
 		sc->data_resp_len = 0;
-- 
2.17.1


