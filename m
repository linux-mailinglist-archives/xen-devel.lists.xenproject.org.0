Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8E9C6377
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 22:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834976.1250803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyW3-0007X7-PQ; Tue, 12 Nov 2024 21:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834976.1250803; Tue, 12 Nov 2024 21:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyW3-0007Vd-MP; Tue, 12 Nov 2024 21:33:39 +0000
Received: by outflank-mailman (input) for mailman id 834976;
 Tue, 12 Nov 2024 21:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAyW2-0007VX-EB
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 21:33:38 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f0b783-a13d-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 22:33:32 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so1056798366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 13:33:32 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e0fb98sm759907766b.176.2024.11.12.13.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 13:33:29 -0800 (PST)
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
X-Inumbo-ID: c3f0b783-a13d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMzZjBiNzgzLWExM2QtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDQ3MjEyLjYwMzM0OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731447210; x=1732052010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KK73VGCcmlY58RQWioRCWj7eHOazl+wEL6m61+SHsoc=;
        b=iqmQhuwJf0xXdZl9XpoUzYOHgkWgy4IG3GnmxdNWz6wJJoQvlqHcerVSSdDRxaQbCQ
         H7Hy+kmp3AHH6GCdOtsfz7QFD1m2Y6ytOmF6ozhYEYBQ2kUFN4etAaVDv7721JXfPLbC
         paKnBf5lWiE/U+YhE7ds82iFG1wCqMC34ugrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731447210; x=1732052010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KK73VGCcmlY58RQWioRCWj7eHOazl+wEL6m61+SHsoc=;
        b=afA9abo8DnLvTGSuL1SASpYu7/cBAlHk2Sq8exS6bp1+8L3+7UAl9jJjNSDtFvToO9
         +D9zugGkZv2v1QWr3GPoKGFbU+gJDFxZAwk95KKadiB9/PnVHXMMb6X1t2vaYIVv5yf9
         hyc8gvOfj6oXBR2mX95KzWKRuz9HKEPxHEC/HUkpMpy2+vSWcpBlBDtCiT0LqogzsPDs
         DXmyPdhdQYxM8Kbf87Lc/s8cMEKlrXuXaHuNY+FtpIkMWsUgxDWTdf7M1AK3FAYwhoPj
         +tb476pSbe+xoLjGNzQ3UI944UfOMBbUbi0ZS5ZLsQznz06EJ7qMDAwxbRYq7MBrFx3V
         04WQ==
X-Gm-Message-State: AOJu0YzbULJ7+3qVFLmdbQz+qwGy54nWXhQOmaZcaUADhWqnkOl07q+k
	Zp6n910pjxZy8kW7F3m9kmUoaYUZZFln2vp7Lug/rVWBVMXcPArtvep8k8IBuOYyt/zroeA8Ix9
	2
X-Google-Smtp-Source: AGHT+IGAnRcEIkA4BIwt3BEty2U/KMuK1asgE3ULsVYSSZHp0A+wMqMK2732YMnWyA+E9TVyKiX47g==
X-Received: by 2002:a17:907:26c2:b0:a9e:c442:2c15 with SMTP id a640c23a62f3a-a9eefff1869mr1843926766b.38.1731447209938;
        Tue, 12 Nov 2024 13:33:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] x86/e820: Fix parameter names of reserve_e820_ram()/e820_change_range_type()
Date: Tue, 12 Nov 2024 21:33:27 +0000
Message-Id: <20241112213327.1474541-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The work to address Rule 5.3 introduced violations of Rule 8.3 by failing to
rename the parameters in the declaration.

Fixes: b5fd405aa381 ("x86/e820 address violations of MISRA C:2012 Rule 5.3")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
---
 xen/arch/x86/include/asm/e820.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index af90085d65d1..8e7644f8870b 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -25,9 +25,9 @@ struct e820map {
 
 extern int sanitize_e820_map(struct e820entry *biosmap, unsigned int *pnr_map);
 extern int e820_all_mapped(u64 start, u64 end, unsigned type);
-extern int reserve_e820_ram(struct e820map *e820, uint64_t s, uint64_t e);
+extern int reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
 extern int e820_change_range_type(
-    struct e820map *e820, uint64_t s, uint64_t e,
+    struct e820map *map, uint64_t s, uint64_t e,
     uint32_t orig_type, uint32_t new_type);
 extern int e820_add_range(uint64_t s, uint64_t e, uint32_t type);
 extern unsigned long init_e820(const char *str, struct e820map *raw);

base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca
-- 
2.39.5


