Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6D455F81
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:30:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227482.393443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjMI-00035U-Uz; Thu, 18 Nov 2021 15:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227482.393443; Thu, 18 Nov 2021 15:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjMI-00032b-RI; Thu, 18 Nov 2021 15:29:54 +0000
Received: by outflank-mailman (input) for mailman id 227482;
 Thu, 18 Nov 2021 15:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tNz=QF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mnjMH-00032V-5O
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:29:53 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f5dd617-4884-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 16:29:51 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id w29so12281026wra.12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 07:29:51 -0800 (PST)
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
X-Inumbo-ID: 5f5dd617-4884-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MULBlUikP8t2N97P55ABinZBZ4Z0bSQzPnY23TlGio4=;
        b=HLvLq4oiireOxg7eiCA0AdIavoFH4fYMJBa+Mjn8lWZUQTghSoufoiSEuhuT52bL+O
         WMTlj9Y7GE9KOBlJERJklBB6GSagaJHhPRUILyluVUDMmnq5NzrTYZl75kpgOdCAf07H
         lvVCy4BqKpRiAX+nyKoWFvKT4qpe4IOOC6L1QnYPTd1uVOtf70CXhtwp5HrGVkEi8BT4
         O2IMe6+hVqthSflkQmNpSLxHJnFiHi7zDYbdGBOK5ivLC5Vp1j6LBlA4ugJumnpm+C7l
         0pCpJXb8dkt0f010QYouqnCi5dW4zfcRwQ/8yS7+xq3GWbse9PF5q6saujvOB4Nr3bKA
         VdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MULBlUikP8t2N97P55ABinZBZ4Z0bSQzPnY23TlGio4=;
        b=p3Hriz8r59vSElkTfkOVHbAeWPCwgpSWuXm/velQ9zyiWq5+H8V7fG61nfWp8fkLSO
         v1L+UXDJbfUTdAGMeZTL0kYROty19+Zw1q23hCM8GofYySo7WDTL/OYOlwa0mG5C5RdN
         3hDUD+Lvqjm9ciZ2p6SHx8d9aYWW8P7OW3Ol1MbwbxECsG0R3aa91MejvY9rC74liyBT
         Q95LMOz7RnhpnxhC3E7kJjgP750PuAD6bGw3gP97DxFJK+81LKfSsnC6HHb8tNPxZbD6
         r79tg76VETAwxArav9I5gZA4lW77hRMy/zlvPQKg0hFAWTCEFrn+WUSQVNuM0REZkaZ8
         UItA==
X-Gm-Message-State: AOAM531bKI57hnLvCkqRUtpKU4ukzmn+tOnHvuUYqFSDM0Qj0j/f9iMx
	p7jArkhqQ9ichRIK846ENwhiFEks2mqKX0kedY8=
X-Google-Smtp-Source: ABdhPJyPMWa54AyjJ/KxZw/uAheOczDDirG9v6W3XHc4CMxEs6v3cXAJooV16il2MWDvJO8sY3T4GYVYdtmaEf5n5Tc=
X-Received: by 2002:adf:e842:: with SMTP id d2mr31005116wrn.399.1637249391093;
 Thu, 18 Nov 2021 07:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20211117095711.26596-1-luca.fancellu@arm.com> <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com> <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com> <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
In-Reply-To: <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 18 Nov 2021 17:29:40 +0200
Message-ID: <CAPD2p-moDUReV0u98T0PFA+Buj+cCLk2P0TkqFu_e9M=bY5=4A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>
Content-Type: multipart/alternative; boundary="0000000000005d6cd405d111d44c"

--0000000000005d6cd405d111d44c
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:11 PM Julien Grall <julien@xen.org> wrote:

Hi Julien, all

[Sorry for the possible format issues]

(Prunning some CC to just leave Arm and sched folks)
>
> On 17/11/2021 12:07, Bertrand Marquis wrote:
> > Hi Julien,
>
> Hi Bertrand,
>
> >> On 17 Nov 2021, at 11:48, Julien Grall <julien@xen.org> wrote:
> >>
> >> On 17/11/2021 11:16, Bertrand Marquis wrote:
> >>> Hi Julien,
> >>
> >> Hi,
> >>
> >>>> On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
> >>>>
> >>>> Hi Luca,
> >>>>
> >>>> On 17/11/2021 09:57, Luca Fancellu wrote:
> >>>>> Currently Xen creates a default cpupool0 that contains all the cpu
> brought up
> >>>>> during boot and it assumes that the platform has only one kind of
> CPU.
> >>>>> This assumption does not hold on big.LITTLE platform, but putting
> different
> >>>>> type of CPU in the same cpupool can result in instability and
> security issues
> >>>>> for the domains running on the pool.
> >>>>
> >>>> I agree that you can't move a LITTLE vCPU to a big pCPU. However...
> >>>>
> >>>>> For this reason this serie introduces an architecture specific way
> to create
> >>>>> different cpupool at boot time, this is particularly useful on ARM
> big.LITTLE
> >>>>> platform where there might be the need to have different cpupools
> for each type
> >>>>> of core, but also systems using NUMA can have different cpu pool for
> each node.
> >>>>
> >>>> ... from my understanding, all the vCPUs of a domain have to be in
> the same cpupool. So with this approach it is not possible:
> >>>>    1) to have a mix of LITTLE and big vCPUs in the domain
> >>>>    2) to create a domain spanning across two NUMA nodes
> >>>>
> >>>> So I think we need to make sure that any solutions we go through will
> not prevent us to implement those setups.
> >>> The point of this patch is to make all cores available without
> breaking the current behaviour of existing system.
> >>
> >> I might be missing some context here. By breaking current behavior, do
> you mean user that may want to add "hmp-unsafe" on the command line?
> >
> > Right, with hmp-unsafe the behaviour is now the same as without, only
> extra cores are parked in other cpupools.
> >
> > So you have a point in fact that behaviour is changed for someone who
> was using hmp-unsafe before if this is activated.
> > The command line argument suggested by Jurgen definitely makes sense
> here.
> >
> > We could instead do the following:
> > - when this is activated in the configuration, boot all cores and park
> them in different pools (depending on command line argument). Current
> behaviour not change if other pools are not used (but more cores will be on
> in xen)
>
>  From my understanding, it is possible to move a pCPU in/out a pool
> afterwards. So the security concern with big.LITTLE is still present,
> even though it would be difficult to hit it.
>
> I am also concerned that it would be more difficult to detect any
> misconfiguration. So I think this option would still need to be turned
> on only if hmp-unsafe are the new command line one are both on.
>
> If we want to enable it without hmp-unsafe on, we would need to at least
> lock the pools.
>
> > - when hmp-unsafe is on, this feature will be turned of (if activated in
> configuration) and all cores would be added in the same pool.
> >
> > What do you think ?
>
> I am split. On one hand, this is making easier for someone to try
> big.LITTLE as you don't have manually pin vCPUs. On the other hand, this
> is handling a single use-case and you would need to use hmp-unsafe and
> pinning if you want to get more exotic setup (e.g. a domain with
> big.LITTLE).
>
> Another possible solution is to pin dom0 vCPUs (AFAIK they are just
> sticky by default) and then create the pools from dom0 userspace. My
> assumption is for dom0less we would want to use pinning instead.
>
> That said I would like to hear from Xilinx and EPAM as, IIRC, they are
> already using hmp-unsafe in production.
>


We have been using hmp-unsafe since it's introduction, yes we are aware of
possible consequences of enabling that option (as different CPU types might
have different errata, cache lines, PA bits (?), etc), so we are trying to
deal with it carefully.
In our target system we pin Dom0's vCPUs to the pCPUs of the same type from
userspace via "xl vcpu-pin" command, for other domains more exotic
configuration can be used.

I share Stefano's opinion not to tie new feature (boot time MIDR-based
cpupools) to existing hmp-unsafe option and create new command line option
to control new feature.

The proposed algorithm (copy it here for the convenience) looks fine to me.
"So in short I think it should be:
- midr-cpupools alone
cpupools created at boot, warning/errors on changing cpupools
- midr-cpupools + hmp-unsafe
cpupools created at boot, changing cpupools is allowed (we could still
warn but no errors)
- hmp-unsafe alone
same as today with hmp-unsafe"

For the default behaviour I also don't have a strong preference.  One thing
is clear: default behaviour should be safe. I think, the command line
option is preferred over the config option as new feature can be
enabled/disabled without a need to re-build Xen, moreover, if we follow the
proposed algorithm route, the behaviour of new feature at runtime (whether
the changing of cpupools is allowed or not) are going to be depended on the
hmp-unsafe state which is under command line control currently. But, there
is no strong preference here as well.



>
> Cheers,
>
> --
> Julien Grall
>
>

-- 
Regards,

Oleksandr Tyshchenko

--0000000000005d6cd405d111d44c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:11 PM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:=
<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div class=3D"gma=
il_attr">Hi Julien, all</div><div class=3D"gmail_attr"><br></div><div class=
=3D"gmail_attr">[Sorry for the possible format issues]</div><div dir=3D"ltr=
" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">(Prunning some CC to just leave Arm and sched folks)<br>
<br>
On 17/11/2021 12:07, Bertrand Marquis wrote:<br>
&gt; Hi Julien,<br>
<br>
Hi Bertrand,<br>
<br>
&gt;&gt; On 17 Nov 2021, at 11:48, Julien Grall &lt;<a href=3D"mailto:julie=
n@xen.org" target=3D"_blank">julien@xen.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 17/11/2021 11:16, Bertrand Marquis wrote:<br>
&gt;&gt;&gt; Hi Julien,<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 17 Nov 2021, at 10:26, Julien Grall &lt;<a href=3D"mail=
to:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Luca,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 17/11/2021 09:57, Luca Fancellu wrote:<br>
&gt;&gt;&gt;&gt;&gt; Currently Xen creates a default cpupool0 that contains=
 all the cpu brought up<br>
&gt;&gt;&gt;&gt;&gt; during boot and it assumes that the platform has only =
one kind of CPU.<br>
&gt;&gt;&gt;&gt;&gt; This assumption does not hold on big.LITTLE platform, =
but putting different<br>
&gt;&gt;&gt;&gt;&gt; type of CPU in the same cpupool can result in instabil=
ity and security issues<br>
&gt;&gt;&gt;&gt;&gt; for the domains running on the pool.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I agree that you can&#39;t move a LITTLE vCPU to a big pCP=
U. However...<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; For this reason this serie introduces an architecture =
specific way to create<br>
&gt;&gt;&gt;&gt;&gt; different cpupool at boot time, this is particularly u=
seful on ARM big.LITTLE<br>
&gt;&gt;&gt;&gt;&gt; platform where there might be the need to have differe=
nt cpupools for each type<br>
&gt;&gt;&gt;&gt;&gt; of core, but also systems using NUMA can have differen=
t cpu pool for each node.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ... from my understanding, all the vCPUs of a domain have =
to be in the same cpupool. So with this approach it is not possible:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1) to have a mix of LITTLE and big vCPUs in t=
he domain<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 2) to create a domain spanning across two NUM=
A nodes<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; So I think we need to make sure that any solutions we go t=
hrough will not prevent us to implement those setups.<br>
&gt;&gt;&gt; The point of this patch is to make all cores available without=
 breaking the current behaviour of existing system.<br>
&gt;&gt;<br>
&gt;&gt; I might be missing some context here. By breaking current behavior=
, do you mean user that may want to add &quot;hmp-unsafe&quot; on the comma=
nd line?<br>
&gt; <br>
&gt; Right, with hmp-unsafe the behaviour is now the same as without, only =
extra cores are parked in other cpupools.<br>
&gt; <br>
&gt; So you have a point in fact that behaviour is changed for someone who =
was using hmp-unsafe before if this is activated.<br>
&gt; The command line argument suggested by Jurgen definitely makes sense h=
ere.<br>
&gt; <br>
&gt; We could instead do the following:<br>
&gt; - when this is activated in the configuration, boot all cores and park=
 them in different pools (depending on command line argument). Current beha=
viour not change if other pools are not used (but more cores will be on in =
xen)<br>
<br>
=C2=A0From my understanding, it is possible to move a pCPU in/out a pool <b=
r>
afterwards. So the security concern with big.LITTLE is still present, <br>
even though it would be difficult to hit it.<br>
<br>
I am also concerned that it would be more difficult to detect any <br>
misconfiguration. So I think this option would still need to be turned <br>
on only if hmp-unsafe are the new command line one are both on.<br>
<br>
If we want to enable it without hmp-unsafe on, we would need to at least <b=
r>
lock the pools.<br>
<br>
&gt; - when hmp-unsafe is on, this feature will be turned of (if activated =
in configuration) and all cores would be added in the same pool.<br>
&gt; <br>
&gt; What do you think ?<br>
<br>
I am split. On one hand, this is making easier for someone to try <br>
big.LITTLE as you don&#39;t have manually pin vCPUs. On the other hand, thi=
s <br>
is handling a single use-case and you would need to use hmp-unsafe and <br>
pinning if you want to get more exotic setup (e.g. a domain with <br>
big.LITTLE).<br>
<br>
Another possible solution is to pin dom0 vCPUs (AFAIK they are just <br>
sticky by default) and then create the pools from dom0 userspace. My <br>
assumption is for dom0less we would want to use pinning instead.<br>
<br>
That said I would like to hear from Xilinx and EPAM as, IIRC, they are <br>
already using hmp-unsafe in production.<br></blockquote><div><br></div><div=
><br></div><div>We have been using hmp-unsafe since it&#39;s introduction, =
yes we are aware of possible consequences of enabling that option (as diffe=
rent CPU types might have different errata, cache lines, PA bits (?), etc),=
 so we are trying to deal with it carefully.<br>In our target system we pin=
 Dom0&#39;s vCPUs to the pCPUs of the same type from userspace via &quot;xl=
 vcpu-pin&quot; command, for other domains more exotic configuration can be=
 used.<br><br>I share Stefano&#39;s opinion not to tie new feature (boot ti=
me MIDR-based cpupools) to existing hmp-unsafe option and create new comman=
d line option to control new feature.</div><div><br>The proposed algorithm =
(copy it here for the convenience) looks fine to me.<br>&quot;So in short I=
 think it should be:<br>- midr-cpupools alone<br>cpupools created at boot, =
warning/errors on changing cpupools<br>- midr-cpupools + hmp-unsafe<br>cpup=
ools created at boot, changing cpupools is allowed (we could still<br>warn =
but no errors)<br>- hmp-unsafe alone<br>same as today with hmp-unsafe&quot;=
<br><br></div><div>For the default behaviour I also don&#39;t have a strong=
 preference.=C2=A0 One thing is clear: default behaviour should be safe. I =
think, the command line option is preferred=C2=A0over the config option as =
new feature can be enabled/disabled without a need to re-build Xen, moreove=
r, if we follow the proposed algorithm route, the behaviour of new feature =
at runtime (whether the changing of=C2=A0cpupools=C2=A0is allowed or not) a=
re going to be depended on the hmp-unsafe state which is under command line=
 control currently. But, there is no strong preference here as well.<br></d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--0000000000005d6cd405d111d44c--

