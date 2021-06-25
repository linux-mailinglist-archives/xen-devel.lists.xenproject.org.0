Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B13B3CCE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 08:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147056.270801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfaj-0003ZU-VU; Fri, 25 Jun 2021 06:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147056.270801; Fri, 25 Jun 2021 06:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfaj-0003Xf-SB; Fri, 25 Jun 2021 06:45:29 +0000
Received: by outflank-mailman (input) for mailman id 147056;
 Fri, 25 Jun 2021 06:45:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwfai-0003XJ-7v
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 06:45:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwfah-0004HU-6i; Fri, 25 Jun 2021 06:45:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwfag-0005fZ-Th; Fri, 25 Jun 2021 06:45:27 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=dViz5e+lVVEmf0UFlzwNGbarIpZltjnqcKJ8UbE/T+Q=; b=x++TpBpP/R1rEm4Ycr/imAuuW5
	wLwXKqGPSDBAOAvkTTxx8z/vPWXwgTEMQUgS5aLO4oV9gq5ZD1kubB9vhRxWM4s93P2t0skJwU8QI
	/Ikc1j5lOZ2uA+dTEXyOe+staFwP/tfIR1+rFywVGnBDWRG90O68mzza89sOtD56EXcc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] tools/xenstored: Correctly read the requests header from the stream
Date: Fri, 25 Jun 2021 07:45:22 +0100
Message-Id: <20210625064522.24919-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Commit c0fe360f42 ("tools/xenstored: Extend restore code to handle
multiple input buffer") extend the read_buffered_state() to support
multiple input buffers. Unfortunately, the commit didn't go far
enough and still used sc->data (start of the buffers) for retrieving
the header. This would lead to read the wrong headers for second and
follow-up commands.

Use data in place for sc->data for the source of the memcpy()s.

Fixes: c0fe360f42 ("tools/xenstored: Extend restore code to handle multiple input buffer")
Reported-by: Raphael Ning <raphning@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

I unfortunately didn't spot the issue because I forgot to check whether
the REQ ID of the responses were unique.
---
 tools/xenstore/xenstored_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index cf7297a96cb1..16c856730c55 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2717,11 +2717,11 @@ void read_state_buffered_data(const void *ctx, struct connection *conn,
 		len = sc->data_in_len - (data - sc->data);
 		if (len < sizeof(bdata->hdr)) {
 			bdata->inhdr = true;
-			memcpy(&bdata->hdr, sc->data, len);
+			memcpy(&bdata->hdr, data, len);
 			bdata->used = len;
 		} else {
 			bdata->inhdr = false;
-			memcpy(&bdata->hdr, sc->data, sizeof(bdata->hdr));
+			memcpy(&bdata->hdr, data, sizeof(bdata->hdr));
 			if (bdata->hdr.msg.len <= DEFAULT_BUFFER_SIZE)
 				bdata->buffer = bdata->default_buffer;
 			else
-- 
2.17.1


