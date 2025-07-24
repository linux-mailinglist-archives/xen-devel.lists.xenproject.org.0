Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50EB10886
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055722.1424063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl4-0001f6-RB; Thu, 24 Jul 2025 11:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055722.1424063; Thu, 24 Jul 2025 11:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl4-0001bm-NH; Thu, 24 Jul 2025 11:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1055722;
 Thu, 24 Jul 2025 11:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetl3-00011w-8j
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:05:05 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cb20f43-687e-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 13:05:03 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so9237065e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:05:03 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4587054c37csm16762615e9.8.2025.07.24.04.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:05:01 -0700 (PDT)
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
X-Inumbo-ID: 0cb20f43-687e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355102; x=1753959902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zceg71Pnqj3ImLkxP+2Mg3UE0d3Wnna2dUrKt8QAy0=;
        b=soZ3jotS715QRAUjePJSpGp+3811W2Eb904IYAIxU+nknj4nRf3oiwPZuAQiS5Vb0p
         pqFoYsuepfEKB4wy24MO7SCX8tT9zHXQaaZPUPN6FlCFm0wssRPRnuDwKXHyqXq5w9Yw
         HzmSgYjC77gWWgCGNuRU8fO2rufsq6OlvmzXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355102; x=1753959902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zceg71Pnqj3ImLkxP+2Mg3UE0d3Wnna2dUrKt8QAy0=;
        b=AMiQee0fSKvqmd4E/RB6QBS1T/9pZnELwDaiZwKl3zNOiAJjuCdUPfcFwX4cwKVJxd
         HZyGQIfiQxEz4/Z6ypD1gPc2rZB9qGn8DOXvOlNjyp+rwCM173922vYMVFGsDCmmPyAa
         boO/ZdUawIr1pjn75tWuNw6KeIGZzjz9DXWqXS69CKIKpDeLB7EV/ZSOJ++I6cjFRbbc
         sg8ITVAK3nKZWvRZZq0OYU0LTyK5GANJOgPjfIbuGpvkoEznkx+wXeRHg9AcdcDwKsKx
         uDNl98q9D+XFDGKoRu/QASr92m5JxoVcLrOwi2U6wQbRA/DeKS3/L6eGAeEve+ckkVHO
         Zsrw==
X-Gm-Message-State: AOJu0YwgUMGFqqYaW8SqZTEdGXiLlM+yOYNLFjILj9eCPR3R14EqlSc0
	jqJg8HnlNq16vxju0ALBMAL2WSun4KBpj/rDpw0CzjJhv93Evv2xxZQrW1EVVQJ1+O10UkzP/Xv
	c6hJU
X-Gm-Gg: ASbGnctdjpxTyNFOGFKOElgFJlAhdLZjBT+KwrliKHkzHrDHAYT+DzjTxrlKmDVMYTF
	PKL3lVvIxNi1iIJdykmDlKovQDhm7Iud8HKDLtEd0dhvKbzAhyQpI8cNypx13M5GXtkmyw+X4W5
	1l0DUyBL7bJfR6h5d8efVVYNMIPf0HCHzLXqrut68tUZlD6JgnYQNaZjaXs04NrBVugoeCC/iYG
	brcXCPqK0gJzD2hxpht55L+nqK0Ql4SweFKRcXz4cVL3+7DD02jsfoAoWrzsGhrXbQnAMX8d5TP
	Gf50g9X/XnV0jYLiJotxvoiW3+Z2/zMFMIIpsr2heHEcWxkh/HLiToiXUtq4GPrPKphDYHPo87M
	kQjFqB8eWiZe/Wo0IBl8nT8XTl/z+5SJPHrzl5ItRCu8BDpW411TEefAhqiEMdcnicg==
X-Google-Smtp-Source: AGHT+IHH6U0ylScaSpGCzT78sQEfFST9V4KLsm2VWM2leCHNtZ7t5h1+5hZK2OCWUYLruC4XPlYy6A==
X-Received: by 2002:a05:600c:638f:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-45868d46f15mr64914895e9.18.1753355102429;
        Thu, 24 Jul 2025 04:05:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@cloud.com>
Subject: [PATCH v3 3/8] pdx: introduce command line compression toggle
Date: Thu, 24 Jul 2025 13:04:11 +0200
Message-ID: <20250724110416.2081-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724110416.2081-1-roger.pau@citrix.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a command line option to allow disabling PDX compression.  The
disabling is done by turning pfn_pdx_add_region() into a no-op, so when
attempting to initialize the selected compression algorithm the array of
ranges to compress is empty.

Signed-off-by: Roger Pau Monné <roger.pau@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - New in this version.
---
 docs/misc/xen-command-line.pandoc |  9 +++++++++
 xen/common/pdx.c                  | 14 +++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6865a61220ca..5dd2ab82b7aa 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2072,6 +2072,15 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
 those not subject to XPTI (`no-xpti`). The feature is used only in case
 INVPCID is supported and not disabled via `invpcid=false`.
 
+### pdx-compress
+> `= <boolean>`
+
+> Default: `true` if CONFIG_PDX_NONE is unset
+
+Only relevant when the hypervisor is build with PFN PDX compression. Controls
+whether Xen will engage in PFN compression.  The algorithm used for PFN
+compression is selected at build time from Kconfig.
+
 ### ple_gap
 > `= <integer>`
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 49c9dbf9e5fa..ad7871ad90be 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -19,6 +19,7 @@
 #include <xen/mm.h>
 #include <xen/bitops.h>
 #include <xen/nospec.h>
+#include <xen/param.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
 
@@ -76,9 +77,13 @@ static struct pfn_range {
 } ranges[MAX_PFN_RANGES] __initdata;
 static unsigned int __initdata nr_ranges;
 
+static bool __initdata pdx_compress = true;
+boolean_param("pdx-compress", pdx_compress);
+
 void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
 {
-    if ( !size )
+    /* Without ranges there's no PFN compression. */
+    if ( !size || !pdx_compress )
         return;
 
     if ( nr_ranges >= ARRAY_SIZE(ranges) )
@@ -215,6 +220,13 @@ void __init pfn_pdx_compression_setup(paddr_t base)
     unsigned int i, j, bottom_shift = 0, hole_shift = 0;
     unsigned long mask = pdx_init_mask(base) >> PAGE_SHIFT;
 
+    if ( !nr_ranges )
+    {
+        printk(XENLOG_DEBUG "PFN compression disabled%s\n",
+               pdx_compress ? ": no ranges provided" : "");
+        return;
+    }
+
     if ( nr_ranges > ARRAY_SIZE(ranges) )
     {
         printk(XENLOG_WARNING
-- 
2.49.0


