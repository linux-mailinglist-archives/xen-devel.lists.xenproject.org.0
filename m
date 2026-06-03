Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6dnoFAfTH2rgqQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:08:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849DC635019
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:08:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MMXzn+sh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325762.1591088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfiE-000581-MN; Wed, 03 Jun 2026 07:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325762.1591088; Wed, 03 Jun 2026 07:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfiE-00055q-JL; Wed, 03 Jun 2026 07:08:26 +0000
Received: by outflank-mailman (input) for mailman id 1325762;
 Wed, 03 Jun 2026 07:08:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wUfiC-00055k-Qk
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:08:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUfiB-0021tZ-MT
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:08:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fd2dd-e002-0a2a0a5209dd-0a2a4502bf4e-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:08:23 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fd2e7-af86-0a2a45020019-d155a72ab1a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:08:23 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5aa5f11deb2so5043912e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 00:08:23 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780470503; cv=none;
        d=google.com; s=arc-20240605;
        b=dKACzEddcf9sPqUsjYh7HByKI/JUCpJqNdjDLGWLQwXeaZuGiA9I0szbwxOdcODNH/
         9GMzWJQ6vgR8qyOR8mnJm2+0MxAGQU2UOM54t6k0b9dMjg3Bzw0zns0FpU+CzoqAtctF
         Up1Fs0zE6vKB5D1Rwyu80K7MWHbMq4tFhnxOYWWLglXQWJvaeiEP9XeyrQ/hMzRm4K0W
         G/AS5mfLM9Mk8boFwlqfQQ8ddSmcz5HtGMLLaCV9Ld3vF2w8P5i1lNCqevcUWHrCWelu
         dFfbrGi1l3Nx68iYQvW8vq1tSB+SViFpqOaEL+GA11z8l8/pBuEPosil8o+EG/5RR0Xb
         V8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/J3MM/+6FfTfKM3cmdBHdtr7z2aM1jfUFsSHKbnOeW4=;
        fh=XPwOTaEPrdk2pN2RgjfihMkJ4NQu8t1nAUIywJrC5RY=;
        b=heq6GNTtt2igt7l3nbx6S/+bMJ6tV30Y10eGrAK0Y844eBggCK6U1fZW/tbVTnSTsU
         T34cLZ+F13xAucZCU3KARO30yq2YG3UIM5qzrLICee76kI8OyngF1O7TZz7KR6eRjKP4
         6VtAuNIZ2oNelBqk9rKNuGn83DnvLgXzdGxMsMQyimI1TFLSiEYd1ibhVDAMIqTuTrNq
         u5buRaodIML0Bym0aQkXZrEbX+p5/rU+wIIDaD0j6mCnIJkg6+vavnRDUZGJ4DPgdYp/
         WEqw56Niceixo/420+WSXF7hRhJWBfNAkel7CXFOjudp67zUlH39cJfPef25bzjAv6jO
         nWDg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780470503; x=1781075303; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J3MM/+6FfTfKM3cmdBHdtr7z2aM1jfUFsSHKbnOeW4=;
        b=MMXzn+shnpymso0Br80cktbDPfZkmR718BpNSYG3SkbGlsU9+Y060dQhdurFw5SSEt
         /27y1lyXJuMQKWQJ9ZX5UKCWEiA3J5KDhxlj+OA8xnUIngD0qJSEMkvybMP/fSxNF/VR
         RQf/3DCujk96+vz17ONWyaGZxwkhNYZawGBgV2ArLdET+2Hlknar5gVNPTUw53qw9YMD
         cfFd7a4bZDa8iDqdR/lLb+UToLKV+4SuMhzYfy1qGJuq6AdImJHPr2AveX35Fx6A5DvA
         LDSUMPyLkycQBBFPElx5fo+ZlhfuJIsTustZzzJvYPqQ6YYtvW9Ls4ywEBOPBm8VaT+b
         Awdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780470503; x=1781075303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/J3MM/+6FfTfKM3cmdBHdtr7z2aM1jfUFsSHKbnOeW4=;
        b=bI3s+985XvZzEU1Cpx2JE+YqJYVuJrU/p1E0SThn9iv4d6OOyDJ6M1zMsPTTlsGvWb
         68uWy+BaQlscDIO8rP1ic3DfUdZ7SWBt9TqjW/1uBJmhSERkLdbhEundxpqr/DpkSer0
         WO0Rw+3kan7V1pgwsS/aqFSlQw9YCiR3babh7IzrcXahJjEi9JYvmdtDJOZg6hdq+jd6
         /bHKrh9P2soBOzkOakMO69dB4Aez/wZsF6sqWdw92ReBnjZ7PgkG72AuzbistUX+clSO
         8iJSYNFTnOG8Egs6NMgDRnVYIu4klewOij1DVT0m6h26gNmfa/Pbtb8BEGWMb5anrzEa
         j0wQ==
X-Gm-Message-State: AOJu0YyOL2yNa+ghGQjaC3TBhGWA0Cy8SZNNG0OtWtRODZeSL0dCUDv1
	zTFLr0pAE56CsRFRFmvTcQOyy4hwXNabUnRUFeXQaioYSOz6xscF12E/47mlW+j0n4qje4dRcPB
	5/Ef7QfJpbledGW5LudKdjzA+mwpl/Ko=
X-Gm-Gg: Acq92OF17FGXT6/SpZWQHeMikn2QBPvVE/Aib8d96U5S6C75DIeTbOSxf/PRukYcYGU
	zppPAzxQ2E8eALvw3uQKCUFlTdaM3/5+gSLXApmcrbjQtmX9MKLNXUwg7v93COoki3mDHsR4WRb
	X0FuDZY1r68dqQdCN/tKwrhaMEVMLRme4WYeUV5RER697f04QT4SHZvzad9s3ulix+n+YdizDrB
	e918eD/FrdAWvW+ma8vYwknPCHRR2OviftJXy8ku1TymlFvDcHvWHaK0RyHGi3Wx4ExhvC36LIC
	zF6BQi5vdRTm+B3m
X-Received: by 2002:a05:6512:66da:b0:5aa:6aac:3f7f with SMTP id
 2adb3069b0e04-5aa7c0ebcf0mr519705e87.22.1780470502603; Wed, 03 Jun 2026
 00:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola_kvach@epam.com>
 <8d8b72d2-8188-4148-9812-0c116cc330e4@amd.com>
In-Reply-To: <8d8b72d2-8188-4148-9812-0c116cc330e4@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Jun 2026 10:08:11 +0300
X-Gm-Features: AVHnY4KiHOlSPh_Uwu_pPmNkoBjDxhuwQdUQ_VwW_jf3b74Vi0QPg8-MXl_93vQ
Message-ID: <CAGeoDV_FVddfvw3O9z1vRyZNp0hd+qEVSBtuyE4zpZeLQfLs0w@mail.gmail.com>
Subject: Re: [PATCH for-4.22] device-tree: validate first hwdom bank for boot modules
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1780470503-AB762161-4E1E103D/0/0
X-purgate-type: clean
X-purgate-size: 20135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,epam.com:email,patchew.org:url,gitlab.com:url];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 849DC635019

Hi Michal,

Thank you for the detailed review.

On Tue, Jun 2, 2026 at 12:06=E2=80=AFPM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 29-May-26 17:10, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > With LLC coloring enabled, the hardware domain memory is allocated by
> > allocate_hwdom_memory() rather than by using the fixed direct-map layou=
t.
> >
> > Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> > DMA") made that allocator prefer lower host regions. The first-bank
> > filter, however, still only checked the old 128MB heuristic. A low
> > region can satisfy that heuristic but still be too small, or otherwise
> > unsuitable, for the hardware-domain kernel and the DTB/initrd module
> > area to fit in bank 0 according to the Arm placement rules.
> >
> > Keep the existing first-bank size policy and add an architecture-specif=
ic
> > candidate check. On Arm, compute the kernel load address for the candid=
ate
> > bank using the same logic as kernel_zimage_place(), verify that the ker=
nel
> > range is covered by that bank, and then reuse the same module-placement
> > helper as place_modules(). The FDT is generated later, so use the
> > hardware-domain FDT allocation size as a conservative upper bound for t=
he
> > final DTB size.
> >
> > Check the candidate after capping the host region by the remaining
> > unassigned hardware-domain memory, so the validation is performed again=
st
> > the size that would actually become bank 0.
> >
> > This keeps the DMA-oriented allocation policy from de99f3263555 while
> > preventing a too-small bank 0 from reaching place_modules().
> >
> > Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for =
DMA")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes since RFC:
> > - Do not keep the RFC scalar minimum-size check. It can both reject
> >   valid layouts and accept layouts which still fail later. Instead,
> >   validate the candidate bank using the same kernel and module placemen=
t
> >   rules as the load path.
> >   Replace the scalar minimum-size check with arch_hwdom_first_bank_ok()=
.
> > - Reuse the existing Arm kernel and DTB/initrd placement rules for the
> >   first-bank candidate check.
> > - Treat the hardware-domain FDT allocation size as a conservative upper
> >   bound because the final FDT is generated later.
> >
> > Link to RFC:
> >    https://patchew.org/Xen/9ae4f7dd49f5b1f761193adae573c2675c92e883.177=
9051035.git.mykola._5Fkvach@epam.com/
> >
> > Why the RFC scalar approach was not kept:
> >
> > A simple minimum-size check is not sufficient here because the validity=
 of
> > the first bank depends on the actual Arm placement rules, not only on t=
he
> > aggregate size of the kernel, DTB and initrd. The DTB/initrd area may f=
it
> > before a 64-bit Image loaded with a text offset, while an AArch32
> > position-independent kernel may leave no valid module location even whe=
n
> > the aggregate size appears to fit. Fixed-address kernels also need the
> > candidate bank start to be considered.
> >
> > Link to synthetic tests output:
> >    https://gitlab.com/xen-project/people/mykola_kvach/xen/-/blob/fix/hw=
dom-first-bank-dom0-modules-v2-new/tools/tests/arm-boot-modules/test-arm-bo=
ot-modules.log?ref_type=3Dheads
> >
> > ---
> >  xen/arch/arm/acpi/domain_build.c        |   2 -
> >  xen/arch/arm/domain_build.c             |   8 ++
> >  xen/arch/arm/include/asm/domain_build.h |   4 +
> >  xen/arch/arm/include/asm/kernel.h       |   9 ++
> >  xen/arch/arm/kernel.c                   | 179 ++++++++++++++++++------
> >  xen/common/device-tree/domain-build.c   |  24 +++-
> >  xen/include/xen/fdt-kernel.h            |   9 ++
> >  7 files changed, 182 insertions(+), 53 deletions(-)
> >
> > diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domai=
n_build.c
> > index 249d899c33..db16f7fa94 100644
> > --- a/xen/arch/arm/acpi/domain_build.c
> > +++ b/xen/arch/arm/acpi/domain_build.c
> > @@ -26,8 +26,6 @@
> >  #undef virt_to_mfn
> >  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >
> > -#define ACPI_DOM0_FDT_MIN_SIZE 4096
> > -
> >  static int __init acpi_iomem_deny_access(struct domain *d)
> >  {
> >      acpi_status status;
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 1efddc60ef..550617f152 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -115,6 +115,14 @@ int __init parse_arch_dom0_param(const char *s, co=
nst char *e)
> >                               (IS_ENABLED(CONFIG_STATIC_SHM) ?         =
\
> >                                (NR_SHMEM_BANKS * (160 + 16)) : 0))
> >
> > +paddr_t __init hwdom_get_fdt_alloc_size(void)
> > +{
> > +    if ( acpi_disabled )
> > +        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_S=
IZE;
> > +
> > +    return ACPI_DOM0_FDT_MIN_SIZE;
> > +}
> > +
> >  unsigned int __init dom0_max_vcpus(void)
> >  {
> >      if ( opt_dom0_max_vcpus =3D=3D 0 )
> > diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/inc=
lude/asm/domain_build.h
> > index df8b361b3d..85cf46a958 100644
> > --- a/xen/arch/arm/include/asm/domain_build.h
> > +++ b/xen/arch/arm/include/asm/domain_build.h
> > @@ -19,6 +19,10 @@ int prepare_acpi(struct domain *d, struct kernel_inf=
o *kinfo);
> >
> >  int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *da=
ta);
> >
> > +#define ACPI_DOM0_FDT_MIN_SIZE 4096
> > +
> > +paddr_t hwdom_get_fdt_alloc_size(void);
> > +
> >  #if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> >  /* Utility function to determine if an Armv8-R processor supports VMSA=
. */
> >  bool has_v8r_vmsa_support(void);
> > diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/a=
sm/kernel.h
> > index 21f4273fa1..bf14fb208a 100644
> > --- a/xen/arch/arm/include/asm/kernel.h
> > +++ b/xen/arch/arm/include/asm/kernel.h
> > @@ -8,12 +8,21 @@
> >
> >  #include <asm/domain.h>
> >
> > +#include <xen/types.h>
> > +
> > +struct kernel_info;
> > +
> >  struct arch_kernel_info
> >  {
> >      /* Enable pl011 emulation */
> >      bool vpl011;
> >  };
> >
> > +#define arch_hwdom_first_bank_ok arch_hwdom_first_bank_ok
> > +bool arch_hwdom_first_bank_ok(const struct kernel_info *info,
> > +                              paddr_t bank_start,
> > +                              paddr_t bank_size);
> > +
> >  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
> >
> >  /*
> > diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> > index b72585b7fe..907239a246 100644
> > --- a/xen/arch/arm/kernel.c
> > +++ b/xen/arch/arm/kernel.c
> > @@ -40,27 +40,67 @@ struct minimal_dtb_header {
> >      /* There are other fields but we don't use them yet. */
> >  };
> >
> > -static void __init place_modules(struct kernel_info *info,
> > -                                 paddr_t kernbase, paddr_t kernend)
> > +static paddr_t __init
> > +kernel_zimage_place_in_bank(const struct kernel_info *info,
> > +                            paddr_t bank_start, paddr_t bank_size)
> >  {
> > -    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte al=
ignment */
> > -    const struct boot_module *mod =3D info->bd.initrd;
> > -    const struct membanks *mem =3D kernel_info_get_mem(info);
> > -    const paddr_t initrd_len =3D ROUNDUP(mod ? mod->size : 0, MB(2));
> > -    const paddr_t dtb_len =3D ROUNDUP(fdt_totalsize(info->fdt), MB(2))=
;
> > -    const paddr_t modsize =3D initrd_len + dtb_len;
> > +    paddr_t load_addr;
> >
> > -    /* Convenient */
> > -    const paddr_t rambase =3D mem->bank[0].start;
> > -    const paddr_t ramsize =3D mem->bank[0].size;
> > -    const paddr_t ramend =3D rambase + ramsize;
> > +#ifdef CONFIG_HAS_DOMAIN_TYPE
> > +    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->image.start =3D=3D=
 0) )
> > +        return bank_start + info->image.text_offset;
> > +#endif
> > +
> > +    /*
> > +     * If start is zero, the zImage is position independent, in this
> > +     * case Documentation/arm/Booting recommends loading below 128MiB
> > +     * and above 32MiB. Load it as high as possible within these
> > +     * constraints, while also avoiding the DTB.
> > +     */
> > +    if ( info->image.start =3D=3D 0 )
> > +    {
> > +        paddr_t load_end;
> > +        paddr_t ram128mb;
> > +
> > +        ram128mb =3D bank_start + MB(128);
> > +        load_end =3D bank_start + bank_size;
> > +        load_end =3D min(ram128mb, load_end);
> > +
> > +        if ( load_end - bank_start < info->image.len )
> > +            return INVALID_PADDR;
> > +
> > +        load_addr =3D load_end - info->image.len;
> > +        /* Align to 2MB */
> > +        load_addr &=3D ~(MB(2) - 1);
> > +        if ( load_addr < bank_start )
> > +            return INVALID_PADDR;
> > +    }
> > +    else
> > +        load_addr =3D info->image.start;
> > +
> > +    return load_addr;
> > +}
> > +
> > +static bool __init
> > +first_bank_has_enough_room(paddr_t ramsize, paddr_t kernbase,
> > +                           paddr_t kernend, paddr_t modsize)
> How about first_bank_can_fit_modules()? The name would be more descriptiv=
e.

Ack.

>
> > +{
> >      const paddr_t kernsize =3D ROUNDUP(kernend, MB(2)) - kernbase;
> > -    const paddr_t ram128mb =3D rambase + MB(128);
> >
> > -    paddr_t modbase;
> > +    /*
> > +     * Check only the aggregate kernel/module footprint. The actual DT=
B/initrd
> > +     * location is selected by find_module_placement().
> I don't particularly like that we call dtb+initrd modules while kernel is=
 also a
> module. How about renaming to find_dtb_initrd_placement()? This will impr=
ove the
> readability by a lot. We could also rename place_modules() to
> place_dtb_initrd_modules() or just place_dtb_initrd().

Ack.

>
> > +     */
> > +    return modsize + kernsize <=3D ramsize;
> > +}
> >
> > -    if ( modsize + kernsize > ramsize )
> > -        panic("Not enough memory in the first bank for the kernel+dtb+=
initrd\n");
> > +static bool __init
> > +find_module_placement(paddr_t rambase, paddr_t ramsize,
> > +                      paddr_t kernbase, paddr_t kernend,
> > +                      paddr_t modsize, paddr_t *modbase)
> > +{
> > +    const paddr_t ramend =3D rambase + ramsize;
> Instead of passing ramsize, pass ramend right away to avoid this line (si=
milar
> to kernbase, kernend).

Ack.

>
> > +    const paddr_t ram128mb =3D rambase + MB(128);
> >
> >      /*
> >       * DTB must be loaded such that it does not conflict with the
> > @@ -80,17 +120,49 @@ static void __init place_modules(struct kernel_inf=
o *info,
> >       * tools/libxc/xc_dom_arm.c:arch_setup_meminit as well.
> This is a stale path. Please update to tools/libs/guest/xg_dom_arm.c:memi=
nit

Ack.

>
> >       */
> >      if ( ramend >=3D ram128mb + modsize && kernend < ram128mb )
> > -        modbase =3D ram128mb;
> > -    else if ( ramend - modsize > ROUNDUP(kernend, MB(2)) )
> > -        modbase =3D ramend - modsize;
> > -    else if ( kernbase - rambase > modsize )
> > -        modbase =3D kernbase - modsize;
> > -    else
> >      {
> > -        panic("Unable to find suitable location for dtb+initrd\n");
> > -        return;
> > +        *modbase =3D ram128mb;
> Do we need this extra variable? Can't we just *modbase =3D rambase + MB(1=
28)?

Yes, we can. The variable is not needed for correctness. I kept it to
name the 128MB placement boundary and to make the condition and the
assignment use exactly the same value.

I can inline it in the next version if you prefer, although I think the
named boundary is a little clearer than:

if ( ramend >=3D rambase + MB(128) + modsize && kernend < rambase + MB(128)=
 )
{
    *modbase =3D rambase + MB(128);

>
> > +        return true;
> > +    }
> > +
> > +    if ( ramend - modsize > ROUNDUP(kernend, MB(2)) )
> > +    {
> > +        *modbase =3D ramend - modsize;
> > +        return true;
> > +    }
> > +
> > +    if ( kernbase - rambase > modsize )
> > +    {
> > +        *modbase =3D kernbase - modsize;
> > +        return true;
> >      }
> >
> > +    return false;
> > +}
> > +
> > +static void __init place_modules(struct kernel_info *info,
> > +                                 paddr_t kernbase, paddr_t kernend)
> > +{
> > +    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte al=
ignment */
> > +    const struct boot_module *mod =3D info->bd.initrd;
> > +    const struct membanks *mem =3D kernel_info_get_mem(info);
> > +    const paddr_t initrd_len =3D ROUNDUP(mod ? mod->size : 0, MB(2));
> > +    const paddr_t dtb_len =3D ROUNDUP(fdt_totalsize(info->fdt), MB(2))=
;
> > +    const paddr_t modsize =3D initrd_len + dtb_len;
> > +
> > +    /* Convenient */
> > +    const paddr_t rambase =3D mem->bank[0].start;
> > +    const paddr_t ramsize =3D mem->bank[0].size;
> > +
> > +    paddr_t modbase;
> > +
> > +    if ( !first_bank_has_enough_room(ramsize, kernbase, kernend, modsi=
ze) )
> > +        panic("Not enough memory in the first bank for the kernel+dtb+=
initrd\n");
> > +
> > +    if ( !find_module_placement(rambase, ramsize, kernbase, kernend, m=
odsize,
> > +                                &modbase) )
> > +        panic("Unable to find suitable location for dtb+initrd\n");
> > +
> >      info->dtb_paddr =3D modbase;
> >      info->initrd_paddr =3D info->dtb_paddr + dtb_len;
> >  }
> > @@ -100,32 +172,51 @@ static paddr_t __init kernel_zimage_place(struct =
kernel_info *info)
> >      const struct membanks *mem =3D kernel_info_get_mem(info);
> >      paddr_t load_addr;
> >
> > -#ifdef CONFIG_HAS_DOMAIN_TYPE
> > -    if ( (info->type =3D=3D DOMAIN_64BIT) && (info->image.start =3D=3D=
 0) )
> > -        return mem->bank[0].start + info->image.text_offset;
> > -#endif
> > +    load_addr =3D kernel_zimage_place_in_bank(info, mem->bank[0].start=
,
> > +                                            mem->bank[0].size);
> > +    if ( load_addr =3D=3D INVALID_PADDR )
> > +        panic("Unable to find suitable location for the kernel\n");
> >
> > +    return load_addr;
> > +}
> > +
> > +bool __init arch_hwdom_first_bank_ok(const struct kernel_info *info,
> > +                                     paddr_t bank_start,
> > +                                     paddr_t bank_size)
> > +{
> > +    const struct boot_module *initrd =3D info->bd.initrd;
> >      /*
> > -     * If start is zero, the zImage is position independent, in this
> > -     * case Documentation/arm/Booting recommends loading below 128MiB
> > -     * and above 32MiB. Load it as high as possible within these
> > -     * constraints, while also avoiding the DTB.
> > +     * place_modules() rounds the DTB and initrd placement to 2MB boun=
daries;
> > +     * use the same granularity when checking whether the first bank c=
an hold
> > +     * the boot modules.
> >       */
> > -    if ( info->image.start =3D=3D 0 )
> > -    {
> > -        paddr_t load_end;
> > +    const paddr_t initrd_len =3D ROUNDUP(initrd ? initrd->size : 0, MB=
(2));
> > +    /*
> > +     * The hardware domain FDT has not been generated yet. Use the all=
ocation
> > +     * size as a conservative upper bound for the final DTB size.
> > +     */
> > +    const paddr_t dtb_len =3D ROUNDUP(hwdom_get_fdt_alloc_size(), MB(2=
));
> > +    const paddr_t rambase =3D bank_start;
> > +    const paddr_t ramsize =3D bank_size;
> > +    const paddr_t modsize =3D initrd_len + dtb_len;
> > +    const paddr_t ramend =3D rambase + ramsize;
> > +    paddr_t kernbase;
> > +    paddr_t kernend;
> > +    paddr_t modbase;
> >
> > -        load_end =3D mem->bank[0].start + mem->bank[0].size;
> > -        load_end =3D MIN(mem->bank[0].start + MB(128), load_end);
> > +    kernbase =3D kernel_zimage_place_in_bank(info, bank_start, bank_si=
ze);
> > +    if ( kernbase =3D=3D INVALID_PADDR ||
> > +         info->image.len > INVALID_PADDR - kernbase )
> > +        return false;
> >
> > -        load_addr =3D load_end - info->image.len;
> > -        /* Align to 2MB */
> > -        load_addr &=3D ~((2 << 20) - 1);
> > -    }
> > -    else
> > -        load_addr =3D info->image.start;
> > +    kernend =3D kernbase + info->image.len;
> >
> > -    return load_addr;
> > +    if ( kernbase < rambase || kernend > ramend )
> > +        return false;
> > +
> > +    return first_bank_has_enough_room(ramsize, kernbase, kernend, mods=
ize) &&
> > +           find_module_placement(rambase, ramsize, kernbase, kernend, =
modsize,
> > +                                 &modbase);
> >  }
> >
> >  static void __init kernel_zimage_load(struct kernel_info *info)
> > diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-=
tree/domain-build.c
> > index 2a760b007b..25bc392fea 100644
> > --- a/xen/common/device-tree/domain-build.c
> > +++ b/xen/common/device-tree/domain-build.c
> > @@ -299,20 +299,30 @@ static bool __init allocate_hwdom_memory(struct k=
ernel_info *kinfo)
> >
> >      for ( i =3D 0; (kinfo->unassigned_mem > 0) && (i < nr_banks); i++ =
)
> >      {
> > -        paddr_t bank_size;
> > +        const paddr_t bank_start =3D hwdom_free_mem->bank[i].start;
> > +        paddr_t bank_size =3D hwdom_free_mem->bank[i].size;
> > +
> > +        /*
> > +         * Check the size that would actually be assigned, not just th=
e size
> > +         * of the host region.
> > +         */
> > +        bank_size =3D min(bank_size, kinfo->unassigned_mem);
> >
> >          /*
> >           * The first bank must be large enough for place_modules() to
> >           * fit the kernel, DTB and initrd.  Skip small regions to avoi=
d
> >           * ending up with a tiny first bank.
> >           */
> > -        if ( !mem->nr_banks && (hwdom_free_mem->bank[i].size < min_ban=
k_size) )
> > -            continue;
> > +        if ( !mem->nr_banks )
> > +        {
> > +            if ( bank_size < min_bank_size )
> > +                continue;
> > +
> > +            if ( !arch_hwdom_first_bank_ok(kinfo, bank_start, bank_siz=
e) )
> > +                continue;
> > +        }
> >
> > -        bank_size =3D MIN(hwdom_free_mem->bank[i].size, kinfo->unassig=
ned_mem);
> > -        if ( !allocate_bank_memory(kinfo,
> > -                                   gaddr_to_gfn(hwdom_free_mem->bank[i=
].start),
> > -                                   bank_size) )
> > +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), ba=
nk_size) )
> >          {
> >              xfree(hwdom_free_mem);
> >              return false;
> > diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.=
h
> > index 00c37be101..86f2a69ede 100644
> > --- a/xen/include/xen/fdt-kernel.h
> > +++ b/xen/include/xen/fdt-kernel.h
> > @@ -93,6 +93,15 @@ kernel_info_get_mem_const(const struct kernel_info *=
kinfo)
> >      return container_of(&kinfo->mem.common, const struct membanks, com=
mon);
> >  }
> >
> > +#ifndef arch_hwdom_first_bank_ok
> > +static inline bool
> > +arch_hwdom_first_bank_ok(const struct kernel_info *info, paddr_t bank_=
start,
> > +                         paddr_t bank_size)
> > +{
> > +    return true;
> > +}
> > +#endif
> > +
> >  #ifndef KERNEL_INFO_SHM_MEM_INIT
> >
> >  #ifdef CONFIG_STATIC_SHM
>
> I would prefer if this patch was split into refactoring (e.g. split
> place_modules() into functions later on used by patch 2) + hwdom fix (2
> patches). The first patch would also fit the rename I suggested.

Yes, that makes sense. I will split this in v2: first a
behavior-preserving refactoring patch, including the rename you
suggested, and then a second patch with the actual hwdom first-bank fix.

Best regards,
Mykola

