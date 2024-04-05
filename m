Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF5A899C7E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701230.1095544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiQ1-0008Vj-Nb; Fri, 05 Apr 2024 12:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701230.1095544; Fri, 05 Apr 2024 12:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiQ1-0008Ss-Jv; Fri, 05 Apr 2024 12:11:41 +0000
Received: by outflank-mailman (input) for mailman id 701230;
 Fri, 05 Apr 2024 12:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im47=LK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rsiQ0-0007Qe-8Z
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:11:40 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7a73133-f345-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:11:38 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e030624d1so3456671a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:11:38 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j13-20020a50ed0d000000b0056c4372c161sm729425eds.55.2024.04.05.05.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:11:36 -0700 (PDT)
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
X-Inumbo-ID: a7a73133-f345-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712319097; x=1712923897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdhAQWAGgzqfyVOlZZiidtJ6Xeb+heOhOyk9/vxfLS0=;
        b=BCR/4nvzPXGSe2aZExlNnkyeFDGpL3gSy+eSFB4tKyeiUG1QoJDmFjygGFMXm1A08W
         sIAdkIIKkKgT/n+lKOi8/LudOsCj0XPiGd0SV72BTIYPUoWKbDATqC0nFw8efe34YEAy
         oHb5C7bwtkR5vA++Fs/RGCQ7btOJijllTdhmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319097; x=1712923897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdhAQWAGgzqfyVOlZZiidtJ6Xeb+heOhOyk9/vxfLS0=;
        b=Vc+xoXsNqHcjj3dRjj9O5ebRpMwSMdTwe0rRQqmHQR1jQdCZgUPI1//83eZiKAP2Uk
         T/iVTdeczswADvE2iSNIgDqMUhH0StBpgMyXBd0a0/OEIut1iYc+9+5PtugC2Z9VP/Uf
         JPSQa7TVy+ethF+zq8UhOOihpx28nAY+6CfE1ZlJBESs/xGIzo7wqTkkeTcb2b14OEMQ
         c+TG47cpSuz7xM29BD50ys8ImkOK6hau8YjM1PgIs2hW27f9XUmsWPNP3p6k1LZM1GOK
         rjVppLdkNTKBnGmjpdYEkSqkHOCI9+9wL4K1UHltDQ1aapeoBS6TSfwVcPtkPqJdpn10
         EVXQ==
X-Gm-Message-State: AOJu0YyIYUqrhcE79u7lPtJwFPQEboSZSZW8PCVSPrOk2d6B9mSRtgY4
	wvDXVEikD8m76I3Ra+fap88JEckq/05/3ipNmnQj9HogELFrqXZ5KbKpbu6qtRhAZ0xpc6pkr3s
	Q
X-Google-Smtp-Source: AGHT+IFc7P4utWajGbqgWpMUxPqCIQeerVOzNOKJFOn8AwBmV1kYyymGlsBRFkuK4n0vtNRUKCAkug==
X-Received: by 2002:a50:d49a:0:b0:568:9b13:77fe with SMTP id s26-20020a50d49a000000b005689b1377femr938158edi.37.1712319097311;
        Fri, 05 Apr 2024 05:11:37 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 5/5] x86: Add --force option to xen-ucode to override microcode version check
Date: Fri,  5 Apr 2024 13:11:28 +0100
Message-ID: <20240405121128.260493-6-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240405121128.260493-1-fouad.hilly@cloud.com>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce --force option to xen-ucode to force skipping microcode version
check, which allows the user to update x86 microcode even if both versions
are the same.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/include/xenctrl.h   |  2 +-
 tools/libs/ctrl/xc_misc.c | 12 ++++++++++--
 tools/misc/xen-ucode.c    | 20 +++++++++++++++-----
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..5dbe3e63374a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1171,7 +1171,7 @@ typedef uint32_t xc_node_to_node_dist_t;
 int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
-int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
+int xc_microcode_update(xc_interface *xch, const void *buf, size_t len, uint32_t flags);
 int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
 int xc_get_ucode_revision(xc_interface *xch,
                           struct xenpf_ucode_revision *ucode_rev);
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 5ecdfa2c7934..edce45bc2a17 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -203,7 +203,7 @@ int xc_physinfo(xc_interface *xch,
     return 0;
 }
 
-int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
+int xc_microcode_update(xc_interface *xch, const void *buf, size_t len, uint32_t flags)
 {
     int ret;
     struct xen_platform_op platform_op = {};
@@ -215,7 +215,15 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
 
     memcpy(uc, buf, len);
 
-    platform_op.cmd = XENPF_microcode_update;
+    if ( flags > XENPF_UCODE_FLAG_FORCE_NOT_SET )
+    {
+        platform_op.cmd = XENPF_microcode_update2;
+        platform_op.u.microcode.flags = flags;
+    }
+    else
+    {
+        platform_op.cmd = XENPF_microcode_update;
+    }
     platform_op.u.microcode.length = len;
     set_xen_guest_handle(platform_op.u.microcode.data, uc);
 
diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 9bde991c5df5..469ce3299381 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -13,6 +13,8 @@
 #include <xenctrl.h>
 #include <getopt.h>
 
+#include <xen/platform.h>
+
 static xc_interface *xch;
 
 static const char intel_id[] = "GenuineIntel";
@@ -21,10 +23,11 @@ static const char   amd_id[] = "AuthenticAMD";
 static void usage(const char *name)
 {
     printf("%s: Xen microcode updating tool\n"
-            "Usage: %s [<microcode file> | --show-cpu-info]\n"
+            "Usage: %s [[--force] <microcode file> | --show-cpu-info]\n"
             "\n"
             "  -h, --help            display this help and exit\n"
             "  -s, --show-cpu-info   show CPU information and exit\n"
+            "  -f, --force           force to skip micorocde version check\n"
             "\n"
             , name, name);
 }
@@ -89,11 +92,13 @@ int main(int argc, char *argv[])
     char *filename = NULL, *buf;
     size_t len;
     struct stat st;
+    uint32_t ucode_flag = XENPF_UCODE_FLAG_FORCE_NOT_SET;
     int opt;
 
     const static struct option options[] = {
         {"help", no_argument, NULL, 'h'},
         {"show-cpu-info", no_argument, NULL, 's'},
+        {"force", required_argument, NULL, 'f'},
         {NULL, no_argument, NULL, 0}
     };
 
@@ -105,10 +110,10 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    if ( argc != 2 )
+    if ( argc < 2 || argc > 3)
         goto ext_err;
 
-    while ( (opt = getopt_long(argc, argv, "hs:", options, NULL)) != -1 )
+    while ( (opt = getopt_long(argc, argv, "hsf:", options, NULL)) != -1 )
     {
         switch (opt)
         {
@@ -120,12 +125,17 @@ int main(int argc, char *argv[])
                     goto ext_err;
                 show_curr_cpu(stdout);
                 exit(EXIT_SUCCESS);
+            case 'f':
+            ucode_flag = XENPF_UCODE_FLAG_FORCE_SET;
+                filename = optarg;
+                break;
             default:
                 goto ext_err;
         }
     }
 
-    filename = argv[1];
+    if ( argc == 2 )
+        filename = argv[1];
     if ( filename == NULL )
     {
         printf("File name error\n");
@@ -155,7 +165,7 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    ret = xc_microcode_update(xch, buf, len);
+    ret = xc_microcode_update(xch, buf, len, ucode_flag);
     if ( ret )
     {
         fprintf(stderr, "Failed to update microcode. (err: %s)\n",
-- 
2.42.0


