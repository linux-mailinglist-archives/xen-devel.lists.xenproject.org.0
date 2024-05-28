Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8408D2065
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731197.1136593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymD-0001yY-VK; Tue, 28 May 2024 15:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731197.1136593; Tue, 28 May 2024 15:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymD-0001s8-Rq; Tue, 28 May 2024 15:30:13 +0000
Received: by outflank-mailman (input) for mailman id 731197;
 Tue, 28 May 2024 15:30:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5inG=M7=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sBymC-00018E-AS
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:30:12 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b9df50d-1d07-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 17:30:10 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-354faf5f1b4so779629f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:30:10 -0700 (PDT)
Received: from fhilly.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c937444sm621673366b.61.2024.05.28.08.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 08:30:09 -0700 (PDT)
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
X-Inumbo-ID: 2b9df50d-1d07-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716910210; x=1717515010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29kKGaSNhLed8Jk9dwMB1HDWbyK77p3VZnpuSymtJak=;
        b=ishgnpllRC/svCCzlkPPL7nnUgrCjrP1JeLR6CvohTRc/AnaYHsPUJ1/JnXjxJMvtb
         48stk6/tUkjyr8RwLuO3mXGIbNhkcRXf+IhENdzwrukS/Og/m6C7Ev9UmUpqaGIibYiI
         dV5aOYRRt9cb4OKd3rxdHRBwLVKDWTOrZ7BmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910210; x=1717515010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29kKGaSNhLed8Jk9dwMB1HDWbyK77p3VZnpuSymtJak=;
        b=PLzoKtte6ONCmDChBq39npOQAra0eIcUuzyiHKer9A3l4MlVdZHUB/ZlAF1z1osgZF
         5oOXO34DBkc5edfxHanu+k7ZNR+2ZldOUN71ASj4l9NuEDB2Rc9zis9nfw+EWzWiVq+N
         AMcHA0yRVN9Mgstp9zxsZATwco90kIFXz8MyirNo1MwxZWLro0EvWSzoRujLAixCT55o
         KhEnW+AC3ntiNzLUyotmdNJ/HVpQ69uVVVzPVSJMcksgMIdGf4OpEQRSelexml+vKNGV
         2hxwnStGu6XJo4EkiMrOzFB6Tk4zYodcaUvO6YnfKaZ6mEETRzWoBEuR4TwJcpCdyzSP
         xkNg==
X-Gm-Message-State: AOJu0YybK6Jr4tSM22vIzh7pgksLsY9daxQUluflw7X0OOFmEBnDadXZ
	xBuB1VHvZyeYDs8qWsVr2CDA7Yyw6A73rUPNi3turjzBDQPF45n5vy8Qzy75poBYxW17wk8iG8C
	oY48=
X-Google-Smtp-Source: AGHT+IHJ5pIptnLo5qJAv1DVP0wUcqG2/5riYCtRVCTsvS+oNS+wekQ6nvMZBPq3NglWopzcliQulQ==
X-Received: by 2002:adf:e681:0:b0:34c:b80a:233c with SMTP id ffacd0b85a97d-3552f4fd1b5mr10569229f8f.15.1716910209647;
        Tue, 28 May 2024 08:30:09 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 3/4] x86/ucode: Introduce --force option to xen-ucode to force skipping microcode version check
Date: Tue, 28 May 2024 16:29:42 +0100
Message-ID: <20240528152943.3915760-4-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240528152943.3915760-1-fouad.hilly@cloud.com>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce --force option to xen-ucode to force skipping microcode version check, which
allows the user to update x86 microcode even if both versions are the same or downgrade.
xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[4]
1- Add --force to xen-ucode options.
2- Update xc_microcode_update() to accept and handle flags.
---
 tools/include/xenctrl.h   |  3 ++-
 tools/libs/ctrl/xc_misc.c | 12 +++++++-----
 tools/misc/xen-ucode.c    | 14 +++++++++++---
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 499685594427..7fb409bc6dc4 100644
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
index 6f9dd2a7e431..b878edf2399a 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -13,6 +13,8 @@
 #include <xenctrl.h>
 #include <getopt.h>
 
+#include <xen/platform.h>
+
 static xc_interface *xch;
 
 static const char intel_id[] = "GenuineIntel";
@@ -24,7 +26,8 @@ static void usage(FILE *stream, const char *name)
            "Usage: %s [microcode file] [options]\n"
            "options:\n"
            "  -h, --help            display this help and exit\n"
-           "  -s, --show-cpu-info   show CPU information and exit\n",
+           "  -s, --show-cpu-info   show CPU information and exit\n"
+           "  -f, --force           force to skip microcode version check\n",
            name, name);
 }
 
@@ -89,10 +92,12 @@ int main(int argc, char *argv[])
     size_t len;
     struct stat st;
     int opt;
+    uint32_t ucode_flags = 0;
 
     static const struct option options[] = {
         {"help", no_argument, NULL, 'h'},
         {"show-cpu-info", no_argument, NULL, 's'},
+        {"force", no_argument, NULL, 'f'},
         {NULL, no_argument, NULL, 0}
     };
 
@@ -104,7 +109,7 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
+    while ( (opt = getopt_long(argc, argv, "hsf", options, NULL)) != -1 )
     {
         switch (opt)
         {
@@ -114,6 +119,9 @@ int main(int argc, char *argv[])
         case 's':
             show_curr_cpu(stdout);
             exit(EXIT_SUCCESS);
+        case 'f':
+            ucode_flags = XENPF_UCODE_FORCE;
+            break;
         default:
             goto ext_err;
         }
@@ -147,7 +155,7 @@ int main(int argc, char *argv[])
     }
 
     errno = 0;
-    ret = xc_microcode_update(xch, buf, len);
+    ret = xc_microcode_update(xch, buf, len, ucode_flags);
     if ( ret == -1 && errno == EEXIST )
         printf("Microcode already up to date\n");
     else if ( ret )
-- 
2.42.0


