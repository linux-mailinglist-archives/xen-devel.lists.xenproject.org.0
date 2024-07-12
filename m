Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261892FAE0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 15:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758027.1167259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0T-0005rY-34; Fri, 12 Jul 2024 13:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758027.1167259; Fri, 12 Jul 2024 13:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSG0S-0005mD-Ud; Fri, 12 Jul 2024 13:08:12 +0000
Received: by outflank-mailman (input) for mailman id 758027;
 Fri, 12 Jul 2024 13:08:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/nkX=OM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sSG0R-0005Dy-BU
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 13:08:11 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c91a45ad-404f-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 15:08:09 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-59a47d5c22aso453822a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 06:08:09 -0700 (PDT)
Received: from fhilly.. ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a87204esm343023466b.222.2024.07.12.06.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 06:08:08 -0700 (PDT)
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
X-Inumbo-ID: c91a45ad-404f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720789688; x=1721394488; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqoFysOPJW7YOcR+zHukiDmJkfpnoSrHwiTuqUDKgjg=;
        b=GQPIkuuB3KsahwLKvDLfq2k52enIkRK72/qt0wtToSLSclVdUTLVvoPg50CEg6T9a4
         xaO909eBK78qlsqS4yjX7wFC/FojXytevISsbzPAjDVIFkOHGc8Tmt5R49GukFoztXQc
         29FwButSma26VSKcIft6lcJN2D5YSEQJEpiZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789688; x=1721394488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqoFysOPJW7YOcR+zHukiDmJkfpnoSrHwiTuqUDKgjg=;
        b=FlOJjsumgtRIuAJ7ANkC/dWU1nKtcV+7Iz/Jd7mGcgLYIk4nP478CxCxvqyPMwo4+9
         rTORICSK/RmqZ2lj7pFd0jfJyy0TGoRbEPewgHVgIZYJU+4Ajc+/yyVHZd1Xh/VYY7Rb
         nkE1frYYHtpTLsB1uYx7Y5P/bb0/W8J1eT9NuFF33464+SRM3LUrk8JT/rKe3qrr+lA3
         8ZU9X4WrT7bfGU45L0wHWWu9RzhR/xfVxTbkxtQ2ufvjTr9U+ubfemyzWNGJCX4dzao6
         zk3FpeUEIbVr6GV113DblfZlmqQd3miO8Rrtg4B/9mbKjHt6JDy6Skbnb3U5693DqDA1
         WtyQ==
X-Gm-Message-State: AOJu0YwS+HLQ4+Imc5MlxpTAOXYIXPDaD3Yim3qtiEPabxyKit6L4KO6
	jIe09C2B9X7BjZKqmqrbvNtXBDUdPqMSUJS2O2mWYEKLEhkNJA8y9cFp6FXPihnUDD1A/bo1zZe
	1
X-Google-Smtp-Source: AGHT+IFx6EKhvldcxltz8Bf/zA2EMBfrB1gPUnalA9jLVj+vwXAgBj4MP4VYm+7dkHZrfxPaNuMtag==
X-Received: by 2002:a17:906:f0cc:b0:a6f:e819:da9c with SMTP id a640c23a62f3a-a780b70539bmr738906466b.43.1720789688335;
        Fri, 12 Jul 2024 06:08:08 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 3/4] x86/ucode: Introduce --force option to xen-ucode
Date: Fri, 12 Jul 2024 14:07:48 +0100
Message-ID: <20240712130749.1272741-4-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240712130749.1272741-1-fouad.hilly@cloud.com>
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce --force option to xen-ucode to force skipping microcode version check, which
allows the user to update x86 microcode even if both versions are the same or downgrade.
xc_microcode_update() refactored to accept flags and utilize xenpf_microcode_update2.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
[v5]
1- Update commit message.
2- Re-phrase --force option description.
[v4]
1- Add --force to xen-ucode options.
2- Update xc_microcode_update() to accept and handle flags.
---
 tools/include/xenctrl.h   |  3 ++-
 tools/libs/ctrl/xc_misc.c | 12 +++++++-----
 tools/misc/xen-ucode.c    | 13 +++++++++++--
 3 files changed, 20 insertions(+), 8 deletions(-)

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
index 8de82e5b8a10..a0eb3f205341 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -13,6 +13,8 @@
 #include <xenctrl.h>
 #include <getopt.h>
 
+#include <xen/platform.h>
+
 static xc_interface *xch;
 
 static const char intel_id[] = "GenuineIntel";
@@ -79,6 +81,8 @@ static void usage(FILE *stream, const char *name)
             "options:\n"
             "  -h, --help            display this help\n"
             "  -s, --show-cpu-info   show CPU information\n"
+            "  -f, --force           skip certain checks; do not use unless you"
+            "know exactly what you are doing\n"
             "Usage: %s [microcode file] [options]\n", name, name);
     show_curr_cpu(stream);
 }
@@ -88,6 +92,7 @@ int main(int argc, char *argv[])
     static const struct option options[] = {
         {"help", no_argument, NULL, 'h'},
         {"show-cpu-info", no_argument, NULL, 's'},
+        {"force", no_argument, NULL, 'f'},
         {NULL, no_argument, NULL, 0}
     };
     int fd, ret;
@@ -95,6 +100,7 @@ int main(int argc, char *argv[])
     size_t len;
     struct stat st;
     int opt;
+    uint32_t ucode_flags = 0;
 
     xch = xc_interface_open(NULL, NULL, 0);
     if ( xch == NULL )
@@ -104,7 +110,7 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
+    while ( (opt = getopt_long(argc, argv, "hsf", options, NULL)) != -1 )
     {
         switch (opt)
         {
@@ -116,6 +122,9 @@ int main(int argc, char *argv[])
             show_curr_cpu(stdout);
             exit(EXIT_SUCCESS);
 
+        case 'f':
+            ucode_flags = XENPF_UCODE_FORCE;
+            break;
         default:
             goto ext_err;
         }
@@ -156,7 +165,7 @@ int main(int argc, char *argv[])
     }
 
     errno = 0;
-    ret = xc_microcode_update(xch, buf, len);
+    ret = xc_microcode_update(xch, buf, len, ucode_flags);
     if ( ret == -1 && errno == EEXIST )
         printf("Microcode already up to date\n");
     else if ( ret )
-- 
2.42.0


