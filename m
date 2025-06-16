Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E45ADB1D1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 15:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017270.1394251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9s4-0003ae-Mp; Mon, 16 Jun 2025 13:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017270.1394251; Mon, 16 Jun 2025 13:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9s4-0003ZD-KC; Mon, 16 Jun 2025 13:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1017270;
 Mon, 16 Jun 2025 13:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppVY=Y7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uR9s3-0003Z7-Pd
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 13:27:31 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6bc6ec1-4ab5-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 15:27:29 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso15113945e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 06:27:29 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568a547d2sm11372198f8f.19.2025.06.16.06.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:27:27 -0700 (PDT)
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
X-Inumbo-ID: a6bc6ec1-4ab5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750080449; x=1750685249; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4HcH+lDGi4qpO9OpyIzLWxRMkCgRucsPoW+TGYmfvs=;
        b=JnUSuUPY8h8AXxZHXoE3MBlRHzvVDIbwgVf15birF991agDkVlRHCXQlBWOJNbZB+T
         FoLtNfCgFFRosmQt1OOdMkbCeGu3dAaxzleJJGlSo7/tmM1JyRqheeqrYumObNWKM53P
         JsLVgT0k0q3r3K5xynraOTQVKCTSKtoptqhhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080449; x=1750685249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4HcH+lDGi4qpO9OpyIzLWxRMkCgRucsPoW+TGYmfvs=;
        b=O9Dj8j57LfOiTh8gLHdrBl5zyHSTxQgQsDyb69Vi1773XuNN223gVPZEqS8Ni/jK+d
         ue/ndvc1fVMN9dL66aNOYy4TYyWgdG1kUKdTi9OkUqbbAFzpdQcWoAcJkT6DHI7qs8aQ
         DjaFa/j3JIgFF3q0tzlBaMUILQ3DvFLYh3/ISUaeyW8ewSYE6kzZr4GYe/xTFuzR8qTV
         qJY7cZjny34dCNf+ZIcQjSSIy1sjdSLxt+dk1dgw5NZtszuCx9pLQ6AW3nZwvYytQEjl
         ohV0wp0Rs80KZCaLbhKnXhLaA094y1DFhKBWZVcnzL03ZsEZURk+Dblg1uFwQYvUtuz3
         1Pyg==
X-Gm-Message-State: AOJu0YzLr2eEra3jUKYGU5v098YNar8Ow3MbwoLU21F/xv4CP4cekkVk
	dNJ+PPRhzZv097UUPxXKNs1eq4FupkmFfIZMvlNCUKTkI8MXPM+PHxLK5XxXkEWrrd4=
X-Gm-Gg: ASbGncs/LgCaph5GomQ3WNfhwy4A6c7OTxNfQDl4hgIQl9bndJDm9E6LfgAwnkwUW1w
	ymg8FpkoFM7qLqTuUpgQ9LT2Dfsc7ncxmsuH36N3AwJTPUQadKgNCCqAc8qWXuvDcI2pAVchevO
	mcedWD5IkwZ47pIV34sVnJYgzxR3q9/ue35TjmFjqCILM5nDoFFxAWQIrtyqNLtFqmD4MKXuUz4
	ipthzMF1oCMEyzeRmakyuNKCDvWeYIZoKDmQSfukSvmK25LVWJSj+79a041/VZMw2jcc12BVTSh
	ywmpK07bzv/NINLMLfZN2uF8mOlVpO1kSvx7QP6FTPh8FX6f3u3FXE1xNCbXJo+wpYymwxHHgLu
	Q6FSxuRbRDsiz7tUgn0PXhR7b5CfVyhPQcXA=
X-Google-Smtp-Source: AGHT+IEwwayFXDezRmzlmgCJpJIaRn2NliXWt0j2ArJ7MYm9tKPltf5XVBkjESVnhz+7xvIeA7Wq2w==
X-Received: by 2002:a05:6000:290b:b0:3a5:2e84:cc7b with SMTP id ffacd0b85a97d-3a57238b7f2mr7257369f8f.11.1750080448986;
        Mon, 16 Jun 2025 06:27:28 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:27:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] memory: arrange to conserve on DMA reservation
Message-ID: <aFAbqhfmM_GBxjVC@macbook.local>
References: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6565e881-ec59-4db4-834a-f694bf1b9427@suse.com>

On Tue, Feb 25, 2025 at 03:58:34PM +0100, Jan Beulich wrote:
> Entities building domains are expected to deal with higher order
> allocation attempts (for populating a new domain) failing. If we set
> aside a reservation for DMA, try to avoid taking higher order pages from
> that reserve pool.
>
> Instead favor order-0 ones which often can still be
> supplied from higher addressed memory, even if we've run out of
> large/huge pages there.

I would maybe write that last sentence as:  force non zero order
allocations to use the non-DMA region, and if the region cannot
fulfill the request return an error to the caller for it to retry with
a smaller order.  Effectively this limits allocations from the DMA
region to only be of order 0 during physmap domain population.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> RFC: More generally for any requests targeting remote domains?

I think doing the limitation for domain creation is fine, the more
that there are also other flags there.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -192,6 +192,14 @@ static void populate_physmap(struct memo
>           * delayed.
>           */
>          a->memflags |= MEMF_no_icache_flush;
> +
> +        /*
> +         * Heuristically assume that during domain construction the caller is
> +         * capable of falling back to order-0 allocations, allowing us to
> +         * conserve on memory otherwise held back for DMA purposes.
> +         */
> +        if ( a->extent_order )
> +            a->memflags |= MEMF_no_dma;

For PV domains: is it possible for toolstack to try to allocate a
certain amount of pages from the DMA pool for the benefit of the
domain?

I also wonder if it would make sense to attempt to implement the
logic on the toolstack side: meminit_{hvm,pv}()?

No strong opinion, but slightly less logic in the hypervisor, and
won't change the interface for possibly existing toolstacks that don't
pass MEMF_no_dma on purpose.

Thanks, Roger.

