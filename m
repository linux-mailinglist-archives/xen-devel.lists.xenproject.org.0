Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FE8A94013
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 00:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959576.1351906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ufT-00013i-Oy; Fri, 18 Apr 2025 22:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959576.1351906; Fri, 18 Apr 2025 22:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ufT-00011d-M3; Fri, 18 Apr 2025 22:58:43 +0000
Received: by outflank-mailman (input) for mailman id 959576;
 Fri, 18 Apr 2025 22:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5ufR-00011X-Sv
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 22:58:41 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab76a322-1ca8-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 00:58:40 +0200 (CEST)
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
X-Inumbo-ID: ab76a322-1ca8-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745017119; x=1745276319;
	bh=gvK2IXpBWpYcayhH70GXF1b//QKATsklrEdCGPGk4+0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KU+K4sgN6Y311HLu/uswNl40xXLOrk1a/eiSOAFI+2ZLtW5wc7IlfuaUo2hF2Y2Ev
	 881Ta5SftQ3BuMMbgdJ2fiBlnv3nzwxewENcWklPyGOhkrcsNeC36ie1ynVyTe2XsY
	 HHdkHBetLEZEdlczm4m2iNbUiXg2HLepSTk84YguskY+92G5lSHyBpB9t2UBxxaR7e
	 vcRnEwrrsPk85E8/ztib5yBZmv0FaS7EegosLyHzkyB/9Y3jQQUeoQc6On3P2m1eHO
	 3Nu6zmT0JgtaA0Ubsf05EVdgJuo0fKVgONOoqqrVvxgxD7ZW8W2QWOkpmurDnyEo+U
	 FWm8JqOTvsjgw==
Date: Fri, 18 Apr 2025 22:58:36 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 08/13] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Message-ID: <aALZGCW4IXPo87wb@kraken>
In-Reply-To: <20250417124844.11143-9-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-9-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8f6007934b7ac535a88147d2d940c4d00467abd8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:30PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Look for a subnode of type `multiboot,ramdisk` within a domain node and
> parse via the fdt_read_multiboot_module() helper. After a successful
> helper call, the module index is returned and the module is guaranteed
> to be in the module list.
>=20
> Fix unused typo in adjacent comment.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v4:
>   * s/XENLOG_ERR/XENLOG_WARNING/ on duplicate ramdisk.
>   * Removed stray ")" in printk
>   * s/else if/if/ (because of continue)
>   * Removed trailing continue
> ---
>  xen/arch/x86/setup.c            |  4 ++--
>  xen/common/domain-builder/fdt.c | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4cae13163b..76ceb5221f 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2150,11 +2150,11 @@ void asmlinkage __init noreturn __start_xen(void)
>       * At this point all capabilities that consume boot modules should h=
ave
>       * claimed their boot modules. Find the first unclaimed boot module =
and
>       * claim it as the initrd ramdisk. Do a second search to see if ther=
e are
> -     * any remaining unclaimed boot modules, and report them as unusued =
initrd
> +     * any remaining unclaimed boot modules, and report them as unused i=
nitrd
>       * candidates.
>       */
>      initrdidx =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> -    if ( initrdidx < MAX_NR_BOOTMODS )
> +    if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
>      {
>          bi->mods[initrdidx].type =3D BOOTMOD_RAMDISK;
>          bi->domains[0].module =3D &bi->mods[initrdidx];
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index 50fde2d007..c0f526a4ce 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -216,6 +216,31 @@ static int __init process_domain_node(
>                  bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>                      fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>          }
> +        else if ( !fdt_node_check_compatible(fdt, node, "multiboot,ramdi=
sk") )
> +        {
> +            int idx;
> +
> +            if ( bd->module )
> +            {
> +                printk(XENLOG_WARNING
> +                       "Duplicate module for domain %s\n", name);
> +                continue;
> +            }
> +
> +            idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
> +                                            size_cells, bi);
> +            if ( idx < 0 )
> +            {
> +                printk(XENLOG_ERR
> +                       "  failed processing module for domain %s\n",
> +                       name);
> +                return -EINVAL;

Propagate fdt_read_multiboot_module()'s error to the caller, i.e.:

                   return idx;

?

> +            }
> +
> +            printk(XENLOG_INFO "  module: multiboot-index=3D%d\n", idx);
> +            bi->mods[idx].type =3D BOOTMOD_RAMDISK;
> +            bd->module =3D &bi->mods[idx];
> +        }
>      }
>=20
>      if ( !bd->kernel )
> --
> 2.43.0
>=20
>=20


