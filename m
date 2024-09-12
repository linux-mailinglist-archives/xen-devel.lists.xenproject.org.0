Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D40976CF3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797601.1207584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solLu-0007mj-Lt; Thu, 12 Sep 2024 15:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797601.1207584; Thu, 12 Sep 2024 15:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solLu-0007lE-IA; Thu, 12 Sep 2024 15:03:22 +0000
Received: by outflank-mailman (input) for mailman id 797601;
 Thu, 12 Sep 2024 15:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cE1=QK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1solLt-0007l8-4D
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:03:21 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 255b2c48-7118-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:03:19 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5e1c49f9b9aso419468eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:03:19 -0700 (PDT)
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
X-Inumbo-ID: 255b2c48-7118-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726153398; x=1726758198; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xJ+g1hl9Jb3lpbnl7fqAJ2la9UTG0EMZ2BLp3954UE=;
        b=h3oeqkdwUsE53I793CmEcJ8hroX2YupZ8ZpH7PxxB9iq+vdFbgwVGb6VTupBjpOMG0
         a05ww6gZThzkcg+9H6O+6VYjELjrl/mCJIxSMB4FvqB+/EKWn53I8TNTXHChpvaCHjyO
         FGhw/TMAZrjP4072oBXtHGoEfYBnqkjzmix/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153398; x=1726758198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xJ+g1hl9Jb3lpbnl7fqAJ2la9UTG0EMZ2BLp3954UE=;
        b=kYnI3bvLZgpblUnf1DRSxjKcJoEjf50f3I6EmWgtJKLOCefI4a0IzIbkYZXD2v8IZs
         QkBFOQ/ySfGbEQwmcwQp04VknLSDjOWY+m07NEeU7cBwidnHaEAw5+symK9RrvpacUoe
         DyGhJIPuHEXmMs29JryZkw9bnTsaN7WYM8dauXWJQ739tFTeTe70zlBn8Jz73/WKElZS
         Ty/GrhXfjacqsFzzPVeCkf13s8sWo8pn9nYajmk69thDSRKDAxbCVzzq+6P5OJqWqZnK
         uY5AtMJa3uZIq3EdTL4pN2E+T6i1Wx05ykKTyj34bRujhNo7hPHbEjGVhLWTMHt9XtTQ
         hCrw==
X-Forwarded-Encrypted: i=1; AJvYcCUX/DOFMYzmCL6DObYafotN7+zkBDMxg1BjVXyKm348hfs3fGL0Bowd5VVs93b0+VnliAjWbVp2hNo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkexnNG1+jJm6HRjOjC3XLi+Jq28Uiot/LTi01gwadhBPgFKK/
	0m7TguE2v6YSHQGrSntDEMZQB7I3SQKpYh/QkR/27v6mMH9FdCCulG56dHwnpD73LGjdFxyOBVi
	DgcpVdL4ICw/HAfedXWN8e6wO2BFPTY+JLJ0HpbdKl4RKFGh9ipg=
X-Google-Smtp-Source: AGHT+IHRcUmMhV2LQCZST4ko26vjnav4qRVXTCKUPnyB1eQVNNYV6JPwDWqrvYIEIn0zmWfzIWKFCHgU1KhSSsq7S8Q=
X-Received: by 2002:a05:6820:822:b0:5df:a346:a1bd with SMTP id
 006d021491bc7-5e201438b9amr1447108eaf.6.1726153398421; Thu, 12 Sep 2024
 08:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
 <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com> <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop>
 <44738f93-e99b-4f1c-9ed3-59dd2eac7aff@suse.com> <alpine.DEB.2.22.394.2409111808580.611587@ubuntu-linux-20-04-desktop>
 <e2542d65-d5a5-44aa-a90b-ea8dad6a547f@suse.com>
In-Reply-To: <e2542d65-d5a5-44aa-a90b-ea8dad6a547f@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 12 Sep 2024 16:03:07 +0100
Message-ID: <CACHz=Zhn+UdO_Sfeispv47Dx22ux+i9-kJVkBLPJ+qxV52nB3w@mail.gmail.com>
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, consulting@bugseng.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 3:35=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.09.2024 03:13, Stefano Stabellini wrote:
> > On Tue, 10 Sep 2024, Jan Beulich wrote:
> >> On 10.09.2024 06:57, Stefano Stabellini wrote:
> >>> On Mon, 9 Sep 2024, Jan Beulich wrote:
> >>>> On 05.09.2024 17:48, Alessandro Zucchelli wrote:
> >>>>> This section explains which format should be followed by header
> >>>>> inclusion guards via a drop-down list of rules.
> >>>>>
> >>>>> No functional change.
> >>>>>
> >>>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.c=
om>
> >>>>>
> >>>>> ---
> >>>>> Changes in v6:
> >>>>> - edit inclusion guards naming conventions, including more details
> >>>>
> >>>> Yet I'm afraid that from my pov we're still not there. Specifically =
...
> >>>>
> >>>>> --- a/CODING_STYLE
> >>>>> +++ b/CODING_STYLE
> >>>>> @@ -159,6 +159,34 @@ Emacs local variables
> >>>>>  A comment block containing local variables for emacs is permitted =
at
> >>>>>  the end of files.  It should be:
> >>>>>
> >>>>> +Header inclusion guards
> >>>>> +-----------------------
> >>>>> +
> >>>>> +Unless otherwise specified, all header files should include proper
> >>>>> +guards to prevent multiple inclusions. The following naming conven=
tions
> >>>>> +apply:
> >>>>
> >>>> ... reading this, I can't derive ...
> >>>>
> >>>>> +- Private headers: <dir>__<filename>_H
> >>>>> +    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING=
_H
> >>>>> +    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING=
_H
> >>>>> +    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> >>>>
> >>>> ... the absence of an equivalent of the arch/ part of the path. As p=
er
> >>>> my recollection we agreed on that shortening, but it needs spelling =
out
> >>>> in the textual description. Such that it is possible to derived what=
 to
> >>>> uses as a name for, say, a header under common/, crypto/, or drivers=
/
> >>>> (or anywhere else of course). Specifically with the further examples=
 ...
> >>>
> >>> Are you asking for something like this?
> >>>
> >>> Omit the word "arch" from the filepath.
> >>>
> >>> If you prefer an alternative wording please suggest the text.
> >>>
> >>>
> >>>>> +- asm-generic headers: ASM_GENERIC__<filename>_H
> >>>>> +    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> >>>>> +
> >>>>> +- arch-specific headers: ASM__<architecture>__<subdir>__<filename>=
_H
> >>>>> +    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
> >>>>
> >>>> ... here and ...
> >>>
> >>> Suggested text:
> >>>
> >>> Omit the words "arch" and "include/asm" from the filepath, ASM is als=
o
> >>> prefixed.
> >>>
> >>>
> >>>>> +- Xen headers: XEN__<filename>_H
> >>>>> +    - include/xen/something.h -> XEN__SOMETHING_H
> >>>>
> >>>> ... here, where more than just one path component is omitted, derivi=
ng
> >>>> what's meant can end up ambiguous. Yet ambiguity is what we absolute=
ly
> >>>> want to avoid, to preempt later discussions on any such naming.
> >>>
> >>> Suggested text:
> >>>
> >>> Omit the words "include/xen" from the filepath, XEN is always prefixe=
d.
> >>>
> >>> Please suggest a specific alternative if you prefer
> >>
> >> Looks like I still didn't get across my point: The verbal description
> >> that's ahead of all of the examples should be complete enough to descr=
ibe
> >> the whole set of rules, in sufficiently abstract terms. Then the examp=
les
> >> will be easy to prove as fitting those rules, and it will be easy to
> >> derive the naming for further identifiers. IOW - no, I'm not asking fo=
r
> >> the examples to be further commented, but for the naming rules to be
> >> _fully_ spelled out.
> >
> >
> > Hi Jan, we have gone back and forth on this a few times, but neither
> > Alessandro nor I fully understand your perspective. To help streamline
> > the process and save time for everyone, I suggest you provide an exampl=
e
> > of the rules written in the style you believe is appropriate. Once you
> > set the initial direction, Alessandro and I can continue and complete
> > the rest in that preferred style.
>
> If you really expect me to do so (hence effectively me becoming the one
> to make the proposal, which I never meant to), it'll have to wait until
> I'm back from the GNU Tools Cauldron and the PTO I'm taking immediately
> afterwards.
>
> Jan
>
> > On a related note, I have encountered formal specifications that use le=
ss
> > formal language than this simple code style and naming convention
> > adjustment. I feel we might be over-engineering this, and in my opinion=
,
> > the current version is sufficient. Any additional time spent on this
> > could be better used addressing MISRA violations that pose real safety
> > risks for Xen users.
>
>

Why not just following the simple rule?
If file is arch/arm/arm64/lib/something.h have a
ARCH__ARM__ARM64__LIB__SOMETHING_H guard, if file is
arch/x86/lib/something.h have a ARCH__X86__LIB__SOMETHING_H guard.

Frediano

