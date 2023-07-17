Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38677568A4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564728.882386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh3-0002Ok-Of; Mon, 17 Jul 2023 16:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564728.882386; Mon, 17 Jul 2023 16:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQh3-0002NJ-Ll; Mon, 17 Jul 2023 16:03:25 +0000
Received: by outflank-mailman (input) for mailman id 564728;
 Mon, 17 Jul 2023 16:03:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcy7=DD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLQh2-00027B-3i
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:03:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74e3c3c0-24bb-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:03:23 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51e28b299adso6556664a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 09:03:23 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 bo28-20020a0564020b3c00b0051df5bd1cd8sm10099050edb.65.2023.07.17.09.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:03:22 -0700 (PDT)
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
X-Inumbo-ID: 74e3c3c0-24bb-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689609803; x=1692201803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8akak382Pvkzk8smYZShsg8P//0dNcL1l5JC56gewGo=;
        b=aBkBGRY5kmrQNcoLDo1E1l5XfJc7Yybzdet93GHz0y0BV+O9N+Y4ug/Xpz3GXRAVVM
         qql+KrY9+5VhMJKMtzGPgLdCcJqqMzyRZHAMbtiqqxkBe4W7XaSOYuYIYUh0fAlWcRzG
         qMT5/f0naP6oGbd9ebD9X09zH4hmI+ct9w+4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609803; x=1692201803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8akak382Pvkzk8smYZShsg8P//0dNcL1l5JC56gewGo=;
        b=g9afuXjSlhHeEDbo9hG5tdU0pr0uv9WE1fv5gaPRIEf5HVeUEIF7dLgBeCLP/7id2S
         8bjatQkkXQRg1l3YeekrTvN0oDQyWzknwEBxvfhnsKH+MXUnrKUrWSJDPJIpfKgu28V+
         VysXmrVPdVznn1hIB1Utmz1cRtRdt8JOkaIie8jlXwZGHWVRnTF9X82W4Jw3o+TAe225
         m07iWVo/dzTIhT27QJHOsp7R2z8Sn9pI2STC5YgjhMAxchFHw/BR0RCkg1JrchUCJhR8
         3up2WbzrJA3m6lTifNdKjcgNdJNU+rSXmmFb2h2aJqZYBmUIGIxd8wZVQFoXkInwAuMt
         DrOQ==
X-Gm-Message-State: ABy/qLa8V1CwbtjYejjzD3hfH3URO+wNdwwk6KB7weH4nRAuaDl9/IZ1
	mfCdAfYPNuJUW4tMwRckc/SnRnDMhM/F/Ts8fZ8=
X-Google-Smtp-Source: APBJJlFXq+YuZi7U2G9yLDx7wuxCaHoDw+Wc30wPyNw4rp1n8ZvEtJGZgBqr3VCUNh5wuoEqCh5dfA==
X-Received: by 2002:aa7:cd16:0:b0:51b:c714:a2a1 with SMTP id b22-20020aa7cd16000000b0051bc714a2a1mr11744396edw.7.1689609802826;
        Mon, 17 Jul 2023 09:03:22 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/8] arm/mm: Document the differences between arm32 and arm64 directmaps
Date: Mon, 17 Jul 2023 17:03:12 +0100
Message-Id: <20230717160318.2113-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm32 merely covers the XENHEAP, whereas arm64 currently covers anything in
the frame table. These comments highlight why arm32 doesn't need to account for PDX
compression in its __va() implementation while arm64 does.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/arm/include/asm/mm.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 4262165ce2..1a83f41879 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -280,6 +280,19 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
 #define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
 
 #ifdef CONFIG_ARM_32
+/**
+ * Find the virtual address corresponding to a machine address
+ *
+ * Only memory backing the XENHEAP has a corresponding virtual address to
+ * be found. This is so we can save precious virtual space, as it's in
+ * short supply on arm32. This mapping is not subject to PDX compression
+ * because XENHEAP is known to be physically contiguous and can't hence
+ * jump over the PDX hole. This means we can avoid the roundtrips
+ * converting to/from pdx.
+ *
+ * @param ma Machine address
+ * @return Virtual address mapped to `ma`
+ */
 static inline void *maddr_to_virt(paddr_t ma)
 {
     ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
@@ -287,6 +300,20 @@ static inline void *maddr_to_virt(paddr_t ma)
     return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
 }
 #else
+/**
+ * Find the virtual address corresponding to a machine address
+ *
+ * The directmap covers all conventional memory accesible by the
+ * hypervisor. This means it's subject to PDX compression.
+ *
+ * More specifically to arm64, the directmap mappings start at the first
+ * GiB boundary containing valid RAM. This means there's an extra offset
+ * applied (directmap_base_pdx) on top of the regular PDX compression
+ * logic.
+ *
+ * @param ma Machine address
+ * @return Virtual address mapped to `ma`
+ */
 static inline void *maddr_to_virt(paddr_t ma)
 {
     ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
-- 
2.34.1


