Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C85CDFD72
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193518.1512209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC6-0007A7-4Z; Sat, 27 Dec 2025 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193518.1512209; Sat, 27 Dec 2025 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC5-00075u-Vz; Sat, 27 Dec 2025 14:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1193518;
 Fri, 26 Dec 2025 22:53:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGgo-0005LS-Up
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:53:42 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b92433d8-e2ad-11f0-b15c-2bf370ae4941;
 Fri, 26 Dec 2025 23:53:42 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-34c71f462d2so8069953a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:53:42 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:53:39 -0800 (PST)
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
X-Inumbo-ID: b92433d8-e2ad-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789620; x=1767394420; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrpYuFgGuOqDarimfgNWi+H5QYEBWUzUVIbcnmljV6w=;
        b=I8qM87jmkRsHd6LGJrhefle/l7qlLLWvUBC8rJawsBsgCIb7dves6q3rdzZumCPBP5
         mS/5N4nVd9FPQ3q5Oj38ZSJwv7WIM+KZX5jaUiKUwo9OcIjCCCJ+NbCrtgz1cIt2PGmh
         g0pghCMvTNoEfmdwIz5OK/KaS6fMFoJjZwu37WpA/RD3QT4fOCfW1yJAh5RYk97szXFY
         +e6H9gY45y+0awD6eSWUhx27Wch9zEQopyFlnQ7j6+VDiqWvKPb7zy5TWySvvARACRkv
         mGd+GpkdB/J0BvdEl9JL7uOIlUb6cTuX45ywflUfJFLmLt1proYkDDnE25aaefmWGFPK
         dI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789620; x=1767394420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XrpYuFgGuOqDarimfgNWi+H5QYEBWUzUVIbcnmljV6w=;
        b=wOS+4Mbdw73QNe2HeqRopJ5bGrsBw4T3qlf3pSBhIfO/UljRb4kBdCbzR5qQPz1+8x
         ZlO7svB+OLDjp4BmvbFSdnhDg+DwqmT3pGdYaprLMFCaHG7D5S8fktWaYP0GdUZwI+N8
         nJqofl+jDzgha9gz7XU+fHYWZHzl+n4tIRqS4vBP7O13Ck/DwUTfP5CWKtQ4gjTKSiiJ
         EiSaIZt05pTBadeI7A/GL+Es4LECbuH1WNiQFfpg0AsBfQTbvFxDpg5IBGA0BAdv0g0F
         yPoD/tNSrVuGLByZIym+SP5ww15MVym650c4M+jL0gFsY2w3IIXlyiobyU698mK4aciV
         YPLg==
X-Forwarded-Encrypted: i=1; AJvYcCV0gMwMVScohb4KRMCvt/gPxAiFK4AnfuUI4e6SQ2pdK8a02kDoTx+EQy536MkW/2oR9KQe+0K/1e4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqY7+g/iomYbz+oMeFw4iaDE7VsSLiBSC/0IBlsPy77FHHjqNN
	coe6XYmKDKvs7KonWfwAUR6EBU2wav++hT7IxqtSFiEj27ir4gimjNj9
X-Gm-Gg: AY/fxX5n5/LxM0dBooPf37UaZJ+wwQbIt3LA0ORN33zMNP8D6Cdhdf3R9QK4OYr10Ts
	t8yF5+m44OO4t7TRPrvcLgPHePN/910Zt/itsLm0E5tWmu/nUUDo+ODO0EqPtD2YfVsIXDH3MIJ
	pJ8D8Btd1SCnt4PWoEgEmEGdV72ALzGBYo9G/8AHOUDJZm0yiQvuEO4w1fOl+c6h+q9wxwfg4H5
	eAF18YXnFny6F3SZcStHMG5rG2QDoah3hHwqRyz151r6Iffq0sbbDzq0DmWZrwTiSYMRBVZOeTT
	jBsQ42VyVp3j6jvYY4dukX25UT8Pha6J03/SqjtgNbopaz7GObSITFO9c+gxcVCvVpQgFTqG1FH
	x/L+gN1brXdTz8gHZ7j8yoxUJWqetZe7cG7Q1mZAJY9P/r9CyzK0R1Jqpwsr+eqopwAVKM2oFwQ
	ADKGgNYVv/FctB
X-Google-Smtp-Source: AGHT+IGZAwVjw6Q14Ldbj2NnyfuDwpis8NstpDAoaBbm3hUZYJbQhE2SG8A3iUeExaHFKxkFLgGP9A==
X-Received: by 2002:a17:90b:528a:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34e921b05f6mr21341646a91.20.1766789620383;
        Fri, 26 Dec 2025 14:53:40 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Barry Song <baohua@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH v2 3/8] arm64: Provide dcache_inval_poc_nosync helper
Date: Sat, 27 Dec 2025 11:52:43 +1300
Message-ID: <20251226225254.46197-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

dcache_inval_poc_nosync does not wait for the data cache invalidation to
complete. Later, we defer the synchronization so we can wait for all SG
entries together.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/cache.S               | 42 +++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 9b6d0a62cf3d..382b4ac3734d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 4a7c7e03785d..99a093d3aecb 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -132,17 +132,7 @@ alternative_else_nop_endif
 	ret
 SYM_FUNC_END(dcache_clean_pou)
 
-/*
- *	dcache_inval_poc(start, end)
- *
- * 	Ensure that any D-cache lines for the interval [start, end)
- * 	are invalidated. Any partial lines at the ends of the interval are
- *	also cleaned to PoC to prevent data loss.
- *
- *	- start   - kernel start address of region
- *	- end     - kernel end address of region
- */
-SYM_FUNC_START(__pi_dcache_inval_poc)
+.macro raw_dcache_inval_poc_macro
 	dcache_line_size x2, x3
 	sub	x3, x2, #1
 	tst	x1, x3				// end cache line aligned?
@@ -158,11 +148,41 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
 3:	add	x0, x0, x2
 	cmp	x0, x1
 	b.lo	2b
+.endm
+
+/*
+ *	dcache_inval_poc(start, end)
+ *
+ * 	Ensure that any D-cache lines for the interval [start, end)
+ * 	are invalidated. Any partial lines at the ends of the interval are
+ *	also cleaned to PoC to prevent data loss.
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc)
+	raw_dcache_inval_poc_macro
 	dsb	sy
 	ret
 SYM_FUNC_END(__pi_dcache_inval_poc)
 SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
 
+/*
+ *	dcache_inval_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end)
+ * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
+ *	sy is issued later
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
+	raw_dcache_inval_poc_macro
+	ret
+SYM_FUNC_END(__pi_dcache_inval_poc_nosync)
+SYM_FUNC_ALIAS(dcache_inval_poc_nosync, __pi_dcache_inval_poc_nosync)
+
 /*
  *	dcache_clean_poc(start, end)
  *
-- 
2.43.0


