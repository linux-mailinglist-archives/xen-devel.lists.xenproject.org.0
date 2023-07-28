Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A8766611
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571350.894992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINd-0006tz-6f; Fri, 28 Jul 2023 07:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571350.894992; Fri, 28 Jul 2023 07:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINd-0006ot-3M; Fri, 28 Jul 2023 07:59:21 +0000
Received: by outflank-mailman (input) for mailman id 571350;
 Fri, 28 Jul 2023 07:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPINb-0006EL-9V
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 07:59:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a61b6bde-2d1c-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 09:59:16 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31771bb4869so1859753f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 00:59:16 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0030e56a9ff25sm4089629wrl.31.2023.07.28.00.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:59:15 -0700 (PDT)
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
X-Inumbo-ID: a61b6bde-2d1c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690531155; x=1691135955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6LGxVoqrbyniZKGQimBNpKjG2ea1pNL9RlwcBoVEA0=;
        b=ZqisHGXjloTP0NJo+9UiMSWXzZrPHs0fUyBrdm+3M0pJU8kPD1Fuu5Z3Pu4ELNuofe
         qR9hDkHuaYzNguYnGATiWrzxeqWN1FUU0t72yN8cIxUj/+0yd0lC0ES1RnPZ1dnBO4yy
         KVBq/GLMcGgM8bGVfQwjl0ZGlASfIL9NuO1ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531155; x=1691135955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6LGxVoqrbyniZKGQimBNpKjG2ea1pNL9RlwcBoVEA0=;
        b=SpOEADcPxk5tE8gVUmBOeuvrnlJRpBvOyeV5QcxxdsyPvWB4tNZCTrMDgk3bJd2PGX
         BrF6zhgl2b4YQwf5tU4WiB9YSzMHvlp2amMqHD8TiMfThQpl+XoFL1FAN7VF1rW0LEBK
         fpdSR870elunJ1WyRvkz67rEHs+WywRFTCR62tAN52vIqX/u6WjCeMMQ5OD5ujKp0L3p
         VRXwP75NGoLaj1X56JrbNzjQgLm+0zMLhr+b4aMHN4YL689c1BGmRjQFYoHXBfh1bT8J
         GsmkANDR+qrnNVrMUqca8JAwZiJWXmsjGcNhGQQFimenv4sPFcr7okrjU2SRjbZT7Ub4
         yVYQ==
X-Gm-Message-State: ABy/qLbcOJmzwaW9frm6f9ZgktHh1bgb17DJfF02nchKxUS6S7c9D3Wn
	/Au954kmxH6R5BT30SPcyn+pCXgELzhpxwYPvdBgBw==
X-Google-Smtp-Source: APBJJlEf1wAZoLY/cYf2pZpXrEVC0OGLC9BXQ/87moiBUOlRFOu3rvFqU/5SQogyDrsr7f6W7RffRA==
X-Received: by 2002:a5d:43c3:0:b0:314:1aed:8f5f with SMTP id v3-20020a5d43c3000000b003141aed8f5fmr1129148wrr.34.1690531155546;
        Fri, 28 Jul 2023 00:59:15 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/5] arm/mm: Document the differences between arm32 and arm64 directmaps
Date: Fri, 28 Jul 2023 08:58:59 +0100
Message-Id: <20230728075903.7838-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm32 merely covers the XENHEAP, whereas arm64 currently covers anything in
the frame table. These comments highlight why arm32 doesn't need to account for PDX
compression in its __va() implementation while arm64 does.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Removed statement about "containing GiB" (Julien)
---
 xen/arch/arm/include/asm/mm.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 4262165ce2..5b530f0f40 100644
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
@@ -287,6 +300,19 @@ static inline void *maddr_to_virt(paddr_t ma)
     return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
 }
 #else
+/**
+ * Find the virtual address corresponding to a machine address
+ *
+ * The directmap covers all conventional memory accesible by the
+ * hypervisor. This means it's subject to PDX compression.
+ *
+ * Note there's an extra offset applied (directmap_base_pdx) on top of the
+ * regular PDX compression logic. Its purpose is to skip over the initial
+ * range of non-existing memory, should there be one.
+ *
+ * @param ma Machine address
+ * @return Virtual address mapped to `ma`
+ */
 static inline void *maddr_to_virt(paddr_t ma)
 {
     ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
-- 
2.34.1


