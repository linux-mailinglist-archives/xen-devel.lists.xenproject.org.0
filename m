Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7AA94010
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 00:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959563.1351895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uay-0000TN-8M; Fri, 18 Apr 2025 22:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959563.1351895; Fri, 18 Apr 2025 22:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uay-0000Ru-5Z; Fri, 18 Apr 2025 22:54:04 +0000
Received: by outflank-mailman (input) for mailman id 959563;
 Fri, 18 Apr 2025 22:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5uaw-0000Rl-2W
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 22:54:03 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ccf9d3-1ca8-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 00:53:59 +0200 (CEST)
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
X-Inumbo-ID: 03ccf9d3-1ca8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745016838; x=1745276038;
	bh=fL229BqbvUMm0mrachr4V60O/3wGRqPLzkk7FJUFjNk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fm/sf1yOCG5mj2xtfQgUpFKlw0lmGS5ZATgP3c01GVwTlP5lqa3OPqLt6OpWSHDM3
	 fjK8Z0U8/gN5bZL+PEhZZ4Ra4cB+3Peubb6CjrnlyCOaz8rYvcgEvFf5MKeBqFHD3e
	 1CIHdhFJcGumz4t1NQFuLkoB0H16IY3NRPWrXY+5E4p5VAK1VCBbuaqofC4Otv6Ey1
	 OatGBWP53/uSEaOAjctt82Ee/9t14XQf0+GBcSUbmMT6SCzLkgGtm3lxpIO8e7nMsM
	 ebtytz+y9dt5/DHNzAFNzkbrfXpraUlEiUzq3tyYtF8PUOFtBA6qh74K+O4oHR9ku0
	 smDs+aTNR09ZQ==
Date: Fri, 18 Apr 2025 22:53:54 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 07/13] x86/hyperlaunch: obtain cmdline from device tree
Message-ID: <aALX/NgsSi5sTyz3@kraken>
In-Reply-To: <20250417124844.11143-8-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-8-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 43d8be86eb6796d2a539c07520b3bd6acbc3cdb8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:29PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Add support to read the command line from the hyperlauunch device tree.
> The device tree command line is located in the "bootargs" property of the
> "multiboot,kernel" node.
>=20
> A boot loader command line, e.g. a grub module string field, takes
> precendence ove the device tree one since it is easier to modify.

              ^^ over

Also, I would explain the command line parsing rules in the code commentary=
 for
domain_cmdline_size() below.

>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * Removed __init from header declarations.
>   * Removed ifdef guards, as DCE ensures the missing definitions don't
>     matter.
>   * Removed ifdef guards from new helpers in domain-builder/fdt.c
>     * Rely on DCE instead.
>   * Restored checks for cmdline_pa being zero.
>   * swapped offset and poffset varnames in libfdt-xen.h helper.
>   * swapped name and pname varnames in libfdt-xen.h helper.
>   * Turned foo =3D=3D 0  into !foo in libfdt-xen.h helper.
> ---
>  xen/arch/x86/include/asm/bootinfo.h |  6 ++++--
>  xen/arch/x86/setup.c                | 10 +++++++--
>  xen/common/domain-builder/core.c    | 32 +++++++++++++++++++++++++++++
>  xen/common/domain-builder/fdt.c     |  6 ++++++
>  xen/common/domain-builder/fdt.h     | 24 ++++++++++++++++++++++
>  xen/include/xen/domain-builder.h    |  4 ++++
>  xen/include/xen/libfdt/libfdt-xen.h | 23 +++++++++++++++++++++
>  7 files changed, 101 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/a=
sm/bootinfo.h
> index 1e3d582e45..5b2c93b1ef 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -35,11 +35,13 @@ struct boot_module {
>=20
>      /*
>       * Module State Flags:
> -     *   relocated: indicates module has been relocated in memory.
> -     *   released:  indicates module's pages have been freed.
> +     *   relocated:   indicates module has been relocated in memory.
> +     *   released:    indicates module's pages have been freed.
> +     *   fdt_cmdline: indicates module's cmdline is in the FDT.
>       */
>      bool relocated:1;
>      bool released:1;
> +    bool fdt_cmdline:1;
>=20
>      /*
>       * A boot module may need decompressing by Xen.  Headroom is an esti=
mate of
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4f669f3c60..4cae13163b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(const struc=
t boot_info *bi,
>  {
>      size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>=20
> -    s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa))=
 : 0;
> +    if ( bd->kernel->fdt_cmdline )
> +        s +=3D builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
> +    else if ( bd->kernel->cmdline_pa )
> +        s +=3D strlen(__va(bd->kernel->cmdline_pa));
>=20
>      if ( s =3D=3D 0 )
>          return s;
> @@ -1047,7 +1050,10 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>          if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
>              panic("Error allocating cmdline buffer for %pd\n", d);
>=20
> -        if ( bd->kernel->cmdline_pa )
> +        if ( bd->kernel->fdt_cmdline )
> +            builder_get_cmdline(
> +                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
> +        else if ( bd->kernel->cmdline_pa )
>              strlcpy(cmdline,
>                      cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loade=
r),
>                      cmdline_size);
> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder=
/core.c
> index 924cb495a3..4b4230f2ff 100644
> --- a/xen/common/domain-builder/core.c
> +++ b/xen/common/domain-builder/core.c
> @@ -8,9 +8,41 @@
>  #include <xen/lib.h>
>=20
>  #include <asm/bootinfo.h>
> +#include <asm/setup.h>
>=20
>  #include "fdt.h"
>=20
> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
> +{
> +    const void *fdt;
> +    int size;
> +
> +    if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> +        return 0;
> +
> +    fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +    size =3D fdt_cmdline_prop_size(fdt, offset);
> +    bootstrap_unmap();
> +
> +    return max(0, size);
> +}
> +
> +int __init builder_get_cmdline(
> +    struct boot_info *bi, int offset, char *cmdline, size_t size)
> +{
> +    const void *fdt;
> +    int ret;
> +
> +    if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> +        return 0;
> +
> +    fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +    ret =3D fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
> +    bootstrap_unmap();
> +
> +    return ret;
> +}
> +
>  void __init builder_init(struct boot_info *bi)
>  {
>      bi->hyperlaunch_enabled =3D false;
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index 1fae6add3b..50fde2d007 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -209,6 +209,12 @@ static int __init process_domain_node(
>              printk(XENLOG_INFO "  kernel: multiboot-index=3D%d\n", idx);
>              bi->mods[idx].type =3D BOOTMOD_KERNEL;
>              bd->kernel =3D &bi->mods[idx];
> +
> +            /* If bootloader didn't set cmdline, see if FDT provides one=
. */
> +            if ( bd->kernel->cmdline_pa &&
> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
> +                bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
> +                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>          }
>      }
>=20
> diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/=
fdt.h
> index 8c98a256eb..d2ae7d5c36 100644
> --- a/xen/common/domain-builder/fdt.h
> +++ b/xen/common/domain-builder/fdt.h
> @@ -9,6 +9,30 @@ struct boot_info;
>  /* hyperlaunch fdt is required to be module 0 */
>  #define HYPERLAUNCH_MODULE_IDX 0
>=20
> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int offs=
et)
> +{
> +    int ret;
> +
> +    fdt_get_property_by_offset(fdt, offset, &ret);

Perhaps something like

       (void)fdt_get_property_by_offset...

since there's no need to check the return value?

> +
> +    return ret;
> +}
> +
> +static inline int __init fdt_cmdline_prop_copy(
> +    const void *fdt, int offset, char *cmdline, size_t size)
> +{
> +    int ret;
> +    const struct fdt_property *prop =3D
> +        fdt_get_property_by_offset(fdt, offset, &ret);
> +
> +    if ( ret < 0 )
> +        return ret;
> +
> +    ASSERT(size > ret);
> +
> +    return strlcpy(cmdline, prop->data, ret);
> +}
> +
>  int has_hyperlaunch_fdt(const struct boot_info *bi);
>  int walk_hyperlaunch_fdt(struct boot_info *bi);
>=20
> diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-bu=
ilder.h
> index ac2b84775d..ac0fd8f60b 100644
> --- a/xen/include/xen/domain-builder.h
> +++ b/xen/include/xen/domain-builder.h
> @@ -4,6 +4,10 @@
>=20
>  struct boot_info;
>=20
> +size_t builder_get_cmdline_size(const struct boot_info *bi, int offset);
> +int builder_get_cmdline(const struct boot_info *bi, int offset,
> +                               char *cmdline, size_t size);
> +
>  void builder_init(struct boot_info *bi);
>=20
>  #endif /* __XEN_DOMAIN_BUILDER_H__ */
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt=
/libfdt-xen.h
> index deafb25d98..afc76e7750 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -24,6 +24,29 @@ static inline int __init fdt_prop_as_u32(
>      return 0;
>  }
>=20
> +static inline bool __init fdt_get_prop_offset(
> +    const void *fdt, int node, const char *pname, unsigned long *poffset=
)
> +{
> +    int ret, offset;
> +    const char *name;
> +
> +    fdt_for_each_property_offset(offset, fdt, node)
> +    {
> +        fdt_getprop_by_offset(fdt, offset, &name, &ret);

Add

           (void)fdt_get_property_by_offset...

here as well?

> +
> +        if ( ret < 0 )
> +            continue;
> +
> +        if ( !strcmp(name, pname) )
> +        {
> +            *poffset =3D offset;
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
>                                          paddr_t *address,
>                                          paddr_t *size)
> --
> 2.43.0
>=20
>=20


