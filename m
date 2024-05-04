Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C686B8C5C2F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721737.1125425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yax-0005Yc-Rd; Tue, 14 May 2024 20:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721737.1125425; Tue, 14 May 2024 20:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yax-0005Uj-MZ; Tue, 14 May 2024 20:17:55 +0000
Received: by outflank-mailman (input) for mailman id 721737;
 Tue, 14 May 2024 20:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yav-0002pZ-SY
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:53 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a60cb18-122f-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 22:17:52 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34da35cd01cso5610277f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:52 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a77easm14449404f8f.53.2024.05.14.13.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:49 -0700 (PDT)
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
X-Inumbo-ID: 0a60cb18-122f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717871; x=1716322671; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCSDJt2hMmc69IRlsT9xTwbRCbI4uAHpKe8NaeMrf5E=;
        b=npiz4V1TpPyr1NaX5wz9BTV8T9pLHHjIfnAH2dKAwKcNqlSZrxA3D6ZCCM3FGITpVU
         slb0f/EA5qyiW2lj99fX7DcTanYkUnkYsbzVe1eoHNDrI0W9DHQprj6arqFK3/bXigw4
         QiDQ2ihN1AV9DG6F5PF5BHNo+rBXKteVcRFUtRSvdkzHYjP1ea3dE+sOxiS7a138aW0h
         ssvGPeDGA9hrwCcHThy37Xc3r3I3/W3aP5bfONZNzhe1JlHoCkltUJQdHiY1LZ/Qw0Ob
         Qbhq7jiQQKvNaQjZtYcDDz9kw4c0w+o3NJsI7ZdvhleofMMRbPnObKu5QWD9pX2HOZFm
         FfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717871; x=1716322671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCSDJt2hMmc69IRlsT9xTwbRCbI4uAHpKe8NaeMrf5E=;
        b=eWHRYPmYD+lEj3DNGuLLo3VedDAKehUKU6eZFRYQrp+lTtcsf1RqZY9xGEFc7WMKkI
         HzDVvlTVjwS9+RrB0QwY98SPr/2mPuBHcprlfc2td0frnRCBdnyLQ7pyMea0LyQowkbl
         JcpxCQT5qZo5IHgEHxTMD0FtK6cFzYrzjsEBqrYW17eoP9DOAOHE2dUB12kLHyo9328b
         Dh76LqvoJLqXOkUZ0UT9Y4NZ1fGaAXl4O7bLpxCbBMJ6gi0oh0fUZin814t9fckJcQrV
         YFNOO4YF0vx6/IaifskKvL//P65S8qPLfGsc/Qru+y94l8TB7O6F3K/1NkAB8PkamYxK
         uveg==
X-Gm-Message-State: AOJu0YwC5w3Ga9MGDOpkp85sr3FAZ6utBQ1OaO7aovpv4Rk5qp5zTbVQ
	Hr3l+127ZIShBCJNu6dNwCgUxqpVdHeT5DuLow8yKY8/WgAuGWsd6aZ97M9+8rg=
X-Google-Smtp-Source: AGHT+IEuJF3MSyUJ1H11afBcmSASfkLnxpTxrxB73BUnHkVzyKDDCPRiRj69qmBLVG/4AN8MGtvEBQ==
X-Received: by 2002:a5d:5908:0:b0:34e:93c1:7979 with SMTP id ffacd0b85a97d-3504a73e607mr10716553f8f.38.1715717870752;
        Tue, 14 May 2024 13:17:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 9/9] xen/arm64: lib: Use the generic xen/linkage.h macros
Date: Sat,  4 May 2024 13:55:14 +0200
Message-Id: <20240504115514.1063509-10-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/arm64/lib/memchr.S  | 4 ++--
 xen/arch/arm/arm64/lib/memcmp.S  | 4 ++--
 xen/arch/arm/arm64/lib/memcpy.S  | 4 ++--
 xen/arch/arm/arm64/lib/memmove.S | 4 ++--
 xen/arch/arm/arm64/lib/memset.S  | 4 ++--
 xen/arch/arm/arm64/lib/strchr.S  | 4 ++--
 xen/arch/arm/arm64/lib/strcmp.S  | 4 ++--
 xen/arch/arm/arm64/lib/strlen.S  | 4 ++--
 xen/arch/arm/arm64/lib/strncmp.S | 4 ++--
 xen/arch/arm/arm64/lib/strnlen.S | 4 ++--
 xen/arch/arm/arm64/lib/strrchr.S | 4 ++--
 11 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/memchr.S b/xen/arch/arm/arm64/lib/memchr.S
index 81f113bb1c..3d8aeca3ca 100644
--- a/xen/arch/arm/arm64/lib/memchr.S
+++ b/xen/arch/arm/arm64/lib/memchr.S
@@ -29,7 +29,7 @@
  * Returns:
  *	x0 - address of first occurrence of 'c' or 0
  */
-ENTRY(memchr)
+FUNC(memchr)
 	and	w1, w1, #0xff
 1:	subs	x2, x2, #1
 	b.mi	2f
@@ -40,4 +40,4 @@ ENTRY(memchr)
 	ret
 2:	mov	x0, #0
 	ret
-ENDPROC(memchr)
+END(memchr)
diff --git a/xen/arch/arm/arm64/lib/memcmp.S b/xen/arch/arm/arm64/lib/memcmp.S
index 87c2537ffe..d77dd4ce52 100644
--- a/xen/arch/arm/arm64/lib/memcmp.S
+++ b/xen/arch/arm/arm64/lib/memcmp.S
@@ -57,7 +57,7 @@ pos		.req	x11
 limit_wd	.req	x12
 mask		.req	x13
 
-ENTRY(memcmp)
+FUNC(memcmp)
 	cbz	limit, .Lret0
 	eor	tmp1, src1, src2
 	tst	tmp1, #7
@@ -254,4 +254,4 @@ CPU_LE( rev	data2, data2 )
 .Lret0:
 	mov	result, #0
 	ret
-ENDPROC(memcmp)
+END(memcmp)
diff --git a/xen/arch/arm/arm64/lib/memcpy.S b/xen/arch/arm/arm64/lib/memcpy.S
index d90d20ef3e..1e04b79010 100644
--- a/xen/arch/arm/arm64/lib/memcpy.S
+++ b/xen/arch/arm/arm64/lib/memcpy.S
@@ -55,7 +55,7 @@ C_h	.req	x12
 D_l	.req	x13
 D_h	.req	x14
 
-ENTRY(memcpy)
+FUNC(memcpy)
 	mov	dst, dstin
 	cmp	count, #16
 	/*When memory length is less than 16, the accessed are not aligned.*/
@@ -197,4 +197,4 @@ ENTRY(memcpy)
 	tst	count, #0x3f
 	b.ne	.Ltail63
 	ret
-ENDPROC(memcpy)
+END(memcpy)
diff --git a/xen/arch/arm/arm64/lib/memmove.S b/xen/arch/arm/arm64/lib/memmove.S
index a49de845d0..14438dbe9c 100644
--- a/xen/arch/arm/arm64/lib/memmove.S
+++ b/xen/arch/arm/arm64/lib/memmove.S
@@ -56,7 +56,7 @@ C_h	.req	x12
 D_l	.req	x13
 D_h	.req	x14
 
-ENTRY(memmove)
+FUNC(memmove)
 	cmp	dstin, src
 	b.lo	memcpy
 	add	tmp1, src, count
@@ -193,4 +193,4 @@ ENTRY(memmove)
 	tst	count, #0x3f
 	b.ne	.Ltail63
 	ret
-ENDPROC(memmove)
+END(memmove)
diff --git a/xen/arch/arm/arm64/lib/memset.S b/xen/arch/arm/arm64/lib/memset.S
index 5bf751521b..367fa60175 100644
--- a/xen/arch/arm/arm64/lib/memset.S
+++ b/xen/arch/arm/arm64/lib/memset.S
@@ -53,7 +53,7 @@ dst		.req	x8
 tmp3w		.req	w9
 tmp3		.req	x9
 
-ENTRY(memset)
+FUNC(memset)
 	mov	dst, dstin	/* Preserve return value.  */
 	and	A_lw, val, #255
 	orr	A_lw, A_lw, A_lw, lsl #8
@@ -212,4 +212,4 @@ ENTRY(memset)
 	ands	count, count, zva_bits_x
 	b.ne	.Ltail_maybe_long
 	ret
-ENDPROC(memset)
+END(memset)
diff --git a/xen/arch/arm/arm64/lib/strchr.S b/xen/arch/arm/arm64/lib/strchr.S
index 0506b0ff7f..83fd81e8ef 100644
--- a/xen/arch/arm/arm64/lib/strchr.S
+++ b/xen/arch/arm/arm64/lib/strchr.S
@@ -27,7 +27,7 @@
  * Returns:
  *	x0 - address of first occurrence of 'c' or 0
  */
-ENTRY(strchr)
+FUNC(strchr)
 	and	w1, w1, #0xff
 1:	ldrb	w2, [x0], #1
 	cmp	w2, w1
@@ -37,4 +37,4 @@ ENTRY(strchr)
 	cmp	w2, w1
 	csel	x0, x0, xzr, eq
 	ret
-ENDPROC(strchr)
+END(strchr)
diff --git a/xen/arch/arm/arm64/lib/strcmp.S b/xen/arch/arm/arm64/lib/strcmp.S
index c6f42dd255..7677108e26 100644
--- a/xen/arch/arm/arm64/lib/strcmp.S
+++ b/xen/arch/arm/arm64/lib/strcmp.S
@@ -59,7 +59,7 @@ tmp3		.req	x9
 zeroones	.req	x10
 pos		.req	x11
 
-ENTRY(strcmp)
+FUNC(strcmp)
 	eor	tmp1, src1, src2
 	mov	zeroones, #REP8_01
 	tst	tmp1, #7
@@ -230,4 +230,4 @@ CPU_BE(	orr	syndrome, diff, has_nul )
 	lsr	data1, data1, #56
 	sub	result, data1, data2, lsr #56
 	ret
-ENDPROC(strcmp)
+END(strcmp)
diff --git a/xen/arch/arm/arm64/lib/strlen.S b/xen/arch/arm/arm64/lib/strlen.S
index fb6aaf1a6a..10feedaf81 100644
--- a/xen/arch/arm/arm64/lib/strlen.S
+++ b/xen/arch/arm/arm64/lib/strlen.S
@@ -56,7 +56,7 @@ pos		.req	x12
 #define REP8_7f 0x7f7f7f7f7f7f7f7f
 #define REP8_80 0x8080808080808080
 
-ENTRY(strlen)
+FUNC(strlen)
 	mov	zeroones, #REP8_01
 	bic	src, srcin, #15
 	ands	tmp1, srcin, #15
@@ -123,4 +123,4 @@ CPU_LE( lsr	tmp2, tmp2, tmp1 )	/* Shift (tmp1 & 63).  */
 	csinv	data1, data1, xzr, le
 	csel	data2, data2, data2a, le
 	b	.Lrealigned
-ENDPROC(strlen)
+END(strlen)
diff --git a/xen/arch/arm/arm64/lib/strncmp.S b/xen/arch/arm/arm64/lib/strncmp.S
index a4a0f779f5..c00a641fc7 100644
--- a/xen/arch/arm/arm64/lib/strncmp.S
+++ b/xen/arch/arm/arm64/lib/strncmp.S
@@ -64,7 +64,7 @@ limit_wd	.req	x13
 mask		.req	x14
 endloop		.req	x15
 
-ENTRY(strncmp)
+FUNC(strncmp)
 	cbz	limit, .Lret0
 	eor	tmp1, src1, src2
 	mov	zeroones, #REP8_01
@@ -307,4 +307,4 @@ CPU_BE( orr	syndrome, diff, has_nul )
 .Lret0:
 	mov	result, #0
 	ret
-ENDPROC(strncmp)
+END(strncmp)
diff --git a/xen/arch/arm/arm64/lib/strnlen.S b/xen/arch/arm/arm64/lib/strnlen.S
index 81c8e8b54e..2059ba782c 100644
--- a/xen/arch/arm/arm64/lib/strnlen.S
+++ b/xen/arch/arm/arm64/lib/strnlen.S
@@ -59,7 +59,7 @@ limit_wd	.req	x14
 #define REP8_7f 0x7f7f7f7f7f7f7f7f
 #define REP8_80 0x8080808080808080
 
-ENTRY(strnlen)
+FUNC(strnlen)
 	cbz	limit, .Lhit_limit
 	mov	zeroones, #REP8_01
 	bic	src, srcin, #15
@@ -168,4 +168,4 @@ CPU_LE( lsr	tmp2, tmp2, tmp4 )	/* Shift (tmp1 & 63).  */
 .Lhit_limit:
 	mov	len, limit
 	ret
-ENDPROC(strnlen)
+END(strnlen)
diff --git a/xen/arch/arm/arm64/lib/strrchr.S b/xen/arch/arm/arm64/lib/strrchr.S
index 07059983f8..81033c0822 100644
--- a/xen/arch/arm/arm64/lib/strrchr.S
+++ b/xen/arch/arm/arm64/lib/strrchr.S
@@ -26,7 +26,7 @@
  * Returns:
  *	x0 - address of last occurrence of 'c' or 0
  */
-ENTRY(strrchr)
+FUNC(strrchr)
 	mov	x3, #0
 	and	w1, w1, #0xff
 1:	ldrb	w2, [x0], #1
@@ -37,4 +37,4 @@ ENTRY(strrchr)
 	b	1b
 2:	mov	x0, x3
 	ret
-ENDPROC(strrchr)
+END(strrchr)
-- 
2.40.1


