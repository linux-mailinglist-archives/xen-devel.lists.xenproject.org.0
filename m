Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E85E7457
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 08:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410591.653663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obcRZ-0004rp-4b; Fri, 23 Sep 2022 06:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410591.653663; Fri, 23 Sep 2022 06:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obcRZ-0004oX-1K; Fri, 23 Sep 2022 06:45:49 +0000
Received: by outflank-mailman (input) for mailman id 410591;
 Fri, 23 Sep 2022 06:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=Z2=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1obcRX-0004oR-Cr
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 06:45:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589b6c21-3b0b-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 08:45:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D85861745
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 06:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6BCC433D7
 for <xen-devel@lists.xenproject.org>; Fri, 23 Sep 2022 06:45:42 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id k10so18309611lfm.4
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 23:45:42 -0700 (PDT)
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
X-Inumbo-ID: 589b6c21-3b0b-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663915542;
	bh=1dqZG9KYhb+QJsNASHj0txSg1wAN7+87wEVN0W2xa4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u4aTG+IwaZFLv4dqMFB/IAkYpRnuCC8PHqngiMx8FYghze128xymvlOteCf9x7M1P
	 UpDCGPgRbNceRJKdJptnomKSWyGfGE7LcAh2ZiJdtSuABZtlWOcX73FyToVCKV+H03
	 NrPHSQ1Qhiwv9LORapYBsDw0RwMaJJOwo5CEda/ypT3y/0x6qIYsndd1pYm4BuPN16
	 xxQ305nb9o3A7uvgRS8VtP8DbpiGJjLP9uK0FI85VrcEVBPS47yNbdZG3WakWTmJd/
	 4JdblpmHM/tWEbrGfptTTBJUmPCwbOgSofUUXR2bGNu+eAuKbHmco4xYj9q1vXN9+r
	 8evp6LQAx2j8Q==
X-Gm-Message-State: ACrzQf2ByeA92ubwVlH3WIeMvlVptRC93Uu5ly1iidlY0k6Vpa2WR+HS
	Bh/OtmdtKmarK3LJb3t6A5Q+wD8wsXBj1O6wGOM=
X-Google-Smtp-Source: AMsMyM78S5LN/Ep/pE9ZbilPh7sjmo2qhKCGXkW0ImTuZuoSv9XDnU5+BTGcCYKD2/Iuyj6SlOcMP7957FRDWgnzsog=
X-Received: by 2002:a05:6512:13a1:b0:48d:f14:9059 with SMTP id
 p33-20020a05651213a100b0048d0f149059mr2881953lfa.110.1663915540743; Thu, 22
 Sep 2022 23:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXEBfJUfTQ3THqqKxsU09_S98B_TjTECKwGM0WAv_5tZaA@mail.gmail.com>
 <7930b617-d473-94dd-c7e4-33ffa19da13e@suse.com> <CAMj1kXEJ9d3-8xa7rkczY7ur2zDm9CjqM7u1eEdHHmPG=Oo=xA@mail.gmail.com>
 <3671fd52-6034-7149-ebe4-f7560c0dc6b0@suse.com> <Yyu1xC7Tlf9sS7Ro@itl-email>
 <6f42a382-c5aa-ba16-f330-69a07476e2aa@suse.com> <Yyx3hlE/MDBeEdtu@itl-email>
 <CAMj1kXFoyTRKfGH2nMpi-EJRqLz9T_p+ZMM0x09UNJ-34-kS_Q@mail.gmail.com>
 <YyylgVqDMi9SDptq@itl-email> <CAMj1kXE8ZPxHS2BEEKyJNUKut0Peb2kb3CWMwuxxeyFhJk1DZw@mail.gmail.com>
 <YyzvWmcvvGq+TQ/R@itl-email>
In-Reply-To: <YyzvWmcvvGq+TQ/R@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Sep 2022 08:45:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF9miqWZ4nKqTt1uqRQkhY2tPAGDm8n41thyd0jiW7ygw@mail.gmail.com>
Message-ID: <CAMj1kXF9miqWZ4nKqTt1uqRQkhY2tPAGDm8n41thyd0jiW7ygw@mail.gmail.com>
Subject: Re: [PATCH v3] Support ESRT in Xen dom0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Sept 2022 at 01:27, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Fri, Sep 23, 2022 at 12:14:50AM +0200, Ard Biesheuvel wrote:
> > On Thu, 22 Sept 2022 at 20:12, Demi Marie Obenour
> > <demi@invisiblethingslab.com> wrote:
> > >
> > > On Thu, Sep 22, 2022 at 05:05:43PM +0200, Ard Biesheuvel wrote:
> > > > On Thu, 22 Sept 2022 at 16:56, Demi Marie Obenour
> > > > <demi@invisiblethingslab.com> wrote:
> > > > >
> > > > > On Thu, Sep 22, 2022 at 08:12:14AM +0200, Jan Beulich wrote:
> > > > > > On 22.09.2022 03:09, Demi Marie Obenour wrote:
> > > > > > > On Wed, Sep 21, 2022 at 10:34:04PM +0200, Jan Beulich wrote:
> > > > > > >> On 20.09.2022 18:09, Ard Biesheuvel wrote:
> > > > > > >>> On Tue, 20 Sept 2022 at 17:54, Jan Beulich <jbeulich@suse.c=
om> wrote:
> > > > > > >>>>
> > > > > > >>>> On 20.09.2022 17:36, Ard Biesheuvel wrote:
> > > > > > >>>>> On Mon, 19 Sept 2022 at 21:33, Demi Marie Obenour
> > > > > > >>>>> <demi@invisiblethingslab.com> wrote:
> > > > > > >>>>>>
> > > > > > >>>>>> fwupd requires access to the EFI System Resource Table (=
ESRT) to
> > > > > > >>>>>> discover which firmware can be updated by the OS.  Curre=
ntly, Linux does
> > > > > > >>>>>> not expose the ESRT when running as a Xen dom0.  Therefo=
re, it is not
> > > > > > >>>>>> possible to use fwupd in a Xen dom0, which is a serious =
problem for e.g.
> > > > > > >>>>>> Qubes OS.
> > > > > > >>>>>>
> > > > > > >>>>>> Before Xen 4.16, this was not fixable due to hypervisor =
limitations.
> > > > > > >>>>>> The UEFI specification requires the ESRT to be in EfiBoo=
tServicesData
> > > > > > >>>>>> memory, which Xen will use for whatever purposes it like=
s.  Therefore,
> > > > > > >>>>>> Linux cannot safely access the ESRT, as Xen may have ove=
rwritten it.
> > > > > > >>>>>>
> > > > > > >>>>>> Starting with Xen 4.17, Xen checks if the ESRT is in Efi=
BootServicesData
> > > > > > >>>>>> or EfiRuntimeServicesData memory.  If the ESRT is in Efi=
BootServicesData
> > > > > > >>>>>> memory, Xen allocates some memory of type EfiRuntimeServ=
icesData, copies
> > > > > > >>>>>> the ESRT to it, and finally replaces the ESRT pointer wi=
th a pointer to
> > > > > > >>>>>> the copy.  Since Xen will not clobber EfiRuntimeServices=
Data memory,
> > > > > > >>>>>> this ensures that the ESRT can safely be accessed by the=
 OS.  It is safe
> > > > > > >>>>>> to access the ESRT under Xen if, and only if, it is in m=
emory of type
> > > > > > >>>>>> EfiRuntimeServicesData.
> > > > > > >>>>>>
> > > > > > >>>>>
> > > > > > >>>>> Thanks for the elaborate explanation. This is really help=
ful.
> > > > > > >>>>>
> > > > > > >>>>> So here, you are explaining that the only way for Xen to =
prevent
> > > > > > >>>>> itself from potentially clobbering the ESRT is by creatin=
g a
> > > > > > >>>>> completely new allocation?
> > > > > > >>>>
> > > > > > >>>> There are surely other ways, e.g. preserving BootServices*=
 regions
> > > > > > >>>> alongside RuntimeServices* ones. But as the maintainer of =
the EFI
> > > > > > >>>> code in Xen I don't view this as a reasonable approach.
> > > > > > >>>
> > > > > > >>> Why not?
> > > > > > >>
> > > > > > >> Because it's against the intentions the EFI has (or at least=
 had)
> > > > > > >> for this memory type. Much more than EfiAcpiReclaimMemory th=
is
> > > > > > >> type is intended for use as ordinary RAM post-boot.
> > > > > > >
> > > > > > > What about giving that memory to dom0?  dom0=E2=80=99s balloo=
n driver will give
> > > > > > > anything dom0 doesn=E2=80=99t wind up using back to Xen.
> > > > > >
> > > > > > While perhaps in principle possible, this would require special=
 casing
> > > > > > in Xen. Except for the memory the initrd comes in, we don't dir=
ectly
> > > > > > hand memory to Dom0. Instead everything goes through the page a=
llocator
> > > > > > first. Plus if we really were convinced boot services memory ne=
eded
> > > > > > retaining, then it would also need retaining across kexec (and =
hence
> > > > > > shouldn't be left to Dom0 to decide what to do with it).
> > > > >
> > > > > So how should dom0 handle the various EFI tables other than the E=
SRT?
> > > > > Right now most uses of these tables in Linux are not guarded by a=
ny
> > > > > checks for efi_enabled(EFI_MEMMAP) or similar.  If some of them a=
re in
> > > > > EfiBootServicesData memory, they might be corrupted before Linux =
gets
> > > > > them.
> > > >
> > > > Yes, this is an annoying oversight of the EFI design: the config
> > > > tables are <guid, address> tuples, and the size of the table is
> > > > specific to each table type. So without knowing the GUID, there is =
no
> > > > way you can reserve the right size.
> > > >
> > > > Perhaps you could implement something like a hypercall in
> > > > efi_arch_mem_reserve(), which is called by the EFI code to reserve
> > > > regions that are in boot services memory but need to remain reserve=
d?
> > > > This is used for all config tables that it knows or cares about.
> > >
> > > On versions of Xen that support spawning multiple domains at boot
> > > (instead of just dom0) this will be racy.  What about refusing to use
> > > tables in EfiBootServicesData when running under Xen unless a hyperca=
ll
> > > indicates that Xen has reserved all EfiBootServicesData memory?  Wher=
e
> > > could such a check be placed?
> >
> > You could stick a check inside the for loop in
> > efi_config_parse_tables() to cross reference every table address
> > against the memory map when running on Xen, and disregard it if it
> > doesn't meet your criteria.
> >
> > I take it the issue is not limited to x86?
>
> Indeed the issue is cross-platform.  For Qubes OS, I wonder if a safer
> approach would be to reserve all EfiBootServicesData memory by default.

You only need to reserve the ones that have configuration tables
pointing into them.

