Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB58AC5B09
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 21:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998703.1379441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PR-00073R-9H; Tue, 27 May 2025 19:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998703.1379441; Tue, 27 May 2025 19:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PR-0006zU-6O; Tue, 27 May 2025 19:56:25 +0000
Received: by outflank-mailman (input) for mailman id 998703;
 Tue, 27 May 2025 19:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U5mK=YL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uK0PQ-0006fw-HI
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 19:56:24 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aae83a57-3b34-11f0-a2fe-13f23c93f187;
 Tue, 27 May 2025 21:56:24 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-551fb4d153dso4512477e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 12:56:24 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532ede9ffdsm7253e87.69.2025.05.27.12.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 12:56:21 -0700 (PDT)
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
X-Inumbo-ID: aae83a57-3b34-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748375783; x=1748980583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vngFOrYt1JIZC6w4O6KMiqSaaieHXb8/DgKrm2QoDwc=;
        b=OBUpXaPx5pGiFnIsa0NhKGsRlku4XM6txbbT9Si18Nn9P/2DEQatNLw6a3Avnar3tL
         3HozaU5jW5cN95MXwOfb1GLaBKN14OHPtbB3zBu4TF3P1CBlhr2413PsW3XBl4BfRXwA
         mutHK4wlipAOgBkoTKxEpIPAW1shYI9mbl8CiDANnFn8p1SzDOvsGNNrhflcFFL1KWkQ
         KnAsEOWZ80ZvxlBeWg/YIbqo8RKP8kS6oG+6fxV0A0GkJf2cIZsMvgXHma1tBCN7SIi9
         SAkapv5Sl/hua4dgBU28scbs1GHG9KaQ/ntJlBiA+FlFeVKfel2ZBq8rhMQOGWpnhtjS
         FBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748375783; x=1748980583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vngFOrYt1JIZC6w4O6KMiqSaaieHXb8/DgKrm2QoDwc=;
        b=b6RNeAZOhHVbxwsXE6DFp7jPwW635S0xsYNg6I/qBSMV7f7VdG24kQMwtfmtW0BS0c
         d1U9J5I6h701m+6772QSUljWA+LnXjuoI5z2/rataUG0anXs8BZn5W1a4BasnRESgOCr
         iHA0pL6DP0pZOgv62slbfkc/GqTvmadyw+GwFIQJLE0yTpQ07MAv3s/fouinXGZw+SYN
         R/nFaD729H97WkTOG4eB+r6P13djCOYAlLoJ/1cMb7x5ieDKNb45LV4afFT0/Iutt1r5
         zVQMHPVwH7sJ6y+wSYYjnmevjgAgznc0wVlWRvgIOT5sncG9LjiFORAc+LlMGpItnH+I
         Tgcw==
X-Gm-Message-State: AOJu0YxlHvVEcnnyhlkD4RecZXVa3G2QK12lLT87ANnwtmDVwwhIpbQf
	c4mGIkpabUgkp1ShiBHk+Alh8u5u7P3RYaMa6JJmSd/KtjfKvk/4qphIC04HUKfvGqw=
X-Gm-Gg: ASbGncv3ebk+28CMxoyUVi+wa780b10DCXpbYvzeVgLnm8gtSdchqPn+k/v84quqA35
	QkaTM28uU1VdinxbHuE+dAAGPaYVTkDzEhYaWubcBfJ17MLcMm2a+KLMGpRygMAo87066kGLwPt
	OfLu42p1tXuzeqddpOTQ84vvUf4aJZpBRRv+OKduokaEOkzAvjQOlDWv30m6CFHYpQfGo+zLkzf
	7X6H5z4y0y/Nj2B8Q8JoYH7yiJzBZHukgegvsu5GwEzx+2dR47CyNVFKBolvyKR9xQFvBfrxlCe
	yQwqjFCyMLDlfzUP2brl8R+2npFQhFlweapWjCzyvyW3Ut8GrBUCoLQxJ9Y/fh8Et2sTnJcuEjN
	DTbXa726kZVRU2nVOr0MjiD8=
X-Google-Smtp-Source: AGHT+IHR+DnsITbWw3w2KJ6g1xT+1csv74B4Ak8LZYh+iyCpIdRa16eHii8xvgpf58bV561Lmfxtbw==
X-Received: by 2002:a05:6512:39c3:b0:54b:117c:1356 with SMTP id 2adb3069b0e04-5521cbafc09mr4298306e87.56.1748375782892;
        Tue, 27 May 2025 12:56:22 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 2/3] xen/arm: dom0less: Add trap-unmapped-mmio-disabled
Date: Tue, 27 May 2025 21:56:15 +0200
Message-ID: <20250527195616.874614-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527195616.874614-1-edgar.iglesias@gmail.com>
References: <20250527195616.874614-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the trap-unmapped-mmio-disabled per-domain fdt property.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 docs/misc/arm/device-tree/booting.txt | 7 +++++++
 xen/arch/arm/dom0less-build.c         | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 59fa96a82e..75fbb245d1 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -225,6 +225,13 @@ with the following properties:
     option is provided with a non zero value, but the platform doesn't support
     SVE.
 
+- trap-unmapped-mmio-disabled
+
+    Optional. A boolean property that configures handling of accesses to
+    unmapped MMIO ranges.
+    If set, guest accesses will read 0xFFFFFFFF and writes ignored.
+    If not set, guest accesses will trap.
+
 - xen,enhanced
 
     A string property. Possible property values are:
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index e5e13e07d0..cd1ef05d89 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -344,8 +344,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
 #endif
     }
 
-    /* Trap accesses to unmapped MMIO. */
     d_cfg->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
+    if ( dt_property_read_bool(node, "trap-unmapped-mmio-disabled") )
+        d_cfg->arch.flags &= ~XEN_ARM_TRAP_UNMAPPED_MMIO;
 }
 
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
-- 
2.43.0


