Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A88CDFD60
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193514.1512200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC5-00073C-O6; Sat, 27 Dec 2025 14:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193514.1512200; Sat, 27 Dec 2025 14:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC5-00071U-HV; Sat, 27 Dec 2025 14:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1193514;
 Fri, 26 Dec 2025 22:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGgc-0005LS-Ct
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:53:30 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b04268f1-e2ad-11f0-b15c-2bf370ae4941;
 Fri, 26 Dec 2025 23:53:28 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2a0d0788adaso67078725ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:53:27 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:53:24 -0800 (PST)
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
X-Inumbo-ID: b04268f1-e2ad-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789605; x=1767394405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YZZU/iwW88zjNDDGdCYX7IlRTUynqMqN8pEJHwT790=;
        b=LfQXH98IWg6eWSlBrYs5gEFyVKLRlWCx2f9Tq83W6bRrNIgp+zi77pseksI5PHuWZq
         iVSfvAUnWlvyyBGNvbx0vTWgcqJLwe4I2umDVHs2aNN29OgO7j8wkVXJd3gRyiPMFiFz
         ByWUwkvMqDBvi3AJUO8mNVPSQRpQ9BkWocOYYWMU3LNI/SZjFD1mAfGY/vJkY8py2ove
         nOm+d9FlomtVmkWM3PMfGaVhDXb5VVNEYk2PSJzzyTP3VghzTOohdygcb9CQKdEI50jx
         O7B3Qz/2HDiILM6qS4cxzPH69ykyHKoZRV1ETKkYxORoZdmAI4AX1/a/GlYYmNkIe7fo
         IgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789605; x=1767394405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6YZZU/iwW88zjNDDGdCYX7IlRTUynqMqN8pEJHwT790=;
        b=TxwjOC9bv3MGZHj9a13pbAdNpJILBYLdq4nUq2Zhdx9DP5QS8QUP9RLTx3ndyPz9bs
         eQ0Fum30iPFb0KexdEctfvhnpm+27yhrKh3F/i5e8udvBRZmhHi1hXZlkRsYmpAzYUlX
         ZeUB3doSKm0wUAnkMfZREPzHCcskq83hL0siFFj30MQUOuRivhR8z0NmEn+UhGI99DkX
         HY9yiPX3EIbg6C0vjNToJ4dZ8sf0crUi/v9MPSgNvWalHX0VF4+Zveja5hN9usX8WX2+
         VjHGUxmBweBjlJMflmVxL29p6WPrRDXBK6XNh85jdebQ4qj4Jf3lOkoicuRxCmxfrrYu
         GniA==
X-Forwarded-Encrypted: i=1; AJvYcCWKQDonNL1Nq80SnlwpCaXGLL3ju1fLmVIFNciXebIB0NUh43erwz5xCVSYaeJRdLzMvs7uJM6cxc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoyAB261woAcbfKvHDoLHwNT2KKNszIzPAnEHHT5bJzs6vARY3
	XpnX6wtDA6Kc30Q/rvzuMwzUhL9gdSwE6fuRRW0TW+YZKKDr2z1SxHGP
X-Gm-Gg: AY/fxX7FJ6ueyi1/Tscbcy4vW6WfqemQsc7yu+pOf7GBOdKgHzYKKumGTPF1zLh7ukT
	FSTtwqOdh1z2s4XDNNnM2/KfrufRJ4R4J4xKVYf/U/RRwujGNq8fjaUqtXQuwn6gaBz7PkSP0e3
	Hgc5YmnV6gj+7+ah0M7dkw9cXskiHmSKqa2rwwV15bHHVZuhd3JcAj38plNPNhfLKSF5dfdSyXE
	zHXiSMFGHxtkvkrAFqDqkzpWVDNg5jAMhAAkQU2dX9ju2UAjnyNbF9W1MBGkBKhOMOVD36Gh7JM
	X2mTPdgJhOm7KIl04eArgx3z5qSLMCOQHObj2IwmUsd83tAEZcMLUbBlQUsJrWyI8Mnw5Jxp3yO
	osvmE4Jl9ioeL+MERVWEyy4T+4fNSUxyvProFr5kULaTqybaYchogxzDF84wOy5m4pYU9t02ZVn
	yF3+Q9vMIDh6w/
X-Google-Smtp-Source: AGHT+IEPpw6k3H5B3GfQJ5gfoJrvfI68uwFervPMjcjEQdlc2KG+bnnPwgqGQJuYg9SuR5JsgGZOMA==
X-Received: by 2002:a17:902:da81:b0:2a1:c72:a41d with SMTP id d9443c01a7336-2a2f2940678mr262079485ad.40.1766789605397;
        Fri, 26 Dec 2025 14:53:25 -0800 (PST)
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
Subject: [PATCH v2 1/8] arm64: Provide dcache_by_myline_op_nosync helper
Date: Sat, 27 Dec 2025 11:52:41 +1300
Message-ID: <20251226225254.46197-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

dcache_by_myline_op ensures completion of the data cache operations for a
region, while dcache_by_myline_op_nosync only issues them without waiting.
This enables deferred synchronization so completion for multiple regions
can be handled together later.

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
 arch/arm64/include/asm/assembler.h  | 24 +++++++++++++++++++-----
 arch/arm64/kernel/relocate_kernel.S |  3 ++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index f0ca7196f6fa..b408ed61866f 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -371,14 +371,13 @@ alternative_endif
  * [start, end) with dcache line size explicitly provided.
  *
  * 	op:		operation passed to dc instruction
- * 	domain:		domain used in dsb instruction
  * 	start:          starting virtual address of the region
  * 	end:            end virtual address of the region
  *	linesz:		dcache line size
  * 	fixup:		optional label to branch to on user fault
  * 	Corrupts:       start, end, tmp
  */
-	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
+	.macro raw_dcache_by_myline_op op, start, end, linesz, tmp, fixup
 	sub	\tmp, \linesz, #1
 	bic	\start, \start, \tmp
 .Ldcache_op\@:
@@ -402,14 +401,13 @@ alternative_endif
 	add	\start, \start, \linesz
 	cmp	\start, \end
 	b.lo	.Ldcache_op\@
-	dsb	\domain
 
 	_cond_uaccess_extable .Ldcache_op\@, \fixup
 	.endm
 
 /*
  * Macro to perform a data cache maintenance for the interval
- * [start, end)
+ * [start, end) and wait for completion
  *
  * 	op:		operation passed to dc instruction
  * 	domain:		domain used in dsb instruction
@@ -420,7 +418,23 @@ alternative_endif
  */
 	.macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
 	dcache_line_size \tmp1, \tmp2
-	dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
+	raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
+	dsb \domain
+	.endm
+
+/*
+ * Macro to perform a data cache maintenance for the interval
+ * [start, end) without waiting for completion
+ *
+ * 	op:		operation passed to dc instruction
+ * 	start:          starting virtual address of the region
+ * 	end:            end virtual address of the region
+ * 	fixup:		optional label to branch to on user fault
+ * 	Corrupts:       start, end, tmp1, tmp2
+ */
+	.macro dcache_by_line_op_nosync op, start, end, tmp1, tmp2, fixup
+	dcache_line_size \tmp1, \tmp2
+	raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
 	.endm
 
 /*
diff --git a/arch/arm64/kernel/relocate_kernel.S b/arch/arm64/kernel/relocate_kernel.S
index 413f899e4ac6..71938eb3a3a3 100644
--- a/arch/arm64/kernel/relocate_kernel.S
+++ b/arch/arm64/kernel/relocate_kernel.S
@@ -64,7 +64,8 @@ SYM_CODE_START(arm64_relocate_new_kernel)
 	mov	x19, x13
 	copy_page x13, x12, x1, x2, x3, x4, x5, x6, x7, x8
 	add	x1, x19, #PAGE_SIZE
-	dcache_by_myline_op civac, sy, x19, x1, x15, x20
+	raw_dcache_by_myline_op civac, x19, x1, x15, x20
+	dsb	sy
 	b	.Lnext
 .Ltest_indirection:
 	tbz	x16, IND_INDIRECTION_BIT, .Ltest_destination
-- 
2.43.0


