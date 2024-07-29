Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E293FAEF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766999.1177555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTD7-0002ox-MC; Mon, 29 Jul 2024 16:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766999.1177555; Mon, 29 Jul 2024 16:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTD7-0002lu-Jf; Mon, 29 Jul 2024 16:26:57 +0000
Received: by outflank-mailman (input) for mailman id 766999;
 Mon, 29 Jul 2024 16:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+rL=O5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYTD6-0002lo-PM
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:26:56 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb2452b-4dc7-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 18:26:55 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5b391c8abd7so987522a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 09:26:55 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac657837cdsm6031635a12.97.2024.07.29.09.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 09:26:54 -0700 (PDT)
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
X-Inumbo-ID: 5eb2452b-4dc7-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722270414; x=1722875214; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVItmSyQGZzigyCUITOGLDF5SaH+lZWw41oSPFUOFfI=;
        b=PbCi50H4sOGPHw6HknlFsl8qMxtftZxYdVkOwO35biOtxdVSqq+Wb8oV3dzhTcQ11D
         kuB3kOP2s1JBcQswebeN1Z08DS5YO9LpwxGT+EL1eNa25e+5HUGZUgwRcDF6rJXk9L5Z
         fW5c+bkM7/FM2LVS94JwGrZQE9CUcwWruDwNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722270414; x=1722875214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVItmSyQGZzigyCUITOGLDF5SaH+lZWw41oSPFUOFfI=;
        b=URUKzk3LcQEQuD8rCWFIbs+l8wqxipjXvPIQbKI3+GyMPNQ64G14VHHKoR0XVWS2Ln
         My1P/YTKcfloctOgoTOJgFaXf0kGymrrqiHPX8YBYR5BKPD5Udnpn6WtnZFMOlRtN/9q
         dwVkMJ8ycal78ONAGEGYFrbgveay176s2UsTaTkWnvU9n64nvB7nAes37prNf/u6o0Jo
         /g3FKBIizeyssgOzh0s0fQaS+V/gg/AZgDlQeZqsR56QHkrWsbKAto3k5ie+V/sTct4e
         +ZwxGYpOaMp3q43XLCQ903UAMCuzExAtb6hHoalz5D3OLaMN7OSKVLTl1N10j+is0xvg
         KsjQ==
X-Gm-Message-State: AOJu0YztZDe9WZPhio//9PKpul5RYxUr4UOPUouh0i/b9ISdVTLo6dvI
	ZXOPZveWKSU9tum+5Z5vHg8IFYJJnomLCtszD39+UNr8YlQndkVw3HRuvoaJZsp4yU4sTSTJvlp
	j
X-Google-Smtp-Source: AGHT+IGYnErR2tlUECKCyr2vyzYxPKtU802yE/SXoq8yKUI7h1EBMjFRGXHUvt72Fn10ipYgJareig==
X-Received: by 2002:a50:d659:0:b0:5a0:e4a6:b3c9 with SMTP id 4fb4d7f45d1cf-5b0205d5d69mr5137434a12.7.1722270414480;
        Mon, 29 Jul 2024 09:26:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH] XSM/domctl: Fix permission checks on XEN_DOMCTL_createdomain
Date: Mon, 29 Jul 2024 17:26:51 +0100
Message-Id: <20240729162651.571991-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XSM checks for XEN_DOMCTL_createdomain are problematic.  There's a split
between xsm_domctl() called early, and flask_domain_create() called quite late
during domain construction.

All XSM implementations except Flask have a simple IS_PRIV check in
xsm_domctl(), and operate as expected when an unprivileged domain tries to
make a hypercall.

Flask however foregoes any action in xsm_domctl() and defers everything,
including the simple "is current permitted to create a a domain" check, to
flask_domain_create().

As a conseqeuence, when XSM Flask is active, and irrespective of the policy
loaded, all domains irrespective of privilege can:

 * Mutate the global 'rover' variable, used to track the next free domid.
   Therefore, all domains can cause a domid wraparound, and combined with a
   volentary reboot, choose their own domid.

 * Cause a reasonable amount of a domain to be constructed before ultimately
   failing for permission reasons, including the use of settings outside of
   supported limits.

In order to remedate this, pass the ssidref into xsm_domctl() and at least
check that the calling domain privileged enough to create domains.

This issue has not been assigned an XSA, because Flask is experimental and not
security supported.

Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/mm/paging.c |  2 +-
 xen/common/domctl.c      |  4 +++-
 xen/include/xsm/dummy.h  |  2 +-
 xen/include/xsm/xsm.h    |  6 +++---
 xen/xsm/flask/hooks.c    | 13 +++++++++++--
 5 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index bca320fffabf..dd47bde5ce40 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -767,7 +767,7 @@ long do_paging_domctl_cont(
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_domctl(XSM_OTHER, d, op.cmd);
+    ret = xsm_domctl(XSM_OTHER, d, op.cmd, 0 /* SSIDref not applicable */);
     if ( !ret )
     {
         if ( domctl_lock_acquire() )
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 2c0331bb05ed..ea16b759109e 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -322,7 +322,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
     }
 
-    ret = xsm_domctl(XSM_OTHER, d, op->cmd);
+    ret = xsm_domctl(XSM_OTHER, d, op->cmd,
+                     /* SSIDRef only applicable for cmd == createdomain */
+                     op->u.createdomain.ssidref);
     if ( ret )
         goto domctl_out_unlock_domonly;
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 00d2cbebf25a..709de238e4ef 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -162,7 +162,7 @@ static XSM_INLINE int cf_check xsm_set_target(
 }
 
 static XSM_INLINE int cf_check xsm_domctl(
-    XSM_DEFAULT_ARG struct domain *d, int cmd)
+    XSM_DEFAULT_ARG struct domain *d, int cmd, uint32_t ssidref)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( cmd )
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 8dad03fd3d45..4a6f31ab9c23 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -60,7 +60,7 @@ struct xsm_ops {
     int (*domctl_scheduler_op)(struct domain *d, int op);
     int (*sysctl_scheduler_op)(int op);
     int (*set_target)(struct domain *d, struct domain *e);
-    int (*domctl)(struct domain *d, int cmd);
+    int (*domctl)(struct domain *d, int cmd, uint32_t ssidref);
     int (*sysctl)(int cmd);
     int (*readconsole)(uint32_t clear);
 
@@ -248,9 +248,9 @@ static inline int xsm_set_target(
     return alternative_call(xsm_ops.set_target, d, e);
 }
 
-static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd, uint32_t ssidref)
 {
-    return alternative_call(xsm_ops.domctl, d, cmd);
+    return alternative_call(xsm_ops.domctl, d, cmd, ssidref);
 }
 
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 5e88c71b8e22..3d228a6011f3 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -663,12 +663,21 @@ static int cf_check flask_set_target(struct domain *d, struct domain *t)
     return rc;
 }
 
-static int cf_check flask_domctl(struct domain *d, int cmd)
+static int cf_check flask_domctl(struct domain *d, int cmd, uint32_t ssidref)
 {
     switch ( cmd )
     {
-    /* These have individual XSM hooks (common/domctl.c) */
     case XEN_DOMCTL_createdomain:
+        /*
+         * There is a later hook too, but at this early point simply check
+         * that the calling domain is privileged enough to create a domain.
+         *
+         * Note that d is NULL because we haven't even allocated memory for it
+         * this early in XEN_DOMCTL_createdomain.
+         */
+        return avc_current_has_perm(ssidref, SECCLASS_DOMAIN, DOMAIN__CREATE, NULL);
+
+    /* These have individual XSM hooks (common/domctl.c) */
     case XEN_DOMCTL_getdomaininfo:
     case XEN_DOMCTL_scheduler_op:
     case XEN_DOMCTL_irq_permission:

base-commit: 8b5016e28737f140926619b14b8ca291dc4c5e62
-- 
2.39.2


