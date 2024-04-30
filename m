Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCA8B7615
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714811.1116180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtS-0006Qk-AV; Tue, 30 Apr 2024 12:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714811.1116180; Tue, 30 Apr 2024 12:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtS-0006Mv-4u; Tue, 30 Apr 2024 12:47:34 +0000
Received: by outflank-mailman (input) for mailman id 714811;
 Tue, 30 Apr 2024 12:47:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGtk=MD=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s1mtP-0005Ay-PC
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:47:31 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce6a27ca-06ef-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 14:47:30 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a58fbbcd77aso288956466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:47:30 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b00a558014ab2csm14165324ejk.145.2024.04.30.05.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:47:29 -0700 (PDT)
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
X-Inumbo-ID: ce6a27ca-06ef-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714481249; x=1715086049; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMnmkNjA1BInUsP0IVDeKNq5vnJN5ZIs/BtVpY7OG3w=;
        b=jFK1RWmnT/FqkJSImpJEaqk9iZdHGtwfxqVT0nJhizHmJVhTkT9+/My/84Vud0Bv3y
         fhq4h59UGjWuE48/l74N7q/1R/0nhZx3BRRIqq8pYw4aJEFqzIz2KEjIWLFmogAPrFmg
         tRxgtnT60fL+CjBd/61tawyRtPTOJg5G+my7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481249; x=1715086049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMnmkNjA1BInUsP0IVDeKNq5vnJN5ZIs/BtVpY7OG3w=;
        b=SJe8PSxvRnnEuhZ2qnW4LPnRBgapMrGA78VrL3dAT3KDlKBSVMtDJJapjr/9K2wJIe
         ua2ASjtCdSM2INp+gfjfu80LrVv5ZV9pc71LS0lvaUYy92Nw1ulo0mp4vR5rNCMoty/N
         xE+ciiLilGjcVorA9jDVKzmZcGVmOkyxa1qJXhEICO+QVaHYFoJoGS11TbYBljdk16CN
         RQc071An9n4f0aO0polpkKxF+tAM+LSjBh9vXX9DYU8rrUqyxrZ4bS2YWQxLLalsgjGV
         /QzekEYvyTH9bJlo9IT2b2TNKZmljLRQhT9KaL+nj2VL6u+YAQ1hmjYW6As0IcZ4vdBp
         w8eA==
X-Gm-Message-State: AOJu0YyftWj2FAMPTZmIXhneo/gUT8GWFqRoUcEKHmuL+fblCgQREWDr
	ZcEs/gO8XQM5/lGPUC48MUu2fWrgqwAU1gCAr3Y6LQ2Lq/UZbM7pKJpeIQN1bVKncc8+dxADw/f
	K
X-Google-Smtp-Source: AGHT+IHuGgBj+b4p0staZvEOfZNUXXfaKd46jbkmS+YqCxuThRZx9jRiLWsVPANiQ/3NFRIdUbauyQ==
X-Received: by 2002:a17:906:80da:b0:a55:b021:c0b1 with SMTP id a26-20020a17090680da00b00a55b021c0b1mr6742377ejx.9.1714481249645;
        Tue, 30 Apr 2024 05:47:29 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 5/5] Add --force option to xen-ucode to override microcode version check
Date: Tue, 30 Apr 2024 13:47:09 +0100
Message-ID: <20240430124709.865183-6-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430124709.865183-1-fouad.hilly@cloud.com>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce --force option to xen-ucode to force skipping microcode version
check, which allows the user to update x86 microcode even if both versions
are the same.
xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
[v3]
1- Message description updated.
2- xc_microcode_update() uses xenpf_microcode_update2 to pass flags.

[v2]
1- Changed data type from uint32_t to unsigned int.
2- Corrected line length.
3- Removed XENPF_UCODE_FLAG_FORCE_NOT_SET.
4- Corrected indentations.
5- Changed command line options to have the file name as first argument when applicable.
6- --force option doesn't require an argument anymore.
7- Used optint to access filename in argv.
 tools/include/xenctrl.h   |  3 ++-
 tools/libs/ctrl/xc_misc.c | 12 +++++++-----
 tools/misc/xen-ucode.c    | 16 ++++++++++++----
 3 files changed, 21 insertions(+), 10 deletions(-)

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
index d95f967f021b..b3c9a2bfe5c8 100644
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
-           "Usage: %s [<microcode file> | Options]\n"
+           "Usage: %s [microcode file] [options]\n"
            "options:\n"
            "  -h, --help            display this help and exit\n"
-           "  -s, --show-cpu-info   show CPU information and exit\n",
+           "  -s, --show-cpu-info   show CPU information and exit\n"
+           "  -f, --force           force to skip micorocde version check\n",
            name, name);
 }
 
@@ -89,10 +92,12 @@ int main(int argc, char *argv[])
     size_t len;
     struct stat st;
     int opt;
+    uint32_t ucode_flag = 0;
 
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
+            ucode_flag = XENPF_UCODE_FLAG_FORCE_SET;
+            break;
         default:
             goto ext_err;
         }
@@ -146,7 +154,7 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    ret = xc_microcode_update(xch, buf, len);
+    ret = xc_microcode_update(xch, buf, len, ucode_flag);
     if ( ret )
     {
         fprintf(stderr, "Failed to update microcode. (err: %s)\n",
-- 
2.42.0


