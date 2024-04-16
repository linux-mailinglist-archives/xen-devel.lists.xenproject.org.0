Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E4A8A66D8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706800.1104225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevE-0001sJ-68; Tue, 16 Apr 2024 09:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706800.1104225; Tue, 16 Apr 2024 09:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevD-0001lY-Uk; Tue, 16 Apr 2024 09:16:11 +0000
Received: by outflank-mailman (input) for mailman id 706800;
 Tue, 16 Apr 2024 09:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+g=LV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rwevC-0000mP-RT
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 09:16:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f61d111e-fbd1-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 11:16:09 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a51a7dc45easo461971566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 02:16:09 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090657c200b00a524476aac9sm4654723ejr.108.2024.04.16.02.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 02:16:07 -0700 (PDT)
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
X-Inumbo-ID: f61d111e-fbd1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713258968; x=1713863768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEqOdsYIwbuJuEjSHon4MvvMLQajO7Ykh4oIkPsh7vk=;
        b=EFcGpBQXmYHnfRATV1FQR91RHfwKH8mQB3gp7V4eOrU3x+SiLzbkTGzG7zBkSu0nCt
         bhCTB79DuUHkGkRh2JmPBrT7V/08J8Rr0B6dSn8PmLHZKoTsugDpEfP6Sm7OPCiF+ugg
         LaEj4lkQ6jljTPALMmb0NG443Zjn8DHUwdB7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713258968; x=1713863768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEqOdsYIwbuJuEjSHon4MvvMLQajO7Ykh4oIkPsh7vk=;
        b=uJQ1yHCsg+JrhsDrINwBmITEnwxHQBR1MRV4TrB0NKFPIDXq8ajEe0g9TsogTA8fnx
         sdjV707XpALj+LPXb0Yjn3QXb2/sokS1wLwRlz8scjiTs/NeB3JmnE3U+xTX/otr+X24
         klL+wwTHkCveYme25fM2/ol5+MNCIysTLDg5oQIgQuBM8yEzJkh2mtC6qviIHrILa4VL
         6ZRRsNowMLtEyyiyTlmGhAuE3fKiIvREvYGuxoMiMgEYymDDdQk9k30TrlaOqHTe7ujZ
         NvNf+JChUp6aWSePetqAE7hAriOzmDIGpMDxIblLooq3yba8Pgod/D/ufzKyQ6rISEAk
         LJhg==
X-Gm-Message-State: AOJu0YzGOlnA0ZtR1Sxde0vRRGyW0ubzo/eumZtUd9UXwZ5GpP5hRxQk
	+bWZHHa2KTwGMn6yEcwDk9+Qb6dpOLNY6/1M4iLEkENRz96QaQAtRx2ddwZVW07wEX/vaKwkHZi
	H
X-Google-Smtp-Source: AGHT+IFWpEzwKPPdl1mw7tvXvVp9ZxgCj5ozb/nm/DQDDqkJUfTfQKWsf4eXQoXnBllzoU9TwfBbVQ==
X-Received: by 2002:a17:907:6d18:b0:a51:e2a9:97c with SMTP id sa24-20020a1709076d1800b00a51e2a9097cmr12237822ejc.6.1713258968006;
        Tue, 16 Apr 2024 02:16:08 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 5/5] x86: Add --force option to xen-ucode to override microcode version check
Date: Tue, 16 Apr 2024 10:15:46 +0100
Message-ID: <20240416091546.11622-6-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240416091546.11622-1-fouad.hilly@cloud.com>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce --force option to xen-ucode to force skipping microcode version
check, which allows the user to update x86 microcode even if both versions
are the same.

[v2]
1- Changed data type from uint32_t to unsigned int.
2- Corrected line length.
3- Removed XENPF_UCODE_FLAG_FORCE_NOT_SET.
4- Corrected indentations.
5- Changed command line options to have the file name as first argument when applicable.
6- --force option doesn't require an argument anymore.
7- Used optint to access filename in argv.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/include/xenctrl.h   |  3 ++-
 tools/libs/ctrl/xc_misc.c | 13 +++++++++++--
 tools/misc/xen-ucode.c    | 18 +++++++++++++-----
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e05422..49d2f19c0d77 100644
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
index 5ecdfa2c7934..fbc17cefa82e 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -203,7 +203,8 @@ int xc_physinfo(xc_interface *xch,
     return 0;
 }
 
-int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
+int xc_microcode_update(xc_interface *xch, const void *buf,
+                        size_t len, unsigned int flags)
 {
     int ret;
     struct xen_platform_op platform_op = {};
@@ -215,7 +216,15 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
 
     memcpy(uc, buf, len);
 
-    platform_op.cmd = XENPF_microcode_update;
+    if ( flags > 0 )
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
index e3c1943e3633..4178fd2221ea 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -13,6 +13,8 @@
 #include <xenctrl.h>
 #include <getopt.h>
 
+#include <xen/platform.h>
+
 static xc_interface *xch;
 
 static const char intel_id[] = "GenuineIntel";
@@ -24,7 +26,8 @@ static void usage(const char *name)
            "Usage: %s [microcode file] [options]\n"
            "Options:\n"
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
 
@@ -104,10 +109,10 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    if ( argc != 2 )
+    if ( argc < 2 || argc > 3)
         goto ext_err;
 
-    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
+    while ( (opt = getopt_long(argc, argv, "hsf", options, NULL)) != -1 )
     {
         switch (opt)
         {
@@ -117,12 +122,15 @@ int main(int argc, char *argv[])
         case 's':
             show_curr_cpu(stdout);
             exit(EXIT_SUCCESS);
+        case 'f':
+            ucode_flag = XENPF_UCODE_FLAG_FORCE_SET;
+            break;
         default:
             goto ext_err;
         }
     }
 
-    filename = argv[1];
+    filename = argv[optind];
     fd = open(filename, O_RDONLY);
     if ( fd < 0 )
     {
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


