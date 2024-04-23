Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8E8AE7AB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710599.1109901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxb-0001x1-KF; Tue, 23 Apr 2024 13:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710599.1109901; Tue, 23 Apr 2024 13:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxb-0001u5-HA; Tue, 23 Apr 2024 13:13:23 +0000
Received: by outflank-mailman (input) for mailman id 710599;
 Tue, 23 Apr 2024 13:13:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzFxa-0001Ql-Rw
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:13:22 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42435226-0173-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 15:13:22 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-69943ef42b2so35071576d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:13:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 j13-20020a0c9ccd000000b00696ae38c7bfsm1873408qvf.35.2024.04.23.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 06:13:20 -0700 (PDT)
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
X-Inumbo-ID: 42435226-0173-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713878000; x=1714482800; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lVrOUiErpOt1x6JV3axiTLKkLJOBS6S5d/ZUHk5bIc=;
        b=BnRAAg28kJD6rteH7YK1NqkGnUaajHjAYnaE4CtlzV9DSTqBKFyDDb4l5fgLJxZQrx
         +uS8SPafIvRHJfnHjUgK7R2Ak23RkD3k4IpXxInLLV/8M/30vD6nn5TozPMT22wXlCPk
         r+czaBPH+e6pbDOr/EetIuSzrrPHfJ2fpNPDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878000; x=1714482800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lVrOUiErpOt1x6JV3axiTLKkLJOBS6S5d/ZUHk5bIc=;
        b=d0ZRIUXKLcbHwsdxSlcUrI2RzqC20BwzlC9JKzhycnpErFo8Uu9gUI7C4ETLHHPUnB
         evCUgoT7/r68wMncgfRsdmoLz/OWhswoTmh5IbniKFpe6J00MpdjT9uGgF9TIFc/egVq
         kfkQ3gHCEDS5bx1ZiGoDwEHR1rzAXVbC6nF0lGm4XnbYsXr9V3eOWK4BzyBnala/yp9o
         BS8j+qdWcV8h0Hu5kjT87Sp+FDsl0LoGTQ1gGGv9ZKO59agEHREd84ThBXrRQpmscy75
         2cbuBbkdPCldkPWGe3FzhfbEFs8dy7pWxlZWz/NOIbnMgiBbMEi/waar7UihWm+OJ05+
         D9SA==
X-Gm-Message-State: AOJu0YxirbD6C1xCZttljN5Gesso1RnsWf64koCnC1HTgByrzs3Fldgj
	l0kiJV8jRsxitl+bSuZQ9sZsCPR3TpH/aXL/42x9GzNE2zJbK7+HMvqAZfY7wXUOgN/ijIiJ4zE
	k
X-Google-Smtp-Source: AGHT+IGbE3VkQVmviVP1Axw9WTZGVRmI92gcwDwQiFszisQYYKjsnxydqejs4/D22QWc6TiW++s36Q==
X-Received: by 2002:ad4:44a1:0:b0:6a0:49d5:c4fb with SMTP id n1-20020ad444a1000000b006a049d5c4fbmr13419031qvt.31.1713878000330;
        Tue, 23 Apr 2024 06:13:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 2/4] livepatch: introduce --force option
Date: Tue, 23 Apr 2024 15:12:47 +0200
Message-ID: <20240423131249.29825-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423131249.29825-1-roger.pau@citrix.com>
References: <20240423131249.29825-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a xen-livepatch tool --force option, that's propagated into the
hyerpvisor for livepatch operations.  The intention is for the option to be
used to bypass some checks that would otherwise prevent the patch from being
loaded.

Re purpose the pad field in xen_sysctl_livepatch_op to be a flags field that
applies to all livepatch operations.  The flag is currently only set by the
hypercall wrappers for the XEN_SYSCTL_LIVEPATCH_UPLOAD operation, as that's so
far the only one where it will be used initially.  Other uses can be added as
required.

Note that helpers would set the .pad field to 0, that's been removed since the
structure is already zero initialized at definition.

No functional usages of the new flag introduced in this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 tools/include/xenctrl.h     |  3 ++-
 tools/libs/ctrl/xc_misc.c   |  7 +++----
 tools/misc/xen-livepatch.c  | 21 +++++++++++++++++++--
 xen/common/livepatch.c      |  3 ++-
 xen/include/public/sysctl.h |  4 +++-
 5 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..499685594427 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2555,7 +2555,8 @@ int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
 #endif
 
 int xc_livepatch_upload(xc_interface *xch,
-                        char *name, unsigned char *payload, uint32_t size);
+                        char *name, unsigned char *payload, uint32_t size,
+                        bool force);
 
 int xc_livepatch_get(xc_interface *xch,
                      char *name,
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 5ecdfa2c7934..50282fd60dcc 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -576,7 +576,8 @@ int xc_getcpuinfo(xc_interface *xch, int max_cpus,
 int xc_livepatch_upload(xc_interface *xch,
                         char *name,
                         unsigned char *payload,
-                        uint32_t size)
+                        uint32_t size,
+                        bool force)
 {
     int rc;
     struct xen_sysctl sysctl = {};
@@ -612,7 +613,7 @@ int xc_livepatch_upload(xc_interface *xch,
 
     sysctl.cmd = XEN_SYSCTL_livepatch_op;
     sysctl.u.livepatch.cmd = XEN_SYSCTL_LIVEPATCH_UPLOAD;
-    sysctl.u.livepatch.pad = 0;
+    sysctl.u.livepatch.flags = force ? LIVEPATCH_FLAG_FORCE : 0;
     sysctl.u.livepatch.u.upload.size = size;
     set_xen_guest_handle(sysctl.u.livepatch.u.upload.payload, local);
 
@@ -656,7 +657,6 @@ int xc_livepatch_get(xc_interface *xch,
 
     sysctl.cmd = XEN_SYSCTL_livepatch_op;
     sysctl.u.livepatch.cmd = XEN_SYSCTL_LIVEPATCH_GET;
-    sysctl.u.livepatch.pad = 0;
 
     sysctl.u.livepatch.u.get.status.state = 0;
     sysctl.u.livepatch.u.get.status.rc = 0;
@@ -985,7 +985,6 @@ static int _xc_livepatch_action(xc_interface *xch,
 
     sysctl.cmd = XEN_SYSCTL_livepatch_op;
     sysctl.u.livepatch.cmd = XEN_SYSCTL_LIVEPATCH_ACTION;
-    sysctl.u.livepatch.pad = 0;
     sysctl.u.livepatch.u.action.cmd = action;
     sysctl.u.livepatch.u.action.timeout = timeout;
     sysctl.u.livepatch.u.action.flags = flags;
diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index a246e5dfd38e..cf2e5fada12d 100644
--- a/tools/misc/xen-livepatch.c
+++ b/tools/misc/xen-livepatch.c
@@ -19,11 +19,15 @@
 
 static xc_interface *xch;
 
+/* Global option to disable checks. */
+static bool force;
+
 void show_help(void)
 {
     fprintf(stderr,
             "xen-livepatch: live patching tool\n"
-            "Usage: xen-livepatch <command> [args] [command-flags]\n"
+            "Usage: xen-livepatch [--force] <command> [args] [command-flags]\n"
+            " Use --force option to bypass some checks.\n"
             " <name> An unique name of payload. Up to %d characters.\n"
             "Commands:\n"
             "  help                   display this help\n"
@@ -240,7 +244,7 @@ static int upload_func(int argc, char *argv[])
         return saved_errno;
     }
     printf("Uploading %s... ", filename);
-    rc = xc_livepatch_upload(xch, name, fbuf, len);
+    rc = xc_livepatch_upload(xch, name, fbuf, len, force);
     if ( rc )
     {
         rc = errno;
@@ -571,6 +575,19 @@ int main(int argc, char *argv[])
         show_help();
         return 0;
     }
+
+    if ( !strncmp("--force", argv[1], strlen("--force")) )
+    {
+        if ( argc <= 2 )
+        {
+            show_help();
+            return EXIT_FAILURE;
+        }
+        force = true;
+        argv++;
+        argc--;
+    }
+
     for ( i = 0; i < ARRAY_SIZE(main_options); i++ )
         if (!strncmp(main_options[i].name, argv[1],
                      strlen(main_options[i].name)))
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 351a3e0b9a60..1503a84457e4 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -2125,7 +2125,8 @@ int livepatch_op(struct xen_sysctl_livepatch_op *livepatch)
 {
     int rc;
 
-    if ( livepatch->pad )
+    if ( livepatch->flags & ~LIVEPATCH_FLAGS_MASK &&
+         !(livepatch->flags & LIVEPATCH_FLAG_FORCE) )
         return -EINVAL;
 
     switch ( livepatch->cmd )
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9b19679caeb1..febaa4b16ab7 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1139,7 +1139,9 @@ struct xen_sysctl_livepatch_action {
 
 struct xen_sysctl_livepatch_op {
     uint32_t cmd;                           /* IN: XEN_SYSCTL_LIVEPATCH_*. */
-    uint32_t pad;                           /* IN: Always zero. */
+    uint32_t flags;                         /* IN, flags. */
+#define LIVEPATCH_FLAG_FORCE      (1u << 0) /* Skip some checks. */
+#define LIVEPATCH_FLAGS_MASK      LIVEPATCH_FLAG_FORCE
     union {
         struct xen_sysctl_livepatch_upload upload;
         struct xen_sysctl_livepatch_list list;
-- 
2.44.0


