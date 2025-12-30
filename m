Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F56CEA632
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 19:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194420.1512821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vae3d-00044h-2E; Tue, 30 Dec 2025 18:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194420.1512821; Tue, 30 Dec 2025 18:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vae3c-00042w-VN; Tue, 30 Dec 2025 18:02:56 +0000
Received: by outflank-mailman (input) for mailman id 1194420;
 Tue, 30 Dec 2025 18:02:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoJT=7E=bounce.vates.tech=bounce-md_30504962.695413cb.v1-ea307c6913e849d49b063105ab25fc5c@srs-se1.protection.inumbo.net>)
 id 1vae3c-00042q-Bn
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 18:02:56 +0000
Received: from mail136-3.atl41.mandrillapp.com
 (mail136-3.atl41.mandrillapp.com [198.2.136.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c29cc45d-e5a9-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 19:02:53 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-3.atl41.mandrillapp.com (Mailchimp) with ESMTP id 4dggt32ZyDzBsTxLg
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 18:02:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ea307c6913e849d49b063105ab25fc5c; Tue, 30 Dec 2025 18:02:51 +0000
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
X-Inumbo-ID: c29cc45d-e5a9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767117771; x=1767387771;
	bh=0QvKxFevpIMvWkNT5zi3ZUTDjF7fRbGVgLlNFoV6eY8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oOs00qXnekHdWR7m6Uu4T1XL+i1SFhWxleUCxJ8KVhuPgVtbjH1yrDUpo6Qv/vkr4
	 nxSV+9nCskadk2b/gOt0EQRd7woVT+Svg3Zw/du2OPvk1/6XajURvBhoRkaEx+h9rS
	 XCCWztkoYVYsqyqqV7VC8n+QtFxd8bmYo2kNHMGSWOKbRH8mhTGMoNZ3D0gk+issPj
	 8oJr2wLbT9uS5hi/itYM7IYsT9GyvOmVbFFp9/kScwRQEBsYKVDBp0xwqT1t9PdaCf
	 jDbIlyF6ZznaAbKRDZqghNyooMvfQ/elvHBo7+bDMRdLfMs8zE55SgXdpY2Ndf8ieN
	 BZtYDe0EeeGHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767117771; x=1767378271; i=teddy.astie@vates.tech;
	bh=0QvKxFevpIMvWkNT5zi3ZUTDjF7fRbGVgLlNFoV6eY8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lPG29Y1DelDHIE5nfr/xf9Y7xIXaz29+lzdogJb5zFOs7+wMuOOgrQymTqIjCzuhE
	 28rLPmu+1xe0uilPO/hhNlzXywcFNAnfW7WkAXXccBAohpy8I4yQoFuHPYC5l1WlaT
	 pQtlnpBL5NO+RaouH64ANujLqhuLtJqfeFKSGLrDUlVtDGIA4Hz50GjQen3lA0zBPe
	 9DvNR1WsqeZqLxtePKX71lidEyeOne4985L0c/ckNbRzooBApKQXUJR0eeYmCe1k8X
	 LAzjeDTIAiombscYrk5Y02o3HkGGiPQWntvSdWH5e53m+JEFZcDpMwICFwJBtt96LI
	 Rc+muN8R8EukA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=201/1]=20xen/riscv:=20add=20RISC-V=20virtual=20SBI=20base=20extension=20support=20for=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767117769480
Message-Id: <991068a3-0e17-4cae-9653-5be170f29ab6@vates.tech>
To: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <cover.1767108625.git.oleksii.kurochko@gmail.com> <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
In-Reply-To: <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ea307c6913e849d49b063105ab25fc5c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251230:md
Date: Tue, 30 Dec 2025 18:02:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 30/12/2025 =C3=A0 16:52, Oleksii Kurochko a =C3=A9crit=C2=A0:
> Add support of virtual SBI base extension calls for RISC-V guests, delega=
ting
> hardware-specific queries to the underlying SBI and handling version and
> firmware ID queries directly.
> 
> The changes include:
> 1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID=
,
>     SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
> 2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
>     SBI_EXT_BASE_GET_SPEC_VERSION.
> 4. Introduce SBI_XEN_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
> 5. Implement handling of SBI base extension functions, including version,
>     firmware ID, and machine-specific queries.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v4:
>   - Move definition of XEN_SBI_VER_{MAJOR, MINOR} to base-extension.c.
>   - Correct string format for FID: s/#%#lx/#%lu.
>   - Print first EID then FID (as vsbi/core.c code does).
> ---
> Changes in v3:
>   - s/XEN_SBI_IMPID/SBI_XEN_IMPID
>   - Add ASSERT(eid =3D=3D SBI_EXT_BASE) in vsbi_base_ecall_handler().
>   - Fix code style for switch/case.
>   - Use current instead of `vcpu` argument as it was dropped from
>     vsbi_base_ecall_handler() prototype.
>   - Add comments for define-s XEN_SBI_VER_{MAJOR, MINOR} and SBI_XEN_IMPI=
D.
> ---
> Changes in v2:
>   - s/vsbi-base-extension.*/base-extension.*
>   - Introduce VCPU_SBI_IMPID, XEN_SBI_VER_MINOR and XEN_SBI_VER_MAJOR.
>   - Return VCPU_SBI_IMPID in the case of SBI_EXT_BASE_GET_IMP_ID.
>   - Return Xen version in the case of SBI_EXT_BASE_GET_IMP_VERSION.
>   - Use domain_crash() instead of panic() for default case.
>   - For SBI_EXT_BASE_GET_{MVENDORID,MARCHID,MIMPID} abd SBI_EXT_BASE_PROB=
E_EXT
>     add handling of a domain is h/w or not.
> ---
>   xen/arch/riscv/include/asm/sbi.h     |  6 ++
>   xen/arch/riscv/vsbi/Makefile         |  1 +
>   xen/arch/riscv/vsbi/base-extension.c | 82 ++++++++++++++++++++++++++++
>   3 files changed, 89 insertions(+)
>   create mode 100644 xen/arch/riscv/vsbi/base-extension.c
> 
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/as=
m/sbi.h
> index 751bae6d6654..79f7ff5c5501 100644
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -14,6 +14,9 @@
>   
>   #include <xen/cpumask.h>
>   
> +/* SBI-defined implementation ID */
> +#define SBI_XEN_IMPID 7
> +
>   #define SBI_EXT_0_1_SET_TIMER               0x0
>   #define SBI_EXT_0_1_CONSOLE_PUTCHAR         0x1
>   #define SBI_EXT_0_1_CONSOLE_GETCHAR         0x2
> @@ -32,6 +35,9 @@
>   #define SBI_EXT_BASE_GET_IMP_ID         0x1
>   #define SBI_EXT_BASE_GET_IMP_VERSION    0x2
>   #define SBI_EXT_BASE_PROBE_EXT          0x3
> +#define SBI_EXT_BASE_GET_MVENDORID      0x4
> +#define SBI_EXT_BASE_GET_MARCHID        0x5
> +#define SBI_EXT_BASE_GET_MIMPID         0x6
>   
>   /* SBI function IDs for RFENCE extension */
>   #define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
> diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
> index bc5755cb13d6..8ce470f787c5 100644
> --- a/xen/arch/riscv/vsbi/Makefile
> +++ b/xen/arch/riscv/vsbi/Makefile
> @@ -1,2 +1,3 @@
> +obj-y +=3D base-extension.o
>   obj-y +=3D core.o
>   obj-y +=3D legacy-extension.o
> diff --git a/xen/arch/riscv/vsbi/base-extension.c b/xen/arch/riscv/vsbi/b=
ase-extension.c
> new file mode 100644
> index 000000000000..41a95ae188dd
> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/base-extension.c
> @@ -0,0 +1,82 @@
> +
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/version.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/vsbi.h>
> +
> +/* Xen-controlled SBI version reported to guests */
> +#define XEN_SBI_VER_MAJOR 0
> +#define XEN_SBI_VER_MINOR 2
> +
> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
> +                                   struct cpu_user_regs *regs)
> +{
> +    int ret =3D 0;
> +    struct sbiret sbi_ret;
> +
> +    ASSERT(eid =3D=3D SBI_EXT_BASE);
> +
> +    switch ( fid )
> +    {
> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
> +        regs->a1 =3D MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR=
_MASK) |
> +                   XEN_SBI_VER_MINOR;
> +        break;
> +
> +    case SBI_EXT_BASE_GET_IMP_ID:
> +        regs->a1 =3D SBI_XEN_IMPID;
> +        break;
> +
> +    case SBI_EXT_BASE_GET_IMP_VERSION:
> +        regs->a1 =3D (xen_major_version() << 16) | xen_minor_version();
> +        break;
> +
> +    case SBI_EXT_BASE_GET_MVENDORID:
> +    case SBI_EXT_BASE_GET_MARCHID:
> +    case SBI_EXT_BASE_GET_MIMPID:
> +        if ( is_hardware_domain(current->domain) )
> +        {
> +            sbi_ret =3D sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +            ret =3D sbi_ret.error;
> +            regs->a1 =3D sbi_ret.value;
> +        }
> +        else
> +            /*
> +             * vSBI should present a consistent, virtualized view to gue=
sts.
> +             * In particular, DomU-visible data must remain stable acros=
s
> +             * migration and must not expose hardware-specific details.
> +             *
> +             * These register(s) must be readable in any implementation,
> +             * but a value of 0 can be returned to indicate the field
> +             * is not implemented.
> +             */
> +            regs->a1 =3D 0;
> +
> +        break;
> +
> +    case SBI_EXT_BASE_PROBE_EXT:
> +        regs->a1 =3D vsbi_find_extension(regs->a0) ? 1 : 0;
> +        break;
> +
> +    default:
> +        /*
> +         * TODO: domain_crash() is acceptable here while things are stil=
l under
> +         * development.
> +         * It shouldn't stay like this in the end though: guests should =
not
> +         * be punished like this for something Xen hasn't implemented.
> +         */
> +        domain_crash(current->domain,
> +                     "%s: Unsupported ecall: EID: #%#lx FID: #%lu\n",
> +                     __func__, eid, fid);

I think we should rather report "SBI_ERR_NOT_SUPPORTED" (-2) instead 
(eventually logging a warning in Xen) ?

> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +VSBI_EXT(base, SBI_EXT_BASE, SBI_EXT_BASE, vsbi_base_ecall_handler)

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



