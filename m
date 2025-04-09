Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05587A8341B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 00:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944773.1343127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dzD-0000fo-8r; Wed, 09 Apr 2025 22:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944773.1343127; Wed, 09 Apr 2025 22:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dzD-0000eM-5p; Wed, 09 Apr 2025 22:33:35 +0000
Received: by outflank-mailman (input) for mailman id 944773;
 Wed, 09 Apr 2025 22:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2dzB-0000eG-2M
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 22:33:33 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa69fccd-1592-11f0-9eab-5ba50f476ded;
 Thu, 10 Apr 2025 00:33:31 +0200 (CEST)
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
X-Inumbo-ID: aa69fccd-1592-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744238010; x=1744497210;
	bh=AKJIl2i01U7RLOXxfpsju5nHrk6scdE7xh+yHVAmzzo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MLL+LCBhrn810qCKObdD0TAgU1w5RLWSY6mRF+RkMKwOvgx5RDuAlfqZoKdmSwHt0
	 JLLBEUzija6048Vrgef7GhXNfoswZGke04EuiqIbIlxrJMptnO1BZObBWSRkdUUX8b
	 eredC49QUWPFZcXuJ++ubCFrby4aXn5ZjF2cse6GB01DBaA0jzQN8aUFhEbv2/gQ0b
	 29NpLtVU2C5WlaTBeyYL9rGDHKu+2C9x2xIFn0lKAv0SlEcBKe62qZUPBMw9QMapmp
	 z3EXJDRnn4lvwCQ1bLMta0YE561bSMzrzMzLJRojJlhmibuxBojWcib121t7QZuazp
	 8IDqA9FkYf5aQ==
Date: Wed, 09 Apr 2025 22:33:25 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 15/16] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Message-ID: <TdrpNKrM0AYES6ERgO3fA6Z3f2DZeLdzMe63W1n0cQ7jfW5vTDUSWqENVVDcP6gbncwd3M07DSWjiYeU3mK2JG53eehLldAT9mz5m3bChY8=@proton.me>
In-Reply-To: <20250408160802.49870-16-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-16-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1d726e5a90b183c7499e1f001073acd4a50848fd
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
> Introduce the `cpus` property, named as such for dom0less compatibility, =
that
> represents the maximum number of vpcus to allocate for a domain. In the d=
evice
> tree, it will be encoded as a u32 value.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>=20
> ---
> xen/arch/x86/dom0_build.c | 3 +++
> xen/arch/x86/domain-builder/fdt.c | 11 +++++++++++
> xen/arch/x86/include/asm/boot-domain.h | 2 ++
> 3 files changed, 16 insertions(+)
>=20
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 36fb090643..7b3e31a08f 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -635,6 +635,9 @@ int __init construct_dom0(const struct boot_domain *b=
d)
> if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>=20
> dom0_size.nr_pages =3D bd->max_pages;
>=20
>=20
> + if ( opt_dom0_max_vcpus_max =3D=3D UINT_MAX && bd->max_vcpus )
>=20
> + opt_dom0_max_vcpus_max =3D bd->max_vcpus;
>=20
> +
> if ( is_hvm_domain(d) )
> rc =3D dom0_construct_pvh(bd);
> else if ( is_pv_domain(d) )
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index 338b4838c2..5fcb767bdd 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -246,6 +246,17 @@ static int __init process_domain_node(
> bd->max_pages =3D PFN_DOWN(kb * SZ_1K);
>=20
> printk(" max memory: %ld kb\n", kb);
> }
> + else if ( strncmp(prop_name, "cpus", name_len) =3D=3D 0 )
> + {
> + uint32_t val =3D UINT_MAX;
> + if ( fdt_prop_as_u32(prop, &val) !=3D 0 )
> + {
> + printk(" failed processing max_vcpus for domain %s\n", name);

Suggest adding XENLOG_ERR to the error message.

> + return -EINVAL;
> + }
> + bd->max_vcpus =3D val;
>=20
> + printk(" max vcpus: %d\n", bd->max_vcpus);
>=20
> + }
> }
>=20
> fdt_for_each_subnode(node, fdt, dom_node)
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index fa8ea1cc66..969c02a6ea 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -22,6 +22,8 @@ struct boot_domain {
> unsigned long min_pages;
> unsigned long max_pages;
>=20
> + unsigned int max_vcpus;
> +
> struct boot_module *kernel;
> struct boot_module *module;
> const char *cmdline;
> --
> 2.43.0

