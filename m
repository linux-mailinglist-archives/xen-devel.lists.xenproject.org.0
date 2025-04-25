Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F28A9D596
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968732.1358210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RbE-0004yJ-CB; Fri, 25 Apr 2025 22:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968732.1358210; Fri, 25 Apr 2025 22:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RbE-0004wr-9F; Fri, 25 Apr 2025 22:32:48 +0000
Received: by outflank-mailman (input) for mailman id 968732;
 Fri, 25 Apr 2025 22:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u8RbC-0004wl-Fi
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:32:46 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33dc716e-2225-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 00:32:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745620352081239.80620416230045;
 Fri, 25 Apr 2025 15:32:32 -0700 (PDT)
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
X-Inumbo-ID: 33dc716e-2225-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745620355; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=buh0OfJbewPaveiRr4TXanXk54WRLkbIni7Qsb4gewx/KvKi+OgNGEHIB8Q/TZLKlQfS71oh0cXdfRmlx1hVZVjvG8KpY+izRxr3rP+4FHdsOFokWxVstolomKrYLW5bHA51nO/JiHgS4fNX1MBOrsvXJ3t3TKWFvvIHxpuS+zI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745620355; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eFlV5b2njNjufOlO07MaEi6D6dwi8/8CDWQ5e3NHaL0=; 
	b=ffgkMt1743jY2+QerVbNx+fD0A7LtlQZP8liO9RiAF90T2YpwpNSIV3GYCzAbrIRZfWmWqH4jHwKES3+CHrwNDVCON+s6FQvWR886yXzOot/LJlgWLAuUG77gUbt+d5S2pfvFKNejHBx6iUo5fRJF2+wX1f7RnvrJZXRo9q/bl4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745620355;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eFlV5b2njNjufOlO07MaEi6D6dwi8/8CDWQ5e3NHaL0=;
	b=U9ijsq5+N9MFkDaGMF/Swc1bPJRkNatmBgSS7esif6SU4DkIw2YIM3X/2cKDh+pV
	p6rt30K8DelFKakln+ft/Ru25Y/XB3Wqspnvmy+wkZahT2Wlk49vbtmBYakZufG3p7D
	J3A266BSkhRfypsnxqBZuiCpU1yqlE8y3Og3DX9k=
Message-ID: <15e4ef59-183d-470b-b596-86f4b5e56bd4@apertussolutions.com>
Date: Fri, 25 Apr 2025 18:32:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
 <20250424161027.92942-6-agarciav@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20250424161027.92942-6-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/24/25 12:10, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Look for a subnode of type `multiboot,kernel` within a domain node. If
> found, locate it using the multiboot module helper to generically ensure
> it lives in the module list. If the bootargs property is present and
> there was not an MB1 string, then use the command line from the device
> tree definition.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v5:
>    * Add domain name to the error path on no-kernel.
> ---
>   xen/arch/x86/setup.c            |  1 +
>   xen/common/domain-builder/fdt.c | 64 +++++++++++++++++++++++++++++++--
>   2 files changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index bd13d9d196..7e756302ae 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1290,6 +1290,7 @@ void asmlinkage __init noreturn __start_xen(void)
>           i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>           bi->mods[i].type = BOOTMOD_KERNEL;
>           bi->domains[0].kernel = &bi->mods[i];
> +        bi->nr_domains = 1;
>           bi->hyperlaunch_enabled = false;
>       }
>   
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
> index 11f0436e85..662c715483 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -99,9 +99,9 @@ static int __init fdt_prop_as_reg(const struct fdt_property *prop,
>    * @return              -EINVAL on malformed nodes, otherwise
>    *                      index inside `bi->mods`
>    */
> -int __init fdt_read_multiboot_module(const void *fdt, int node,
> -                                     int address_cells, int size_cells,
> -                                     struct boot_info *bi)
> +static int __init fdt_read_multiboot_module(const void *fdt, int node,
> +                                            int address_cells, int size_cells,
> +                                            struct boot_info *bi)

Shouldn't this belong to when the function was introduced? Though 
looking there, you push it out into the header? Guess the real question 
is it static or not?

>   {
>       const struct fdt_property *prop;
>       uint64_t addr, size;
> @@ -185,6 +185,52 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
>       return idx;
>   }
>   
> +static int __init process_domain_node(
> +    struct boot_info *bi, const void *fdt, int dom_node)
> +{
> +    int node;
> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
> +    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> +    int address_cells = fdt_address_cells(fdt, dom_node);
> +    int size_cells = fdt_size_cells(fdt, dom_node);
> +
> +    fdt_for_each_subnode(node, fdt, dom_node)
> +    {
> +        if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") )
> +        {
> +            int idx;
> +
> +            if ( bd->kernel )
> +            {
> +                printk(XENLOG_WARNING
> +                       "  duplicate kernel for domain %s\n", name);
> +                continue;
> +            }
> +
> +            idx = fdt_read_multiboot_module(fdt, node, address_cells,
> +                                            size_cells, bi);
> +            if ( idx < 0 )
> +            {
> +                printk(XENLOG_ERR
> +                       "  failed processing kernel for domain %s\n", name);
> +                return idx;
> +            }
> +
> +            printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
> +            bi->mods[idx].type = BOOTMOD_KERNEL;
> +            bd->kernel = &bi->mods[idx];
> +        }
> +    }
> +
> +    if ( !bd->kernel )
> +    {
> +        printk(XENLOG_ERR "error: no kernel assigned to domain %s\n", name);
> +        return -ENODATA;
> +    }
> +
> +    return 0;
> +}
> +
>   static int __init find_hyperlaunch_node(const void *fdt)
>   {
>       int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
> @@ -248,8 +294,20 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi)
>   
>       fdt_for_each_subnode(node, fdt, hv_node)
>       {
> +        if ( bi->nr_domains >= MAX_NR_BOOTDOMS )
> +        {
> +            printk(XENLOG_WARNING "warning: only creating first %u domains\n",
> +                   MAX_NR_BOOTDOMS);
> +            break;
> +        }
> +
>           if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
> +        {
> +            if ( (ret = process_domain_node(bi, fdt, node)) < 0 )
> +                break;
> +
>               bi->nr_domains++;
> +        }
>       }
>   
>       /* Until multi-domain construction is added, throw an error */


