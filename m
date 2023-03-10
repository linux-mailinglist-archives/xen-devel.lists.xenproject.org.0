Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146A6B4BF7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 17:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508525.783254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafFo-000285-Kc; Fri, 10 Mar 2023 16:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508525.783254; Fri, 10 Mar 2023 16:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafFo-00026C-HQ; Fri, 10 Mar 2023 16:06:00 +0000
Received: by outflank-mailman (input) for mailman id 508525;
 Fri, 10 Mar 2023 16:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wjP=7C=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pafFm-000265-FD
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 16:05:58 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71152bd3-bf5d-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 17:05:56 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id t11so7257623lfr.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Mar 2023 08:05:56 -0800 (PST)
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
X-Inumbo-ID: 71152bd3-bf5d-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678464348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMxJWAkczboAW049jRuccWtEUK9YHuuRlQ5TB9a2LC8=;
        b=KDuHFd8eWG4RHfi/w0My8Xas2Odaj4klKWBCiHfBf7MzMzU5kFR9YUKWwFiQTvJv2w
         rTI1ynj8opSvqgOJDFuZsTurgx75TSSnDpDY2L47UDyqXclXxSHJF6rcsEdlSVZL9g8Y
         DQSe7QGwH8ezTkE1J3BK025bK4HRwIOVcQ7N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMxJWAkczboAW049jRuccWtEUK9YHuuRlQ5TB9a2LC8=;
        b=c4OS7BxnauzE9gGD9NPFHZtDekU4PxkuDupub99LSEiUUQ8kjQmxS9zauyzvIOt+T6
         WalXRDUyirai8LMC3Wk8Kzx9o3BHuk3kVkP3Cyq4fTMycHKQ5kedRl3l67P8yRId/rZ1
         Pq4aDDOBQH4krPz5vVHVCJCPJ8MrEbEVRtAGengdEorgGtYmbgTlziilgSz74dSpLm0X
         yia7AZEFYCuTx4WvYNXTbloAoFG+F7Ng6iQnTuwTfAt5sbejAFEjmkQSpYaDQhj+K4q7
         hqeveV4OLpyk4yhc80sbPnz2OATgvq0r96C+h6zuSfo0cmk9cY25tZvrzCTT7yuNvYO4
         ZQgg==
X-Gm-Message-State: AO0yUKUK2PMyFW794uGRBv7epE/xc+h35XjEQcFWfevRlbCQkNgSnFeK
	+gJWoMJ4jvbgiv4fu8x76EGumxtxTu52hIvJYug4FSaP3Ve6P34T
X-Google-Smtp-Source: AK7set+PnS2gSjKg4b5Tof8IJzeAc64czqHCVFsyYmQy8mNcgsSlJWcr/thkYuSNTppV9PhbTRQrNV9LRoy9XZNNj7I=
X-Received: by 2002:a05:6512:68:b0:4d8:5f47:e4d3 with SMTP id
 i8-20020a056512006800b004d85f47e4d3mr7912368lfo.8.1678464348303; Fri, 10 Mar
 2023 08:05:48 -0800 (PST)
MIME-Version: 1.0
References: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
 <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com> <Y/dlPXeJlPRwEB1s@mail-itl>
 <49f35c93-2235-4223-89dd-3e6256a17369@suse.com> <Y/dwd5Gkv5Ps61eC@mail-itl> <400b11d9-7905-1cc5-2ab3-e77d3fbd9908@suse.com>
In-Reply-To: <400b11d9-7905-1cc5-2ab3-e77d3fbd9908@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 10 Mar 2023 16:05:37 +0000
Message-ID: <CA+zSX=bQVQq1+gOXdPFFwerK-0HBCtmBW0mn__LaF3DgVGAx1w@mail.gmail.com>
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003fc4af05f68deffe"

--0000000000003fc4af05f68deffe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 8:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 23.02.2023 14:56, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Feb 23, 2023 at 02:21:11PM +0100, Jan Beulich wrote:
> >> On 23.02.2023 14:08, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Thu, Feb 23, 2023 at 11:16:28AM +0100, Jan Beulich wrote:
> >>>> On 22.02.2023 20:14, Demi Marie Obenour wrote:
> >>>>> To quote Andrew Cooper:
> >>>>>
> >>>>>> I know we've had this argument before, but not calling
> >>>>>> SetVirtualAddressMap() isn't a viable option.  It's a prerequisite
> to
> >>>>>> function on literally millions of devices
> >>>>>
> >>>>> Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP for years,
> and I
> >>>>> believe OpenXT and EVE ship it as well. Mark
> EFI_SET_VIRTUAL_ADDRESS_MAP
> >>>>> as SUPPORTED and enable it by default.
> >>>>
> >>>> This is insufficient justification. The main reason why we don't cal=
l
> >>>> it is because it can be called only once. Any entity taking over lat=
er
> >>>> (e.g. via kexec) can't do anything anymore about the virtual address
> >>>> associations once set. Hence what's needed to justify a change like
> >>>> this is an explanation of why this restriction is not really an issu=
e
> >>>> to anyone in any case.
> >>>
> >>> AFAIR from the discussion about the original patch, kexec under Xen
> does
> >>> not preserve runtime services working anyway, so this limitation is
> more
> >>> about some possible kexec implementation in the future, not actually
> >>> breaking something right now. And since Linux calls
> >>> SetVirtualAddressMap() _and_ supports kexec just fine, it's definitel=
y
> >>> possible to design this future kexec extension to work after
> >>> SetVirtualAddressMap() too.
> >>>
> >>> Relevant parts of that older discussion:
> >>> -
> https://lore.kernel.org/all/272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.c=
om/T/#u
> >>> - https://lore.kernel.org/all/20191009235725.GT8065@mail-itl/T/#u
> >>
> >> Well, there are various statements there without further reference. I'=
m
> >> having a hard time seeing how a full-fledged Linux could do well witho=
ut
> >> runtime services, or without being able to set the virtual address map
> >> to its liking. If they can, then a question would be why they need to
> >> set the virtual address map in the first place (yes, there is this
> >> supposed "firmware bugs" argument, which unfortunately I lack any proo=
f
> >> of; at the very least I'm unaware of bug reports against Xen boiling
> >> down to us not making this call).
> >
> > The second link points at a thread of one of such bug reports.
>
> Hmm, yes, digging through the about two dozen mails, I can see there is a
> connection to (not) calling SetVirtualAddressMap() there.
>
> >> Plus maybe they can merely because old
> >> and new OS are similar enough in their (virtual) memory layout? IOW
> >> kexec-ing to Linux for crash dumping purposes is just one (important)
> >> example of the functionality that needs retaining.
> >
> > It works just fine with Xen calling SetVirtualAddressMap().
> > SetVirtualAddressMap() is relevant only for using runtime services, and
> > you don't need them for crash dumps. In fact, runtime services are not
> > accessible to post-kexec Linux anyway, so this call doesn't change
> > anything.
> > Additionally, given most stuff works
> > just fine with efi=3Dno-rs proves it isn't severe limitation, if it rea=
lly
> > would need to be there - but as Andrew noted, given Linux example, it
> > doesn't really need to be the case - it may simply require a bit more
> > thinking when adding runtime services capability past kexec.
>
> All of what you say here is what I had meant to cover by adding the
> "(important)", which initially I didn't have.
>
> >> Once we get better
> >> PVH Dom0 support, maybe other Dom0 OSes surface with entirely differen=
t
> >> needs.
> >
> > I find this claim rather weird. Runtime services are a thing that Xen
> > needs to call, not some domain. And Xen has control over its memory
> > layout.
> >
> > _If_ PVH dom0 would really turn out to be incompatible with
> > SetVirtualAddressMap() call by Xen (which I highly doubt), then some
> > alternative for that case can be made. But that's only speculation.
>
> The remark wasn't about Dom0 itself wanting runtime services access:
> Dom0 isn't going to be provided such, at least not to the physical EFI's.
> If such was needed for PVH Dom0, we'd need to wire it to virtual firmware
> hooks (which in turn may or may not be viewed as against some of the
> ideas of PVH).
>
> The remark was instead meant to point out that such an alternative OS
> may want to invoke another (native) instance of itself for e.g. crash
> dumping purposes.
>
> >> As said back then - part of the reason why in the original
> >> implementation I've avoided making this call is because of the fear of
> >> closing possible roads we may need to take in the future.
> >
> > Yet, not calling SetVirtualAddressMap() leads to actual issues _right
> > now_, not in some hypothetical undefined future.
>
> That's the way you, Andrew, and others like to put it. My view at this
> is that it's not the lack of the call, but the improper implementation
> of firmware which leads to an apparent need for this call. Like for all
> other firmware bug workarounds, I'm happy to accept any proposals for
> workarounds, as long as such workarounds either don't impact spec-
> compliant systems, or as long as they're off by default.


But it sounds (reading though this thread) like it doesn't impact any
spec-compliant systems -- that is, not any *known* ones, but only
hypothetical dom0's which are neither Linux (including kexec) nor NetBSD
nor FreeBSD.

If we were Microsoft, we could afford to say "we don't support this
hardware", and that would be enough to get the manufacturers to change
their tune; but we're not.  Making it difficult for our users will not
fundamentally make vendors write better code.

Particularly as my guess is that it's probably mainly a matter of testing:
They only do testing on Windows (or maybe Linux if they're particularly
keen), both of which seem to call SetVirtualAddressMap(); and so bits of
the code accidentally come to rely on it being called.  Sure, in a perfect
world, developers would read the spec, automatically follow it, and test on
all possible hardware; but given how software actually works, it seems
inevitable that we're going to have a never-ending stream of bugs because
we're behaving differently.

So literally the only benefit of your policy is to accommodate hypothetical
operating systems, who may need the functionality for unknown reasons.  And
the cost is to have vanilla Xen not work on loads of real systems.  I don't
think this is the right decision; and it seems like the sort of general
higher-level principle that it would make sense to have a project-wide vote
on if discussion failed to reach consensus.

(Obviously if there are other technical issues, those would need to be
addressed first.)

Supposing such a hypothetical operating system appears, is there any reason
we can't figure out how to provide it what it needs at that time?

 -George

--0000000000003fc4af05f68deffe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 24, 2023 at 8:20=E2=80=AF=
AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 23.02.2023 14:56, Marek Marczykowski-G=C3=B3recki wrote:<br>
&gt; On Thu, Feb 23, 2023 at 02:21:11PM +0100, Jan Beulich wrote:<br>
&gt;&gt; On 23.02.2023 14:08, Marek Marczykowski-G=C3=B3recki wrote:<br>
&gt;&gt;&gt; On Thu, Feb 23, 2023 at 11:16:28AM +0100, Jan Beulich wrote:<b=
r>
&gt;&gt;&gt;&gt; On 22.02.2023 20:14, Demi Marie Obenour wrote:<br>
&gt;&gt;&gt;&gt;&gt; To quote Andrew Cooper:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I know we&#39;ve had this argument before, but not=
 calling<br>
&gt;&gt;&gt;&gt;&gt;&gt; SetVirtualAddressMap() isn&#39;t a viable option.=
=C2=A0 It&#39;s a prerequisite to<br>
&gt;&gt;&gt;&gt;&gt;&gt; function on literally millions of devices<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP=
 for years, and I<br>
&gt;&gt;&gt;&gt;&gt; believe OpenXT and EVE ship it as well. Mark EFI_SET_V=
IRTUAL_ADDRESS_MAP<br>
&gt;&gt;&gt;&gt;&gt; as SUPPORTED and enable it by default.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This is insufficient justification. The main reason why we=
 don&#39;t call<br>
&gt;&gt;&gt;&gt; it is because it can be called only once. Any entity takin=
g over later<br>
&gt;&gt;&gt;&gt; (e.g. via kexec) can&#39;t do anything anymore about the v=
irtual address<br>
&gt;&gt;&gt;&gt; associations once set. Hence what&#39;s needed to justify =
a change like<br>
&gt;&gt;&gt;&gt; this is an explanation of why this restriction is not real=
ly an issue<br>
&gt;&gt;&gt;&gt; to anyone in any case.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; AFAIR from the discussion about the original patch, kexec unde=
r Xen does<br>
&gt;&gt;&gt; not preserve runtime services working anyway, so this limitati=
on is more<br>
&gt;&gt;&gt; about some possible kexec implementation in the future, not ac=
tually<br>
&gt;&gt;&gt; breaking something right now. And since Linux calls<br>
&gt;&gt;&gt; SetVirtualAddressMap() _and_ supports kexec just fine, it&#39;=
s definitely<br>
&gt;&gt;&gt; possible to design this future kexec extension to work after<b=
r>
&gt;&gt;&gt; SetVirtualAddressMap() too.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Relevant parts of that older discussion:<br>
&gt;&gt;&gt; - <a href=3D"https://lore.kernel.org/all/272a9354-bcb4-50a4-a2=
51-6a453221d6e3@citrix.com/T/#u" rel=3D"noreferrer" target=3D"_blank">https=
://lore.kernel.org/all/272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.com/T/#u=
</a><br>
&gt;&gt;&gt; - <a href=3D"https://lore.kernel.org/all/20191009235725.GT8065=
@mail-itl/T/#u" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.or=
g/all/20191009235725.GT8065@mail-itl/T/#u</a><br>
&gt;&gt;<br>
&gt;&gt; Well, there are various statements there without further reference=
. I&#39;m<br>
&gt;&gt; having a hard time seeing how a full-fledged Linux could do well w=
ithout<br>
&gt;&gt; runtime services, or without being able to set the virtual address=
 map<br>
&gt;&gt; to its liking. If they can, then a question would be why they need=
 to<br>
&gt;&gt; set the virtual address map in the first place (yes, there is this=
<br>
&gt;&gt; supposed &quot;firmware bugs&quot; argument, which unfortunately I=
 lack any proof<br>
&gt;&gt; of; at the very least I&#39;m unaware of bug reports against Xen b=
oiling<br>
&gt;&gt; down to us not making this call). <br>
&gt; <br>
&gt; The second link points at a thread of one of such bug reports.<br>
<br>
Hmm, yes, digging through the about two dozen mails, I can see there is a<b=
r>
connection to (not) calling SetVirtualAddressMap() there.<br>
<br>
&gt;&gt; Plus maybe they can merely because old<br>
&gt;&gt; and new OS are similar enough in their (virtual) memory layout? IO=
W<br>
&gt;&gt; kexec-ing to Linux for crash dumping purposes is just one (importa=
nt)<br>
&gt;&gt; example of the functionality that needs retaining. <br>
&gt; <br>
&gt; It works just fine with Xen calling SetVirtualAddressMap().<br>
&gt; SetVirtualAddressMap() is relevant only for using runtime services, an=
d<br>
&gt; you don&#39;t need them for crash dumps. In fact, runtime services are=
 not<br>
&gt; accessible to post-kexec Linux anyway, so this call doesn&#39;t change=
<br>
&gt; anything.<br>
&gt; Additionally, given most stuff works<br>
&gt; just fine with efi=3Dno-rs proves it isn&#39;t severe limitation, if i=
t really<br>
&gt; would need to be there - but as Andrew noted, given Linux example, it<=
br>
&gt; doesn&#39;t really need to be the case - it may simply require a bit m=
ore<br>
&gt; thinking when adding runtime services capability past kexec.<br>
<br>
All of what you say here is what I had meant to cover by adding the<br>
&quot;(important)&quot;, which initially I didn&#39;t have. <br>
<br>
&gt;&gt; Once we get better<br>
&gt;&gt; PVH Dom0 support, maybe other Dom0 OSes surface with entirely diff=
erent<br>
&gt;&gt; needs.<br>
&gt; <br>
&gt; I find this claim rather weird. Runtime services are a thing that Xen<=
br>
&gt; needs to call, not some domain. And Xen has control over its memory<br=
>
&gt; layout.<br>
&gt; <br>
&gt; _If_ PVH dom0 would really turn out to be incompatible with<br>
&gt; SetVirtualAddressMap() call by Xen (which I highly doubt), then some<b=
r>
&gt; alternative for that case can be made. But that&#39;s only speculation=
.<br>
<br>
The remark wasn&#39;t about Dom0 itself wanting runtime services access:<br=
>
Dom0 isn&#39;t going to be provided such, at least not to the physical EFI&=
#39;s.<br>
If such was needed for PVH Dom0, we&#39;d need to wire it to virtual firmwa=
re<br>
hooks (which in turn may or may not be viewed as against some of the<br>
ideas of PVH).<br>
<br>
The remark was instead meant to point out that such an alternative OS<br>
may want to invoke another (native) instance of itself for e.g. crash<br>
dumping purposes.<br>
<br>
&gt;&gt; As said back then - part of the reason why in the original<br>
&gt;&gt; implementation I&#39;ve avoided making this call is because of the=
 fear of<br>
&gt;&gt; closing possible roads we may need to take in the future.<br>
&gt; <br>
&gt; Yet, not calling SetVirtualAddressMap() leads to actual issues _right<=
br>
&gt; now_, not in some hypothetical undefined future.<br>
<br>
That&#39;s the way you, Andrew, and others like to put it. My view at this<=
br>
is that it&#39;s not the lack of the call, but the improper implementation<=
br>
of firmware which leads to an apparent need for this call. Like for all<br>
other firmware bug workarounds, I&#39;m happy to accept any proposals for<b=
r>
workarounds, as long as such workarounds either don&#39;t impact spec-<br>
compliant systems, or as long as they&#39;re off by default.</blockquote><d=
iv><br></div><div>But it sounds (reading though this thread) like it doesn&=
#39;t impact any spec-compliant systems -- that is, not any *known* ones, b=
ut only hypothetical dom0&#39;s which are neither Linux (including kexec)=
=C2=A0nor NetBSD nor FreeBSD.</div><div><br></div><div>If we were Microsoft=
, we could afford to say &quot;we don&#39;t support this hardware&quot;, an=
d that would be enough to get the manufacturers to change their tune; but w=
e&#39;re not.=C2=A0 Making it difficult for our users will not fundamentall=
y make vendors write better code.</div><div><br></div><div>Particularly as =
my guess is that it&#39;s probably mainly a matter of testing: They only do=
 testing on Windows (or maybe Linux if they&#39;re particularly keen), both=
 of which seem to call SetVirtualAddressMap(); and so bits of the code acci=
dentally come to rely on it being called.=C2=A0 Sure, in a perfect world, d=
evelopers would read the spec, automatically follow it, and test on all pos=
sible hardware; but given how software actually works, it seems inevitable =
that we&#39;re going to have a never-ending stream of bugs because we&#39;r=
e behaving differently.</div><div><br></div><div>So literally the only bene=
fit of your policy is to accommodate hypothetical operating systems, who ma=
y need the functionality for unknown reasons.=C2=A0 And the cost is to have=
 vanilla Xen not work on loads of real systems.=C2=A0 I don&#39;t think thi=
s is the right decision; and it seems like the sort of general higher-level=
 principle that it would make sense to have a project-wide vote on if discu=
ssion failed to reach consensus.</div><div><br></div><div>(Obviously if the=
re are other technical issues, those would need to be addressed first.)</di=
v><div><br></div><div>Supposing such a hypothetical operating system appear=
s, is there any reason we can&#39;t figure out how to provide it what it ne=
eds at that time?</div><div><br></div><div>=C2=A0-George<br></div></div></d=
iv>

--0000000000003fc4af05f68deffe--

