Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFAABCEEF
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 08:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990443.1374387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHG5M-0002Y9-1M; Tue, 20 May 2025 06:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990443.1374387; Tue, 20 May 2025 06:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHG5L-0002VE-UL; Tue, 20 May 2025 06:04:19 +0000
Received: by outflank-mailman (input) for mailman id 990443;
 Tue, 20 May 2025 06:04:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHG5K-0002V8-Sm
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 06:04:18 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 431095f2-3540-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 08:04:16 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-601dd3dfc1fso4117517a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 23:04:16 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d501f0dsm6765781a12.21.2025.05.19.23.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 23:04:16 -0700 (PDT)
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
X-Inumbo-ID: 431095f2-3540-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747721056; x=1748325856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yd1quX4ntTijSeqrO92BDgk4ZXbs1RbJZnLqqQO/u20=;
        b=ZHU0/HW0NJzwG3wZzFvlORhnTQ8CVoDQjPR7J2kTfdKgc7kyKpsjWEl0OM3RR3tnnv
         YT6qSi+XSw+dcXCnCCf5d1lfIhaXrDZQKGrBH9ayPmkunpDIWBMO5PTSAYdBFgK/v+Rd
         0POtkUOmDkJ2+fkhXJhanbVKyejTlWi19+Y4jm8teHlhAdXy/PVixTSHgGvQXpJ/bW6b
         7M0vbOfTSgpBLjLRedrIzgEp3tgQtswN+smuCgSm1sByUXRsP7/DiDNCsi0iZ8qzQzDm
         7OK6hwkuo8ttq36MT6DhMnB0Ab6kmLZbBsc63RsInCzIrQdhMaR1sjqAMUuttb+jeCg7
         x5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747721056; x=1748325856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd1quX4ntTijSeqrO92BDgk4ZXbs1RbJZnLqqQO/u20=;
        b=tFXxWALDXVdDm0miqGRt3Q34mHofPE4MLQZ1dXGOYuA0+guyLcp+/jIpOg6LHKl5al
         veRGGvikyUvWSAtzUbiK1h07jmoCi1ZR5cQUj2RGZAEGxB66xR4dBmKHzC+rE2tZMn10
         R48DuY2z5z7O0jRp4f67JyRTV96vGbNQlpmKgTm/EKARaPiIS7ANCblFaEqSbF3Lh0BU
         byVSXoY+nU3bjhfBbYDjE7i6Fw6IK+/U5k2Al0mt2Yg5GVjXwaafZiU3AwAzQ6PgdG20
         /dxfAWFjCHhbZIrxVLoR3i91IrZ3jMZobQZAwqGDKxjrJycM/ky8baTvd4qG8O5jHOJx
         GWtg==
X-Forwarded-Encrypted: i=1; AJvYcCUDKddyRqqxmP3useCRY70jpuK8AuaNl9+rTSAJMWMIPmw9NDxwaP7mdgia6sndgAeBiL5vWi2Hn2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGyQKKtNjoyLHhJwbz8Amww92QeuXginLEjx91ZDTfcS0tV3Bd
	uAp4Xjl8j0D6b0fudgYiA7P83iGdW1E9w6CW1xury01yBIs69RT0aRWSyMY1Nk5rGA==
X-Gm-Gg: ASbGnctdWYfwq3TfF53txJjr0vzecXep4busbm8qGRk2TVSoCbq8SByU6QaMx5UyJbe
	iDHlUqHWBlrJNgB6d6ZKweP/53knnBLcFSvra9D1+vvAk2QTyCsIRqL98hIzckdlWmoG0BOyLhA
	fBGzC5X15QAZ7TjvwH/Ui5bi88ut30jSti5zi8CPAs2TuUXko3E+teWISoAMMfQuJOpw0EnbKXN
	sjJPzA9Z9EFx6nsClXYrneuTkbpB7k9iF/PJZBB9H603ia7/M0/2CD+xBYDZHVVAmOWKLLLkdxx
	X4WWp4M1giYS9nBLgIxEOytDyQbu0efX0hFvaLwrvjNGTVGqAYhni4B5fSaEzA==
X-Google-Smtp-Source: AGHT+IFYo3pq3hLIZukCfUvrNCWvExdeW+QEHFvNrMowdjH0UoFbvpXBfc3cLVTSoH5zGPOm+Fj4GQ==
X-Received: by 2002:a05:6402:5189:b0:5fb:f5fc:e038 with SMTP id 4fb4d7f45d1cf-601140b5d05mr13186038a12.19.1747721056311;
        Mon, 19 May 2025 23:04:16 -0700 (PDT)
Message-ID: <0b7fd522-af98-4ab3-ae6b-ed131ef3bf04@suse.com>
Date: Tue, 20 May 2025 08:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] xen/domain: introduce CONFIG_MAX_DOMID
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250519192306.1364471-1-dmukhin@ford.com>
 <20250519192306.1364471-4-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250519192306.1364471-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 21:23, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Embedded deployments of Xen do not need to have support for more than dozen of
> domains.
> 
> Introduce build-time configuration option to limit the number of domains during
> run-time.

I fear I don't see the (sufficiently meaningful) gain of this. And I must have ...

> Suggested-by: Julien Grall <julien@xen.org>

... missed tis earlier suggestion, or else I would have asked the question already
there.

> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -333,8 +333,9 @@ static int ffa_domain_init(struct domain *d)
>       */
>      BUILD_BUG_ON(DOMID_FIRST_RESERVED >= UINT16_MAX);
>      BUILD_BUG_ON((DOMID_MASK & BIT(15, U)) != 0);
> +    BUILD_BUG_ON(DOMID_FIRST_RESERVED < CONFIG_MAX_DOMID);

We want this check, yes, but in common code. It's entirely unrelated to Arm's TEE.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +config MAX_DOMID
> +	int "Maximum number of non-system domains"

Hmm, without clarifying what a system domain is (is hwdom one? is a control
domain one), I fear this may be ambiguous to users.

Jan

