Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB8387C5A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 17:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129349.242803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1XW-0006aU-S1; Tue, 18 May 2021 15:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129349.242803; Tue, 18 May 2021 15:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1XW-0006Xd-OK; Tue, 18 May 2021 15:21:46 +0000
Received: by outflank-mailman (input) for mailman id 129349;
 Tue, 18 May 2021 15:21:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj1XV-0006XX-Ko
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 15:21:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj1XV-0005Wi-GD; Tue, 18 May 2021 15:21:45 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj1XV-0000Gt-7e; Tue, 18 May 2021 15:21:45 +0000
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
	bh=bihKm/0I5e2904VEtD9FhHuR9ZFEzgsDrIr7s+Qg+Yk=; b=jwjiEbVEp6SoBekt84khga6jzN
	TowDPHVP/SKdmNJhrs0KH57rsRRzbkhvmMtAFEioVQnfpXspgWK1J5+QLpXBAJuJGq5oKQVbB5Nbw
	ZeZ4mxpz8RsaRVdfoQkiT+X0qp7KOPmvCoi6czFW7R0Sm1nnuU7R61EhwGGsKNslRxHo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] tools/xenstored: Remove unused parameter in check_domains()
Date: Tue, 18 May 2021 16:21:40 +0100
Message-Id: <20210518152140.6333-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

The parameter of check_domains() is not used within the function. In fact,
this was a left over of the original implementation as the version merged
doesn't need to know whether we are restoring.

So remove it.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 2 +-
 tools/xenstore/xenstored_domain.c  | 4 ++--
 tools/xenstore/xenstored_domain.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 8e470f2b2056..07458d7b48d0 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -589,7 +589,7 @@ void lu_read_state(void)
 	 * have died while we were live-updating. So check all the domains are
 	 * still alive.
 	 */
-	check_domains(true);
+	check_domains();
 }
 
 static const char *lu_activate_binary(const void *ctx)
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 3d4d0649a243..0e4bae9a9dd6 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -220,7 +220,7 @@ static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
 	       dominfo->domid == domid;
 }
 
-void check_domains(bool restore)
+void check_domains(void)
 {
 	xc_dominfo_t dominfo;
 	struct domain *domain;
@@ -277,7 +277,7 @@ void handle_event(void)
 		barf_perror("Failed to read from event fd");
 
 	if (port == virq_port)
-		check_domains(false);
+		check_domains();
 
 	if (xenevtchn_unmask(xce_handle, port) == -1)
 		barf_perror("Failed to write to event fd");
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index dc9759171317..cc5147d7e747 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -21,7 +21,7 @@
 
 void handle_event(void);
 
-void check_domains(bool restore);
+void check_domains(void);
 
 /* domid, mfn, eventchn, path */
 int do_introduce(struct connection *conn, struct buffered_data *in);
-- 
2.17.1


