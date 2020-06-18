Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21CE1FEF6D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 12:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlrW0-0003JW-3o; Thu, 18 Jun 2020 10:11:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlrVz-0003JQ-7d
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 10:11:23 +0000
X-Inumbo-ID: 0f29e3ea-b14c-11ea-ba66-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f29e3ea-b14c-11ea-ba66-12813bfff9fa;
 Thu, 18 Jun 2020 10:11:22 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4xFnDDohsQfjgZbIbrpl7jJ4JNpxOzlFDDHTpYX4i/kLb4bQRTQl97nvtobJu6d2W4llrfZu5P
 dGldkYKylSxAwcRr/zFOpdAwIqdXi1jzXBzj7e2PGBYPFvkxxjJsQybhaCcTPYol1njRUhlW4K
 5orALwiplwQ2Ni9/vCfN6+PnYa/6PPUJpnUVjhHo8EEEp3tXKR1twaZvhIea1q/2naal7UOn3T
 p9f7OWseNvZhwzyey3dVf88NmBUtsLk+rz9oAe6kufnDSIcwiQwcfBSTB/u1PVj+RcxQv20KG2
 3+0=
X-SBRS: 2.7
X-MesageID: 20366843
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20366843"
Date: Thu, 18 Jun 2020 12:11:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] VT-x: simplify/clarify vmx_load_pdptrs()
Message-ID: <20200618101113.GI735@Air-de-Roger>
References: <b2bd8c84-9109-8b21-afb4-51e49b271a83@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2bd8c84-9109-8b21-afb4-51e49b271a83@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 08:38:27AM +0200, Jan Beulich wrote:
> * Guests outside of long mode can't have PCID enabled. Drop the
>   respective check to make more obvious that there's no security issue
>   (from potentially accessing past the mapped page's boundary).
> 
> * Only the low 32 bits of CR3 are relevant outside of long mode, even
>   if they remained unchanged after leaving that mode.
> 
> * Drop the unnecessary and badly typed local variable p.
> 
> * Don't open-code hvm_long_mode_active() (and extend this to the related
>   nested VT-x code).
> 
> * Constify guest_pdptes to clarify that we're only reading from the
>   page.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

As it's no worse that what was there before, yet I have a question.

> ---
> This is intentionally not addressing any of the other shortcomings of
> the function, as was done by the previously posted
> https://lists.xenproject.org/archives/html/xen-devel/2018-07/msg01790.html.
> This will need to be the subject of a further change.
> 
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -1312,17 +1312,16 @@ static void vmx_set_interrupt_shadow(str
>  
>  static void vmx_load_pdptrs(struct vcpu *v)
>  {
> -    unsigned long cr3 = v->arch.hvm.guest_cr[3];
> -    uint64_t *guest_pdptes;
> +    uint32_t cr3 = v->arch.hvm.guest_cr[3];
> +    const uint64_t *guest_pdptes;
>      struct page_info *page;
>      p2m_type_t p2mt;
> -    char *p;
>  
>      /* EPT needs to load PDPTRS into VMCS for PAE. */
> -    if ( !hvm_pae_enabled(v) || (v->arch.hvm.guest_efer & EFER_LMA) )
> +    if ( !hvm_pae_enabled(v) || hvm_long_mode_active(v) )
>          return;
>  
> -    if ( (cr3 & 0x1fUL) && !hvm_pcid_enabled(v) )
> +    if ( cr3 & 0x1f )
>          goto crash;

Intel SDM says bits 0 to 4 are ignored, not reserved, so I'm not sure
we need to crash the guest here. I have no reference how real hardware
behaves here, so maybe crashing is the right thing to do.

>  
>      page = get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt, P2M_UNSHARE);
> @@ -1332,14 +1331,12 @@ static void vmx_load_pdptrs(struct vcpu
>           * queue, but this is the wrong place. We're holding at least
>           * the paging lock */
>          gdprintk(XENLOG_ERR,
> -                 "Bad cr3 on load pdptrs gfn %lx type %d\n",
> +                 "Bad cr3 on load pdptrs gfn %"PRIx32" type %d\n",
>                   cr3 >> PAGE_SHIFT, (int) p2mt);
>          goto crash;
>      }
>  
> -    p = __map_domain_page(page);
> -
> -    guest_pdptes = (uint64_t *)(p + (cr3 & ~PAGE_MASK));
> +    guest_pdptes = __map_domain_page(page) + (cr3 & ~PAGE_MASK);

Instead I think this could be:

guest_pdptes = __map_domain_page(page) + (cr3 & ~(PAGE_MASK | 0x1f));

Thanks, Roger.

