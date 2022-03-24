Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD94E6655
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 16:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294457.500727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPm4-0002PU-U8; Thu, 24 Mar 2022 15:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294457.500727; Thu, 24 Mar 2022 15:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPm4-0002Mj-R6; Thu, 24 Mar 2022 15:53:20 +0000
Received: by outflank-mailman (input) for mailman id 294457;
 Thu, 24 Mar 2022 15:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZOSR=UD=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXPm3-0002Mb-Ax
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 15:53:19 +0000
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 849c61e2-ab8a-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 16:53:17 +0100 (CET)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id 61D4518000A6
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 11:53:15 -0400 (EDT)
Received: from mail-oi1-f169.google.com (unknown [10.20.151.197])
 by mta-07.privateemail.com (Postfix) with ESMTPA id 3CD791800084
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 11:53:15 -0400 (EDT)
Received: by mail-oi1-f169.google.com with SMTP id q189so5273380oia.9
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 08:53:15 -0700 (PDT)
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
X-Inumbo-ID: 849c61e2-ab8a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648137195;
	bh=gNTA1jV+eU1/mAw2+yVTELnOVXsCoqVjwkr8jpJVBaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=xuLggTBXYh2ctzy+v4w50YdRkO9uQbOAXCqndj8EAtQMiEy9BSpyy1VhUNvQYQRTV
	 9D61J3Dsx6aDSwUtGMlboi0v6QK8P+ufNOavR3aQIMYnP4540h1T3pTbpungtULZil
	 04E11K+P0MUkn80p9owKe+PoUTUqvLCxX23Lvv7XXFrY+oweryAeM4F3NvUTn5QqpA
	 uSRKnwzVQu1DY88S8SFmgf4KZgpkBldB24XEJ1mc/eCV7BY3ODmhZd95P685TciJI7
	 CLuPegGP9vYNzBvkicwKZsoDrvaiEHSupK7AsOVdrhN+MOwpd/9zeEqefQeuzEBcqr
	 EjRLigroF8NsA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648137195;
	bh=gNTA1jV+eU1/mAw2+yVTELnOVXsCoqVjwkr8jpJVBaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=xuLggTBXYh2ctzy+v4w50YdRkO9uQbOAXCqndj8EAtQMiEy9BSpyy1VhUNvQYQRTV
	 9D61J3Dsx6aDSwUtGMlboi0v6QK8P+ufNOavR3aQIMYnP4540h1T3pTbpungtULZil
	 04E11K+P0MUkn80p9owKe+PoUTUqvLCxX23Lvv7XXFrY+oweryAeM4F3NvUTn5QqpA
	 uSRKnwzVQu1DY88S8SFmgf4KZgpkBldB24XEJ1mc/eCV7BY3ODmhZd95P685TciJI7
	 CLuPegGP9vYNzBvkicwKZsoDrvaiEHSupK7AsOVdrhN+MOwpd/9zeEqefQeuzEBcqr
	 EjRLigroF8NsA==
X-Gm-Message-State: AOAM5309z0pzwvx9+EPWPhq6+4d+YLVrQXZZpUEjhBZuYfHUz/5bj7XD
	Qo9b3caT5EtqqUh9QxIHxvSp3IpSyp81qIQxznc=
X-Google-Smtp-Source: ABdhPJytvCop5t61DPe+GZARYbAev/ixTKyaOTYUWo9iZ+04wyQlAeiq92kOb0SuwDIqTqwQ8ikWNJYR2PP/hJ4ViZg=
X-Received: by 2002:aca:d12:0:b0:2ee:f684:bd4b with SMTP id
 18-20020aca0d12000000b002eef684bd4bmr7598875oin.128.1648137194586; Thu, 24
 Mar 2022 08:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <YjySMjegTNFBE5RK@Air-de-Roger>
In-Reply-To: <YjySMjegTNFBE5RK@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 24 Mar 2022 11:52:38 -0400
X-Gmail-Original-Message-ID: <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
Message-ID: <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
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

On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>
> On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > index 208d8dcbd9..30ce23c5a7 100644
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> >                  uint32_t gref;     /* IN: gref to debug         */
> >              } u;
> >          } debug;
> > -        struct mem_sharing_op_fork {      /* OP_FORK */
> > +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
> >              domid_t parent_domain;        /* IN: parent's domain id */
> >  /* These flags only makes sense for short-lived forks */
> >  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> >  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
> >  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> > +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> > +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
> >              uint16_t flags;               /* IN: optional settings */
> >              uint32_t pad;                 /* Must be set to 0 */
> >          } fork;
> > diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_even=
t.h
> > index bb003d21d0..81c2ee28cc 100644
> > --- a/xen/include/public/vm_event.h
> > +++ b/xen/include/public/vm_event.h
> > @@ -127,6 +127,14 @@
> >   * Reset the vmtrace buffer (if vmtrace is enabled)
> >   */
> >  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
> > +/*
> > + * Reset the VM state (if VM is fork)
> > + */
> > +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
> > +/*
> > + * Remove unshared entried from physmap (if VM is fork)
> > + */
> > +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
>
> I'm confused about why two different interfaces are added to do this
> kind of selective resets, one to vm_event and one to xenmem_fork?
>
> I thin k the natural place for the option to live would be
> XENMEM_FORK?

Yes, that's the natural place for it. But we are adding it to both for
a reason. In our use-case the reset operation will happen after a
vm_event is received to which we already must send a reply. Setting
the flag on the vm_event reply saves us having to issue an extra memop
hypercall afterwards.

Tamas

