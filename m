Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A16DBFB37A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147747.1479950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVI-0007xX-7R; Wed, 22 Oct 2025 09:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147747.1479950; Wed, 22 Oct 2025 09:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVI-0007us-3a; Wed, 22 Oct 2025 09:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1147747;
 Wed, 22 Oct 2025 09:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8P/j=47=bounce.vates.tech=bounce-md_30504962.68f8a919.v1-9b6d7c45405a405e9f943669d8d0ba31@srs-se1.protection.inumbo.net>)
 id 1vBVVF-0007BN-Pz
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:51:33 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af993062-af2c-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 11:51:31 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4cs4Dn66SVzDRJHhh
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 09:51:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9b6d7c45405a405e9f943669d8d0ba31; Wed, 22 Oct 2025 09:51:21 +0000
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
X-Inumbo-ID: af993062-af2c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761126681; x=1761396681;
	bh=u65tTbbGHDnLFDs3oLFBy6jWBaKMKOiRqgKclIL4gpA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oY8+Hu1kq3Wi/xu+r2DIGUMCNtUAqPbMq8WOG3aKJS1we84QBENoQtwUaC+Oe2CIp
	 6qOytG8zBzLc/xTi64lZNf8EXYDzAQjuAb75pwTdCo0WeuU5/uwxAIh48q1hX9KdxQ
	 xUU6cdUInQAMF+OGivCx34EbXRYFqjusBguxtkPPUrtNe9XCI/c3n2Dz0zoD4JT23V
	 2J8dqQE709qE5HHV57igCK4vVRqeHr3CpG9CPnkwWuKTv1vBND/lICtKJqafSdSYxS
	 YbvoqOVzsqmHgnkMLHXc1W11VLXw+JZip8MWc/3KezJK/KqLIPkAiKygrcT3Xe2Tb3
	 pvixyq1VJ5Y4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761126681; x=1761387181; i=teddy.astie@vates.tech;
	bh=u65tTbbGHDnLFDs3oLFBy6jWBaKMKOiRqgKclIL4gpA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MSv240JMXfe4EWAytify7HzLpVtU0etqw/x9KwkOe760JELTkX6w8SPhNAjFcAyCb
	 ZjjVh3eCXG1ZZUlLTG3qqnTqd+hj7Ijv2mA3gZgAP35k6xfQAMuWm/ZZHKUbff8gYS
	 U53J0j4GQjO6Ztd+Fn8Q7vY//fyjQ8YKS4mY7H4hArCf4gA3V/wh4nzx//jxs11o+f
	 lprgTkqCFxfSBipzibQTujdPh4q8oSkbTlMxpAoClKsFtewi/qdx5HaBOP1BeRGjOI
	 7GARzsrgzDnIWiRzI6/tSu7fkOYqv8GoSxVE3JFzf7kKfwZSDkBCIF/UsU6GuSCtmb
	 Fv2FB5hrSP/GA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=204/4]=20x86/ioapic:=20Don't=20open-code=2032-bits=20rte=20reads?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761126681095
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <819a011a32c608f4aefaf692aeac5ee47381a998.1761124632.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761124632.git.teddy.astie@vates.tech>
References: <cover.1761124632.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9b6d7c45405a405e9f943669d8d0ba31?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251022:md
Date: Wed, 22 Oct 2025 09:51:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

There are many places where we use interesting ways of reading 32-bits
components of the RTE. Introduce and use low and high components directly
to the rte structure instead.

Also take the opportunity to simplify "x & 1 ? 1 : 0".

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
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
index e0314aa469..3cdb892559 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -399,7 +399,7 @@ unsigned int cf_check io_apic_read_remap_rte(
     unsigned int ioapic_pin = (reg - 0x10) / 2;
     int index;
     struct IO_APIC_route_entry old_rte = { };
-    int rte_upper = (reg & 1) ? 1 : 0;
+    unsigned int rte_upper = reg & 1;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
 
     if ( !iommu->intremap.num ||
@@ -410,11 +410,8 @@ unsigned int cf_check io_apic_read_remap_rte(
 
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


