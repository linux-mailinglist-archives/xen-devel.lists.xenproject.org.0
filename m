Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4E93D4F9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 16:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765418.1176000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXLla-0008P2-Fu; Fri, 26 Jul 2024 14:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765418.1176000; Fri, 26 Jul 2024 14:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXLla-0008Md-C4; Fri, 26 Jul 2024 14:17:54 +0000
Received: by outflank-mailman (input) for mailman id 765418;
 Fri, 26 Jul 2024 14:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8ZK=O2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sXLlZ-0008MX-Cd
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 14:17:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7d45be8-4b59-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 16:17:52 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7b2dbd81e3so212840766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 07:17:51 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad411b1sm181338066b.125.2024.07.26.07.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 07:17:50 -0700 (PDT)
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
X-Inumbo-ID: d7d45be8-4b59-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722003471; x=1722608271; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMI9aTT6zvaQdWTpgbXG4TzJOEoxkvv0ztlC/9mykyI=;
        b=fqX7ActQWKdj3oFrp9aws+UiStUfthjHwF+dmFZ4bCV3+lsaVEE6fv5Oc1iHaB1MBw
         103CQPaL12T2Y315TufA8IAKugyau8A/qtAIsNy5Ao9ulNzYT37WiOkSx3SJlAcSUO2S
         wPcBQxKJara72KNwDi7c9YX48PImTfjSNw99o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003471; x=1722608271;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eMI9aTT6zvaQdWTpgbXG4TzJOEoxkvv0ztlC/9mykyI=;
        b=SI3RJhDSrd9Sa4r2YESyOTEb5aBWDR6FENYaMfYzNUvJC2fwRqhynUXZzljf2hXprb
         wA6sqzl568Fg5FsSfTi49V3rCqnH05j3cAJgsQceR/37cUnxgveGvcUPTFBAM7/9jiAr
         2Px5wnDAJ7KBx0co8YRVPavO+NLtjIRSDr8z6iSLX/z9NGg0IfAtn3tqHQue6SkdnyEY
         88+2TS3eZ9+MNBXiR+0rqs4fjDiH0CuYXlaF0hoZssIaoIKNAvmEIYyu7szbUiHzfwoI
         Tz7Kot4vSLjYQ9/d/ZfRbNHzJU8XYOSgv3Z2pHjtdCO6YtvmCS2Cgdwx3cVI3Hgx4VMm
         PkKw==
X-Forwarded-Encrypted: i=1; AJvYcCX8m4kbUotmycckkIBxzT3vCrpgJDIgndqe5YKWS775fYz/VKTY+KLX77v41XyFfg4qgcIflNDBpeU3DTdnzGvTzXO/XEIf5/Nw8xMHmjU=
X-Gm-Message-State: AOJu0Yxe+h6y7UeRf4ySisgNxlqxtHuPkyA1DSpNm4CROB9+5ag7ErMb
	qreDUm8hb6hmdKkxYl91FM/W8sR+f+fuHAJwKZbdfBgJPXJGFKdwn6pO+DnKtKw=
X-Google-Smtp-Source: AGHT+IEVcXBhV7rB8LmG/bGjq4JOkaMbqLMndfpnqpRo6OMqTudFsPRkYDcQgew2IC2yrfUEj/qNEw==
X-Received: by 2002:a17:907:94c8:b0:a7a:9ca6:528 with SMTP id a640c23a62f3a-a7ac4d9d28bmr501042766b.11.1722003471121;
        Fri, 26 Jul 2024 07:17:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jul 2024 15:17:48 +0100
Message-Id: <D2ZJA8MODIO2.9JHFXZO8LW7Z@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
X-Mailer: aerc 0.17.0
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com> <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com> <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com> <ZqNVs97wexqd5trA@macbook>
 <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>
In-Reply-To: <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>

On Fri Jul 26, 2024 at 9:05 AM BST, Jan Beulich wrote:
> On 26.07.2024 09:52, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
> >> On 26.07.2024 09:31, Roger Pau Monn=C3=A9 wrote:
> >>> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> >>>> On 25.07.2024 16:54, Roger Pau Monn=C3=A9 wrote:
> >>>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> >>>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
> >>>>>>> --- a/xen/arch/x86/include/asm/alternative.h
> >>>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
> >>>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
> >>>>>>>   * https://github.com/llvm/llvm-project/issues/82598
> >>>>>>>   */
> >>>>>>>  #define ALT_CALL_ARG(arg, n)                                    =
        \
> >>>>>>> -    register union {                                            =
        \
> >>>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];              =
        \
> >>>>>>> -        unsigned long r;                                        =
        \
> >>>>>>> +    register struct {                                           =
        \
> >>>>>>> +        typeof(arg) e;                                          =
        \
> >>>>>>> +        char pad[sizeof(void *) - sizeof(arg)];                 =
        \
> >>>>>>
> >>>>>> One thing that occurred to me only after our discussion, and I the=
n forgot
> >>>>>> to mention this before you would send a patch: What if sizeof(void=
 *) =3D=3D
> >>>>>> sizeof(arg)? Zero-sized arrays are explicitly something we're tryi=
ng to
> >>>>>> get rid of.
> >>>>>
> >>>>> I wondered about this, but I though it was only [] that we were try=
ing
> >>>>> to get rid of, not [0].
> >>>>
> >>>> Sadly (here) it's actually the other way around, aiui.
> >>>
> >>> The only other option I have in mind is using an oversized array on
> >>> the union, like:
> >>>
> >>> #define ALT_CALL_ARG(arg, n)                                         =
   \
> >>>     union {                                                          =
   \
> >>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)]=
;  \
> >>>         unsigned long r;                                             =
   \
> >>>     } a ## n ## __  =3D {                                            =
     \
> >>>         .e[0] =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg=
); })\
> >>>     };                                                               =
   \
> >>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D =
     \
> >>>         a ## n ## __.r
> >>
> >> Yet that's likely awful code-gen wise?
> >=20
> > Seems OK: https://godbolt.org/z/nsdo5Gs8W
>
> In which case why not go this route. If the compiler is doing fine with
> that, maybe the array dimension expression could be further simplified,
> accepting yet more over-sizing? Like "sizeof(void *) / sizeof (arg) + 1"
> or even simply "sizeof(void *)"? Suitably commented of course ...
>
> >> For the time being, can we perhaps
> >> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested?
> >=20
> > My main concern with tightening the BUILD_BUG_ON() is that then I
> > would also like to do so for the GCC one, so that build fails
> > uniformly.
>
> If we were to take that route, then yes, probably should constrain both
> (with a suitable comment on the gcc one).
>
> Jan

Yet another way would be to have an intermediate `long` to cast onto. Compi=
lers
will optimise away the copy. It ignores the different-type aliasing rules i=
n
the C spec, so there's an assumption that we have -fno-strict-aliasing. But=
 I
belive we do? Otherwise it should pretty much work on anything.

```
  #define ALT_CALL_ARG(arg, n)                                             =
 \
      unsigned long __tmp =3D 0;                                           =
   \
      *(typeof(arg) *)&__tmp =3D                                           =
   \
          ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })         =
 \
      register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D __tm=
p; \
```

fwiw, clang18 emits identical code compared with the previous godbolt link.

Link: https://godbolt.org/z/facd1M9xa

Cheers,
Alejandro

