Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2AB28011
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 14:36:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083382.1443000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtfK-0003hT-LG; Fri, 15 Aug 2025 12:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083382.1443000; Fri, 15 Aug 2025 12:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtfK-0003gX-I0; Fri, 15 Aug 2025 12:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1083382;
 Fri, 15 Aug 2025 12:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDBg=23=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1umtfJ-0003f8-6S
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 12:36:13 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6beddba4-79d4-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 14:36:10 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-435de59ddf7so1214534b6e.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 05:36:10 -0700 (PDT)
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
X-Inumbo-ID: 6beddba4-79d4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755261369; x=1755866169; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEMlnw2CaB342LDxXIA1afWqddDw8Ds6bu2N2QtWJjs=;
        b=kDNJitCXd3LdGhBpZQzUJndim4VIfcd5t5paEsxfYwHqaQHS8YDwFnwnjQzBXwiPi5
         dhzqfOkLxvYBlV/cLL2hW1fKXn+5lk3WZWL+zTN0CECbRi4mhNPDRndC9eGJpC7CIqUu
         umQuNCCJjofO5KbJco2Kc0N9rzn+2dgK9ngMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755261369; x=1755866169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEMlnw2CaB342LDxXIA1afWqddDw8Ds6bu2N2QtWJjs=;
        b=ls7cv0fyNEZsoQi0zJ/OC2/BmxhLvGGpO4W3dH7PxxNAVxzHqKuis3cIMLaSJKB7+6
         wgjsTaXEjeSrlGucz9kdwn623M7IECwbXu5G52GMHud2JKgM/ROwlYU5ksd8rtfvY3bB
         NWWWA8h6HfieKYa2qtNVael3mLsTk9VFbLzjYdmK0frzcuCnnBVXXLMsPTPal3vNCCOd
         bUmW7dvSf42iHuFOeOe3QORUUs/EqdTqfqOhphCShHppzn3QSFPsSfgOBS5GjoKazsso
         sjkHT28CElwl2QavYTrzbI6bUSVE8nz3aktnw3QwROBIiolOMJHtJwoXp3LkweVsHcTq
         mivQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9iX0nTKqRpVOu3EE8ei9oFeQWYs4oMeRHy1j6mrQNESA8al2iwdmgXESFqfQ0K0pirY/5BrnZFSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb4kQ1JqnLIR+sV8b4baKcAPqDPRQNzyF0x0RrYq/xNYypQm/i
	/XJMprsq5OgQ6NIKvEmm34wRJdw80qQOtb41Eh7fajNeBJF9dgwwJwg+GGmASnHrN/QW3ZOlpqO
	HqgpS2P2vp8NGEVVEkoFK2hftq2rHSKezFrYMP0VkgQ==
X-Gm-Gg: ASbGncs38/8rSHxTEOE4hMxWzvi1PTXN4BVx80z3HUYVd88wKXuZnLdG5ntcWTDJt7z
	0Jw8cGsraiaB9GoOnUF3L2GpCkeja991OojtpXO7uEVT83aOcpGjgyyu8iX65uu1DU/eIYAFb4+
	upl47nmFIGCf3MZzCNw4gyBTfiThD6Ms6RtkrD1FECV8/y06yC6NSCLA6RH370aEm/FyzEHv6Tf
	4NB/XM=
X-Google-Smtp-Source: AGHT+IEc+0iOXiO6snSunrBQvl203dojVhDM1HcHDLUn1gAlXZ1mafZhdpd9qPvHaZjeKUj93/aEhZeHp3NsfcYnzZM=
X-Received: by 2002:a05:6808:319a:b0:434:f1b:1a82 with SMTP id
 5614622812f47-435ec3ce4a0mr1004344b6e.5.1755261369214; Fri, 15 Aug 2025
 05:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
 <3056ed85948288639110e3cdd6b28c6e@bugseng.com> <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
 <7fc93aeef27153f1d6caa786bd44420f@bugseng.com> <caf19e2b-046e-495f-b425-9cb3a0053006@suse.com>
 <bd3f9c28-aaf4-479d-b56e-48838442f7a3@citrix.com> <5ff1e337-9ec5-466b-b21f-cf29274b007b@suse.com>
 <aad0db65-06cd-4631-a6e8-de36fa6af85d@citrix.com> <8efa3103-fad9-4921-a5ef-04e7a7c80715@suse.com>
In-Reply-To: <8efa3103-fad9-4921-a5ef-04e7a7c80715@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 15 Aug 2025 13:35:57 +0100
X-Gm-Features: Ac12FXw4LzTNiJMpWAXmjjT-VQhVcaWpXciKhTe85vDZrV9DMVTh4RTyIC2pNTI
Message-ID: <CACHz=Zi5gdfg42W5oTc8e0t3Y1+oVT_kV+nTKoXQEBCnVJSw2Q@mail.gmail.com>
Subject: Re: [PATCH v2] xen: Use auto as per C23
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 1:28=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.08.2025 12:53, Andrew Cooper wrote:
> > On 15/08/2025 11:25 am, Jan Beulich wrote:
> >> On 15.08.2025 11:51, Andrew Cooper wrote:
> >>> On 15/08/2025 10:36 am, Jan Beulich wrote:
> >>>> On 15.08.2025 10:33, Nicola Vetrini wrote:
> >>>>> On 2025-08-15 10:17, Andrew Cooper wrote:
> >>>>>> On 15/08/2025 8:20 am, Nicola Vetrini wrote:
> >>>>>>> On 2025-08-15 00:25, Andrew Cooper wrote:
> >>>>>>>> In macros it is common to declare local variables using typeof(p=
aram)
> >>>>>>>> in order
> >>>>>>>> to ensure that side effects are only evaluated once.  A conseque=
nce
> >>>>>>>> of this is
> >>>>>>>> double textural expansion of the parameter, which can get out of=
 hand
> >>>>>>>> very
> >>>>>>>> quickly with nested macros.
> >>>>>>>>
> >>>>>>>> In C23, the auto keyword has been repurposed to perform type
> >>>>>>>> inference.
> >>>>>>>>
> >>>>>>>> A GCC extension, __auto_type, is now avaialble in the new toolch=
ain
> >>>>>>>> baseline
> >>>>>>>> and avoids the double textural expansion.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>>> Thankyou.
> >>>>>>
> >>>>>>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compil=
er.h
> >>>>>>>> index 88bf26bc5109..38ef5d82ad95 100644
> >>>>>>>> --- a/xen/include/xen/compiler.h
> >>>>>>>> +++ b/xen/include/xen/compiler.h
> >>>>>>>> @@ -64,6 +64,20 @@
> >>>>>>>>  # define asm_inline asm
> >>>>>>>>  #endif
> >>>>>>>>
> >>>>>>>> +/*
> >>>>>>>> + * In C23, the auto keyword has been repurposed to perform type
> >>>>>>>> inference.
> >>>>>>>> + *
> >>>>>>>> + * This behaviour is available via the __auto_type extension in
> >>>>>>>> supported
> >>>>>>>> + * toolchains.
> >>>>>>>> + *
> >>>>>>>> + *
> >>>>>>>> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Au=
to-Type.html
> >>>>>>>> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-typ=
e
> >>>>>>>> + */
> >>>>>>>> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
> >>>>>>>> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23
> >>>>>>>> meaning. */
> >>>>>>>> +#define auto __auto_type
> >>>>>>>> +#endif
> >>>>>>>> +
> >>>>>>> A more detailed explanation should live in deviations.rst under t=
his
> >>>>>>> bullet point
> >>>>>>>
> >>>>>>>    * - R20.4
> >>>>>>>      - The override of the keyword \"inline\" in xen/compiler.h i=
s
> >>>>>>> present so
> >>>>>>>        that section contents checks pass when the compiler choose=
s not
> >>>>>>> to
> >>>>>>>        inline a particular function.
> >>>>>>>      - Comment-based deviation.
> >>>>>>>
> >>>>>>> as described in the SAF entry:
> >>>>>>>
> >>>>>>>         {
> >>>>>>>             "id": "SAF-3-safe",
> >>>>>>>             "analyser": {
> >>>>>>>                 "eclair": "MC3A2.R20.4"
> >>>>>>>             },
> >>>>>>>             "name": "MC3A2.R20.4: allow the definition of a macro=
 with
> >>>>>>> the same name as a keyword in some special cases",
> >>>>>>>             "text": "The definition of a macro with the same name=
 as a
> >>>>>>> keyword can be useful in certain configurations to improve the
> >>>>>>> guarantees that can be provided by Xen. See docs/misra/deviations=
.rst
> >>>>>>> for a precise rationale for all such cases."
> >>>>>>>         },
> >>>>>> Ah right.  What about this:
> >>>>>>
> >>>>>> "Xen does not use the \"auto\" keyword as a storage qualifier.  Th=
e
> >>>>>> override of the keyword \"auto\" in xen/compiler.h is to give it i=
t's
> >>>>>> C23 behaviour of type inference."
> >>>>>>
> >>>>>> ?
> >>>>> Seems good to me. Maybe this should be spelled out in ./CODING_STYL=
E as
> >>>>> well, so that newcomers don't trip over this?
> >>>> I'm not sure newcomers would look there, but in the absence of any b=
etter
> >>>> place that's perhaps indeed where to mention this.
> >>> How about this:
> >>>
> >>> diff --git a/CODING_STYLE b/CODING_STYLE
> >>> index 7bf3848444ad..e33b9d1170cf 100644
> >>> --- a/CODING_STYLE
> >>> +++ b/CODING_STYLE
> >>> @@ -129,6 +129,10 @@ Fixed width types should only be used when a fix=
ed width quantity is
> >>>  meant (which for example may be a value read from or to be written t=
o a
> >>>  register).
> >>>
> >>> +Macros which otherwise would use "typeof(arg) newarg =3D" to avoid d=
ouble
> >>> +evaluation of side effects should use "auto newarg =3D" per it's C23=
 behaviour,
> >>> +to also avoid double textural expansion.
> >>> +
> >>>  Especially with pointer types, whenever the pointed to object is not
> >>>  (supposed to be) modified, qualify the pointed to type with "const".
> >> That doesn't focus on the pitfall though, in that people shouldn't be =
using
> >> the "auto" keyword (except in said cases).
> >
> > /sigh, this is why noone does patches to CODING_STYLE.
> >
> > If you don't like the wording, propose some wording that you do like.
> >
> > Or I will commit the patch without this hunk, because I'm not going to
> > get drawn into the cycle of blind guessing that every change to
> > CODING_STYLE seems to get caught in.
>
> I don't care about the wording; what I do care about is to get the caveat
> across. Maybe:
>
> '"auto" isn't used in its traditional sense, but rather with its C23 mean=
ing.
>  Such uses are intended to be limited to macro-local variables.'
>

Why limiting to macros?

> Jan
>

Frediano

