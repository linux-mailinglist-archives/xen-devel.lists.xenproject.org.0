Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58498A83427
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 00:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944786.1343136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2e5O-0001HP-Ru; Wed, 09 Apr 2025 22:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944786.1343136; Wed, 09 Apr 2025 22:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2e5O-0001F1-PF; Wed, 09 Apr 2025 22:39:58 +0000
Received: by outflank-mailman (input) for mailman id 944786;
 Wed, 09 Apr 2025 22:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2e5N-0001Ev-Ty
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 22:39:58 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8faa94e5-1593-11f0-9eab-5ba50f476ded;
 Thu, 10 Apr 2025 00:39:56 +0200 (CEST)
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
X-Inumbo-ID: 8faa94e5-1593-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ge6yf2cp35elvoeo4t5uebpkdu.protonmail; t=1744238395; x=1744497595;
	bh=YWo0JnQYYvBSbmLFlnF/teQUzOpkVj8j09Q4r5O+gFc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=djpJozpDHq2AJgZqrWgWL0TsjZZ37ulqwJv0Gzcxh9kMcJyW7shXCLI5LkF8qgB0F
	 oXWmHrGGVnyMl+S6kpaP5Db/rljZS1lGIjZxZKMOs4162UOM+PTVSjMEyYm7Yv91BE
	 l/TwB6vdwIc2djwiIDMLXNzWlL2Yal+ztmHoCXPV3oYNT3oTgDBIzhhmwYiJeMymFU
	 R5oQ1oZOyEq+ofqV9aYxpCjuPIhi+kXdk+s/RwJb+I9bo1o1yDghJ0PUTgZ4wjn1aU
	 Av3dMMUlCilcgQPso5wNAj2C0q9f1w7aUuabEhmBvuwI1/jQoKASj2xeUQdKgEUM9X
	 h4OALw5zOzuLA==
Date: Wed, 09 Apr 2025 22:39:49 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot domain
Message-ID: <qMw3Q37efKWp7_jJqwDD6Y3Pt0d0qdCxZDIWzgsMg1LehShPFTIOeJnqBq74lOcTERdwsLTcTazRd2zR0k-_S9TeE-ymcU3S2PH6_o9QRCU=@proton.me>
In-Reply-To: <20250408160802.49870-17-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-17-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e8907e23aa9ec7b272fc8c7312281f84df62a8c6
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
> Introduce the ability to assign capabilities to a domain via its definiti=
on in
> device tree. The first capability enabled to select is the control domain
> capability. The capability property is a bitfield in both the device tree=
 and
> `struct boot_domain`.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>=20
> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>=20
> ---
> xen/arch/x86/domain-builder/core.c | 1 +
> xen/arch/x86/domain-builder/fdt.c | 12 ++++++++++++
> xen/arch/x86/include/asm/boot-domain.h | 4 ++++
> xen/arch/x86/setup.c | 6 +++++-
> 4 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bui=
lder/core.c
> index 510a74a675..6ab4e6fe53 100644
> --- a/xen/arch/x86/domain-builder/core.c
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -96,6 +96,7 @@ void __init builder_init(struct boot_info *bi)
> i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> bi->mods[i].type =3D BOOTMOD_KERNEL;
>=20
> bi->domains[0].kernel =3D &bi->mods[i];
>=20
> + bi->domains[0].capabilities |=3D BUILD_CAPS_CONTROL;
>=20
> bi->nr_domains =3D 1;
>=20
> }
> }
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index 5fcb767bdd..dbfbcffb0a 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -257,6 +257,18 @@ static int __init process_domain_node(
> bd->max_vcpus =3D val;
>=20
> printk(" max vcpus: %d\n", bd->max_vcpus);
>=20
> }
> + else if ( strncmp(prop_name, "capabilities", name_len) =3D=3D 0 )
> + {
> + if ( fdt_prop_as_u32(prop, &bd->capabilities) !=3D 0 )
>=20
> + {
> + printk(" failed processing domain id for domain %s\n", name);

Suggest adding XENLOG_ERR to the error message.

> + return -EINVAL;
> + }
> + printk(" caps: ");
> + if ( bd->capabilities & BUILD_CAPS_CONTROL )
>=20
> + printk("c");

Perhaps wrap string generation into a separate function?

That will help if the number of capabilities will grow over time
and if there will be a need to use string representation somewhere else
in the code.

Thoughts?

> + printk("\n");
> + }
> }
>=20
> fdt_for_each_subnode(node, fdt, dom_node)
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index 969c02a6ea..29a7d806de 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -13,6 +13,10 @@
> struct boot_domain {
> domid_t domid;
>=20
> +#define BUILD_CAPS_NONE (0)
> +#define BUILD_CAPS_CONTROL (1 << 0)
> + uint32_t capabilities;
> +
> /* On | Off /
> #define BUILD_MODE_PARAVIRT (1 << 0) / PV | PVH/HVM /
> #define BUILD_MODE_ENABLE_DM (1 << 1) / HVM | PVH */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 4127a0105d..7e1a26b4d2 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1006,6 +1006,7 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
> {
> char *cmdline =3D NULL;
> size_t cmdline_size;
> + unsigned int create_flags =3D 0;
> struct xen_domctl_createdomain dom0_cfg =3D {
> .flags =3D IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
> .max_evtchn_port =3D -1,
> @@ -1037,7 +1038,10 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
> if ( bd->domid =3D=3D DOMID_INVALID )
>=20
> /* Create initial domain. Not d0 for pvshim. */
> bd->domid =3D get_initial_domain_id();
>=20
> - d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged)=
;
>=20
> + if ( bd->capabilities & BUILD_CAPS_CONTROL )
>=20
> + create_flags |=3D CDF_privileged;
> + d =3D domain_create(bd->domid, &dom0_cfg,
>=20
> + pv_shim ? 0 : create_flags);
> if ( IS_ERR(d) )
> panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>=20
>=20
> --
> 2.43.0

