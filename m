Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558CAA9403B
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 01:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959592.1351916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5up3-00034n-O7; Fri, 18 Apr 2025 23:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959592.1351916; Fri, 18 Apr 2025 23:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5up3-00032H-LI; Fri, 18 Apr 2025 23:08:37 +0000
Received: by outflank-mailman (input) for mailman id 959592;
 Fri, 18 Apr 2025 23:08:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5up1-000322-D2
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 23:08:35 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d601b0e-1caa-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 01:08:34 +0200 (CEST)
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
X-Inumbo-ID: 0d601b0e-1caa-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745017713; x=1745276913;
	bh=YRFaQj2vwdGkCWEcaiorjDZfW7+Ah4yqFKB5B1a2GlA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=XVf3v4r57zK0J5xLhjSxBEXkn5LF6/DOVp47qp9sqJNxg+e9sVs7yr2Wv1BvK94pQ
	 xseJPQhotYl/WdnxDYbU/FO2UEXxCaCKAW+GSCOeJV0ndiy6g7NgaBKq8wIceoB0za
	 cJrNXTklHEgaXBZkVNJ72ZaiSGdMEJjx9TUmgHWs7Eq4y37s9gcxUPKvvRkCSwkiw0
	 ZRHfu1BGx9kOB8sg4YRW3nGo6WcSRxzL4oUiVb2SHyzSQ54PgCx9OrNRScj1El/D6u
	 f7nYYA6+0rDUz+liYccDGQDTSJerQ+VJxV0gZPQI85WP923/5K4eusFT1wjz3sbwuz
	 +yTlFojN/gEXA==
Date: Fri, 18 Apr 2025 23:08:28 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 09/13] x86/hyperlaunch: add domain id parsing to domain config
Message-ID: <aALbaXZlBeWtCAZt@kraken>
In-Reply-To: <20250417124844.11143-10-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-10-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 95e9b8a7295910cbcc646d4f997f08935a62b8ac
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:31PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Introduce the ability to specify the desired domain id for the domain
> definition. The domain id will be populated in the domid property of the
> domain node in the device tree configuration.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * Add missing newline
>   * Adjusted printks
>   * Checked domid node against list of outstanding domids.
> ---
>  xen/arch/x86/setup.c            |  5 ++--
>  xen/common/domain-builder/fdt.c | 51 ++++++++++++++++++++++++++++++++-
>  2 files changed, 53 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 76ceb5221f..04ad2d0937 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1033,8 +1033,9 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>      if ( iommu_enabled )
>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>=20
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid =3D get_initial_domain_id();
> +    if ( bd->domid =3D=3D DOMID_INVALID )
> +        /* Create initial domain.  Not d0 for pvshim. */
> +        bd->domid =3D get_initial_domain_id();
>      d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileg=
ed);
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index c0f526a4ce..0d3c713041 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) 2024, Apertus Solutions, LLC
>   */
> +#include <xen/domain.h>
>  #include <xen/err.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> @@ -178,12 +179,54 @@ static int __init fdt_read_multiboot_module(const v=
oid *fdt, int node,
>  static int __init process_domain_node(
>      struct boot_info *bi, const void *fdt, int dom_node)
>  {
> -    int node;
> +    int node, property;
>      struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>      const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>      int address_cells =3D fdt_address_cells(fdt, dom_node);
>      int size_cells =3D fdt_size_cells(fdt, dom_node);
>=20
> +    fdt_for_each_property_offset(property, fdt, dom_node)
> +    {
> +        const struct fdt_property *prop;
> +        const char *prop_name;
> +        int name_len, rc;
> +
> +        prop =3D fdt_get_property_by_offset(fdt, property, NULL);
> +        if ( !prop )
> +            continue; /* silently skip */
> +
> +        prop_name =3D fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &=
name_len);
> +
> +        if ( !strncmp(prop_name, "domid", name_len) )
> +        {
> +            uint32_t val =3D DOMID_INVALID;
> +
> +            if ( (rc =3D fdt_prop_as_u32(prop, &val)) )
> +            {
> +                printk(XENLOG_ERR
> +                       "  failed processing domain id for domain %s\n", =
name);
> +                return rc;
> +            }
> +            if ( val >=3D DOMID_FIRST_RESERVED )
> +            {
> +                printk(XENLOG_ERR "  invalid domain id for domain %s\n",=
 name);
> +                return -EINVAL;
> +            }
> +
> +            for ( unsigned int i =3D 0; i < bi->nr_domains; i++ )
> +            {
> +                if ( bi->domains[i].domid =3D=3D val )
> +                {
> +                    printk(XENLOG_ERR "  duplicate id for domain %s\n", =
name);
> +                    return -EINVAL;
> +                }
> +            }
> +
> +            bd->domid =3D val;
> +            printk(XENLOG_INFO "  domid: %d\n", bd->domid);
> +        }
> +    }
> +
>      fdt_for_each_subnode(node, fdt, dom_node)
>      {
>          if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") )
> @@ -249,6 +292,12 @@ static int __init process_domain_node(
>          return -ENODATA;
>      }
>=20
> +    if ( bd->domid =3D=3D DOMID_INVALID )
> +        bd->domid =3D get_initial_domain_id();
> +    else if ( bd->domid !=3D get_initial_domain_id() )
> +        printk(XENLOG_WARNING
> +               "Warning: Unsuported boot with missing initial domid\n");

s/Unsuported/Unsupported/

Also, add bd->domid to the printout?

> +
>      return 0;
>  }
>=20
> --
> 2.43.0
>=20
>=20


