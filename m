Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B087406F43
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 18:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184580.333293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj9T-0007AA-RT; Fri, 10 Sep 2021 16:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184580.333293; Fri, 10 Sep 2021 16:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOj9T-00077X-Nk; Fri, 10 Sep 2021 16:13:19 +0000
Received: by outflank-mailman (input) for mailman id 184580;
 Fri, 10 Sep 2021 16:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyUy=OA=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOj9S-00075v-GJ
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 16:13:18 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87d67a80-b29d-4c26-8405-e69cb21b773d;
 Fri, 10 Sep 2021 16:13:17 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631290374880385.695511741147;
 Fri, 10 Sep 2021 09:12:54 -0700 (PDT)
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
X-Inumbo-ID: 87d67a80-b29d-4c26-8405-e69cb21b773d
ARC-Seal: i=1; a=rsa-sha256; t=1631290378; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eftcgl6WBbiBfHcWeuvjVd4/qZ8X9u42X6fasPZ2qPXlTG5r79DCz37iXh9nVOyHnh2aIeLDypzdcder0sgkQDVF74Y4EBY3u1uBiMw1pxUsM62nD3CWHluaOLahdf8NobOM/cYLzallBx1Z795TJ4F3YKKziz5jmO966aQRxJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631290378; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=R9fWktmmlY/XpFnqpgzdSmnNqMw4SOU1eoy5oHGQ8QI=; 
	b=Ujk8UKtyRxBcHSK/03ujSNKhs/hpyY21D+xMAp3nYgi88uHY0Mjh23oMSt9/FCeW01AE8cJT5bfRoDd/i+Y0nhZ6Yor9I7HsEVHCk1b52LRBcKuyWuFDCqdWNTTOBNIeYFgv8q5ebopnqfUnDacmMCMlZIBh1+qC9IEt7LFQT64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631290378;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=R9fWktmmlY/XpFnqpgzdSmnNqMw4SOU1eoy5oHGQ8QI=;
	b=ZhTDnfQS85Ean6yaJtku37HJH9WA+GP+D5wzSnLVtH/8J+WDzntUuwhurhi46EtE
	4oXYXm6XpoVuCltFirV+sDBQDvBORsxhaAueSG46Pj3rkwdgs3AY541ovPbAgQp08zC
	gUbXLZTU0FO9sJguuuYTz5TCQNxk7Q1OVHN8hQUM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v6 02/10] xsm: remove the ability to disable flask
Date: Fri, 10 Sep 2021 16:12:57 -0400
Message-Id: <20210910201305.32526-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910201305.32526-1-dpsmith@apertussolutions.com>
References: <20210910201305.32526-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Linux when SELinux is put into permissive mode the descretionary access
controls are still in place. Whereas for Xen when the enforcing state of flask
is set to permissive, all operations for all domains would succeed, i.e. it
does not fall back to the default access controls. To provide a means to mimic
a similar but not equivalent behavior, a flask op is present to allow a
one-time switch back to the default access controls, aka the "dummy policy".

While this may be desirable for an OS, Xen is a hypervisor and should not allow
the switching of which security policy framework is being enforced after boot.
This patch removes the flask op to enforce the desired XSM usage model
requiring a reboot of Xen to change the XSM policy module in use.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/include/public/xsm/flask_op.h |  2 +-
 xen/xsm/flask/flask_op.c          | 30 ------------------------------
 2 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/xen/include/public/xsm/flask_op.h b/xen/include/public/xsm/flask_op.h
index 16af7bc22f..b41dd6dac8 100644
--- a/xen/include/public/xsm/flask_op.h
+++ b/xen/include/public/xsm/flask_op.h
@@ -188,7 +188,7 @@ struct xen_flask_op {
 #define FLASK_SETBOOL           12
 #define FLASK_COMMITBOOLS       13
 #define FLASK_MLS               14
-#define FLASK_DISABLE           15
+#define FLASK_DISABLE           15 /* No longer implemented */
 #define FLASK_GETAVC_THRESHOLD  16
 #define FLASK_SETAVC_THRESHOLD  17
 #define FLASK_AVC_HASHSTATS     18
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 01e52138a1..f41c025391 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -223,32 +223,6 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
 
 #ifndef COMPAT
 
-static int flask_disable(void)
-{
-    static int flask_disabled = 0;
-
-    if ( ss_initialized )
-    {
-        /* Not permitted after initial policy load. */
-        return -EINVAL;
-    }
-
-    if ( flask_disabled )
-    {
-        /* Only do this once. */
-        return -EINVAL;
-    }
-
-    printk("Flask:  Disabled at runtime.\n");
-
-    flask_disabled = 1;
-
-    /* Reset xsm_ops to the original module. */
-    xsm_ops = &dummy_xsm_ops;
-
-    return 0;
-}
-
 static int flask_security_setavc_threshold(struct xen_flask_setavc_threshold *arg)
 {
     int rv = 0;
@@ -698,10 +672,6 @@ ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op)
         rv = flask_mls_enabled;
         break;    
 
-    case FLASK_DISABLE:
-        rv = flask_disable();
-        break;
-
     case FLASK_GETAVC_THRESHOLD:
         rv = avc_cache_threshold;
         break;
-- 
2.20.1


