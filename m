Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06278132BA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 15:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654607.1021704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmUu-0002za-IT; Thu, 14 Dec 2023 14:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654607.1021704; Thu, 14 Dec 2023 14:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmUu-0002xv-F5; Thu, 14 Dec 2023 14:15:32 +0000
Received: by outflank-mailman (input) for mailman id 654607;
 Thu, 14 Dec 2023 14:15:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a063=HZ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rDmUt-0002xp-Jc
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 14:15:31 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c0cdced-9a8b-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 15:15:29 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9f85eff28so122056841fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 06:15:29 -0800 (PST)
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
X-Inumbo-ID: 3c0cdced-9a8b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702563329; x=1703168129; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymfayXGwoeRggRReIZbCdclTol5yCgZKrdQf+e7s3qc=;
        b=NrXXF4Y5JHj1LK59DGTku1up70N45Em4AKhw2So4UqOP1xnFfbz9tTnYCOfx/keopg
         HJfcAl30wHJbd4nDwGZ9SG7NFsfAD4HZB4V2qBXyOz6oGMxIaqwmNwrWWvDVAIWIBz3h
         JmOTea48JbjFMG8EuG7hEpYx5aE4oFR6K3GPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702563329; x=1703168129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymfayXGwoeRggRReIZbCdclTol5yCgZKrdQf+e7s3qc=;
        b=mOxg7pVVPHjLDr5AifP9lfIpD077NYIa9Bc5yQRo60RzVuE48PQ0/ElkajHqSGxCfI
         wb6sd+Q0tv+C7vxv8j21u0jKbUjpb1eoe1ZE+VEyNfgSathPKBTWfmlVkNdx4zPQnITO
         UcODOJY43Csg0qc04rnUfVk2kUkHGjuWVSCGFbZk2Wic5kmyv8oxBFJDBxTEgkd99nDq
         PNBKNmkSdMuUo+TGg8iNmhP5LM4c5lQxHUopyN8LuJKrQN48RUodKKPkWp8pkVmqIDEv
         VqVEudru3RliEaBeaBIaOYUcdYk1IxfgfXDM4cJMs+OVQfSzH3JG1tk574/dRi2bNPPA
         m7Dw==
X-Gm-Message-State: AOJu0Yx57Y5p81xYu5pAd8WMMjKOpJFIE9EiO7EPsRb+vZ+Nd98+o1lc
	r8i6yBjzCAkeKjpjrUyuMtxCc2A2EYz+NZYhNxSsTGp6WULjxvRtQRU=
X-Google-Smtp-Source: AGHT+IHuL3IknDYI09Of28GS3UShV0+rrrKY8lUPt7Sy6TVvWIFGCrG3ddJWkDNQSwQmWWGQoIrRfn4kMZOR+91vpzI=
X-Received: by 2002:a2e:6e13:0:b0:2ca:35a1:26de with SMTP id
 j19-20020a2e6e13000000b002ca35a126demr4405463ljc.39.1702563328869; Thu, 14
 Dec 2023 06:15:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com> <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com> <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org>
 <4a1f86c7-6643-4fd1-ba1c-a4f86abb63f3@suse.com>
In-Reply-To: <4a1f86c7-6643-4fd1-ba1c-a4f86abb63f3@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 14 Dec 2023 14:15:17 +0000
Message-ID: <CA+zSX=YHW3kGFroNDzwQg=EhEe3F_fw3gCd_9W+P2UxC7+g+0A@mail.gmail.com>
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 8:51=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.12.2023 09:32, Julien Grall wrote:
> > Hi Jan,
> >
> > On 14/12/2023 07:53, Jan Beulich wrote:
> >> On 14.12.2023 03:05, Stefano Stabellini wrote:
> >>> On Wed, 13 Dec 2023, Jan Beulich wrote:
> >>>> On 11.12.2023 10:14, Nicola Vetrini wrote:
> >>>>> --- a/xen/arch/arm/include/asm/numa.h
> >>>>> +++ b/xen/arch/arm/include/asm/numa.h
> >>>>> @@ -2,8 +2,9 @@
> >>>>>   #define __ARCH_ARM_NUMA_H
> >>>>>
> >>>>>   #include <xen/mm.h>
> >>>>
> >>>> With this, ...
> >>>>
> >>>>> +#include <xen/types.h>
> >>>>>
> >>>>> -typedef u8 nodeid_t;
> >>>>> +typedef uint8_t nodeid_t;
> >>>>>
> >>>>>   #ifndef CONFIG_NUMA
> >>>>>
> >>>>> @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
> >>>>>   #define node_to_cpumask(node)   (cpu_online_map)
> >>>>>
> >>>>>   /*
> >>>>> - * TODO: make first_valid_mfn static when NUMA is supported on Arm=
, this
> >>>>> - * is required because the dummy helpers are using it.
> >>>>> + * TODO: define here first_valid_mfn as static when NUMA is suppor=
ted on Arm,
> >>>>> + * this is required because the dummy helpers are using it.
> >>>>>    */
> >>>>> -extern mfn_t first_valid_mfn;
> >>>>
> >>>> ... and this declaration moved to xen/mm.h, how is it going to be po=
ssible
> >>>> to do as the adjusted comment says? The compiler will choke on the s=
tatic
> >>>> after having seen the extern.
> >>>
> >>> Nicola was just following a review comment by Julien. NUMA has been
> >>> pending for a while and I wouldn't hold this patch back because of it=
.
> >>> I suggest we go with Julien's request (this version of the patch).
> >>>
> >>> If you feel strongly about it, please suggest an alternative.
> >>
> >> Leaving a TODO comment which cannot actually be carried out is just wr=
ong
> >> imo. And I consider in unfair to ask me to suggest an alternative. The
> >> (imo obvious) alternative is to drop this patch, if no proper change c=
an
> >> be proposed. There's nothing wrong with leaving a violation in place,
> >> when that violation is far from causing any kind of harm. The more tha=
t
> >> the place is already accompanied by a (suitable afaict) comment.
> >
> > Just to clarify, are you saying you would be happy if the proposal if
> > the TODO is removed?
>
> Removing the bad (new) TODO here is an option. But the previous TODO shou=
ldn't
> go away. However, you asking now required me to actually look into Stefan=
o's
> request to make an alternative proposal (I still don't see though why it
> needed to be me to think about an appropriate solution;

In general, it is unreasonable to expect other people to come up with
suggestions to make you happy.  You're ultimately the only person who
knows what would make you satisfied.  You're also more senior and know
the code better, and thus in a better position to be able to come up
with ideas.  "What about X?" "No." "What about Y?" "No." "What about
Z?" "No." Contributors experience it as caustic behavior.

The only time it's acceptable is if you can specify, precisely and
reasonably completely, your criteria for acceptance, such that there's
a clear way forward.  In this case, for instance, it sounds like "Has
a TODO which isn't technically inaccurate" might be the criteria.

In which case, for instance, a solution might be along the lines of:
"TODO: When NUMA is supported on Arm we'll need to do something about
defining first_valid_mfn, which is used by the dummy helpers."  This
punts the actual solution down the road until we need it.

But I do think that it's fair to ask Julien to think about a suitable
wording, since the comment is in a sense to remind him (or other ARM
maintainers) what's needed, and since the eventual solution will be
something to do with the ARM code and architecture anyway.

 -George

>
> First, Arm's and PPC's header have this in their !NUMA sections. Much lik=
e
> Oleksii's putting in quite a bit of effort to reduce redundancy in order =
to
> not further grow it with RISC-V, what's wrong with sorting the !NUMA case
> properly as a first step? Move the entire !NUMA section either into xen/n=
uma.h
> (eliminating the need for arch-es not supporting NUMA to even have such a
> header), or (if need be) to asm-generic/. Then, as a 2nd step (albeit tha=
t
> could also be done on its own, just the result would be less neat imo), m=
ake
> the variable in question here extern _only_ when !NUMA. This would then
> address the original TODO, so that could then legitimately be dropped. Th=
is
> would further be a good opportunity to adjust the already stale comment i=
n
> page_alloc.c (it's no longer applicable to Arm only).
>
> Jan

