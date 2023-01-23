Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0867805F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483031.748987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3c-0002Q3-Gf; Mon, 23 Jan 2023 15:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483031.748987; Mon, 23 Jan 2023 15:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3c-0002MX-7U; Mon, 23 Jan 2023 15:48:28 +0000
Received: by outflank-mailman (input) for mailman id 483031;
 Mon, 23 Jan 2023 15:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3a-0000MU-CW
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:26 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59943607-9b35-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:48:15 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so31668821ejc.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:24 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:23 -0800 (PST)
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
X-Inumbo-ID: 59943607-9b35-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXjHJG37wrPSsNQkI70mLlT9j7sfcQhay1lHTQfBpqE=;
        b=aOmXpVDTwkO8k0CqcxAZ3eZ1tYYpqm6pCnougkWeY4CsGgbelNyDO0RRGHptwTZVtC
         cctHSUIq0dgNyfkcqlB9urbilwiY7VvKByqF54wJ7lVWdOlXh3OI/k30YzwQoKtP/DOg
         X5zFTQQStGMNu0q5vyol2FBFYiCKprE4RLZVsevYHYz3upjY7L9Gu7VTdheaUkIFzzU/
         oTl84wAK7FVX31qaBvaob/Zc+1hKoIrWJz7eAbU/081A+Lmm0MrkqqyyHXMcBGxdYxC4
         SxquQZtmbckIYn8UYSpmFCN/XSj21MijZwteeVOldD/GlBqoacDgTFYlyM8IGyrFe7Kz
         OQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXjHJG37wrPSsNQkI70mLlT9j7sfcQhay1lHTQfBpqE=;
        b=zo4WeqaXSGZYSwdBHuN5zijVl1UCC7PYbpAWAmef+3++c0a6GNtlfrVSYTqas1D9TX
         9sQV5RPno9t19oiFZDRNvOYtw/KwYPJcT8f/zpRLZahOGoZfBrzpTMufAt5C7zGM9ucJ
         3Wx2e3BDUigrTUD1y2rcUiV3uu6RgrSelzKMrQGNLSbyeyTXz8CH79S+zad7NMWBWkDb
         lBuuadhi5bQonI0HwDOAAhaBMEm4ao9dkrWOvNRhdiTIWrs3KUum5qjCaNDXYwTR5xiS
         HMY5voutBVngOm6N0oqaylolAUUXdPKD84sFTXeZwymIn2Ok9Y9E2luHxe2VFcgRzKwp
         3MbQ==
X-Gm-Message-State: AFqh2kqy95Ayvtqvae4t57noLdKonG9sMMIf4Bpfvh6S634+y37pJqmj
	8iLJvpWOsmWXK3V65W7Oa05wENjKNzhA8SKA
X-Google-Smtp-Source: AMrXdXtZW+SmY+t9CiCJtVGB6Ye1/RFitDnHCtldOZ8D0at+eHlzhbIJDeiQ1+pJ78QI+Z+WxyveiQ==
X-Received: by 2002:a17:906:f9cd:b0:7c0:b569:8efe with SMTP id lj13-20020a170906f9cd00b007c0b5698efemr25695642ejb.60.1674488903979;
        Mon, 23 Jan 2023 07:48:23 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 09/11] Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
Date: Mon, 23 Jan 2023 16:47:33 +0100
Message-Id: <20230123154735.74832-10-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 0c18fb76323bfb13615b6f13c98767face2d8097 (not clean).

This is not a clean revert since the rework of the memory layout, but it is
sufficiently similar to a clean one.
The only difference is that the BOOT_RELOC_VIRT_START must match the new
layout.

Cache coloring support for Xen needs to relocate Xen code and data in a new
colored physical space. The BOOT_RELOC_VIRT_START will be used as the virtual
base address for a temporary mapping to this new space.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/include/asm/config.h | 4 +++-
 xen/arch/arm/mm.c                 | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index c5d407a749..5359acd529 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -96,7 +96,8 @@
  *   2M -   4M   Xen text, data, bss
  *   4M -   6M   Fixmap: special-purpose 4K mapping slots
  *   6M -  10M   Early boot mapping of FDT
- *  10M -  12M   Livepatch vmap (if compiled in)
+ *  10M -  12M   Early relocation address (used when relocating Xen)
+ *               and later for livepatch vmap (if compiled in)
  *
  *   1G -   2G   VMAP: ioremap and early_ioremap
  *
@@ -133,6 +134,7 @@
 #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
 #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
 
+#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
 #ifdef CONFIG_LIVEPATCH
 #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
 #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b9c698088b..7015a0f841 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -145,6 +145,7 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
-- 
2.34.1


