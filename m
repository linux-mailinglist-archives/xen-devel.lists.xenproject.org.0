Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC74A5C19C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 13:47:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908094.1315248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trz0Q-0003G9-PN; Tue, 11 Mar 2025 12:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908094.1315248; Tue, 11 Mar 2025 12:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trz0Q-0003ER-MU; Tue, 11 Mar 2025 12:46:46 +0000
Received: by outflank-mailman (input) for mailman id 908094;
 Tue, 11 Mar 2025 12:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trz0O-0003EL-To
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 12:46:45 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2c91508-fe76-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 13:46:43 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac29fd22163so370908066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 05:46:43 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac283e4d50csm510721666b.175.2025.03.11.05.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 05:46:42 -0700 (PDT)
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
X-Inumbo-ID: e2c91508-fe76-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741697203; x=1742302003; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3x8r2j2bFWEU/AX/TOWZ82cqR6clh2v+jAveGkPY5g=;
        b=ORK8pjoVoqAnv+nM1Y9P+OsJ6fiuxNP7YBkQTHH4Nh/4iNGWWuJejOMm8WEIBLOIxm
         pADdqbXbF1xgEl0XZLOqeSjR51R5qASR2prZDKI2s1j74rU4T515nIisfVIL9Peud3gN
         fL2MjmmzTLmdER+pMYEvvccuY/4xbSTgSuGG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741697203; x=1742302003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3x8r2j2bFWEU/AX/TOWZ82cqR6clh2v+jAveGkPY5g=;
        b=G6EN7m3omXC/ih0mjCUa1sZFM2v9UmmWFMtUdqWMuLd+Ez5uvUPldSpDe5vf0THx2a
         VFv1o7cPtEk5ezUTy/2IDWzvX2PnnhSFbiRKInWKGIU9EzJm6PBlvbz1sA3CLYVs5JFP
         qU9hni0d0KpPm0dDzVswspoKgt3XE/v+UqQpeETBXlgXQ46CZf5gEYHjqbC5N9nrNTjK
         ifhRaEl6D9RsALOvFu8is1tqTZhhsYaljuZFxJJAXgDUS2VK395NvahJaKYXXHuFz1BM
         E5+KC0FNVxVwdOa5MNkuW2h2I7oR9lX16L1uCdHEKEcIB3EtjYh7dqaKojrjUyNHS1hx
         pbqw==
X-Gm-Message-State: AOJu0YzHUaRgyi4ehzU8HetbRAdm/nBZglN4EwyeYaU4sLemXwnh9jOO
	JL6jAhJjmiG269GfFpgxy/vmyVAi6fbMWp+9zXG0L7c3eWPca+mCiMb9wCQCX3U=
X-Gm-Gg: ASbGncurNvcl3sZcgT1weB9HtmDEsxmYXFWigYe1+fm97iaypc7gjvAEFn/9SpFWt1A
	gJQMu1F1Bcwi4VkSxXcT/GQsW+A3bFCs4H9bq2ACKdakqqjJqAJoJ19sjQ46cJrD9/h2b038hZp
	yjO30ae/NLoIQ6wIA1wbnFooiPTi06Cf8g5GhMA2EP4wGhkKRpLU2P0e9D1yOExLVrWkvNdLlZH
	nQV457DdM7QhWcDfzx9IW9hoHSJoBfO2NhM+yQ9C/4Kgel3IIV5O/YV8t0y8vsZIdXr+5pAqEMa
	bSJYOf2oWFrOWziBs0xRPjPVtRe4iWZYKAaPgGmtqkGAjg7HLyZDw/mMIY2+
X-Google-Smtp-Source: AGHT+IEmh++4k4e08aPMnDxffH2SaJzZ1s/r66VHvWDEGVNYmmmqy4L77QF6fcXcW5RwaiUjfuXrTA==
X-Received: by 2002:a17:907:3608:b0:abf:6bf6:a397 with SMTP id a640c23a62f3a-ac252a9e1afmr1865519766b.15.1741697203182;
        Tue, 11 Mar 2025 05:46:43 -0700 (PDT)
Date: Tue, 11 Mar 2025 13:46:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
Message-ID: <Z9AwsrDBELe2UREz@macbook.local>
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304111000.9252-1-alejandro.vallejo@cloud.com>

On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
> The logic has too many levels of indirection and it's very hard to
> understand it its current form. Split it between the corner case where
> the adjustment is bigger than the current claim and the rest to avoid 5
> auxiliary variables.
> 
> Add a functional change to prevent negative adjustments from
> re-increasing the claim. This has the nice side effect of avoiding
> taking the heap lock here on every free.
> 
> While at it, fix incorrect field name in nearby comment.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I think it would be nice to also ensure that once the domain is
finished building (maybe when it's unpaused for the first
time?) d->outstanding_pages is set to 0.  IMO the claim system was
designed to avoid races during domain building, and shouldn't be used
once the domain is already running.

Thanks, Roger.

