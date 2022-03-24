Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF454E66F8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 17:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294465.500750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXQGP-0006tl-Mq; Thu, 24 Mar 2022 16:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294465.500750; Thu, 24 Mar 2022 16:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXQGP-0006rG-Iw; Thu, 24 Mar 2022 16:24:41 +0000
Received: by outflank-mailman (input) for mailman id 294465;
 Thu, 24 Mar 2022 16:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZOSR=UD=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXQGO-0006rA-8v
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 16:24:40 +0000
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com
 [198.54.122.105]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5e71466-ab8e-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 17:24:38 +0100 (CET)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id B2F5718000A3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 12:24:36 -0400 (EDT)
Received: from mail-oa1-f53.google.com (unknown [10.20.151.186])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 8E37818000A0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 12:24:36 -0400 (EDT)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-d6ca46da48so5387654fac.12
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 09:24:36 -0700 (PDT)
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
X-Inumbo-ID: e5e71466-ab8e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648139076;
	bh=mgJEOCHHrF1vsDJhzxJnGZwqYk/0eRCHON17CMu3yu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yfk5BHiJMTrERIDPE1Y55Yut2NkG89j41Y2eLfssQyiGTUH/9Fkl5/vNjGwioR9qi
	 yH6ltEkx5X3gLqPtQv12s+RTLLwZfTF1Q0mykMdbT9xhBUsIMTkpdpmFG3UnYY9mGa
	 geNQWDWiBS2g+wQR4MJ4WT5FBS7R3yJidYt59Cy3Rr8duNepqWpawhhz0oKN284Yr8
	 L3DIzMAYv2t12EaNswbsj9oQW41x+c2ZFD9X89+SU/QUWBm7/FrsGRSq8Y/eWrANB0
	 Q16AajZrNhheZSiFmB5BPm7DzlG80cwlae5ATfgpTlt18pZxT2OuaGIedAKMUhchhj
	 s4pHgo60d8Yxw==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648139076;
	bh=mgJEOCHHrF1vsDJhzxJnGZwqYk/0eRCHON17CMu3yu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yfk5BHiJMTrERIDPE1Y55Yut2NkG89j41Y2eLfssQyiGTUH/9Fkl5/vNjGwioR9qi
	 yH6ltEkx5X3gLqPtQv12s+RTLLwZfTF1Q0mykMdbT9xhBUsIMTkpdpmFG3UnYY9mGa
	 geNQWDWiBS2g+wQR4MJ4WT5FBS7R3yJidYt59Cy3Rr8duNepqWpawhhz0oKN284Yr8
	 L3DIzMAYv2t12EaNswbsj9oQW41x+c2ZFD9X89+SU/QUWBm7/FrsGRSq8Y/eWrANB0
	 Q16AajZrNhheZSiFmB5BPm7DzlG80cwlae5ATfgpTlt18pZxT2OuaGIedAKMUhchhj
	 s4pHgo60d8Yxw==
X-Gm-Message-State: AOAM5325iRFgnEzH7m8a4wP2o1Fpdgql643IuRXRGg7FoLWEycNp8pM4
	XwU8hKhAugTHaL+YuBiuOhXsRccyueGa7DQOlVg=
X-Google-Smtp-Source: ABdhPJwnLnIc8R1ne1Y8vUaCsxxtEaPHAzycLbAq3jJtw4QPA1U+toFYUsT0R0hYBUH4T0BOzeMbW/On9NFwOjBAtC8=
X-Received: by 2002:a05:6870:ea81:b0:db:3e68:7ae0 with SMTP id
 s1-20020a056870ea8100b000db3e687ae0mr7169331oap.9.1648139075869; Thu, 24 Mar
 2022 09:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <YjySMjegTNFBE5RK@Air-de-Roger> <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
 <YjyWW2CkQv1ckvXM@Air-de-Roger>
In-Reply-To: <YjyWW2CkQv1ckvXM@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 24 Mar 2022 12:22:49 -0400
X-Gmail-Original-Message-ID: <CABfawhn-QiUBuq9c4tzr=9nL=J-ntm1hf23mbeRu-qCAKRDj1Q@mail.gmail.com>
Message-ID: <CABfawhn-QiUBuq9c4tzr=9nL=J-ntm1hf23mbeRu-qCAKRDj1Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <JBeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Mar 24, 2022 at 12:04 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>
> On Thu, Mar 24, 2022 at 11:52:38AM -0400, Tamas K Lengyel wrote:
> > On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monn=C3=A9 <roger.pau@citrix=
.com> wrote:
> > >
> > > On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> > > > diff --git a/xen/include/public/memory.h b/xen/include/public/memor=
y.h
> > > > index 208d8dcbd9..30ce23c5a7 100644
> > > > --- a/xen/include/public/memory.h
> > > > +++ b/xen/include/public/memory.h
> > > > @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> > > >                  uint32_t gref;     /* IN: gref to debug         */
> > > >              } u;
> > > >          } debug;
> > > > -        struct mem_sharing_op_fork {      /* OP_FORK */
> > > > +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
> > > >              domid_t parent_domain;        /* IN: parent's domain i=
d */
> > > >  /* These flags only makes sense for short-lived forks */
> > > >  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> > > >  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
> > > >  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> > > > +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> > > > +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
> > > >              uint16_t flags;               /* IN: optional settings=
 */
> > > >              uint32_t pad;                 /* Must be set to 0 */
> > > >          } fork;
> > > > diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_=
event.h
> > > > index bb003d21d0..81c2ee28cc 100644
> > > > --- a/xen/include/public/vm_event.h
> > > > +++ b/xen/include/public/vm_event.h
> > > > @@ -127,6 +127,14 @@
> > > >   * Reset the vmtrace buffer (if vmtrace is enabled)
> > > >   */
> > > >  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
> > > > +/*
> > > > + * Reset the VM state (if VM is fork)
> > > > + */
> > > > +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
> > > > +/*
> > > > + * Remove unshared entried from physmap (if VM is fork)
> > > > + */
> > > > +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
> > >
> > > I'm confused about why two different interfaces are added to do this
> > > kind of selective resets, one to vm_event and one to xenmem_fork?
> > >
> > > I thin k the natural place for the option to live would be
> > > XENMEM_FORK?
> >
> > Yes, that's the natural place for it. But we are adding it to both for
> > a reason. In our use-case the reset operation will happen after a
> > vm_event is received to which we already must send a reply. Setting
> > the flag on the vm_event reply saves us having to issue an extra memop
> > hypercall afterwards.
>
> Can you do a multicall and batch both operations in a single
> hypercall?
>
> That would seem more natural than adding duplicated interfaces.

Not in a straight forward way, no. There is no exposed API in libxc to
do a multicall. Even if that was an option it is still easier for me
to just flip a bit in the response field than having to construct a
whole standalone hypercall structure to be sent as part of a
multicall.

Tamas

