Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148F79A6A4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599189.934487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfd4a-0002s9-Bf; Mon, 11 Sep 2023 09:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599189.934487; Mon, 11 Sep 2023 09:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfd4a-0002q3-8E; Mon, 11 Sep 2023 09:19:12 +0000
Received: by outflank-mailman (input) for mailman id 599189;
 Mon, 11 Sep 2023 09:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfd4Y-0002on-Sf
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:19:10 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43b33bea-5084-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 11:19:09 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31dd10c2b8bso4115454f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 02:19:09 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adff84d000000b00317909f9985sm9436831wrq.113.2023.09.11.02.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:19:08 -0700 (PDT)
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
X-Inumbo-ID: 43b33bea-5084-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694423949; x=1695028749; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSbWryoPsGoSeDihA0ofIHYN0XidU/oLitp2f2e9FFs=;
        b=Jg6LjWcrw1/0YO1M1bhrQnlp6YXS/avyPnl5XrSEifoDU6WDPQ8Jw+Gs2UFZFZrc2e
         BcOJMJZ8JKqcfnM+nKtxvejgEKOS/VEahwpGI1Ui5BUUO3ACp4/I2BWt7o0+toCTfQ7G
         /q3xx94Ci/oZ+nj2Iwrs6JJsz32dQDc15TX+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694423949; x=1695028749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSbWryoPsGoSeDihA0ofIHYN0XidU/oLitp2f2e9FFs=;
        b=kwTB1Fgy9EDbtHf0e8xL1jK6YjT2qdQ63D3bx3gLuVhK5f5OzMphsATaecHP+sGoP/
         e4rKNDuQygvFxpLCb9s1D/UnCvc5zJilRSxEa49sTX6QMthUo/NEisbgkkHJoyA4xThl
         l0KoHQooPg/Q4iOTZWFCyaTMf9HNpKs5ktAb6ekZecRFzCZcs94GmHD5vF52t0MhfH4c
         og28BFc60eCJvTJ9a/EzFfwju0SHCE4trHCoCoD9cNEjRwg0ywYVy78lnm7EWZjvX1EL
         A+pmfleEbDWX3E82ZA+UGVj9NCX+xmENKpcbrT5fgZWdHLbS6OpB+LpNfEFplb8otNQO
         XCvQ==
X-Gm-Message-State: AOJu0YxRf3LNC9W1keaDJrl4IhhtRpVPiq30dB1Dbk1U7m+ez0M1G/Zh
	eD+bXSNFQPzjIyPQfo2eB6uVGQ==
X-Google-Smtp-Source: AGHT+IEYUJQgmO043QA4C2Sn45rI9QzhUBds6WwFhbpqamMjAGibnKCf9+W3JkPrMe/ntV5hxVpZjA==
X-Received: by 2002:a05:6000:100c:b0:319:8b21:b050 with SMTP id a12-20020a056000100c00b003198b21b050mr6677290wrx.61.1694423949249;
        Mon, 11 Sep 2023 02:19:09 -0700 (PDT)
Date: Mon, 11 Sep 2023 10:19:08 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/2] coverage: update gcov info for newer versions
 of gcc
Message-ID: <v3jhpmsxeeav5a2bhrlfyguadk6pilrzj2psta7qgr3hpgcnai@lb5d4z27r25d>
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f6495eb4c02f6539c5b95d2850d4a834f2ea94e8.1694189143.git.javi.merino@cloud.com>
 <8890cb3e-4538-9b88-cb3c-ae302b7109af@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8890cb3e-4538-9b88-cb3c-ae302b7109af@suse.com>

On Mon, Sep 11, 2023 at 10:00:14AM +0200, Jan Beulich wrote:
> On 08.09.2023 18:20, Javi Merino wrote:
> > Shamelessly copy changes to gcov_info structures from linux so that we
> > can capture coverage for xen built with newer compilers.
> > 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> > ---
> >  xen/common/coverage/gcc_4_7.c | 24 +++++++++++++++++++++---
> >  1 file changed, 21 insertions(+), 3 deletions(-)
> > 
> > diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
> > index ddbc9f4bb0..8f6e287474 100644
> > --- a/xen/common/coverage/gcc_4_7.c
> > +++ b/xen/common/coverage/gcc_4_7.c
> > @@ -24,14 +24,23 @@
> >  #define GCOV_COUNTERS 9
> >  #elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
> >  #define GCOV_COUNTERS 10
> > -#elif GCC_VERSION >= 70000
> > +#elif GCC_VERSION >= 70000 && GCC_VERSION < 100000
> >  #define GCOV_COUNTERS 9
> > +#elif GCC_VERSION >= 100000
> > +#define GCOV_COUNTERS 8
> >  #else
> >  #error "Wrong version of GCC used to compile gcov"
> >  #endif
> 
> This would need adjustment if patch 1 is adjusted as suggested, then ...
> 
> >  #define GCOV_TAG_FUNCTION_LENGTH        3
> >  
> > +#if GCC_VERSION >= 120000
> > +/* Since GCC 12.1, sizes are in BYTES and not in WORDS (4B). */
> > +#define GCOV_UNIT_SIZE 4
> > +#else
> > +#define GCOV_UNIT_SIZE 1
> > +#endif
> 
> ... making the earlier group also match this one (which already works
> downwards in version number space).

True

> As to the comments (here and below): Since the version check is for
> 12.0, may I suggest to simply say "gcc 12" everywhere?
> 
> > @@ -89,6 +98,10 @@ struct gcov_info {
> >      unsigned int version;
> >      struct gcov_info *next;
> >      unsigned int stamp;
> > +#if (GCC_VERSION >= 120000)
> 
> Nit: Here any below parentheses likely want omitting, to match there
> being none further up. Preferably with the adjustments (which again
> I'd be okay doing while committing, so long as you agree)
> Acked-by: Jan Beulich <jbeulich@suse.com>

I'm ok with those changes and I'm fine with you doing them.

Cheers,
Javi

