Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0BA94046
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 01:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959642.1351957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5v4O-0007r2-MQ; Fri, 18 Apr 2025 23:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959642.1351957; Fri, 18 Apr 2025 23:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5v4O-0007nv-IS; Fri, 18 Apr 2025 23:24:28 +0000
Received: by outflank-mailman (input) for mailman id 959642;
 Fri, 18 Apr 2025 23:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5v4M-0007np-HK
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 23:24:26 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43af7b48-1cac-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 01:24:24 +0200 (CEST)
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
X-Inumbo-ID: 43af7b48-1cac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745018663; x=1745277863;
	bh=nAvzqArqYSTLRURa4P6i3KNfYYfKYXiGJKp1lDObgqc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=G4joejYVCRw0Q/6QoVR64gS/em2jq1fddH3ExGwoij+hG3F/5EYonMmf5C4STB8Yx
	 HOPqS/EvTTzBrxT4kn3e1YkntT9ZYra1RjnT7glDHRd/YbLAId5IXgxooZnBIL6BKl
	 7eAG113vnVHL10trTBjGONtkUvmGl5aY086xT1e6kxmKh2UX0xCDeL9xhB4j1UfLSt
	 y1EDa69khs4EOtKcVBVVZU+lHhcQgvmn6oa+3qYA0qFWhPPtvehLJ0iNTAEARi2sFd
	 IeaBHq155izaqtLdtg0rEpVAwd0d+Eltv0Nrnz3mWktz9b7imyLVYmyuwXc5Hmt2SZ
	 i8Hi4rnVuSShQ==
Date: Fri, 18 Apr 2025 23:24:20 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 13/13] x86/hyperlaunch: add capabilities to boot domain
Message-ID: <aALfIbTCAO95zycA@kraken>
In-Reply-To: <20250417124844.11143-14-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-14-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3cce8b891f41d010930a5b93ca4a50da3357058e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:35PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Introduce the ability to assign capabilities to a domain via its definiti=
on in
> device tree. The first capability enabled to select is the control domain
> capability. The capability property is a bitfield in both the device tree=
 and
> `struct boot_domain`.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
> v4:
>   * Dropped Jason's R-by.
>   * Refactored caps printinng logic
>     * It just wasn't xenlog-compatible as it was.
>   * Moved pv_shim check to builder_init, so the capability is just not gi=
ven.
>     * And inlined the create_flags variable now that's tractable.
>   * Validated input capabilities after coming out of the DT.
> ---
>  xen/arch/x86/include/asm/boot-domain.h |  5 +++++
>  xen/arch/x86/setup.c                   |  3 ++-
>  xen/common/domain-builder/core.c       |  2 ++
>  xen/common/domain-builder/fdt.c        | 20 ++++++++++++++++++++
>  4 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index 969c02a6ea..5c143d82af 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -13,6 +13,11 @@
>  struct boot_domain {
>      domid_t domid;
>=20
> +#define BUILD_CAPS_NONE          (0U)
> +#define BUILD_CAPS_CONTROL       (1U << 0)
> +#define BUILD_CAPS__ALL          BUILD_CAPS_CONTROL
> +    uint32_t capabilities;
> +
>                                            /* On     | Off    */
>  #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
>  #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 455dad454c..3cdd8bc2f9 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1040,7 +1040,8 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>      if ( bd->domid =3D=3D DOMID_INVALID )
>          /* Create initial domain.  Not d0 for pvshim. */
>          bd->domid =3D get_initial_domain_id();
> -    d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileg=
ed);
> +    d =3D domain_create(bd->domid, &dom0_cfg,
> +            (bd->capabilities & BUILD_CAPS_CONTROL) ? CDF_privileged : 0=
);
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>=20
> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder=
/core.c
> index 4b4230f2ff..d1a5d6125e 100644
> --- a/xen/common/domain-builder/core.c
> +++ b/xen/common/domain-builder/core.c
> @@ -8,6 +8,7 @@
>  #include <xen/lib.h>
>=20
>  #include <asm/bootinfo.h>
> +#include <asm/pv/shim.h>
>  #include <asm/setup.h>
>=20
>  #include "fdt.h"
> @@ -93,6 +94,7 @@ void __init builder_init(struct boot_info *bi)
>=20
>          bi->mods[i].type =3D BOOTMOD_KERNEL;
>          bi->domains[0].kernel =3D &bi->mods[i];
> +        bi->domains[0].capabilities |=3D pv_shim ? 0 : BUILD_CAPS_CONTRO=
L;
>          bi->nr_domains =3D 1;
>      }
>  }
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index 295ab6e8b3..3e3a84e2d0 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -293,6 +293,26 @@ static int __init process_domain_node(
>              bd->max_vcpus =3D val;
>              printk(XENLOG_INFO "  cpus: %d\n", bd->max_vcpus);
>          }
> +        else if ( !strncmp(prop_name, "capabilities", name_len) )
> +        {
> +            if ( (rc =3D fdt_prop_as_u32(prop, &bd->capabilities)) )
> +            {
> +                printk(XENLOG_ERR
> +                       "  bad \"capabilities\" on domain %s\n", name);
> +                return rc;
> +            }
> +
> +            if ( bd->capabilities & ~BUILD_CAPS__ALL )
> +            {
> +                printk(XENLOG_WARNING "  unknown capabilities: %#x\n",
> +                       bd->capabilities & ~BUILD_CAPS__ALL);
> +
> +                bd->capabilities &=3D BUILD_CAPS__ALL;
> +            }
> +
> +            printk(XENLOG_INFO "  caps: %s\n",
> +                   bd->capabilities & BUILD_CAPS_CONTROL ? "c" : "");
> +        }
>      }
>=20
>      fdt_for_each_subnode(node, fdt, dom_node)
> --
> 2.43.0
>=20
>=20


