Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D11ADFC3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:26:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRwn-0007gZ-3u; Fri, 17 Apr 2020 14:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRwk-0007gH-Qc
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:26:22 +0000
X-Inumbo-ID: 68fc7740-80b7-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68fc7740-80b7-11ea-9e09-bc764e2007e4;
 Fri, 17 Apr 2020 14:26:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 73F58AC6C;
 Fri, 17 Apr 2020 14:26:20 +0000 (UTC)
Subject: [PATCH 03/10] x86/shadow: monitor table is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <7aa11566-289c-41c2-ec90-c15e0a6490cb@suse.com>
Date: Fri, 17 Apr 2020 16:26:20 +0200
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

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2376,7 +2376,6 @@ void sh_reset_l3_up_pointers(struct vcpu
 static void sh_update_paging_modes(struct vcpu *v)
 {
     struct domain *d = v->domain;
-    const struct paging_mode *old_mode = v->arch.paging.mode;
 
     ASSERT(paging_locked_by_me(d));
 
@@ -2421,11 +2420,14 @@ static void sh_update_paging_modes(struc
     if ( v->arch.paging.mode )
         v->arch.paging.mode->shadow.detach_old_tables(v);
 
+#ifdef CONFIG_HVM
     if ( !is_pv_domain(d) )
     {
         ///
         /// HVM guest
         ///
+        const struct paging_mode *old_mode = v->arch.paging.mode;
+
         ASSERT(shadow_mode_translate(d));
         ASSERT(shadow_mode_external(d));
 
@@ -2523,6 +2525,7 @@ static void sh_update_paging_modes(struc
         //        different values for CR4.PSE and CR4.PGE at the same time.
         //        This *does* happen, at least for CR4.PGE...
     }
+#endif /* CONFIG_HVM */
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
     /* We need to check that all the vcpus have paging enabled to
@@ -2703,7 +2706,6 @@ void shadow_teardown(struct domain *d, b
  * Should only be called for dying domains. */
 {
     struct vcpu *v;
-    mfn_t mfn;
     struct page_info *unpaged_pagetable = NULL;
 
     ASSERT(d->is_dying);
@@ -2719,13 +2721,16 @@ void shadow_teardown(struct domain *d, b
             if ( v->arch.paging.mode )
             {
                 v->arch.paging.mode->shadow.detach_old_tables(v);
+#ifdef CONFIG_HVM
                 if ( shadow_mode_external(d) )
                 {
-                    mfn = pagetable_get_mfn(v->arch.monitor_table);
+                    mfn_t mfn = pagetable_get_mfn(v->arch.monitor_table);
+
                     if ( mfn_valid(mfn) && (mfn_x(mfn) != 0) )
                         v->arch.paging.mode->shadow.destroy_monitor_table(v, mfn);
                     v->arch.monitor_table = pagetable_null();
                 }
+#endif /* CONFIG_HVM */
             }
         }
     }
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1515,7 +1515,7 @@ make_fl1_shadow(struct domain *d, gfn_t
 }
 
 
-#if SHADOW_PAGING_LEVELS == GUEST_PAGING_LEVELS
+#if SHADOW_PAGING_LEVELS == GUEST_PAGING_LEVELS && defined(CONFIG_HVM)
 mfn_t
 sh_make_monitor_table(struct vcpu *v)
 {
@@ -1965,7 +1965,7 @@ void sh_destroy_l1_shadow(struct domain
     shadow_free(d, smfn);
 }
 
-#if SHADOW_PAGING_LEVELS == GUEST_PAGING_LEVELS
+#if SHADOW_PAGING_LEVELS == GUEST_PAGING_LEVELS && defined(CONFIG_HVM)
 void sh_destroy_monitor_table(struct vcpu *v, mfn_t mmfn)
 {
     struct domain *d = v->domain;
@@ -4881,8 +4881,10 @@ const struct paging_mode sh_paging_mode
     .shadow.write_guest_entry      = sh_write_guest_entry,
     .shadow.cmpxchg_guest_entry    = sh_cmpxchg_guest_entry,
 #endif
+#ifdef CONFIG_HVM
     .shadow.make_monitor_table     = sh_make_monitor_table,
     .shadow.destroy_monitor_table  = sh_destroy_monitor_table,
+#endif
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     .shadow.guess_wrmap            = sh_guess_wrmap,
 #endif
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -102,8 +102,10 @@ struct shadow_paging_mode {
                                             intpte_t *old, intpte_t new,
                                             mfn_t gmfn);
 #endif
+#ifdef CONFIG_HVM
     mfn_t         (*make_monitor_table    )(struct vcpu *v);
     void          (*destroy_monitor_table )(struct vcpu *v, mfn_t mmfn);
+#endif
     int           (*guess_wrmap           )(struct vcpu *v, 
                                             unsigned long vaddr, mfn_t gmfn);
     void          (*pagetable_dying       )(paddr_t gpa);


