Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5C7498E8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 12:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559826.875178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHLo7-0003lx-3b; Thu, 06 Jul 2023 10:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559826.875178; Thu, 06 Jul 2023 10:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHLo7-0003jL-0T; Thu, 06 Jul 2023 10:01:51 +0000
Received: by outflank-mailman (input) for mailman id 559826;
 Thu, 06 Jul 2023 10:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jm08=CY=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qHLo5-0003jF-6l
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 10:01:49 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd4b4d8-1be4-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 12:01:46 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b701e1c80fso6590261fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 03:01:46 -0700 (PDT)
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
X-Inumbo-ID: 1dd4b4d8-1be4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688637706; x=1691229706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CXvmPGa5oa/4U8HJIGwjcQ85FGvfc+qPVsCGxMP5qzU=;
        b=IRczryd5lBoEpGKKNADf+2APN7EZi3gZlsfvJaSEEvTebvKyGKshDBCsQOpYzN90XE
         0xOxzOfy06MBR6HdWIegJlHMc6ZAy9PQuUphQvrfFPcL33K7qaf94NW4aiqh80il/hlx
         rIzHxDWESXJv4D2KxPwrGWv1+QzdHHNUQU3cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688637706; x=1691229706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXvmPGa5oa/4U8HJIGwjcQ85FGvfc+qPVsCGxMP5qzU=;
        b=kYlXviPw6KHIyf+vGrWmlDXaCWV5CZiUEFUYT/KkrvdE5K3/XAriaxCxUmquMH0brR
         f2ehIAqucTbA0R243M2pEzpodYcmSBb3PBzsT/aBY3pULh3bMILKeJm2i9HCTb2WSEGW
         50mZedYyzoHYzA/n/037rqI9+Esrb3zyHO8DXGeJj3qbey39ls4ZLeu5jz39IeqfEcZg
         CMfyWqRm4zSev8nMRcKOXQXfDFzRUh5MRbEQFi1UhAD6e/fZ6vBnTwJNboPYp6gdYR3w
         IP5flPGOQ1EH2ZVTWcOI/quCs1IEjaiyGTVkjBI76szA0zZltO9zoJ54d+uPUfrs2u8x
         iI1w==
X-Gm-Message-State: ABy/qLY+Fq3KNXVcN3bpKqbUQwfU4yB2aUMHq880mGNYJE11/mcyEJbK
	pKwcu0iXwRMXa3GqhS0Pp6cgOAF4WhCMJG1BwSqZ9w==
X-Google-Smtp-Source: APBJJlFJq/ZNbrUWRWXv9OBgD+AWBoAUA1DVuEg0kdYZObktsLdSi41LfDjnsofkCMTWeGSUDWjjT4rq4E88YLQQ6ds=
X-Received: by 2002:a2e:9c14:0:b0:2b6:dd13:4f26 with SMTP id
 s20-20020a2e9c14000000b002b6dd134f26mr867285lji.46.1688637705535; Thu, 06 Jul
 2023 03:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com> <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
 <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com> <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 6 Jul 2023 11:01:34 +0100
Message-ID: <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: P S <pairspace@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, 
	Community Manager <community.manager@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000097d3ab05ffce9a1d"

--00000000000097d3ab05ffce9a1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 11:14=E2=80=AFPM Stefano Stabellini <
stefano.stabellini@amd.com> wrote:

> On Wed, 5 Jul 2023, George Dunlap wrote:
> > On Mon, Jul 3, 2023 at 9:55=E2=80=AFPM P S <pairspace@gmail.com> wrote:
> >       > On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@arm.com>
> wrote:
> >       =EF=BB=BF>
> >       >> On 3 Jul 2023, at 18:48, Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >>
> >       >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
> >       >>> On 7/1/23 11:13, Luca Fancellu wrote:
> >       >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <
> andrew.cooper3@citrix.com> wrote:
> >       >>>>>
> >       >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
> >       >>>>>> The "dom0less" feature was intended to be the feature wher=
e
> a domU
> >       >>>>>> domain could be launched without the control domain (Dom0)
> >       >>>>>> intervention, however the name seems to suggest that Dom0
> cannot
> >       >>>>>> be part of the configuration, while instead it's a possibl=
e
> use case.
> >       >>>>>>
> >       >>>>>> To avoid that, rename the "dom0less" configuration with th=
e
> name
> >       >>>>>> "hyperlaunch", that is less misleading.
> >       >>>>>>
> >       >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >       >>>>>> ---
> >       >>>>>> This is an RFC to get the feeling of the community about
> the name
> >       >>>>>> change, for now it's everything in one patch just to see
> how it
> >       >>>>>> will look like, if there is interest on proceeding into it=
,
> I can
> >       >>>>>> split in more commit.
> >       >>>>>
> >       >>>>> Have you discussed this with Dan and Chris at all?  You
> haven't even
> >       >>>>> CC'd them.
> >       >>>>
> >       >>>> No, this rename idea started from a chat during the summit,
> anyway Julien
> >       >>>> promptly add them to the CC, because I forgot.
> >       >>>
> >       >>> No worries and thank you for considering and taking the time
> to do this RFC.
> >       >>> It is greatly appreciated that there is a strong willingness
> to have dom0less
> >       >>> and hyperlaunch merged.
> >       >>>
> >       >>>>>
> >       >>>>> While there is a lot of end-goal in common between the
> dom0less and
> >       >>>>> hyperlaunch, and that the name dom0less is deeply misleadin=
g,
> >       >>>>> hyperlaunch is specifically not this.
> >       >>>>
> >       >>>> Yes Hyperlaunch is more than this, however as I said, with
> this RFC I would
> >       >>>> like
> >       >>>> to ear opinions, @Daniel @Christopher could it be a proper
> name for the
> >       >>>> dom0less
> >       >>>> feature?
> >       >>>
> >       >>> As Andy has alluded, hyperlaunch is meant to provide a
> flexible means to
> >       >>> handle domain construction at boot to meet a wide range of
> possible use cases.
> >       >>> One of those use cases is dom0less, so yes, ultimately what
> dom0less does
> >       >>> today will be achievable under hyperlaunch. Our intended
> approach to align the
> >       >>> two implementations is one that is meant to be minimally
> disruptive, since
> >       >>> dom0less is considered a supported (SUPPORT.md) capability. A=
s
> mentioned, we
> >       >>> are greatly appreciative to the openness to adopt the name,
> >       >>
> >       >> Thanks Daniel!
> >       >>
> >       >>
> >       >>> but a big concern
> >       >>> I personally have is the confusion it could cause a general
> user. A blanket
> >       >>> rename would end up with two documents in the docs tree that
> provide two
> >       >>> different explanations of hyperlaunch and two different devic=
e
> tree
> >       >>> definitions. So I think a more measured approach should be
> considered here.
> >       >>>
> >       >>>> If this patch makes things more difficult for the Hyperlunch
> serie, I=E2=80=99m ok
> >       >>>> to drop it,
> >       >>>> my only aim was just to find a less misleading name for the
> feature.
> >       >>>
> >       >>> What I would like to suggest as a good first step would be an
> update to the
> >       >>> dom0less document. Provide a note at the beginning that point=
s
> to the
> >       >>> hyperlaunch design doc as a more general approach that will
> eventually subsume
> >       >>> dom0less. This would provide a gentler transition for exist
> users of dom0less.
> >       >>>
> >       >>> If it is not too much, I would also ask, please have a look a=
t
> the design for
> >       >>> boot modules in the series Christopher just posted. The desig=
n
> pulls from the
> >       >>> work done by dom0less and expanded upon it. I major step into
> merging the two
> >       >>> capabilities will be to have a common set of structures. Once
> those are in
> >       >>> place, we can move to a common device tree representation, an=
d
> at that point
> >       >>> we would be fairly close, if not at the point of a formal
> merger of between
> >       >>> the two.
> >       >>
> >       >> At the moment we have a concrete problem with explaining
> dom0less and
> >       >> hyperlaunch to potential new users. Using two different names
> for a
> >       >> similar feature on arm and x86 causes confusion. It is hurting
> Xen as a
> >       >> solution. Personally I already had to switch to use the word
> >       >> "hyperlaunch" for everything in my users-facing presentations.
> >       >>
> >       >> At the summit, we discussed that it would be a good idea to us=
e
> a single
> >       >> name to refer to both features on arm and x86. Given that
> "dom0less"
> >       >> causes additional issues because it makes people think that
> there is no
> >       >> Dom0, the suggestion was to use "hyperlaunch" to refer to both
> features.
> >       >>
> >       >> We don't need to 100% align the two implementations and data
> structures.
> >       >> This is not for engineers that are going to look at the
> specifications
> >       >> and improve them. This is for users/customers of Xen that are
> trying to
> >       >> understand what the hypervisor enables them to do. We need to
> be able to
> >       >> show users architecture slides with the same name and
> explanation on
> >       >> both ARM and x86.
> >       >>
> >       >> I am sure that Daniel and Christopher remember, but for the
> others on
> >       >> this email thread, the name "hyperlaunch" was born exactly to
> be that:
> >       >> the one name to cover both features on ARM and x86 even if the=
y
> have a
> >       >> different implementation. Appended an old email for reference.
> >       >>
> >       >> Also I agree with Daniel that we need to be careful about the
> two docs
> >       >> under docs/. I think he is right we need to add a paragraph
> explaining
> >       >> the history and a pointer to the other document. Something lik=
e:
> >       >>
> >       >> "Dom0less is the name that was used when initially introducing
> the
> >       >> feature on ARM. Then, the "dom0less" name was retired in favor
> of
> >       >> "hyperlaunch" to avoid confusion (a Dom0 might still be
> present) and to
> >       >> align with x86 (where a similar feature was called hyperlaunch
> from the
> >       >> start)."
> >       >
> >       > I=E2=80=99m fully ok to add a section like this pointing to the
> Hyperlaunch design.
> >
> >       _If_ this text is added, please include links/references to the
> Hyperlaunch wiki page and Hyperlaunch design docs.
> >
> >       > @Daniel and @Christopher would it be ok for you or the changes
> in the serie
> >       > are going to be problematic for your future work? In the end
> it=E2=80=99s just a mechanical
> >       > rename, so I guess we just need to agree on naming conventions.
> >
> >       Please see the history of trademark litigation about the use of
> symbolic names to reference similar-but-different artifacts.
> >       It is much easier to use the same name to refer to entirely
> different objects. Historically, confusion arises when a name is
> >       used in similar contexts.
> >
> >       There is also versioning.  Could we refer to dom0less as
> "Hyperlaunch Version -1"?
> >
> >       How about renaming dom0less to "Hyperlaunch Lite"?
> >
> >
> > Perhaps it would be helpful if you could explain more clearly your
> concerns.  I take it that you want a name which can be used specifically
> > to indicate the full "domB measured boot" functionality that was Daniel
> and Christopher's original goal, and that you're afraid that using
> > plain "Hyperlaunch" for only the "start VMs from Xen on boot"
> functionality will dilute that?
> >
> > The "start VMs from Xen on boot" functionality is the *only* thing that
> a big chunk of the users of this functionality want;  referring to
> > it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the value o=
f
> the functionality.
> >
> > What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured Boot" t=
o
> refer to the full measured boot functionality?
>
> I think this is the best way.
>
>
> > Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tree"
> (without the involvement of a domB), "Hyperlaunch Boot Domain /
> > Hyperlaunch domB" for a more general "domB" functionality, and
> "Hyperlaunch Measured Boot" for the full functionality (assuming there's
> > more to this than simply having a domB involved)?
>
>
> We need an overarching name to cover the feature "start VMs from Xen on
> boot" on both ARM and x86. From my understanding and from the original
> emails on the subject, the name "hyperlaunch" was it.
>

Sure; but think "guitar" vs "acoustic guitar" vs "electric guitar".
"Electric guitar" is new, "guitar" covers them both, but you sometimes need
a way to specify "acoustic".  Right now target configurations we're talking
about include:

1. Booting all your domains directly from Xen using DT configurations
2. Booting a domB, which then executes some more complicated programmatic
configuration to launch VMs before disappearing
3. Doing full measured boot on the whole system using a domB.

If "Hyperlaunch" means 1-3, we not only need a way to specify that you're
talking about 3, but *also* a way to specify that you're talking about 1.
In the vast majority of cases for the foreseeable future are going to be
1.  Additionally, we want to make sure that "Hyperlaunch" *actually* turns
out to mean 1-3, and not just 1.

The thing I like about "Hyperlaunch DT" is that to me it sounds pretty cool
but also is very descriptive: I haven't talked to people building these
systems, but it seems like saying, "The hypervisor launches VMs based on a
Device Tree passed to it at boot" will be immediately understood, and stick
in people's minds.

So maybe informally, or in "short usage" use "Hyperlaunch", but in
documentation or reference systems, when talking specifically about #1, try
to use "Hyperlaunch DT", just to reinforce the idea that there's more to
Hyperlaunch that's coming down the road?

 -George

--00000000000097d3ab05ffce9a1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 5, 2023 at 11:14=E2=80=AF=
PM Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabellini@amd.com">ste=
fano.stabellini@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Wed, 5 Jul 2023, George Dunlap wrote:<br>
&gt; On Mon, Jul 3, 2023 at 9:55=E2=80=AFPM P S &lt;<a href=3D"mailto:pairs=
pace@gmail.com" target=3D"_blank">pairspace@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Jul 3, 2023, at 15:45, Luca Fancellu=
 &lt;<a href=3D"mailto:luca.fancellu@arm.com" target=3D"_blank">luca.fancel=
lu@arm.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=EF=BB=BF&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; On 3 Jul 2023, at 18:48, Stefano St=
abellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">ss=
tabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; On Mon, 3 Jul 2023, Daniel P. S=
mith wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; On 7/1/23 11:13, Luca Fancellu =
wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; On 1 Jul 2023, at 08:53=
, Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"=
_blank">andrew.cooper3@citrix.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; On 30/06/2023 10:12 am,=
 Luca Fancellu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; The &quot;dom0less&=
quot; feature was intended to be the feature where a domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; domain could be lau=
nched without the control domain (Dom0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; intervention, howev=
er the name seems to suggest that Dom0 cannot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; be part of the conf=
iguration, while instead it&#39;s a possible use case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; To avoid that, rena=
me the &quot;dom0less&quot; configuration with the name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; &quot;hyperlaunch&q=
uot;, that is less misleading.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Luca=
 Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.com" target=3D"_blank">lu=
ca.fancellu@arm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; This is an RFC to g=
et the feeling of the community about the name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; change, for now it&=
#39;s everything in one patch just to see how it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; will look like, if =
there is interest on proceeding into it, I can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;&gt; split in more commi=
t.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; Have you discussed this=
 with Dan and Chris at all?=C2=A0 You haven&#39;t even<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; CC&#39;d them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; No, this rename idea starte=
d from a chat during the summit, anyway Julien<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; promptly add them to the CC=
, because I forgot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; No worries and thank you for co=
nsidering and taking the time to do this RFC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; It is greatly appreciated that =
there is a strong willingness to have dom0less<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; and hyperlaunch merged.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; While there is a lot of=
 end-goal in common between the dom0less and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; hyperlaunch, and that t=
he name dom0less is deeply misleading,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; hyperlaunch is specific=
ally not this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Yes Hyperlaunch is more tha=
n this, however as I said, with this RFC I would<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; like<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; to ear opinions, @Daniel @C=
hristopher could it be a proper name for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; dom0less<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; feature?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; As Andy has alluded, hyperlaunc=
h is meant to provide a flexible means to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; handle domain construction at b=
oot to meet a wide range of possible use cases.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; One of those use cases is dom0l=
ess, so yes, ultimately what dom0less does<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; today will be achievable under =
hyperlaunch. Our intended approach to align the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; two implementations is one that=
 is meant to be minimally disruptive, since<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; dom0less is considered a suppor=
ted (SUPPORT.md) capability. As mentioned, we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; are greatly appreciative to the=
 openness to adopt the name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Thanks Daniel!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; but a big concern<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; I personally have is the confus=
ion it could cause a general user. A blanket<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; rename would end up with two do=
cuments in the docs tree that provide two<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; different explanations of hyper=
launch and two different device tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; definitions. So I think a more =
measured approach should be considered here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; If this patch makes things =
more difficult for the Hyperlunch serie, I=E2=80=99m ok<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; to drop it,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; my only aim was just to fin=
d a less misleading name for the feature.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; What I would like to suggest as=
 a good first step would be an update to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; dom0less document. Provide a no=
te at the beginning that points to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; hyperlaunch design doc as a mor=
e general approach that will eventually subsume<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; dom0less. This would provide a =
gentler transition for exist users of dom0less.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; If it is not too much, I would =
also ask, please have a look at the design for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; boot modules in the series Chri=
stopher just posted. The design pulls from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; work done by dom0less and expan=
ded upon it. I major step into merging the two<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; capabilities will be to have a =
common set of structures. Once those are in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; place, we can move to a common =
device tree representation, and at that point<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; we would be fairly close, if no=
t at the point of a formal merger of between<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; the two.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; At the moment we have a concrete pr=
oblem with explaining dom0less and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; hyperlaunch to potential new users.=
 Using two different names for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; similar feature on arm and x86 caus=
es confusion. It is hurting Xen as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; solution. Personally I already had =
to switch to use the word<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &quot;hyperlaunch&quot; for everyth=
ing in my users-facing presentations.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; At the summit, we discussed that it=
 would be a good idea to use a single<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; name to refer to both features on a=
rm and x86. Given that &quot;dom0less&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; causes additional issues because it=
 makes people think that there is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Dom0, the suggestion was to use &qu=
ot;hyperlaunch&quot; to refer to both features.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; We don&#39;t need to 100% align the=
 two implementations and data structures.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; This is not for engineers that are =
going to look at the specifications<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; and improve them. This is for users=
/customers of Xen that are trying to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; understand what the hypervisor enab=
les them to do. We need to be able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; show users architecture slides with=
 the same name and explanation on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; both ARM and x86.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; I am sure that Daniel and Christoph=
er remember, but for the others on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; this email thread, the name &quot;h=
yperlaunch&quot; was born exactly to be that:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; the one name to cover both features=
 on ARM and x86 even if they have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; different implementation. Appended =
an old email for reference.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Also I agree with Daniel that we ne=
ed to be careful about the two docs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; under docs/. I think he is right we=
 need to add a paragraph explaining<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; the history and a pointer to the ot=
her document. Something like:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &quot;Dom0less is the name that was=
 used when initially introducing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; feature on ARM. Then, the &quot;dom=
0less&quot; name was retired in favor of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &quot;hyperlaunch&quot; to avoid co=
nfusion (a Dom0 might still be present) and to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; align with x86 (where a similar fea=
ture was called hyperlaunch from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; start).&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I=E2=80=99m fully ok to add a section l=
ike this pointing to the Hyperlaunch design.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_If_ this text is added, please include link=
s/references to the Hyperlaunch wiki page and Hyperlaunch design docs.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @Daniel and @Christopher would it be ok=
 for you or the changes in the serie<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; are going to be problematic for your fu=
ture work? In the end it=E2=80=99s just a mechanical<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; rename, so I guess we just need to agre=
e on naming conventions.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Please see the history of trademark litigati=
on about the use of symbolic names to reference similar-but-different artif=
acts.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0It is much easier to use the same name to re=
fer to entirely different objects. Historically, confusion arises when a na=
me is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0used in similar contexts.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0There is also versioning.=C2=A0 Could we ref=
er to dom0less as &quot;Hyperlaunch Version -1&quot;?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0How about renaming dom0less to &quot;Hyperla=
unch Lite&quot;?<br>
&gt; <br>
&gt; <br>
&gt; Perhaps it would be helpful if you could explain more clearly your con=
cerns.=C2=A0 I take it that you want a name which can be used specifically<=
br>
&gt; to indicate the full &quot;domB measured boot&quot; functionality that=
 was Daniel and Christopher&#39;s original goal, and that you&#39;re afraid=
 that using<br>
&gt; plain &quot;Hyperlaunch&quot; for only the &quot;start VMs from Xen on=
 boot&quot; functionality will dilute that?<br>
&gt; <br>
&gt; The &quot;start VMs from Xen on boot&quot; functionality is the *only*=
 thing that a big chunk of the users of this functionality want;=C2=A0 refe=
rring to<br>
&gt; it as &quot;Hyperlaunch Lite&quot; or &quot;Hyperlaunch -1&quot; will =
undermine the value of the functionality.<br>
&gt; <br>
&gt; What if we use &quot;Measured Hyperlaunch&quot;, or &quot;Hyperlaunch =
Measured Boot&quot; to refer to the full measured boot functionality?<br>
<br>
I think this is the best way.<br>
<br>
<br>
&gt; Or, &quot;Hyperlaunch DT&quot; for &quot;Booting VMs from Xen using De=
vice Tree&quot; (without the involvement of a domB), &quot;Hyperlaunch Boot=
 Domain /<br>
&gt; Hyperlaunch domB&quot; for a more general &quot;domB&quot; functionali=
ty, and &quot;Hyperlaunch Measured Boot&quot; for the full functionality (a=
ssuming there&#39;s<br>
&gt; more to this than simply having a domB involved)?<br>
<br>
<br>
We need an overarching name to cover the feature &quot;start VMs from Xen o=
n<br>
boot&quot; on both ARM and x86. From my understanding and from the original=
<br>
emails on the subject, the name &quot;hyperlaunch&quot; was it.<br></blockq=
uote><div><br></div><div>Sure; but think &quot;guitar&quot; vs &quot;acoust=
ic guitar&quot; vs &quot;electric guitar&quot;.=C2=A0 &quot;Electric guitar=
&quot; is new, &quot;guitar&quot; covers them both, but you sometimes need =
a way to specify &quot;acoustic&quot;.=C2=A0 Right now target configuration=
s we&#39;re talking about include:</div><div><br></div><div>1. Booting all =
your domains directly from Xen using DT configurations</div><div>2. Booting=
 a domB, which then executes some more complicated programmatic configurati=
on to launch VMs before disappearing</div><div>3. Doing full measured boot =
on the whole system using a domB.</div><div><br></div><div>If &quot;Hyperla=
unch&quot; means 1-3, we not only need a way to specify that you&#39;re tal=
king about 3, but *also* a way to specify that you&#39;re talking about 1.=
=C2=A0 In the vast majority of cases for the foreseeable future are=C2=A0go=
ing to be 1.=C2=A0 Additionally, we want to make sure that &quot;Hyperlaunc=
h&quot; *actually* turns out to mean 1-3, and not just 1.</div><div><br></d=
iv><div>The thing I like about &quot;Hyperlaunch DT&quot; is that to me it =
sounds pretty cool but also is very descriptive: I haven&#39;t talked to pe=
ople building these systems, but it seems like saying, &quot;The hypervisor=
 launches VMs based on a Device Tree passed to it at boot&quot; will be imm=
ediately understood, and stick in people&#39;s minds.</div><div><br></div><=
div>So maybe informally, or in &quot;short usage&quot; use &quot;Hyperlaunc=
h&quot;, but in documentation or reference systems, when talking specifical=
ly about #1, try to use &quot;Hyperlaunch DT&quot;, just to reinforce the i=
dea that there&#39;s more to Hyperlaunch that&#39;s coming down the road?</=
div><div><br></div><div>=C2=A0-George</div></div></div>

--00000000000097d3ab05ffce9a1d--

