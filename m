Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2541793C5CB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 16:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765039.1175610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWzrv-00079F-KE; Thu, 25 Jul 2024 14:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765039.1175610; Thu, 25 Jul 2024 14:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWzrv-00077k-GL; Thu, 25 Jul 2024 14:54:59 +0000
Received: by outflank-mailman (input) for mailman id 765039;
 Thu, 25 Jul 2024 14:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwaG=OZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWzru-00077Z-3v
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 14:54:58 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db97351b-4a95-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 16:54:57 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3d9e13ef8edso594429b6e.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 07:54:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8123fb1sm6871261cf.18.2024.07.25.07.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 07:54:55 -0700 (PDT)
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
X-Inumbo-ID: db97351b-4a95-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721919296; x=1722524096; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=onuCBAMg0ZTh1qjbMu/QgglL5loFwS5IkGrwQbw/xOY=;
        b=Y1sdfIUAKzCStGpEuCLr5TOExoG2rTHEZVUgm8vjQ6ySHjgWVzQYSPvk8szUOd+pOb
         H0APt5R/trTxdsYOrT9/1cRJhRu8fRUnoRKUXml2fHET1i1bYw+Bc7HZop7EElT0/0c8
         3ITcoNlxeYhoUmSnckFrqK1wo/VOVlrlrglNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721919296; x=1722524096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onuCBAMg0ZTh1qjbMu/QgglL5loFwS5IkGrwQbw/xOY=;
        b=sx0la0gS2wm28jBF+iF0pmV3+SrHGpqWW/44WVlP3KMNVewQPL8XNPkz1s4WS2C3Im
         GyVDnQY29d0Hc+LoF2P3tMvjFq1w7rBeSThgWmpU84RYG6zlWTNZ8MZN06f+GMdNapaq
         eCbDLYwFfti6fC2jDIGknEi5W+ICw4ylZr0hbJxYesbMlXOqxAK/DoFXXJE6Lky6hioG
         zYJVxUMGJUN8s1L+N9BGONu7vVTCSOqPqcjyKZmPQHQc/Je4ADgQ4sw0s+k7hfDw/B21
         4zFYm3R7q5OTM3kpk1qMqu6YssVaMICtYDPXSqFzOkD1pAPcsioKuTTPPF4cJdjVJoDw
         8uxw==
X-Forwarded-Encrypted: i=1; AJvYcCW6UWuv2Z9j4VxRKPpc8P3rgBYN4vOl2TbSrQVTNUTX9qI8Fh7BjsG1lHWClfoybjSWd/1w26U16eov5U1IkRBrmDDpQOcAUClXwwIGFDY=
X-Gm-Message-State: AOJu0YyqGtAE0X5YWCyJJtpuibW8yJCpE5bpTVQuFIC8e6jO16xdYjmc
	ZTv8j0yDXQ3CAnznmMhJhursvmvKnCJa8FP1z/6R/RViUHTS5a4CpamZepIq7p0=
X-Google-Smtp-Source: AGHT+IF6uIXn51WotDMC7RtYtp1s0/WYA+bKu3G9qQ1Gr1PtkOzcNqb1VglvCEJUHgl+dkvxi+0G/g==
X-Received: by 2002:a05:6808:2029:b0:3d9:2c5a:c81a with SMTP id 5614622812f47-3db142650c7mr2483537b6e.50.1721919296105;
        Thu, 25 Jul 2024 07:54:56 -0700 (PDT)
Date: Thu, 25 Jul 2024 16:54:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
Message-ID: <ZqJnPvL1ilDDzM9V@macbook>
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com>

On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> On 25.07.2024 12:56, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -184,11 +184,11 @@ extern void alternative_branches(void);
> >   * https://github.com/llvm/llvm-project/issues/82598
> >   */
> >  #define ALT_CALL_ARG(arg, n)                                            \
> > -    register union {                                                    \
> > -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> > -        unsigned long r;                                                \
> > +    register struct {                                                   \
> > +        typeof(arg) e;                                                  \
> > +        char pad[sizeof(void *) - sizeof(arg)];                         \
> 
> One thing that occurred to me only after our discussion, and I then forgot
> to mention this before you would send a patch: What if sizeof(void *) ==
> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
> get rid of.

I wondered about this, but I though it was only [] that we were trying
to get rid of, not [0].

> I was wondering whether we could get away resorting to bitfields, as those
> are well-defined when having a width of zero:
> 
>     register struct {                                                   \
>         typeof(arg) e;                                                  \
>         unsigned long pad:(sizeof(void *) - sizeof(arg)) * 8;           \
>     } ...
> 
> Yet when the width is zero, the field may not have name, whereas when the
> field uniformly doesn't have a name, Clang would, like also for
> 
>     register struct {                                                   \
>         typeof(arg) e;                                                  \
>         unsigned long :0;                                               \
>     } ...
> 
> regards that space as not needing any (re)init. Bottom line: For the
> moment I'm out of ideas.

Hm, I see.  I don't have any good ideas right now either.  Will put it
on the back burner and pick up later, already too much on my plate
right now to be playing clang games.  Thanks for your input.

Roger.

