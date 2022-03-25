Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56284E7190
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 11:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294651.501091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhV6-0007f9-Ss; Fri, 25 Mar 2022 10:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294651.501091; Fri, 25 Mar 2022 10:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhV6-0007cX-Ps; Fri, 25 Mar 2022 10:49:00 +0000
Received: by outflank-mailman (input) for mailman id 294651;
 Fri, 25 Mar 2022 10:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ci4N=UE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXhV5-0007cR-OJ
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 10:48:59 +0000
Received: from MTA-10-3.privateemail.com (mta-10-3.privateemail.com
 [198.54.127.62]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b4326fc-ac29-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 11:48:57 +0100 (CET)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id 762A118000A2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 06:48:55 -0400 (EDT)
Received: from mail-oa1-f42.google.com (unknown [10.20.151.178])
 by mta-10.privateemail.com (Postfix) with ESMTPA id 5177618000A1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 06:48:55 -0400 (EDT)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-de2cb87f6aso7712881fac.10
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 03:48:55 -0700 (PDT)
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
X-Inumbo-ID: 2b4326fc-ac29-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648205335;
	bh=+7d5C3nVL/TBVJfNFQ28GlGyXFp29VjTcZUVB+++BE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZIlCJXuzU0XYp/xTuzzO1219TjeJ3mN7SNj+ZPzxySvNYA9j6wFVfBp/BBLx9TpJl
	 uRnjFKXJWOtovle8yiTVZyGXPxtIKBX9NmwyvRe0OLOKIBjLLAS7afvBwPNrYZVm6v
	 AFwvXlwC0nSjh4QF9gTy1qV23YGpbGgy2f5LW+0vvSJZUvFadIRGa0VpXAMl9C78lD
	 h89blZUBfHLPCk29bT33G5VIoUG6dpR6X+H5tNILctUOTQcnv5ekbgSW5PAqRX0gMV
	 MlmzHfflScSLcCkd+0N7b1XNXpBAA1HQXLqlXMpAsSZlieQOQgpk93ikOHGHfAdPii
	 RY+1vAu8YH03A==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648205335;
	bh=+7d5C3nVL/TBVJfNFQ28GlGyXFp29VjTcZUVB+++BE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZIlCJXuzU0XYp/xTuzzO1219TjeJ3mN7SNj+ZPzxySvNYA9j6wFVfBp/BBLx9TpJl
	 uRnjFKXJWOtovle8yiTVZyGXPxtIKBX9NmwyvRe0OLOKIBjLLAS7afvBwPNrYZVm6v
	 AFwvXlwC0nSjh4QF9gTy1qV23YGpbGgy2f5LW+0vvSJZUvFadIRGa0VpXAMl9C78lD
	 h89blZUBfHLPCk29bT33G5VIoUG6dpR6X+H5tNILctUOTQcnv5ekbgSW5PAqRX0gMV
	 MlmzHfflScSLcCkd+0N7b1XNXpBAA1HQXLqlXMpAsSZlieQOQgpk93ikOHGHfAdPii
	 RY+1vAu8YH03A==
X-Gm-Message-State: AOAM532b+TO4c0jlcbZIzRfCQ0Jb53Yxp0ORR9F4swgr8CCZgaIWCcDr
	DVEhfzWHvTT91FvGpdpKhPPBEVBx2GwGsUHz65E=
X-Google-Smtp-Source: ABdhPJx/27wGVzMCjvEWOyLI6wibwEM92TVQzYjpnBLmmEqhpX65zx8p82yGa7KA6H7gUzf2WWSPgYVn9WaLtdh74t8=
X-Received: by 2002:a05:6870:b250:b0:de:afd3:e1c4 with SMTP id
 b16-20020a056870b25000b000deafd3e1c4mr812136oam.128.1648205334646; Fri, 25
 Mar 2022 03:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <YjySMjegTNFBE5RK@Air-de-Roger> <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
 <YjyWW2CkQv1ckvXM@Air-de-Roger> <CABfawhn-QiUBuq9c4tzr=9nL=J-ntm1hf23mbeRu-qCAKRDj1Q@mail.gmail.com>
 <Yjyfygi6pE+UVhjM@Air-de-Roger> <CABfawhkQoOnKv7OWNus0WBY4CjX+1uU1ZeZgQ-mU-sRtQFE3QQ@mail.gmail.com>
 <1bcc54d8-e766-1d53-6bc8-bd67f8838d73@suse.com>
In-Reply-To: <1bcc54d8-e766-1d53-6bc8-bd67f8838d73@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 25 Mar 2022 06:48:42 -0400
X-Gmail-Original-Message-ID: <CABfawhk4pyUGV=QGua3WNghbp-tk0yOzSSp6_x8o1Lg-8OXhNg@mail.gmail.com>
Message-ID: <CABfawhk4pyUGV=QGua3WNghbp-tk0yOzSSp6_x8o1Lg-8OXhNg@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000007d183005db08b5e9"
X-Virus-Scanned: ClamAV using ClamSMTP

--0000000000007d183005db08b5e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022, 5:04 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 24.03.2022 18:02, Tamas K Lengyel wrote:
> > On Thu, Mar 24, 2022 at 12:44 PM Roger Pau Monn=C3=A9 <roger.pau@citrix=
.com>
> wrote:
> >>
> >> On Thu, Mar 24, 2022 at 12:22:49PM -0400, Tamas K Lengyel wrote:
> >>> On Thu, Mar 24, 2022 at 12:04 PM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com>
> wrote:
> >>>>
> >>>> On Thu, Mar 24, 2022 at 11:52:38AM -0400, Tamas K Lengyel wrote:
> >>>>> On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monn=C3=A9 <
> roger.pau@citrix.com> wrote:
> >>>>>>
> >>>>>> On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> >>>>>>> diff --git a/xen/include/public/memory.h
> b/xen/include/public/memory.h
> >>>>>>> index 208d8dcbd9..30ce23c5a7 100644
> >>>>>>> --- a/xen/include/public/memory.h
> >>>>>>> +++ b/xen/include/public/memory.h
> >>>>>>> @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> >>>>>>>                  uint32_t gref;     /* IN: gref to debug         =
*/
> >>>>>>>              } u;
> >>>>>>>          } debug;
> >>>>>>> -        struct mem_sharing_op_fork {      /* OP_FORK */
> >>>>>>> +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
> >>>>>>>              domid_t parent_domain;        /* IN: parent's domain
> id */
> >>>>>>>  /* These flags only makes sense for short-lived forks */
> >>>>>>>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> >>>>>>>  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
> >>>>>>>  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> >>>>>>> +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> >>>>>>> +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
> >>>>>>>              uint16_t flags;               /* IN: optional
> settings */
> >>>>>>>              uint32_t pad;                 /* Must be set to 0 */
> >>>>>>>          } fork;
> >>>>>>> diff --git a/xen/include/public/vm_event.h
> b/xen/include/public/vm_event.h
> >>>>>>> index bb003d21d0..81c2ee28cc 100644
> >>>>>>> --- a/xen/include/public/vm_event.h
> >>>>>>> +++ b/xen/include/public/vm_event.h
> >>>>>>> @@ -127,6 +127,14 @@
> >>>>>>>   * Reset the vmtrace buffer (if vmtrace is enabled)
> >>>>>>>   */
> >>>>>>>  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
> >>>>>>> +/*
> >>>>>>> + * Reset the VM state (if VM is fork)
> >>>>>>> + */
> >>>>>>> +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
> >>>>>>> +/*
> >>>>>>> + * Remove unshared entried from physmap (if VM is fork)
> >>>>>>> + */
> >>>>>>> +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
> >>>>>>
> >>>>>> I'm confused about why two different interfaces are added to do th=
is
> >>>>>> kind of selective resets, one to vm_event and one to xenmem_fork?
> >>>>>>
> >>>>>> I thin k the natural place for the option to live would be
> >>>>>> XENMEM_FORK?
> >>>>>
> >>>>> Yes, that's the natural place for it. But we are adding it to both
> for
> >>>>> a reason. In our use-case the reset operation will happen after a
> >>>>> vm_event is received to which we already must send a reply. Setting
> >>>>> the flag on the vm_event reply saves us having to issue an extra
> memop
> >>>>> hypercall afterwards.
> >>>>
> >>>> Can you do a multicall and batch both operations in a single
> >>>> hypercall?
> >>>>
> >>>> That would seem more natural than adding duplicated interfaces.
> >>>
> >>> Not in a straight forward way, no. There is no exposed API in libxc t=
o
> >>> do a multicall. Even if that was an option it is still easier for me
> >>> to just flip a bit in the response field than having to construct a
> >>> whole standalone hypercall structure to be sent as part of a
> >>> multicall.
> >>
> >> Right, I can see it being easier, but it seems like a bad choice from
> >> an interface PoV. You are the maintainer of both subsystems, but it
> >> would seem to me it's in your best interest to try to keep the
> >> interfaces separated and clean.
> >>
> >> Would it be possible for the reset XENMEM_FORK op to have the side
> >> effect of performing what you would instead do with the vm_event
> >> hypercall?
> >
> > Yes, the event response is really just an event channel signal to Xen,
> > so the memop hypercall could similarly encode the "now check the
> > vm_event response" as an optional field. But why is that any better
> > than the current event channel route processing the vm_response
> > encoding the "now do these ops on the fork"?
>
> Well, as Roger said: Less duplication in the interface.
>

No, you would just duplicate something else instead, ie. the event channel
hypercall.


> > We already have a bunch of different operations you can encode in the
> > vm_event response field, so it reduces the complexity on the toolstack
> > side since I don't have to switch around which hypercall I need to
> > issue depending on what extra ops I want to put into a single
> > hypercall.
>
> The two goals need to be weighed against one another; for the moment
> I think I'm with Roger aiming at a clean interface.
>

It may look like that from the Xen side but from the toolstack side this is
actually the cleanest way to achieve what we need. The vm_event interfaces
are already strongly integrated with both the mem_sharing and mem_paging
subsystems so nothing is gained by now for no reason trying to keep them
separate. So I strongly disagree with this suggestion and I'm going to keep
it as-is. I appreciate the feedback nevertheless.

Tamas

>

--0000000000007d183005db08b5e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022, 5:04 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 24.03.2022 18:02, Tamas K Lengyel wrote:<br>
&gt; On Thu, Mar 24, 2022 at 12:44 PM Roger Pau Monn=C3=A9 &lt;<a href=3D"m=
ailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">roger.pau@=
citrix.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Mar 24, 2022 at 12:22:49PM -0400, Tamas K Lengyel wrote:<b=
r>
&gt;&gt;&gt; On Thu, Mar 24, 2022 at 12:04 PM Roger Pau Monn=C3=A9 &lt;<a h=
ref=3D"mailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">ro=
ger.pau@citrix.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Thu, Mar 24, 2022 at 11:52:38AM -0400, Tamas K Lengyel =
wrote:<br>
&gt;&gt;&gt;&gt;&gt; On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monn=C3=A9 =
&lt;<a href=3D"mailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"norefe=
rrer">roger.pau@citrix.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K =
Lengyel wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/xen/include/public/memory.h b/xen=
/include/public/memory.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 208d8dcbd9..30ce23c5a7 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/xen/include/public/memory.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/xen/include/public/memory.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -541,12 +541,14 @@ struct xen_mem_sharing_o=
p {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint32_t gref;=C2=A0 =C2=A0 =C2=A0/* IN: gref to debug=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } u;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } debug;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mem_sharin=
g_op_fork {=C2=A0 =C2=A0 =C2=A0 /* OP_FORK */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mem_sharin=
g_op_fork {=C2=A0 =C2=A0 =C2=A0 /* OP_FORK/_RESET */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 domid_t parent_domain;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IN: parent&#39;s d=
omain id */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 /* These flags only makes sense for shor=
t-lived forks */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 #define XENMEM_FORK_WITH_IOMMU_ALLOWED (=
1u &lt;&lt; 0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 #define XENMEM_FORK_BLOCK_INTERRUPTS=C2=
=A0 =C2=A0(1u &lt;&lt; 1)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 #define XENMEM_FORK_SKIP_SPECIAL_PAGES (=
1u &lt;&lt; 2)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define XENMEM_FORK_RESET_STATE=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1u &lt;&lt; 3)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define XENMEM_FORK_RESET_MEMORY=C2=A0 =C2=A0=
 =C2=A0 =C2=A0(1u &lt;&lt; 4)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint16_t flags;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* IN: optional settings */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint32_t pad;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Must be set to 0 */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } fork;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/xen/include/public/vm_event.h b/x=
en/include/public/vm_event.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index bb003d21d0..81c2ee28cc 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/xen/include/public/vm_event.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/xen/include/public/vm_event.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -127,6 +127,14 @@<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0* Reset the vmtrace buffer (if vmt=
race is enabled)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 #define VM_EVENT_FLAG_RESET_VMTRACE=C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 13)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * Reset the VM state (if VM is fork)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define VM_EVENT_FLAG_RESET_FORK_STATE=C2=A0 =
=C2=A0(1 &lt;&lt; 14)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * Remove unshared entried from physmap (if V=
M is fork)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define VM_EVENT_FLAG_RESET_FORK_MEMORY=C2=A0=
 (1 &lt;&lt; 15)<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I&#39;m confused about why two different interface=
s are added to do this<br>
&gt;&gt;&gt;&gt;&gt;&gt; kind of selective resets, one to vm_event and one =
to xenmem_fork?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I thin k the natural place for the option to live =
would be<br>
&gt;&gt;&gt;&gt;&gt;&gt; XENMEM_FORK?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Yes, that&#39;s the natural place for it. But we are a=
dding it to both for<br>
&gt;&gt;&gt;&gt;&gt; a reason. In our use-case the reset operation will hap=
pen after a<br>
&gt;&gt;&gt;&gt;&gt; vm_event is received to which we already must send a r=
eply. Setting<br>
&gt;&gt;&gt;&gt;&gt; the flag on the vm_event reply saves us having to issu=
e an extra memop<br>
&gt;&gt;&gt;&gt;&gt; hypercall afterwards.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Can you do a multicall and batch both operations in a sing=
le<br>
&gt;&gt;&gt;&gt; hypercall?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; That would seem more natural than adding duplicated interf=
aces.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Not in a straight forward way, no. There is no exposed API in =
libxc to<br>
&gt;&gt;&gt; do a multicall. Even if that was an option it is still easier =
for me<br>
&gt;&gt;&gt; to just flip a bit in the response field than having to constr=
uct a<br>
&gt;&gt;&gt; whole standalone hypercall structure to be sent as part of a<b=
r>
&gt;&gt;&gt; multicall.<br>
&gt;&gt;<br>
&gt;&gt; Right, I can see it being easier, but it seems like a bad choice f=
rom<br>
&gt;&gt; an interface PoV. You are the maintainer of both subsystems, but i=
t<br>
&gt;&gt; would seem to me it&#39;s in your best interest to try to keep the=
<br>
&gt;&gt; interfaces separated and clean.<br>
&gt;&gt;<br>
&gt;&gt; Would it be possible for the reset XENMEM_FORK op to have the side=
<br>
&gt;&gt; effect of performing what you would instead do with the vm_event<b=
r>
&gt;&gt; hypercall?<br>
&gt; <br>
&gt; Yes, the event response is really just an event channel signal to Xen,=
<br>
&gt; so the memop hypercall could similarly encode the &quot;now check the<=
br>
&gt; vm_event response&quot; as an optional field. But why is that any bett=
er<br>
&gt; than the current event channel route processing the vm_response<br>
&gt; encoding the &quot;now do these ops on the fork&quot;?<br>
<br>
Well, as Roger said: Less duplication in the interface.<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">No, you would just d=
uplicate something else instead, ie. the event channel hypercall.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
&gt; We already have a bunch of different operations you can encode in the<=
br>
&gt; vm_event response field, so it reduces the complexity on the toolstack=
<br>
&gt; side since I don&#39;t have to switch around which hypercall I need to=
<br>
&gt; issue depending on what extra ops I want to put into a single<br>
&gt; hypercall.<br>
<br>
The two goals need to be weighed against one another; for the moment<br>
I think I&#39;m with Roger aiming at a clean interface.<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">It may look like tha=
t from the Xen side but from the toolstack side this is actually the cleane=
st way to achieve what we need. The vm_event interfaces are already strongl=
y integrated with both the mem_sharing and mem_paging subsystems so nothing=
 is gained by now for no reason trying to keep them separate. So I strongly=
 disagree with this suggestion and I&#39;m going to keep it as-is. I apprec=
iate the feedback nevertheless.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Tamas</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000007d183005db08b5e9--

