Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B637BC6E1C0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 12:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165819.1492498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfxN-0007Pg-7B; Wed, 19 Nov 2025 11:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165819.1492498; Wed, 19 Nov 2025 11:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfxN-0007O0-3t; Wed, 19 Nov 2025 11:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1165819;
 Wed, 19 Nov 2025 11:02:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y799=53=bounce.vates.tech=bounce-md_30504962.691da3c7.v1-3fda88b1751145d7a11369dbd7ec1311@srs-se1.protection.inumbo.net>)
 id 1vLfxL-0007Nu-Rn
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 11:02:35 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5b288f-c537-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 12:02:33 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4dBJTz6JfpzPm15M7
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 11:02:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3fda88b1751145d7a11369dbd7ec1311; Wed, 19 Nov 2025 11:02:31 +0000
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
X-Inumbo-ID: 3f5b288f-c537-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763550151; x=1763820151;
	bh=CViR0ahlfVo9QsHGpKoHDZaSWvQa9JvaabGL617d3E8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=103cPAc0NCDdjxzkBC08OMOI1GpOVGLnp4R65mMj4hmnyOUfYqHWE8HBKGQxzlNwE
	 bFecPuGF/QrRfyZr0hgn1SOvvDeApUMVXK4o9pVyAaOWv5nKHMUb/Vx7kEnRtATZtF
	 IKQGabUoiMOJKSx4wZk+0DGfMYpWyact/GcQOFv2/fodJdgfENhWF7pOOQZzlp0if1
	 yT3kvY5ES8q7FJEoa2GTiFDfgMp4m2INaqSxVOc/VoVfQj8J6KHcPaWR7x49eo9j9G
	 H3bCZ9maI+22R+aKpieJqAxbISDKhPVIl8ieAEikNhgJ65VFOCdlTYfH7ISRGFRG7a
	 jnpBu5+5z/w9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763550151; x=1763810651; i=teddy.astie@vates.tech;
	bh=CViR0ahlfVo9QsHGpKoHDZaSWvQa9JvaabGL617d3E8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e22kNdmHGB0Hmydrw0u9xkAm/THUytjiQTgCakTCPSYolI0GUVDJ4gdExcM6jQqp0
	 6znlbJVCEczgC5pBV9ngE5HwUc6Zfdw7XgCrHd85ga5A37hchW4ucPNKAMaYngT3fO
	 cvirpGD+W1i0QIu0VKVgwLL31CMDFIFqGZR4w0HIyz8BlEt1QqkDTb3pAg2EzeU/KH
	 VU+8bvWulEHeCcLUa6UNJxB2YwnMQE4rJPHJCTlkTbQPIEi5FzS90f5AMtzOvhfKze
	 DQtJz7ilUU5RyTaliSl6p9hGJYjrs5GuPKc6cKA5tZNY5y3qMgtuHX8oLPV+H2e0Ik
	 uooQScl9cUilw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2.1=205/5]=20x86/ioapic:=20Don't=20open-code=2032-bits=20rte=20reads?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763550150823
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <e9ae9ca2b51efa337117a6fe2db48939f8317747.1763549659.git.teddy.astie@vates.tech>
In-Reply-To: <eab88bd79a65887961e0e1563f47360ef08e421a.1761209564.git.teddy.astie@vates.tech>
References: <eab88bd79a65887961e0e1563f47360ef08e421a.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3fda88b1751145d7a11369dbd7ec1311?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251119:md
Date: Wed, 19 Nov 2025 11:02:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

There are many places where we use interesting ways of reading 32-bits
components of the RTE. Introduce and use low and high components directly
to the rte structure instead.

Also take the opportunity to simplify "x & 1 ? 1 : 0".

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2.1:
 - fix trailing spaces
v2:
 - make rte_upper to use bool instead

 xen/arch/x86/include/asm/io_apic.h     |  1 +
 xen/arch/x86/io_apic.c                 | 29 ++++++++++----------------
 xen/drivers/passthrough/vtd/intremap.c |  7 ++-----
 3 files changed, 14 insertions(+), 23 deletions(-)

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
index d20ab2aa98..46c2a43dac 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -254,28 +254,23 @@ nomem:
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
@@ -294,12 +289,10 @@ void __ioapic_write_entry(
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
@@ -2218,7 +2211,7 @@ int ioapic_guest_read(unsigned long physbase, unsigned int reg, u32 *pval)
     dprintk(XENLOG_INFO, "IO-APIC: apic=%d, pin=%d, irq=%d\n" \
             XENLOG_INFO "IO-APIC: new_entry=%08x\n"           \
             XENLOG_INFO "IO-APIC: " f "\n",                   \
-            apic, pin, irq, *(u32 *)&rte, ##a )
+            apic, pin, irq, rte.low, ##a )
 
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
 {
@@ -2237,7 +2230,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
     pin = (reg - 0x10) >> 1;
 
     /* Write first half from guest; second half is target info. */
-    *(u32 *)&rte = val;
+    rte.low = val;
 
     /*
      * What about weird destination types?
@@ -2288,7 +2281,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
         ret = io_apic_read(apic, 0x10 + 2 * pin);
         spin_unlock_irqrestore(&ioapic_lock, flags);
         rte.vector = desc->arch.vector;
-        if ( *(u32*)&rte != ret )
+        if ( rte.low != ret )
             WARN_BOGUS_WRITE("old_entry=%08x pirq=%d\n" XENLOG_INFO
                              "IO-APIC: Attempt to modify IO-APIC pin for in-use IRQ!",
                              ret, pirq);
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 116c2e75ae..ac39405c0d 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -399,7 +399,7 @@ unsigned int cf_check io_apic_read_remap_rte(
     unsigned int ioapic_pin = (reg - 0x10) / 2;
     int index;
     struct IO_APIC_route_entry old_rte = {};
-    int rte_upper = (reg & 1) ? 1 : 0;
+    bool rte_upper = reg & 1;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
 
     if ( !iommu->intremap.num ||
@@ -411,10 +411,7 @@ unsigned int cf_check io_apic_read_remap_rte(
     if ( remap_entry_to_ioapic_rte(iommu, index, &old_rte) )
         return __io_apic_read(apic, reg);
 
-    if ( rte_upper )
-        return (*(((u32 *)&old_rte) + 1));
-    else
-        return (*(((u32 *)&old_rte) + 0));
+    return rte_upper ? old_rte.high : old_rte.low;
 }
 
 void cf_check io_apic_write_remap_rte(
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


