Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5877715B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 09:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581837.911265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU04c-00077s-VF; Thu, 10 Aug 2023 07:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581837.911265; Thu, 10 Aug 2023 07:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU04c-000751-SI; Thu, 10 Aug 2023 07:27:10 +0000
Received: by outflank-mailman (input) for mailman id 581837;
 Thu, 10 Aug 2023 07:27:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0PQq=D3=linaro.org=linus.walleij@srs-se1.protection.inumbo.net>)
 id 1qU04a-00074v-TG
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 07:27:09 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49f3453a-374f-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 09:26:57 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9b5ee9c5aso9465701fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Aug 2023 00:27:06 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9d12000000b002b9fec8961bsm233152lji.123.2023.08.10.00.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 00:27:05 -0700 (PDT)
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
X-Inumbo-ID: 49f3453a-374f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691652426; x=1692257226;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yN9CEShf+RVQzOCyA7HLL5huGCM+loDBl/b3GyqW7cM=;
        b=hAI2zLDeYrFyA9B2O1/1J3hre6J5vK9lgwpDrJrzByfWFjSj3ECeAAiyPUFNQLE6lr
         OqEp6NrSVviNuEkXD49dy0AKhzGZxEM+9TXhkVqWLmv0Oce6NKTxQadC0D9Y6rGJUG4x
         Mnq3yHe8Sn7pGinLvaV8xRK+dgOCgpVuC3gkbDnV5nf9E1tjFh2OdhdHQDcXju1e6JYF
         +T0EgaHRZ4qbq2+0o7/3khE5izxby8zFQluqlvRjgj1Qeq/cZrB21i5+EFmXnVOxzEO5
         mMHoOYhB20nmxGXn1mnfsJvVIvTd6FbceVpHh4VzwANRpsdfTVFJPvF/DvoUmhk2FyND
         XFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691652426; x=1692257226;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yN9CEShf+RVQzOCyA7HLL5huGCM+loDBl/b3GyqW7cM=;
        b=lld8lPwYJTzDStpXY2KSQp79TEZdqW/ziC5XkphnXRH6Ju/lNf2Ujn41bXs4RlZ3uV
         A4XbZibHztWg9hR/zfhx95EBBqJpTDY5WuCvk3Ypj5AO9C+ej9OY07ozJgRjvY6HX/ie
         5Ct2odEarnNnWibSMTYgn6fBoO/WL4Rhx8rqC9W+BDq/NXeyhebN4Ey7re/XTxbZ5bac
         FyRnw4b10JTdFxW0WaL4e954TjwcwbX9ICUqZir06DK/tnsyn2mMWgFqe2QtHFqmOKjq
         KNgVRaiZizXjpsqsKZ4DCdJzZ1zjr0giNBwBI1SnkEHOYqz4XI6yUqoxGQo/C4Ja+70I
         Sv9g==
X-Gm-Message-State: AOJu0YxUrXfTmp0Y4PA+TJ8T2/w27S4LXe0SqVIxcraHfFLwEVZkYSEE
	HYIT4wJKMTDXLYNTx78xKyUlJQ==
X-Google-Smtp-Source: AGHT+IHgd8Hjb+gMYaO0cS0m2RHlxFtCAELWefYhbMJLayBO9cdI/BMW7X3fnqTRhT0IxW6plo9f/A==
X-Received: by 2002:a2e:8559:0:b0:2b7:2db:8ea4 with SMTP id u25-20020a2e8559000000b002b702db8ea4mr1165263ljj.30.1691652425875;
        Thu, 10 Aug 2023 00:27:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 09:27:04 +0200
Subject: [PATCH] x86/xen: Make virt_to_pfn() a static inline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230810-virt-to-phys-x86-xen-v1-1-9e966d333e7a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEiR1GQC/x3MQQqAIBBA0avErBswI9OuEi2sppyNhkYY0d2Tl
 m/x/wOJIlOCoXog0sWJgy9o6goWZ/1OyGsxSCFboYXGi+OJZ8DD3QmzVpjJYzP3VhnZdlYaKOk
 RaeP8b8fpfT+XKd7VZgAAAA==
To: Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

Also fix all offending call sites to pass a (void *) rather
than an unsigned long. Since virt_to_mfn() is wrapping
virt_to_pfn() this function has become polymorphic as well
so the usage need to be fixed up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/x86/include/asm/xen/page.h |  5 ++++-
 arch/x86/xen/enlighten_pv.c     |  2 +-
 arch/x86/xen/mmu_pv.c           | 12 ++++++------
 arch/x86/xen/setup.c            |  4 ++--
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index fa9ec20783fa..85e63d58c074 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -295,7 +295,10 @@ static inline unsigned long bfn_to_local_pfn(unsigned long mfn)
 
 /* VIRT <-> MACHINE conversion */
 #define virt_to_machine(v)	(phys_to_machine(XPADDR(__pa(v))))
-#define virt_to_pfn(v)          (PFN_DOWN(__pa(v)))
+static inline unsigned long virt_to_pfn(const void *v)
+{
+	return PFN_DOWN(__pa(v));
+}
 #define virt_to_mfn(v)		(pfn_to_mfn(virt_to_pfn(v)))
 #define mfn_to_virt(m)		(__va(mfn_to_pfn(m) << PAGE_SHIFT))
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 93b658248d01..7178976c5dcf 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -523,7 +523,7 @@ static void __init xen_load_gdt_boot(const struct desc_ptr *dtr)
 	BUG_ON(size > PAGE_SIZE);
 	BUG_ON(va & ~PAGE_MASK);
 
-	pfn = virt_to_pfn(va);
+	pfn = virt_to_pfn((void *)va);
 	mfn = pfn_to_mfn(pfn);
 
 	pte = pfn_pte(pfn, PAGE_KERNEL_RO);
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index e0a975165de7..c4f20581f6e7 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2202,13 +2202,13 @@ static void xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
 		mcs = __xen_mc_entry(0);
 
 		if (in_frames)
-			in_frames[i] = virt_to_mfn(vaddr);
+			in_frames[i] = virt_to_mfn((void *)vaddr);
 
 		MULTI_update_va_mapping(mcs.mc, vaddr, VOID_PTE, 0);
-		__set_phys_to_machine(virt_to_pfn(vaddr), INVALID_P2M_ENTRY);
+		__set_phys_to_machine(virt_to_pfn((void *)vaddr), INVALID_P2M_ENTRY);
 
 		if (out_frames)
-			out_frames[i] = virt_to_pfn(vaddr);
+			out_frames[i] = virt_to_pfn((void *)vaddr);
 	}
 	xen_mc_issue(0);
 }
@@ -2250,7 +2250,7 @@ static void xen_remap_exchanged_ptes(unsigned long vaddr, int order,
 		MULTI_update_va_mapping(mcs.mc, vaddr,
 				mfn_pte(mfn, PAGE_KERNEL), flags);
 
-		set_phys_to_machine(virt_to_pfn(vaddr), mfn);
+		set_phys_to_machine(virt_to_pfn((void *)vaddr), mfn);
 	}
 
 	xen_mc_issue(0);
@@ -2327,7 +2327,7 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 	xen_zap_pfn_range(vstart, order, in_frames, NULL);
 
 	/* 2. Get a new contiguous memory extent. */
-	out_frame = virt_to_pfn(vstart);
+	out_frame = virt_to_pfn((void *)vstart);
 	success = xen_exchange_memory(1UL << order, 0, in_frames,
 				      1, order, &out_frame,
 				      address_bits);
@@ -2360,7 +2360,7 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 	spin_lock_irqsave(&xen_reservation_lock, flags);
 
 	/* 1. Find start MFN of contiguous extent. */
-	in_frame = virt_to_mfn(vstart);
+	in_frame = virt_to_mfn((void *)vstart);
 
 	/* 2. Zap current PTEs. */
 	xen_zap_pfn_range(vstart, order, NULL, out_frames);
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 8b5cf7bb1f47..50c998b844fb 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -340,7 +340,7 @@ static void __init xen_do_set_identity_and_remap_chunk(
 
 	WARN_ON(size == 0);
 
-	mfn_save = virt_to_mfn(buf);
+	mfn_save = virt_to_mfn((void *)buf);
 
 	for (ident_pfn_iter = start_pfn, remap_pfn_iter = remap_pfn;
 	     ident_pfn_iter < ident_end_pfn;
@@ -503,7 +503,7 @@ void __init xen_remap_memory(void)
 	unsigned long pfn_s = ~0UL;
 	unsigned long len = 0;
 
-	mfn_save = virt_to_mfn(buf);
+	mfn_save = virt_to_mfn((void *)buf);
 
 	while (xen_remap_mfn != INVALID_P2M_ENTRY) {
 		/* Map the remap information */

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230808-virt-to-phys-x86-xen-1b7a69235a29

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


