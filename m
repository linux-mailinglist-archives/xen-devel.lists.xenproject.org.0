Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0236E8D4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 12:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119867.226626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc3xO-0002Qv-RM; Thu, 29 Apr 2021 10:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119867.226626; Thu, 29 Apr 2021 10:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc3xO-0002Qa-OI; Thu, 29 Apr 2021 10:31:42 +0000
Received: by outflank-mailman (input) for mailman id 119867;
 Thu, 29 Apr 2021 10:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDPA=J2=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lc3xN-0002QV-QA
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 10:31:41 +0000
Received: from MTA-10-1.privateemail.com (unknown [68.65.122.30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdbc17f1-1c6a-44d7-863d-9666b9c54a64;
 Thu, 29 Apr 2021 10:31:40 +0000 (UTC)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 2E4FD60062
 for <xen-devel@lists.xenproject.org>; Thu, 29 Apr 2021 06:31:39 -0400 (EDT)
Received: from mail-wr1-f51.google.com (unknown [10.20.151.248])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id C2CB460059
 for <xen-devel@lists.xenproject.org>; Thu, 29 Apr 2021 06:31:38 -0400 (EDT)
Received: by mail-wr1-f51.google.com with SMTP id d11so8495248wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Apr 2021 03:31:38 -0700 (PDT)
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
X-Inumbo-ID: fdbc17f1-1c6a-44d7-863d-9666b9c54a64
X-Gm-Message-State: AOAM5331Mu3Qc7SN8yJBYOz0fRzuwvBzzjjHM8Y/F5JK30zAZUfiguoj
	OZZDuZneLXU7sHmL+xhqkm8yJ0muFz8DvsHY02c=
X-Google-Smtp-Source: ABdhPJyeLhKkV+sStlHt/t5xZfevZ8rJ6uEhlgTphBIygXdqeQrDAbRsPriDdAL0pLnu/lDR+6g0BTXcOrtubwvFG/c=
X-Received: by 2002:adf:8b02:: with SMTP id n2mr41127675wra.259.1619692297465;
 Thu, 29 Apr 2021 03:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210427093546.30703-1-michal.orzel@arm.com> <20210427093546.30703-11-michal.orzel@arm.com>
 <f414e061-7afa-d781-e6ae-e6293f29cd40@xen.org> <0c90579b-4861-8f90-2978-9e7f9015fae3@arm.com>
In-Reply-To: <0c90579b-4861-8f90-2978-9e7f9015fae3@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 29 Apr 2021 06:31:25 -0400
X-Gmail-Original-Message-ID: <CABfawhndnBQZtiRXXy_Xys5LWDqmz1VaquMxTPBY2ii+d8ATEQ@mail.gmail.com>
Message-ID: <CABfawhndnBQZtiRXXy_Xys5LWDqmz1VaquMxTPBY2ii+d8ATEQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
To: Michal Orzel <michal.orzel@arm.com>
Cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	bertrand.marquis@arm.com
Content-Type: multipart/alternative; boundary="00000000000009331e05c11a00de"
X-Virus-Scanned: ClamAV using ClamSMTP

--00000000000009331e05c11a00de
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 29, 2021, 4:53 AM Michal Orzel <michal.orzel@arm.com> wrote:

> Hi Julien,
>
> On 27.04.2021 13:09, Julien Grall wrote:
> > Hi Michal,
> >
> > On 27/04/2021 10:35, Michal Orzel wrote:
> >> AArch64 registers are 64bit whereas AArch32 registers
> >> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> >> we should get rid of helpers READ/WRITE_SYSREG32
> >> in favour of using READ/WRITE_SYSREG.
> >> We should also use register_t type when reading sysregs
> >> which can correspond to uint64_t or uint32_t.
> >> Even though many AArch64 registers have upper 32bit reserved
> >> it does not mean that they can't be widen in the future.
> >>
> >> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
> >
> > As I pointed out in v1, the access to SPSR_EL1 has been quite fragile
> because we relied on the padding afterwards. I think this was ought to be
> explain in the commit message because it explain why the access in the
> assembly code is not modified.
> >
> How about:
> "
> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
> Previously we relied on the padding after SPSR_EL1. As we removed the
> padding, modify the union to be 64bit
> so we don't corrupt SPSR_FIQ.
> No need to modify the assembly code becuase the accesses were based on
> 64bit registers as there was a 32bit padding after SPSR_EL1.
> "
> >>
> >> Add 32bit RES0 members to structures inside hsr union.
> >>
> >> Remove 32bit padding in cpu_user_regs before spsr_fiq
> >> as it is no longer needed due to upper union being 64bit now.
> >>
> >> Add 64bit padding in cpu_user_regs before spsr_el1
> >> because offset of spsr_el1 must be a multiple of 8.
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> >> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
> >> index 29d4531f40..fb4a3b1274 100644
> >> --- a/xen/include/asm-arm/hsr.h
> >> +++ b/xen/include/asm-arm/hsr.h
> >> @@ -16,11 +16,12 @@ enum dabt_size {
> >>   };
> >>     union hsr {
> >> -    uint32_t bits;
> >> +    register_t bits;
> >>       struct {
> >>           unsigned long iss:25;  /* Instruction Specific Syndrome */
> >>           unsigned long len:1;   /* Instruction length */
> >>           unsigned long ec:6;    /* Exception Class */
> >> +        unsigned long _res0:32;
> >
> > Sorry I wasn't clear in my original comment, what I meant I would rather
> not add this field (and also the _res0) because they are not strictly
> necessary.
> >
> Ok I'll remove _res0 members. But bits can be of type register_t, right?
> >> diff --git a/xen/include/public/arch-arm.h
> b/xen/include/public/arch-arm.h
> >> index 713fd65317..c49bce2983 100644
> >> --- a/xen/include/public/arch-arm.h
> >> +++ b/xen/include/public/arch-arm.h
> >> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
> >>         /* Return address and mode */
> >>       __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
> >> -    uint32_t cpsr;                              /* SPSR_EL2 */
> >> +    register_t cpsr;                            /* SPSR_EL2 */
> >
> > You can't use register_t here because this is a public header (we don't
> export register_t) and the header should be bitness agnostic.
> >
> > Also, because this is a public header, you ought to explain why breaking
> the ABI is fine.
> >
> > In this case, this is an ABI between the tools and this is not stable.
> However, we would still need to bump XEN_DOMCTL_INTERFACE_VERSION as I
> think this wasn't done for this development cycle.
> >
> > Of course, this will also need a suitable mention in the commit message
> (I can help with that).
> >
> Ok so I'll increment XEN_DOMCTL_INTERFACE_VERSION and write in commit msg:
> "
> Change type of cpsr to uint64_t in the public outside interface
> "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
> Increment XEN_DOMCTL_INTERFACE_VERSION.
> "
> >>         union {
> >> -        uint32_t spsr_el1;       /* AArch64 */
> >> +        uint64_t spsr_el1;       /* AArch64 */
> >>           uint32_t spsr_svc;       /* AArch32 */
> >>       };
> >>   diff --git a/xen/include/public/vm_event.h
> b/xen/include/public/vm_event.h
> >> index 36135ba4f1..ad3d141fe8 100644
> >> --- a/xen/include/public/vm_event.h
> >> +++ b/xen/include/public/vm_event.h
> >> @@ -266,8 +266,12 @@ struct vm_event_regs_arm {
> >>       uint64_t ttbr1;
> >>       uint64_t ttbcr;
> >>       uint64_t pc;
> >> +#ifdef CONFIG_ARM_32
> >>       uint32_t cpsr;
> >>       uint32_t _pad;
> >> +#else
> >> +    uint64_t cpsr;
> >> +#endif
> >
> > CONFIG_ARM_32 is not defined for public header. They also should be
> bitness agnostic. So cpsr should always be uint64_t.
> >
> > Also, similar to public/arch-arm.h, this is not a stable ABI but you
> will need to bump VM_EVENT_INTERFACE_VERSION if this hasn't been done for
> this development cycle.
> >
> Ok so I will change type of cpsr here to uint64_t, increment
> VM_EVENT_INTERFACE_VERSION and write in commit msg:
> "
> Change type of cpsr to uint64_t in the public outside interface
> "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
> Increment VM_EVENT_INTERFACE_VERSION.
> "
> Ok?
>

There is no need to bump the interface version for this, you are not
changing the layout or size of the structure since there was already 64bit
space there for cspr for both 32bit and 64bit builds. You are just folding
that padding field into cspr on 32bit builds.

Thanks,
Tamas

>

--00000000000009331e05c11a00de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 29, 2021, 4:53 AM Michal Orzel &lt;<a href=
=3D"mailto:michal.orzel@arm.com">michal.orzel@arm.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hi Julien,<br>
<br>
On 27.04.2021 13:09, Julien Grall wrote:<br>
&gt; Hi Michal,<br>
&gt; <br>
&gt; On 27/04/2021 10:35, Michal Orzel wrote:<br>
&gt;&gt; AArch64 registers are 64bit whereas AArch32 registers<br>
&gt;&gt; are 32bit or 64bit. MSR/MRS are expecting 64bit values thus<br>
&gt;&gt; we should get rid of helpers READ/WRITE_SYSREG32<br>
&gt;&gt; in favour of using READ/WRITE_SYSREG.<br>
&gt;&gt; We should also use register_t type when reading sysregs<br>
&gt;&gt; which can correspond to uint64_t or uint32_t.<br>
&gt;&gt; Even though many AArch64 registers have upper 32bit reserved<br>
&gt;&gt; it does not mean that they can&#39;t be widen in the future.<br>
&gt;&gt;<br>
&gt;&gt; Modify type of hsr, cpsr, spsr_el1 to uint64_t.<br>
&gt; <br>
&gt; As I pointed out in v1, the access to SPSR_EL1 has been quite fragile =
because we relied on the padding afterwards. I think this was ought to be e=
xplain in the commit message because it explain why the access in the assem=
bly code is not modified.<br>
&gt; <br>
How about:<br>
&quot;<br>
Modify type of hsr, cpsr, spsr_el1 to uint64_t.<br>
Previously we relied on the padding after SPSR_EL1. As we removed the paddi=
ng, modify the union to be 64bit<br>
so we don&#39;t corrupt SPSR_FIQ.<br>
No need to modify the assembly code becuase the accesses were based on 64bi=
t registers as there was a 32bit padding after SPSR_EL1.<br>
&quot;<br>
&gt;&gt;<br>
&gt;&gt; Add 32bit RES0 members to structures inside hsr union.<br>
&gt;&gt;<br>
&gt;&gt; Remove 32bit padding in cpu_user_regs before spsr_fiq<br>
&gt;&gt; as it is no longer needed due to upper union being 64bit now.<br>
&gt;&gt;<br>
&gt;&gt; Add 64bit padding in cpu_user_regs before spsr_el1<br>
&gt;&gt; because offset of spsr_el1 must be a multiple of 8.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@arm=
.com" target=3D"_blank" rel=3D"noreferrer">michal.orzel@arm.com</a>&gt;<br>
&gt;&gt; diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h=
<br>
&gt;&gt; index 29d4531f40..fb4a3b1274 100644<br>
&gt;&gt; --- a/xen/include/asm-arm/hsr.h<br>
&gt;&gt; +++ b/xen/include/asm-arm/hsr.h<br>
&gt;&gt; @@ -16,11 +16,12 @@ enum dabt_size {<br>
&gt;&gt; =C2=A0 };<br>
&gt;&gt; =C2=A0 =C2=A0 union hsr {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t bits;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 register_t bits;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lo=
ng iss:25;=C2=A0 /* Instruction Specific Syndrome */<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lo=
ng len:1;=C2=A0=C2=A0 /* Instruction length */<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lo=
ng ec:6;=C2=A0=C2=A0=C2=A0 /* Exception Class */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long _res0:32=
;<br>
&gt; <br>
&gt; Sorry I wasn&#39;t clear in my original comment, what I meant I would =
rather not add this field (and also the _res0) because they are not strictl=
y necessary.<br>
&gt; <br>
Ok I&#39;ll remove _res0 members. But bits can be of type register_t, right=
?<br>
&gt;&gt; diff --git a/xen/include/public/arch-arm.h b/xen/include/public/ar=
ch-arm.h<br>
&gt;&gt; index 713fd65317..c49bce2983 100644<br>
&gt;&gt; --- a/xen/include/public/arch-arm.h<br>
&gt;&gt; +++ b/xen/include/public/arch-arm.h<br>
&gt;&gt; @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Return address and mode *=
/<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __DECL_REG(pc64,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc32);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ELR_EL2 */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 uint32_t cpsr;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* SP=
SR_EL2 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 register_t cpsr;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* SPSR_EL2 */<br=
>
&gt; <br>
&gt; You can&#39;t use register_t here because this is a public header (we =
don&#39;t export register_t) and the header should be bitness agnostic.<br>
&gt; <br>
&gt; Also, because this is a public header, you ought to explain why breaki=
ng the ABI is fine.<br>
&gt; <br>
&gt; In this case, this is an ABI between the tools and this is not stable.=
 However, we would still need to bump XEN_DOMCTL_INTERFACE_VERSION as I thi=
nk this wasn&#39;t done for this development cycle.<br>
&gt; <br>
&gt; Of course, this will also need a suitable mention in the commit messag=
e (I can help with that).<br>
&gt; <br>
Ok so I&#39;ll increment XEN_DOMCTL_INTERFACE_VERSION and write in commit m=
sg:<br>
&quot;<br>
Change type of cpsr to uint64_t in the public outside interface &quot;publi=
c/arch-arm.h&quot; to allow ABI compatibility between 32bit and 64bit.<br>
Increment XEN_DOMCTL_INTERFACE_VERSION.<br>
&quot;<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t spsr_el1;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AArch64 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t spsr_el1;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AArch64 */<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t sp=
sr_svc;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AArch32 */<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;&gt; =C2=A0 diff --git a/xen/include/public/vm_event.h b/xen/include/pu=
blic/vm_event.h<br>
&gt;&gt; index 36135ba4f1..ad3d141fe8 100644<br>
&gt;&gt; --- a/xen/include/public/vm_event.h<br>
&gt;&gt; +++ b/xen/include/public/vm_event.h<br>
&gt;&gt; @@ -266,8 +266,12 @@ struct vm_event_regs_arm {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t ttbr1;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t ttbcr;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t pc;<br>
&gt;&gt; +#ifdef CONFIG_ARM_32<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t cpsr;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t _pad;<br>
&gt;&gt; +#else<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint64_t cpsr;<br>
&gt;&gt; +#endif<br>
&gt; <br>
&gt; CONFIG_ARM_32 is not defined for public header. They also should be bi=
tness agnostic. So cpsr should always be uint64_t.<br>
&gt; <br>
&gt; Also, similar to public/arch-arm.h, this is not a stable ABI but you w=
ill need to bump VM_EVENT_INTERFACE_VERSION if this hasn&#39;t been done fo=
r this development cycle.<br>
&gt; <br>
Ok so I will change type of cpsr here to uint64_t, increment VM_EVENT_INTER=
FACE_VERSION and write in commit msg:<br>
&quot;<br>
Change type of cpsr to uint64_t in the public outside interface &quot;publi=
c/vm_event.h&quot; to allow ABI compatibility between 32bit and 64bit.<br>
Increment VM_EVENT_INTERFACE_VERSION.<br>
&quot;<br>
Ok?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">There is no need to bump the interface version for this, you are not cha=
nging the layout or size of the structure since there was already 64bit spa=
ce there for cspr for both 32bit and 64bit builds. You are just folding tha=
t padding field into cspr on 32bit builds.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Tamas</div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000009331e05c11a00de--

