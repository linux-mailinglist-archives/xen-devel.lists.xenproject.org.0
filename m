Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5RMUKpD4J2rm6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:27:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0423365F758
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 13:27:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=j9XNjEvO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332603.1595076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWub3-0005XM-UA; Tue, 09 Jun 2026 11:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332603.1595076; Tue, 09 Jun 2026 11:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWub3-0005Vc-Qc; Tue, 09 Jun 2026 11:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1332603;
 Tue, 09 Jun 2026 11:26:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWub1-0005VG-PC
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:26:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWub0-00H6zX-Gi
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 13:26:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a27f848-2eae-0a2a0a5409dd-0a2a4508b04c-40
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:26:14 +0200
Received: from [209.85.167.53] (helo=mail-lf1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a27f855-63b5-0a2a45080019-d155a735a842-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 13:26:14 +0200
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5aa61503fdaso5560832e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 04:26:14 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781004373; cv=none;
        d=google.com; s=arc-20240605;
        b=PDfukmvhytkWAbDmDPn0lwpra6stT/RfH5VzIVXbQH4nk+A9ubC4fr7kdKqg4fYGUR
         Y9Cm6EuEVzc3kSkq+eAOUNH6oRhqUyamQbig7jwQiPQDjKU898hIgKLL26i8/Vx7GFex
         njgBhoNIoNN2nimXMOllSfSHAo5nk6hJCVijDWG5tMrQ/PV0pj624rqkkc4e7pz94+0Z
         HNKPUPOZjHyRHB2Sv+HJwdRqdTDOwr0T3iqUVXc8EJJ4lEUeZYnl9NgoHJPRz4jDA+Zo
         JJcpQ/dKg+f5VEEbMopxOG7ksWpKXaLpq/+4vvbavO5lr1o1MlYLf/Ws0t5cz/vNqyvV
         Dmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLYcPfWt9uMVLfZgYj04XzkulV5XoWd3hFIn8YeqBwk=;
        fh=zk+JGOYQjpPuYyxRR8v3OZOsXfYFHag6LUjq1VldQ2M=;
        b=T1LtuURQWrapEpNV4AT+ci7DQnxqQsKhfLjpeXcDCysm+AvmFvvNqjPR4VshwBoZ00
         4Gk0NdL21II4Ta8ES0RR9lP4InXv4P5h4ItcnldgnYFFePmgRxyXZ+yZGIPgxO0Z2MZo
         0xWV0ycWhcwy3RIWyDpolJi0tVshQqelyAADnhFyEuwzSYIP0gvF9hws4akzL80/9Cuh
         J+d8b1I4liLVedPTxsDYmsKvPT5pvuyarKAcPpxCdVkUE5OFMTLDiYv1Ye6tM7C5ziNt
         +BNQGMcrhUT39nGAkopmUwoklzVfBEY86E6sA0z8+UqW62W00vdj+3WS2caKJ2xIATar
         4WFQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781004373; x=1781609173; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLYcPfWt9uMVLfZgYj04XzkulV5XoWd3hFIn8YeqBwk=;
        b=j9XNjEvO2j5/mz/iOZsJz5AoeekEEO0CWbd7nVXaZbsV4fuWNDQ39JLgNScsrMX8Ot
         zUzkUAinSGx3lV04QnzHcgYnqJoVXV0GQWPxHvel+DHs05g1VTQsWR8jHZz3p3EEz7/W
         Qe9EtLG1L/U9J9YBuM1VMjSCe11cvqdnBlKPbfBqYPfLEwOIJscng5S/OY2Nx2ugC9iN
         R6wYkZxTyAKbOU/lsGjRBOzgI2Hj6D46zSJGF3TN/Af3g8yA0Qu+09IaY3RHcFEJQVPW
         JTUezuS1eWeXHoavoyROe6TQ0l4J4R1akpfdR0ZJynyJ/b/izGuEj7S3JAZC5y10rJq3
         lIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781004373; x=1781609173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLYcPfWt9uMVLfZgYj04XzkulV5XoWd3hFIn8YeqBwk=;
        b=j5cM7fZziAVKb4SoURZ6Y0W1znRzQs9yFus0Uwe+ZqzJXSW228wS9SwSj6ML3B6nFS
         FlLs73g9LhQghxoASM+QBrsH/h/Bu7sfW0WMYgR4SY5Odtiq0govF6xS9cIVmw7X3Q+U
         98UIRR1IQ3i9XoiYEDw5OyDU1mE2OdYWWuStep04POCq1Ms/Myvw4rBtrU7M2PMHpMAq
         2vjffiGGiICCweM2k8hLK+XcQgdY+XWsa4Dm2l9cr91ybcPQV8ps+CHWi/CCx4y6lkZV
         F+cqWPaMUwZBCFbDd/5z9+pQXA+HlXRn37a2OFTx9Uv1on0quI+fZrfdwZrVXG8bpM/a
         pFqg==
X-Gm-Message-State: AOJu0YzqbA4ZVZURXlGvzDV8KzHhua8ELrsg16LtfB0a6KrrZXx43ZLb
	ULjSWY5n2za3bi2hiKhR9EOn7OSumHbHJd2rVunREaFASM+VFFR34oSYi7Ya1VbZrWW08MIwAEG
	UVswgJV/TlEBMOFubHUvsYaraZmaMO4M=
X-Gm-Gg: Acq92OEwkJVQO5aEPUVvu0FhM0LWL99uimjD2hgnpDIM55ogmJXjCMLQdgcaaJwQrfw
	tsPfuu2yZcXhKasfeXwGvloeKQy2jz0qo840GBoq0iVkhTSfN7vZNw+6qPpgLe8/uwA7ZsE0waD
	lr6eHim7w6eHo/0kw8DxWQhvGle7H6zABNee7i5esjMFOKw45mlanMJKsaYo+nRmJXbPbznmCS2
	SKVCNE9t5aizD7rW7gTY0MnJmAMq4Rt2dqpqMwmT6x4Zgq/X5MJup1hqBQLCF74IR+5S/Q/ZxIB
	J7iYIQFnItHn3omF
X-Received: by 2002:a05:6512:31c8:b0:5a8:73c2:c90b with SMTP id
 2adb3069b0e04-5aa886eac86mr5533347e87.20.1781004373010; Tue, 09 Jun 2026
 04:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780896733.git.mykola_kvach@epam.com> <916609a0c6e66dd24e4435d31a165a1326fe5281.1780896733.git.mykola_kvach@epam.com>
 <03bca529-419a-4c14-b229-7e47e8e36e7a@amd.com>
In-Reply-To: <03bca529-419a-4c14-b229-7e47e8e36e7a@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 9 Jun 2026 14:26:01 +0300
X-Gm-Features: AVVi8CcLwMU7AA8UIEIfji0bxOX8svmDEy8e9BBxKUmR3zGprKaqfC08x_ayY5k
Message-ID: <CAGeoDV-SOWiHq46wy1Lwc-PNO=Mh+wm03SHwWxFzeNxC8s9Bbg@mail.gmail.com>
Subject: Re: [PATCH for-4.22 v3 2/2] device-tree: validate hwdom bank 0 boot placement
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1781004374-B6F72DB1-4DD709D3/10/73395122804
X-purgate-type: spam
X-purgate-size: 14090
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,mail.gmail.com:mid,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 0423365F758

Hi Michal,

Thanks for the review.

On Tue, Jun 9, 2026 at 10:32=E2=80=AFAM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 08-Jun-26 07:39, Mykola Kvach wrote:
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
> > Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in v3:
> > - Rename the architecture hook to
> >   arch_hwdom_first_bank_can_fit_modules() and document its contract.
> > - Drop the redundant post-alignment zImage load-address check.
> > - Drop the dead kernel range overflow check.
> > - Make the candidate-bank coverage condition explicit.
> >
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
> >  xen/arch/arm/include/asm/kernel.h       | 10 +++++
> >  xen/arch/arm/kernel.c                   | 53 ++++++++++++++++++++++++-
> >  xen/common/device-tree/domain-build.c   | 25 ++++++++----
> >  xen/include/xen/fdt-kernel.h            | 14 +++++++
> >  7 files changed, 105 insertions(+), 11 deletions(-)
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
> > index 21f4273fa1..b86c7337fe 100644
> > --- a/xen/arch/arm/include/asm/kernel.h
> > +++ b/xen/arch/arm/include/asm/kernel.h
> > @@ -8,12 +8,22 @@
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
> > +#define arch_hwdom_first_bank_can_fit_modules \
> > +        arch_hwdom_first_bank_can_fit_modules
> > +bool arch_hwdom_first_bank_can_fit_modules(const struct kernel_info *i=
nfo,
> > +                                           paddr_t bank_start,
> > +                                           paddr_t bank_size);
> > +
> >  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
> >
> >  /*
> > diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> > index d1be4d8074..47229644b2 100644
> > --- a/xen/arch/arm/kernel.c
> > +++ b/xen/arch/arm/kernel.c
> > @@ -64,6 +64,9 @@ kernel_zimage_place_in_bank(const struct kernel_info =
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
> > @@ -164,9 +167,55 @@ static void __init place_dtb_initrd(struct kernel_=
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
> > +bool __init arch_hwdom_first_bank_can_fit_modules(const struct kernel_=
info *info,
> > +                                                  paddr_t bank_start,
> > +                                                  paddr_t bank_size)
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
> > +    if ( kernbase =3D=3D INVALID_PADDR )
> > +        return false;
> > +
> > +    kernend =3D kernbase + info->image.len;
> > +
> > +    if ( (kernbase < rambase) || (kernend > ramend) )
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
> > index f3ba496f1e..30a59abfa7 100644
> > --- a/xen/common/device-tree/domain-build.c
> > +++ b/xen/common/device-tree/domain-build.c
> > @@ -299,20 +299,31 @@ static bool __init allocate_hwdom_memory(struct k=
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
> > +            if ( !arch_hwdom_first_bank_can_fit_modules(kinfo, bank_st=
art,
> > +                                                        bank_size) )
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
> > index 00c37be101..61721d22a2 100644
> > --- a/xen/include/xen/fdt-kernel.h
> > +++ b/xen/include/xen/fdt-kernel.h
> > @@ -93,6 +93,20 @@ kernel_info_get_mem_const(const struct kernel_info *=
kinfo)
> >      return container_of(&kinfo->mem.common, const struct membanks, com=
mon);
> >  }
> >
> > +/*
> > + * Return whether the proposed hardware-domain first RAM bank can cont=
ain the
> To `contain a placement` reads weird. I think `satisfy` would be a better=
 word
> that clearly denotes the purpose i.e. check if the bank satsifies the pla=
cement
> requirements (we can also add `requirements` word to the end of the comme=
nt).

I agree that "satisfy the placement requirements" reads better here.

>
> Can be done on commit (it looks like there are some ECLAIR issues, so we =
need to
> wait a bit to merge the series).

I have retriggered the ECLAIR tests and the pipeline is green now:

https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/25838764=
33

I am OK with this comment being adjusted on commit.

Best regards,
Mykola

