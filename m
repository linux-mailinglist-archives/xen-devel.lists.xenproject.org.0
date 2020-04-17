Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719B71ADFC4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:27:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRxN-0007mh-G2; Fri, 17 Apr 2020 14:27:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRxM-0007mY-D6
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:27:00 +0000
X-Inumbo-ID: 7f0237f1-80b7-11ea-8d02-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f0237f1-80b7-11ea-8d02-12813bfff9fa;
 Fri, 17 Apr 2020 14:26:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11B42ACC2;
 Fri, 17 Apr 2020 14:26:58 +0000 (UTC)
Subject: [PATCH 04/10] x86/shadow: sh_update_linear_entries() is a no-op for PV
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <e5457534-6491-b9be-e61d-d669a8e7656e@suse.com>
Date: Fri, 17 Apr 2020 16:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Consolidate the shadow_mode_external() in here: Check this once at the
start of the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3707,34 +3707,30 @@ sh_update_linear_entries(struct vcpu *v)
      */
 
     /* Don't try to update the monitor table if it doesn't exist */
-    if ( shadow_mode_external(d)
-         && pagetable_get_pfn(v->arch.monitor_table) == 0 )
+    if ( !shadow_mode_external(d) ||
+         pagetable_get_pfn(v->arch.monitor_table) == 0 )
         return;
 
 #if SHADOW_PAGING_LEVELS == 4
 
-    /* For PV, one l4e points at the guest l4, one points at the shadow
-     * l4.  No maintenance required.
-     * For HVM, just need to update the l4e that points to the shadow l4. */
+    /* For HVM, just need to update the l4e that points to the shadow l4. */
 
-    if ( shadow_mode_external(d) )
+    /* Use the linear map if we can; otherwise make a new mapping */
+    if ( v == current )
     {
-        /* Use the linear map if we can; otherwise make a new mapping */
-        if ( v == current )
-        {
-            __linear_l4_table[l4_linear_offset(SH_LINEAR_PT_VIRT_START)] =
-                l4e_from_pfn(pagetable_get_pfn(v->arch.shadow_table[0]),
-                             __PAGE_HYPERVISOR_RW);
-        }
-        else
-        {
-            l4_pgentry_t *ml4e;
-            ml4e = map_domain_page(pagetable_get_mfn(v->arch.monitor_table));
-            ml4e[l4_table_offset(SH_LINEAR_PT_VIRT_START)] =
-                l4e_from_pfn(pagetable_get_pfn(v->arch.shadow_table[0]),
-                             __PAGE_HYPERVISOR_RW);
-            unmap_domain_page(ml4e);
-        }
+        __linear_l4_table[l4_linear_offset(SH_LINEAR_PT_VIRT_START)] =
+            l4e_from_pfn(pagetable_get_pfn(v->arch.shadow_table[0]),
+                         __PAGE_HYPERVISOR_RW);
+    }
+    else
+    {
+        l4_pgentry_t *ml4e;
+
+        ml4e = map_domain_page(pagetable_get_mfn(v->arch.monitor_table));
+        ml4e[l4_table_offset(SH_LINEAR_PT_VIRT_START)] =
+            l4e_from_pfn(pagetable_get_pfn(v->arch.shadow_table[0]),
+                         __PAGE_HYPERVISOR_RW);
+        unmap_domain_page(ml4e);
     }
 
 #elif SHADOW_PAGING_LEVELS == 3
@@ -3748,7 +3744,6 @@ sh_update_linear_entries(struct vcpu *v)
      * the shadows.
      */
 
-    ASSERT(shadow_mode_external(d));
     {
         /* Install copies of the shadow l3es into the monitor l2 table
          * that maps SH_LINEAR_PT_VIRT_START. */
@@ -3799,20 +3794,16 @@ sh_update_linear_entries(struct vcpu *v)
 #error this should not happen
 #endif
 
-    if ( shadow_mode_external(d) )
-    {
-        /*
-         * Having modified the linear pagetable mapping, flush local host TLBs.
-         * This was not needed when vmenter/vmexit always had the side effect
-         * of flushing host TLBs but, with ASIDs, it is possible to finish
-         * this CR3 update, vmenter the guest, vmexit due to a page fault,
-         * without an intervening host TLB flush. Then the page fault code
-         * could use the linear pagetable to read a top-level shadow page
-         * table entry. But, without this change, it would fetch the wrong
-         * value due to a stale TLB.
-         */
-        flush_tlb_local();
-    }
+    /*
+     * Having modified the linear pagetable mapping, flush local host TLBs.
+     * This was not needed when vmenter/vmexit always had the side effect of
+     * flushing host TLBs but, with ASIDs, it is possible to finish this CR3
+     * update, vmenter the guest, vmexit due to a page fault, without an
+     * intervening host TLB flush. Then the page fault code could use the
+     * linear pagetable to read a top-level shadow page table entry. But,
+     * without this change, it would fetch the wrong value due to a stale TLB.
+     */
+    flush_tlb_local();
 }
 
 


