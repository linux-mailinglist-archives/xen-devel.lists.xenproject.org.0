Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0DB74B877
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 23:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560610.876657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHsej-0002hi-MN; Fri, 07 Jul 2023 21:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560610.876657; Fri, 07 Jul 2023 21:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHsej-0002ei-Gx; Fri, 07 Jul 2023 21:06:21 +0000
Received: by outflank-mailman (input) for mailman id 560610;
 Fri, 07 Jul 2023 21:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yVI=CZ=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qHseh-0002ec-Gm
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 21:06:19 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cf8789c-1d0a-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 23:06:17 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d805cb33aso3161190a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 14:06:17 -0700 (PDT)
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
X-Inumbo-ID: 1cf8789c-1d0a-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688763976; x=1691355976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lgpXDeomX2C4DQsqREcoBJ4MX1DkqRGCmhODLKLIp4Y=;
        b=KN/TP2q4FcSe+75cXZz8Yf76RWO1czq7bAM6KcaRb/f2LT/4Q/39odVJz0X/tw1Xv2
         s1+oQ+NhRsBy+1hCjZNGoh+58WzBZwXtevYnRRfj49OwfE02yNH8TPVkSGtsnr1GO4Ar
         p1bF9qfculsymXr6Cuby8FB7G3ul44u6L3Q+grR6G3o0ohWhZo06LbxXcpx0TVUhaeXp
         /8O8oPDjAHKaRjvUovPhpyaDLsFdp2X1DGWfUWUGicXvvO9cm/v+luBoQrp7oKnT0/vl
         asOA9uTqTdedoEYiHEhFL2t2LdkE3YBuRb+4nCPGSInLeRNm9CN0MIJSsdIByzyEv6e+
         +u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688763976; x=1691355976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgpXDeomX2C4DQsqREcoBJ4MX1DkqRGCmhODLKLIp4Y=;
        b=hS+98J9Cnmv2yDQimlVnyQBDvdd3RhlBhlY/XTrtGByY1+pshHXGshiF2Q13JD5fHx
         z8FvCjukMguzqcpLInCXUBTtMf+5RnlTLYMbbhXfbeKx3B+54alcGwO+1/q+SwQgCQlo
         7nYUQrIsQ2tuwddWQ0OqNt7FjywMmma3nqxaG+cHD3Qmyqd5k6nWySkKZM5OJs9Uk5Zl
         ph5CIl50rSC0VQgeaYqbfXAgPZ69oAVkVNYqJvZzT7cYV9+yGxi7FzuDrmMWLAtK8XpP
         hQOmsfla8SXLQgKeWsXCX24HYi00vW33+qD7v47SmZrJql9Lkjnbgo0Fggg9LAMh5f7U
         qFPw==
X-Gm-Message-State: ABy/qLY3lj8d0Bus7PA99NJT5E/DKcu7LnM/ua64Fvwx8YrRr0HF+uKH
	uG6vQoo9qGe2foEcbIVNrw1kguf/3oY9gf8cjV8=
X-Google-Smtp-Source: APBJJlFd54N8wUbO9vk+N6Wz9zQDRvVnhYzzPeXJJtvT2XQUGccf9tY3gcjUYXupb5RsnuBfm/pwTMrjA4PpCJk3PJM=
X-Received: by 2002:a05:6402:890:b0:51d:f37b:1b4e with SMTP id
 e16-20020a056402089000b0051df37b1b4emr4951797edy.19.1688763976024; Fri, 07
 Jul 2023 14:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com> <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
 <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
 <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com> <alpine.DEB.2.22.394.2307061328540.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307061328540.761183@ubuntu-linux-20-04-desktop>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 7 Jul 2023 14:06:04 -0700
Message-ID: <CACMJ4GYWoyCQMWX8VtpwChk7hHxL-u0Mo-kKX8Qmr1oKf91Hyg@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: George Dunlap <george.dunlap@cloud.com>, P S <pairspace@gmail.com>, 
	Luca Fancellu <luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, 
	Community Manager <community.manager@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Rian Quinn <rianquinn@gmail.com>, 
	Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Scott Davis <scott.davis@starlab.io>, Adam Fraser <adam@starlab.io>, Paul Durrant <paul@xen.org>, 
	rsmith@riversideresearch.org, 
	"m.a.young@durham.ac.uk" <m.a.young@durham.ac.uk>, Elliott Mitchell <ehem+xen@m5p.com>
Content-Type: multipart/alternative; boundary="000000000000e689b605ffec00f6"

--000000000000e689b605ffec00f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+CC members of the Hyperlaunch Working Group + participants on earlier
Hyperlaunch threads

On Thu, Jul 6, 2023 at 2:39=E2=80=AFPM Stefano Stabellini <
stefano.stabellini@amd.com> wrote:

> On Thu, 6 Jul 2023, George Dunlap wrote:
> > On Wed, Jul 5, 2023 at 11:14=E2=80=AFPM Stefano Stabellini <
> stefano.stabellini@amd.com> wrote:
> >       On Wed, 5 Jul 2023, George Dunlap wrote:
> >       > On Mon, Jul 3, 2023 at 9:55=E2=80=AFPM P S <pairspace@gmail.com=
> wrote:
> >       >       > On Jul 3, 2023, at 15:45, Luca Fancellu <
> luca.fancellu@arm.com> wrote:
> >       >       =EF=BB=BF>
> >       >       >> On 3 Jul 2023, at 18:48, Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       >       >>
> >       >       >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
> >       >       >>> On 7/1/23 11:13, Luca Fancellu wrote:
> >       >       >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <
> andrew.cooper3@citrix.com> wrote:
> >       >       >>>>>
> >       >       >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
> >       >       >>>>>> The "dom0less" feature was intended to be the
> feature where a domU
> >       >       >>>>>> domain could be launched without the control domai=
n
> (Dom0)
> >       >       >>>>>> intervention, however the name seems to suggest
> that Dom0 cannot
> >       >       >>>>>> be part of the configuration, while instead it's a
> possible use case.
> >       >       >>>>>>
> >       >       >>>>>> To avoid that, rename the "dom0less" configuration
> with the name
> >       >       >>>>>> "hyperlaunch", that is less misleading.
> >       >       >>>>>>
> >       >       >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.co=
m
> >
> >       >       >>>>>> ---
> >       >       >>>>>> This is an RFC to get the feeling of the community
> about the name
> >       >       >>>>>> change, for now it's everything in one patch just
> to see how it
> >       >       >>>>>> will look like, if there is interest on proceeding
> into it, I can
> >       >       >>>>>> split in more commit.
> >       >       >>>>>
> >       >       >>>>> Have you discussed this with Dan and Chris at all?
> You haven't even
> >       >       >>>>> CC'd them.
> >       >       >>>>
> >       >       >>>> No, this rename idea started from a chat during the
> summit, anyway Julien
> >       >       >>>> promptly add them to the CC, because I forgot.
> >       >       >>>
> >       >       >>> No worries and thank you for considering and taking
> the time to do this RFC.
> >       >       >>> It is greatly appreciated that there is a strong
> willingness to have dom0less
> >       >       >>> and hyperlaunch merged.
> >       >       >>>
> >       >       >>>>>
> >       >       >>>>> While there is a lot of end-goal in common between
> the dom0less and
> >       >       >>>>> hyperlaunch, and that the name dom0less is deeply
> misleading,
> >       >       >>>>> hyperlaunch is specifically not this.
> >       >       >>>>
> >       >       >>>> Yes Hyperlaunch is more than this, however as I said=
,
> with this RFC I would
> >       >       >>>> like
> >       >       >>>> to ear opinions, @Daniel @Christopher could it be a
> proper name for the
> >       >       >>>> dom0less
> >       >       >>>> feature?
> >       >       >>>
> >       >       >>> As Andy has alluded, hyperlaunch is meant to provide =
a
> flexible means to
> >       >       >>> handle domain construction at boot to meet a wide
> range of possible use cases.
> >       >       >>> One of those use cases is dom0less, so yes, ultimatel=
y
> what dom0less does
> >       >       >>> today will be achievable under hyperlaunch. Our
> intended approach to align the
> >       >       >>> two implementations is one that is meant to be
> minimally disruptive, since
> >       >       >>> dom0less is considered a supported (SUPPORT.md)
> capability. As mentioned, we
> >       >       >>> are greatly appreciative to the openness to adopt the
> name,
> >       >       >>
> >       >       >> Thanks Daniel!
> >       >       >>
> >       >       >>
> >       >       >>> but a big concern
> >       >       >>> I personally have is the confusion it could cause a
> general user. A blanket
> >       >       >>> rename would end up with two documents in the docs
> tree that provide two
> >       >       >>> different explanations of hyperlaunch and two
> different device tree
> >       >       >>> definitions. So I think a more measured approach
> should be considered here.
> >       >       >>>
> >       >       >>>> If this patch makes things more difficult for the
> Hyperlunch serie, I=E2=80=99m ok
> >       >       >>>> to drop it,
> >       >       >>>> my only aim was just to find a less misleading name
> for the feature.
> >       >       >>>
> >       >       >>> What I would like to suggest as a good first step
> would be an update to the
> >       >       >>> dom0less document. Provide a note at the beginning
> that points to the
> >       >       >>> hyperlaunch design doc as a more general approach tha=
t
> will eventually subsume
> >       >       >>> dom0less. This would provide a gentler transition for
> exist users of dom0less.
> >       >       >>>
> >       >       >>> If it is not too much, I would also ask, please have =
a
> look at the design for
> >       >       >>> boot modules in the series Christopher just posted.
> The design pulls from the
> >       >       >>> work done by dom0less and expanded upon it. I major
> step into merging the two
> >       >       >>> capabilities will be to have a common set of
> structures. Once those are in
> >       >       >>> place, we can move to a common device tree
> representation, and at that point
> >       >       >>> we would be fairly close, if not at the point of a
> formal merger of between
> >       >       >>> the two.
> >       >       >>
> >       >       >> At the moment we have a concrete problem with
> explaining dom0less and
> >       >       >> hyperlaunch to potential new users. Using two differen=
t
> names for a
> >       >       >> similar feature on arm and x86 causes confusion. It is
> hurting Xen as a
> >       >       >> solution. Personally I already had to switch to use th=
e
> word
> >       >       >> "hyperlaunch" for everything in my users-facing
> presentations.
> >       >       >>
> >       >       >> At the summit, we discussed that it would be a good
> idea to use a single
> >       >       >> name to refer to both features on arm and x86. Given
> that "dom0less"
> >       >       >> causes additional issues because it makes people think
> that there is no
> >       >       >> Dom0, the suggestion was to use "hyperlaunch" to refer
> to both features.
> >       >       >>
> >       >       >> We don't need to 100% align the two implementations an=
d
> data structures.
> >       >       >> This is not for engineers that are going to look at th=
e
> specifications
> >       >       >> and improve them. This is for users/customers of Xen
> that are trying to
> >       >       >> understand what the hypervisor enables them to do. We
> need to be able to
> >       >       >> show users architecture slides with the same name and
> explanation on
> >       >       >> both ARM and x86.
> >       >       >>
> >       >       >> I am sure that Daniel and Christopher remember, but fo=
r
> the others on
> >       >       >> this email thread, the name "hyperlaunch" was born
> exactly to be that:
> >       >       >> the one name to cover both features on ARM and x86 eve=
n
> if they have a
> >       >       >> different implementation. Appended an old email for
> reference.
> >       >       >>
> >       >       >> Also I agree with Daniel that we need to be careful
> about the two docs
> >       >       >> under docs/. I think he is right we need to add a
> paragraph explaining
> >       >       >> the history and a pointer to the other document.
> Something like:
> >       >       >>
> >       >       >> "Dom0less is the name that was used when initially
> introducing the
> >       >       >> feature on ARM. Then, the "dom0less" name was retired
> in favor of
> >       >       >> "hyperlaunch" to avoid confusion (a Dom0 might still b=
e
> present) and to
> >       >       >> align with x86 (where a similar feature was called
> hyperlaunch from the
> >       >       >> start)."
> >       >       >
> >       >       > I=E2=80=99m fully ok to add a section like this pointin=
g to the
> Hyperlaunch design.
> >       >
> >       >       _If_ this text is added, please include links/references
> to the Hyperlaunch wiki page and Hyperlaunch design docs.
> >       >
> >       >       > @Daniel and @Christopher would it be ok for you or the
> changes in the serie
> >       >       > are going to be problematic for your future work? In th=
e
> end it=E2=80=99s just a mechanical
> >       >       > rename, so I guess we just need to agree on naming
> conventions.
> >       >
> >       >       Please see the history of trademark litigation about the
> use of symbolic names to reference similar-but-different
> >       artifacts.
> >       >       It is much easier to use the same name to refer to
> entirely different objects. Historically, confusion arises when a
> >       name is
> >       >       used in similar contexts.
> >       >
> >       >       There is also versioning.  Could we refer to dom0less as
> "Hyperlaunch Version -1"?
> >       >
> >       >       How about renaming dom0less to "Hyperlaunch Lite"?
> >       >
> >       >
> >       > Perhaps it would be helpful if you could explain more clearly
> your concerns.  I take it that you want a name which can be
> >       used specifically
> >       > to indicate the full "domB measured boot" functionality that wa=
s
> Daniel and Christopher's original goal, and that you're
> >       afraid that using
> >       > plain "Hyperlaunch" for only the "start VMs from Xen on boot"
> functionality will dilute that?
> >       >
> >       > The "start VMs from Xen on boot" functionality is the *only*
> thing that a big chunk of the users of this functionality want;
> >       referring to
> >       > it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the
> value of the functionality.
> >       >
> >       > What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured
> Boot" to refer to the full measured boot functionality?
> >
> >       I think this is the best way.
> >
> >
> >       > Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device
> Tree" (without the involvement of a domB), "Hyperlaunch Boot
> >       Domain /
> >       > Hyperlaunch domB" for a more general "domB" functionality, and
> "Hyperlaunch Measured Boot" for the full functionality
> >       (assuming there's
> >       > more to this than simply having a domB involved)?
> >
> >
> >       We need an overarching name to cover the feature "start VMs from
> Xen on
> >       boot" on both ARM and x86. From my understanding and from the
> original
> >       emails on the subject, the name "hyperlaunch" was it.
> >
> >
> > Sure; but think "guitar" vs "acoustic guitar" vs "electric guitar".
> "Electric guitar" is new, "guitar" covers them both, but you sometimes
> > need a way to specify "acoustic".  Right now target configurations we'r=
e
> talking about include:
> >
> > 1. Booting all your domains directly from Xen using DT configurations
> > 2. Booting a domB, which then executes some more complicated
> programmatic configuration to launch VMs before disappearing
> > 3. Doing full measured boot on the whole system using a domB.
> >
> > If "Hyperlaunch" means 1-3, we not only need a way to specify that
> you're talking about 3, but *also* a way to specify that you're talking
> > about 1.  In the vast majority of cases for the foreseeable future
> are going to be 1.  Additionally, we want to make sure that
> > "Hyperlaunch" *actually* turns out to mean 1-3, and not just 1.
> >
> > The thing I like about "Hyperlaunch DT" is that to me it sounds pretty
> cool but also is very descriptive: I haven't talked to people
> > building these systems, but it seems like saying, "The hypervisor
> launches VMs based on a Device Tree passed to it at boot" will be
> > immediately understood, and stick in people's minds.
> >
> > So maybe informally, or in "short usage" use "Hyperlaunch", but in
> documentation or reference systems, when talking specifically about #1,
> > try to use "Hyperlaunch DT", just to reinforce the idea that there's
> more to Hyperlaunch that's coming down the road?
>
> "Hyperlaunch DT" would refer to both the x86 and ARM implementations
> because they are both based on DT.
>
> I think it is better than "Hyperlaunch Lite" but I am not a fan of
> either of these two names because "DT" and "Lite" get easily lost in
> presentations and discussions. For the next few years many will talk
> about HyperLaunch just to refer to what is Dom0less today. So if the
> goal when we say "HyperLaunch" is to bring Measure Boot or XSM to
> people's minds, I don't think this will work well.
>
> If we want to keep "Hyperlaunch" to mean 1-3 above, highlighting Measure
> Boot or XSM, then I think we should consider using "Dom0less" for 1.
> Yes, it is misleding, but at least it is unique, and a google search for
> "dom0less" leads the user to the right results.
>
> If we do that, we should rename "Hyperlaunch" with "Dom0less" in
> docs/designs/launch/hyperlaunch.rst. That's because "Hyperlaunch" is
> defined as "the ability of a hypervisor to construct and start one or
> more virtual machines at system launch in a specific way", which falls
> under Dom0less in this discussion.
>
> In my opinion, it is better to have specific names for specific
> features. So I would use "HyperLaunch" to mean "the ability of a
> hypervisor to construct and start one or more virtual machines at system
> launch in a specific way" as it is defined today.
>
> When we add Measure Boot or XSM or other security/safety features, I
> would call them out specifically. For instance, "HyperLaunch with XSM".
> It is more descriptive and highlights each feature.
>
> Note that at AMD we'll need HyperLaunch without an all-powerful Dom0,
> probably with XSM. So I am not writing this because I don't think the
> other features 2-3 are not important. They definitely are important.



Thanks to all the participants in this thread for the interest in
Hyperlaunch and
the support for enabling common advanced boot functionality for Xen across
architectures.

I'm aiming to provide here a hopefully-fairly-objective overview of the
issues
being raised so that we can ensure that these are covered, and then I will
also
give my views afterwards.

------------------------------------------------------------
=3D Naming and communication

- Ensuring expectations are set correctly for the Hyperlaunch name
    - communicating the value of it, differentiation for Xen
    - avoiding sub-branding it for feature subsets, use cases, technologies

- Retiring the term 'dom0less'

- How to describe the "starting multiple VMs at host boot" functionality

    - How to describe further Hyperlaunch functionality beyond this
        - eg. isolation properties and relevance to critical systems
        - eg. running without a classic dom0

    - How Hyperlaunch relates to other boot functionalities and
technologies,
      including:
        - architecture-specific aspects and architecture-neutral aspects
        - Device Tree
        - boot domain
        - control domain, hardware domain, dom0
        - domain builder
        - system measurement
        - XSM
        - DRTM
        - etc.


=3D Migration

- Providing a forward path for existing users of dom0less functionality
across the technical changes for Hyperlaunch cross-architecture
implementation
    - document compatibility
    - support a "dom0less mode" with existing Device Tree structure
    - documentation updates to be paired with progress on code
implementation


=3D Community resourcing

- Supporting code review and merge of Hyperlaunch changes into Xen
    - transitioning existing Arm logic into common, including FDT

- Provision of accurate, consistent documentation materials to support
effective communication to existing and prospective users, developers and
other
stakeholders
     - Ensuring that the document structure supports ongoing maintenance:
        - Multiple use cases, structure docs accordingly: eg.
            - use case: static partitioning, critical + non-critical VMs
            - use case: measured launch with a boot domain
            - use case: fast VM start for embedded systems
        - Architecture of Hyperlaunch, relevance to other hypervisors
            - nested systems

- Design, review and agreement for common cross-architecture and
  arch-extensible interfaces, including:
    - common boot data structures
    - Device Tree structure
    - hypfs entries
    - introspection to determine hyperlaunched system status

- Development of test cases

- CI of Hyperlaunch interfaces, to ensure that it stays working

------------------------------------------------------------

Views arrived at in discussion with Rich and Daniel, and after reading the
thread contributions, follow this point.

"Hyperlaunch" is to be the common name across architectures for a flexible,
configurable boot system for coordinating the launch of multiple VMs by the
hypervisor, with a common implementation, pooling resources and development
risk across the Xen community. The interfaces are core to it.

From the Hyperlaunch design document (reviewed + committed to the tree):

"The design enables seamless transition for existing systems that require a
dom0, and provides a new general capability to build and launch alternative
configurations of virtual machines, including support for static
partitioning and accelerated start of VMs during host boot, while adhering
to the principles of least privilege. It incorporates the existing dom0less
functionality, extended to fold in the new developments from the
Hyperlaunch project, with support for both x86 and Arm platform
architectures, building upon and replacing the earlier 'late hardware
domain' feature for disaggregation of dom0.

Hyperlaunch is designed to be flexible and reusable across multiple use
cases, and our aim is to ensure that it is capable, widely exercised,
comprehensively tested, and well understood by the Xen community."

https://xenbits.xen.org/docs/4.17-testing/designs/launch/hyperlaunch.html

ie.  Hyperlaunch was created to move away from point solutions that
hard-code
specific launch configurations, isolation properties and threat models. It
isn't just about starting domains -- it is about enabling the construction
of
complex use cases runtimes for Xen. It is the result of iterative design
starting with the disaggregation for the late hardware domain, through
dom0less development and then with the comprehensive hyperlaunch design and
implementation that builds upon them both.

The current interest and investment in Hyperlaunch is driven by its
relevance
to Safety Critical systems due to the isolation properties and improvement
in the ability to certify the software -- this is closely related to but
slightly different from starting multiple VMs at host boot.

To encourage commonality and allow for future development, we should not
use architecture-specific or vendor-specific name variations, and also avoi=
d
technology-specific name variations (eg. Device Tree or "DT").

Instead, the use case configurations should themselves be describable.

Thanks again,

Christopher

--000000000000e689b605ffec00f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>+CC members of the Hyperlaunch Working Group=C2=A0+ p=
articipants on earlier Hyperlaunch threads<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 6, 2023 at 2:39=
=E2=80=AFPM Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabellini@amd=
.com">stefano.stabellini@amd.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 6 Jul 2023, George Dunlap wrote:<b=
r>
&gt; On Wed, Jul 5, 2023 at 11:14=E2=80=AFPM Stefano Stabellini &lt;<a href=
=3D"mailto:stefano.stabellini@amd.com" target=3D"_blank">stefano.stabellini=
@amd.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, 5 Jul 2023, George Dunlap wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Mon, Jul 3, 2023 at 9:55=E2=80=AFPM =
P S &lt;<a href=3D"mailto:pairspace@gmail.com" target=3D"_blank">pairspace@=
gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Jul 3=
, 2023, at 15:45, Luca Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.com=
" target=3D"_blank">luca.fancellu@arm.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=EF=BB=BF&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; On 3=
 Jul 2023, at 18:48, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@k=
ernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
On Mon, 3 Jul 2023, Daniel P. Smith wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
On 7/1/23 11:13, Luca Fancellu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt; On 1 Jul 2023, at 08:53, Andrew Cooper &lt;<a href=3D"mailto:andrew=
.cooper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt; wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt; On 30/06/2023 10:12 am, Luca Fancellu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; The &quot;dom0less&quot; feature was intended to be the feature=
 where a domU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; domain could be launched without the control domain (Dom0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; intervention, however the name seems to suggest that Dom0 canno=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; be part of the configuration, while instead it&#39;s a possible=
 use case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; To avoid that, rename the &quot;dom0less&quot; configuration wi=
th the name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; &quot;hyperlaunch&quot;, that is less misleading.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; Signed-off-by: Luca Fancellu &lt;<a href=3D"mailto:luca.fancell=
u@arm.com" target=3D"_blank">luca.fancellu@arm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; This is an RFC to get the feeling of the community about the na=
me<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; change, for now it&#39;s everything in one patch just to see ho=
w it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; will look like, if there is interest on proceeding into it, I c=
an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;&gt; split in more commit.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt; Have you discussed this with Dan and Chris at all?=C2=A0 You haven&=
#39;t even<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt; CC&#39;d them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; No, this rename idea started from a chat during the summit, anyway Juli=
en<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; promptly add them to the CC, because I forgot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
No worries and thank you for considering and taking the time to do this RFC=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
It is greatly appreciated that there is a strong willingness to have dom0le=
ss<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
and hyperlaunch merged.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt; While there is a lot of end-goal in common between the dom0less and=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt; hyperlaunch, and that the name dom0less is deeply misleading,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;&gt; hyperlaunch is specifically not this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; Yes Hyperlaunch is more than this, however as I said, with this RFC I w=
ould<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; like<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; to ear opinions, @Daniel @Christopher could it be a proper name for the=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; dom0less<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; feature?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
As Andy has alluded, hyperlaunch is meant to provide a flexible means to<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
handle domain construction at boot to meet a wide range of possible use cas=
es.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
One of those use cases is dom0less, so yes, ultimately what dom0less does<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
today will be achievable under hyperlaunch. Our intended approach to align =
the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
two implementations is one that is meant to be minimally disruptive, since<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
dom0less is considered a supported (SUPPORT.md) capability. As mentioned, w=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
are greatly appreciative to the openness to adopt the name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Than=
ks Daniel!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
but a big concern<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
I personally have is the confusion it could cause a general user. A blanket=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
rename would end up with two documents in the docs tree that provide two<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
different explanations of hyperlaunch and two different device tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
definitions. So I think a more measured approach should be considered here.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; If this patch makes things more difficult for the Hyperlunch serie, I=
=E2=80=99m ok<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; to drop it,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&=
gt; my only aim was just to find a less misleading name for the feature.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
What I would like to suggest as a good first step would be an update to the=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
dom0less document. Provide a note at the beginning that points to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
hyperlaunch design doc as a more general approach that will eventually subs=
ume<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
dom0less. This would provide a gentler transition for exist users of dom0le=
ss.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
If it is not too much, I would also ask, please have a look at the design f=
or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
boot modules in the series Christopher just posted. The design pulls from t=
he<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
work done by dom0less and expanded upon it. I major step into merging the t=
wo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
capabilities will be to have a common set of structures. Once those are in<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
place, we can move to a common device tree representation, and at that poin=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
we would be fairly close, if not at the point of a formal merger of between=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; =
the two.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; At t=
he moment we have a concrete problem with explaining dom0less and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; hype=
rlaunch to potential new users. Using two different names for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; simi=
lar feature on arm and x86 causes confusion. It is hurting Xen as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; solu=
tion. Personally I already had to switch to use the word<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &quo=
t;hyperlaunch&quot; for everything in my users-facing presentations.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; At t=
he summit, we discussed that it would be a good idea to use a single<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; name=
 to refer to both features on arm and x86. Given that &quot;dom0less&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; caus=
es additional issues because it makes people think that there is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Dom0=
, the suggestion was to use &quot;hyperlaunch&quot; to refer to both featur=
es.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; We d=
on&#39;t need to 100% align the two implementations and data structures.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; This=
 is not for engineers that are going to look at the specifications<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; and =
improve them. This is for users/customers of Xen that are trying to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; unde=
rstand what the hypervisor enables them to do. We need to be able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; show=
 users architecture slides with the same name and explanation on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; both=
 ARM and x86.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; I am=
 sure that Daniel and Christopher remember, but for the others on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; this=
 email thread, the name &quot;hyperlaunch&quot; was born exactly to be that=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; the =
one name to cover both features on ARM and x86 even if they have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; diff=
erent implementation. Appended an old email for reference.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Also=
 I agree with Daniel that we need to be careful about the two docs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; unde=
r docs/. I think he is right we need to add a paragraph explaining<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; the =
history and a pointer to the other document. Something like:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &quo=
t;Dom0less is the name that was used when initially introducing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; feat=
ure on ARM. Then, the &quot;dom0less&quot; name was retired in favor of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; &quo=
t;hyperlaunch&quot; to avoid confusion (a Dom0 might still be present) and =
to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; alig=
n with x86 (where a similar feature was called hyperlaunch from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; star=
t).&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I=E2=80=
=99m fully ok to add a section like this pointing to the Hyperlaunch design=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_If_ this tex=
t is added, please include links/references to the Hyperlaunch wiki page an=
d Hyperlaunch design docs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @Daniel =
and @Christopher would it be ok for you or the changes in the serie<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; are goin=
g to be problematic for your future work? In the end it=E2=80=99s just a me=
chanical<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; rename, =
so I guess we just need to agree on naming conventions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Please see th=
e history of trademark litigation about the use of symbolic names to refere=
nce similar-but-different<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0artifacts.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0It is much ea=
sier to use the same name to refer to entirely different objects. Historica=
lly, confusion arises when a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0name is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0used in simil=
ar contexts.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0There is also=
 versioning.=C2=A0 Could we refer to dom0less as &quot;Hyperlaunch Version =
-1&quot;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0How about ren=
aming dom0less to &quot;Hyperlaunch Lite&quot;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Perhaps it would be helpful if you coul=
d explain more clearly your concerns.=C2=A0 I take it that you want a name =
which can be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0used specifically<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to indicate the full &quot;domB measure=
d boot&quot; functionality that was Daniel and Christopher&#39;s original g=
oal, and that you&#39;re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0afraid that using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; plain &quot;Hyperlaunch&quot; for only =
the &quot;start VMs from Xen on boot&quot; functionality will dilute that?<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The &quot;start VMs from Xen on boot&qu=
ot; functionality is the *only* thing that a big chunk of the users of this=
 functionality want;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0referring to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; it as &quot;Hyperlaunch Lite&quot; or &=
quot;Hyperlaunch -1&quot; will undermine the value of the functionality.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; What if we use &quot;Measured Hyperlaun=
ch&quot;, or &quot;Hyperlaunch Measured Boot&quot; to refer to the full mea=
sured boot functionality?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I think this is the best way.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Or, &quot;Hyperlaunch DT&quot; for &quo=
t;Booting VMs from Xen using Device Tree&quot; (without the involvement of =
a domB), &quot;Hyperlaunch Boot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Domain /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hyperlaunch domB&quot; for a more gener=
al &quot;domB&quot; functionality, and &quot;Hyperlaunch Measured Boot&quot=
; for the full functionality<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(assuming there&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; more to this than simply having a domB =
involved)?<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0We need an overarching name to cover the fea=
ture &quot;start VMs from Xen on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0boot&quot; on both ARM and x86. From my unde=
rstanding and from the original<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0emails on the subject, the name &quot;hyperl=
aunch&quot; was it.<br>
&gt; <br>
&gt; <br>
&gt; Sure; but think &quot;guitar&quot; vs &quot;acoustic guitar&quot; vs &=
quot;electric guitar&quot;.=C2=A0 &quot;Electric guitar&quot; is new, &quot=
;guitar&quot; covers them both, but you sometimes<br>
&gt; need a way to specify &quot;acoustic&quot;.=C2=A0 Right now target con=
figurations we&#39;re talking about include:<br>
&gt; <br>
&gt; 1. Booting all your domains directly from Xen using DT configurations<=
br>
&gt; 2. Booting a domB, which then executes some more complicated programma=
tic configuration to launch VMs before disappearing<br>
&gt; 3. Doing full measured boot on the whole system using a domB.<br>
&gt; <br>
&gt; If &quot;Hyperlaunch&quot; means 1-3, we not only need a way to specif=
y that you&#39;re talking about 3, but *also* a way to specify that you&#39=
;re talking<br>
&gt; about 1.=C2=A0 In the vast majority of cases for the foreseeable futur=
e are=C2=A0going to be 1.=C2=A0 Additionally, we want to make sure that<br>
&gt; &quot;Hyperlaunch&quot; *actually* turns out to mean 1-3, and not just=
 1.<br>
&gt; <br>
&gt; The thing I like about &quot;Hyperlaunch DT&quot; is that to me it sou=
nds pretty cool but also is very descriptive: I haven&#39;t talked to peopl=
e<br>
&gt; building these systems, but it seems like saying, &quot;The hypervisor=
 launches VMs based on a Device Tree passed to it at boot&quot; will be<br>
&gt; immediately understood, and stick in people&#39;s minds.<br>
&gt; <br>
&gt; So maybe informally, or in &quot;short usage&quot; use &quot;Hyperlaun=
ch&quot;, but in documentation or reference systems, when talking specifica=
lly about #1,<br>
&gt; try to use &quot;Hyperlaunch DT&quot;, just to reinforce the idea that=
 there&#39;s more to Hyperlaunch that&#39;s coming down the road?<br>
<br>
&quot;Hyperlaunch DT&quot; would refer to both the x86 and ARM implementati=
ons<br>
because they are both based on DT.<br>
<br>
I think it is better than &quot;Hyperlaunch Lite&quot; but I am not a fan o=
f<br>
either of these two names because &quot;DT&quot; and &quot;Lite&quot; get e=
asily lost in<br>
presentations and discussions. For the next few years many will talk<br>
about HyperLaunch just to refer to what is Dom0less today. So if the<br>
goal when we say &quot;HyperLaunch&quot; is to bring Measure Boot or XSM to=
<br>
people&#39;s minds, I don&#39;t think this will work well.<br>
<br>
If we want to keep &quot;Hyperlaunch&quot; to mean 1-3 above, highlighting =
Measure<br>
Boot or XSM, then I think we should consider using &quot;Dom0less&quot; for=
 1.<br>
Yes, it is misleding, but at least it is unique, and a google search for<br=
>
&quot;dom0less&quot; leads the user to the right results.<br>
<br>
If we do that, we should rename &quot;Hyperlaunch&quot; with &quot;Dom0less=
&quot; in<br>
docs/designs/launch/hyperlaunch.rst. That&#39;s because &quot;Hyperlaunch&q=
uot; is<br>
defined as &quot;the ability of a hypervisor to construct and start one or<=
br>
more virtual machines at system launch in a specific way&quot;, which falls=
<br>
under Dom0less in this discussion.<br>
<br>
In my opinion, it is better to have specific names for specific<br>
features. So I would use &quot;HyperLaunch&quot; to mean &quot;the ability =
of a<br>
hypervisor to construct and start one or more virtual machines at system<br=
>
launch in a specific way&quot; as it is defined today.<br>
<br>
When we add Measure Boot or XSM or other security/safety features, I<br>
would call them out specifically. For instance, &quot;HyperLaunch with XSM&=
quot;.<br>
It is more descriptive and highlights each feature.<br>
<br>
Note that at AMD we&#39;ll need HyperLaunch without an all-powerful Dom0,<b=
r>
probably with XSM. So I am not writing this because I don&#39;t think the<b=
r>
other features 2-3 are not important. They definitely are important.</block=
quote><div><br></div><div><br>Thanks to all the participants in this thread=
 for the interest in Hyperlaunch and<br>the support for enabling common adv=
anced boot functionality for Xen across<br>architectures.<br><br>I&#39;m ai=
ming to provide here a hopefully-fairly-objective overview of the issues<br=
>being raised so that we can ensure that these are covered, and then I will=
 also<br>give my views afterwards.<br><br>---------------------------------=
---------------------------<br>=3D Naming and communication<br><br>- Ensuri=
ng expectations are set correctly for the Hyperlaunch name<br>=C2=A0 =C2=A0=
 - communicating the value of it, differentiation for Xen<br>=C2=A0 =C2=A0 =
- avoiding sub-branding it for feature subsets, use cases, technologies<br>=
<br>- Retiring the term &#39;dom0less&#39;<br><br>- How to describe the &qu=
ot;starting multiple VMs at host boot&quot; functionality<br><br>=C2=A0 =C2=
=A0 - How to describe further Hyperlaunch functionality beyond this<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - eg. isolation properties and relevance to critic=
al systems<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - eg. running without a classic d=
om0<br><br>=C2=A0 =C2=A0 - How Hyperlaunch relates to other boot functional=
ities and technologies,<br>=C2=A0 =C2=A0 =C2=A0 including:<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 - architecture-specific aspects and architecture-neutral asp=
ects<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Device Tree<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - boot domain<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - control domain, hardw=
are domain, dom0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - domain builder<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 - system measurement<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - =
XSM<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - DRTM<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - =
etc.<br><br><br>=3D Migration<br><br>- Providing a forward path for existin=
g users of dom0less functionality<br>across the technical changes for Hyper=
launch cross-architecture implementation<br>=C2=A0 =C2=A0 - document compat=
ibility<br>=C2=A0 =C2=A0 - support a &quot;dom0less mode&quot; with existin=
g Device Tree structure<br>=C2=A0 =C2=A0 - documentation updates to be pair=
ed with progress on code implementation<br><br><br>=3D Community resourcing=
<br><br>- Supporting code review and merge of Hyperlaunch changes into Xen<=
br>=C2=A0 =C2=A0 - transitioning existing Arm logic into common, including =
FDT<br><br>- Provision of accurate, consistent documentation materials to s=
upport<br>effective communication to existing and prospective users, develo=
pers and other<br>stakeholders<br>=C2=A0 =C2=A0 =C2=A0- Ensuring that the d=
ocument structure supports ongoing maintenance:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - Multiple use cases, structure docs accordingly: eg.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - use case: static partitioning, critical + non=
-critical VMs<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - use case: meas=
ured launch with a boot domain<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - use case: fast VM start for embedded systems<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - Architecture of Hyperlaunch, relevance to other hypervisors<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - nested systems<br><br>- Design, revie=
w and agreement for common cross-architecture and<br>=C2=A0 arch-extensible=
 interfaces, including:<br>=C2=A0 =C2=A0 - common boot data structures<br>=
=C2=A0 =C2=A0 - Device Tree structure<br>=C2=A0 =C2=A0 - hypfs entries<br>=
=C2=A0 =C2=A0 - introspection to determine hyperlaunched system status<br><=
br>- Development of test cases<br><br>- CI of Hyperlaunch interfaces, to en=
sure that it stays working<br>=C2=A0 <br>----------------------------------=
--------------------------<br><br>Views arrived at in discussion with Rich =
and Daniel, and after reading the<br>thread contributions, follow this poin=
t.<br><br>&quot;Hyperlaunch&quot; is to be the common name across architect=
ures for a flexible,<br>configurable boot system for coordinating the launc=
h of multiple VMs by the<br>hypervisor, with a common implementation, pooli=
ng resources and development<br>risk across the Xen community. The interfac=
es are core to it.<br><br>From the Hyperlaunch design document (reviewed + =
committed to the tree):<br><br>&quot;The design enables seamless transition=
 for existing systems that require a dom0, and provides a new general capab=
ility to build and launch alternative configurations of virtual machines, i=
ncluding support for static partitioning and accelerated start of VMs durin=
g host boot, while adhering to the principles of least privilege. It incorp=
orates the existing dom0less functionality, extended to fold in the new dev=
elopments from the Hyperlaunch project, with support for both x86 and Arm p=
latform architectures, building upon and replacing the earlier &#39;late ha=
rdware domain&#39; feature for disaggregation of dom0.<br><br>Hyperlaunch i=
s designed to be flexible and reusable across multiple use cases, and our a=
im is to ensure that it is capable, widely exercised, comprehensively teste=
d, and well understood by the Xen community.&quot;<br><br><a href=3D"https:=
//xenbits.xen.org/docs/4.17-testing/designs/launch/hyperlaunch.html">https:=
//xenbits.xen.org/docs/4.17-testing/designs/launch/hyperlaunch.html</a><br>=
<br>ie.=C2=A0 Hyperlaunch was created to move away from point solutions tha=
t hard-code<br>specific launch configurations, isolation properties and thr=
eat models. It<br>isn&#39;t just about starting domains -- it is about enab=
ling the construction of<br>complex use cases runtimes for Xen. It is the r=
esult of iterative design<br>starting with the disaggregation for the late =
hardware domain, through<br>dom0less development and then with the comprehe=
nsive hyperlaunch design and<br>implementation that builds upon them both.<=
br><br>The current interest and investment in Hyperlaunch is driven by its =
relevance<br>to Safety Critical systems due to the isolation properties and=
 improvement<br>in the ability to certify the software -- this is closely r=
elated to but<br>slightly different from starting multiple VMs at host boot=
.<br><br>To encourage commonality and allow for future development, we shou=
ld not<br>use architecture-specific or vendor-specific name variations, and=
 also avoid<br>technology-specific name variations (eg. Device Tree or &quo=
t;DT&quot;).<br><br>Instead, the use case configurations should themselves =
be describable.<br><br>Thanks again,<br><br>Christopher<br></div><div>=C2=
=A0</div></div></div>

--000000000000e689b605ffec00f6--

