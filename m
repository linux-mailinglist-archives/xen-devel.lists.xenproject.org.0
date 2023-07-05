Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7F748663
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559255.874088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3Xy-0007tZ-HT; Wed, 05 Jul 2023 14:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559255.874088; Wed, 05 Jul 2023 14:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3Xy-0007rt-EL; Wed, 05 Jul 2023 14:31:58 +0000
Received: by outflank-mailman (input) for mailman id 559255;
 Wed, 05 Jul 2023 14:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rv0Z=CX=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qH3Xx-0007rl-KW
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:31:57 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b094f5a4-1b40-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:31:55 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso10990903e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 07:31:55 -0700 (PDT)
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
X-Inumbo-ID: b094f5a4-1b40-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688567514; x=1691159514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZYGWYPAfRB5K0sCUF/70UHdTu7iGcGN41Q1A4RW/NM=;
        b=cSB2kDWY6AueC+CAaiCkgwSzhnqoK7jmGEeVHi4k+aIDctcmOmYEDYDwEWm6RqpR4z
         7Z1k7ZcMDFdLCi+tu/baN7NqJ2Q2TIFtqe9vrSbwMjr5kRoblQ1e42wKrJzyd9QPnuIe
         i22b18LjO7w0fcgYWS+qY5ux8HH7xCoSRc4QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688567514; x=1691159514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZYGWYPAfRB5K0sCUF/70UHdTu7iGcGN41Q1A4RW/NM=;
        b=j92OpdWvbwch6Y0loTg1+34Hm4lqYJwCtmVNN3I+PANborKSPPAgpcq7v91T1VyxWc
         aGPhLz6mNQsd7oyEL0aCk0fTWO/JCTwQm4xiKD4ZCPw69pH15ZIufPro3jqQMboRRhWU
         xX5+4x9y2WCC5fq4riAJCR/0wePcVkwY5AC+JeYYuBHzbPUmHOpN0O3P2LeL6AY5HEQ0
         S5rtT/4a7jWcGes5F2eVO01VnwGCy6hAEH/3WGNd8V52YsWA5ptM7nf8tuzkT4npy1rk
         B87hlAjEHwLPSq0j1AhzTwA/9vnyTXkZTSE2H333YXf3kMHi2tIkD8wBdDp7ThM8FHt6
         qq6A==
X-Gm-Message-State: ABy/qLZw6BecAfQ/lKuQ++zOiovJYzd9wFlMg7+YtVdNajrKo8nyT8BR
	56KgH99ENMdZgLELdwDuUyOXT+yfA0gM8IhXsU2Lsg==
X-Google-Smtp-Source: APBJJlEtX/0mPSGvMYE9w/MmNB4jyFS1mDcOrpIX3kR1flQCukMFjFHMIyYek/PghdiGRv7aZ+ztzbcEeXTx88PTq6Q=
X-Received: by 2002:a05:6512:285:b0:4fb:82d8:994f with SMTP id
 j5-20020a056512028500b004fb82d8994fmr10966476lfp.33.1688567514363; Wed, 05
 Jul 2023 07:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com> <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
In-Reply-To: <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 5 Jul 2023 15:31:43 +0100
Message-ID: <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
To: P S <pairspace@gmail.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, 
	Community Manager <community.manager@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000df8c5505ffbe4238"

--000000000000df8c5505ffbe4238
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 9:55=E2=80=AFPM P S <pairspace@gmail.com> wrote:

>
>
> > On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@arm.com> wrote:
> >
> > =EF=BB=BF
> >
> >> On 3 Jul 2023, at 18:48, Stefano Stabellini <sstabellini@kernel.org>
> wrote:
> >>
> >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
> >>> On 7/1/23 11:13, Luca Fancellu wrote:
> >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com>
> wrote:
> >>>>>
> >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
> >>>>>> The "dom0less" feature was intended to be the feature where a domU
> >>>>>> domain could be launched without the control domain (Dom0)
> >>>>>> intervention, however the name seems to suggest that Dom0 cannot
> >>>>>> be part of the configuration, while instead it's a possible use
> case.
> >>>>>>
> >>>>>> To avoid that, rename the "dom0less" configuration with the name
> >>>>>> "hyperlaunch", that is less misleading.
> >>>>>>
> >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >>>>>> ---
> >>>>>> This is an RFC to get the feeling of the community about the name
> >>>>>> change, for now it's everything in one patch just to see how it
> >>>>>> will look like, if there is interest on proceeding into it, I can
> >>>>>> split in more commit.
> >>>>>
> >>>>> Have you discussed this with Dan and Chris at all?  You haven't eve=
n
> >>>>> CC'd them.
> >>>>
> >>>> No, this rename idea started from a chat during the summit, anyway
> Julien
> >>>> promptly add them to the CC, because I forgot.
> >>>
> >>> No worries and thank you for considering and taking the time to do
> this RFC.
> >>> It is greatly appreciated that there is a strong willingness to have
> dom0less
> >>> and hyperlaunch merged.
> >>>
> >>>>>
> >>>>> While there is a lot of end-goal in common between the dom0less and
> >>>>> hyperlaunch, and that the name dom0less is deeply misleading,
> >>>>> hyperlaunch is specifically not this.
> >>>>
> >>>> Yes Hyperlaunch is more than this, however as I said, with this RFC =
I
> would
> >>>> like
> >>>> to ear opinions, @Daniel @Christopher could it be a proper name for
> the
> >>>> dom0less
> >>>> feature?
> >>>
> >>> As Andy has alluded, hyperlaunch is meant to provide a flexible means
> to
> >>> handle domain construction at boot to meet a wide range of possible
> use cases.
> >>> One of those use cases is dom0less, so yes, ultimately what dom0less
> does
> >>> today will be achievable under hyperlaunch. Our intended approach to
> align the
> >>> two implementations is one that is meant to be minimally disruptive,
> since
> >>> dom0less is considered a supported (SUPPORT.md) capability. As
> mentioned, we
> >>> are greatly appreciative to the openness to adopt the name,
> >>
> >> Thanks Daniel!
> >>
> >>
> >>> but a big concern
> >>> I personally have is the confusion it could cause a general user. A
> blanket
> >>> rename would end up with two documents in the docs tree that provide
> two
> >>> different explanations of hyperlaunch and two different device tree
> >>> definitions. So I think a more measured approach should be considered
> here.
> >>>
> >>>> If this patch makes things more difficult for the Hyperlunch serie,
> I=E2=80=99m ok
> >>>> to drop it,
> >>>> my only aim was just to find a less misleading name for the feature.
> >>>
> >>> What I would like to suggest as a good first step would be an update
> to the
> >>> dom0less document. Provide a note at the beginning that points to the
> >>> hyperlaunch design doc as a more general approach that will eventuall=
y
> subsume
> >>> dom0less. This would provide a gentler transition for exist users of
> dom0less.
> >>>
> >>> If it is not too much, I would also ask, please have a look at the
> design for
> >>> boot modules in the series Christopher just posted. The design pulls
> from the
> >>> work done by dom0less and expanded upon it. I major step into merging
> the two
> >>> capabilities will be to have a common set of structures. Once those
> are in
> >>> place, we can move to a common device tree representation, and at tha=
t
> point
> >>> we would be fairly close, if not at the point of a formal merger of
> between
> >>> the two.
> >>
> >> At the moment we have a concrete problem with explaining dom0less and
> >> hyperlaunch to potential new users. Using two different names for a
> >> similar feature on arm and x86 causes confusion. It is hurting Xen as =
a
> >> solution. Personally I already had to switch to use the word
> >> "hyperlaunch" for everything in my users-facing presentations.
> >>
> >> At the summit, we discussed that it would be a good idea to use a sing=
le
> >> name to refer to both features on arm and x86. Given that "dom0less"
> >> causes additional issues because it makes people think that there is n=
o
> >> Dom0, the suggestion was to use "hyperlaunch" to refer to both feature=
s.
> >>
> >> We don't need to 100% align the two implementations and data structure=
s.
> >> This is not for engineers that are going to look at the specifications
> >> and improve them. This is for users/customers of Xen that are trying t=
o
> >> understand what the hypervisor enables them to do. We need to be able =
to
> >> show users architecture slides with the same name and explanation on
> >> both ARM and x86.
> >>
> >> I am sure that Daniel and Christopher remember, but for the others on
> >> this email thread, the name "hyperlaunch" was born exactly to be that:
> >> the one name to cover both features on ARM and x86 even if they have a
> >> different implementation. Appended an old email for reference.
> >>
> >> Also I agree with Daniel that we need to be careful about the two docs
> >> under docs/. I think he is right we need to add a paragraph explaining
> >> the history and a pointer to the other document. Something like:
> >>
> >> "Dom0less is the name that was used when initially introducing the
> >> feature on ARM. Then, the "dom0less" name was retired in favor of
> >> "hyperlaunch" to avoid confusion (a Dom0 might still be present) and t=
o
> >> align with x86 (where a similar feature was called hyperlaunch from th=
e
> >> start)."
> >
> > I=E2=80=99m fully ok to add a section like this pointing to the Hyperla=
unch
> design.
>
> _If_ this text is added, please include links/references to the
> Hyperlaunch wiki page and Hyperlaunch design docs.
>
> > @Daniel and @Christopher would it be ok for you or the changes in the
> serie
> > are going to be problematic for your future work? In the end it=E2=80=
=99s just a
> mechanical
> > rename, so I guess we just need to agree on naming conventions.
>
> Please see the history of trademark litigation about the use of symbolic
> names to reference similar-but-different artifacts.  It is much easier to
> use the same name to refer to entirely different objects. Historically,
> confusion arises when a name is used in similar contexts.
>
> There is also versioning.  Could we refer to dom0less as "Hyperlaunch
> Version -1"?
>
> How about renaming dom0less to "Hyperlaunch Lite"?
>

Perhaps it would be helpful if you could explain more clearly your
concerns.  I take it that you want a name which can be used specifically to
indicate the full "domB measured boot" functionality that was Daniel and
Christopher's original goal, and that you're afraid that using plain
"Hyperlaunch" for only the "start VMs from Xen on boot" functionality will
dilute that?

The "start VMs from Xen on boot" functionality is the *only* thing that a
big chunk of the users of this functionality want;  referring to it as
"Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the value of the
functionality.

What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured Boot" to
refer to the full measured boot functionality?

Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tree" (without
the involvement of a domB), "Hyperlaunch Boot Domain / Hyperlaunch domB"
for a more general "domB" functionality, and "Hyperlaunch Measured Boot"
for the full functionality (assuming there's more to this than simply
having a domB involved)?

 -George




>
> Rich
>
> > Cheers,
> > Luca
> >
> >>
> >>
> >> ---
> >>
> >> Subject: [RFP] Overarching name for dom0less and DomB
> >>
> >> Greetings,
> >>
> >> At the DeviceTree/DomB meeting it was proposed that a new, larger
> >> overarching name under which DomB and dom0less would be covered. There
> >> was a general openness to the idea. As such, since Christopher and
> >> myself are in the midst of finalizing the design document for DomB we
> >> felt it might be better to see if a name could be selected which we
> >> could use in the design doc in lieu of DomB. As always naming things i=
s
> >> hard, but after some brainstorming we believe we have arrived at a
> >> decent name, =CE=BCLaunch (micro-Launch or uLaunch).
> >>
> >> ---
> >>
> >> =CE=BCLaunch became hyperlaunch few days after, and the rest was histo=
ry :-)
> >
> >
>

--000000000000df8c5505ffbe4238
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 3, 2023 at 9:55=E2=80=AFP=
M P S &lt;<a href=3D"mailto:pairspace@gmail.com">pairspace@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Jul 3, 2023, at 15:45, Luca Fancellu &lt;<a href=3D"mailto:luca.fan=
cellu@arm.com" target=3D"_blank">luca.fancellu@arm.com</a>&gt; wrote:<br>
&gt; <br>
&gt; =EF=BB=BF<br>
&gt; <br>
&gt;&gt; On 3 Jul 2023, at 18:48, Stefano Stabellini &lt;<a href=3D"mailto:=
sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wr=
ote:<br>
&gt;&gt; <br>
&gt;&gt;&gt; On Mon, 3 Jul 2023, Daniel P. Smith wrote:<br>
&gt;&gt;&gt; On 7/1/23 11:13, Luca Fancellu wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 1 Jul 2023, at 08:53, Andrew Cooper &lt;<a href=3D"=
mailto:andrew.cooper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.c=
om</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; On 30/06/2023 10:12 am, Luca Fancellu wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; The &quot;dom0less&quot; feature was intended to b=
e the feature where a domU<br>
&gt;&gt;&gt;&gt;&gt;&gt; domain could be launched without the control domai=
n (Dom0)<br>
&gt;&gt;&gt;&gt;&gt;&gt; intervention, however the name seems to suggest th=
at Dom0 cannot<br>
&gt;&gt;&gt;&gt;&gt;&gt; be part of the configuration, while instead it&#39=
;s a possible use case.<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; To avoid that, rename the &quot;dom0less&quot; con=
figuration with the name<br>
&gt;&gt;&gt;&gt;&gt;&gt; &quot;hyperlaunch&quot;, that is less misleading.<=
br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Luca Fancellu &lt;<a href=3D"mailto=
:luca.fancellu@arm.com" target=3D"_blank">luca.fancellu@arm.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt; This is an RFC to get the feeling of the community=
 about the name<br>
&gt;&gt;&gt;&gt;&gt;&gt; change, for now it&#39;s everything in one patch j=
ust to see how it<br>
&gt;&gt;&gt;&gt;&gt;&gt; will look like, if there is interest on proceeding=
 into it, I can<br>
&gt;&gt;&gt;&gt;&gt;&gt; split in more commit.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Have you discussed this with Dan and Chris at all?=C2=
=A0 You haven&#39;t even<br>
&gt;&gt;&gt;&gt;&gt; CC&#39;d them.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; No, this rename idea started from a chat during the summit=
, anyway Julien<br>
&gt;&gt;&gt;&gt; promptly add them to the CC, because I forgot.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; No worries and thank you for considering and taking the time t=
o do this RFC.<br>
&gt;&gt;&gt; It is greatly appreciated that there is a strong willingness t=
o have dom0less<br>
&gt;&gt;&gt; and hyperlaunch merged.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; While there is a lot of end-goal in common between the=
 dom0less and<br>
&gt;&gt;&gt;&gt;&gt; hyperlaunch, and that the name dom0less is deeply misl=
eading,<br>
&gt;&gt;&gt;&gt;&gt; hyperlaunch is specifically not this.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Yes Hyperlaunch is more than this, however as I said, with=
 this RFC I would<br>
&gt;&gt;&gt;&gt; like<br>
&gt;&gt;&gt;&gt; to ear opinions, @Daniel @Christopher could it be a proper=
 name for the<br>
&gt;&gt;&gt;&gt; dom0less<br>
&gt;&gt;&gt;&gt; feature?<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; As Andy has alluded, hyperlaunch is meant to provide a flexibl=
e means to<br>
&gt;&gt;&gt; handle domain construction at boot to meet a wide range of pos=
sible use cases.<br>
&gt;&gt;&gt; One of those use cases is dom0less, so yes, ultimately what do=
m0less does<br>
&gt;&gt;&gt; today will be achievable under hyperlaunch. Our intended appro=
ach to align the<br>
&gt;&gt;&gt; two implementations is one that is meant to be minimally disru=
ptive, since<br>
&gt;&gt;&gt; dom0less is considered a supported (SUPPORT.md) capability. As=
 mentioned, we<br>
&gt;&gt;&gt; are greatly appreciative to the openness to adopt the name,<br=
>
&gt;&gt; <br>
&gt;&gt; Thanks Daniel!<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt;&gt; but a big concern<br>
&gt;&gt;&gt; I personally have is the confusion it could cause a general us=
er. A blanket<br>
&gt;&gt;&gt; rename would end up with two documents in the docs tree that p=
rovide two<br>
&gt;&gt;&gt; different explanations of hyperlaunch and two different device=
 tree<br>
&gt;&gt;&gt; definitions. So I think a more measured approach should be con=
sidered here.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; If this patch makes things more difficult for the Hyperlun=
ch serie, I=E2=80=99m ok<br>
&gt;&gt;&gt;&gt; to drop it,<br>
&gt;&gt;&gt;&gt; my only aim was just to find a less misleading name for th=
e feature.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; What I would like to suggest as a good first step would be an =
update to the<br>
&gt;&gt;&gt; dom0less document. Provide a note at the beginning that points=
 to the<br>
&gt;&gt;&gt; hyperlaunch design doc as a more general approach that will ev=
entually subsume<br>
&gt;&gt;&gt; dom0less. This would provide a gentler transition for exist us=
ers of dom0less.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; If it is not too much, I would also ask, please have a look at=
 the design for<br>
&gt;&gt;&gt; boot modules in the series Christopher just posted. The design=
 pulls from the<br>
&gt;&gt;&gt; work done by dom0less and expanded upon it. I major step into =
merging the two<br>
&gt;&gt;&gt; capabilities will be to have a common set of structures. Once =
those are in<br>
&gt;&gt;&gt; place, we can move to a common device tree representation, and=
 at that point<br>
&gt;&gt;&gt; we would be fairly close, if not at the point of a formal merg=
er of between<br>
&gt;&gt;&gt; the two.<br>
&gt;&gt; <br>
&gt;&gt; At the moment we have a concrete problem with explaining dom0less =
and<br>
&gt;&gt; hyperlaunch to potential new users. Using two different names for =
a<br>
&gt;&gt; similar feature on arm and x86 causes confusion. It is hurting Xen=
 as a<br>
&gt;&gt; solution. Personally I already had to switch to use the word<br>
&gt;&gt; &quot;hyperlaunch&quot; for everything in my users-facing presenta=
tions.<br>
&gt;&gt; <br>
&gt;&gt; At the summit, we discussed that it would be a good idea to use a =
single<br>
&gt;&gt; name to refer to both features on arm and x86. Given that &quot;do=
m0less&quot;<br>
&gt;&gt; causes additional issues because it makes people think that there =
is no<br>
&gt;&gt; Dom0, the suggestion was to use &quot;hyperlaunch&quot; to refer t=
o both features.<br>
&gt;&gt; <br>
&gt;&gt; We don&#39;t need to 100% align the two implementations and data s=
tructures.<br>
&gt;&gt; This is not for engineers that are going to look at the specificat=
ions<br>
&gt;&gt; and improve them. This is for users/customers of Xen that are tryi=
ng to<br>
&gt;&gt; understand what the hypervisor enables them to do. We need to be a=
ble to<br>
&gt;&gt; show users architecture slides with the same name and explanation =
on<br>
&gt;&gt; both ARM and x86.<br>
&gt;&gt; <br>
&gt;&gt; I am sure that Daniel and Christopher remember, but for the others=
 on<br>
&gt;&gt; this email thread, the name &quot;hyperlaunch&quot; was born exact=
ly to be that:<br>
&gt;&gt; the one name to cover both features on ARM and x86 even if they ha=
ve a<br>
&gt;&gt; different implementation. Appended an old email for reference.<br>
&gt;&gt; <br>
&gt;&gt; Also I agree with Daniel that we need to be careful about the two =
docs<br>
&gt;&gt; under docs/. I think he is right we need to add a paragraph explai=
ning<br>
&gt;&gt; the history and a pointer to the other document. Something like:<b=
r>
&gt;&gt; <br>
&gt;&gt; &quot;Dom0less is the name that was used when initially introducin=
g the<br>
&gt;&gt; feature on ARM. Then, the &quot;dom0less&quot; name was retired in=
 favor of<br>
&gt;&gt; &quot;hyperlaunch&quot; to avoid confusion (a Dom0 might still be =
present) and to<br>
&gt;&gt; align with x86 (where a similar feature was called hyperlaunch fro=
m the<br>
&gt;&gt; start).&quot;<br>
&gt; <br>
&gt; I=E2=80=99m fully ok to add a section like this pointing to the Hyperl=
aunch design.<br>
<br>
_If_ this text is added, please include links/references to the Hyperlaunch=
 wiki page and Hyperlaunch design docs.<br>
<br>
&gt; @Daniel and @Christopher would it be ok for you or the changes in the =
serie<br>
&gt; are going to be problematic for your future work? In the end it=E2=80=
=99s just a mechanical<br>
&gt; rename, so I guess we just need to agree on naming conventions.<br>
<br>
Please see the history of trademark litigation about the use of symbolic na=
mes to reference similar-but-different artifacts.=C2=A0 It is much easier t=
o use the same name to refer to entirely different objects. Historically, c=
onfusion arises when a name is used in similar contexts.<br>
<br>
There is also versioning.=C2=A0 Could we refer to dom0less as &quot;Hyperla=
unch Version -1&quot;? <br>
<br>
How about renaming dom0less to &quot;Hyperlaunch Lite&quot;?<br></blockquot=
e><div><br></div><div>Perhaps it would be helpful if you could explain more=
 clearly your concerns.=C2=A0 I take it that you want a name which can be u=
sed specifically to indicate the full &quot;domB measured boot&quot; functi=
onality that was Daniel and Christopher&#39;s original goal, and that you&#=
39;re afraid that using plain &quot;Hyperlaunch&quot; for only the &quot;st=
art VMs from Xen on boot&quot; functionality will dilute that?</div><div><b=
r></div><div><div>The &quot;start VMs from Xen on boot&quot; functionality =
is the *only* thing that a big chunk of the users of this functionality wan=
t;=C2=A0 referring to it as &quot;Hyperlaunch Lite&quot; or &quot;Hyperlaun=
ch -1&quot; will undermine the value of the functionality.</div></div><div>=
<br></div><div>What if we use &quot;Measured Hyperlaunch&quot;, or &quot;Hy=
perlaunch Measured Boot&quot; to refer to the full measured boot functional=
ity?</div><div><br></div><div>Or, &quot;Hyperlaunch DT&quot; for &quot;Boot=
ing VMs from Xen using Device Tree&quot; (without the involvement of a domB=
), &quot;Hyperlaunch Boot Domain / Hyperlaunch domB&quot; for a more genera=
l &quot;domB&quot; functionality, and &quot;Hyperlaunch Measured Boot&quot;=
 for the full functionality (assuming there&#39;s more to this than simply =
having a domB involved)?</div><div><br></div><div>=C2=A0-George</div><div><=
br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Rich<br>
<br>
&gt; Cheers,<br>
&gt; Luca<br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; ---<br>
&gt;&gt; <br>
&gt;&gt; Subject: [RFP] Overarching name for dom0less and DomB<br>
&gt;&gt; <br>
&gt;&gt; Greetings,<br>
&gt;&gt; <br>
&gt;&gt; At the DeviceTree/DomB meeting it was proposed that a new, larger<=
br>
&gt;&gt; overarching name under which DomB and dom0less would be covered. T=
here<br>
&gt;&gt; was a general openness to the idea. As such, since Christopher and=
<br>
&gt;&gt; myself are in the midst of finalizing the design document for DomB=
 we<br>
&gt;&gt; felt it might be better to see if a name could be selected which w=
e<br>
&gt;&gt; could use in the design doc in lieu of DomB. As always naming thin=
gs is<br>
&gt;&gt; hard, but after some brainstorming we believe we have arrived at a=
<br>
&gt;&gt; decent name, =CE=BCLaunch (micro-Launch or uLaunch).<br>
&gt;&gt; <br>
&gt;&gt; ---<br>
&gt;&gt; <br>
&gt;&gt; =CE=BCLaunch became hyperlaunch few days after, and the rest was h=
istory :-)<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--000000000000df8c5505ffbe4238--

