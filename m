Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0C5E6F7F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 00:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410492.653519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUTM-0002Jd-6S; Thu, 22 Sep 2022 22:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410492.653519; Thu, 22 Sep 2022 22:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obUTM-0002Gj-3k; Thu, 22 Sep 2022 22:15:08 +0000
Received: by outflank-mailman (input) for mailman id 410492;
 Thu, 22 Sep 2022 22:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PQAH=ZZ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1obUTL-0002Gb-4q
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 22:15:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 026658f5-3ac4-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 00:15:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FC8C612D6
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 22:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CB5C4347C
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 22:15:03 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id a2so16935834lfb.6
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 15:15:03 -0700 (PDT)
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
X-Inumbo-ID: 026658f5-3ac4-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663884903;
	bh=enQD/zJTjwNlqp2Kps1H9U/gVwFrhJsHaI7xyxomm88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VUxVen8B3vFQHSxnlIHQMYgPjn5A15xa9vq8wbrZTX2jpf45g+QDYKoZ1xuQoWQzz
	 dnNKMsswfnJl93csDCFcECUVkFYP2SXgQ/jPbFtZUAig4ikaLTIvj7kRyjEI0yXih7
	 /hueWQPdX7Tq13N2gqpMe5l/QdR9stjDsOcBJduIQyIFwBjoLzmA1MqvbautO7iiRG
	 FhMiSE+MS8xWN07bTH9G1uIrS7f92RC9z7RmoqrunZYNAtREVPKi2xkx8U6IMySPyg
	 Zs2YZl70Lw5KBKF/WH2veTaGGxBFam1yIn9+J4hxWA0TvCNK8gVxuaXoJiDLyBNG6N
	 fvmAJfy+r2gkg==
X-Gm-Message-State: ACrzQf0QuxdHjtis6DOutHuW0PyxQxHV2uAdpghslfXK63e/b4RaPU4J
	MmJ3qt1TxSKOnRUsQMzUtKx8KqejE1RKpHYsQOI=
X-Google-Smtp-Source: AMsMyM6eDXsgm4HjV+uHSWsEP62fe865KcxhHP8kMPKgV25TUM1eqiFLKDq88d/iJ2b51J9wFvj7IN+nQYIqA9XD0BA=
X-Received: by 2002:a05:6512:c0f:b0:49b:1e8c:59fd with SMTP id
 z15-20020a0565120c0f00b0049b1e8c59fdmr1946566lfu.426.1663884901602; Thu, 22
 Sep 2022 15:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220919193257.2031-1-demi@invisiblethingslab.com>
 <CAMj1kXEBfJUfTQ3THqqKxsU09_S98B_TjTECKwGM0WAv_5tZaA@mail.gmail.com>
 <7930b617-d473-94dd-c7e4-33ffa19da13e@suse.com> <CAMj1kXEJ9d3-8xa7rkczY7ur2zDm9CjqM7u1eEdHHmPG=Oo=xA@mail.gmail.com>
 <3671fd52-6034-7149-ebe4-f7560c0dc6b0@suse.com> <Yyu1xC7Tlf9sS7Ro@itl-email>
 <6f42a382-c5aa-ba16-f330-69a07476e2aa@suse.com> <Yyx3hlE/MDBeEdtu@itl-email>
 <CAMj1kXFoyTRKfGH2nMpi-EJRqLz9T_p+ZMM0x09UNJ-34-kS_Q@mail.gmail.com> <YyylgVqDMi9SDptq@itl-email>
In-Reply-To: <YyylgVqDMi9SDptq@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Sep 2022 00:14:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE8ZPxHS2BEEKyJNUKut0Peb2kb3CWMwuxxeyFhJk1DZw@mail.gmail.com>
Message-ID: <CAMj1kXE8ZPxHS2BEEKyJNUKut0Peb2kb3CWMwuxxeyFhJk1DZw@mail.gmail.com>
Subject: Re: [PATCH v3] Support ESRT in Xen dom0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Sept 2022 at 20:12, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Thu, Sep 22, 2022 at 05:05:43PM +0200, Ard Biesheuvel wrote:
> > On Thu, 22 Sept 2022 at 16:56, Demi Marie Obenour
> > <demi@invisiblethingslab.com> wrote:
> > >
> > > On Thu, Sep 22, 2022 at 08:12:14AM +0200, Jan Beulich wrote:
> > > > On 22.09.2022 03:09, Demi Marie Obenour wrote:
> > > > > On Wed, Sep 21, 2022 at 10:34:04PM +0200, Jan Beulich wrote:
> > > > >> On 20.09.2022 18:09, Ard Biesheuvel wrote:
> > > > >>> On Tue, 20 Sept 2022 at 17:54, Jan Beulich <jbeulich@suse.com> =
wrote:
> > > > >>>>
> > > > >>>> On 20.09.2022 17:36, Ard Biesheuvel wrote:
> > > > >>>>> On Mon, 19 Sept 2022 at 21:33, Demi Marie Obenour
> > > > >>>>> <demi@invisiblethingslab.com> wrote:
> > > > >>>>>>
> > > > >>>>>> fwupd requires access to the EFI System Resource Table (ESRT=
) to
> > > > >>>>>> discover which firmware can be updated by the OS.  Currently=
, Linux does
> > > > >>>>>> not expose the ESRT when running as a Xen dom0.  Therefore, =
it is not
> > > > >>>>>> possible to use fwupd in a Xen dom0, which is a serious prob=
lem for e.g.
> > > > >>>>>> Qubes OS.
> > > > >>>>>>
> > > > >>>>>> Before Xen 4.16, this was not fixable due to hypervisor limi=
tations.
> > > > >>>>>> The UEFI specification requires the ESRT to be in EfiBootSer=
vicesData
> > > > >>>>>> memory, which Xen will use for whatever purposes it likes.  =
Therefore,
> > > > >>>>>> Linux cannot safely access the ESRT, as Xen may have overwri=
tten it.
> > > > >>>>>>
> > > > >>>>>> Starting with Xen 4.17, Xen checks if the ESRT is in EfiBoot=
ServicesData
> > > > >>>>>> or EfiRuntimeServicesData memory.  If the ESRT is in EfiBoot=
ServicesData
> > > > >>>>>> memory, Xen allocates some memory of type EfiRuntimeServices=
Data, copies
> > > > >>>>>> the ESRT to it, and finally replaces the ESRT pointer with a=
 pointer to
> > > > >>>>>> the copy.  Since Xen will not clobber EfiRuntimeServicesData=
 memory,
> > > > >>>>>> this ensures that the ESRT can safely be accessed by the OS.=
  It is safe
> > > > >>>>>> to access the ESRT under Xen if, and only if, it is in memor=
y of type
> > > > >>>>>> EfiRuntimeServicesData.
> > > > >>>>>>
> > > > >>>>>
> > > > >>>>> Thanks for the elaborate explanation. This is really helpful.
> > > > >>>>>
> > > > >>>>> So here, you are explaining that the only way for Xen to prev=
ent
> > > > >>>>> itself from potentially clobbering the ESRT is by creating a
> > > > >>>>> completely new allocation?
> > > > >>>>
> > > > >>>> There are surely other ways, e.g. preserving BootServices* reg=
ions
> > > > >>>> alongside RuntimeServices* ones. But as the maintainer of the =
EFI
> > > > >>>> code in Xen I don't view this as a reasonable approach.
> > > > >>>
> > > > >>> Why not?
> > > > >>
> > > > >> Because it's against the intentions the EFI has (or at least had=
)
> > > > >> for this memory type. Much more than EfiAcpiReclaimMemory this
> > > > >> type is intended for use as ordinary RAM post-boot.
> > > > >
> > > > > What about giving that memory to dom0?  dom0=E2=80=99s balloon dr=
iver will give
> > > > > anything dom0 doesn=E2=80=99t wind up using back to Xen.
> > > >
> > > > While perhaps in principle possible, this would require special cas=
ing
> > > > in Xen. Except for the memory the initrd comes in, we don't directl=
y
> > > > hand memory to Dom0. Instead everything goes through the page alloc=
ator
> > > > first. Plus if we really were convinced boot services memory needed
> > > > retaining, then it would also need retaining across kexec (and henc=
e
> > > > shouldn't be left to Dom0 to decide what to do with it).
> > >
> > > So how should dom0 handle the various EFI tables other than the ESRT?
> > > Right now most uses of these tables in Linux are not guarded by any
> > > checks for efi_enabled(EFI_MEMMAP) or similar.  If some of them are i=
n
> > > EfiBootServicesData memory, they might be corrupted before Linux gets
> > > them.
> >
> > Yes, this is an annoying oversight of the EFI design: the config
> > tables are <guid, address> tuples, and the size of the table is
> > specific to each table type. So without knowing the GUID, there is no
> > way you can reserve the right size.
> >
> > Perhaps you could implement something like a hypercall in
> > efi_arch_mem_reserve(), which is called by the EFI code to reserve
> > regions that are in boot services memory but need to remain reserved?
> > This is used for all config tables that it knows or cares about.
>
> On versions of Xen that support spawning multiple domains at boot
> (instead of just dom0) this will be racy.  What about refusing to use
> tables in EfiBootServicesData when running under Xen unless a hypercall
> indicates that Xen has reserved all EfiBootServicesData memory?  Where
> could such a check be placed?

You could stick a check inside the for loop in
efi_config_parse_tables() to cross reference every table address
against the memory map when running on Xen, and disregard it if it
doesn't meet your criteria.

I take it the issue is not limited to x86?

