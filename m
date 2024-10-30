Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703909B6065
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828042.1242845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66Bm-00011c-Pz; Wed, 30 Oct 2024 10:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828042.1242845; Wed, 30 Oct 2024 10:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66Bm-0000uM-Mt; Wed, 30 Oct 2024 10:44:34 +0000
Received: by outflank-mailman (input) for mailman id 828042;
 Wed, 30 Oct 2024 10:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXHf=R2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t66Bl-0000rj-PM
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:44:33 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f126811d-96ab-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:44:30 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb6110c8faso61633221fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:44:30 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629f3c8sm4674107a12.37.2024.10.30.03.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 03:44:27 -0700 (PDT)
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
X-Inumbo-ID: f126811d-96ab-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmYiLCJoZWxvIjoibWFpbC1sajEteDIyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYxMjY4MTFkLTk2YWItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg1MDcwLjE5OTQxMywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730285069; x=1730889869; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3+1hK/hSpl0jxie1PIVrii3O1vEIeG8EleIH9bDgDE=;
        b=E73DznzTawVLIhSUJQ9U4fzoFGGw9xncwq3iWhsCvs1YJRnVXxANSxK9mkL4xwUihZ
         Sr/pROi7QkIRfrQqymxjM99Jadv3S9BEcJEhLfed3/hBBCuSir68kfpfaxAVeLOyqwzx
         vtLHIS/37ELyKvoX9WFQBsElFQFFE9B/woVYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730285069; x=1730889869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3+1hK/hSpl0jxie1PIVrii3O1vEIeG8EleIH9bDgDE=;
        b=v4XbUW3gbN00f06g/6U5mQBtOtvIRjMTzVn6mDnrpW9VYL5B1ai/uxDS3dMnAYgoFk
         ibQK/iGw1KksM9pZlr7ngWR9JguB1eYjmrRSFT4oLoRxbCfIH+HTD14c8ue/3Nv9QrPm
         hXTqWNAW3V54QpRGrjruyuWuy43MukXBdA5mbFn3rA3ckeHIoPcLLQGS/d0+auGjslHV
         6WqSw4j8HteFALepCG8MckfOil4IyzruGNCn8JB3AW4wRNgj4jnNd3HFpz3pCKRxLOO2
         Xl4abRKaaBm/kRSTU3Bgy3GLYoEHCvzbef4AklEKyk35/zllIVIAIjV5VAh9stCA8OHx
         LIuA==
X-Gm-Message-State: AOJu0Ywy8c8yoJA0RrgvQx9Zy+05rg5Fco7U0onFEAeuKppm294Nfkrj
	Pv/ybl+cFbOrbrBRAC/ClqfyawnfZj+5ry4SYDKhX+utX46Z/9FlXsuJ6rBupCYv0jIV31W10OO
	0
X-Google-Smtp-Source: AGHT+IHTTXGIdvapWw2pNUDGaHygAoq/K39BBa6akhg1q2F6bZAAp7feRII5bWFlIw4aBDF/d0AYKw==
X-Received: by 2002:a2e:b8c3:0:b0:2fb:382e:410f with SMTP id 38308e7fff4ca-2fcbdfdb11cmr68969671fa.26.1730285069147;
        Wed, 30 Oct 2024 03:44:29 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/mm: Use standard C types for sized integers
Date: Wed, 30 Oct 2024 10:44:06 +0000
Message-Id: <20241030104406.2173357-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is already using these types.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/mm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 2a837f3d59..71a29b2cb3 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -230,7 +230,7 @@ struct page_info
          * Only valid for: a) free pages, and b) pages with zero type count
          * (except page table pages when the guest is in shadow mode).
          */
-        u32 tlbflush_timestamp;
+        uint32_t tlbflush_timestamp;
 
         /*
          * When PGT_partial is true then the first two fields are valid and
@@ -284,8 +284,8 @@ struct page_info
          *   in use.
          */
         struct {
-            u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
-            u16 :16 - PAGETABLE_ORDER - 1 - 1;
+            uint16_t nr_validated_ptes:PAGETABLE_ORDER + 1;
+            uint16_t :16 - PAGETABLE_ORDER - 1 - 1;
             uint16_t partial_flags:1;
             int16_t linear_pt_count;
         };
-- 
2.34.1


