Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D744CDCE9B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192958.1512048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH7-0005FR-P7; Wed, 24 Dec 2025 17:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192958.1512048; Wed, 24 Dec 2025 17:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH7-00057M-J6; Wed, 24 Dec 2025 17:03:49 +0000
Received: by outflank-mailman (input) for mailman id 1192958;
 Wed, 24 Dec 2025 17:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH5-0003CV-TU
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:47 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82f9be44-e0ea-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 18:03:47 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64b9230f564so6920102a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:47 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:46 -0800 (PST)
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
X-Inumbo-ID: 82f9be44-e0ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595827; x=1767200627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oxTmuSNbGknJOIWam5SQOKhN8ri960Ne582GEFVsMM=;
        b=WBFp+MejlcxPEu5iX2a9/1QxrXitFgaQp8+v4VYhsB7mfsrAoqLUn8nc4k8+mNybNz
         n5FHjL31C3CxKJd04/jZDjWtcAtsCHtAITFdB8DdmAu95yRB/SV9YI+/4ieTXC3UBqw8
         I64ng9JDLrOZ/sNVwyHGaGwOzlCi6Dts56azHM7dqo6/SWWsNfAHjZOmzkOMGlpBsbNs
         LPu0s1r8vAwkJxTvH2G5wm9wd4QKHqZLFXEjdEMrewP3exh0Eh0AiGc13gCoLE/oNMPZ
         Q9ZRZ7ZrrvNf8Ls2DJS+5DcL2K9NQhMQMGRta+91UwZsYKbaFmitZSGQaJ6JLt29Ki0x
         3kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595827; x=1767200627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2oxTmuSNbGknJOIWam5SQOKhN8ri960Ne582GEFVsMM=;
        b=ItFOWWw8JXEny6GuA10t7c41PMBoz8WTfzG5iLKKpjMbCZ3io1i1IB9bvj+6sX3Oik
         EZp6rxxJWQ6W+Yr+0chSYph9p5TZxuE/nvEQD8Pyy8zTMWMPC0f6VCHdMykUXZIZZ3ZA
         P50Wepkfw+nfWf1GPMewNpV6hItA6F8x1mPLFuYLyCvfxBt21Fum31TsHqzhv04xOVe6
         UrvoOmx8EoERIHp4VA7+gBQprRSdb31lj8ebA7dhJrLxfr1M0EShUBHNiA5SYkEBLQRV
         o2q4f/2AwWrvGT5pTd6Mjz7/thIgEljiu4wu5lfLRPlNq84A3iUxTV4RSA0hbFfktKXG
         CoNw==
X-Gm-Message-State: AOJu0Yw3DufBGAFO9KtPhqeg51MBtO6xZx1w0eqB3dxhrcPHBxnMHSbr
	TSSz4Qh29T9p+eUuDXKW51QZOTEyKDR1jhEljVR5UoDwp3mdp8OQiw649Bw0BQ==
X-Gm-Gg: AY/fxX4YCO8du3VeLAPdjJHIKMQHf/Z3YGUQNFy4jmMu9g+TYy9sfnnTd9ScM1oKl8N
	zIB/V+24PwMDxTYcAxTdUa1qmxDhyObGPUqLKt8NFrrdQ1Hx5/VB9wNSnN4ZEi7VUn1HWJgCT46
	aKMXe43sN6CRElNUH+b4boJwLrtj35n2zx+/RCD1SY3cPRSXfW6MNgmgQlJ3Wo5+/9FU7LwsI30
	/pKfmPToJTLO9MFMHs7xcQaTswaiSdKo3B/aj+wt/VFvZbG7DUdZ+UUUo/bT+WslD9IT/8QT1Mo
	mEI6CM9Fsyjz850w+uJcsiN4GNpBSZGCTcPtPU4hMlIXCHaTjxrcXCgtV3wx6pLn4CkcPhCQeqn
	0rNAVzeZSESBgGu+FaR7wGx1mtSxWnFJNfwqCCAqwnOB8hLOZLCRievnbfQpis6caUcqwai444q
	DKortep9dfdHu2kwbbig3yKxpF3FPMCrzWi4oIbyTPwPLQ/tSK0LYzd5FRU+kURqA4oQ==
X-Google-Smtp-Source: AGHT+IF9n4wrdQHHFlIxEhxL5KnGCIoX4DKXTBGq6kQ9H7BVz9NiSLos6Vc2q4neRXUgjTMfN2mSTg==
X-Received: by 2002:a17:907:608d:b0:b76:f57a:b0a7 with SMTP id a640c23a62f3a-b803705129emr2171318066b.31.1766595826555;
        Wed, 24 Dec 2025 09:03:46 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 11/15] xen/riscv: introduce ns_to_ticks()
Date: Wed, 24 Dec 2025 18:03:24 +0100
Message-ID: <e4e36ed2d02b760c925014db986041b82fd9b943.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/time.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 63bdd471ccac..3d013a3ace0f 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -29,6 +29,11 @@ static inline s_time_t ticks_to_ns(uint64_t ticks)
     return muldiv64(ticks, MILLISECS(1), cpu_khz);
 }
 
+static inline uint64_t ns_to_ticks(s_time_t ns)
+{
+    return muldiv64(ns, cpu_khz, MILLISECS(1));
+}
+
 void preinit_xen_time(void);
 
 #endif /* ASM__RISCV__TIME_H */
-- 
2.52.0


