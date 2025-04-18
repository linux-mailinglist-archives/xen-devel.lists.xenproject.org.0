Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C5A94045
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 01:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959629.1351946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5v2T-0007HE-AB; Fri, 18 Apr 2025 23:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959629.1351946; Fri, 18 Apr 2025 23:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5v2T-0007Eq-6y; Fri, 18 Apr 2025 23:22:29 +0000
Received: by outflank-mailman (input) for mailman id 959629;
 Fri, 18 Apr 2025 23:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5v2R-0006k3-Nw
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 23:22:27 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd859493-1cab-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 01:22:26 +0200 (CEST)
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
X-Inumbo-ID: fd859493-1cab-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=br7ljqri75apjnjj3z5knkllz4.protonmail; t=1745018545; x=1745277745;
	bh=VJqho0Oz1oS0bMw6DBkdXhC/n84uMzlHwxttP5e9cRk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=AHaHmU80itbYc4U+SYiJw6X2ORFbyOL+cs+eNH6AREV8gI3wUmhhA5P5pjQEW6wBQ
	 TltuwDx3OpIzA/nXvuKbDu7G7uLoYqdZxwtxVgis1wuV8ZnStZWDXMi0VInuairxvq
	 uMl/2TxPzIG9PcTal+7I7xGA+Y0ysxL5foXbHPZwfxDgU+cTMKygDFiKW92KEIx3Be
	 na1yp2URgn9hRrxiDmufU+Juzsi0PCTa2mJglRSpZKPbKmkSHtpyQUb2aX3HvRLPSY
	 XQDdvoJhIRujM9coNLGtiRftfVb1+Xo/NHmPwZt4bIwqfXUVwE0T6OPFe9dLAV/onz
	 qnSy9U6EkSyxw==
Date: Fri, 18 Apr 2025 23:22:21 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 12/13] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Message-ID: <aALeq+QtFfkJv2WT@kraken>
In-Reply-To: <20250417124844.11143-13-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-13-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f568f9545a669d4af9175317c8d1a56939760ea7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:34PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Introduce the `cpus` property, named as such for dom0less compatibility, =
that
> represents the maximum number of vcpus to allocate for a domain. In the d=
evice
> tree, it will be encoded as a u32 value.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
> v4:
>   * s/UINT_MAX/UINT32_MAX/ (cosmetic, but...)
>   * s/vpcpus/vcpus/ in commit message.
>   * Reworded printk()
> ---
>  xen/arch/x86/dom0_build.c              |  3 +++
>  xen/arch/x86/include/asm/boot-domain.h |  2 ++
>  xen/common/domain-builder/fdt.c        | 11 +++++++++++
>  3 files changed, 16 insertions(+)
>=20
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 8db24dbc0a..f734104c74 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -635,6 +635,9 @@ int __init construct_dom0(const struct boot_domain *b=
d)
>      if ( !get_memsize(&dom0_max_size, ULONG_MAX) && bd->max_pages )
>          dom0_max_size.nr_pages =3D bd->max_pages;
>=20
> +    if ( opt_dom0_max_vcpus_max =3D=3D UINT_MAX && bd->max_vcpus )
> +        opt_dom0_max_vcpus_max =3D bd->max_vcpus;
> +
>      if ( is_hvm_domain(d) )
>          rc =3D dom0_construct_pvh(bd);
>      else if ( is_pv_domain(d) )
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index fa8ea1cc66..969c02a6ea 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -22,6 +22,8 @@ struct boot_domain {
>      unsigned long min_pages;
>      unsigned long max_pages;
>=20
> +    unsigned int max_vcpus;
> +
>      struct boot_module *kernel;
>      struct boot_module *module;
>      const char *cmdline;
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index 90218d120a..295ab6e8b3 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -282,6 +282,17 @@ static int __init process_domain_node(
>              bd->max_pages =3D PFN_DOWN(kb * SZ_1K);
>              printk(XENLOG_INFO "  max memory: %lu KiB\n", kb);
>          }
> +        else if ( !strncmp(prop_name, "cpus", name_len) )
> +        {
> +            uint32_t val =3D UINT32_MAX;
> +            if ( (rc =3D fdt_prop_as_u32(prop, &val)) )
> +            {
> +                printk(XENLOG_ERR "  bad \"cpus\" prop on domain %s\n", =
name);
> +                return rc;
> +            }
> +            bd->max_vcpus =3D val;
> +            printk(XENLOG_INFO "  cpus: %d\n", bd->max_vcpus);
> +        }
>      }
>=20
>      fdt_for_each_subnode(node, fdt, dom_node)
> --
> 2.43.0
>=20
>=20


