Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BB1ADFE5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:28:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRyf-00082e-RQ; Fri, 17 Apr 2020 14:28:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRye-00082I-46
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:28:20 +0000
X-Inumbo-ID: aed63b20-80b7-11ea-8d02-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aed63b20-80b7-11ea-8d02-12813bfff9fa;
 Fri, 17 Apr 2020 14:28:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B159EAB5F;
 Fri, 17 Apr 2020 14:28:17 +0000 (UTC)
Subject: [PATCH 07/10] x86/shadow: the guess_wrmap() hook is needed for HVM
 only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <1e221192-7899-b60d-0280-b77ab5877772@suse.com>
Date: Fri, 17 Apr 2020 16:28:17 +0200
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

sh_remove_write_access() bails early for !external guests, and hence its
building and thus the need for the hook can be suppressed altogether in
!HVM configs.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1769,6 +1769,7 @@ static inline void trace_shadow_wrmap_bf
     }
 }
 
+#ifdef CONFIG_HVM
 /**************************************************************************/
 /* Remove all writeable mappings of a guest frame from the shadow tables
  * Returns non-zero if we need to flush TLBs.
@@ -2000,6 +2001,7 @@ int sh_remove_write_access(struct domain
     /* We killed at least one writeable mapping, so must flush TLBs. */
     return 1;
 }
+#endif /* CONFIG_HVM */
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
 static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -4203,7 +4203,7 @@ int sh_rm_write_access_from_sl1p(struct
 }
 #endif /* OOS */
 
-#if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
+#if defined(CONFIG_HVM) && (SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC)
 static int sh_guess_wrmap(struct vcpu *v, unsigned long vaddr, mfn_t gmfn)
 /* Look up this vaddr in the current shadow and see if it's a writeable
  * mapping of this gmfn.  If so, remove it.  Returns 1 if it worked. */
@@ -4875,10 +4875,10 @@ const struct paging_mode sh_paging_mode
 #ifdef CONFIG_HVM
     .shadow.make_monitor_table     = sh_make_monitor_table,
     .shadow.destroy_monitor_table  = sh_destroy_monitor_table,
-#endif
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     .shadow.guess_wrmap            = sh_guess_wrmap,
 #endif
+#endif /* CONFIG_HVM */
     .shadow.pagetable_dying        = sh_pagetable_dying,
     .shadow.trace_emul_write_val   = trace_emulate_write_val,
     .shadow.shadow_levels          = SHADOW_PAGING_LEVELS,
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -359,6 +359,7 @@ void sh_install_xen_entries_in_l4(struct
 /* Update the shadows in response to a pagetable write from Xen */
 int sh_validate_guest_entry(struct vcpu *v, mfn_t gmfn, void *entry, u32 size);
 
+#ifdef CONFIG_HVM
 /* Remove all writeable mappings of a guest frame from the shadows.
  * Returns non-zero if we need to flush TLBs.
  * level and fault_addr desribe how we found this to be a pagetable;
@@ -366,6 +367,14 @@ int sh_validate_guest_entry(struct vcpu
 extern int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
                                   unsigned int level,
                                   unsigned long fault_addr);
+#else
+static inline int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
+                                         unsigned int level,
+                                         unsigned long fault_addr)
+{
+    return 0;
+}
+#endif
 
 /* Functions that atomically write PT/P2M entries and update state */
 int shadow_write_p2m_entry(struct p2m_domain *p2m, unsigned long gfn,
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -105,9 +105,9 @@ struct shadow_paging_mode {
 #ifdef CONFIG_HVM
     mfn_t         (*make_monitor_table    )(struct vcpu *v);
     void          (*destroy_monitor_table )(struct vcpu *v, mfn_t mmfn);
-#endif
     int           (*guess_wrmap           )(struct vcpu *v, 
                                             unsigned long vaddr, mfn_t gmfn);
+#endif
     void          (*pagetable_dying       )(paddr_t gpa);
     void          (*trace_emul_write_val  )(const void *ptr, unsigned long vaddr,
                                             const void *src, unsigned int bytes);


