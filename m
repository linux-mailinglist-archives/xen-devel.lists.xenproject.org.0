Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25245AD5D24
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011974.1390544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAE-0004Fc-Dj; Wed, 11 Jun 2025 17:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011974.1390544; Wed, 11 Jun 2025 17:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAE-0004AE-8q; Wed, 11 Jun 2025 17:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1011974;
 Wed, 11 Jun 2025 17:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPAD-0002dK-Cf
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:23:01 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b986bea8-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:23:00 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so110481f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:23:00 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a532464f20sm15936533f8f.98.2025.06.11.10.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:59 -0700 (PDT)
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
X-Inumbo-ID: b986bea8-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662580; x=1750267380; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMkLljSK+j8EobhNDyMcdRH/ZodKoaJMWOo2vFrOTRM=;
        b=oZnV1tEqvqKmVyqlm4To2KRWRRy3SPWSTLk9IZVimu38g53McYSeS+Z7pzGW06Y1dL
         dd5kFFuI3AtyDUYunlR0kvRRpcJrV2SrWmI3Rqr0sgK5DqAUuUZx+CWNbhycdCE9kpx7
         mBVtEsSVIWaLHZfztLt9lUbwxaKIqm2TFxIpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662580; x=1750267380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMkLljSK+j8EobhNDyMcdRH/ZodKoaJMWOo2vFrOTRM=;
        b=N6zuw2n8MiwN5IYtOJCxuucTVFcGoYvA2o+PMbvHcZwSw2U12eSOVreYAMDaF+P/ix
         uadhV3h2/1KTV/tTQrzvUjZtIC5Y/6eOpgXt9irZS5nDoR3brP+B9drvk3O5ex1PiP/m
         KjPyQEvEAV8v0O2rq1KebHpNsY7fI6kTku1DFPe53vwkvP1/OmpXxCe30rgdp8ucuFBw
         O5/sWH5qNvQ2bQ8Pipj0xVWbMfa8BCYJ65dOITMnuKMxosGBF+AqNWhGFYBVPsylHydt
         8Yc0catJkX7tYwdaQz8KAi9ZPu2N1Tnp3eT4dExh6q+eaY8iJwXPjzlGFVQiRaUK3u7g
         TP8A==
X-Gm-Message-State: AOJu0YxQ6RLFKI4pHzsKkatO8GP6UIDnujdnpUnsxdyMqe7lAxqs9vEN
	aHSszo61jIdW3qUhms+xOtiAauw6vXSpEvAzdeLOV5o13ud+We9PmMtZtZ4fQBTA5ZpuqeWiDnn
	JicmY
X-Gm-Gg: ASbGnctDlHeJ2zL0iAC/TRN6FBT1lrnHVh9aIY0kOuYEx+gULYL1IGsvsqscZV2+bfG
	OgX/H1YoeUgZXILqpZai7l4EzOTjfF6mpyCp55XV4AfTAciq/k5pNAQYFU163z9Cg8cHF21fTR1
	xo4BgZffCI82bTxRp6Wa7CAj9vKZ+uIZ0Ms3bDscE57VObCiQNLtndnL4H/rlQWeipqWFVKO0IT
	cM8ZDedqzq7gGpLcZZgaD0Js8BEOKyRPd+G5vaviJVxpvhCu9zQVekKCWr9Np3yA2ocMCCvUab1
	GjRaPosqmTasLIUro5kdJh5l47Jr3rJQ/c+Vc3s8ytuwrBDS9p9yQ364wnxWVah75qdLtaUwInm
	RqD8O10p1y1626Jgrm533o1qYG+tXltr2ka0=
X-Google-Smtp-Source: AGHT+IFmm8Vnv/fFfhO6OHaQrYoRlOpgApD7blxzSW+d/IiH0RcBar5N6eB71msoXWKCHbg6AhxmIA==
X-Received: by 2002:a05:6000:4383:b0:3a4:f6c4:355a with SMTP id ffacd0b85a97d-3a558a534f7mr3477043f8f.57.1749662579917;
        Wed, 11 Jun 2025 10:22:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 8/8] pdx: introduce a command line option for offset compression
Date: Wed, 11 Jun 2025 19:16:36 +0200
Message-ID: <20250611171636.5674-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow controlling whether to attempt PDX compression, and which algorithm
to use to calculate the coefficients.  Document the option and also add a
CHANGELOG entry for the newly added feature.

Note the work has been originally done to cope with the new Intel
Sapphire/Granite Rapids, however the compression is not explicitly tied to
Intel or x86, and hence could be helpful on other architectures.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md                      |  3 +++
 docs/misc/xen-command-line.pandoc | 22 ++++++++++++++++++
 xen/common/pdx.c                  | 38 +++++++++++++++++++++++++++----
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 23215a8cc1e6..48327f03078f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -20,6 +20,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      table or foreign memory.
 
 ### Added
+ - Introduce new PDX compression algorithm to cope with Intel Sapphire and
+   Granite Rapids having sparse memory maps.
+
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b0eadd2c5d58..06819576a06b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2072,6 +2072,28 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
 those not subject to XPTI (`no-xpti`). The feature is used only in case
 INVPCID is supported and not disabled via `invpcid=false`.
 
+### pdx-compress
+> `= <boolean> | auto | fast | slow`
+
+> Default: `auto`
+
+Only relevant when hypervisor is build with PFN PDX offset compression
+`CONFIG_PDX_OFFSET_COMPRESSION`.
+
+Controls whether Xen will engage in PFN compression, and which algorithm will
+be used to calculate the compression coefficients:
+
+* `auto`: default choice, attempt fast calculation of compression
+  coefficients, if that's not successful fallback to slow calculation.
+
+* `fast`: only attempt fast calculation of coefficients, if it fails PFN PDX
+  compression will be disabled.
+
+* `slow`: only attempt slow calculation of coefficients, if it fails PFN PDX
+  compression will be disabled.
+
+Note `pdx-compress=true` is equivalent to `pdx-compress=auto`.
+
 ### ple_gap
 > `= <integer>`
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index feabdcded804..5fd01305a7be 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -19,6 +19,7 @@
 #include <xen/mm.h>
 #include <xen/bitops.h>
 #include <xen/nospec.h>
+#include <xen/param.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
 #include <xen/sort.h>
@@ -468,11 +469,40 @@ STATIC void __init pfn_offset_sanitize_ranges(void)
 }
 
 #ifdef __XEN__
+static enum {
+    PDX_AUTO, /* Fast first, fallback to slow if fast is not successful. */
+    PDX_NO,   /* Do not attempt compression. */
+    PDX_FAST, /* Only attempt fast calculation of compression parameters. */
+    PDX_SLOW, /* Only attempt slow calculation of compression parameters. */
+} compress_mode __initdata;
+
+static int __init cf_check parse_pdx_param(const char *arg)
+{
+    int val;
+
+    if ( !arg )
+        return -EINVAL;
+
+    if ( (val = parse_bool(arg, NULL)) != -1 )
+        compress_mode = val ? PDX_AUTO : PDX_NO;
+    else if ( !strcmp(arg, "auto") )
+        compress_mode = PDX_AUTO;
+    else if ( !strcmp(arg, "fast") )
+        compress_mode = PDX_FAST;
+    else if ( !strcmp(arg, "slow") )
+        compress_mode = PDX_SLOW;
+    else
+        return -EINVAL;
+
+    return 0;
+}
+custom_param("pdx-compress", parse_pdx_param);
+
 bool __init pfn_pdx_compression_setup(paddr_t base)
 {
-    bool use_slow = false;
+    bool use_slow = compress_mode == PDX_SLOW;
 
-    if ( nr <= 1 )
+    if ( nr <= 1 || compress_mode == PDX_NO )
         return false;
 
     if ( nr > ARRAY_SIZE(ranges) )
@@ -507,11 +537,11 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
             dprintk(XENLOG_DEBUG,
                     "Find PFN compression coefficients using %s algorithm failed\n",
                     use_slow ? "slow" : "fast");
-            if ( use_slow )
+            if ( compress_mode == PDX_FAST || use_slow )
                 return false;
         }
 
-        if ( use_slow )
+        if ( compress_mode == PDX_FAST || use_slow )
             break;
     }
 
-- 
2.49.0


