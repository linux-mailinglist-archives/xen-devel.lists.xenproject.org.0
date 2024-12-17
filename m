Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066309F511C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859437.1271586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVJ-0001t5-Ue; Tue, 17 Dec 2024 16:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859437.1271586; Tue, 17 Dec 2024 16:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVJ-0001oA-QH; Tue, 17 Dec 2024 16:33:01 +0000
Received: by outflank-mailman (input) for mailman id 859437;
 Tue, 17 Dec 2024 16:33:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVI-0001J8-4n
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:33:00 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92d7d980-bc94-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:32:57 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3003e203acaso52208471fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:32:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:32:56 -0800 (PST)
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
X-Inumbo-ID: 92d7d980-bc94-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453177; x=1735057977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8fF4Ot/dFUzo2CoSRWH7wpyHlIxb6JWOqFio7Z7p/Y=;
        b=RgCZW4OaMBMl0hdncO/Lr2SI6Q1JTXTsOFdAS/A7zB4Ptp6zoe5YFlBVtqvJ42kR99
         Z2aj0Mz6xq86BBS3warbQG7r+8PjLOehRvp+n+3ItY0OTaBSjgYWcYJsM41nFRy4qNvT
         05ZQ6JedesrtgD0naA8pWB70PwHGB06bWPZlmZj+U9HhH09UqdzFTtmWggQYcpybUNAE
         FxJVgpxCnAHrpSPvgDNjjVITCSPTDuliknRjMeK/h7Nj7zYd5h7NIYRpGTMOvAKOoI3Q
         9MmNyjnqTvL2pFXhU8z+72tt7I+twYua7ptWjSi9L9CPj/j8lI8TJXa3lQXXxONNZG5y
         xBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453177; x=1735057977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8fF4Ot/dFUzo2CoSRWH7wpyHlIxb6JWOqFio7Z7p/Y=;
        b=LBlenSV3de/7K9FnCVefNoSL+jdYtu9HAybEGmhE4I0W4WSOsRzfjwLZ7LS8RGeXX/
         gH/jSOrdFG1YNWAh5i5oDguMkX3NOB+fmWWE3I506GiPoRrPXswV/cSWVwQRe6hiW84i
         d66jcjkXi6/WhGECULwYlL+m+uc3fazU/WTqLCQvpImfhdd2OgnJdWsJwIW3T9iLQK5A
         rzwEaCtW5eqcONIqlE96/u5loc3i12cyU9EiWBE0zb87crug/j3LSgUCgYeDV0JRewH5
         jEePb52KyVIK1MpcheGpzxka4J4PSjlHuKz/inMax3VrPrJDBrw6iLqlpSj3MdEX1Q8E
         XT3w==
X-Gm-Message-State: AOJu0Yy20qqWxO2PmbWji8ayeS0zVehLqVMxwfc/KCVvd4o1fjizVwe1
	fxB6KcGnvhicR2HNtg8OBT8tNVcIisdjpg7wFe019vjkPLijoF5kCi0PxZlc
X-Gm-Gg: ASbGncvm802dhAQte35wM1JBg9AMm8F0OKW0rS37zsyV0UmJUpMvhIeT70pkExWOVW7
	IfOWU/LengzHdQ4N730jQqWdzDMLgikttMGxbtyZR3zlvkJo/bAeVVcmtGjVcfAXBsVfp+HRFLE
	DyGcnGATv8mtVSQiz86Hs/cTq1VLwY5f2yQt+Np7FUqw3mxv/D1VranjYMwXl+Uxf6uon9WyFCC
	KQKLqnR2zbLj/dPBANgXEg4N05yLkL0G+501Nt6tse3bJ1V1Vt/68C0kA==
X-Google-Smtp-Source: AGHT+IH2JOIKtRnNsomRm3tKEqH8lmP6boS2Fzn0jxvAbIOolpLhsFdfZkCNLix1IEEMZA1IFzEC0w==
X-Received: by 2002:a2e:a9a6:0:b0:302:1d7a:e09 with SMTP id 38308e7fff4ca-3044d29d399mr258061fa.31.1734453176861;
        Tue, 17 Dec 2024 08:32:56 -0800 (PST)
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
Subject: [PATCH v3 2/7] xen/riscv: add destroy_xen_mappings() to remove mappings in Xen page tables
Date: Tue, 17 Dec 2024 17:32:46 +0100
Message-ID: <35f03b576d8423ca5b8764fdfe3251836f7b4a9a.1734452721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the destroy_xen_mappings() function, which removes page
mappings in Xen's page tables between a start address s and an end
address e.
The function ensures that both s and e are page-aligned
and verifies that the start address is less than or equal to the end
address before calling pt_update() to invalidate the mappings.
The pt_update() function is called with INVALID_MFN and PTE_VALID=0
in the flags, which tell pt_update() to remove mapping. No additional
ASSERT() is required to check these arguments, as they are hardcoded in
the call to pt_update() within destroy_xen_mappings().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Fix code style: drop blanks in condition part of ternary operation.
---
Changes in V2:
 - Drop ASSERT(s <= e).
 - Update implementation of destroy_xen_mappings() to avoid calling of
   pt_update() when start_addr >= end_addr and return -EINVAL.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/mm.c | 6 ------
 xen/arch/riscv/pt.c | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 9359dc7f33..f2bf279bac 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -360,12 +360,6 @@ int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
     return 0;
 }
 
-int destroy_xen_mappings(unsigned long s, unsigned long e)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
-
 void share_xen_page_with_guest(struct page_info *page, struct domain *d,
                                enum XENSHARE_flags flags)
 {
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index d62aceb36c..2ca23206f4 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
     return pt_update(virt, mfn, nr_mfns, flags);
 }
 
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+
+    return (s < e) ? pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0) : -EINVAL;
+}
+
 int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
-- 
2.47.1


