Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB52AE19B4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 13:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020848.1397008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZep-0006Sm-5C; Fri, 20 Jun 2025 11:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020848.1397008; Fri, 20 Jun 2025 11:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZep-0006Qt-0C; Fri, 20 Jun 2025 11:11:43 +0000
Received: by outflank-mailman (input) for mailman id 1020848;
 Fri, 20 Jun 2025 11:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZen-0005XV-EN
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 11:11:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b05a14-4dc7-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 13:11:39 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so1410693f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 04:11:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d0f104bbsm1785278f8f.4.2025.06.20.04.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 04:11:38 -0700 (PDT)
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
X-Inumbo-ID: 56b05a14-4dc7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750417899; x=1751022699; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8xArolHoZlQzAD7nGBeNXqPQFb+qxrfyquO2phQrQ8=;
        b=bQulBgTPf8YW3t9+6K7nhXx5cWMiPZ52zPeqsT7ivdaBKOxbnSVc8nnvjYdRbQc063
         ZchXXkdB2xm/8Z6uv9det2mPFik7ejpx5AIX6IuoOkB2D8TDIq0nJkg0NLzzvi7QlCS6
         UTFBXkNTtzOxGxTyaNq+kMIciOT5ZI5USg9hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417899; x=1751022699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8xArolHoZlQzAD7nGBeNXqPQFb+qxrfyquO2phQrQ8=;
        b=lsFSaUTG6Yx/4NapZyBFbX+tv3B6MpnKNazvUBXUWKmpMdjVI3p+6KIr4O6gkXImxB
         t609EqYCTOnPjjN+ya9pAyCL2Mu7JEWjYUFhvTyJxc8ETSCjTFF1rlO+CX0x4S9ByKAO
         NRGFl0CU1ehII4ap7mHh+mlp7AsjYLVsJx95/QhpWpXitt3O63WAPG48abEeeEIal493
         LUWsl542WqULm0253mZd+NWdgENcecZud4w3q2DZ3wQ41mArlEeqThai7jaa0lZE0+XJ
         Y7Nj6+Q7aiBLfPpK0/3jE1ZjrD9LQdvaDEiW+HlNKCtK47T2w2R2bIwxIbH6JlbCrc4a
         iNfA==
X-Gm-Message-State: AOJu0YzGIkSe7tsGAMjmoxgdIxhSH98KwqSAWaWCPDf6qAwciWMASRxD
	lgHIqdAdoOHe5wwfamvZs/MRIgdvCMsWSCE2h6aLMc23RRNkdVhbr8nP9PO0egA0/WZ/T8mTN0D
	2Eoyo
X-Gm-Gg: ASbGnct8IHwBSyhahC1eHm8TW0MUjz915AmP8lzBWmJ9tNF2akKnIB3y23N+tx+DYph
	NpAponotEk3LyAk2VMqol0WuK/DI2WN1G+qflzhFUn1aZzOT1fpHpOm3VdJj2YbrS/RadmNX8GS
	xsdXTG6Ubp1rlTz1njT7d37YuySgZ5At40vzS3YuJv4ecSB0Q0lB3sRPDa2kJhbD+chT36cNMHG
	wnjEWfjnXHpYgdlc+zz+ADUz3f5vIqjiGHS2wnpFGbSTa7jjBOUhewB74LaOOc9VevSfc0J0729
	TXF9gpXVnmkGaCUqsU+cD14zvS4g63ORUlHnZl1CnsrcbeAN5PHqI7Njit40lrSvDqEe6SibKag
	VusR+9UtpjkDD+B3otM1hkIuCpTCVjgTdT2QBpH/O
X-Google-Smtp-Source: AGHT+IFC3F/vZggfelvDlDElhNOdJ82GWozuNVzqytLAEaS0nI24HNALkgoj2kiO6E3Bf9w3uOgVWQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a6d12c1848mr2047618f8f.16.1750417898844;
        Fri, 20 Jun 2025 04:11:38 -0700 (PDT)
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
Subject: [PATCH v2 4/8] pdx: introduce command line compression toggle
Date: Fri, 20 Jun 2025 13:11:26 +0200
Message-ID: <20250620111130.29057-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620111130.29057-1-roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a command line option to allow disabling PDX compression.  The
disabling is done by turning pfn_pdx_add_region() into a no-op, so when
attempting to initialize the selected compression algorithm the array of
ranges to compress is empty.

Signed-off-by: Roger Pau Monné <roger.pau@cloud.com>
---
Changes since v1:
 - New in this version.
---
 docs/misc/xen-command-line.pandoc |  9 +++++++++
 xen/common/pdx.c                  | 10 +++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b0eadd2c5d58..c747a326be86 100644
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
index 6f488366e5a9..8c107676da59 100644
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
@@ -215,6 +220,9 @@ void __init pfn_pdx_compression_setup(paddr_t base)
     unsigned int i, j, bottom_shift = 0, hole_shift = 0;
     unsigned long mask = pdx_init_mask(base) >> PAGE_SHIFT;
 
+    if ( !nr_ranges )
+        return;
+
     if ( nr_ranges > ARRAY_SIZE(ranges) )
     {
         printk(XENLOG_WARNING
-- 
2.49.0


