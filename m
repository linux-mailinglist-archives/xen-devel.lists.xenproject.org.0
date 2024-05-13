Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE38C422B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720941.1124092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vvm-0007X3-Nc; Mon, 13 May 2024 13:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720941.1124092; Mon, 13 May 2024 13:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Vvm-0007PE-Ih; Mon, 13 May 2024 13:41:30 +0000
Received: by outflank-mailman (input) for mailman id 720941;
 Mon, 13 May 2024 13:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Vvk-0002zP-32
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:28 +0000
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com
 [207.171.188.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e02d5f4-112e-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 15:41:26 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:24 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.29.78:2195]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.49.39:2525]
 with esmtp (Farcaster)
 id f9f42ec9-ac81-45a7-bcb8-9513c302c028; Mon, 13 May 2024 13:41:23 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:23 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:22 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:21 +0000
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
X-Inumbo-ID: 7e02d5f4-112e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607687; x=1747143687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7GEtDZOeCCFB+yvu/Susicjynil2ILWZXCBC3LXl2pY=;
  b=NuoBBCNpv5cdCrPXRjVs5v6qWbL+EDIXmxMgO5NwGpUkh3lOUj0saO3h
   e4fbJnz8FX2pvKdnih2kyrWI+caIBULAKEE/boIZe0iQ15RH5MTUkHaYh
   V6v5jEFTDcOsy6QrMJc2LnZEOA6fF1+7Lqk5RUq+e/jb2wDiif9InEGHM
   A=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="725436999"
X-Farcaster-Flow-ID: f9f42ec9-ac81-45a7-bcb8-9513c302c028
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Elias El
 Yandouzi" <eliasely@amazon.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH V3 (resend) 15/19] Rename maddr_to_virt() calls
Date: Mon, 13 May 2024 13:40:42 +0000
Message-ID: <20240513134046.82605-16-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
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


