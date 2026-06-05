Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WH5hBfKKImrAZwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:38:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCB646764
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:38:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aCElWtHb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329222.1593427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQ3q-0007n7-Po; Fri, 05 Jun 2026 08:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329222.1593427; Fri, 05 Jun 2026 08:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVQ3q-0007kJ-Mr; Fri, 05 Jun 2026 08:37:50 +0000
Received: by outflank-mailman (input) for mailman id 1329222;
 Fri, 05 Jun 2026 08:37:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wVQ3p-0007kD-HD
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:37:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVQ3o-0098PX-PC
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:37:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a228adc-5cb7-0a2a0a5109dd-0a2a45079054-0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:37:48 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a228adc-229c-0a2a45070019-d155d0aed05d-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:37:48 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3965d76090bso14813231fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:37:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780648668; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6QoVLdpNtTM44CvvnsOIvbsNSw5XdSPQtGn1MJhMMLFJos+drlG4XxHCrrpgzOtzp
         IMjMrBAcYGp4JBm5767Rlhx0a4JRMhpwdQbpgaiQeQ7DTE5x702nDvCr2L7QOjfit4V4
         5QF5uYWGffn6SvLICqiOBgRZ7KG5WcfKF0PT8efoO8fk45mSH9cvXVuhmsUzUS7eabFI
         bSe/YHBW+LEeeLH4dJxPrxeDNIc7YfQ01H7h9u4ikIWqAjmvvybaY8bZzfDD60wUgtKt
         oMM3tzmeADp8t8Od976l9OLDIUDnZxwPMv3/N86HpSbBfWOqh1/ZSGI3Ps8eZz3dMcxn
         cUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bVEOXCHy3A2WmkL4IGAYJZTNs+To7768HArndhiBNT0=;
        fh=zk+JGOYQjpPuYyxRR8v3OZOsXfYFHag6LUjq1VldQ2M=;
        b=B6l1V0zEUpfBLZxcyzqAlUmM9RTAtix3o4mlezVvA6fGS5hfS4KTqSoYn40veCB6ew
         N9Bau/W5yzo/rl/lTfmXWaBCb51/gyKYPTXJuHmm+eZSiRAiaVk6vODKGMHbo7q9tZgl
         LabHuHmqCInWuQoCyem2xihSTCIOrrx5D0INb3R4iJHa55EiqufbSCmDdNm572b1VgmK
         LrBTQihNXEnB4+med4W+X4WCQ+hk3Rq56s8HuGYRwyidNe9EmoWkWY6c4qJ9TE5+18/5
         LS8tWtGtp64avaZFRHPq9WlbXgKY2dgtBhUegV31tn82ROEF1Z4q9DNyckZnpAG/feOW
         b2EA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780648668; x=1781253468; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVEOXCHy3A2WmkL4IGAYJZTNs+To7768HArndhiBNT0=;
        b=aCElWtHb9MQLXnxSSpYJCxfNeETWPUxrgG5HJNKdMp++p2G+MXoDlhWI6jxbEklIfT
         OdzZbwHwIHZRSFb9i4XZAvAgWwUFcetXeZ5Tzb2LTrNCoxNYIK9bXh747mnLUsuSyYtz
         OUXOc28REhFp424E738RgI2EA4PrWl04wW+nDt7X8LoQMBLLxhJ2wOCCkdEZNpQui0NY
         TLZb2M87VOu+xxqlpsSNLWORud0icCXOfLxY4n3+LUmr/FE18qEOsm3MQS4ZDRW6zsCa
         Fpr4epasH9fhX9thk6B7bZYQSaea4kGe0NUACwRGLbzGgpg9vp5CwNbW3i76re63N4Id
         K1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780648668; x=1781253468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVEOXCHy3A2WmkL4IGAYJZTNs+To7768HArndhiBNT0=;
        b=Q/DDjx+VoHplbNDKxJDGE+719plJ2f9a9dBt9ul3hQZIQ9yphZMohnrNmLSejUeWpd
         Yypg+DRVywcO6Twy2KnOvbccXePOj2kQCE8mTacvPVvq4F1Mbiar+N4vHBXgNU9Ctyjb
         F9EsJNCnPvlhyx+Q8lVhLac/2XTBeA8WuwuonKl1f5MJxXFnrTuQz9blkznq/RUNljlz
         OfQpflc4N/zFDxElfD5GGU9Pcq3k48X/Qf6RrGm6P7rl8ANbfTVey6LuaJQZRsIdRPv/
         CxyWCGNOgb7BXQS9Xi9F99wIkgHrD8ekE6tS3SRbHUAeHxAHEqe1W1/GwY57CvmRGdlO
         3o2w==
X-Gm-Message-State: AOJu0YxPv/n8jA4cKfFOA+sezwZSD3NnVzzf7OjnKLCzy9DKHm2jXC2e
	Td//kKIfWTmPcoLpB1EMeCgV/dl+j9OKERvt6WApj92EVOw9wUJrpBBXmVR03Zjq17MgAD6gan3
	0tpPf7efImNUMMVmwCbI3CFC1KmSLErY=
X-Gm-Gg: Acq92OHZ0x1ge7ntnhCgTNgUYw9rENN3AJmyC/Ip1lpLtakjnFGKXRnpNDheWXYatCU
	PS9hwetvG/QRvEPR6fvJLCTEGltAebnZ6W+sqMXVCeQKfjan67plbWBknz7cULfxug8vlolyE5f
	2+o2Jb1rUaxwHfeKKxJx7OTkucbFbKAZEVClXbBKKDLW/AjCP0fDrM1kSatx6PksiQ7YV+GxepV
	yDauK66QUfdvCpekrsWklmUyPA35foIsQTuoimAaqKOQMAjApSYt5+2W5tHcX0V5z/qh4PLVe9p
	1+XC8ZLx6PfUpsq0
X-Received: by 2002:a2e:a813:0:b0:394:5c9a:f31b with SMTP id
 38308e7fff4ca-396d08e4aa3mr6989261fa.17.1780648667487; Fri, 05 Jun 2026
 01:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780602987.git.mykola_kvach@epam.com> <e21cd3c7274eac76607b551134f3f23665a31d7c.1780602987.git.mykola_kvach@epam.com>
 <f4ec4ef1-9051-4dea-a1ae-0966ec46296e@amd.com>
In-Reply-To: <f4ec4ef1-9051-4dea-a1ae-0966ec46296e@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Jun 2026 11:37:36 +0300
X-Gm-Features: AVHnY4I-X1bZ9id-LuGYwsVWMR5VWEqZBoFVZh2JcNXSejKBC6RDJ0ZRWRuDkbY
Message-ID: <CAGeoDV-HMo8Uqwh3pYOYbzJsUqud8KDJSwFuXbt9f5_mNFbQ3Q@mail.gmail.com>
Subject: Re: [PATCH for-4.22 v2 2/2] device-tree: validate hwdom bank 0 boot placement
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1780648668-28678C48-64D2CDE0/0/0
X-purgate-type: clean
X-purgate-size: 14135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,citrix.com,vates.tech,suse.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,epam.com:email,amd.com:email,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EFCB646764

On Fri, Jun 5, 2026 at 10:56=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 05-Jun-26 07:19, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > With LLC coloring enabled, the hardware domain memory is allocated by
> > allocate_hwdom_memory() rather than by using the fixed direct-map layou=
t.
> >
> > Commit de99f3263555 ("device-tree: Improve hwdom memory allocation for
> > DMA") made that allocator prefer lower host regions. The first-bank
> > filter, however, still only checked the old 128MB heuristic. A low regi=
on
> > can satisfy that heuristic but still be too small, or otherwise
> > unsuitable, for the hardware-domain kernel and the DTB/initrd area to f=
it
> > in bank 0 according to the Arm placement rules.
> >
> > Keep the existing first-bank size policy and add an architecture-specif=
ic
> > candidate check. On Arm, compute the kernel load address for the
> > candidate bank using the same logic as kernel_zimage_place(), verify th=
at
> > the kernel range is covered by that bank, and then reuse the same
> > DTB/initrd placement helper as place_dtb_initrd(). The FDT is generated
> > later, so use the hardware-domain FDT allocation size as a conservative
> > upper bound for the final DTB size.
> >
> > Check the candidate after capping the host region by the remaining
> > unassigned hardware-domain memory, so the validation is performed again=
st
> > the size that would actually become bank 0.
> >
> > This keeps the DMA-oriented allocation policy from de99f3263555 while
> > preventing a too-small bank 0 from reaching place_dtb_initrd().
> >
> > Make kernel_zimage_place_in_bank() return INVALID_PADDR when a
> > position-independent zImage cannot be placed in the supplied bank; the
> > real load path turns this into a panic, while the hwdom candidate check
> > uses it to reject the bank.
> >
> > Fixes: de99f3263555 ("device-tree: Improve hwdom memory allocation for =
DMA")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - Split the behavior-preserving placement refactoring into the previous
> >   patch.
> > - Reuse the refactored Arm kernel and DTB/initrd placement helpers for
> >   the first-bank candidate check.
> >
> > Link to v1:
> >   https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780=
065103.git.mykola._5Fkvach@epam.com/
> >
> > Changes since RFC:
> > - Do not keep the RFC scalar minimum-size check.  It can both reject va=
lid
> >   layouts and accept layouts which still fail later.  Instead, validate
> >   the candidate bank using the same kernel and DTB/initrd placement rul=
es
> >   as the load path.
> > - Replace the scalar minimum-size check with arch_hwdom_first_bank_ok()=
.
> > - Validate fixed-address and AArch32 start =3D=3D 0 kernel placement ag=
ainst
> >   the candidate bank.
> > - Check the candidate after capping the host region by the remaining
> >   unassigned hardware-domain memory.
> > - Treat the hardware-domain FDT allocation size as a conservative upper
> >   bound because the final FDT is generated later.
> >
> > Link to RFC: https://patchew.org/Xen/9ae4f7dd49f5b1f761193adae573c2675c=
92e883.1779051035.git.mykola._5Fkvach@epam.com/
> >
> > Why the RFC scalar approach was not kept:
> >
> > A simple minimum-size check is not sufficient here because the validity
> > of the first bank depends on the actual Arm placement rules, not only o=
n
> > the aggregate size of the kernel, DTB and initrd. The DTB/initrd area m=
ay
> > fit before a 64-bit Image loaded with a text offset, while an AArch32
> > position-independent kernel may leave no valid module location even whe=
n
> > the aggregate size appears to fit. Fixed-address kernels also need the
> > candidate bank start to be considered.
> > ---
> >  xen/arch/arm/acpi/domain_build.c        |  2 -
> >  xen/arch/arm/domain_build.c             |  8 ++++
> >  xen/arch/arm/include/asm/domain_build.h |  4 ++
> >  xen/arch/arm/include/asm/kernel.h       |  9 ++++
> >  xen/arch/arm/kernel.c                   | 57 ++++++++++++++++++++++++-
> >  xen/common/device-tree/domain-build.c   | 24 ++++++++---
> >  xen/include/xen/fdt-kernel.h            |  9 ++++
> >  7 files changed, 102 insertions(+), 11 deletions(-)
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
> > index d1be4d8074..ecea2822a1 100644
> > --- a/xen/arch/arm/kernel.c
> > +++ b/xen/arch/arm/kernel.c
> > @@ -64,9 +64,15 @@ kernel_zimage_place_in_bank(const struct kernel_info=
 *info,
> >          load_end =3D bank_start + bank_size;
> >          load_end =3D MIN(bank_start + MB(128), load_end);
> >
> > +        if ( load_end - bank_start < info->image.len )
> > +            return INVALID_PADDR;
> > +
> >          load_addr =3D load_end - info->image.len;
> >          /* Align to 2MB */
> >          load_addr &=3D ~(MB(2) - 1);
> > +
> > +        if ( load_addr < bank_start )
> > +            return INVALID_PADDR;

After re-checking the hwdom allocation path, this post-alignment check
looks redundant. Candidate bank starts come from the hwdom free-region
list, where regions are already 2MB-aligned. The check before
subtracting image.len already ensures that the computed load address does
not go below bank_start, so aligning it down to 2MB cannot move it below
bank_start for this path.

I will drop this check in the next revision.

> >      }
> >      else
> >          load_addr =3D info->image.start;
> > @@ -164,9 +170,56 @@ static void __init place_dtb_initrd(struct kernel_=
info *info,
> >  static paddr_t __init kernel_zimage_place(struct kernel_info *info)
> >  {
> >      const struct membanks *mem =3D kernel_info_get_mem(info);
> > +    paddr_t load_addr;
> > +
> > +    load_addr =3D kernel_zimage_place_in_bank(info, mem->bank[0].start=
,
> > +                                            mem->bank[0].size);
> > +    if ( load_addr =3D=3D INVALID_PADDR )
> > +        panic("Unable to find suitable location for the kernel\n");
> > +
> > +    return load_addr;
> > +}
> > +
> > +bool __init arch_hwdom_first_bank_ok(const struct kernel_info *info,
> > +                                     paddr_t bank_start,
> > +                                     paddr_t bank_size)
> > +{
> > +    const struct boot_module *initrd =3D info->bd.initrd;
> > +    /*
> > +     * place_dtb_initrd() rounds the DTB and initrd placement to 2MB b=
oundaries;
> > +     * use the same granularity when checking whether the first bank c=
an hold
> > +     * them.
> > +     */
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
> > +    const paddr_t dtb_initrd_size =3D initrd_len + dtb_len;
> > +    const paddr_t ramend =3D rambase + ramsize;
> > +    paddr_t kernbase;
> > +    paddr_t kernend;
> > +    paddr_t dtb_base;
> > +
> > +    kernbase =3D kernel_zimage_place_in_bank(info, bank_start, bank_si=
ze);
> > +    if ( kernbase =3D=3D INVALID_PADDR ||
> > +         info->image.len > INVALID_PADDR - kernbase )
> Max IPA is 48bit, far from 64bit, where the arch max is 52bit and image.l=
en is a
> kernel image size, so kernbase + image.len cannot wrap a 64-bit paddr_t, =
so this
> check is dead. Drop it.

Ack, I will drop this check.

>
> > +        return false;
> > +
> > +    kernend =3D kernbase + info->image.len;
> > +
> > +    if ( kernbase < rambase || kernend > ramend )
> Please add braces around individual expressions.

Ack, I will make the condition explicit.

>
> > +        return false;
> > +
> > +    if ( !first_bank_can_fit_modules(ramsize, kernbase, kernend,
> > +                                     dtb_initrd_size) )
> > +        return false;
> >
> > -    return kernel_zimage_place_in_bank(info, mem->bank[0].start,
> > -                                       mem->bank[0].size);
> > +    return find_dtb_initrd_placement(rambase, ramend, kernbase, kernen=
d,
> > +                                     dtb_initrd_size, &dtb_base);
> >  }
> >
> >  static void __init kernel_zimage_load(struct kernel_info *info)
> > diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-=
tree/domain-build.c
> > index f3ba496f1e..2e806c1b09 100644
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
> >           * The first bank must be large enough for place_dtb_initrd() =
to
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
> > index 00c37be101..71e2344b97 100644
> > --- a/xen/include/xen/fdt-kernel.h
> > +++ b/xen/include/xen/fdt-kernel.h
> > @@ -93,6 +93,15 @@ kernel_info_get_mem_const(const struct kernel_info *=
kinfo)
> >      return container_of(&kinfo->mem.common, const struct membanks, com=
mon);
> >  }
> >
> > +#ifndef arch_hwdom_first_bank_ok
> > +static inline bool arch_hwdom_first_bank_ok(const struct kernel_info *=
info,
> This should deserve a comment describing its contract.
> Also, the name is not very descriptive: how about
> arch_hwdom_first_bank_can_fit_modules() similar to generic Arm's
> first_bank_can_fit_modules()?

Ack, I will add a contract comment and rename the hook to
arch_hwdom_first_bank_can_fit_modules().

Best regards,
Mykola

