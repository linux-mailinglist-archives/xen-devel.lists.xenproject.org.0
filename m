Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CF854AF2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680803.1058936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFoG-0005YE-B5; Wed, 14 Feb 2024 14:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680803.1058936; Wed, 14 Feb 2024 14:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFoG-0005WF-7K; Wed, 14 Feb 2024 14:00:24 +0000
Received: by outflank-mailman (input) for mailman id 680803;
 Wed, 14 Feb 2024 14:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raFoE-0005W7-PH
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:00:22 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64082c3f-cb41-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 15:00:20 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d0cdbd67f0so77878371fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:00:20 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h7-20020ac85147000000b0042c21e75aeesm1997900qtn.64.2024.02.14.06.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 06:00:19 -0800 (PST)
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
X-Inumbo-ID: 64082c3f-cb41-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707919220; x=1708524020; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SK+ljDOJFwB1Pcm4QUM+mo6y8GGH+iEANQ6BOvMG5o4=;
        b=OPAIm1cSzndgve/pIdyXGGQBu9nBuqoZkwWnpv08h4YmolOXGpEBqBRIHk/4skYhHr
         oXkozQWex10B3KAofW9+4ueYAsIDX6AH5vWXEo/d/yjyi2W64SLkmfDDnRNxWE0HnUe2
         xJFl4v+Ua0ALPOFZKsS96pwZGtTk5EQersU38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919220; x=1708524020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK+ljDOJFwB1Pcm4QUM+mo6y8GGH+iEANQ6BOvMG5o4=;
        b=mEpOq4a9AqfATfVCHH6IlTHPhWolBxdLPoqtnySna7lUhbq6rr4ZlnpoS6NUz57wCa
         7Gr8/ZR3gp2MySNDvu0+zONrWxHBuezNq2UmpwyNhQb/hLyOKz4Nrro/GlpdjbIQFs/Z
         TKTxYOE1N7zphhGTz4B/2nsOSIMKKvN4dlmUpZYnjkcfMJC+SycPJZMiT71RJemyW5mO
         vZFzNNQ4h6AvOM8bJVFMJCGYdraXta4MTYnFNrZux9ZBWjChqCJlzvVkyqPnco/pJC2m
         OJA6uy4TdpIau3b8FiIha5B7mTXUcBKoFYxEbEdguKKs8dfkUOtBStpcMMfr2xt6JvWN
         TNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Xw5bYV44vkRaI5Ru/Rej1BzmEOC3BixNny/8Ic6TaX0yxubCTDKJDhcojdky5GGUoyMJ8QL0D9RH/coPyOr0fWggXH7uPJFidbJ+7xE=
X-Gm-Message-State: AOJu0YzNQd5QpQtE94V6BX0BqeMdo6gcEAmd/S+XA9ZhDUQRp4Q+fiKl
	xlTSStm0D5xCpjU+c7r+Zgy7PRC5koBb6x1JX6O+tJBro8PN5cQ5Yxsylr4qXrI=
X-Google-Smtp-Source: AGHT+IF9d+rjt2dxgOmfcpJTuI+BCrZDmQTK1bnJgLnJ1TTDXqNVcaeetIu/UdJF7IN7GK8rAgTkLQ==
X-Received: by 2002:a2e:a686:0:b0:2d0:b3c4:5113 with SMTP id q6-20020a2ea686000000b002d0b3c45113mr2037359lje.11.1707919220207;
        Wed, 14 Feb 2024 06:00:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgl3+Ub4/7Ry97ZnjZsHzIm4TgTAqX/UW8dqsL846sT9HzTo7JG+4/GxQFegO4BD/wrImCxnOK4mFV9vLlwRuMsRZFjThQtSO4NLzAa5DaS0p2g4tkVKhnLJd2YyzyRAQ0d6an805H6+miWPVgMB9mlt88jtuew7bNCxildDvgwZdWaA9IFpnhkIiMElOyowX3Ty1OwjloGaXyPHg=
Date: Wed, 14 Feb 2024 15:00:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/5] mm: add the __must_check attribute to {gfn,mfn}_add()
Message-ID: <ZczHcTSaxM3KJOR_@macbook>
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-6-roger.pau@citrix.com>
 <ff45456b-87bf-4e6c-b2c9-6f3d5258d478@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff45456b-87bf-4e6c-b2c9-6f3d5258d478@suse.com>

On Wed, Feb 14, 2024 at 02:42:46PM +0100, Jan Beulich wrote:
> On 14.02.2024 11:37, Roger Pau Monne wrote:
> > It's not obvious from the function itself whether the incremented value will be
> 
> s/the function itself/just the function name/ ?
> 
> > stored in the parameter, or returned to the caller.  That has leads to bugs in
> > the past as callers assume the incremented value is stored in the parameter.
> 
> ... callers may assume ... ?
> 
> > --- a/xen/include/xen/mm-frame.h
> > +++ b/xen/include/xen/mm-frame.h
> > @@ -23,7 +23,7 @@ TYPE_SAFE(unsigned long, mfn);
> >  #undef mfn_x
> >  #endif
> >  
> > -static inline mfn_t mfn_add(mfn_t mfn, unsigned long i)
> > +static inline mfn_t __must_check mfn_add(mfn_t mfn, unsigned long i)
> >  {
> >      return _mfn(mfn_x(mfn) + i);
> >  }
> > @@ -62,7 +62,7 @@ TYPE_SAFE(unsigned long, gfn);
> >  #undef gfn_x
> >  #endif
> >  
> > -static inline gfn_t gfn_add(gfn_t gfn, unsigned long i)
> > +static inline gfn_t __must_check gfn_add(gfn_t gfn, unsigned long i)
> >  {
> >      return _gfn(gfn_x(gfn) + i);
> >  }
> 
> What about dfn_add() (in xen/iommu.h)?

Oh, didn't spot that one.

Thanks, Roger.

