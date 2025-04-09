Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFACFA833F2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 00:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944717.1343087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dZs-0008WF-Ky; Wed, 09 Apr 2025 22:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944717.1343087; Wed, 09 Apr 2025 22:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dZs-0008VG-Hs; Wed, 09 Apr 2025 22:07:24 +0000
Received: by outflank-mailman (input) for mailman id 944717;
 Wed, 09 Apr 2025 22:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2dZs-0008V3-1m
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 22:07:24 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01f7cb67-158f-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 00:07:20 +0200 (CEST)
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
X-Inumbo-ID: 01f7cb67-158f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744236439; x=1744495639;
	bh=PNuIUhsAmMV6/d5Q6RNUKcnjFlmnkJduQNv20ezEKN8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GRE6BCcFFXV0+ULCceQLt7gGvgXfrTzOFs+dFoVmZN3uHVSQl7jSaXTuqfrQi5P9e
	 qBnUbreiUSCjME8FJ8FGPhDPQE08kN6Lpk5lmDPojxPpd/vdic1YUgZNOCP+YFgwZg
	 4UzWa3m4jkc3qFNdl6CG92cJZHu+Wlged1u3EE4b0utcVWnwRRqXfve7qPpJl6CgRu
	 aazGHimfkPeYVaje4Mz1j75PExu+3Uu54+MfVxi/8gOSqp+8h0xTlejJPJsckI1Dih
	 6rj06CdBjq0s0XrKYdYP3tf4LBMy8uZ64SUcdhcW9mF0dJaiZ/+EKW5pzR/ygruyVu
	 FAIKCq55MXZQA==
Date: Wed, 09 Apr 2025 22:07:13 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with hyperlaunch
Message-ID: <7yfsIOlu7485oxHgd2L0b32KqzOfx7cJg8-ZwVb41T2NljBamLliFUysp7IM4fSh-DvmZD1H-9Gh2pjpSdIrXkUbbo3pxRV3h3P2TglHJlA=@proton.me>
In-Reply-To: <20250408160802.49870-12-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-12-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8fd149f369090f74b21d3581e55e2525ca4e7619
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
> Look for a subnode of type `multiboot,ramdisk` within a domain node and
> parse via the fdt_read_multiboot_module() helper. After a successful
> helper call, the module index is returned and the module is guaranteed
> to be in the module list.
>=20
> Fix unused typo in adjacent comment.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>=20
> Signed-off-by: Alejandro Vallejo agarciav@amd.com
>=20
> ---
> v3:
> * Reworded commit message to state the helper postconditions.
> * Wrapped long line
> * Fix ramdisk -> module rename
>=20
> * Move ramdisk parsing from later patch
> * Remove initrdidx indent
> ---
> xen/arch/x86/domain-builder/fdt.c | 29 +++++++++++++++++++++++++++++
> xen/arch/x86/setup.c | 4 ++--
> 2 files changed, 31 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index bc9903a9de..0f5fd01557 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -195,6 +195,35 @@ static int __init process_domain_node(
> !((char *)__va(bd->kernel->cmdline_pa))[0] )
>=20
> bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>=20
> fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>=20
> +
> + continue;
> + }
> + else if ( fdt_node_check_compatible(fdt, node,
> + "multiboot,ramdisk") =3D=3D 0 )
> + {
> + int idx;
> +
> + if ( bd->module )
>=20
> + {
> + printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",

I would start the message with lower case so it is consistent with the othe=
r one.

> + name);
> + continue;
> + }
> +
> + idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
> + size_cells,bi);
> + if ( idx < 0 )
> + {
> + printk(" failed processing ramdisk module for domain %s\n",
> + name);

Prepend the log message with XENLOG_ERR ?

> + return -EINVAL;
> + }
> +
> + printk(" ramdisk: boot module %d\n", idx);
> + bi->mods[idx].type =3D BOOTMOD_RAMDISK;
>=20
> + bd->module =3D &bi->mods[idx];
>=20
> +
> + continue;
> }
> }
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index ca4415d020..3dfa81b48c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2149,11 +2149,11 @@ void asmlinkage __init noreturn __start_xen(void)
> * At this point all capabilities that consume boot modules should have
> * claimed their boot modules. Find the first unclaimed boot module and
> * claim it as the initrd ramdisk. Do a second search to see if there are
> - * any remaining unclaimed boot modules, and report them as unusued init=
rd
> + * any remaining unclaimed boot modules, and report them as unused initr=
d
> * candidates.
> */
> initrdidx =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> - if ( initrdidx < MAX_NR_BOOTMODS )
> + if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
>=20
> {
> bi->mods[initrdidx].type =3D BOOTMOD_RAMDISK;
>=20
> bi->domains[0].module =3D &bi->mods[initrdidx];
>=20
> --
> 2.43.0

