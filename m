Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E6AA5E30E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910634.1317349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAv-0007tA-MK; Wed, 12 Mar 2025 17:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910634.1317349; Wed, 12 Mar 2025 17:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAv-0007nh-CZ; Wed, 12 Mar 2025 17:47:25 +0000
Received: by outflank-mailman (input) for mailman id 910634;
 Wed, 12 Mar 2025 17:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAt-0006eC-PX
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:23 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d80f95d-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:23 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso1246365e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:23 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:21 -0700 (PDT)
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
X-Inumbo-ID: 0d80f95d-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801642; x=1742406442; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZxpY1j+tYKf6h6cwDyqwsZP3HXNRy5CWzq/bv6KU6I=;
        b=kHq6kx/bMnSVc3AHtqOnznsh1Cm1uCwLN22KrucR9Y0CpTSkzf9xv3J13uo8EGFtxg
         vn4W7dMESG1Evrd4mKkYTBZKq1pnHhUNkXmAJ5bG/1ZVZLg6jesocSGU14or50DEw4B/
         +NNEPV8wK6BhaAsJbPdikbNglMiQyxZozvBF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801642; x=1742406442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZxpY1j+tYKf6h6cwDyqwsZP3HXNRy5CWzq/bv6KU6I=;
        b=Ux7FZ+/sCEKkgAAc6eJHZJAkHRgp7NKN+Ecv5vCbJzktgq35FdfZQUVFxER3riF7RQ
         o/XlcFpTfXM+OvpNaOgJ8PCyESbyylSChro/406SZQS3mXEGIhj0DoHL/mjdbD+M/C5Q
         JnQmyPfJND0kmltzmMbfb5VT7j7Y+PanoJmeYLsIWXUAFWnhl87URFSIw7GpNF2f1H7D
         ok+nbHLWnhOGE5r1TG6hBWG8ov+xcFQQfcBQo5kaKw6t6sb0kIzcj6S+IRnz79ipgKHI
         emTvHrsd4+R7/RxZYPRKVh4u3kja2mqwoq8Ou3eeOnWkRrzP91CZg08CFiet5v0GkQ03
         MRrA==
X-Gm-Message-State: AOJu0YyN7RCfk6hs8PJ2WgnGrNOEAdw3hHMRua7xugZSCb10engRV6vS
	arPs0lDTWzVUoUlpzycDXJFe9F43z8z+VmZE+zXcLqWSUH61zs2vHwbuWGkEW5eLh9jnAEYnPns
	w
X-Gm-Gg: ASbGncteVHRcVWAGSnRZ7OcZsLGbPYaXkoK355jDgPKYkdEd+JhM+YvUMufDXfR5/q5
	wzvvrFGHNxVmB2fBqOPYkD7yPDa3c3Ll1QKgJd4s6PnmO87xXqhpzsVYSJj26SmvaKhjALcrrHa
	ya1XBn92NEN59Fm8NNhM3CQo80nKFMQpMfsPs1qBHz4hMQdtsmM20sOCuZtOJns9oJZ8QoI0Tdf
	MPJ7BfsA42QW6AiDEva5EVOyNGZwLWKJmzfjzsUcqdLbEyfHShbBQrnoKQxyyMUttMHlX/ZpD3J
	GR1lxTZPWTTHPXC1aocDeh6n5E38lpo5RDUxYRn3iqE+UhPVPp1H9eVV8GLqxPjBUHqrHPC8nrW
	wm4Ig5jdpF6LTiCeXiEEJN034iYDz4SBUZ90=
X-Google-Smtp-Source: AGHT+IFOZgz21JTkr53wf6nAyfUuR8xGMtR4kI57Y4nBotlAubxbKXRNoHNCn66WKMXoJaECwuxQTA==
X-Received: by 2002:a05:600c:512a:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43d16192475mr4024405e9.2.1741801642295;
        Wed, 12 Mar 2025 10:47:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 5/8] xen/arch: Strip out tlb-clock stubs for non-implementors
Date: Wed, 12 Mar 2025 17:45:10 +0000
Message-Id: <20250312174513.4075066-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that there's a common stub implementation TLB clocks, there's no need for
architectures to provide their own.

Repeatedly zeroing page->tlbflush_timestamp is no use, so provide an even more
empty common stub for page_set_tlbflush_timestamp().

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/flushtlb.h   | 14 --------------
 xen/arch/ppc/include/asm/flushtlb.h   | 14 --------------
 xen/arch/riscv/include/asm/flushtlb.h | 14 --------------
 xen/include/xen/tlb-clock.h           |  1 +
 4 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
index e45fb6d97b02..6f69a5bdc8c2 100644
--- a/xen/arch/arm/include/asm/flushtlb.h
+++ b/xen/arch/arm/include/asm/flushtlb.h
@@ -3,20 +3,6 @@
 
 #include <xen/cpumask.h>
 
-/*
- * Filter the given set of CPUs, removing those that definitely flushed their
- * TLB since @page_timestamp.
- */
-/* XXX lazy implementation just doesn't clear anything.... */
-static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
-
-#define tlbflush_current_time()                 (0)
-
-static inline void page_set_tlbflush_timestamp(struct page_info *page)
-{
-    page->tlbflush_timestamp = tlbflush_current_time();
-}
-
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/flushtlb.h>
 #elif defined(CONFIG_ARM_64)
diff --git a/xen/arch/ppc/include/asm/flushtlb.h b/xen/arch/ppc/include/asm/flushtlb.h
index afcb74078368..f89037bd4543 100644
--- a/xen/arch/ppc/include/asm/flushtlb.h
+++ b/xen/arch/ppc/include/asm/flushtlb.h
@@ -4,20 +4,6 @@
 
 #include <xen/cpumask.h>
 
-/*
- * Filter the given set of CPUs, removing those that definitely flushed their
- * TLB since @page_timestamp.
- */
-/* XXX lazy implementation just doesn't clear anything.... */
-static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
-
-#define tlbflush_current_time()                 (0)
-
-static inline void page_set_tlbflush_timestamp(struct page_info *page)
-{
-    page->tlbflush_timestamp = tlbflush_current_time();
-}
-
 /* Flush specified CPUs' TLBs */
 void arch_flush_tlb_mask(const cpumask_t *mask);
 
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index 51c8f753c51e..23739a22fb2a 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -20,20 +20,6 @@ static inline void flush_tlb_range_va(vaddr_t va, size_t size)
     sbi_remote_sfence_vma(NULL, va, size);
 }
 
-/*
- * Filter the given set of CPUs, removing those that definitely flushed their
- * TLB since @page_timestamp.
- */
-/* XXX lazy implementation just doesn't clear anything.... */
-static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp) {}
-
-#define tlbflush_current_time() (0)
-
-static inline void page_set_tlbflush_timestamp(struct page_info *page)
-{
-    BUG_ON("unimplemented");
-}
-
 /* Flush specified CPUs' TLBs */
 void arch_flush_tlb_mask(const cpumask_t *mask);
 
diff --git a/xen/include/xen/tlb-clock.h b/xen/include/xen/tlb-clock.h
index 796c0be7fbef..467f6d64a6ca 100644
--- a/xen/include/xen/tlb-clock.h
+++ b/xen/include/xen/tlb-clock.h
@@ -44,6 +44,7 @@ static inline void accumulate_tlbflush(
     bool *need_tlbflush, const struct page_info *page,
     uint32_t *tlbflush_timestamp) {}
 static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp) {}
+static inline void page_set_tlbflush_timestamp(struct page_info *page) {}
 
 #endif /* !CONFIG_HAS_TLB_CLOCK*/
 #endif /* XEN_TLB_CLOCK_H */
-- 
2.39.5


