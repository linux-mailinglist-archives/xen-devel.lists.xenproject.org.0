Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFCE95B5EA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 15:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781830.1191354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7VP-0004O3-V3; Thu, 22 Aug 2024 13:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781830.1191354; Thu, 22 Aug 2024 13:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh7VP-0004Ip-QX; Thu, 22 Aug 2024 13:05:35 +0000
Received: by outflank-mailman (input) for mailman id 781830;
 Thu, 22 Aug 2024 13:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m19V=PV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sh7VN-0004GT-RD
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 13:05:33 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35d1aa7a-6087-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 15:05:31 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bed0a2b1e1so753792a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 06:05:31 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c4384sm897139a12.62.2024.08.22.06.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:05:28 -0700 (PDT)
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
X-Inumbo-ID: 35d1aa7a-6087-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724331930; x=1724936730; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10am4fjTuo1E+hBiTlG8YBLEvflbG5lb423qbVTK18k=;
        b=Ya/RJcgB1KtOB+74ohQyfitvTW7ktMPRFLLg56HPgq0G3bK2LOcKCnNA1Neam/6gca
         /2m0WL9DwrGYMFAZvbJArWlzUSFiHKsIaZXQpvdva4A85FwP4DsyLUzG7RNzIQ34BlL0
         IxZ8/ugg3ZMn0vNspdao0mj6NxCJ5hSmXEpsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331930; x=1724936730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10am4fjTuo1E+hBiTlG8YBLEvflbG5lb423qbVTK18k=;
        b=kv9vHYOlJ3SYa0tL0zRC9RdM/QXgjxauzaGbXUQk6F+bsTSziX3gOcuTyLB0+aPaom
         AxuujaLM2cmI0YMiJ/U3rw4N3d1QXo+48iwLAUt2OTxwXztqg6tqYAnX/UeERV41hFsd
         XIBH00FnAXR52gQyXFNICePwMw2/twQNvl5zbrwUBDS0R5Jw35LxC0W5kwXZOeuoUTAh
         752NZhTnVsJwAVAq4bBVeATclASOzJV7HHlH6BT8iiBVAuPJuxhowfmN+8yAvF89NhyW
         q5azHcstIfKghWK+JQRbnSOxXcI7xm0TR6zl5omtMpIbyxGrOpG8Ve5rdkJnJpUbaGK/
         uXnA==
X-Gm-Message-State: AOJu0YxVYSA6n+T0sIpm+7vS01gDQ4Q9cdoam65APisbNElM9aHagSY8
	fVGPqzKeCl3eLlXGnAhV1jDSdxVNpfP8/q18iuJmz5N1TN0u8dxynZHyMO9LiXlwjismhqwoe45
	T
X-Google-Smtp-Source: AGHT+IGyvi9sVdK0NyhmKt1pg4Jn0qPhsG2sBOWf1eO/gmqESSqR5LGijXmdI/nw+xLTJbz3BFcfig==
X-Received: by 2002:a05:6402:5386:b0:5a3:619:949f with SMTP id 4fb4d7f45d1cf-5c0792b5be5mr1851268a12.32.1724331929216;
        Thu, 22 Aug 2024 06:05:29 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v7 2/3] x86/ucode: Introduce --force option to xen-ucode
Date: Thu, 22 Aug 2024 14:04:25 +0100
Message-ID: <20240822130426.492931-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240822130426.492931-1-fouad.hilly@cloud.com>
References: <20240822130426.492931-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce --force option to xen-ucode to force skipping microcode version check, which
allows the user to update x86 microcode even if both versions are the same or downgrade.
xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
[v7]
1- Fix usage() printout message.
[v6]
1- Fix usage() output for -f option to be explicitly wrapped for 80 character width
[v5]
1- Update commit message.
2- Re-phrase --force option description.
[v4]
1- Add --force to xen-ucode options.
2- Update xc_microcode_update() to accept and handle flags.
---
 tools/include/xenctrl.h   |  3 ++-
 tools/libs/ctrl/xc_misc.c | 12 +++++++-----
 tools/misc/xen-ucode.c    | 16 +++++++++++++---
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9ceca0cffc2f..2c4608c09ab0 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1171,7 +1171,8 @@ typedef uint32_t xc_node_to_node_dist_t;
 int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
-int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
+int xc_microcode_update(xc_interface *xch, const void *buf,
+                        size_t len, unsigned int flags);
 int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
 int xc_get_ucode_revision(xc_interface *xch,
                           struct xenpf_ucode_revision *ucode_rev);
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 50282fd60dcc..6a60216bda03 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -203,11 +203,12 @@ int xc_physinfo(xc_interface *xch,
     return 0;
 }
 
-int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
+int xc_microcode_update(xc_interface *xch, const void *buf,
+                        size_t len, unsigned int flags)
 {
     int ret;
     struct xen_platform_op platform_op = {};
-    DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update, uc);
+    DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update2, uc);
 
     uc = xc_hypercall_buffer_alloc(xch, uc, len);
     if ( uc == NULL )
@@ -215,9 +216,10 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
 
     memcpy(uc, buf, len);
 
-    platform_op.cmd = XENPF_microcode_update;
-    platform_op.u.microcode.length = len;
-    set_xen_guest_handle(platform_op.u.microcode.data, uc);
+    platform_op.cmd = XENPF_microcode_update2;
+    platform_op.u.microcode2.length = len;
+    platform_op.u.microcode2.flags = flags;
+    set_xen_guest_handle(platform_op.u.microcode2.data, uc);
 
     ret = do_platform_op(xch, &platform_op);
 
diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index bfc1e74dd5cc..2d2b520c0082 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -13,6 +13,8 @@
 #include <xenctrl.h>
 #include <getopt.h>
 
+#include <xen/platform.h>
+
 static xc_interface *xch;
 
 static const char intel_id[] = "GenuineIntel";
@@ -79,7 +81,10 @@ static void usage(FILE *stream, const char *name)
             "Usage: %s [options | microcode-file]\n"
             "options:\n"
             "  -h, --help               display this help\n"
-            "  -s, --show-cpu-info      show CPU information\n",
+            "  -s, --show-cpu-info      show CPU information\n"
+            "  -f, --force              skip certain checks when applying\n"
+            "                           microcode; do not use unless you know\n"
+            "                           exactly what you are doing\n",
             name, name);
     show_curr_cpu(stream);
 }
@@ -89,6 +94,7 @@ int main(int argc, char *argv[])
     static const struct option options[] = {
         {"help", no_argument, NULL, 'h'},
         {"show-cpu-info", no_argument, NULL, 's'},
+        {"force", no_argument, NULL, 'f'},
         {NULL, no_argument, NULL, 0}
     };
     int fd, ret;
@@ -96,6 +102,7 @@ int main(int argc, char *argv[])
     size_t len;
     struct stat st;
     int opt;
+    uint32_t ucode_flags = 0;
 
     xch = xc_interface_open(NULL, NULL, 0);
     if ( xch == NULL )
@@ -105,7 +112,7 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
+    while ( (opt = getopt_long(argc, argv, "hsf", options, NULL)) != -1 )
     {
         switch ( opt )
         {
@@ -117,6 +124,9 @@ int main(int argc, char *argv[])
             show_curr_cpu(stdout);
             exit(EXIT_SUCCESS);
 
+        case 'f':
+            ucode_flags = XENPF_UCODE_FORCE;
+            break;
         default:
             fprintf(stderr, "%s: unknown option\n", argv[0]);
             goto ext_err;
@@ -160,7 +170,7 @@ int main(int argc, char *argv[])
     }
 
     errno = 0;
-    ret = xc_microcode_update(xch, buf, len);
+    ret = xc_microcode_update(xch, buf, len, ucode_flags);
     if ( ret == -1 && errno == EEXIST )
         printf("Microcode already up to date\n");
     else if ( ret )
-- 
2.42.0


