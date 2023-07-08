Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BEE74BB45
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 04:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560646.876726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHxIP-000110-Cu; Sat, 08 Jul 2023 02:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560646.876726; Sat, 08 Jul 2023 02:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHxIP-0000ym-8M; Sat, 08 Jul 2023 02:03:37 +0000
Received: by outflank-mailman (input) for mailman id 560646;
 Sat, 08 Jul 2023 02:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYjS=C2=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1qHxIN-0000yg-S0
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 02:03:36 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a344e42a-1d33-11ee-b237-6b7b168915f2;
 Sat, 08 Jul 2023 04:03:32 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bad0c4f6f50so3762692276.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 19:03:32 -0700 (PDT)
Received: from smtpclient.apple (static-198-54-130-88.cust.tzulo.com.
 [198.54.130.88]) by smtp.gmail.com with ESMTPSA id
 x37-20020a25a028000000b00c3ad527cba0sm1305242ybh.36.2023.07.07.19.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 19:03:29 -0700 (PDT)
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
X-Inumbo-ID: a344e42a-1d33-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688781811; x=1691373811;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S72pRScCJOdQzkJRWgbfet9M/DX2uLOf6TSuLy2sGLY=;
        b=aqBQ5c/syZzD9lboMwfTSFN8eCb3dizgNsw+GsMyb57acZLimI+o/KTRjiFNf/w7uv
         9r78HOpSMGuofnpfPaA/hwIQ6CgvBbYaU0Gu5PrgK0+6D8GKcGMTcsrtIwYorXBfhR35
         xoCr8cJ+uU+X/LnQ5nszQDc3yWPjrcKwIAwF7osOVMqG2ZUGb+txfdoK8HftEl6p44XR
         cHLQMzvkBJDiPe+T39oPzQg/N7NpyKcB35FFDrqrljfrPpKtvajdSb+TKizbpJlttCgy
         Wvc2NKa1zC1SduYpv3pJFqrloLvc7jQHRZE2Hz/ETT82sCIe8dym/Tr+opSTCWo12HUE
         kUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688781811; x=1691373811;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S72pRScCJOdQzkJRWgbfet9M/DX2uLOf6TSuLy2sGLY=;
        b=mGxecuZ/V6iRdfr062ejXjBiTA9UVsttZE0P/7yhSyOrTVqrf5+bxFdLOMJD9NhI6d
         kpM5/16NDSZf+sxWu35gZ7d0rBL993tQOOjbFVj1wNOdVRBdZPwia8oowazUnIApPg3H
         dsWymH2qsEK1qKIONxBLd9Duya043wbGMp40IB3Srhufr7CnlWd3aJCQvyZiAbpG+XFs
         5cAXzy3zmiK+yR3mY5OChnith0bVRZXQh37cJIj/9OTuSJ43jutjknwyH7z3ZmnDX7Hb
         HmoajmXGy7OsTlGkdhHBPiIwrRzG7DS0bJNc+g0fIrRu+FsRsaceCGY//4UixId/RHvm
         t0/g==
X-Gm-Message-State: ABy/qLa+6/EJuWGPrLKZ1XUEKUUe/cM+4Epk/iBv2a8+LOCsqANDhRRn
	kGFepLvBIvo9XWftQzfGxIY=
X-Google-Smtp-Source: APBJJlFVCCXVv+aAfNV7Fy5Hs7Kdw4gvS06e8DquAU1ZBtudKS9g/k8OCRIsx0NdruYOyuoXh3Ymuw==
X-Received: by 2002:a25:e753:0:b0:c6e:a92c:70e3 with SMTP id e80-20020a25e753000000b00c6ea92c70e3mr1926128ybh.31.1688781810691;
        Fri, 07 Jul 2023 19:03:30 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Date: Fri, 7 Jul 2023 22:03:18 -0400
Message-Id: <7486398B-AEAE-4199-8DF1-B713FEECD672@gmail.com>
References: <alpine.DEB.2.22.394.2307071814070.761183@ubuntu-linux-20-04-desktop>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <george.dunlap@cloud.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Rian Quinn <rianquinn@gmail.com>, Ian Jackson <iwj@xenproject.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Scott Davis <scott.davis@starlab.io>, Adam Fraser <adam@starlab.io>,
 Paul Durrant <paul@xen.org>, rsmith@riversideresearch.org,
 m.a.young@durham.ac.uk, Elliott Mitchell <ehem+xen@m5p.com>,
 openxt <openxt@googlegroups.com>, Jason Andryuk <jandryuk@gmail.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
In-Reply-To: <alpine.DEB.2.22.394.2307071814070.761183@ubuntu-linux-20-04-desktop>
To: Stefano Stabellini <stefano.stabellini@amd.com>
X-Mailer: iPad Mail (20F75)

On Jul 7, 2023, at 21:17, Stefano Stabellini <stefano.stabellini@amd.com> wr=
ote:
>=20
> =EF=BB=BFOn Fri, 7 Jul 2023, Christopher Clark wrote:
>> +CC openxt, Jason, Marek
>>=20
>> On Fri, Jul 7, 2023 at 2:06=E2=80=AFPM Christopher Clark <christopher.w.c=
lark@gmail.com> wrote:
>>      +CC members of the Hyperlaunch Working Group + participants on earli=
er Hyperlaunch threads
>>=20
>> On Thu, Jul 6, 2023 at 2:39=E2=80=AFPM Stefano Stabellini <stefano.stabel=
lini@amd.com> wrote:
>>>      On Thu, 6 Jul 2023, George Dunlap wrote:
>>>> On Wed, Jul 5, 2023 at 11:14=E2=80=AFPM Stefano Stabellini <stefano.sta=
bellini@amd.com> wrote:
>>>>        On Wed, 5 Jul 2023, George Dunlap wrote:
>>>        > On Mon, Jul 3, 2023 at 9:55=E2=80=AFPM P S <pairspace@gmail.com=
> wrote:
>>>        >       > On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@=
arm.com> wrote:
>>>        >       =EF=BB=BF>
>>>        >       >> On 3 Jul 2023, at 18:48, Stefano Stabellini <sstabelli=
ni@kernel.org> wrote:
>>>        >       >>
>>>        >       >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
>>>        >       >>> On 7/1/23 11:13, Luca Fancellu wrote:
>>>        >       >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.coop=
er3@citrix.com> wrote:
>>>        >       >>>>>
>>>        >       >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
>>>        >       >>>>>> The "dom0less" feature was intended to be the feat=
ure where a domU
>>>        >       >>>>>> domain could be launched without the control domai=
n (Dom0)
>>>        >       >>>>>> intervention, however the name seems to suggest th=
at Dom0 cannot
>>>        >       >>>>>> be part of the configuration, while instead it's a=
 possible use case.
>>>        >       >>>>>>
>>>        >       >>>>>> To avoid that, rename the "dom0less" configuration=
 with the name
>>>        >       >>>>>> "hyperlaunch", that is less misleading.
>>>        >       >>>>>>
>>>        >       >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.co=
m>
>>>        >       >>>>>> ---
>>>        >       >>>>>> This is an RFC to get the feeling of the community=
 about the name
>>>        >       >>>>>> change, for now it's everything in one patch just t=
o see how it
>>>        >       >>>>>> will look like, if there is interest on proceeding=
 into it, I can
>>>        >       >>>>>> split in more commit.
>>>        >       >>>>>
>>>        >       >>>>> Have you discussed this with Dan and Chris at all? =
 You haven't even
>>>        >       >>>>> CC'd them.
>>>        >       >>>>
>>>        >       >>>> No, this rename idea started from a chat during the s=
ummit, anyway Julien
>>>        >       >>>> promptly add them to the CC, because I forgot.
>>>        >       >>>
>>>        >       >>> No worries and thank you for considering and taking t=
he time to do this RFC.
>>>        >       >>> It is greatly appreciated that there is a strong will=
ingness to have dom0less
>>>        >       >>> and hyperlaunch merged.
>>>        >       >>>
>>>        >       >>>>>
>>>        >       >>>>> While there is a lot of end-goal in common between t=
he dom0less and
>>>        >       >>>>> hyperlaunch, and that the name dom0less is deeply m=
isleading,
>>>        >       >>>>> hyperlaunch is specifically not this.
>>>        >       >>>>
>>>        >       >>>> Yes Hyperlaunch is more than this, however as I said=
, with this RFC I would
>>>        >       >>>> like
>>>        >       >>>> to ear opinions, @Daniel @Christopher could it be a p=
roper name for the
>>>        >       >>>> dom0less
>>>        >       >>>> feature?
>>>        >       >>>
>>>        >       >>> As Andy has alluded, hyperlaunch is meant to provide a=
 flexible means to
>>>        >       >>> handle domain construction at boot to meet a wide ran=
ge of possible use cases.
>>>        >       >>> One of those use cases is dom0less, so yes, ultimatel=
y what dom0less does
>>>        >       >>> today will be achievable under hyperlaunch. Our inten=
ded approach to align the
>>>        >       >>> two implementations is one that is meant to be minima=
lly disruptive, since
>>>        >       >>> dom0less is considered a supported (SUPPORT.md) capab=
ility. As mentioned, we
>>>        >       >>> are greatly appreciative to the openness to adopt the=
 name,
>>>        >       >>
>>>        >       >> Thanks Daniel!
>>>        >       >>
>>>        >       >>
>>>        >       >>> but a big concern
>>>        >       >>> I personally have is the confusion it could cause a g=
eneral user. A blanket
>>>        >       >>> rename would end up with two documents in the docs tr=
ee that provide two
>>>        >       >>> different explanations of hyperlaunch and two differe=
nt device tree
>>>        >       >>> definitions. So I think a more measured approach shou=
ld be considered here.
>>>        >       >>>
>>>        >       >>>> If this patch makes things more difficult for the Hy=
perlunch serie, I=E2=80=99m ok
>>>        >       >>>> to drop it,
>>>        >       >>>> my only aim was just to find a less misleading name f=
or the feature.
>>>        >       >>>
>>>        >       >>> What I would like to suggest as a good first step wou=
ld be an update to the
>>>        >       >>> dom0less document. Provide a note at the beginning th=
at points to the
>>>        >       >>> hyperlaunch design doc as a more general approach tha=
t will eventually subsume
>>>        >       >>> dom0less. This would provide a gentler transition for=
 exist users of dom0less.
>>>        >       >>>
>>>        >       >>> If it is not too much, I would also ask, please have a=
 look at the design for
>>>        >       >>> boot modules in the series Christopher just posted. T=
he design pulls from the
>>>        >       >>> work done by dom0less and expanded upon it. I major s=
tep into merging the two
>>>        >       >>> capabilities will be to have a common set of structur=
es. Once those are in
>>>        >       >>> place, we can move to a common device tree representa=
tion, and at that point
>>>        >       >>> we would be fairly close, if not at the point of a fo=
rmal merger of between
>>>        >       >>> the two.
>>>        >       >>
>>>        >       >> At the moment we have a concrete problem with explaini=
ng dom0less and
>>>        >       >> hyperlaunch to potential new users. Using two differen=
t names for a
>>>        >       >> similar feature on arm and x86 causes confusion. It is=
 hurting Xen as a
>>>        >       >> solution. Personally I already had to switch to use th=
e word
>>>        >       >> "hyperlaunch" for everything in my users-facing presen=
tations.
>>>        >       >>
>>>        >       >> At the summit, we discussed that it would be a good id=
ea to use a single
>>>        >       >> name to refer to both features on arm and x86. Given t=
hat "dom0less"
>>>        >       >> causes additional issues because it makes people think=
 that there is no
>>>        >       >> Dom0, the suggestion was to use "hyperlaunch" to refer=
 to both features.
>>>        >       >>
>>>        >       >> We don't need to 100% align the two implementations an=
d data structures.
>>>        >       >> This is not for engineers that are going to look at th=
e specifications
>>>        >       >> and improve them. This is for users/customers of Xen t=
hat are trying to
>>>        >       >> understand what the hypervisor enables them to do. We n=
eed to be able to
>>>        >       >> show users architecture slides with the same name and e=
xplanation on
>>>        >       >> both ARM and x86.
>>>        >       >>
>>>        >       >> I am sure that Daniel and Christopher remember, but fo=
r the others on
>>>        >       >> this email thread, the name "hyperlaunch" was born exa=
ctly to be that:
>>>        >       >> the one name to cover both features on ARM and x86 eve=
n if they have a
>>>        >       >> different implementation. Appended an old email for re=
ference.
>>>        >       >>
>>>        >       >> Also I agree with Daniel that we need to be careful ab=
out the two docs
>>>        >       >> under docs/. I think he is right we need to add a para=
graph explaining
>>>        >       >> the history and a pointer to the other document. Somet=
hing like:
>>>        >       >>
>>>        >       >> "Dom0less is the name that was used when initially int=
roducing the
>>>        >       >> feature on ARM. Then, the "dom0less" name was retired i=
n favor of
>>>        >       >> "hyperlaunch" to avoid confusion (a Dom0 might still b=
e present) and to
>>>        >       >> align with x86 (where a similar feature was called hyp=
erlaunch from the
>>>        >       >> start)."
>>>        >       >
>>>        >       > I=E2=80=99m fully ok to add a section like this pointin=
g to the Hyperlaunch design.
>>>        >
>>>        >       _If_ this text is added, please include links/references t=
o the Hyperlaunch wiki page and Hyperlaunch
>>      design docs.
>>>        >
>>>        >       > @Daniel and @Christopher would it be ok for you or the c=
hanges in the serie
>>>        >       > are going to be problematic for your future work? In th=
e end it=E2=80=99s just a mechanical
>>>        >       > rename, so I guess we just need to agree on naming conv=
entions.
>>>        >
>>>        >       Please see the history of trademark litigation about the u=
se of symbolic names to reference
>>      similar-but-different
>>>        artifacts.=20
>>>        >       It is much easier to use the same name to refer to entire=
ly different objects. Historically, confusion
>>      arises when a
>>>        name is
>>>        >       used in similar contexts.
>>>        >
>>>        >       There is also versioning.  Could we refer to dom0less as "=
Hyperlaunch Version -1"?
>>>        >
>>>        >       How about renaming dom0less to "Hyperlaunch Lite"?
>>>        >
>>>        >
>>>        > Perhaps it would be helpful if you could explain more clearly y=
our concerns.  I take it that you want a name
>>      which can be
>>>        used specifically
>>>        > to indicate the full "domB measured boot" functionality that wa=
s Daniel and Christopher's original goal, and
>>      that you're
>>>        afraid that using
>>>        > plain "Hyperlaunch" for only the "start VMs from Xen on boot" f=
unctionality will dilute that?
>>>        >
>>>        > The "start VMs from Xen on boot" functionality is the *only* th=
ing that a big chunk of the users of this
>>      functionality want;=20
>>>        referring to
>>>        > it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the=
 value of the functionality.
>>>        >
>>>        > What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured=
 Boot" to refer to the full measured boot
>>      functionality?
>>>=20
>>>        I think this is the best way.
>>>=20
>>>=20
>>>        > Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tre=
e" (without the involvement of a domB),
>>      "Hyperlaunch Boot
>>>        Domain /
>>>        > Hyperlaunch domB" for a more general "domB" functionality, and "=
Hyperlaunch Measured Boot" for the full
>>      functionality
>>>        (assuming there's
>>>        > more to this than simply having a domB involved)?
>>>=20
>>>=20
>>>        We need an overarching name to cover the feature "start VMs from X=
en on
>>>        boot" on both ARM and x86. =46rom my understanding and from the o=
riginal
>>>        emails on the subject, the name "hyperlaunch" was it.
>>>=20
>>>=20
>>> Sure; but think "guitar" vs "acoustic guitar" vs "electric guitar".  "El=
ectric guitar" is new, "guitar" covers them
>>      both, but you sometimes
>>> need a way to specify "acoustic".  Right now target configurations we're=
 talking about include:
>>>=20
>>> 1. Booting all your domains directly from Xen using DT configurations
>>> 2. Booting a domB, which then executes some more complicated programmati=
c configuration to launch VMs before
>>      disappearing
>>> 3. Doing full measured boot on the whole system using a domB.
>>>=20
>>> If "Hyperlaunch" means 1-3, we not only need a way to specify that you'r=
e talking about 3, but *also* a way to specify
>>      that you're talking
>>> about 1.  In the vast majority of cases for the foreseeable future are g=
oing to be 1.  Additionally, we want to make
>>      sure that
>>> "Hyperlaunch" *actually* turns out to mean 1-3, and not just 1.
>>>=20
>>> The thing I like about "Hyperlaunch DT" is that to me it sounds pretty c=
ool but also is very descriptive: I haven't
>>      talked to people
>>> building these systems, but it seems like saying, "The hypervisor launch=
es VMs based on a Device Tree passed to it at
>>      boot" will be
>>> immediately understood, and stick in people's minds.
>>>=20
>>> So maybe informally, or in "short usage" use "Hyperlaunch", but in docum=
entation or reference systems, when talking
>>      specifically about #1,
>>> try to use "Hyperlaunch DT", just to reinforce the idea that there's mor=
e to Hyperlaunch that's coming down the road?
>>=20
>>      "Hyperlaunch DT" would refer to both the x86 and ARM implementations=

>>      because they are both based on DT.
>>=20
>>      I think it is better than "Hyperlaunch Lite" but I am not a fan of
>>      either of these two names because "DT" and "Lite" get easily lost in=

>>      presentations and discussions. For the next few years many will talk=

>>      about HyperLaunch just to refer to what is Dom0less today. So if the=

>>      goal when we say "HyperLaunch" is to bring Measure Boot or XSM to
>>      people's minds, I don't think this will work well.
>>=20
>>      If we want to keep "Hyperlaunch" to mean 1-3 above, highlighting Mea=
sure
>>      Boot or XSM, then I think we should consider using "Dom0less" for 1.=

>>      Yes, it is misleding, but at least it is unique, and a google search=
 for
>>      "dom0less" leads the user to the right results.
>>=20
>>      If we do that, we should rename "Hyperlaunch" with "Dom0less" in
>>      docs/designs/launch/hyperlaunch.rst. That's because "Hyperlaunch" is=

>>      defined as "the ability of a hypervisor to construct and start one o=
r
>>      more virtual machines at system launch in a specific way", which fal=
ls
>>      under Dom0less in this discussion.
>>=20
>>      In my opinion, it is better to have specific names for specific
>>      features. So I would use "HyperLaunch" to mean "the ability of a
>>      hypervisor to construct and start one or more virtual machines at sy=
stem
>>      launch in a specific way" as it is defined today.
>>=20
>>      When we add Measure Boot or XSM or other security/safety features, I=

>>      would call them out specifically. For instance, "HyperLaunch with XS=
M".
>>      It is more descriptive and highlights each feature.
>>=20
>>      Note that at AMD we'll need HyperLaunch without an all-powerful Dom0=
,
>>      probably with XSM. So I am not writing this because I don't think th=
e
>>      other features 2-3 are not important. They definitely are important.=

>>=20
>>=20
>>=20
>> Thanks to all the participants in this thread for the interest in Hyperla=
unch and
>> the support for enabling common advanced boot functionality for Xen acros=
s
>> architectures.
>>=20
>> I'm aiming to provide here a hopefully-fairly-objective overview of the i=
ssues
>> being raised so that we can ensure that these are covered, and then I wil=
l also
>> give my views afterwards.
>>=20
>> ------------------------------------------------------------
>> =3D Naming and communication
>>=20
>> - Ensuring expectations are set correctly for the Hyperlaunch name
>>     - communicating the value of it, differentiation for Xen
>>     - avoiding sub-branding it for feature subsets, use cases, technologi=
es
>>=20
>> - Retiring the term 'dom0less'
>>=20
>> - How to describe the "starting multiple VMs at host boot" functionality
>>=20
>>     - How to describe further Hyperlaunch functionality beyond this
>>         - eg. isolation properties and relevance to critical systems
>>         - eg. running without a classic dom0
>>=20
>>     - How Hyperlaunch relates to other boot functionalities and technolog=
ies,
>>       including:
>>         - architecture-specific aspects and architecture-neutral aspects
>>         - Device Tree
>>         - boot domain
>>         - control domain, hardware domain, dom0
>>         - domain builder
>>         - system measurement
>>         - XSM
>>         - DRTM
>>         - etc.
>>=20
>>=20
>> =3D Migration
>>=20
>> - Providing a forward path for existing users of dom0less functionality
>> across the technical changes for Hyperlaunch cross-architecture implement=
ation
>>     - document compatibility
>>     - support a "dom0less mode" with existing Device Tree structure
>>     - documentation updates to be paired with progress on code implementa=
tion
>>=20
>>=20
>> =3D Community resourcing
>>=20
>> - Supporting code review and merge of Hyperlaunch changes into Xen
>>     - transitioning existing Arm logic into common, including FDT
>>=20
>> - Provision of accurate, consistent documentation materials to support
>> effective communication to existing and prospective users, developers and=
 other
>> stakeholders
>>      - Ensuring that the document structure supports ongoing maintenance:=

>>         - Multiple use cases, structure docs accordingly: eg.
>>             - use case: static partitioning, critical + non-critical VMs
>>             - use case: measured launch with a boot domain
>>             - use case: fast VM start for embedded systems
>>         - Architecture of Hyperlaunch, relevance to other hypervisors
>>             - nested systems
>>=20
>> - Design, review and agreement for common cross-architecture and
>>   arch-extensible interfaces, including:
>>     - common boot data structures
>>     - Device Tree structure
>>     - hypfs entries
>>     - introspection to determine hyperlaunched system status
>>=20
>> - Development of test cases
>>=20
>> - CI of Hyperlaunch interfaces, to ensure that it stays working
>> =20
>> ------------------------------------------------------------
>>=20
>> Views arrived at in discussion with Rich and Daniel, and after reading th=
e
>> thread contributions, follow this point.
>>=20
>> "Hyperlaunch" is to be the common name across architectures for a flexibl=
e,
>> configurable boot system for coordinating the launch of multiple VMs by t=
he
>> hypervisor, with a common implementation, pooling resources and developme=
nt
>> risk across the Xen community. The interfaces are core to it.
>>=20
>> =46rom the Hyperlaunch design document (reviewed + committed to the tree)=
:
>>=20
>> "The design enables seamless transition for existing systems that require=
 a dom0, and provides a new general capability to build and
>> launch alternative configurations of virtual machines, including support f=
or static partitioning and accelerated start of VMs during
>> host boot, while adhering to the principles of least privilege. It incorp=
orates the existing dom0less functionality, extended to fold
>> in the new developments from the Hyperlaunch project, with support for bo=
th x86 and Arm platform architectures, building upon and
>> replacing the earlier 'late hardware domain' feature for disaggregation o=
f dom0.
>>=20
>> Hyperlaunch is designed to be flexible and reusable across multiple use c=
ases, and our aim is to ensure that it is capable, widely
>> exercised, comprehensively tested, and well understood by the Xen communi=
ty."
>>=20
>> https://xenbits.xen.org/docs/4.17-testing/designs/launch/hyperlaunch.html=

>>=20
>> ie.  Hyperlaunch was created to move away from point solutions that hard-=
code
>> specific launch configurations, isolation properties and threat models. I=
t
>> isn't just about starting domains -- it is about enabling the constructio=
n of
>> complex use cases runtimes for Xen. It is the result of iterative design
>> starting with the disaggregation for the late hardware domain, through
>> dom0less development and then with the comprehensive hyperlaunch design a=
nd
>> implementation that builds upon them both.
>>=20
>> The current interest and investment in Hyperlaunch is driven by its relev=
ance
>> to Safety Critical systems due to the isolation properties and improvemen=
t
>> in the ability to certify the software -- this is closely related to but
>> slightly different from starting multiple VMs at host boot.
>>=20
>> To encourage commonality and allow for future development, we should not
>> use architecture-specific or vendor-specific name variations, and also av=
oid
>> technology-specific name variations (eg. Device Tree or "DT").
>>=20
>> Instead, the use case configurations should themselves be describable.
>=20
> Thanks Christopher, Daniel and all!
>=20
> So if I understand correctly, you are in favor if renaming Dom0less to
> Hyperlaunch throughout the Xen codebase? And we need a clarification of
> the docs/, especially docs/features/dom0less.pandoc?

Christopher wrote:
>> =3D Community resourcing

Note the pre-requisite work items for upstream Xen, listed under "Community R=
esourcing", to merge code for Hyperlaunch common interfaces and test cases, w=
ith docs on configuration of Hyperlaunch to deliver functionality for dom0le=
ss use cases.

Thanks,
Rich=

