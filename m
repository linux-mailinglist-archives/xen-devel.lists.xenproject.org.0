Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E8A01209
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865083.1276362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTubO-0007Kx-Ab; Sat, 04 Jan 2025 03:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865083.1276362; Sat, 04 Jan 2025 03:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTubO-0007Id-7d; Sat, 04 Jan 2025 03:13:26 +0000
Received: by outflank-mailman (input) for mailman id 865083;
 Sat, 04 Jan 2025 03:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTubM-0006ss-T7
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:13:24 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbb9883e-ca49-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:13:24 +0100 (CET)
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
X-Inumbo-ID: dbb9883e-ca49-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735960403; x=1736219603;
	bh=eZ5XN1Od9jDl3bzrn4IBqWAaoVUHMZflED0a42ZDhpw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gcE+QFvRS3KBetsl2LtnKMwL6w91aGzDLoowvbRj8HuIxYLOw0VAetI7x5jd8yjRR
	 azxFwGBKNrMb4uIRtwlbNrHrNn1I8PpzFhd+P79/mjxEzL7JIlNv/9rJgUsTLzWTWM
	 6rec6R7G6khsDYUmPyWSaT70yry+6hhblRYVavJnsg6SnFmu+4hZlIYJ8VXtg+v3eD
	 SuAMnvpSSfKQF6LPCK7sFPYvPFJux73BV4q4d5f4+V8MzTXj+yDAPvWaDMEcUYwJN3
	 NWUrNdyLtUUuQEUcYB2ve6Hd3VWRWD24UhE4pIvzAlSRU0PAEZ4QvrckvO8gXT9VMt
	 +CZBvFgrOb4WQ==
Date: Sat, 04 Jan 2025 03:13:19 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 11/35] xen/domain: enable max_init_domid for all architectures
Message-ID: <K9tt8q37d5lEHovaX8-DkjNQQYtsdSqhaSH2z6vIRPVH405-iADFg7dMGSmv9ggLiQ189BZPdIUetijriVQH68FjIGMhpzChE1QQXzxV2uM=@proton.me>
In-Reply-To: <Z1nFPw5889vC_MLX@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-11-e9aa923127eb@ford.com> <Z1nFPw5889vC_MLX@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4b9ae78126a7d37c62ebbdd1a6788db13647493d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, December 11th, 2024 at 9:00 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:41PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Move max_init_domid to a public API and enable for all architectures.
> > That is pre-requisite change for console focus switch logic cleanup.
> >
> > max_init_domid is updated in domain_create().
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/arm/include/asm/setup.h | 2 --
> > xen/arch/arm/setup.c | 2 --
> > xen/arch/ppc/include/asm/setup.h | 2 --
> > xen/arch/riscv/include/asm/setup.h | 2 --
> > xen/arch/x86/include/asm/setup.h | 2 --
> > xen/common/domain.c | 9 +++++++++
> > xen/include/xen/domain.h | 2 ++
> > 7 files changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/as=
m/setup.h
> > index 64c227d171fc7b92e5b62d9fd42e5662871bd12b..d4e1670cd69cdd4475b2a5e=
b316d2c0601090ed7 100644
> > --- a/xen/arch/arm/include/asm/setup.h
> > +++ b/xen/arch/arm/include/asm/setup.h
> > @@ -19,8 +19,6 @@ struct map_range_data
> > struct rangeset *irq_ranges;
> > };
> >
> > -extern domid_t max_init_domid;
> > -
> > void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> >
> > size_t estimate_efi_size(unsigned int mem_nr_banks);
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 2e27af4560a504bf57daef572d4a768bd886145b..cb218fe3eb36f2cdda47cfa=
092fa99ee1ca4a14c 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -58,8 +58,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
> > bool __read_mostly acpi_disabled;
> > #endif
> >
> > -domid_t __read_mostly max_init_domid;
> > -
> > static __used void init_done(void)
> > {
> > int rc;
> > diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/as=
m/setup.h
> > index e4f64879b68ca5aac24bd9544255143e6ef693f3..956fa6985adb23375bd41d3=
e5d34d9d5f0712bd5 100644
> > --- a/xen/arch/ppc/include/asm/setup.h
> > +++ b/xen/arch/ppc/include/asm/setup.h
> > @@ -1,6 +1,4 @@
> > #ifndef ASM_PPC_SETUP_H
> > #define ASM_PPC_SETUP_H
> >
> > -#define max_init_domid (0)
> > -
> > #endif /* ASM_PPC_SETUP_H */
> > diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/includ=
e/asm/setup.h
> > index 844a2f0ef1d762b3a9bc90b61a336a23f1693cc9..978cad71d3df484e80ba19a=
cc0e37b9278e941f0 100644
> > --- a/xen/arch/riscv/include/asm/setup.h
> > +++ b/xen/arch/riscv/include/asm/setup.h
> > @@ -3,8 +3,6 @@
> > #ifndef ASM__RISCV__SETUP_H
> > #define ASM__RISCV__SETUP_H
> >
> > -#define max_init_domid (0)
> > -
> > void setup_mm(void);
> >
> > #endif /* ASM__RISCV__SETUP_H */
> > diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/as=
m/setup.h
> > index 5c2391a8684b66efdf4b092409ed33935db6b40c..296348655b9d146c73acc30=
5cc9edd5fd46f7d47 100644
> > --- a/xen/arch/x86/include/asm/setup.h
> > +++ b/xen/arch/x86/include/asm/setup.h
> > @@ -69,6 +69,4 @@ extern bool opt_dom0_verbose;
> > extern bool opt_dom0_cpuid_faulting;
> > extern bool opt_dom0_msr_relaxed;
> >
> > -#define max_init_domid (0)
> > -
> > #endif
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 2f67aa06ed50e69c27cedc8d7f6eb0b469fe81cd..9e57dd4122a726e2fb42efe=
9c029e775202be0e6 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -65,6 +65,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> > static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> > struct domain *domain_list;
> >
> > +/* Last known non-system domain ID. */
> > +domid_t __read_mostly max_init_domid;
>
>
> The comment (and implementation below) seems to differ from what Arm
> dom0less code currently uses the variable for.

Yep, thanks.
I realized that after receiving Jan's feedback.

Reworked.

>
> > +
> > /*
> > * Insert a domain into the domlist/hash. This allows the domain to be l=
ooked
> > * up by domid, and therefore to be the subject of hypercalls/etc.
> > @@ -815,6 +818,12 @@ struct domain *domain_create(domid_t domid,
> >
> > memcpy(d->handle, config->handle, sizeof(d->handle));
> >
> > + /*
> > + * Housekeeping for physical console forwarding to the domain.
> > + */
> > + if ( !is_system_domain(d) && max_init_domid < domid )
> > + max_init_domid =3D domid;
>
>
> Don't you need to adjust the ARM dom0-less logic that deal with
> increasing max_init_domid in create_domUs().
>
> Also max_init_domid likely only wants to be updated for domains
> created before the control domain is started, and hence could be
> __ro_after_init instead of __read_mostly?

I addressed that in v3, thanks!

>
> Thanks, Roger.



