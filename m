Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB383AD3757
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 14:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010751.1388932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyT1-0000wE-4L; Tue, 10 Jun 2025 12:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010751.1388932; Tue, 10 Jun 2025 12:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyT1-0000uW-1m; Tue, 10 Jun 2025 12:52:39 +0000
Received: by outflank-mailman (input) for mailman id 1010751;
 Tue, 10 Jun 2025 12:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uOyT0-0000uQ-3h
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 12:52:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8f6e0eb-45f9-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 14:52:37 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4530921461aso20679305e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 05:52:37 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45209ce5045sm140054855e9.16.2025.06.10.05.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:52:35 -0700 (PDT)
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
X-Inumbo-ID: c8f6e0eb-45f9-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749559956; x=1750164756; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QNwNGuZDjfSKW+hJnEnicX5F+61CXU5mF5s0DDQPyEo=;
        b=A0nwNhyHPM0/deqGnyBWXqFhvsBIC5pPh5e8VBQrNi5loKm6HUZSQW/9He6itOkcvH
         vnKna4rODjUI8czAUdoos8eD3t2V7GiRoU6LriTH7f18WHepE+l5mynj/TnfJEWGKABW
         JRXLRK93W6AnmexqXgN5zI3jp92dBv19Q1jxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559956; x=1750164756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNwNGuZDjfSKW+hJnEnicX5F+61CXU5mF5s0DDQPyEo=;
        b=QwJcpKVwvZxjKhC0ZB6quDwht0fAZqOmf+qyy3Mf/d4PoYdlrBcmh7rLzNMIMot+h1
         MaFxqvBn5Ok4gVncnUIZ3Y69foNO1P/ow1gYkRpMq4hSK/W2NeKC4Zao4IM8rBoVDyh8
         dStwPs2AEEQxCWK+mdZclN34OCWVra1HufGlzd5Vi7zaK2CfmHYGg2G76e1lE/6n6B4L
         Yk52a0Mv2Orah1kXzEmPwwtb82xWWb5Q8dlUo3zo119fVIAR6ns+8F20TLtMMyniOeSq
         NIdVWX2FPPNOOcO2KlIHSFjZEZzTimUUbc6p/Gw0a+4vs8OEWSOdEeFPNfI/+gki5gtj
         ZSiA==
X-Forwarded-Encrypted: i=1; AJvYcCVmWxq7Ffpajc2g20XkUbjMUTZeR3mUNTlHBfnpPLZurBoSi/qXBHEStZlvwwr1uCY8SX4fJ9h9L2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9RpeC6n/j7ND1vlz4lVyVSLGFmddnaJlCfotpVfs+lsssk+vO
	KkTFCoNZUtQef1ewCx0+iF7zpZc2lmTTsVNd8p/SXyfh74HNWIBVJb0X6r/eAuMxSMc=
X-Gm-Gg: ASbGncuM8zrf9m0WmlewLAOpS/0LnGhaX+fXnbaeD4LEV/aJjaDM6eS6d0B3VGYGHeR
	gYgasymz8Y18+h4v+lMNh0FcxXNIs2X0gJhgNjF1fvqERUtshc+JiWVe0GThR+4XeS8MRNNjLZp
	ZeebBG4R9P6hl7bW9O6xZ4nCIQOMO1jSB8aqCePEzS91wEcCiAOvZGhCS23ytsRqE0EmKYk8Sey
	WkhrJSUUPR//duhF5LHdteK0ahLkzsJMdgJyLqTpyWzZ/9KYe3ljJxKGD07kqNI2jhJKa/JDMXD
	qwQ+CEhODbJ0kqg0+i1t+b4znO9E1evEv9dL/AG4Njt1FR3lN5N8MZz8DkHljUr7EtieIAWsWO1
	npoDomcNLT4sN6oP6KciN6FbjPIzXMTzm0rI=
X-Google-Smtp-Source: AGHT+IGmy475I5ChoYkxK9sPKY1SL97jwihsfcdPWwI+lLhob3jS+PnFAN3hOM1t999T6d3ccfW8DQ==
X-Received: by 2002:a05:600c:3d94:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-45201417fccmr141387435e9.7.1749559956263;
        Tue, 10 Jun 2025 05:52:36 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:52:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/11] xen/page_alloc: Remove `claim` from
 domain_set_outstanding_pages()
Message-ID: <aEgqkspPESa7D42P@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-3-alejandro.vallejo@cloud.com>
 <aEHJEc5Pht5xcMfO@macbook.local>
 <89d4250e-20aa-4515-8199-7003afb0bcbf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89d4250e-20aa-4515-8199-7003afb0bcbf@suse.com>

On Tue, Jun 10, 2025 at 02:23:26PM +0200, Jan Beulich wrote:
> On 05.06.2025 18:42, Roger Pau Monné wrote:
> > On Fri, Mar 14, 2025 at 05:24:53PM +0000, Alejandro Vallejo wrote:
> >> With a single global count for the claims it's easy to substract
> >> domain_tot_pages() from the claim so the number given in the hypercall
> >> is the real reservation of the domain. This is the current behaviour.
> >>
> >> However, a later patch introduces exact-node claims and those interact
> >> very poorly with such a scheme. Since accounting domain_tot_pages() in
> >> one case but not the other seems strictly worse than not accounting them
> >> at all (which is at least consistent), this patch stops substracting
> >> tot_pages from the claim and instead checks that claimed memory +
> >> allocated memory don't exceed max_mem.
> > 
> > Hm, while I don't have any specific interest in keeping the current
> > behavior, XENMEM_claim_pages is part of the stable ABI (it's not a
> > domctl), and hence should be stable.
> 
> Is that true? It sits inside a
> 
> #if defined(__XEN__) || defined(__XEN_TOOLS__)
> 
> which generally de-marks unstable (tools-only) interfaces.

Ops, my bad, I didn't realize it was inside such region.

> >  Note also the comment above the
> > definition of XENMEM_claim_pages how it states the specific behavior
> > that you are trying to change (and which should have been adjusted as
> > part of this change).
> 
> This is the more important part, imo.

I see.  Well, it's in a kind of a weird position then, because there's
no equivalent of XEN_DOMCTL_INTERFACE_VERSION that we could use to
signal callers of the changed interface, like we do for domctl.

Thanks, Roger.

