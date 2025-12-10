Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B3CB3C2D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 19:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183167.1505961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxI-0005II-Se; Wed, 10 Dec 2025 18:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183167.1505961; Wed, 10 Dec 2025 18:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxI-0005FC-P2; Wed, 10 Dec 2025 18:30:28 +0000
Received: by outflank-mailman (input) for mailman id 1183167;
 Wed, 10 Dec 2025 18:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unxu=6Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vTOxG-0004rG-J6
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 18:30:26 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac86b91-d5f6-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 19:30:24 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so567385e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:30:24 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a886affb4sm1696105e9.3.2025.12.10.10.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:30:23 -0800 (PST)
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
X-Inumbo-ID: 4ac86b91-d5f6-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765391423; x=1765996223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti+Hvm59056La23/HEYy2xtiFbDlfvWnYziHMb4xycg=;
        b=rAbAuGK+pR6jmJYMG1fapUrZNKVOsnxbdrstyG5U0QLxbMhv/ml7mhFsPTXNw+UBz/
         ztV3YPzBj2reYH3wW3SwJQpA8GU6jROue8lmix8/iPb/bkj2frt1I+7AEKvaZWlRWtvK
         +1bSmOZ484XH5iDfRMipUGdLh4I2uGeOaYzOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765391423; x=1765996223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ti+Hvm59056La23/HEYy2xtiFbDlfvWnYziHMb4xycg=;
        b=cKbxJf1lXFXYVG87f00v4BFcbSRIt4iRu+v+CFehjpPvCmM99DjCwAzUGVZ8IjXkio
         Fbw7XR+F4pTvgwDErsJwbxCA2nLTGGRlxS+ng6ugCwkqqYxBedVSNxzGe+lOAqA25nN+
         f2EIdef3aaTO4+8wSHrnYCsfwe/49QjcwGXuPuuZNH2E8MatoAGNxsHrCLQm7E/DKrum
         /Bmw2/CZCkP4Hswum7vQ2BUqL+MMCPBqE3M4L2UGAizJmiVTu+hJVP0WNWA7hWXAm287
         4BS51utWCJLl9fNfZQ+1i4Yon4rFB9yjuB7wmMNUG4ImN2kxcG3LaBsB24e2uCiRXz89
         B/mA==
X-Gm-Message-State: AOJu0Yw7d0Fh4GcU0AmFw58IiwX0S8eeYW2KnWnXfJLb7lBP7I7nB+ej
	28czw/vrYATg8ntbGf/C1AFg9PzLhxfedHxDMSedINp193yC9vzMVFhNAkN2EKO0AcwczN0YAvl
	3yjum
X-Gm-Gg: ASbGncuc4n+jYkLbUos2/+jiIhPTMrLzk22cQLXnGU7fIv5I9KSXPlP9PjJ5rh+XZKk
	2yZH8AukJdNPsARvRzJFN5rX4Kw5SZT646CTknTiC24mrCciIOUXD60eXzUQ+695t8DQeuiAty0
	R8WejmMQ76C22Pz0GYklBal97oEFW8/GjMQp2ZlWUhmRuH5cABr+CxiwozyFEOPBuxLAqIIWfQL
	Eg/JuotCY4w0g2Fgu8etihly5Odkk2VUljO87AehB7PwwcqXQiy7CqRCdW3xVaSydP7kcw82l9N
	NjJLa81CZLnxP9emUUstZMv1H1v7qbI/8oAtKAYavB/CQIcu/8kxw9hxAdLnqlGo5gON+qs3gbP
	JX14+6/6WaHPohVW58L12q8EYk2dJUCvnh3xb9gzvbcfgwYUgJJuEJjUBGmACe5H25YYr1qWHwH
	RRapk4IMyuwH45qfLpnmmVHSal2i/+E9HM7lP/K6FaQbNQe2gvUCtSwAa/qlWJRw==
X-Google-Smtp-Source: AGHT+IFSBGzM681v8a/IFHC4hCHLgFm92UNB1QnWymlV4pjLJLX0hFH+xN5vczoOq4b96y7TcM6aTw==
X-Received: by 2002:a05:600c:1e24:b0:479:3a88:de5e with SMTP id 5b1f17b1804b1-47a8385368dmr24338165e9.37.1765391423515;
        Wed, 10 Dec 2025 10:30:23 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 1/5] x86: Misra fixes for U/L suffixes
Date: Wed, 10 Dec 2025 18:30:15 +0000
Message-Id: <20251210183019.2241560-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the wider testing, some more violations have been spotted.  This
addresses violations of Rule 7.2 (suffixes required) and Rule 7.3 (L must be
uppercase).

For ELF64_R_TYPE(), cast to uint32_t matching the surrounding examples.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/mm/shadow/common.c     | 4 ++--
 xen/arch/x86/pv/descriptor-tables.c | 2 +-
 xen/drivers/passthrough/vtd/iommu.h | 2 +-
 xen/include/xen/elfstructs.h        | 2 +-
 xen/include/xen/sizes.h             | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 0176e33bc9c7..423764a32653 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1961,7 +1961,7 @@ int sh_remove_write_access(struct domain *d, mfn_t gmfn,
              /* FreeBSD 64bit: linear map 0xffff800000000000 */
              switch ( level )
              {
-             case 1: GUESS(0xffff800000000000
+             case 1: GUESS(0xffff800000000000UL
                            + ((fault_addr & VADDR_MASK) >> 9), 6); break;
              case 2: GUESS(0xffff804000000000UL
                            + ((fault_addr & VADDR_MASK) >> 18), 6); break;
@@ -1969,7 +1969,7 @@ int sh_remove_write_access(struct domain *d, mfn_t gmfn,
                            + ((fault_addr & VADDR_MASK) >> 27), 6); break;
              }
              /* FreeBSD 64bit: direct map at 0xffffff0000000000 */
-             GUESS(0xffffff0000000000 + gfn_to_gaddr(gfn), 6);
+             GUESS(0xffffff0000000000UL + gfn_to_gaddr(gfn), 6);
         }
 
 #undef GUESS
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 02647a2c5047..26f7d18b11b5 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -216,7 +216,7 @@ static bool check_descriptor(const struct domain *dom, seg_desc_t *d)
              * 0xf6800000. Extend these to allow access to the larger read-only
              * M2P table available in 32on64 mode.
              */
-            base = (b & 0xff000000) | ((b & 0xff) << 16) | (a >> 16);
+            base = (b & 0xff000000U) | ((b & 0xff) << 16) | (a >> 16);
 
             limit = (b & 0xf0000) | (a & 0xffff);
             limit++; /* We add one because limit is inclusive. */
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 29d350b23db6..4f41360c53c0 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -266,7 +266,7 @@ struct dma_pte {
 #define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
 #define DMA_PTE_SP   (1 << 7)
 #define DMA_PTE_SNP  (1 << 11)
-#define DMA_PTE_CONTIG_MASK  (0xfull << PADDR_BITS)
+#define DMA_PTE_CONTIG_MASK  (0xfULL << PADDR_BITS)
 #define dma_clear_pte(p)    do {(p).val = 0;} while(0)
 #define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
 #define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index eb6b87a823a8..8770e7454672 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -360,7 +360,7 @@ typedef struct {
 } Elf64_Rela;
 
 #define	ELF64_R_SYM(info)	((info) >> 32)
-#define	ELF64_R_TYPE(info)	((info) & 0xFFFFFFFF)
+#define	ELF64_R_TYPE(info)	((uint32_t)(info))
 #define ELF64_R_INFO(s,t) 	(((s) << 32) + (uint32_t)(t))
 
 /*
diff --git a/xen/include/xen/sizes.h b/xen/include/xen/sizes.h
index f7b728ddab06..d309ebf04406 100644
--- a/xen/include/xen/sizes.h
+++ b/xen/include/xen/sizes.h
@@ -43,6 +43,6 @@
 #define SZ_512M                         0x20000000
 
 #define SZ_1G                           0x40000000
-#define SZ_2G                           0x80000000
+#define SZ_2G                           0x80000000U
 
 #endif /* __XEN_SIZES_H__ */
-- 
2.39.5


