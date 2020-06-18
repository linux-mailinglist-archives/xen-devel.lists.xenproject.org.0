Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415ED1FEB88
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 08:38:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jloBw-0001I1-Cn; Thu, 18 Jun 2020 06:38:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jloBv-0001Hw-F8
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 06:38:27 +0000
X-Inumbo-ID: 504bccf8-b12e-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 504bccf8-b12e-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 06:38:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9AA4EAC7F;
 Thu, 18 Jun 2020 06:38:29 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-x: simplify/clarify vmx_load_pdptrs()
Message-ID: <b2bd8c84-9109-8b21-afb4-51e49b271a83@suse.com>
Date: Thu, 18 Jun 2020 08:38:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

* Guests outside of long mode can't have PCID enabled. Drop the
  respective check to make more obvious that there's no security issue
  (from potentially accessing past the mapped page's boundary).

* Only the low 32 bits of CR3 are relevant outside of long mode, even
  if they remained unchanged after leaving that mode.

* Drop the unnecessary and badly typed local variable p.

* Don't open-code hvm_long_mode_active() (and extend this to the related
  nested VT-x code).

* Constify guest_pdptes to clarify that we're only reading from the
  page.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is intentionally not addressing any of the other shortcomings of
the function, as was done by the previously posted
https://lists.xenproject.org/archives/html/xen-devel/2018-07/msg01790.html.
This will need to be the subject of a further change.

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1312,17 +1312,16 @@ static void vmx_set_interrupt_shadow(str
 
 static void vmx_load_pdptrs(struct vcpu *v)
 {
-    unsigned long cr3 = v->arch.hvm.guest_cr[3];
-    uint64_t *guest_pdptes;
+    uint32_t cr3 = v->arch.hvm.guest_cr[3];
+    const uint64_t *guest_pdptes;
     struct page_info *page;
     p2m_type_t p2mt;
-    char *p;
 
     /* EPT needs to load PDPTRS into VMCS for PAE. */
-    if ( !hvm_pae_enabled(v) || (v->arch.hvm.guest_efer & EFER_LMA) )
+    if ( !hvm_pae_enabled(v) || hvm_long_mode_active(v) )
         return;
 
-    if ( (cr3 & 0x1fUL) && !hvm_pcid_enabled(v) )
+    if ( cr3 & 0x1f )
         goto crash;
 
     page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt, P2M_UNSHARE);
@@ -1332,14 +1331,12 @@ static void vmx_load_pdptrs(struct vcpu
          * queue, but this is the wrong place. We're holding at least
          * the paging lock */
         gdprintk(XENLOG_ERR,
-                 "Bad cr3 on load pdptrs gfn %lx type %d\n",
+                 "Bad cr3 on load pdptrs gfn %"PRIx32" type %d\n",
                  cr3 >> PAGE_SHIFT, (int) p2mt);
         goto crash;
     }
 
-    p = __map_domain_page(page);
-
-    guest_pdptes = (uint64_t *)(p + (cr3 & ~PAGE_MASK));
+    guest_pdptes = __map_domain_page(page) + (cr3 & ~PAGE_MASK);
 
     /*
      * We do not check the PDPTRs for validity. The CPU will do this during
@@ -1356,7 +1353,7 @@ static void vmx_load_pdptrs(struct vcpu
 
     vmx_vmcs_exit(v);
 
-    unmap_domain_page(p);
+    unmap_domain_page(guest_pdptes);
     put_page(page);
     return;
 
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1234,7 +1234,7 @@ static void virtual_vmentry(struct cpu_u
         paging_update_paging_modes(v);
 
     if ( nvmx_ept_enabled(v) && hvm_pae_enabled(v) &&
-         !(v->arch.hvm.guest_efer & EFER_LMA) )
+         !hvm_long_mode_active(v) )
         vvmcs_to_shadow_bulk(v, ARRAY_SIZE(gpdpte_fields), gpdpte_fields);
 
     regs->rip = get_vvmcs(v, GUEST_RIP);
@@ -1437,7 +1437,7 @@ static void virtual_vmexit(struct cpu_us
     sync_exception_state(v);
 
     if ( nvmx_ept_enabled(v) && hvm_pae_enabled(v) &&
-         !(v->arch.hvm.guest_efer & EFER_LMA) )
+         !hvm_long_mode_active(v) )
         shadow_to_vvmcs_bulk(v, ARRAY_SIZE(gpdpte_fields), gpdpte_fields);
 
     /* This will clear current pCPU bit in p2m->dirty_cpumask */

