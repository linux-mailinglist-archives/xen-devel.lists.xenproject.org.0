Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91015BCE35
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 16:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408781.651636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHUs-000118-6v; Mon, 19 Sep 2022 14:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408781.651636; Mon, 19 Sep 2022 14:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHUs-0000zI-4D; Mon, 19 Sep 2022 14:11:42 +0000
Received: by outflank-mailman (input) for mailman id 408781;
 Mon, 19 Sep 2022 14:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ik4Y=ZW=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1oaHUq-0000zC-BY
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 14:11:40 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9fe323b-3824-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 16:11:39 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-349c4310cf7so175219867b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 07:11:38 -0700 (PDT)
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
X-Inumbo-ID: f9fe323b-3824-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=onHH+rf0TFLFOgUFsPT3XTtvXGzHKwlZcupwcOYXDA8=;
        b=E2qqJVo9OIivs3LaWLDimkywGcrSuVu5oXeL4go6nqrZt3Aa6x0G3qhv0h1NeWHyQO
         9Yh2142QZz/Iszi0Pl4Uowz1F0alTErTpcHq//uL5Fegu7CNub9BwR/9zlt+3bbyLxSV
         oO91kD7iMFehJfelR1anQzDNequJWZxzX7wf435N/9ajN30G5w0rxkGZhXPsAPnBzbQ+
         XxjyrHlZlyR8PvyX83ZMxwjqMFrwwi60lPQmGFG5HIiXAS5vfjUOIU412azcC3BBr0uL
         59yvexPao58owkQTodbII2jXZS7uIcDmM9GSazLm3dumCBZIcj0t9wCzowTz7xSgE2u2
         5vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=onHH+rf0TFLFOgUFsPT3XTtvXGzHKwlZcupwcOYXDA8=;
        b=k3wVtnrK5HiUNC9y01CSgEatKcsYVge4EWx9QVHweTJhcJjpfYbk2NR2Y+bBlojjSz
         TniEvhMdwZHuHuqGt5VtCjbXrUiITCxz1mHj2pX2mCGGdRUeFXECyIGTTLNYX/M6VDkG
         nNDK3bRf8RScn0SwDu0da2pt9+q/4A2eU4PlJWwAtwLCBti6GezTNeJXX49sJpZTTAWV
         Tjl8LI/CFpKDFrr3TShyIkXyxbUWfPVcJGyM8MGipEhkCFuwt7pIVpe28tE9Xs8Jmipe
         K8VQd9h9tbXLA4vIt8Xkb6g8JG1FXlCMUVYFhnenPJdO+KnzS/DKSyC1u1eaSq/KST0k
         QF/A==
X-Gm-Message-State: ACrzQf1ga0xkuxuWEdmb9OzQg+ig5qTtxM8Q+e05rSSvV6wTBAOlgtjl
	bEMZKkJ0b7Db7ZgiLg4mYc2uLCF+p7zbnzYho1c=
X-Google-Smtp-Source: AMsMyM5UgJAfLFB2ZlR1viRNbK+8pmfAQO8uxvtdvDBZC//EpJ0dfIXYWnrjv+SEfu4j9+D50CBpmJyZhGsiujh3d1s=
X-Received: by 2002:a81:d344:0:b0:345:1751:e648 with SMTP id
 d4-20020a81d344000000b003451751e648mr15437260ywl.159.1663596697721; Mon, 19
 Sep 2022 07:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com> <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com> <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com> <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
 <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
In-Reply-To: <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 19 Sep 2022 10:11:03 -0400
Message-ID: <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: multipart/alternative; boundary="000000000000379f8405e9084ab2"

--000000000000379f8405e9084ab2
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 19, 2022 at 9:58 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 19.09.2022 15:24, Tamas K Lengyel wrote:
> > On Mon, Sep 19, 2022 at 9:21 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 19.09.2022 14:25, Tamas K Lengyel wrote:
> >>> On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 16.09.2022 23:35, Boris Ostrovsky wrote:
> >>>>>
> >>>>> On 9/16/22 8:52 AM, Jan Beulich wrote:
> >>>>>> On 15.09.2022 16:01, Tamas K Lengyel wrote:
> >>>>>>> While experimenting with the vPMU subsystem an ASSERT failure was
> >>>>>>> observed in vmx_find_msr because the vcpu_runnable state was true.
> >>>>>>>
> >>>>>>> The root cause of the bug appears to be the fact that the vPMU
> subsystem
> >>>>>>> doesn't save its state on context_switch.
> >>
> >> For the further reply below - is this actually true? What is the
> >> vpmu_switch_from() (resolving to vpmu_save()) doing then early
> >> in context_switch()?
> >>
> >>>>>>> The vpmu_load function will attempt
> >>>>>>> to gather the PMU state if its still loaded two different ways:
> >>>>>>>      1. if the current pcpu is not where the vcpu ran before doing
> a remote save
> >>>>>>>      2. if the current pcpu had another vcpu active before doing a
> local save
> >>>>>>>
> >>>>>>> However, in case the prev vcpu is being rescheduled on another
> pcpu its state
> >>>>>>> has already changed and vcpu_runnable is returning true, thus #2
> will trip the
> >>>>>>> ASSERT. The only way to avoid this race condition is to make sure
> the
> >>>>>>> prev vcpu is paused while being checked and its context saved.
> Once the prev
> >>>>>>> vcpu is resumed and does #1 it will find its state already saved.
> >>>>>> While I consider this explanation plausible, I'm worried:
> >>>>>>
> >>>>>>> --- a/xen/arch/x86/cpu/vpmu.c
> >>>>>>> +++ b/xen/arch/x86/cpu/vpmu.c
> >>>>>>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t
> from_guest)
> >>>>>>>           vpmu = vcpu_vpmu(prev);
> >>>>>>>
> >>>>>>>           /* Someone ran here before us */
> >>>>>>> +        vcpu_pause(prev);
> >>>>>>>           vpmu_save_force(prev);
> >>>>>>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> >>>>>>> +        vcpu_unpause(prev);
> >>>>>>>
> >>>>>>>           vpmu = vcpu_vpmu(v);
> >>>>>>>       }
> >>>>>> We're running with IRQs off here, yet vcpu_pause() waits for the
> vcpu
> >>>>>> to actually be de-scheduled. Even with IRQs on this is already a
> >>>>>> relatively heavy operation (also including its impact on the remote
> >>>>>> side). Additionally the function is called from context_switch(),
> and
> >>>>>> I'm unsure of the usability of vcpu_pause() on such a path. In
> >>>>>> particular: Is there a risk of two CPUs doing this mutually to one
> >>>>>> another? If so, is deadlocking excluded?
> >>>>>>
> >>>>>> Hence at the very least I think the description wants extending, to
> >>>>>> discuss the safety of the change.
> >>>>>>
> >>>>>> Boris - any chance you could comment here? Iirc that's code you did
> >>>>>> introduce.
> >>>>>
> >>>>>
> >>>>> Is the assertion in vmx_find_msr() really needs to be for runnable
> vcpu or can it be a check on whether vcpu is actually running (e.g.
> RUNSTATE_running)?
> >>>>
> >>>> You cannot safely check for "running", as "runnable" may transition
> >>>> to/from "running" behind your back.
> >>>
> >>> The more I look at this the more I think the only sensible solution is
> >>> to have the vPMU state be saved on vmexit for all vCPUs.
> >>
> >> Do you really mean vmexit? It would suffice if state was reliably
> >> saved during context-switch-out, wouldn't it? At that point the
> >> vCPU can't be resumed on another pCPU, yet.
> >>
> >>> That way all
> >>> this having to figure out where and when a context needs saving during
> >>> scheduling goes away. Yes, it adds a bit of overhead for cases where
> >>> the vCPU will resume on the same pCPU and that context saved could
> >>> have been skipped,
> >>
> >> If you really mean vmexit, then I'm inclined to say that's more
> >> than just "a bit of overhead". I'd agree if you really meant
> >> context-switch-out, but as said further up it looks to me as if
> >> that was already occurring. Apparently I'm overlooking something
> >> crucial ...
> >
> > Yes, the current setup is doing exactly that, saving the vPMU context
> > on context-switch-out, and that's where the ASSERT failure occurs
> > because the vCPU it needs to save the context for is already runnable
> > on another pCPU.
>
> Well, if that's the scenario (sorry for not understanding it that
> way earlier on), then the assertion is too strict: While in context
> switch, the vCPU may be runnable, but certainly won't actually run
> anywhere. Therefore I'd be inclined to suggest to relax the
> condition just enough to cover this case, without actually going to
> checking for "running".
>

What ensures the vCPU won't actually run anywhere if it's in the runnable
state? And how do I relax the condition just enough to cover just this case?

Tamas

--000000000000379f8405e9084ab2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 19, 2022 at 9:58 AM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 19.09.2=
022 15:24, Tamas K Lengyel wrote:<br>
&gt; On Mon, Sep 19, 2022 at 9:21 AM Jan Beulich &lt;<a href=3D"mailto:jbeu=
lich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 19.09.2022 14:25, Tamas K Lengyel wrote:<br>
&gt;&gt;&gt; On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich &lt;<a href=3D"mai=
lto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<b=
r>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 16.09.2022 23:35, Boris Ostrovsky wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 9/16/22 8:52 AM, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 15.09.2022 16:01, Tamas K Lengyel wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; While experimenting with the vPMU subsystem an=
 ASSERT failure was<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; observed in vmx_find_msr because the vcpu_runn=
able state was true.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; The root cause of the bug appears to be the fa=
ct that the vPMU subsystem<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; doesn&#39;t save its state on context_switch.<=
br>
&gt;&gt;<br>
&gt;&gt; For the further reply below - is this actually true? What is the<b=
r>
&gt;&gt; vpmu_switch_from() (resolving to vpmu_save()) doing then early<br>
&gt;&gt; in context_switch()?<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; The vpmu_load function will attempt<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; to gather the PMU state if its still loaded tw=
o different ways:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 1. if the current pcpu is =
not where the vcpu ran before doing a remote save<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 2. if the current pcpu had=
 another vcpu active before doing a local save<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; However, in case the prev vcpu is being resche=
duled on another pcpu its state<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; has already changed and vcpu_runnable is retur=
ning true, thus #2 will trip the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ASSERT. The only way to avoid this race condit=
ion is to make sure the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; prev vcpu is paused while being checked and it=
s context saved. Once the prev<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; vcpu is resumed and does #1 it will find its s=
tate already saved.<br>
&gt;&gt;&gt;&gt;&gt;&gt; While I consider this explanation plausible, I&#39=
;m worried:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/xen/arch/x86/cpu/vpmu.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/xen/arch/x86/cpu/vpmu.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu=
 *v, bool_t from_guest)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu =
=3D vcpu_vpmu(prev);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Som=
eone ran here before us */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu_pause(prev);=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu_s=
ave_force(prev);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu_r=
eset(vpmu, VPMU_CONTEXT_LOADED);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu_unpause(prev=
);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu =
=3D vcpu_vpmu(v);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt;&gt; We&#39;re running with IRQs off here, yet vcpu_pau=
se() waits for the vcpu<br>
&gt;&gt;&gt;&gt;&gt;&gt; to actually be de-scheduled. Even with IRQs on thi=
s is already a<br>
&gt;&gt;&gt;&gt;&gt;&gt; relatively heavy operation (also including its imp=
act on the remote<br>
&gt;&gt;&gt;&gt;&gt;&gt; side). Additionally the function is called from co=
ntext_switch(), and<br>
&gt;&gt;&gt;&gt;&gt;&gt; I&#39;m unsure of the usability of vcpu_pause() on=
 such a path. In<br>
&gt;&gt;&gt;&gt;&gt;&gt; particular: Is there a risk of two CPUs doing this=
 mutually to one<br>
&gt;&gt;&gt;&gt;&gt;&gt; another? If so, is deadlocking excluded?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Hence at the very least I think the description wa=
nts extending, to<br>
&gt;&gt;&gt;&gt;&gt;&gt; discuss the safety of the change.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Boris - any chance you could comment here? Iirc th=
at&#39;s code you did<br>
&gt;&gt;&gt;&gt;&gt;&gt; introduce.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Is the assertion in vmx_find_msr() really needs to be =
for runnable vcpu or can it be a check on whether vcpu is actually running =
(e.g. RUNSTATE_running)?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; You cannot safely check for &quot;running&quot;, as &quot;=
runnable&quot; may transition<br>
&gt;&gt;&gt;&gt; to/from &quot;running&quot; behind your back.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The more I look at this the more I think the only sensible sol=
ution is<br>
&gt;&gt;&gt; to have the vPMU state be saved on vmexit for all vCPUs.<br>
&gt;&gt;<br>
&gt;&gt; Do you really mean vmexit? It would suffice if state was reliably<=
br>
&gt;&gt; saved during context-switch-out, wouldn&#39;t it? At that point th=
e<br>
&gt;&gt; vCPU can&#39;t be resumed on another pCPU, yet.<br>
&gt;&gt;<br>
&gt;&gt;&gt; That way all<br>
&gt;&gt;&gt; this having to figure out where and when a context needs savin=
g during<br>
&gt;&gt;&gt; scheduling goes away. Yes, it adds a bit of overhead for cases=
 where<br>
&gt;&gt;&gt; the vCPU will resume on the same pCPU and that context saved c=
ould<br>
&gt;&gt;&gt; have been skipped,<br>
&gt;&gt;<br>
&gt;&gt; If you really mean vmexit, then I&#39;m inclined to say that&#39;s=
 more<br>
&gt;&gt; than just &quot;a bit of overhead&quot;. I&#39;d agree if you real=
ly meant<br>
&gt;&gt; context-switch-out, but as said further up it looks to me as if<br=
>
&gt;&gt; that was already occurring. Apparently I&#39;m overlooking somethi=
ng<br>
&gt;&gt; crucial ...<br>
&gt; <br>
&gt; Yes, the current setup is doing exactly that, saving the vPMU context<=
br>
&gt; on context-switch-out, and that&#39;s where the ASSERT failure occurs<=
br>
&gt; because the vCPU it needs to save the context for is already runnable<=
br>
&gt; on another pCPU.<br>
<br>
Well, if that&#39;s the scenario (sorry for not understanding it that<br>
way earlier on), then the assertion is too strict: While in context<br>
switch, the vCPU may be runnable, but certainly won&#39;t actually run<br>
anywhere. Therefore I&#39;d be inclined to suggest to relax the<br>
condition just enough to cover this case, without actually going to<br>
checking for &quot;running&quot;.<br></blockquote><div><br></div><div>What =
ensures the vCPU won&#39;t actually run anywhere if it&#39;s in the runnabl=
e state? And how do I relax the condition just enough to cover just this ca=
se?</div><div><br></div><div>Tamas<br></div></div></div>

--000000000000379f8405e9084ab2--

