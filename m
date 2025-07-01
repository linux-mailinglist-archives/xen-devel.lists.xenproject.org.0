Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D60AEFEAC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 17:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029840.1403579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWdEt-0000sU-6k; Tue, 01 Jul 2025 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029840.1403579; Tue, 01 Jul 2025 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWdEt-0000pY-3M; Tue, 01 Jul 2025 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 1029840;
 Tue, 01 Jul 2025 15:49:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R3O3=ZO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uWdEr-0000pP-IB
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 15:49:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feaf701f-5692-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 17:49:38 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so36168945e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 08:49:38 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453823c463asm199260165e9.39.2025.07.01.08.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 08:49:37 -0700 (PDT)
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
X-Inumbo-ID: feaf701f-5692-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751384978; x=1751989778; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuZnKl1lnz8pZew7Pe4sj6RSKy7n6QCW5O5lkPScFd4=;
        b=Rw8sSl7YzqK2NL2qfcXxpjBAU+nbrWYgeL2HZprfA2005Y3p9EcKh8hrhlupfMWP4d
         uMKDeLFZHmY7aXKh8jkRhGFDn2rhuc1F935YPuJvjTjUiTMbctwTGDbQrjIwhfj6xIRW
         7Z9zJx/6fEy31PISPtIYfnY7WDvvIvJfbVAvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384978; x=1751989778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuZnKl1lnz8pZew7Pe4sj6RSKy7n6QCW5O5lkPScFd4=;
        b=Y1pFpPRKMJdOWD0d0k5zNqBFY9dMy3jTAPdtfN0gP+U5LFF7SOpbMbd/WsevWEO4RG
         i1h1MhrfVlMzO6EioqZt53R7dDli3WKINP97RsWTkZebJGJumXRs7RicEFqxwcBoscYF
         Q47LZAOTE1kW7TsWH0EC7n4NZtBqOdiL6kpq2MgcfYQHmTw77Cx0LmXSILVqL4XwSKu7
         eATOiiWsfX6cs923HpfLkV14CU9j+sQ+tJNAJFXRSwwLGGXAxDsZFGjVSDPXiaD4zkyU
         CFSNK/GR/gtLPb945Fhxmdcw8gjLxYrJmlNmwt43icVqk51offutr/bjG+laMqAITrdy
         g+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz5jgCbZIqLnvrAtE1xP3ESbG/l7xeNV4dw9T5dbko2atvMunIu2aaeg9Vgkn9Ryg5MoeleDZaoW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH8JTUVJCxao+Xr96/k27QOFYAlLMs+pOGksKidTcz0RYC96RY
	PwdyWWZ/LChk5DEkupWzo85TSKQpoI7inChezuZlbBJIckEws18TczyngFVTcfvEofg=
X-Gm-Gg: ASbGnctIZxM9N2O1p3EDNwYGERGb6wXWkzm4b+qCpJwf5/YEPKK2941X42U0wtG3i8q
	mNr9NAq1xG/EB59GF+VCUs7NBcO4fKgwEu+EDrzfbeJ8AubweMm7/Q+AIXg4QGYsOyKeGsg1LT0
	+rzPU372g7fqi3dwfM4KDHYfOCCKobxXyLzZ9XHJjOXa/vP2JlHNuybH73eeaWtdDFQ5P4fQ1Ka
	0xaRDg9iw+mH+tDLEQ22P1RxXiaHTE0x9l7B/C8cWb11tx3LXa4GSUlGgaowKDLh+60mXWt7x9f
	EmifwAlIEZvLSse6RvGaqu0vAgVBvnFtoldtWb5UQXQEutKm5y//eydVWRJ675CGcI0ZYMsytnX
	zmiWjas22UElKDzPJQblfIryrffyRjdch8MgBOn5Z
X-Google-Smtp-Source: AGHT+IESDoL3Zty7WCyIQ4EtgNU4RIj6usuNQm3u5HqUbxAwBRARNPUlL5JzJI67Nr9W2v6EmznTrg==
X-Received: by 2002:a05:600c:4706:b0:453:8bc7:5e53 with SMTP id 5b1f17b1804b1-4538edf9e08mr213035305e9.0.1751384978051;
        Tue, 01 Jul 2025 08:49:38 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:49:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
Message-ID: <aGQDkIuPbQO4emVK@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
 <e895039e-48a3-4a46-907d-660555b95dcb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e895039e-48a3-4a46-907d-660555b95dcb@suse.com>

On Mon, Jun 30, 2025 at 08:34:52AM +0200, Jan Beulich wrote:
> On 20.06.2025 13:11, Roger Pau Monne wrote:
> > @@ -40,6 +41,8 @@ bool __mfn_valid(unsigned long mfn)
> >  
> >  #ifdef CONFIG_PDX_MASK_COMPRESSION
> >      invalid |= mfn & pfn_hole_mask;
> > +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
> > +    invalid |= mfn ^ pdx_to_pfn(pfn_to_pdx(mfn));
> >  #endif
> >  
> >      if ( unlikely(evaluate_nospec(invalid)) )
> 
> In the chat you mentioned that you would add a check against max_pdx here. While
> that feels sufficient, I couldn't quite convince myself of this formally. Hence
> an alternative proposal for consideration, which imo is more clearly achieving
> the effect of allowing for no false-positive results. In particular, how about
> adding another array holding the PDX upper bounds for the respective region.
> When naming the existing two arrays moffs[] and poffs[] for brevity, the new
> one would be plimit[], but indexed by the MFN index. Then we'd end up with
> 
> 	p = mfn - moffs[midx]; /* Open-coded pfn_to_pdx() */
> 	invalid |= p >= plimit[midx] || p < plimit[midx - 1];
> 
> Of course this would need massaging to deal with the midx == 0 case, perhaps by
> making the array one slot larger and incrementing the indexes by 1. The
> downside compared to the max_pdx variant is that while it's the same number of
> memory accesses (and the same number of comparisons [or replacements thereof,
> like the ^ in context above), cache locality is worse (simply because of the
> fact that it's another array).

I've got an alternative proposal, that also uses an extra array but is
IMO simpler.  Introduce an array to hold the PFN bases for the
different ranges that are covered by the translation.  Following the
same example, this would be:

PFN compression using lookup table shift 29 and region size 0x10000000
 range 0 [0000000000000, 000000807ffff] PFN IDX   0 : 0000000000000
 range 1 [0000063e80000, 000006be7ffff] PFN IDX   3 : 0000053e80000
 range 2 [00000c7e80000, 00000cfe7ffff] PFN IDX   6 : 00000a7e80000
 range 3 [000012be80000, 0000133e7ffff] PFN IDX   9 : 00000fbe80000

pfn_bases[] = { [0] =          0, [3] =  0x63e80000,
                [6] = 0xc7e80000, [9] = 0x12be80000 };

With the rest of the entries poisoned to ~0UL.

The checking would then be:

base = pfn_bases[PFN_TBL_IDX(mfn)];
invalid |= mfn < base || mfn >= base + (1UL << pdx_index_shift);

I think the above is clearer and avoids the weirdness of using IDX +
1 for the array indexes.  This relies on the fact that we can obtain
the PDX region size from the PDX shift itself.

Thanks, Roger.

