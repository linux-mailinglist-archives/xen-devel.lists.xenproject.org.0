Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844BB1B178
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070225.1433884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM7-0002JL-Pr; Tue, 05 Aug 2025 09:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070225.1433884; Tue, 05 Aug 2025 09:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM7-0002Fc-LZ; Tue, 05 Aug 2025 09:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1070225;
 Tue, 05 Aug 2025 09:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEM6-0001yh-UM
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 012038fb-71e2-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 11:53:14 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so3045203f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:14 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459d7d722dcsm81726915e9.24.2025.08.05.02.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:12 -0700 (PDT)
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
X-Inumbo-ID: 012038fb-71e2-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387593; x=1754992393; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsP/JixQiAB6kfYYFbr7LCCHkXcXLGwU+Dyro6/r2kA=;
        b=Fz2ZanIxm2Y9ptFvTfaScOuxYCz2uUB2o45RmGWaC87T14ES7aYQTpob2AU7NLcvVh
         D2yImYzyyyIwq7jUkGxXwKaWTcfgKxymlave90bBthssmAhyGD+/gA+irSj4YcI1lVsN
         /L1LxvzkAO1xLqsauQ7gdSV/aDw3aPoKlwp0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387593; x=1754992393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsP/JixQiAB6kfYYFbr7LCCHkXcXLGwU+Dyro6/r2kA=;
        b=xH04WBomTLqzJ1xfDrA214dtBnd5ypv8eOi2M9SWeW1hqPTyurL/9ymZ3QrsQquyKR
         o19WiU2+3e1i6Jacxot4q6m2kgfrmlPKQZ9lNmzkoqL23GB8qcVmFciX8m/1QE9zjca6
         JsMxQRNu/4BINHyOrp++rMS1Nb/JWn2vO0hivJEjN6VvoIropDh8hr4A0qnDBCRx0zun
         dWPLnFoePEcWBTPL9gkIZHhAF36bZ8Rtj2TDso7P9G/fyTBhLVALEUMyyyZZUSYDjrMr
         39G1+6cCPWSrCsuZcZHuC0cmbQgXOBpW/LMb+5s7ucn7flPCsZUoOzOOqRSre5QZRqOD
         GFhA==
X-Gm-Message-State: AOJu0YzckIbQa3OW1AFpqgDLVbtKipqWjPDqLwO1GGag9DxKxKISrf8p
	IROsTB+7glh7NenISfoU/TX0xg+mNWpMhMNxqP9IvzfhCABHyGXyEvw4GGYvWZav1TDMtlyBWzK
	6AQJO
X-Gm-Gg: ASbGncvaWy6xRBACltW2ucE7WpNbaSKwrmtnCF+R0eeCDtgMwHHGs7V1bwoGT1qNi0A
	b+h+13K+bSQhf71ohVi2v5h+BHHdjBd4q4EBOMPvlYUCM9onBtR+iaWTsJE9Ve0UfdHHdwm5J4S
	5W4nvNx0UssxkkoXBnnDBhuPe055NYQNlIKebtqcQbFjw0NOLKYsHdq/kRVQiDO+Uy2dLgEnWA5
	Px9lW58yG8me8be6q52BRUoBCqLY4edtuNjA2/a4r9BdNXkRg6/t5RYihEa+iLC4/K6u66YQGff
	6DjD2H5XXbc4NNrsJVEsy0PK8CnspSX8ACMeEck/dySTMFiYzTKLljF3WWUJjRGnaLS5AU3Ws/P
	KYZVo/KeOyGRDfPplGBX0m5YBYncM2z1ySgaPNym4/GcPLv7MvsIrSsdSFPAg0y4AIQ==
X-Google-Smtp-Source: AGHT+IH49zUlNPTt/qK45COiRhwo0/cwFIVsqcrvnCBiw9Pq26t9NZrr2MBWRQ3DVFuB+RVdrt8m8w==
X-Received: by 2002:a05:6000:2584:b0:3a5:3b93:be4b with SMTP id ffacd0b85a97d-3b8d94817camr9322675f8f.25.1754387593511;
        Tue, 05 Aug 2025 02:53:13 -0700 (PDT)
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
Subject: [PATCH v4 3/8] pdx: introduce command line compression toggle
Date: Tue,  5 Aug 2025 11:52:52 +0200
Message-ID: <20250805095257.74975-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805095257.74975-1-roger.pau@citrix.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
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
index c5ea58873c0e..f4a3dcf6cb60 100644
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


