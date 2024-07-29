Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F493EF97
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 10:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766409.1176888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLWV-0005NY-8V; Mon, 29 Jul 2024 08:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766409.1176888; Mon, 29 Jul 2024 08:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLWV-0005Kf-5m; Mon, 29 Jul 2024 08:14:27 +0000
Received: by outflank-mailman (input) for mailman id 766409;
 Mon, 29 Jul 2024 08:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYLWT-0005KZ-Lz
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 08:14:25 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8febe400-4d82-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 10:14:23 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7a1d7a544e7so228063285a.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 01:14:23 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73b8837sm499906885a.48.2024.07.29.01.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 01:14:21 -0700 (PDT)
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
X-Inumbo-ID: 8febe400-4d82-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722240862; x=1722845662; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tZGqaqO6NWw/DdJ8IMDm9yeYail2IVrE3vcfP4RIog=;
        b=hbxRu3PdB5Q1UjGwDyKOeG274FwBFV+gHb9pKXSgqpC1yo6Z69wlJoxtwxMPIB3K7P
         l3wPNqclpBWgb/pw4yRD9SVY+tRZgG49TnSa3+qhd0gNGN8RYnGIYfbOX7VVOo/QnTCk
         cTHDfBUpKhMfJkXg8vcvS1cSedzxRjWKYhIQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240862; x=1722845662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tZGqaqO6NWw/DdJ8IMDm9yeYail2IVrE3vcfP4RIog=;
        b=Kqb92B8vQiRQHvhTYup3q6/KR9rHhRZez7x9wpIlNoEhQUQLqrFunRQEFIA4aVy/Tv
         N+fmCsnT1ltMucXnOoRwx0qQJV/Ym+onjeN7LKQ+J7zuSeGsit3qn93+CNQkSHDh0YwH
         bowCxZMFFpNax9ILJQWKRN8812JRi29w6XEVnUaFII5OjUu/XIqXmPnA6rh1LMkUgNyk
         RFLfTPe/WcYBN8OfuV8w29pwGRpIsv4md6VBPHUuojKoSwnx87cwc/HeYOw47b/9C1lg
         RYCGluYpGzWzMn28T0BorGWqAP2iZsHye3rIhscrkDGxjGvg1+FqqFS2H4TL7Bvd+WnX
         xZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU91LUayArhNcfK6asK4xHruSi/zhhLlyFKnPw+0Tw89x35vCHOqT3//JenTU9Q/nm4bxSOGXHcX8xVu/MnS1EjMfrhjYD3eA4qV5M2lLU=
X-Gm-Message-State: AOJu0YxrWJBiDuAQY3219oLMPmHPV2JP/IF1/xUbEXuuyo0Mt3RITXJd
	PjqfkfVqS38wzPSQgMfDAdodzw6GzTTs1vLwi01JGJrtN1P/SND8tbqLh3WUsjs=
X-Google-Smtp-Source: AGHT+IGOXsZx022sd55edxrM9wUlXp8kE/07zWV9WuwQzgmYqkP9P2YDeBMvcC18UtY5HG3PYgkg6w==
X-Received: by 2002:a05:620a:2549:b0:79d:6749:4247 with SMTP id af79cd13be357-7a1e52677f3mr842225385a.39.1722240862005;
        Mon, 29 Jul 2024 01:14:22 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:14:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
Message-ID: <ZqdPW4loFbZ_IZD4@macbook>
References: <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com>
 <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com>
 <ZqNVs97wexqd5trA@macbook>
 <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>
 <D2ZJA8MODIO2.9JHFXZO8LW7Z@cloud.com>
 <D2ZJFUKTDIAL.2OE4EHLK6GGIB@cloud.com>
 <ZqO-RFZHdCrIuRok@macbook>
 <D2ZM0D609TOQ.2GQQWR1QALUPA@cloud.com>
 <D2ZM9PYSGG06.3ENIG6XVJLMFL@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D2ZM9PYSGG06.3ENIG6XVJLMFL@cloud.com>

On Fri, Jul 26, 2024 at 05:38:11PM +0100, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 5:25 PM BST, Alejandro Vallejo wrote:
> > On Fri Jul 26, 2024 at 4:18 PM BST, Roger Pau Monné wrote:
> > > On Fri, Jul 26, 2024 at 03:25:08PM +0100, Alejandro Vallejo wrote:
> > > > On Fri Jul 26, 2024 at 3:17 PM BST, Alejandro Vallejo wrote:
> > > > > On Fri Jul 26, 2024 at 9:05 AM BST, Jan Beulich wrote:
> > > > > > On 26.07.2024 09:52, Roger Pau Monné wrote:
> > > > > > > On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
> > > > > > >> On 26.07.2024 09:31, Roger Pau Monné wrote:
> > > > > > >>> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> > > > > > >>>> On 25.07.2024 16:54, Roger Pau Monné wrote:
> > > > > > >>>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> > > > > > >>>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
> > > > > > >>>>>>> --- a/xen/arch/x86/include/asm/alternative.h
> > > > > > >>>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
> > > > > > >>>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
> > > > > > >>>>>>>   * https://github.com/llvm/llvm-project/issues/82598
> > > > > > >>>>>>>   */
> > > > > > >>>>>>>  #define ALT_CALL_ARG(arg, n)                                            \
> > > > > > >>>>>>> -    register union {                                                    \
> > > > > > >>>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> > > > > > >>>>>>> -        unsigned long r;                                                \
> > > > > > >>>>>>> +    register struct {                                                   \
> > > > > > >>>>>>> +        typeof(arg) e;                                                  \
> > > > > > >>>>>>> +        char pad[sizeof(void *) - sizeof(arg)];                         \
> > > > > > >>>>>>
> > > > > > >>>>>> One thing that occurred to me only after our discussion, and I then forgot
> > > > > > >>>>>> to mention this before you would send a patch: What if sizeof(void *) ==
> > > > > > >>>>>> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
> > > > > > >>>>>> get rid of.
> > > > > > >>>>>
> > > > > > >>>>> I wondered about this, but I though it was only [] that we were trying
> > > > > > >>>>> to get rid of, not [0].
> > > > > > >>>>
> > > > > > >>>> Sadly (here) it's actually the other way around, aiui.
> > > > > > >>>
> > > > > > >>> The only other option I have in mind is using an oversized array on
> > > > > > >>> the union, like:
> > > > > > >>>
> > > > > > >>> #define ALT_CALL_ARG(arg, n)                                            \
> > > > > > >>>     union {                                                             \
> > > > > > >>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
> > > > > > >>>         unsigned long r;                                                \
> > > > > > >>>     } a ## n ## __  = {                                                 \
> > > > > > >>>         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> > > > > > >>>     };                                                                  \
> > > > > > >>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
> > > > > > >>>         a ## n ## __.r
> > > > > > >>
> > > > > > >> Yet that's likely awful code-gen wise?
> > > > > > > 
> > > > > > > Seems OK: https://godbolt.org/z/nsdo5Gs8W
> > > > > >
> > > > > > In which case why not go this route. If the compiler is doing fine with
> > > > > > that, maybe the array dimension expression could be further simplified,
> > > > > > accepting yet more over-sizing? Like "sizeof(void *) / sizeof (arg) + 1"
> > > > > > or even simply "sizeof(void *)"? Suitably commented of course ...
> > > > > >
> > > > > > >> For the time being, can we perhaps
> > > > > > >> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested?
> > > > > > > 
> > > > > > > My main concern with tightening the BUILD_BUG_ON() is that then I
> > > > > > > would also like to do so for the GCC one, so that build fails
> > > > > > > uniformly.
> > > > > >
> > > > > > If we were to take that route, then yes, probably should constrain both
> > > > > > (with a suitable comment on the gcc one).
> > > > > >
> > > > > > Jan
> > > > >
> > > > > Yet another way would be to have an intermediate `long` to cast onto. Compilers
> > > > > will optimise away the copy. It ignores the different-type aliasing rules in
> > > > > the C spec, so there's an assumption that we have -fno-strict-aliasing. But I
> > > > > belive we do? Otherwise it should pretty much work on anything.
> > > > >
> > > > > ```
> > > > >   #define ALT_CALL_ARG(arg, n)                                              \
> > > > >       unsigned long __tmp = 0;                                              \
> > > > >       *(typeof(arg) *)&__tmp =                                              \
> > > > >           ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })          \
> > > > >       register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = __tmp; \
> > > > > ```
> > > > >
> > > > > fwiw, clang18 emits identical code compared with the previous godbolt link.
> > > > >
> > > > > Link: https://godbolt.org/z/facd1M9xa
> > > > >
> > > > > Cheers,
> > > > > Alejandro
> > > > 
> > > > Bah. s/b/__tmp/ in line15. Same output though, so the point still stands.
> > >
> > > Had to adjust it to:
> > >
> > > #define ALT_CALL_ARG(arg, n)                                              \
> > >     unsigned long a ## n ## __ = 0;                                       \
> > >     *(typeof(arg) *)&a ## n ## __ =                                       \
> > >         ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); });         \
> > >     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = a ## n ## __
> > >
> > > So that tmp__ is not defined multiple times for repeated
> > > ALT_CALL_ARG() usages.
> > >
> > > Already tried something like this in the past, but it mixes code with
> > > declarations, and that's forbidden in the current C standard that Xen
> > > uses:
> > >
> > > ./arch/x86/include/asm/hvm/hvm.h:665:5: error: mixing declarations and code is incompatible with standards before C99 [-Werror,-Wdeclaration-after-statement]
> > >
> > > The `*(typeof(arg) *)&__tmp = ...` line is considered code, and is
> > > followed by further declarations.  Even if we moved both declarations
> > > ahead of the assigns it would still complain when multiple
> > > ALT_CALL_ARG() instances are used in the same altcall block.
> > >
> > > Thanks, Roger.
> >
> > That _was_ forbidden in C89, but it has been allowed since. We have a warning
> > enabled to cause it to fail even if we always use C99-compatible compilers. I
> > think we should change that.
> >
> > Regardless, I think it can be worked around. This compiles (otherwise
> > untested):
> >
> > #define ALT_CALL_ARG(arg, n)
> >     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
> >         unsigned long tmp = 0;                                          \
> >         *(typeof(arg) *)&a ## n ## __ = (arg);                          \
> >         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
> >         tmp;                                                            \
> >     })
> >
> > That said, if the oversized temp union works, I'm fine with that too.
> >
> > Cheers,
> > Alejandro
> 
> Sigh... I'm going at 1 mistake per email today. I meant:
> 
> #define ALT_CALL_ARG(arg, n)
>      register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
>          unsigned long tmp = 0;                                          \
>          *(typeof(arg) *)&tmp = (arg);                                   \
>          BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
>          tmp;                                                            \
>      })

I see, so placing the temp variable on an inner scope.  The code
generated seems to be the same from godbolt.  I don't have a strong
opinion on using either.  Your suggestion is slightly shorter than the
union one, so I might go for it.

Thanks, Roger.

