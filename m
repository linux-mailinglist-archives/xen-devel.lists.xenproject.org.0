Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579D23DB07
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 16:05:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3gVY-0003dj-ME; Thu, 06 Aug 2020 14:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3gVX-0003de-8Z
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 14:04:35 +0000
X-Inumbo-ID: bc74ab43-a97f-4293-ad70-9ef3ced1291b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc74ab43-a97f-4293-ad70-9ef3ced1291b;
 Thu, 06 Aug 2020 14:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596722673;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jcst+vUXWIDH9l1/b5ZOkB7hEbI0ii6Plnk5zFkhr7A=;
 b=hT2c6qGkuFeIqBT2xrQbd7l91gSBsC/TGOD6kY28wm4QjqG4oaV8shW7
 f7FFBtzqwMtWkxpulC8x1MzXaSwv+/UVhjRgq7XGttrpTkd6Zd6DkCv9R
 rMsQkgLvTZtI36C8/+NJsFNPu77WBOY33eE2IxAmBYIejB0+l4X5dm9gT c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0UA42GqbT5uJQ+NWwSW/YZqyjubO0l8QFV+BH81zFoi/EJO9NgYdw0vc0kk/GV+OgL43mAxFbM
 U9QuKqE+rNwqqCuaS0QG6yR9R4tCizUFj5BMirJ4wmvjCfQ3G4QgZGSc4ASDkVISiRcyNlbN3p
 zgC8/asS0vuCVFMYnoJWmA/L+m51+S3+Kabn9F7/w3UTsHiP7WpEYZ3kUxxkPq4GANQx5T5U2r
 qSOU9kbYHWuSwDhrMKK24NGVCDNhKWbwrL+ZP9z5z4ZXREOEMd9pCH3Fj57ZqOwZfRBvd+8az6
 5o4=
X-SBRS: 3.7
X-MesageID: 24323162
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,441,1589256000"; d="scan'208";a="24323162"
Subject: Re: [PATCH 1/3] x86: slightly re-arrange 32-bit handling in
 dom0_construct_pv()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <0972ea3c-c2a8-b0f4-ae25-132bdb798f6a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0217c386-e93e-2f07-f2ac-9e683c14541a@citrix.com>
Date: Thu, 6 Aug 2020 15:04:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0972ea3c-c2a8-b0f4-ae25-132bdb798f6a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:28, Jan Beulich wrote:
> Add #ifdef-s (the 2nd one will be needed in particular, to guard the
> uses of m2p_compat_vstart and HYPERVISOR_COMPAT_VIRT_START()) and fold
> duplicate uses of elf_32bit().
>
> Also adjust what gets logged: Avoid "compat32" when support isn't built
> in, and don't assume ELF class <> ELFCLASS64 means ELFCLASS32.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> although with some
further suggestions.

>
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -300,7 +300,6 @@ int __init dom0_construct_pv(struct doma
>      struct page_info *page = NULL;
>      start_info_t *si;
>      struct vcpu *v = d->vcpu[0];
> -    unsigned long long value;
>      void *image_base = bootstrap_map(image);
>      unsigned long image_len = image->mod_end;
>      void *image_start = image_base + image_headroom;
> @@ -357,27 +356,36 @@ int __init dom0_construct_pv(struct doma
>          goto out;
>  
>      /* compatibility check */
> +    printk(" Xen  kernel: 64-bit, lsb%s\n",
> +           IS_ENABLED(CONFIG_PV32) ? ", compat32" : "");

Here, and below, we print out lsb/msb for the ELF file.  However, we
don't use or check that it is actually lsb, and blindly assume that it is.

Why bother printing it then?

>      compatible = 0;
>      machine = elf_uval(&elf, elf.ehdr, e_machine);
> -    printk(" Xen  kernel: 64-bit, lsb, compat32\n");
> -    if ( elf_32bit(&elf) && parms.pae == XEN_PAE_BIMODAL )
> -        parms.pae = XEN_PAE_EXTCR3;
> -    if ( elf_32bit(&elf) && parms.pae && machine == EM_386 )
> +
> +#ifdef CONFIG_PV32
> +    if ( elf_32bit(&elf) )
>      {
> -        if ( unlikely(rc = switch_compat(d)) )
> +        if ( parms.pae == XEN_PAE_BIMODAL )
> +            parms.pae = XEN_PAE_EXTCR3;
> +        if ( parms.pae && machine == EM_386 )
>          {
> -            printk("Dom0 failed to switch to compat: %d\n", rc);
> -            return rc;
> -        }
> +            if ( unlikely(rc = switch_compat(d)) )
> +            {
> +                printk("Dom0 failed to switch to compat: %d\n", rc);
> +                return rc;
> +            }
>  
> -        compatible = 1;
> +            compatible = 1;
> +        }
>      }
> -    if (elf_64bit(&elf) && machine == EM_X86_64)
> +#endif
> +
> +    if ( elf_64bit(&elf) && machine == EM_X86_64 )
>          compatible = 1;
> -    printk(" Dom0 kernel: %s%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
> -           elf_64bit(&elf) ? "64-bit" : "32-bit",
> -           parms.pae       ? ", PAE"  : "",
> -           elf_msb(&elf)   ? "msb"    : "lsb",
> +
> +    printk(" Dom0 kernel: %s-bit%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
> +           elf_64bit(&elf) ? "64" : elf_32bit(&elf) ? "32" : "??",
> +           parms.pae       ? ", PAE" : "",
> +           elf_msb(&elf)   ? "msb"   : "lsb",
>             elf.pstart, elf.pend);
>      if ( elf.bsd_symtab_pstart )
>          printk(" Dom0 symbol map %#" PRIx64 " -> %#" PRIx64 "\n",
> @@ -405,23 +413,28 @@ int __init dom0_construct_pv(struct doma
>      if ( parms.pae == XEN_PAE_EXTCR3 )
>              set_bit(VMASST_TYPE_pae_extended_cr3, &d->vm_assist);
>  
> -    if ( !pv_shim && (parms.virt_hv_start_low != UNSET_ADDR) &&
> -         elf_32bit(&elf) )
> +#ifdef CONFIG_PV32
> +    if ( elf_32bit(&elf) )
>      {
> -        unsigned long mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
> -        value = (parms.virt_hv_start_low + mask) & ~mask;
> -        BUG_ON(!is_pv_32bit_domain(d));
> -        if ( value > __HYPERVISOR_COMPAT_VIRT_START )
> -            panic("Domain 0 expects too high a hypervisor start address\n");
> -        HYPERVISOR_COMPAT_VIRT_START(d) =
> -            max_t(unsigned int, m2p_compat_vstart, value);
> -    }
> +        if ( !pv_shim && (parms.virt_hv_start_low != UNSET_ADDR) )
> +        {
> +            unsigned long mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
> +            unsigned long value = (parms.virt_hv_start_low + mask) & ~mask;

ROUNDUP() instead of opencoding it?

>  
> -    if ( (parms.p2m_base != UNSET_ADDR) && elf_32bit(&elf) )
> -    {
> -        printk(XENLOG_WARNING "P2M table base ignored\n");
> -        parms.p2m_base = UNSET_ADDR;
> +            BUG_ON(!is_pv_32bit_domain(d));

This BUG_ON() is useless.  I suspect it is a vestigial safety measure
from when the switch to compat was opencoded rather than using
switch_compat() directly.

> +            if ( value > __HYPERVISOR_COMPAT_VIRT_START )
> +                panic("Domain 0 expects too high a hypervisor start address\n");

It would be better to printk() and return -EINVAL, to be consistent with
how other fatal errors are reported to the user.

~Andrew

> +            HYPERVISOR_COMPAT_VIRT_START(d) =
> +                max_t(unsigned int, m2p_compat_vstart, value);
> +        }
> +
> +        if ( parms.p2m_base != UNSET_ADDR )
> +        {
> +            printk(XENLOG_WARNING "P2M table base ignored\n");
> +            parms.p2m_base = UNSET_ADDR;
> +        }
>      }
> +#endif
>  
>      /*
>       * Why do we need this? The number of page-table frames depends on the
>


