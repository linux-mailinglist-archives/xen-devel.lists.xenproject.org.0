Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EDA83410
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 00:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944760.1343117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dv5-0006Mq-Rk; Wed, 09 Apr 2025 22:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944760.1343117; Wed, 09 Apr 2025 22:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dv5-0006Jp-OE; Wed, 09 Apr 2025 22:29:19 +0000
Received: by outflank-mailman (input) for mailman id 944760;
 Wed, 09 Apr 2025 22:29:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2dv4-0006Jj-A5
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 22:29:18 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 125a1dea-1592-11f0-9eab-5ba50f476ded;
 Thu, 10 Apr 2025 00:29:16 +0200 (CEST)
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
X-Inumbo-ID: 125a1dea-1592-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744237754; x=1744496954;
	bh=mhw7ZsSkh6lIeuMTqjc2Q7GDlBRBQXHTLXk5zMbIhrA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BCVK0c49rQjaK2LBBk8PENjILXLJelyIajNqqIB7mUetLkrfgH/UL1FMEKjddUy5K
	 UDx1+K6eqmM41oz4XzOuywYspKYeS/rqeaHZSfmaOwKlEypGlKVZfn95kiLzX5CNYt
	 WjZECgTQNorCHgiBYKxc6yBb1F+drlUy4v87W26eOUKE3osQWs8ho9YZ47q0+swsw1
	 K7Dh4OiV2tiGFBDFRdKT9Mmk7GDWMXq/A6WM0QnvrG2zPfhmcn07MnUDU0Vrn/fcFa
	 TGtJE0Qu1wu5AfUcK/DXaYGbcQEek/wnaJcDnQ7tJ9J78sIyBsfFroLaS2KmMbLihR
	 ijdO97nqXwDmA==
Date: Wed, 09 Apr 2025 22:29:09 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain config
Message-ID: <TxTotB0Qk4oGMxQq7xnU0hcsO0Xa-v6515dblFbD6DVV7X4ZzKsjjNfi7t0jk0Uibpwq11d7rblyA09C47qJ_r7a0t698E4kNouT-iNwOqU=@proton.me>
In-Reply-To: <20250408160802.49870-15-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-15-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8d6577c7c2782f0583c81e383f72c88170ffc751
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
> Add three properties, memory, mem-min, and mem-max, to the domain node de=
vice
> tree parsing to define the memory allocation for a domain. All three fiel=
ds are
> expressed in kb and written as a u64 in the device tree entries.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>=20
> ---
> xen/arch/x86/dom0_build.c | 8 ++++++
> xen/arch/x86/domain-builder/fdt.c | 34 ++++++++++++++++++++++++++
> xen/arch/x86/include/asm/boot-domain.h | 4 +++
> xen/include/xen/libfdt/libfdt-xen.h | 10 ++++++++
> 4 files changed, 56 insertions(+)
>=20
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4..36fb090643 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -627,6 +627,14 @@ int __init construct_dom0(const struct boot_domain b=
d)
>=20
> process_pending_softirqs();
>=20
> + / If param dom0_size was not set and HL config provided memory size */
> + if ( !get_memsize(&dom0_size, LONG_MAX) && bd->mem_pages )
>=20
> + dom0_size.nr_pages =3D bd->mem_pages;
>=20
> + if ( !get_memsize(&dom0_min_size, LONG_MAX) && bd->min_pages )
>=20
> + dom0_size.nr_pages =3D bd->min_pages;
>=20
> + if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>=20
> + dom0_size.nr_pages =3D bd->max_pages;
>=20
> +
> if ( is_hvm_domain(d) )
> rc =3D dom0_construct_pvh(bd);
> else if ( is_pv_domain(d) )
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index da65f6a5a0..338b4838c2 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -6,6 +6,7 @@
> #include <xen/init.h>
>=20
> #include <xen/lib.h>
>=20
> #include <xen/libfdt/libfdt.h>
>=20
> +#include <xen/sizes.h>
>=20
>=20
> #include <asm/bootinfo.h>
>=20
> #include <asm/guest.h>
>=20
> @@ -212,6 +213,39 @@ static int __init process_domain_node(
> else
> printk("PV\n");
> }
> + else if ( strncmp(prop_name, "memory", name_len) =3D=3D 0 )
> + {
> + uint64_t kb;
> + if ( fdt_prop_as_u64(prop, &kb) !=3D 0 )
> + {
> + printk(" failed processing memory for domain %s\n", name);
> + return -EINVAL;
> + }
> + bd->mem_pages =3D PFN_DOWN(kb * SZ_1K);

Perhaps use shorter form of KB(kb) (KB() from include/xen/config.h)?

What do you think?

>=20
> + printk(" memory: %ld kb\n", kb);
> + }
> + else if ( strncmp(prop_name, "mem-min", name_len) =3D=3D 0 )
> + {
> + uint64_t kb;
> + if ( fdt_prop_as_u64(prop, &kb) !=3D 0 )
> + {
> + printk(" failed processing memory for domain %s\n", name);
> + return -EINVAL;
> + }
> + bd->min_pages =3D PFN_DOWN(kb * SZ_1K);
>=20
> + printk(" min memory: %ld kb\n", kb);
> + }
> + else if ( strncmp(prop_name, "mem-max", name_len) =3D=3D 0 )
> + {
> + uint64_t kb;
> + if ( fdt_prop_as_u64(prop, &kb) !=3D 0 )
> + {
> + printk(" failed processing memory for domain %s\n", name);
> + return -EINVAL;
> + }
> + bd->max_pages =3D PFN_DOWN(kb * SZ_1K);
>=20
> + printk(" max memory: %ld kb\n", kb);
> + }
> }
>=20
> fdt_for_each_subnode(node, fdt, dom_node)
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index e316d4bcde..fa8ea1cc66 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -18,6 +18,10 @@ struct boot_domain {
> #define BUILD_MODE_ENABLE_DM (1 << 1) /* HVM | PVH */
> uint32_t mode;
>=20
> + unsigned long mem_pages;
> + unsigned long min_pages;
> + unsigned long max_pages;
> +
> struct boot_module *kernel;
> struct boot_module *module;
> const char *cmdline;
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt=
/libfdt-xen.h
> index 3031bec90e..da43e12e38 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -34,6 +34,16 @@ static inline int __init fdt_prop_as_u32(
> return 0;
> }
>=20
> +static inline int __init fdt_prop_as_u64(
> + const struct fdt_property *prop, uint64_t *val)
> +{
> + if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u64) )
>=20
> + return -EINVAL;
> +
> + *val =3D fdt_cell_as_u64((fdt32_t *)prop->data);
>=20
> + return 0;
> +}
> +
> static inline bool __init fdt_get_prop_offset(
> const void *fdt, int node, const char *name, unsigned long *offset)
> {
> --
> 2.43.0

