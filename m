Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E499A503
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 15:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817087.1231197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFhU-0007gP-LX; Fri, 11 Oct 2024 13:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817087.1231197; Fri, 11 Oct 2024 13:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szFhU-0007e3-I4; Fri, 11 Oct 2024 13:29:00 +0000
Received: by outflank-mailman (input) for mailman id 817087;
 Fri, 11 Oct 2024 13:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZOt=RH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1szFhS-0007dx-RV
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 13:28:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4e82306-87d4-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 15:28:57 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9943897c07so283087766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 06:28:57 -0700 (PDT)
Received: from CSGPROD108744 ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc496sm211862166b.154.2024.10.11.06.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 06:28:56 -0700 (PDT)
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
X-Inumbo-ID: c4e82306-87d4-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728653337; x=1729258137; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+F7c2a/qw7d7O2Jv1xLoPJcgy9VvAbNEkev+VTUBnhE=;
        b=Stk55+SaQzhueO1sC+wBx7qIUcwMPMsI5kQ0T/pOyaVDki0SQrUCNbJ9tvcMwJIvII
         W4htvUJA00ZSkxxhMLq90Xo6NtRAf/JxkR3Zx8QKT0bgSSyitOMxGuynO0+wghCRGiXQ
         2h9rMuqTzulBWHPsX38ltTrc8+HRKw32myca4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653337; x=1729258137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+F7c2a/qw7d7O2Jv1xLoPJcgy9VvAbNEkev+VTUBnhE=;
        b=BOajMpL49L7oM8pvpGJ5QimBzGxp/PGMRCA3ndlPlVlVpl9mSvx7Wto0Bgztiwj2p0
         9+Yifr4+O8Lz/X7kvt1SAnHGqKXtSX3I1zE2vlw43ceVukZZxYT2o4h0kfxq6Gp5rhK6
         j9Lg6GZ4qTbxPT361WabGvY4vqdQkl5qvpPo2xG7hiUzg3h9lfCLUwvTcdOgQLvi3j9E
         0G1wVSuTfhvApU2XUztycsNInKzlB8u/c1YFa0Ae/s2+E1OfagHCC7la3TrP8MCkg/Wg
         hrVZF94wNXVtNEx8XqeyFcgtwRI7dqbQkXIrzcA5a6KdyuakA6rDlbOctkf46ahjUVwc
         4UKQ==
X-Gm-Message-State: AOJu0YyaBSsrHnbquUEYSXmeG/NgT6BvYQp+zC0ZnSaj/G3MsDuHBPdZ
	lM0zhOjRnpmWU/BnZf5+oOAOnenJOvx1eP7rF0zrT9IzEuqVfSttvtR8zItQfmOl/VO4MZv5bAy
	T
X-Google-Smtp-Source: AGHT+IGdgakA46rWfRtZkuQ22Yop9RLrmarwhTUa2iS9xpATG0KtC8f9OF2IbyFah3EZW7aTGb2TCg==
X-Received: by 2002:a17:907:980d:b0:a99:d1f3:796f with SMTP id a640c23a62f3a-a99d1f40565mr49147666b.15.1728653337264;
        Fri, 11 Oct 2024 06:28:57 -0700 (PDT)
Date: Fri, 11 Oct 2024 14:28:55 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/5] x86/boot: Clarify comment
Message-ID: <wbpdfwa3hgjqkixl7usy7ta3r4337txb5ppvj74oat2no5wk52@sisyzgauolhq>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-6-frediano.ziglio@cloud.com>
 <uvlmtx752sl45xmsy7o2unxa7rxwwen7eu4lutszfsoprre4sj@b5wre6lirrpf>
 <CACHz=ZgUbDEJOo0f5SBzOZCVDNkaGBrbkBAPSND8Sby0bkJ8+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=ZgUbDEJOo0f5SBzOZCVDNkaGBrbkBAPSND8Sby0bkJ8+Q@mail.gmail.com>

On Fri, Oct 11, 2024 at 02:08:37PM +0100, Frediano Ziglio wrote:
> On Fri, Oct 11, 2024 at 1:56 PM Alejandro Vallejo
> <alejandro.vallejo@cloud.com> wrote:
> >
> > On Fri, Oct 11, 2024 at 09:52:44AM +0100, Frediano Ziglio wrote:
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > ---
> > >  xen/arch/x86/boot/reloc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> > > index e50e161b27..e725cfb6eb 100644
> > > --- a/xen/arch/x86/boot/reloc.c
> > > +++ b/xen/arch/x86/boot/reloc.c
> > > @@ -65,7 +65,7 @@ typedef struct memctx {
> > >      /*
> > >       * Simple bump allocator.
> > >       *
> > > -     * It starts from the base of the trampoline and allocates downwards.
> > > +     * It starts on top of space reserved for the trampoline and allocates downwards.
> >
> > nit: Not sure this is much clearer. The trampoline is not a stack (and even if
> > it was, I personally find "top" and "bottom" quite ambiguous when it grows
> > backwards), so calling top to its lowest address seems more confusing than not.
> >
> > If anything clarification ought to go in the which direction it takes. Leaving
> > "base" instead of "top" and replacing "downwards" by "backwards" to make it
> > crystal clear that it's a pointer that starts where the trampoline starts, but
> > moves in the opposite direction.
> >
> 
> Base looks confusing to me, but surely that comment could be confusing.
> For the trampoline 64 KB are reserved. Last 4 KB are used as a normal
> stack (push/pop/call/whatever), first part gets a copy of the
> trampoline code/data (about 6 Kb) the rest (so 64 - 4 - ~6 = ~54 kb)
> is used for the copy of MBI information. That "rest" is what we are
> talking about here.

Last? From what I looked at it seems to be the first 12K.

   #define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
   #define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)

To put it another way, with left=lo-addr and right=hi-addr. The code seems to
do this...

 |<--------------64K-------------->|
 |<-----12K--->|                   |
 +-------------+-----+-------------+
 | stack-space | mbi | trampoline  |
 +-------------+-----+-------------+
               ^  ^
               |  |
               |  +-- copied Multiboot info + modules
               +----- initial memctx.ptr

... with the stack growing backwards to avoid overflowing onto mbi.

Or am I missing something?

Cheers,
Alejandro

