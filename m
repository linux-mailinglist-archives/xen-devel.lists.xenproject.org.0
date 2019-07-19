Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57E6EAD0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:47:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXsA-00076y-8f; Fri, 19 Jul 2019 18:44:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoXs8-00076q-P4
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:44:48 +0000
X-Inumbo-ID: 4683fbae-aa55-11e9-99ae-fffbec0617c6
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4683fbae-aa55-11e9-99ae-fffbec0617c6;
 Fri, 19 Jul 2019 18:44:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0B7LBCpRQtza0vxuPvPWqH0xpRtfYngz6OeAcB6SVwG7FbQykPY2YpfrAPvUtH+oljmSCsZAJW
 bnhqODUH4wb7Dq9u/XZwY5dnDcMOBrqJa4jwWlZx5LyHMTPrRQ3ESepFyxzwceujtXWqJOUvQl
 XfFXjfkjpLVZ7RMK7dH0nNZMe47Sw4KD2Jt9XbyKrE1N0585eNa4TO1Xq4E/pr9eiN34p0b+oL
 CqKX3upDb3EAPgAsCxD0fogcrrqccogghkonbPkG4zb/3D39rIOZc9+SiRtq1dLmEUz2whTe/X
 iUY=
X-SBRS: 2.7
X-MesageID: 3275266
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,283,1559534400"; d="scan'208,223";a="3275266"
To: Jan Beulich <JBeulich@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <7eb213ad-94f1-6092-c670-3296aedf3f0e@suse.com>
 <cf6262df-917a-d253-c856-65e785e80939@citrix.com>
 <f1042832-2853-a9f9-1e1a-70af1481da83@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1fc9a3f1-07a6-6897-6203-86014a77d265@citrix.com>
Date: Fri, 19 Jul 2019 19:44:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f1042832-2853-a9f9-1e1a-70af1481da83@suse.com>
Content-Type: multipart/mixed; boundary="------------C215AC821AFDA668C4A4AC50"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 04/14] AMD/IOMMU: use bit field for IRTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--------------C215AC821AFDA668C4A4AC50
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 19/07/2019 17:16, Jan Beulich wrote:
> On 19.07.2019 17:56, Andrew Cooper wrote:
>> On 16/07/2019 17:36, Jan Beulich wrote:
>>> At the same time restrict its scope to just the single source file
>>> actually using it, and abstract accesses by introducing a union of
>>> pointers. (A union of the actual table entries is not used to make it
>>> impossible to [wrongly, once the 128-bit form gets added] perform
>>> pointer arithmetic / array accesses on derived types.)
>>>
>>> Also move away from updating the entries piecemeal: Construct a full new
>>> entry, and write it out.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> I'm still not entirely convinced by extra union and containerof(), but
>> the result looks correct.
> And I'm still open to going the other way, if you're convinced that
> in update_intremap_entry() this
>
>      struct irte_basic basic = {
>          .flds = {
>              .remap_en = true,
>              .int_type = int_type,
>              .dm = dest_mode,
>              .dest = dest,
>              .vector = vector,
>          }
>      };
>
> (and similarly then for the 128-bit form, and of course .flds
> inserted at other use sites) is overall better than the current
> variant.

I've just experimented with the attached delta and it does compile in
CentOS 6, which is the usual culprit for problems in this area.

I do think the result is easier-to-read code, which I am definitely in
favour of.

My ack still stands in all affected patches, but ideally with this kind
of change folded in appropriately.

~Andrew

--------------C215AC821AFDA668C4A4AC50
Content-Type: text/x-patch; name="reduced.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="reduced.patch"

From e028cb655e889ca392023925280f30729be29be7 Mon Sep 17 00:00:00 2001
From: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Fri, 19 Jul 2019 19:20:27 +0100
Subject: Experiment without containerof


diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index d8d0f71d0d..dc781bb9f1 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -24,41 +24,37 @@
 #include <xen/keyhandler.h>
 #include <xen/softirq.h>
 
-struct irte_basic {
-    bool remap_en:1;
-    bool sup_io_pf:1;
-    unsigned int int_type:3;
-    bool rq_eoi:1;
-    bool dm:1;
-    bool guest_mode:1; /* MBZ */
-    unsigned int dest:8;
-    unsigned int vector:8;
-    unsigned int :8;
-};
-
 union irte32 {
-    uint32_t raw[1];
-    struct irte_basic basic;
-};
-
-struct irte_full {
-    bool remap_en:1;
-    bool sup_io_pf:1;
-    unsigned int int_type:3;
-    bool rq_eoi:1;
-    bool dm:1;
-    bool guest_mode:1; /* MBZ */
-    unsigned int dest_lo:24;
-    unsigned int :32;
-    unsigned int vector:8;
-    unsigned int :24;
-    unsigned int :24;
-    unsigned int dest_hi:8;
+    uint32_t raw;
+    struct {
+        bool remap_en:1;
+        bool sup_io_pf:1;
+        unsigned int int_type:3;
+        bool rq_eoi:1;
+        bool dm:1;
+        bool guest_mode:1; /* MBZ */
+        unsigned int dest:8;
+        unsigned int vector:8;
+        unsigned int :8;
+    } flds;
 };
 
 union irte128 {
     uint64_t raw[2];
-    struct irte_full full;
+    struct {
+        bool remap_en:1;
+        bool sup_io_pf:1;
+        unsigned int int_type:3;
+        bool rq_eoi:1;
+        bool dm:1;
+        bool guest_mode:1; /* MBZ */
+        unsigned int dest_lo:24;
+        unsigned int :32;
+        unsigned int vector:8;
+        unsigned int :24;
+        unsigned int :24;
+        unsigned int dest_hi:8;
+    } flds;
 };
 
 union irte_ptr {
@@ -187,7 +183,7 @@ static void free_intremap_entry(const struct amd_iommu *iommu,
         entry.ptr128->raw[1] = 0;
     }
     else
-        ACCESS_ONCE(entry.ptr32->raw[0]) = 0;
+        ACCESS_ONCE(entry.ptr32->raw) = 0;
 
     __clear_bit(index, get_ivrs_mappings(iommu->seg)[bdf].intremap_inuse);
 }
@@ -199,35 +195,36 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
 {
     if ( iommu->ctrl.ga_en )
     {
-        struct irte_full full = {
-            .remap_en = true,
-            .int_type = int_type,
-            .dm = dest_mode,
-            .dest_lo = dest,
-            .dest_hi = dest >> 24,
-            .vector = vector,
+        union irte128 irte = {
+            .flds = {
+                .remap_en = true,
+                .int_type = int_type,
+                .dm = dest_mode,
+                .dest_lo = dest,
+                .dest_hi = dest >> 24,
+                .vector = vector,
+            },
         };
 
-        ASSERT(!entry.ptr128->full.remap_en);
-        entry.ptr128->raw[1] =
-            container_of(&full, union irte128, full)->raw[1];
+        ASSERT(!entry.ptr128->flds.remap_en);
+        entry.ptr128->raw[1] = irte.raw[1];
         /* High half needs to be set before low one (containing RemapEn). */
         smp_wmb();
-        ACCESS_ONCE(entry.ptr128->raw[0]) =
-            container_of(&full, union irte128, full)->raw[0];
+        ACCESS_ONCE(entry.ptr128->raw[0]) = irte.raw[0];
     }
     else
     {
-        struct irte_basic basic = {
-            .remap_en = true,
-            .int_type = int_type,
-            .dm = dest_mode,
-            .dest = dest,
-            .vector = vector,
+        union irte32 irte = {
+            .flds = {
+                .remap_en = true,
+                .int_type = int_type,
+                .dm = dest_mode,
+                .dest = dest,
+                .vector = vector,
+            },
         };
 
-        ACCESS_ONCE(entry.ptr32->raw[0]) =
-            container_of(&basic, union irte32, basic)->raw[0];
+        ACCESS_ONCE(entry.ptr32->raw) = irte.raw;
     }
 }
 
@@ -244,7 +241,7 @@ static inline void set_rte_index(struct IO_APIC_route_entry *rte, int offset)
 
 static inline unsigned int get_full_dest(const union irte128 *entry)
 {
-    return entry->full.dest_lo | ((unsigned int)entry->full.dest_hi << 24);
+    return entry->flds.dest_lo | ((unsigned int)entry->flds.dest_hi << 24);
 }
 
 static int update_intremap_entry_from_ioapic(
@@ -289,9 +286,9 @@ static int update_intremap_entry_from_ioapic(
     entry = get_intremap_entry(iommu, req_id, offset);
 
     /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->basic.remap_en )
+    while ( iommu->enabled && entry.ptr32->flds.remap_en )
     {
-        entry.ptr32->basic.remap_en = false;
+        entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
 
         spin_lock(&iommu->lock);
@@ -311,11 +308,11 @@ static int update_intremap_entry_from_ioapic(
          */
         ASSERT(get_rte_index(rte) == offset);
         if ( iommu->ctrl.ga_en )
-            vector = entry.ptr128->full.vector;
+            vector = entry.ptr128->flds.vector;
         else
-            vector = entry.ptr32->basic.vector;
+            vector = entry.ptr32->flds.vector;
         /* The IntType fields match for both formats. */
-        delivery_mode = entry.ptr32->basic.int_type;
+        delivery_mode = entry.ptr32->flds.int_type;
     }
     else if ( x2apic_enabled )
     {
@@ -558,11 +555,11 @@ unsigned int amd_iommu_read_ioapic_from_ire(
         ASSERT(offset == (val & (INTREMAP_ENTRIES - 1)));
         val &= ~(INTREMAP_ENTRIES - 1);
         /* The IntType fields match for both formats. */
-        val |= MASK_INSR(entry.ptr32->basic.int_type,
+        val |= MASK_INSR(entry.ptr32->flds.int_type,
                          IO_APIC_REDIR_DELIV_MODE_MASK);
         val |= MASK_INSR(iommu->ctrl.ga_en
-                         ? entry.ptr128->full.vector
-                         : entry.ptr32->basic.vector,
+                         ? entry.ptr128->flds.vector
+                         : entry.ptr32->flds.vector,
                          IO_APIC_REDIR_VECTOR_MASK);
     }
     else if ( x2apic_enabled )
@@ -631,9 +628,9 @@ static int update_intremap_entry_from_msi_msg(
     entry = get_intremap_entry(iommu, req_id, offset);
 
     /* The RemapEn fields match for all formats. */
-    while ( iommu->enabled && entry.ptr32->basic.remap_en )
+    while ( iommu->enabled && entry.ptr32->flds.remap_en )
     {
-        entry.ptr32->basic.remap_en = false;
+        entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
 
         spin_lock(&iommu->lock);
@@ -767,19 +764,19 @@ void amd_iommu_read_msi_from_ire(
 
     msg->data &= ~(INTREMAP_ENTRIES - 1);
     /* The IntType fields match for both formats. */
-    msg->data |= MASK_INSR(entry.ptr32->basic.int_type,
+    msg->data |= MASK_INSR(entry.ptr32->flds.int_type,
                            MSI_DATA_DELIVERY_MODE_MASK);
     if ( iommu->ctrl.ga_en )
     {
-        msg->data |= MASK_INSR(entry.ptr128->full.vector,
+        msg->data |= MASK_INSR(entry.ptr128->flds.vector,
                                MSI_DATA_VECTOR_MASK);
         msg->dest32 = get_full_dest(entry.ptr128);
     }
     else
     {
-        msg->data |= MASK_INSR(entry.ptr32->basic.vector,
+        msg->data |= MASK_INSR(entry.ptr32->flds.vector,
                                MSI_DATA_VECTOR_MASK);
-        msg->dest32 = entry.ptr32->basic.dest;
+        msg->dest32 = entry.ptr32->flds.dest;
     }
 }
 
@@ -894,9 +891,9 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
         }
         else
         {
-            if ( !tbl.ptr32[count].raw[0] )
+            if ( !tbl.ptr32[count].raw )
                 continue;
-            printk("    IRTE[%03x] %08x\n", count, tbl.ptr32[count].raw[0]);
+            printk("    IRTE[%03x] %08x\n", count, tbl.ptr32[count].raw);
         }
     }
 }

--------------C215AC821AFDA668C4A4AC50
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------C215AC821AFDA668C4A4AC50--

