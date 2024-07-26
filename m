Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1893CF14
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 09:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765314.1175906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFka-00020g-Ma; Fri, 26 Jul 2024 07:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765314.1175906; Fri, 26 Jul 2024 07:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFka-0001xh-JN; Fri, 26 Jul 2024 07:52:28 +0000
Received: by outflank-mailman (input) for mailman id 765314;
 Fri, 26 Jul 2024 07:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXFkY-0001xb-Q9
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 07:52:26 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe26d0b6-4b23-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 09:52:23 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7a1dd1b24e6so22822785a.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 00:52:23 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d74353f1sm153533485a.75.2024.07.26.00.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 00:52:22 -0700 (PDT)
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
X-Inumbo-ID: fe26d0b6-4b23-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721980342; x=1722585142; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iNrrXtP4YrdJB1scfRd9oYdx5XBXMRM65ppWgEEeKmA=;
        b=r3ViufThka6DH3YANPkGLIuM65YQmljSRHJK1Rk8IRRzNLPXS73HbclfupEXGesXZJ
         4S4c81L26oWEpLS4UJ5qFjlmiub4f7n3praVUX5gtdGtVFdSUEzqMRvUgUX+F+j+ib+3
         RYke/iqKJ7Ip1oeBQmxausQBMyaNDGJeIVrEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721980342; x=1722585142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNrrXtP4YrdJB1scfRd9oYdx5XBXMRM65ppWgEEeKmA=;
        b=q2QiMQ8ZOVyAbqZ4tnIbFseZJL94V2glVcgfSx2YXzqmud5ZBjeBdJCKt6pEYuqfhy
         2yU/qtVMebY2c5qZVDmG1yZGVr4dZrkjH6+mK6qxLnPf11GFNFwiTRcUuH1U6zg//q2K
         tnH24R1HH+LZdnU/sUzGJtQ4KJZNm3If5pmCStUVSvsUg3ryFdjLeRZAQfZRsBqJ0ZGg
         VGd0cEmlHYqe3H6Dw7mg51hSm58LgtHb7AmqRZ83Bn85scUKc1fkGlLk63piN0ewMN5p
         phDx8GcKQX4a+Tx8Yx5vkUmYu9XuGDGIfR9GJ2yWlBeShnvK0S7Qc56+hnEjlEQHFQj/
         U6pw==
X-Forwarded-Encrypted: i=1; AJvYcCU/VoKnzs3Kv2dQ/oL2EvdMQ7f05NDda9BGSUUwoqsFlcidp5AaTj2SlsA/XLaZzZcpNWn/v4eNW+JUheP83HRQlLN0J3/0e0B37YVcRPY=
X-Gm-Message-State: AOJu0YxNgfPM3DIMzl58K611bBC+sQ1wTI26Ug/k5xJ+u0/pNrZAEJgG
	fne1F8t8esJbf4wwSfrBvH244bvaXGRLsyRItBgvk4IN8TSh3AbCYdMATq32Ydw=
X-Google-Smtp-Source: AGHT+IEXDQUD7OeMv0PoAd4c8HOiI1r7Z7shUU/ZS6DDnIgFZsuiEtqB8iuVZJXYKrEXSX6zGyt9UQ==
X-Received: by 2002:a05:620a:25c9:b0:79f:1382:9256 with SMTP id af79cd13be357-7a1d453db69mr672054785a.60.1721980342492;
        Fri, 26 Jul 2024 00:52:22 -0700 (PDT)
Date: Fri, 26 Jul 2024 09:52:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
Message-ID: <ZqNVs97wexqd5trA@macbook>
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com>
 <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com>
 <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com>

On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
> On 26.07.2024 09:31, Roger Pau Monné wrote:
> > On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> >> On 25.07.2024 16:54, Roger Pau Monné wrote:
> >>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> >>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
> >>>>> --- a/xen/arch/x86/include/asm/alternative.h
> >>>>> +++ b/xen/arch/x86/include/asm/alternative.h
> >>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
> >>>>>   * https://github.com/llvm/llvm-project/issues/82598
> >>>>>   */
> >>>>>  #define ALT_CALL_ARG(arg, n)                                            \
> >>>>> -    register union {                                                    \
> >>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> >>>>> -        unsigned long r;                                                \
> >>>>> +    register struct {                                                   \
> >>>>> +        typeof(arg) e;                                                  \
> >>>>> +        char pad[sizeof(void *) - sizeof(arg)];                         \
> >>>>
> >>>> One thing that occurred to me only after our discussion, and I then forgot
> >>>> to mention this before you would send a patch: What if sizeof(void *) ==
> >>>> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
> >>>> get rid of.
> >>>
> >>> I wondered about this, but I though it was only [] that we were trying
> >>> to get rid of, not [0].
> >>
> >> Sadly (here) it's actually the other way around, aiui.
> > 
> > The only other option I have in mind is using an oversized array on
> > the union, like:
> > 
> > #define ALT_CALL_ARG(arg, n)                                            \
> >     union {                                                             \
> >         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
> >         unsigned long r;                                                \
> >     } a ## n ## __  = {                                                 \
> >         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
> >     };                                                                  \
> >     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
> >         a ## n ## __.r
> 
> Yet that's likely awful code-gen wise?

Seems OK: https://godbolt.org/z/nsdo5Gs8W

> For the time being, can we perhaps
> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested?

My main concern with tightening the BUILD_BUG_ON() is that then I
would also like to do so for the GCC one, so that build fails
uniformly.

Thanks, Roger.

