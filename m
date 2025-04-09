Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37440A8334E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 23:24:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944685.1343067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2cuG-0006fv-9W; Wed, 09 Apr 2025 21:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944685.1343067; Wed, 09 Apr 2025 21:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2cuG-0006eS-6r; Wed, 09 Apr 2025 21:24:24 +0000
Received: by outflank-mailman (input) for mailman id 944685;
 Wed, 09 Apr 2025 21:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2cuF-0006eM-5B
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 21:24:23 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0004bb12-1589-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 23:24:20 +0200 (CEST)
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
X-Inumbo-ID: 0004bb12-1589-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744233859; x=1744493059;
	bh=NNcyo8kDcYxS8+puN0bNb5Cu7wasZNjqXmJX7AaVTaw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NuOBa6Y22X0w1BufCnc0di1lOq+Q425EZIcCxS5IgWsviLD91ouFLHXtca9O0nj6P
	 qElt6uJjJMwiEsCYZJo3xtfHagquIgzo6gWxT9XfMTqpkC8yjvajFWHHzlZ0kVNc/l
	 lth3SkkcOEjUJisGfR5+GvZiEhTxzz6ue40ckbxBGGdlBiwDOMrRd+rOxpDgQTxAlJ
	 g7bseXYOAbqx+twU7fnQSJM0xDF371KAmCZts5O349NnUKYlom6ByJQZO9BszTrSkK
	 SofCP2Gbw7QWbAXV6izb+DZcbRvyiON24hMCdL0QJ8FSEtBBg+1KBz7QCXX7BV4b90
	 3Rv7xTSn9V2Zw==
Date: Wed, 09 Apr 2025 21:24:17 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 09/16] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Message-ID: <DSF977mG3NYzAt3ivBQ4eG8vpcpUtHkruh1kwWNMEpmV4YretAAOz5B3bIdJox_2MxVZvoKvrQ3Xwx8z_MMHHM-lj7JYUx00v79nQcuu6ic=@proton.me>
In-Reply-To: <20250408160802.49870-10-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-10-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 450b7fad8347c67a6fefd139e05201d1154eb018
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
> Look for a subnode of type `multiboot,kernel` within a domain node. If
> found, locate it using the multiboot module helper to generically ensure
> it lives in the module list. If the bootargs property is present and
> there was not an MB1 string, then use the command line from the device
> tree definition.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>=20
> Signed-off-by: Alejandro Vallejo agarciav@amd.com
>=20
> ---
> v3:
> * Add const to fdt
> * Remove idx =3D=3D NULL checks
> * Add BUILD_BUG_ON for MAX_NR_BOOTMODS fitting in a uint32_t
> * Remove trailing ) from printks
> * Return ENODATA for missing kernel
> * Re-work "max domains" warning and print limit
> * fdt_cell_as_u32/directly return values
> * Remove "pairs" looping from fdt_get_reg_prop() and only grab 1.
> * Use addr_cells and size_cells
> ---
> xen/arch/x86/domain-builder/core.c | 11 ++++++
> xen/arch/x86/domain-builder/fdt.c | 57 ++++++++++++++++++++++++++++++
> xen/arch/x86/setup.c | 5 ---
> 3 files changed, 68 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bui=
lder/core.c
> index c50eff34fb..eda7fa7a8f 100644
> --- a/xen/arch/x86/domain-builder/core.c
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -59,6 +59,17 @@ void __init builder_init(struct boot_info *bi)
>=20
> printk(XENLOG_INFO " Number of domains: %d\n", bi->nr_domains);
>=20
> }
> + else
> + {
> + unsigned int i;
> +
> + /* Find first unknown boot module to use as Dom0 kernel */
> + printk("Falling back to using first boot module as dom0\n");
> + i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> + bi->mods[i].type =3D BOOTMOD_KERNEL;
>=20
> + bi->domains[0].kernel =3D &bi->mods[i];
>=20
> + bi->nr_domains =3D 1;
>=20
> + }
> }
>=20
> /*
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index 9ebc8fd0e4..a037c8b6cb 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -155,6 +155,52 @@ int __init fdt_read_multiboot_module(const void *fdt=
, int node,
> return idx;
> }
>=20
> +static int __init process_domain_node(
> + struct boot_info *bi, const void *fdt, int dom_node)
> +{
> + int node;
> + struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>=20
> + const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> + int address_cells =3D fdt_address_cells(fdt, dom_node);
> + int size_cells =3D fdt_size_cells(fdt, dom_node);
> +
> + fdt_for_each_subnode(node, fdt, dom_node)
> + {
> + if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") =3D=3D 0 =
)
> + {
> + int idx;
> +
> + if ( bd->kernel )
>=20
> + {
> + printk(XENLOG_ERR "Duplicate kernel module for domain %s\n",

Looks like it should be XENLOG_WARNING since the loop continues.

Also, I would use either Capitalized or lower case messages everywhere
for consistency.

> + name);
> + continue;
> + }
> +
> + idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
> + size_cells, bi);
> + if ( idx < 0 )
> + {
> + printk(" failed processing kernel module for domain %s\n",

I think this printout should have XENLOG_ERR in it since it's on the
error code path.

> + name);
> + return idx;
> + }
> +
> + printk(" kernel: boot module %d\n", idx);
> + bi->mods[idx].type =3D BOOTMOD_KERNEL;
>=20
> + bd->kernel =3D &bi->mods[idx];
>=20
> + }
> + }
> +
> + if ( !bd->kernel )
>=20
> + {
> + printk(XENLOG_ERR "ERR: no kernel assigned to domain\n");

Drop "ERR" since it is already XENLOG_ERR level?

> + return -ENODATA;
> + }
> +
> + return 0;
> +}
> +
> static int __init find_hyperlaunch_node(const void *fdt)
> {
> int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
> @@ -217,9 +263,20 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi=
)
>=20
> fdt_for_each_subnode(node, fdt, hv_node)
> {
> + if ( bi->nr_domains >=3D MAX_NR_BOOTDOMS )
>=20
> + {
> + printk(XENLOG_WARNING
> + "WARN: only creating first %u domains\n", MAX_NR_BOOTDOMS);

Drop "WARN" since it is already XENLOG_WARNING level?

> + break;
> + }
> +
> ret =3D fdt_node_check_compatible(fdt, node, "xen,domain");
> if ( ret =3D=3D 0 )
> + {
> + if ( (ret =3D process_domain_node(bi, fdt, node)) < 0 )
> + break;
> bi->nr_domains++;
>=20
> + }
> }
>=20
> /* Until multi-domain construction is added, throw an error /
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index e5d78bcb48..00e8c8a2a3 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1284,11 +1284,6 @@ void asmlinkage __init noreturn __start_xen(void)
>=20
> builder_init(bi);
>=20
> - / Find first unknown boot module to use as Dom0 kernel */
> - i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> - bi->mods[i].type =3D BOOTMOD_KERNEL;
>=20
> - bi->domains[0].kernel =3D &bi->mods[i];
>=20
> -
> if ( pvh_boot )
> {
> /* pvh_init() already filled in e820_raw */
> --
> 2.43.0

