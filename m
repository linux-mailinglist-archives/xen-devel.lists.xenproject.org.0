Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B4093D510
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 16:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765430.1176020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXLsg-0001yW-Ac; Fri, 26 Jul 2024 14:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765430.1176020; Fri, 26 Jul 2024 14:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXLsg-0001wg-7K; Fri, 26 Jul 2024 14:25:14 +0000
Received: by outflank-mailman (input) for mailman id 765430;
 Fri, 26 Jul 2024 14:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8ZK=O2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sXLse-0001wa-FT
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 14:25:12 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddf84907-4b5a-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 16:25:11 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f01afa11cso1971283e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 07:25:11 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41616sm182950766b.137.2024.07.26.07.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 07:25:10 -0700 (PDT)
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
X-Inumbo-ID: ddf84907-4b5a-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722003911; x=1722608711; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTGr6E4iUPh9DMDAZ7f58092WQTR2KdftTscFn5t7Ps=;
        b=EqCBG5h98YlJbRQQYcEN1yv7+gmXmzpFXgc9AhY7bsFlKGe1eDTs5chNUWd2fe3hTQ
         Lsx59zcAqNTxwE6O5hI6S3WRBYLYLb6iAv/gKv4saq2xl0x8mU4kPdgbZ8WWQ8A1HSUy
         clypO5CvWtNMABYS2t1+98E2DDeWYfRY6tW7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003911; x=1722608711;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTGr6E4iUPh9DMDAZ7f58092WQTR2KdftTscFn5t7Ps=;
        b=HTTFbcwj9IKwTsu37tYDqZxMbraEhEdmlhqc7v++haOk6b6/Ia4/rjArzTM227DHHd
         ZT+RBZ6LBQ5QGOALQqx2ayp+i8bjyw/mRXwrca1fKOfb06MCu5pLUd45iCI+XoI2ea0g
         tlrHCO+xrU6AedhWTfCgeyLpwbjH2HhLaz4viL6Zo78GxywKyoWdPoM8M4bf/kBjOwBd
         40CJNt+l3kU9G+GM6hqEKmSWHBynwCYGKBz5gQz+NjufhFuPQA6LKzKVdICKIqLofktm
         8DtCf3aHAQR8jJmIaa3PLDlPyWUoZc4T/5l0bUg7szRQkYcNPhVM5Y6AlQFo9qvBAtIP
         8ZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVQj1PSYlqrLkGIYQIGvnk+eEYFJbyVJReJaKezQXGgjBoRzLyJB6f+aGHmFy4IYEUfXdhr5tTiJ2G+gLbjUfKzHXsI5A6s4MVmHUENOg=
X-Gm-Message-State: AOJu0Yx+LvqU/9G/g7EilnHJkol1B903wLUNDh3yCwAFViLgQaF9Kj8J
	o3q2SoBMVZ/clqiOFaS8+6/dLWKRNRihvw057HKSqdyFUieRadWRwY32vAqqxDY=
X-Google-Smtp-Source: AGHT+IFRxfK9RsUS0U+ocskmLtHNbJ+B2gYyx0BAXiE0V+NA1JZ2s8Jf3o5Hv8nEu0e63vN75zBt1A==
X-Received: by 2002:ac2:4c48:0:b0:52c:dca7:c9bd with SMTP id 2adb3069b0e04-52fd3f2c027mr4128976e87.30.1722003910823;
        Fri, 26 Jul 2024 07:25:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jul 2024 15:25:08 +0100
Message-Id: <D2ZJFUKTDIAL.2OE4EHLK6GGIB@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Jan Beulich"
 <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
X-Mailer: aerc 0.17.0
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com> <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com> <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com> <ZqNVs97wexqd5trA@macbook>
 <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>
 <D2ZJA8MODIO2.9JHFXZO8LW7Z@cloud.com>
In-Reply-To: <D2ZJA8MODIO2.9JHFXZO8LW7Z@cloud.com>

On Fri Jul 26, 2024 at 3:17 PM BST, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 9:05 AM BST, Jan Beulich wrote:
> > On 26.07.2024 09:52, Roger Pau Monn=C3=A9 wrote:
> > > On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
> > >> On 26.07.2024 09:31, Roger Pau Monn=C3=A9 wrote:
> > >>> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> > >>>> On 25.07.2024 16:54, Roger Pau Monn=C3=A9 wrote:
> > >>>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> > >>>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
> > >>>>>>> --- a/xen/arch/x86/include/asm/alternative.h
> > >>>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
> > >>>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
> > >>>>>>>   * https://github.com/llvm/llvm-project/issues/82598
> > >>>>>>>   */
> > >>>>>>>  #define ALT_CALL_ARG(arg, n)                                  =
          \
> > >>>>>>> -    register union {                                          =
          \
> > >>>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];            =
          \
> > >>>>>>> -        unsigned long r;                                      =
          \
> > >>>>>>> +    register struct {                                         =
          \
> > >>>>>>> +        typeof(arg) e;                                        =
          \
> > >>>>>>> +        char pad[sizeof(void *) - sizeof(arg)];               =
          \
> > >>>>>>
> > >>>>>> One thing that occurred to me only after our discussion, and I t=
hen forgot
> > >>>>>> to mention this before you would send a patch: What if sizeof(vo=
id *) =3D=3D
> > >>>>>> sizeof(arg)? Zero-sized arrays are explicitly something we're tr=
ying to
> > >>>>>> get rid of.
> > >>>>>
> > >>>>> I wondered about this, but I though it was only [] that we were t=
rying
> > >>>>> to get rid of, not [0].
> > >>>>
> > >>>> Sadly (here) it's actually the other way around, aiui.
> > >>>
> > >>> The only other option I have in mind is using an oversized array on
> > >>> the union, like:
> > >>>
> > >>> #define ALT_CALL_ARG(arg, n)                                       =
     \
> > >>>     union {                                                        =
     \
> > >>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg=
)];  \
> > >>>         unsigned long r;                                           =
     \
> > >>>     } a ## n ## __  =3D {                                          =
       \
> > >>>         .e[0] =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (a=
rg); })\
> > >>>     };                                                             =
     \
> > >>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =
=3D      \
> > >>>         a ## n ## __.r
> > >>
> > >> Yet that's likely awful code-gen wise?
> > >=20
> > > Seems OK: https://godbolt.org/z/nsdo5Gs8W
> >
> > In which case why not go this route. If the compiler is doing fine with
> > that, maybe the array dimension expression could be further simplified,
> > accepting yet more over-sizing? Like "sizeof(void *) / sizeof (arg) + 1=
"
> > or even simply "sizeof(void *)"? Suitably commented of course ...
> >
> > >> For the time being, can we perhaps
> > >> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested?
> > >=20
> > > My main concern with tightening the BUILD_BUG_ON() is that then I
> > > would also like to do so for the GCC one, so that build fails
> > > uniformly.
> >
> > If we were to take that route, then yes, probably should constrain both
> > (with a suitable comment on the gcc one).
> >
> > Jan
>
> Yet another way would be to have an intermediate `long` to cast onto. Com=
pilers
> will optimise away the copy. It ignores the different-type aliasing rules=
 in
> the C spec, so there's an assumption that we have -fno-strict-aliasing. B=
ut I
> belive we do? Otherwise it should pretty much work on anything.
>
> ```
>   #define ALT_CALL_ARG(arg, n)                                           =
   \
>       unsigned long __tmp =3D 0;                                         =
     \
>       *(typeof(arg) *)&__tmp =3D                                         =
     \
>           ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })       =
   \
>       register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D __=
tmp; \
> ```
>
> fwiw, clang18 emits identical code compared with the previous godbolt lin=
k.
>
> Link: https://godbolt.org/z/facd1M9xa
>
> Cheers,
> Alejandro

Bah. s/b/__tmp/ in line15. Same output though, so the point still stands.

Cheers,
Alejandro

