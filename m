Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061043E8058
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 19:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165465.302366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVsh-0003jT-Fu; Tue, 10 Aug 2021 17:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165465.302366; Tue, 10 Aug 2021 17:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVsh-0003hf-CQ; Tue, 10 Aug 2021 17:49:39 +0000
Received: by outflank-mailman (input) for mailman id 165465;
 Tue, 10 Aug 2021 17:49:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3edG=NB=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mDVsf-0003hU-PL
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 17:49:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06935f5f-0a2c-4f55-ad2b-5d6249eca909;
 Tue, 10 Aug 2021 17:49:36 +0000 (UTC)
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
X-Inumbo-ID: 06935f5f-0a2c-4f55-ad2b-5d6249eca909
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628617776;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pBLXom3uvXG3WNRdDC8Js1UbjKLetMogjxd4LmFipwM=;
  b=aMaEGc8Ie8s86/nuFf0sPoBLaSdCW7JfkJwk+dKA90G8jTxVuZ13v6tl
   MtlS0fWkCMBYMA/3jt7TnMY88zBBQHknx7CxmQY29XQHqEu5g5YdoL0Ew
   b9rwYA4ZGktJnGytI0ifvku+IpNLnpfmLcFAm0G6e8MVimZWQ4H9RqFk8
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BEauNw9fsKXQybqAU0wRfh3/gN6Rbq0/WLcVtMh6E9qRpSvbOPUsc9a4wN/4qW3Q8GNORp4wFo
 oFsvL6S3oW1LMSvX4S+yqT+25zs1LRtD/VLkdCQGQ4XOx4XHr6tSb4bIA5X/DIpoWdkQbErNl2
 7K0frkJz+IrPqkGd207ebgXD38gMXVkTYPzm3CkjyK9bjgF1TQzq8CGldCPEraq59q6jSR/fmF
 JYfcJFVX0LEHUjrAkgYKeu4Kpk+4imQ70CHlOvYLshA8dWsqX2N1tIVf9D/dLq2/0HLLfYKpuF
 rbR3H3dDqcPTNr3FWsVRHtMi
X-SBRS: 5.1
X-MesageID: 51845687
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xOKGFKHRqHPCpCK5pLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,310,1620705600"; 
   d="scan'208";a="51845687"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 2/2] x86/ioapic: Remove use of TRUE/FALSE
Date: Tue, 10 Aug 2021 18:49:07 +0100
Message-ID: <20210810174907.56426-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also fix stray usage in VT-d.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/io_apic.c              | 12 ++++++------
 xen/drivers/passthrough/vtd/utils.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 58b26d962c..fbe8f41561 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -289,7 +289,7 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
     {
         /* If vector is unknown, read it from the IO-APIC */
         if ( vector == IRQ_VECTOR_UNASSIGNED )
-            vector = __ioapic_read_entry(apic, pin, TRUE).vector;
+            vector = __ioapic_read_entry(apic, pin, true).vector;
 
         *(IO_APIC_BASE(apic)+16) = vector;
     }
@@ -300,28 +300,28 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
         struct IO_APIC_route_entry entry;
         bool need_to_unmask = false;
 
-        entry = __ioapic_read_entry(apic, pin, TRUE);
+        entry = __ioapic_read_entry(apic, pin, true);
 
         if ( ! entry.mask )
         {
             /* If entry is not currently masked, mask it and make
              * a note to unmask it later */
             entry.mask = 1;
-            __ioapic_write_entry(apic, pin, TRUE, entry);
+            __ioapic_write_entry(apic, pin, true, entry);
             need_to_unmask = true;
         }
 
         /* Flip the trigger mode to edge and back */
         entry.trigger = 0;
-        __ioapic_write_entry(apic, pin, TRUE, entry);
+        __ioapic_write_entry(apic, pin, true, entry);
         entry.trigger = 1;
-        __ioapic_write_entry(apic, pin, TRUE, entry);
+        __ioapic_write_entry(apic, pin, true, entry);
 
         if ( need_to_unmask )
         {
             /* Unmask if neccesary */
             entry.mask = 0;
-            __ioapic_write_entry(apic, pin, TRUE, entry);
+            __ioapic_write_entry(apic, pin, true, entry);
         }
     }
 }
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 4febcf506d..70add3cc8e 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -281,7 +281,7 @@ void vtd_dump_iommu_info(unsigned char key)
             for ( i = 0; i <= reg_01.bits.entries; i++ )
             {
                 struct IO_APIC_route_entry rte =
-                    __ioapic_read_entry(apic, i, TRUE);
+                    __ioapic_read_entry(apic, i, true);
 
                 remap = (struct IO_APIC_route_remap_entry *) &rte;
                 if ( !remap->format )
-- 
2.25.1


