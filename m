Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28FCDFD5A
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193516.1512204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC5-00075x-UV; Sat, 27 Dec 2025 14:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193516.1512204; Sat, 27 Dec 2025 14:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVC5-00071v-OK; Sat, 27 Dec 2025 14:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1193516;
 Fri, 26 Dec 2025 22:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/ld=7A=gmail.com=21cnbao@srs-se1.protection.inumbo.net>)
 id 1vZGgh-0005LS-Ed
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 22:53:35 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4a835ac-e2ad-11f0-b15c-2bf370ae4941;
 Fri, 26 Dec 2025 23:53:34 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2a0eaf55d58so49804625ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Dec 2025 14:53:34 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 14:53:32 -0800 (PST)
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
X-Inumbo-ID: b4a835ac-e2ad-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789613; x=1767394413; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ietD9HqJ7J3E+f0491dnZq0rlaTb/buis2UihkMu59I=;
        b=i+E7Eio6v+/1w81qhPQ1izZ67OWB0thOdDH8tGOAjtv/3g74RUFmUh5+16EGuVPYq+
         GDkOJS61rlmpGu6QYm6d7jNYwNtminXUQClteqJGvNlqJhzHjJwyU4BIKG9qHKb9R3Z2
         EeOluRM80IKjuZWrOZs2ukQgNK0Vh1yQFael+0nMhv6VElCD5Nzip4cssPoTakWydzTe
         DG0SCtDS5/A1ngtwiAcPUdVMECrcu/GEACSVeTd+9Pkyn4S4KTDrUxeoTJ8x7ZUWH2fO
         L3UE0tfQC+TVJ4+9sIiIiM93PjglcAbpxtEQtk5SNHROYnZcB4gBhKlY93aqXvvHgqU8
         xlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789613; x=1767394413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ietD9HqJ7J3E+f0491dnZq0rlaTb/buis2UihkMu59I=;
        b=imkrCSLKUuMIg3AmbbAdO1yl89DpPWg/ezTWKeBLxy5V/npPFNckcPSSmueH2N7Qv6
         oKBcFSUZZDUNOvweyzRzr8EK9F905yeSh1n3Nv4KJl9Gf2Fpk5ZWUVRP3rhueZfxuGHh
         60jS1kaacx1F4tHIbKeSaHSHqorfDglHU9dSy+aMHmgo+Zw26ktIR/2iYvrYmFEss+96
         W5kGDK3iGHfK1uUOJ/jLuq8kHyQDfOCYe5CJnyEy2g50YDLfWAgND49O6fKDnmQptOm+
         2qYvVlWdQ1SkXczrgvaQN5xdZ2ERVBGFLLrGJXKpgufyPkVAeTa1fPEZBmSWU6DDP+ky
         ObFw==
X-Forwarded-Encrypted: i=1; AJvYcCUr2iCVuOT6iCVWkME3X6uP8a+AbTAVVR5bw2DS4tBXE5ZY75gsKtZ6WN58NSFgKniLUMOtDbZrh+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX5uisfBVZdsQdzkmeL29+rxmboIdZWcjZxjPCGMQUm3MeDref
	vsz8hnzY0iwvLK1SNmmWaXFcAAOEhty7nneobY3qUNCvy0HDYy3iCPUP
X-Gm-Gg: AY/fxX6Gu2v7WSHesOWAL3tW/oPt2EHFhvP8jMvvmiRLQO+ezKEGPO9FWVr79l2Na4t
	lVXN0LwTWU9oc4Y3kRds+ecQLkvRRyaOGk4zNHfeQhHpY1hpX6amDuwVyHWX3Gis/MsltfVmyNL
	cKD75oA3AK+g0wiJLwkghkE55HSXlCCeBlkgIyouE/TZ6mdef4s95Jm1gQWDydCCWouEO/X4Kxm
	75oUXeqw68q2YdVPlZkw6qICOGjII9iD/GLX8OzRFOLB88o9qU+KJp0pDRmgfjBrgIXy1kyydDL
	KkFodjNStTU/snOE6atpbdyW3sytuBNgPVo7OIOBMrsJ3HNLSCiLrw29KgW9/aNkKesaddPJoCp
	NhuUWuCBH3sNGI3HeBeZ1Wc7fJgg93j29U6q7ebNNEg9njxIG/CJ9VJV5Ujl4QYAlpyDO8UQ5MN
	wNCW5m8iS+v9X/
X-Google-Smtp-Source: AGHT+IE9oZQXckIJDcXvuEcMulX/ZaTRdgyK2lgHN5sr4Zh2/8KW3byPESPfAHlQDRzMXfnr9Ddibw==
X-Received: by 2002:a17:90b:2b46:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-34e90d6d322mr21171859a91.8.1766789612867;
        Fri, 26 Dec 2025 14:53:32 -0800 (PST)
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
Subject: [PATCH v2 2/8] arm64: Provide dcache_clean_poc_nosync helper
Date: Sat, 27 Dec 2025 11:52:42 +1300
Message-ID: <20251226225254.46197-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

dcache_clean_poc_nosync does not wait for the data cache clean to
complete. Later, we wait for completion of all scatter-gather entries
together.

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
 arch/arm64/mm/cache.S               | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 28ab96e808ef..9b6d0a62cf3d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
 extern long caches_clean_inval_user_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 503567c864fd..4a7c7e03785d 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -178,6 +178,21 @@ SYM_FUNC_START(__pi_dcache_clean_poc)
 SYM_FUNC_END(__pi_dcache_clean_poc)
 SYM_FUNC_ALIAS(dcache_clean_poc, __pi_dcache_clean_poc)
 
+/*
+ *	dcache_clean_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end).
+ * 	not necessarily cleaned to the PoC till an explicit dsb sy afterward.
+ *
+ *	- start   - virtual start address of region
+ *	- end     - virtual end address of region
+ */
+SYM_FUNC_START(__pi_dcache_clean_poc_nosync)
+	dcache_by_line_op_nosync cvac, x0, x1, x2, x3
+	ret
+SYM_FUNC_END(__pi_dcache_clean_poc_nosync)
+SYM_FUNC_ALIAS(dcache_clean_poc_nosync, __pi_dcache_clean_poc_nosync)
+
 /*
  *	dcache_clean_pop(start, end)
  *
-- 
2.43.0


