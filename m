Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C395A9403D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 01:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959604.1351926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uqd-0004Wx-25; Fri, 18 Apr 2025 23:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959604.1351926; Fri, 18 Apr 2025 23:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uqc-0004UP-VT; Fri, 18 Apr 2025 23:10:14 +0000
Received: by outflank-mailman (input) for mailman id 959604;
 Fri, 18 Apr 2025 23:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5uqc-0004UJ-4f
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 23:10:14 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 479c0de7-1caa-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 01:10:12 +0200 (CEST)
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
X-Inumbo-ID: 479c0de7-1caa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745017810; x=1745277010;
	bh=Ggx9XJWtrOsKirQPVxCNOnn6wdz/asscbpbQdR83pG4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dt9sK1ZvpJrssp60Ai/MTZN3Famdn90GVZ/c9teMBZwdCpBCIlIvpfQw4Hsi2ICx/
	 EnUdPfwxZ49POQ9UQNpqxSkmNU8m+Akrt/ipAhpk0bJanV9uU0IaR07XnX8rn33PuH
	 c3yERlg6YQcATtnZbjOqGAe9MjQOI1aQHq8wgAea7vfsS7mG7wpnE6jTB/hBGWPQwZ
	 yNNZ0+x4PpZDAFrrs0KCS+frLk2iVH0gLIzeYtXLMiObIl0ONCWZCqXDrQ0fiLUq7M
	 46RzxWnteydC9wKFMqjjS/Tcvi6PSw7Uf2l5hC9FDuI2x6URPm7xjsmewrrwjiIQtU
	 Is118cDhbvHVg==
Date: Fri, 18 Apr 2025 23:10:05 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 10/13] x86/hyperlaunch: specify dom0 mode with device tree
Message-ID: <aALbyauYjtTErno5@kraken>
In-Reply-To: <20250417124844.11143-11-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-11-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c34f322bb8364bfbacd10fea4c5e44c4d89ec955
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:32PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Enable selecting the mode in which the domain will be built and ran. This
> includes:
>=20
>   - whether it will be either a 32/64 bit domain
>   - if it will be run as a PV or HVM domain
>   - and if it will require a device model (not applicable for dom0)
>=20
> In the device tree, this will be represented as a bit map that will be ca=
rried
> through into struct boot_domain.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
> v4:
>   * printk adjustments
>   * reject nodes with conflicting mode settings
> ---
>  xen/arch/x86/include/asm/boot-domain.h |  5 +++++
>  xen/arch/x86/setup.c                   |  3 ++-
>  xen/common/domain-builder/fdt.c        | 21 +++++++++++++++++++++
>  3 files changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index d7c6042e25..e316d4bcde 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -13,6 +13,11 @@
>  struct boot_domain {
>      domid_t domid;
>=20
> +                                          /* On     | Off    */
> +#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
> +#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
> +    uint32_t mode;
> +
>      struct boot_module *kernel;
>      struct boot_module *module;
>      const char *cmdline;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 04ad2d0937..05e3d2cf2a 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1020,7 +1020,8 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>      struct boot_domain *bd =3D &bi->domains[0];
>      struct domain *d;
>=20
> -    if ( opt_dom0_pvh )
> +    if ( opt_dom0_pvh ||
> +         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) =
)
>      {
>          dom0_cfg.flags |=3D (XEN_DOMCTL_CDF_hvm |
>                             ((hvm_hap_supported() && !opt_dom0_shadow) ?
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index 0d3c713041..6809c7f917 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -225,6 +225,27 @@ static int __init process_domain_node(
>              bd->domid =3D val;
>              printk(XENLOG_INFO "  domid: %d\n", bd->domid);
>          }
> +        else if ( !strncmp(prop_name, "mode", name_len) )
> +        {
> +            if ( (rc =3D fdt_prop_as_u32(prop, &bd->mode)) )
> +            {
> +                printk(XENLOG_ERR
> +                       "  failed processing mode for domain %s\n", name)=
;
> +                return rc;
> +            }
> +
> +            if ( (bd->mode & BUILD_MODE_PARAVIRT)  &&
> +                 (bd->mode & BUILD_MODE_ENABLE_DM) )
> +            {
> +                printk(XENLOG_ERR "  mode: invalid (pv+hvm)\n");
> +                return -EINVAL;
> +            }
> +
> +            printk(XENLOG_INFO "  mode: %s\n",
> +                   (bd->mode & BUILD_MODE_PARAVIRT)  ? "pv"  :
> +                   (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
> +                                                       "pvh");
> +        }
>      }
>=20
>      fdt_for_each_subnode(node, fdt, dom_node)
> --
> 2.43.0
>=20
>=20


