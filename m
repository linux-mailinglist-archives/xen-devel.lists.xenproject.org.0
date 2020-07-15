Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73EE220958
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 11:59:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveCE-0004eA-UQ; Wed, 15 Jul 2020 09:59:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveCE-0004e3-FP
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 09:59:26 +0000
X-Inumbo-ID: dc29910d-c681-11ea-93a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc29910d-c681-11ea-93a9-12813bfff9fa;
 Wed, 15 Jul 2020 09:59:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 189AAAFB5;
 Wed, 15 Jul 2020 09:59:27 +0000 (UTC)
Subject: [PATCH 3/5] x86/PV: drop a few misleading paging_mode_refcounts()
 checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Message-ID: <9f8d0c4d-dec2-0175-09df-51d5e11c88e1@suse.com>
Date: Wed, 15 Jul 2020 11:59:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The filling and cleaning up of v->arch.guest_table in new_guest_cr3()
was apparently inconsistent so far: There was a type ref acquired
unconditionally for the new top level page table, but the dropping of
the old type ref was conditional upon !paging_mode_refcounts(). Mirror
this also to arch_set_info_guest().

Also move new_guest_cr3()'s #ifdef to around the function - both callers
now get built only when CONFIG_PV, i.e. no need to retain a stub.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1122,8 +1122,6 @@ int arch_set_info_guest(
 
     if ( !cr3_page )
         rc = -EINVAL;
-    else if ( paging_mode_refcounts(d) )
-        /* nothing */;
     else if ( cr3_page == v->arch.old_guest_table )
     {
         v->arch.old_guest_table = NULL;
@@ -1144,8 +1142,7 @@ int arch_set_info_guest(
         case -ERESTART:
             break;
         case 0:
-            if ( !compat && !VM_ASSIST(d, m2p_strict) &&
-                 !paging_mode_refcounts(d) )
+            if ( !compat && !VM_ASSIST(d, m2p_strict) )
                 fill_ro_mpt(cr3_mfn);
             break;
         default:
@@ -1166,7 +1163,7 @@ int arch_set_info_guest(
 
             if ( !cr3_page )
                 rc = -EINVAL;
-            else if ( !paging_mode_refcounts(d) )
+            else
             {
                 rc = get_page_type_preemptible(cr3_page, PGT_root_page_table);
                 switch ( rc )
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3149,9 +3149,9 @@ int vcpu_destroy_pagetables(struct vcpu
     return rc;
 }
 
+#ifdef CONFIG_PV
 int new_guest_cr3(mfn_t mfn)
 {
-#ifdef CONFIG_PV
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
     int rc;
@@ -3220,7 +3220,7 @@ int new_guest_cr3(mfn_t mfn)
 
     pv_destroy_ldt(curr); /* Unconditional TLB flush later. */
 
-    if ( !VM_ASSIST(d, m2p_strict) && !paging_mode_refcounts(d) )
+    if ( !VM_ASSIST(d, m2p_strict) )
         fill_ro_mpt(mfn);
     curr->arch.guest_table = pagetable_from_mfn(mfn);
     update_cr3(curr);
@@ -3231,30 +3231,24 @@ int new_guest_cr3(mfn_t mfn)
     {
         struct page_info *page = mfn_to_page(old_base_mfn);
 
-        if ( paging_mode_refcounts(d) )
-            put_page(page);
-        else
-            switch ( rc = put_page_and_type_preemptible(page) )
-            {
-            case -EINTR:
-            case -ERESTART:
-                curr->arch.old_guest_ptpg = NULL;
-                curr->arch.old_guest_table = page;
-                curr->arch.old_guest_table_partial = (rc == -ERESTART);
-                rc = -ERESTART;
-                break;
-            default:
-                BUG_ON(rc);
-                break;
-            }
+        switch ( rc = put_page_and_type_preemptible(page) )
+        {
+        case -EINTR:
+        case -ERESTART:
+            curr->arch.old_guest_ptpg = NULL;
+            curr->arch.old_guest_table = page;
+            curr->arch.old_guest_table_partial = (rc == -ERESTART);
+            rc = -ERESTART;
+            break;
+        default:
+            BUG_ON(rc);
+            break;
+        }
     }
 
     return rc;
-#else
-    ASSERT_UNREACHABLE();
-    return -EINVAL;
-#endif
 }
+#endif
 
 #ifdef CONFIG_PV
 static int vcpumask_to_pcpumask(


