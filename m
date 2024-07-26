Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E2793D5D8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765500.1176099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMiJ-0004wX-0Z; Fri, 26 Jul 2024 15:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765500.1176099; Fri, 26 Jul 2024 15:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMiI-0004uU-TY; Fri, 26 Jul 2024 15:18:34 +0000
Received: by outflank-mailman (input) for mailman id 765500;
 Fri, 26 Jul 2024 15:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMiH-0004uO-DY
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:18:33 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 511daa38-4b62-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:18:32 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-70446231242so654159a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:18:32 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8ddd7esm17581416d6.15.2024.07.26.08.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:18:30 -0700 (PDT)
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
X-Inumbo-ID: 511daa38-4b62-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007110; x=1722611910; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z28BwUqlGfuCYZiEq7Wrt7AnHoiKBZZZBXeirgUlkr8=;
        b=TkjC5WtjVwJIs1W7alLUkl/36gyEom2diQomGGT504luUbUtVQYXggSFuH5fR7BM6x
         KPHalfheE0dd0RZXN+j0TM4zvKXmRe0ICssUAQSyiAHH5kDuC/eLmmL3TcuvuzO6GK9Z
         TUxFRcXpyXpJ/+WGdHuCox0b3Ja7sknucziy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007110; x=1722611910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z28BwUqlGfuCYZiEq7Wrt7AnHoiKBZZZBXeirgUlkr8=;
        b=XKtDfA2In68QH9cPckx9v5uJioEMzADk6/uMYYy3xhaUfRjTOA007Pb8X0DZmlayUs
         oZo7Lm3egIwPKbyMvLDdRaSSfx8Vstsdv20N6jHUb1rJ5qShHT15ZDHcHoPesZIoOnsR
         5XOcrb2oe5s0J6XrQGy84/W4YmhrRPSF0Uew9qebYzCOI4Dk37ZX48janS809XKmR0mx
         bYpHRfa8tHsF1sLrtaICEL8FcZ3F84uFxu6+iAB2Stb/pjjlbWDLUTa5H6EIFiY8CRTm
         cutLdMFCgerBQoyMdvypgAK4nzyE8jDNxYsBqv4FKVNGEJj3uOBYe0thU4tIZitSo11r
         oPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2rkORWTe7TIAjBsUT6XQXquT5slmOS3uAoNT/e/Evm5kpD03gfCb8EleLIU6dZD7UoDN8n7AubAk7/8HC8OHLMLD8kf5OoxDtv80m39I=
X-Gm-Message-State: AOJu0Yy8U2APONmVSkppmyRg2asLQdRGyFTxfJHlvvhE3oNYlO0s6svg
	TuOzZWgDp7jix2VJuEwNWdAWk6IvnqJlSI9Wzjh00zHeGtingO0tSvZ/5OR8yxQ=
X-Google-Smtp-Source: AGHT+IH+SmaLK8ebPDRx7s6q65eASz/4C8sElevQkt8lgTVvHEvUGnaQMFd9PuVAinJB67q/ZTIDRw==
X-Received: by 2002:a05:6830:6310:b0:709:3462:a4b6 with SMTP id 46e09a7af769-7093462a85bmr7379342a34.9.1722007110460;
        Fri, 26 Jul 2024 08:18:30 -0700 (PDT)
Date: Fri, 26 Jul 2024 17:18:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
Message-ID: <ZqO-RFZHdCrIuRok@macbook>
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com>
 <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com>
 <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com>
 <ZqNVs97wexqd5trA@macbook>
 <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>
 <D2ZJA8MODIO2.9JHFXZO8LW7Z@cloud.com>
 <D2ZJFUKTDIAL.2OE4EHLK6GGIB@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D2ZJFUKTDIAL.2OE4EHLK6GGIB@cloud.com>

On Fri, Jul 26, 2024 at 03:25:08PM +0100, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 3:17 PM BST, Alejandro Vallejo wrote:
> > On Fri Jul 26, 2024 at 9:05 AM BST, Jan Beulich wrote:
> > > On 26.07.2024 09:52, Roger Pau Monné wrote:
> > > > On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
> > > >> On 26.07.2024 09:31, Roger Pau Monné wrote:
> > > >>> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> > > >>>> On 25.07.2024 16:54, Roger Pau Monné wrote:
> > > >>>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> > > >>>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
> > > >>>>>>> --- a/xen/arch/x86/include/asm/alternative.h
> > > >>>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
> > > >>>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
> > > >>>>>>>   * https://github.com/llvm/llvm-project/issues/82598
> > > >>>>>>>   */
> > > >>>>>>>  #define ALT_CALL_ARG(arg, n)                                            \
> > > >>>>>>> -    register union {                                                    \
> > > >>>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> > > >>>>>>> -        unsigned long r;                                                \
> > > >>>>>>> +    register struct {                                                   \
> > > >>>>>>> +        typeof(arg) e;                                                  \
> > > >>>>>>> +        char pad[sizeof(void *) - sizeof(arg)];                         \
> > > >>>>>>
> > > >>>>>> One thing that occurred to me only after our discussion, and I then forgot
> > > >>>>>> to mention this before you would send a patch: What if sizeof(void *) ==
> > > >>>>>> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
> > > >>>>>> get rid of.
> > > >>>>>
> > > >>>>> I wondered about this, but I though it was only [] that we were trying
> > > >>>>> to get rid of, not [0].
> > > >>>>
> > > >>>> Sadly (here) it's actually the other way around, aiui.
> > > >>>
> > > >>> The only other option I have in mind is using an oversized array on
> > > >>> the union, like:
> > > >>>
> > > >>> #define ALT_CALL_ARG(arg, n)                                            \
> > > >>>     union {                                                             \
> > > >>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
> > > >>>         unsigned long r;                                                \
> > > >>>     } a ## n ## __  = {                                                 \
> > > >>>         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> > > >>>     };                                                                  \
> > > >>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
> > > >>>         a ## n ## __.r
> > > >>
> > > >> Yet that's likely awful code-gen wise?
> > > > 
> > > > Seems OK: https://godbolt.org/z/nsdo5Gs8W
> > >
> > > In which case why not go this route. If the compiler is doing fine with
> > > that, maybe the array dimension expression could be further simplified,
> > > accepting yet more over-sizing? Like "sizeof(void *) / sizeof (arg) + 1"
> > > or even simply "sizeof(void *)"? Suitably commented of course ...
> > >
> > > >> For the time being, can we perhaps
> > > >> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested?
> > > > 
> > > > My main concern with tightening the BUILD_BUG_ON() is that then I
> > > > would also like to do so for the GCC one, so that build fails
> > > > uniformly.
> > >
> > > If we were to take that route, then yes, probably should constrain both
> > > (with a suitable comment on the gcc one).
> > >
> > > Jan
> >
> > Yet another way would be to have an intermediate `long` to cast onto. Compilers
> > will optimise away the copy. It ignores the different-type aliasing rules in
> > the C spec, so there's an assumption that we have -fno-strict-aliasing. But I
> > belive we do? Otherwise it should pretty much work on anything.
> >
> > ```
> >   #define ALT_CALL_ARG(arg, n)                                              \
> >       unsigned long __tmp = 0;                                              \
> >       *(typeof(arg) *)&__tmp =                                              \
> >           ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })          \
> >       register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = __tmp; \
> > ```
> >
> > fwiw, clang18 emits identical code compared with the previous godbolt link.
> >
> > Link: https://godbolt.org/z/facd1M9xa
> >
> > Cheers,
> > Alejandro
> 
> Bah. s/b/__tmp/ in line15. Same output though, so the point still stands.

Had to adjust it to:

#define ALT_CALL_ARG(arg, n)                                              \
    unsigned long a ## n ## __ = 0;                                       \
    *(typeof(arg) *)&a ## n ## __ =                                       \
        ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); });         \
    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = a ## n ## __

So that tmp__ is not defined multiple times for repeated
ALT_CALL_ARG() usages.

Already tried something like this in the past, but it mixes code with
declarations, and that's forbidden in the current C standard that Xen
uses:

./arch/x86/include/asm/hvm/hvm.h:665:5: error: mixing declarations and code is incompatible with standards before C99 [-Werror,-Wdeclaration-after-statement]

The `*(typeof(arg) *)&__tmp = ...` line is considered code, and is
followed by further declarations.  Even if we moved both declarations
ahead of the assigns it would still complain when multiple
ALT_CALL_ARG() instances are used in the same altcall block.

Thanks, Roger.

