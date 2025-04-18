Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC8A93FED
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 00:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959528.1351875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uMy-0005DW-TE; Fri, 18 Apr 2025 22:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959528.1351875; Fri, 18 Apr 2025 22:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uMy-0005Az-Qi; Fri, 18 Apr 2025 22:39:36 +0000
Received: by outflank-mailman (input) for mailman id 959528;
 Fri, 18 Apr 2025 22:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5uMx-0005At-HM
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 22:39:35 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd2cacc6-1ca5-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 00:39:29 +0200 (CEST)
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
X-Inumbo-ID: fd2cacc6-1ca5-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mokn3byejbc5hefyiq4u7aj6ve.protonmail; t=1745015968; x=1745275168;
	bh=tL/CcJNQc9FGvrf2sfdEHk3SqdAdj4qS2iAMoUFpRq8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=i20GIJUsUURIJ5cGh5FnZg7XF+rV6FYH1ceyJfumJpUCTypcNvgDtA4VBnhAuLmj4
	 cnrbHaznfg83eAwdehC0SMtlGF4jxKDU/erSWd/Ze7ukeLfS7TscfTPpWYU+NuBCh5
	 9dXehnlE4EMO7MRlw0kk2vqszAaJc/EfoQOAvIL0oB1mn4mPLwbntz6xjDPEXb4Ben
	 wkwrqdqpEbVLEeHjJRUb9rHaitdiiaBV0HQzg+1kPUyFfw/pGf70vBhn4+sQ14oABY
	 a6z3rvXzyQ6BAId8RzcxUhwTPrxX8kQYQ7dqlshPMUUHq05kpL9rEaMtdz2O4KiQ1W
	 zYkgi0Aa73wdA==
Date: Fri, 18 Apr 2025 22:39:23 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 06/13] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Message-ID: <aALUlz6ZgwqSb0tD@kraken>
In-Reply-To: <20250417124844.11143-7-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-7-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7fd6263066db8f7f10d77cace505a7bea9a9537e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:28PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Look for a subnode of type `multiboot,kernel` within a domain node. If
> found, locate it using the multiboot module helper to generically ensure
> it lives in the module list. If the bootargs property is present and
> there was not an MB1 string, then use the command line from the device
> tree definition.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * Stop printing on the fallback path of builder_init().
>     It's in fact the most common path and just adds noise.
>   * Add missing XENLOG_X.
>   * Simplified check to log error on nr_domains !=3D 1.
>   * s/XENLOG_ERR/XENLOG_WARNING/ on duplicate kernel.
>   * Turned foo =3D=3D 0 into !foo in the "multiboot,kernel" check
> ---
>  xen/arch/x86/setup.c             |  5 ---
>  xen/common/domain-builder/core.c |  9 +++++
>  xen/common/domain-builder/fdt.c  | 64 ++++++++++++++++++++++++++++++--
>  xen/include/xen/domain-builder.h |  3 --
>  4 files changed, 70 insertions(+), 11 deletions(-)
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index ccc57cc70a..4f669f3c60 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1285,11 +1285,6 @@ void asmlinkage __init noreturn __start_xen(void)
>=20
>      builder_init(bi);
>=20
> -    /* Find first unknown boot module to use as dom0 kernel */
> -    i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> -    bi->mods[i].type =3D BOOTMOD_KERNEL;
> -    bi->domains[0].kernel =3D &bi->mods[i];
> -
>      if ( pvh_boot )
>      {
>          /* pvh_init() already filled in e820_raw */
> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder=
/core.c
> index 3b062e85ec..924cb495a3 100644
> --- a/xen/common/domain-builder/core.c
> +++ b/xen/common/domain-builder/core.c
> @@ -54,6 +54,15 @@ void __init builder_init(struct boot_info *bi)
>=20
>          printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains);
>      }
> +    else
> +    {
> +        /* Find first unknown boot module to use as dom0 kernel */
> +        unsigned int i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +
> +        bi->mods[i].type =3D BOOTMOD_KERNEL;
> +        bi->domains[0].kernel =3D &bi->mods[i];
> +        bi->nr_domains =3D 1;
> +    }
>  }
>=20
>  /*
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index d73536fed6..1fae6add3b 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -89,9 +89,9 @@ static int __init read_fdt_prop_as_reg(const struct fdt=
_property *prop,
>   * @return              -EINVAL on malformed nodes, otherwise
>   *                      index inside `bi->mods`
>   */
> -int __init fdt_read_multiboot_module(const void *fdt, int node,
> -                                     int address_cells, int size_cells,
> -                                     struct boot_info *bi)
> +static int __init fdt_read_multiboot_module(const void *fdt, int node,
> +                                            int address_cells, int size_=
cells,
> +                                            struct boot_info *bi)
>  {
>      const struct fdt_property *prop;
>      uint64_t addr, size;
> @@ -175,6 +175,52 @@ int __init fdt_read_multiboot_module(const void *fdt=
, int node,
>      return idx;
>  }
>=20
> +static int __init process_domain_node(
> +    struct boot_info *bi, const void *fdt, int dom_node)
> +{
> +    int node;
> +    struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
> +    const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> +    int address_cells =3D fdt_address_cells(fdt, dom_node);
> +    int size_cells =3D fdt_size_cells(fdt, dom_node);
> +
> +    fdt_for_each_subnode(node, fdt, dom_node)
> +    {
> +        if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") )

Suggest to restructure the code to reduce levels of indentation, e.g.:

           int idx;

           if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") )
               continue;

           if ( bd->kernel )
              ...


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
> +            idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
> +                                            size_cells, bi);
> +            if ( idx < 0 )
> +            {
> +                printk(XENLOG_ERR
> +                       "  failed processing kernel for domain %s\n", nam=
e);
> +                return idx;
> +            }
> +
> +            printk(XENLOG_INFO "  kernel: multiboot-index=3D%d\n", idx);
> +            bi->mods[idx].type =3D BOOTMOD_KERNEL;
> +            bd->kernel =3D &bi->mods[idx];
> +        }
> +    }
> +
> +    if ( !bd->kernel )
> +    {
> +        printk(XENLOG_ERR "error: no kernel assigned to domain\n");

Add domain name printout similar to above logging?

> +        return -ENODATA;
> +    }
> +
> +    return 0;
> +}
> +
>  static int __init find_hyperlaunch_node(const void *fdt)
>  {
>      int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
> @@ -237,8 +283,20 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi=
)
>=20
>      fdt_for_each_subnode(node, fdt, hv_node)
>      {
> +        if ( bi->nr_domains >=3D MAX_NR_BOOTDOMS )
> +        {
> +            printk(XENLOG_WARNING "warning: only creating first %u domai=
ns\n",
> +                   MAX_NR_BOOTDOMS);
> +            break;
> +        }
> +
>          if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
> +        {
> +            if ( (ret =3D process_domain_node(bi, fdt, node)) < 0 )
> +                break;
> +
>              bi->nr_domains++;
> +        }
>      }
>=20
>      /* Until multi-domain construction is added, throw an error */
> diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-bu=
ilder.h
> index ace6b6875b..ac2b84775d 100644
> --- a/xen/include/xen/domain-builder.h
> +++ b/xen/include/xen/domain-builder.h
> @@ -5,8 +5,5 @@
>  struct boot_info;
>=20
>  void builder_init(struct boot_info *bi);
> -int fdt_read_multiboot_module(const void *fdt, int node,
> -                              int address_cells, int size_cells,
> -                              struct boot_info *bi)
>=20
>  #endif /* __XEN_DOMAIN_BUILDER_H__ */
> --
> 2.43.0
>=20
>=20


