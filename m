Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E5985F58
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 15:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803990.1214847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSUL-0004Gl-Ky; Wed, 25 Sep 2024 13:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803990.1214847; Wed, 25 Sep 2024 13:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSUL-0004EV-IP; Wed, 25 Sep 2024 13:55:29 +0000
Received: by outflank-mailman (input) for mailman id 803990;
 Wed, 25 Sep 2024 13:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stSUL-0004EP-32
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 13:55:29 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d17cce28-7b45-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 15:55:27 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so854734466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 06:55:27 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cb0afsm210575066b.138.2024.09.25.06.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:55:26 -0700 (PDT)
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
X-Inumbo-ID: d17cce28-7b45-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727272526; x=1727877326; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ROTjEnKJxL57B5fWN0TIbo0ChriJWF+JYVCoP2RyLU=;
        b=bT+QVoLp7e9e8LusIcYnQ5Kqoi+va5Jfka04y/UN3vHQgC1prqD4gQcQvApA7DeTXS
         a7OMKa9bngmrurwhMcQS120GQFuy48AT0lH+Yu3gY8EgX6HfB1u3SW8wsuL3t3kDmEor
         weIcmvrwPmplOKLdL5aBDkSZeXF/LQnmt+iS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727272526; x=1727877326;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ROTjEnKJxL57B5fWN0TIbo0ChriJWF+JYVCoP2RyLU=;
        b=P6o344a9QIjpibcgetUqY2+I//hlwA8oX46oZoPxtDz64oqVTyQGJmwSO8voq5Bcui
         Q0Wguk2Kg6xv5apmEwdILkVyYWPpJctQJ5UyHYsxpyXHLzTdQToj5S3KIkTAvje8A0Z2
         pK1XskiFBmRVFH2E5TXpdIJiJ2VRwZYzvLDsB1LLyW9uV5sXJJOiKc3brlUMJ/N3ECPi
         /LEjFKxWlsk0Mo2hZyS6gxoYg3FUvEla9hh5CpZPBIqfJ/gFmOMtg7zR92MGhf0N4rzI
         8Aut/DEi90yhsB8w8wSCKILT6ZwR0+UVdTL2CTkxN3e7VsvTERBPL/GFvSSMinZuDOz5
         Nr8g==
X-Gm-Message-State: AOJu0Ywdwc3tou7kMBTe8okUBf6XOfQozeNUAuJ10ySFSltyBnQdMyq7
	py0vJIXEHhCWXjXN2HDzL5VSj3owifdsfeiU5cPphTWxTxVHLHCD9LtDVP5P8/A=
X-Google-Smtp-Source: AGHT+IEOb9inat3k6yOE2UeHfoW2pTwMngDDTyQieMl5Qa2O1AJNreWiOgTc8nrxBjKSEa7yhqhxsA==
X-Received: by 2002:a17:907:1ca1:b0:a8c:78a5:8fc4 with SMTP id a640c23a62f3a-a93a036a36bmr219989966b.19.1727272526366;
        Wed, 25 Sep 2024 06:55:26 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:55:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 5/6] x86/alternatives: do not BUG during apply
Message-ID: <ZvQWTSr7o8V3UW6p@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-6-roger.pau@citrix.com>
 <00ad838a-a086-4b18-a32e-0a4a6cd52fe4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00ad838a-a086-4b18-a32e-0a4a6cd52fe4@citrix.com>

On Wed, Sep 25, 2024 at 11:53:30AM +0100, Andrew Cooper wrote:
> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> > alternatives is used both at boot time, and when loading livepatch payloads.
> > While for the former it makes sense to panic, it's not useful for the later, as
> > for livepatches it's possible to fail to load the livepatch if alternatives
> > cannot be resolved and continue operating normally.
> >
> > Relax the BUGs in _apply_alternatives() to instead return an error code.  The
> > caller will figure out whether the failures are fatal and panic.
> >
> > Print an error message to provide some user-readable information about what
> > went wrong.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Much nicer.  A few more diagnostic comments.
> 
> > diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
> > index 7824053c9d33..c8848ba6006e 100644
> > --- a/xen/arch/x86/alternative.c
> > +++ b/xen/arch/x86/alternative.c
> > @@ -198,9 +198,29 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
> >          uint8_t buf[MAX_PATCH_LEN];
> >          unsigned int total_len = a->orig_len + a->pad_len;
> >  
> > -        BUG_ON(a->repl_len > total_len);
> > -        BUG_ON(total_len > sizeof(buf));
> > -        BUG_ON(a->cpuid >= NCAPINTS * 32);
> > +        if ( a->repl_len > total_len )
> > +        {
> > +            printk(XENLOG_ERR
> > +                   "alt replacement size (%#x) bigger than destination (%#x)\n",
> 
> These all say "some alternative went wrong", without identifying which. 
> For x86_decode_lite(), debugging was far easier when using:
> 
> "Alternative for %ps ...", ALT_ORIG_PTR(a)
> 
> If we get the order of loading correct, then %ps will even work for a
> livepatch, but that's secondary - even the raw number is slightly useful
> given the livepatch load address.

I don't think this will work as-is for livepatches.  The call to
register the virtual region is currently done in livepatch_upload(),
after load_payload_data() has completed.

We could see about registering the virtual region earlier (no
volunteering to do that work right now).

> I could be talked down to just "Alt for %ps" as you've got it here.  I
> think it's clear enough in context.  So, I'd recommend:
> 
> "Alt for %ps, replacement size %#x larger than origin %#x\n".
> 
> Here, I think origin is better than destination, when discussing
> alternatives.

Sure.

> I can adjust on commit.  Everything else is fine.

If you are comfortable with doing the adjustments on commit, please go
ahead.

Thanks, Roger.

