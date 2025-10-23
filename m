Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A7C00258
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148837.1480695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMt-00048d-Eq; Thu, 23 Oct 2025 09:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148837.1480695; Thu, 23 Oct 2025 09:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMt-00040m-8G; Thu, 23 Oct 2025 09:12:23 +0000
Received: by outflank-mailman (input) for mailman id 1148837;
 Thu, 23 Oct 2025 09:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tps2=5A=bounce.vates.tech=bounce-md_30504962.68f9f171.v1-153b393e8f7746baa02821dbf06fa66d@srs-se1.protection.inumbo.net>)
 id 1vBrMs-0003Xf-36
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:12:22 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 609508d8-aff0-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 11:12:20 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4csgKF5HR4zDRJFM2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 09:12:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 153b393e8f7746baa02821dbf06fa66d; Thu, 23 Oct 2025 09:12:17 +0000
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
X-Inumbo-ID: 609508d8-aff0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761210737; x=1761480737;
	bh=yTbHnfaf7GPXN/1gvP3xsR4YaZcOqdxNGFcNw4CUJhw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=D2PrbGnkwDSpCqU0k5INp9bxRMxl/G1PkVOKC5/D9IDaBMLjPMcDOpGOR6fcmnpqV
	 Pumwbvc2CYykPute7uVqeSorYD4LMfJcYJBzLalZt+3ccfULsZxjoPh1t/RZeGMYqq
	 k0IZe1NU0c2HCp+2VUkvQP5wTjZ+rSRYZrepIAcOmJ8UE8hIDsYWuV0fiX/RMoC/jR
	 JGTvXaIJ9UpkJbuNF+YA+4fUeIdC38p1Yf5CL9O5GCMneDIeruv+4AWHs0meWSuBAN
	 ZonZbiAjEM8YRnPPr6EiecDEZRn1xArJrQxVxC3NeVAVR62GNu65y+h/9VQswI9/cr
	 FCeA9qDDEZ8ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761210737; x=1761471237; i=teddy.astie@vates.tech;
	bh=yTbHnfaf7GPXN/1gvP3xsR4YaZcOqdxNGFcNw4CUJhw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dwDRODDyLKhf6wHnMLNc1bMRJLrmPYwDr0bIDRXZSGBGpBY3ZdyPwvMJ3Afdm8EPi
	 i4vNh9JDKBMrTEDAco4K+FwMSWb5gcYpORtPnbiPbTIMOUC5ryu5Kwj5VX1DmUuWVB
	 W5OWh8WWyZXFT+4mgQNEBm/RxNuGGj8leoEPNXmWDCJ40ktda6ReW+pZG6IsWrvVF6
	 keRDs0sVCij9y4IOo4h+t6c8ge/4MmBBMFjfm7WgycraG1539ZThG8BphfrMJ1JQrM
	 WIDAx+/zJqImdE1uoEHsYu4e8IZxO1zjLCfQDfOqrm0OfsSYgf6eJZWEo34vd9ZLev
	 q7+ow154HCxpA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=205/5]=20x86/ioapic:=20Don't=20open-code=2032-bits=20rte=20reads?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761210737228
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <eab88bd79a65887961e0e1563f47360ef08e421a.1761209564.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761209564.git.teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.153b393e8f7746baa02821dbf06fa66d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 09:12:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

There are many places where we use interesting ways of reading 32-bits
components of the RTE. Introduce and use low and high components directly
to the rte structure instead.

Also take the opportunity to simplify "x & 1 ? 1 : 0".

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - make rte_upper to use bool instead

 xen/arch/x86/include/asm/io_apic.h     |  1 +
 xen/arch/x86/io_apic.c                 | 29 ++++++++++----------------
 xen/drivers/passthrough/vtd/intremap.c |  9 +++-----
 3 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 4680dce9e1..0e85f2a860 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -122,6 +122,7 @@ struct IO_APIC_route_entry {
             } dest;
         };
         uint64_t raw;
+        struct { uint32_t low, high; };
     };
 };
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 24447aef6c..9d2edec179 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -257,28 +257,23 @@ nomem:
     return NULL;
 }
 
-union entry_union {
-    struct { u32 w1, w2; };
-    struct IO_APIC_route_entry entry;
-};
-
 struct IO_APIC_route_entry __ioapic_read_entry(
     unsigned int apic, unsigned int pin, bool raw)
 {
-    union entry_union eu;
+    struct IO_APIC_route_entry entry;
 
     if ( raw || !iommu_intremap )
     {
-        eu.w1 = __io_apic_read(apic, 0x10 + 2 * pin);
-        eu.w2 = __io_apic_read(apic, 0x11 + 2 * pin);
+        entry.low  = __io_apic_read(apic, 0x10 + 2 * pin);
+        entry.high = __io_apic_read(apic, 0x11 + 2 * pin);
     }
     else
     {
-        eu.w1 = iommu_read_apic_from_ire(apic, 0x10 + 2 * pin);
-        eu.w2 = iommu_read_apic_from_ire(apic, 0x11 + 2 * pin);
+        entry.low  = iommu_read_apic_from_ire(apic, 0x10 + 2 * pin);
+        entry.high = iommu_read_apic_from_ire(apic, 0x11 + 2 * pin);
     }
 
-    return eu.entry;
+    return entry;
 }
 
 static struct IO_APIC_route_entry ioapic_read_entry(
@@ -297,12 +292,10 @@ void __ioapic_write_entry(
     unsigned int apic, unsigned int pin, bool raw,
     struct IO_APIC_route_entry e)
 {
-    union entry_union eu = { .entry = e };
-
     if ( raw || !iommu_intremap )
     {
-        __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
-        __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        __io_apic_write(apic, 0x11 + 2 * pin, e.high);
+        __io_apic_write(apic, 0x10 + 2 * pin, e.low);
         /*
          * Might be called before io_apic_pin_eoi is allocated.  Entry will be
          * initialized to the RTE value once the cache is allocated.
@@ -2235,7 +2228,7 @@ int ioapic_guest_read(unsigned long physbase, unsigned int reg, u32 *pval)
     dprintk(XENLOG_INFO, "IO-APIC: apic=%d, pin=%d, irq=%d\n" \
             XENLOG_INFO "IO-APIC: new_entry=%08x\n"           \
             XENLOG_INFO "IO-APIC: " f "\n",                   \
-            apic, pin, irq, *(u32 *)&rte, ##a )
+            apic, pin, irq, rte.low, ##a )
 
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
 {
@@ -2254,7 +2247,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
     pin = (reg - 0x10) >> 1;
 
     /* Write first half from guest; second half is target info. */
-    *(u32 *)&rte = val;
+    rte.low = val;
 
     /*
      * What about weird destination types?
@@ -2305,7 +2298,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
         ret = io_apic_read(apic, 0x10 + 2 * pin);
         spin_unlock_irqrestore(&ioapic_lock, flags);
         rte.vector = desc->arch.vector;
-        if ( *(u32*)&rte != ret )
+        if ( rte.low != ret )
             WARN_BOGUS_WRITE("old_entry=%08x pirq=%d\n" XENLOG_INFO
                              "IO-APIC: Attempt to modify IO-APIC pin for in-use IRQ!",
                              ret, pirq);
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 612e08bcec..a276518c52 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -400,7 +400,7 @@ unsigned int cf_check io_apic_read_remap_rte(
     unsigned int ioapic_pin = (reg - 0x10) / 2;
     int index;
     struct IO_APIC_route_entry old_rte = {};
-    int rte_upper = (reg & 1) ? 1 : 0;
+    bool rte_upper = reg & 1;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
 
     if ( !iommu->intremap.num ||
@@ -411,11 +411,8 @@ unsigned int cf_check io_apic_read_remap_rte(
 
     if ( remap_entry_to_ioapic_rte(iommu, index, &old_rte) )
         return __io_apic_read(apic, reg);
-
-    if ( rte_upper )
-        return (*(((u32 *)&old_rte) + 1));
-    else
-        return (*(((u32 *)&old_rte) + 0));
+    
+    return rte_upper ? old_rte.high : old_rte.low;
 }
 
 void cf_check io_apic_write_remap_rte(
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


