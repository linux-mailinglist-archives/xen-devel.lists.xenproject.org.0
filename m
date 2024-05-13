Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14A8C3F86
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720815.1123823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb8-00067e-SP; Mon, 13 May 2024 11:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720815.1123823; Mon, 13 May 2024 11:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb8-0005ru-AY; Mon, 13 May 2024 11:12:02 +0000
Received: by outflank-mailman (input) for mailman id 720815;
 Mon, 13 May 2024 11:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Tb5-00036L-S2
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:11:59 +0000
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com
 [52.119.213.156]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c93357e-1119-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 13:11:57 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:56 +0000
Received: from EX19MTAUEC002.ant.amazon.com [10.0.44.209:62283]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.4.17:2525] with
 esmtp (Farcaster)
 id 2d8b20f1-bc7a-499d-8d1b-4d37c9ae2d90; Mon, 13 May 2024 11:11:55 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:55 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:54 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:53 +0000
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
X-Inumbo-ID: 9c93357e-1119-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598718; x=1747134718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7GEtDZOeCCFB+yvu/Susicjynil2ILWZXCBC3LXl2pY=;
  b=BbzZB8u8Q0GmX44bUM+kH2QLvR+L6Vo0AX2PobHh380pWf/sQOdAzaFO
   piwsIKuhWaps5PCi5qCcanC8c2lOmL4HvRDyGhV7grqqav4YL5GpD37CT
   +zwl/IFqrvZoLtzd6PthHFENEtn0cark3em7CgfRgtIYXMVCbjAGOJzBo
   g=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="653743988"
X-Farcaster-Flow-ID: 2d8b20f1-bc7a-499d-8d1b-4d37c9ae2d90
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>
Subject: [PATCH V3 15/19] Rename maddr_to_virt() calls
Date: Mon, 13 May 2024 11:11:13 +0000
Message-ID: <20240513111117.68828-16-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Until directmap gets completely removed, we'd still need to
keep some calls to mmaddr_to_virt() for xenheap pages or when the
directmap is enabled.

Rename the macro to maddr_to_directmap_virt() to flag them and
prevent further use of maddr_to_virt().

Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index 81f80c053a..ac016f3a04 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -277,7 +277,7 @@ const char *__init dmi_get_table(paddr_t *base, u32 *len)
 			return "SMBIOS";
 		}
 	} else {
-		char __iomem *p = maddr_to_virt(0xF0000), *q;
+		char __iomem *p = maddr_to_directmap_virt(0xF0000), *q;
 		union {
 			struct dmi_eps dmi;
 			struct smbios3_eps smbios3;
@@ -364,7 +364,7 @@ static int __init dmi_iterate(void (*decode)(const struct dmi_header *))
 	dmi.size = 0;
 	smbios3.length = 0;
 
-	p = maddr_to_virt(0xF0000);
+	p = maddr_to_directmap_virt(0xF0000);
 	for (q = p; q < p + 0x10000; q += 16) {
 		if (!dmi.size) {
 			memcpy_fromio(&dmi, q, sizeof(dmi));
diff --git a/xen/arch/x86/include/asm/mach-default/bios_ebda.h b/xen/arch/x86/include/asm/mach-default/bios_ebda.h
index 42de6b2a5b..8cfe53d1f2 100644
--- a/xen/arch/x86/include/asm/mach-default/bios_ebda.h
+++ b/xen/arch/x86/include/asm/mach-default/bios_ebda.h
@@ -7,7 +7,7 @@
  */
 static inline unsigned int get_bios_ebda(void)
 {
-	unsigned int address = *(unsigned short *)maddr_to_virt(0x40E);
+	unsigned int address = *(unsigned short *)maddr_to_directmap_virt(0x40E);
 	address <<= 4;
 	return address;	/* 0 means none */
 }
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index c6891b52d4..bf7bf08ba4 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -240,11 +240,11 @@ void copy_page_sse2(void *to, const void *from);
 
 /* Convert between Xen-heap virtual addresses and machine addresses. */
 #define __pa(x)             (virt_to_maddr(x))
-#define __va(x)             (maddr_to_virt(x))
+#define __va(x)             (maddr_to_directmap_virt(x))
 
 /* Convert between Xen-heap virtual addresses and machine frame numbers. */
 #define __virt_to_mfn(va)   (virt_to_maddr(va) >> PAGE_SHIFT)
-#define __mfn_to_virt(mfn)  (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
+#define __mfn_to_virt(mfn)  (maddr_to_directmap_virt((paddr_t)(mfn) << PAGE_SHIFT))
 
 /* Convert between machine frame numbers and page-info structures. */
 #define mfn_to_page(mfn)    (frame_table + mfn_to_pdx(mfn))
@@ -270,7 +270,7 @@ void copy_page_sse2(void *to, const void *from);
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_directmap_virt(mfn)    __mfn_to_virt(mfn)
 #define virt_to_maddr(va)   __virt_to_maddr((unsigned long)(va))
-#define maddr_to_virt(ma)   __maddr_to_virt((unsigned long)(ma))
+#define maddr_to_directmap_virt(ma)   __maddr_to_directmap_virt((unsigned long)(ma))
 #define maddr_to_page(ma)   __maddr_to_page(ma)
 #define page_to_maddr(pg)   __page_to_maddr(pg)
 #define virt_to_page(va)    __virt_to_page(va)
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 19ca64d792..a95ebc088f 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -48,7 +48,7 @@ static inline unsigned long __virt_to_maddr(unsigned long va)
     return xen_phys_start + va - XEN_VIRT_START;
 }
 
-static inline void *__maddr_to_virt(unsigned long ma)
+static inline void *__maddr_to_directmap_virt(unsigned long ma)
 {
     /* Offset in the direct map, accounting for pdx compression */
     unsigned long va_offset = maddr_to_directmapoff(ma);
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449..69181b0abe 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -664,7 +664,7 @@ void __init get_smp_config (void)
 
 static int __init smp_scan_config (unsigned long base, unsigned long length)
 {
-	unsigned int *bp = maddr_to_virt(base);
+	unsigned int *bp = maddr_to_directmap_virt(base);
 	struct intel_mp_floating *mpf;
 
 	Dprintk("Scan SMP from %p for %ld bytes.\n", bp,length);
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 39aed5845d..1b02e2b6d5 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1764,7 +1764,7 @@ void __init efi_init_memory(void)
                 if ( map_pages_to_xen((unsigned long)mfn_to_directmap_virt(smfn),
                                     _mfn(smfn), emfn - smfn, prot) == 0 )
                     desc->VirtualStart =
-                        (unsigned long)maddr_to_virt(desc->PhysicalStart);
+                        (unsigned long)maddr_to_directmap_virt(desc->PhysicalStart);
                 else
                     printk(XENLOG_ERR "Could not map MFNs %#lx-%#lx\n",
                         smfn, emfn - 1);
-- 
2.40.1


