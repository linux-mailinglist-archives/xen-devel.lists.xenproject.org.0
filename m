Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB6A8340D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 00:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944744.1343106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dqi-0005h9-8X; Wed, 09 Apr 2025 22:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944744.1343106; Wed, 09 Apr 2025 22:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dqi-0005fk-5Y; Wed, 09 Apr 2025 22:24:48 +0000
Received: by outflank-mailman (input) for mailman id 944744;
 Wed, 09 Apr 2025 22:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2dqf-0005fe-F5
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 22:24:46 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f137545-1591-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 00:24:43 +0200 (CEST)
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
X-Inumbo-ID: 6f137545-1591-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=r2vywgm525fbfgj4b3ozb7p33a.protonmail; t=1744237481; x=1744496681;
	bh=7bBwzYfBsLxZwTZZxLQYXiMT1FEp0YZdK1R7rHBQVes=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=a1gxk0NkcyPxCdEsRUTAr+7BKqZ4U9tT8lkb5mr8Bx6rUH59Y2AJ0DlXRwas9+euC
	 JUyWa3HZeSxp3pUuWDKhMcLvB4Hk5SjiwtTDwiN99qIlUSVAXb7bT5KzCi12ONtX9W
	 rXss0s+ZqVmIr8ctB2vCk53DWXjx/4UKQlDmw7XxRrPp0q176T5jNbd3geUJxTcUAz
	 el18YfDYQFU8We1jeNm6tytro+DCipGLuULj/aQMahXA/A9q3uzGq28gVf7vZvBLSI
	 GDrEZAmmHf8Fw24pgh4etpX2SreHIQ0DFpgicmRoMjCTZjavgi+fNSZXOVckuqq5Fn
	 3MisVMBVjcTkw==
Date: Wed, 09 Apr 2025 22:24:36 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device tree
Message-ID: <zz01k2KPjivL5-avbZJmfIKFKTodzbdL80XbXNBdrZP_7Kk9oips4Ox0aG-MYZUe74V8Rm5gHDbLjdUNlZLzmYD0MboIVY5XeUq_DmYXz6s=@proton.me>
In-Reply-To: <20250408160802.49870-14-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-14-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 071d7e756c0c57185b32676e31b7e0b53658acf2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com=
> wrote:

>=20
>=20
> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>=20
>=20
> Enable selecting the mode in which the domain will be built and ran. This
> includes:
>=20
> - whether it will be either a 32/64 bit domain
> - if it will be run as a PV or HVM domain
> - and if it will require a device model (not applicable for dom0)
>=20
> In the device tree, this will be represented as a bit map that will be ca=
rried
> through into struct boot_domain.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>=20
> ---
> xen/arch/x86/domain-builder/fdt.c | 19 +++++++++++++++++++
> xen/arch/x86/include/asm/boot-domain.h | 5 +++++
> xen/arch/x86/setup.c | 3 ++-
> 3 files changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index 4c6aafe195..da65f6a5a0 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -193,6 +193,25 @@ static int __init process_domain_node(
> bd->domid =3D (domid_t)val;
>=20
> printk(" domid: %d\n", bd->domid);
>=20
> }
> + else if ( strncmp(prop_name, "mode", name_len) =3D=3D 0 )
> + {
> + if ( fdt_prop_as_u32(prop, &bd->mode) !=3D 0 )
>=20
> + {
> + printk(" failed processing mode for domain %s\n", name);
> + return -EINVAL;
> + }
> +
> + printk(" mode: ");
> + if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
>=20
> + {
> + if ( bd->mode & BUILD_MODE_ENABLE_DM )
>=20
> + printk("HVM\n");
> + else
> + printk("PVH\n");
> + }
> + else
> + printk("PV\n");
> + }
> }

I would re-write so the positive condition is processed first, e.g.:

    if ( bd->mode & BUILD_MODE_PARAVIRT )
        printk("PV\n");
    else if ( bd->mode & BUILD_MODE_ENABLE_DM )
        printk("HVM\n");
    else
        printk("PVH\n");

I think it will reduce indentation and make code block a bit easier to read=
.

Also, if there are more uses for printing string representation of a
boot module mode in the future, perhaps move it to a separate function?

What do you think?

>=20
> fdt_for_each_subnode(node, fdt, dom_node)
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index d7c6042e25..e316d4bcde 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -13,6 +13,11 @@
> struct boot_domain {
> domid_t domid;
>=20
> + /* On | Off /
> +#define BUILD_MODE_PARAVIRT (1 << 0) / PV | PVH/HVM /
> +#define BUILD_MODE_ENABLE_DM (1 << 1) / HVM | PVH */
> + uint32_t mode;
> +
> struct boot_module *kernel;
> struct boot_module *module;
> const char *cmdline;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index db7280225e..4127a0105d 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1020,7 +1020,8 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
> struct boot_domain *bd =3D &bi->domains[0];
>=20
> struct domain *d;
>=20
> - if ( opt_dom0_pvh )
> + if ( opt_dom0_pvh ||
> + (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
>=20
> {
> dom0_cfg.flags |=3D (XEN_DOMCTL_CDF_hvm |
> ((hvm_hap_supported() && !opt_dom0_shadow) ?
> --
> 2.43.0

