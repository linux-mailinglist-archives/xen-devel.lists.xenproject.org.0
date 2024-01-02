Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF0821924
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660571.1030151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRI-0000VN-L8; Tue, 02 Jan 2024 09:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660571.1030151; Tue, 02 Jan 2024 09:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbRI-0000Lk-8r; Tue, 02 Jan 2024 09:52:00 +0000
Received: by outflank-mailman (input) for mailman id 660571;
 Tue, 02 Jan 2024 09:51:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbRG-00060C-2D
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:58 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9071b3ae-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:56 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28005f9b9cso114748666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:56 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:55 -0800 (PST)
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
X-Inumbo-ID: 9071b3ae-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189115; x=1704793915; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcO0kEIMg/LgcpSllNj/odMrO/ou7iqngmDP7yYGSAQ=;
        b=AXfFNeXEd/5wC4Ze1yGgN+ciYn4rqmPNUrJdlXLBpjDwGqCqW0nv7/iTTc5ngiS5LE
         yfw51DbInyM9rkg1zlMyN1dff5Qr6AU0hgadWjgQBa6y1KnxcAZYJvLmuanWb6YATOVX
         8YU6fzWwwKLoEM2gvPDh2ZZ4/RuNuTaY+qn3Jc/vq7MD2KotZiHOeZ2EHlNCjj2VuhMv
         Hxbi+SpAQDavhN/LM1Ojyy29p1dMLidIx0K4TXPw9GKj+xtfhpjLcVrG8kYkiSPGlzNB
         6EswUsp52mDvDmQA2gh4PxCC4HkgyVe6GPKeOEWFczOVi0AX2zGM/u59WqG3UCEF8xDd
         OOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189115; x=1704793915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcO0kEIMg/LgcpSllNj/odMrO/ou7iqngmDP7yYGSAQ=;
        b=GD7/mRRWsNv/zN7LwIpiDbclvJXilaQS/GuSezymVafShtsRg7jiormPeLYkIZk3G4
         ydNxikPc1sJc//F1d8GW408HyrZoC04Jlc5fSkm3nu0fMM0VSSJ9Lz7jeSXRkiY1/BWM
         H1I1fwXzCzFzfjXNfb/wKHMGubqEUModHyk6YisQi5rQhxr9RGlJ3vBMJ/pXIL2poXs+
         Oje4wCZQ98czOGDC7hYD0q7vju5wAjh+ph378L5QUNvOxc41ixFb0K5iACSnu5BrmXHK
         hXU6EY4Yduu7V4yB+Swzt5yQAa6ImUPYcy6NnNGGSuK80wD6ItCO2WliIOw21x02NQuv
         Opnw==
X-Gm-Message-State: AOJu0Yy7xiPsucJja/J4wK2Ae+X4qQLrhB/39XvMMfuVyyd9TULADTIh
	vjNFFLQTmpTtUSritzDAh6hvkreegqiQKGv1g1t3lHrYZtU=
X-Google-Smtp-Source: AGHT+IGYJ/FbaOnnjGdfsmIIcCIEpyNdigCmNAnLVYN1SMaA0OWzdwtLOdGXGWIGV6865STxxqucYQ==
X-Received: by 2002:a17:906:1cd:b0:a26:db4e:955 with SMTP id 13-20020a17090601cd00b00a26db4e0955mr5915269ejj.64.1704189115261;
        Tue, 02 Jan 2024 01:51:55 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 11/13] Revert "xen/arm: Remove unused BOOT_RELOC_VIRT_START"
Date: Tue,  2 Jan 2024 10:51:36 +0100
Message-Id: <20240102095138.17933-12-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
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
 xen/arch/arm/include/asm/mmu/layout.h | 2 ++
 xen/arch/arm/mmu/setup.c              | 1 +
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index eac7eef885..30031f74d9 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -74,6 +74,8 @@
 #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
 #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
 
+#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
+
 #ifdef CONFIG_LIVEPATCH
 #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
 #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index d5264e51bc..37b6d230ad 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -69,6 +69,7 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
-- 
2.34.1


