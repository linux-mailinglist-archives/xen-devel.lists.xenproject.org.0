Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9FAB8C51
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 18:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985781.1371639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFbPi-0000S2-G8; Thu, 15 May 2025 16:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985781.1371639; Thu, 15 May 2025 16:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFbPi-0000QE-Cv; Thu, 15 May 2025 16:26:30 +0000
Received: by outflank-mailman (input) for mailman id 985781;
 Thu, 15 May 2025 16:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=us+D=X7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFbPg-0000Q6-9W
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 16:26:28 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 599e416f-31a9-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 18:26:27 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso8514845e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 09:26:27 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd583f20sm1789335e9.28.2025.05.15.09.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 09:26:25 -0700 (PDT)
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
X-Inumbo-ID: 599e416f-31a9-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747326387; x=1747931187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Axzu3Z6DIMypLpgL5z0lHcJ61JxQHZsQJbcqk4I7bK8=;
        b=DNLB1wlqv59GPjCW8sFdiQUgOBNeuD9B6coLctfxHTlVBXv87tgLd3yu8g71d02yVz
         A/e/AFTTwW4BPzForKMNOHnmZSgeTc7XJ80PP94OPSVIyFftFXKl2OBNG5ZYkoN8P1DH
         zwJGAK3sAsyG0yhCE6juoBDcjfj0LnPkyXaR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747326387; x=1747931187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axzu3Z6DIMypLpgL5z0lHcJ61JxQHZsQJbcqk4I7bK8=;
        b=TuVhtIlikFlBuH6cG8xKePHot6pNN3o4UdjEvoy4Kv8Nq5hoUXTzFMZUy1hrm9AdiG
         igH7XJn7hN9gr4Lnpx5iHf5unhkz9IGtg2by5WXOJ4SEc+UIMlha/RXiARgdzl6NhaBX
         xBnb4h5sDJKDcMGjgJ0NgiStU0jIgAaKo7/q1oyXTX0sTFfYk6fybxC1T1bPwnylgCdA
         CGZQOniu5FwO6uSwNuZrrVlxHcAWwNqo2msA09SKX1WxHuQ+wOy/dBs1tDV+rLullKzB
         9teIK7/ibhi3+bIw9EI17q6Bxajl6x9XDwjZH3zq1K9hZbx9s9kQAJyTwZ/E+kT6ogdI
         anoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOF+HDVm1Nx6aPl0iQPLhoszF2AMbH9bmx6d0orAETs8IC8heXhmCxbj8cZLQhZSBeYrmZLjJ+MBU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXoDQS4LUbRH4bm17gMl0ZSB/S9AAGYbFkmnLePrp2H+hm9Q8a
	u0reOeWrfm6IU2xU9nOnd8clZveu8KXd+2vW1nMpQBxJnzxtvHMC0YjEQCEiZ5rtJD0=
X-Gm-Gg: ASbGncvrGuTXOF9zlOdwidU5RCaoOcm1wIJYVcZ5qG6AZ+rL0CKCNSzISi2+3XhlsK0
	VHdFr4KXN/kreLtA4Z8dasr+svMonSrYKrIGcysTnAlzC+CqoqvQvFNhUGwIuER2uBhayDXX+2w
	TKP/DWrHsIHrcchUvpWaI6HwEKVMOrkEy1DzmYqQ53Nwyuheo+ah4ZSL3oHhnfxIP6fOjNtJhxL
	V5bDkZ6UhX1jfVnVoyEoaBS5bo1AASE/UJNhUcAfvMrJgH6+cI7E0Bywz4D9dEtBKUFwtAo9zfS
	J2uWhp845/MhLspEZq5Xl23qWn2FtMlxRPoyu28YJJ2Ih5N7gqBXTOP5quBsQsefLI/fu+4UNXp
	k6J2CnW7jVIhInCw+
X-Google-Smtp-Source: AGHT+IFrevEW2g7e/p4qRW4+kBmDYA9OR4nICLPNyUzESMNi52XYwG9SVYN5Qi2jdCAhgmpMPq9xBA==
X-Received: by 2002:a05:600c:4688:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-442fd64e354mr2219335e9.18.1747326386572;
        Thu, 15 May 2025 09:26:26 -0700 (PDT)
Message-ID: <22da07ea-a2da-4d8c-970d-0ca2020c27f7@citrix.com>
Date: Thu, 15 May 2025 17:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use asm inline when available for alternatives
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250422113957.1289290-1-andrew.cooper3@citrix.com>
 <9990d438-6ebf-4308-89f5-ecacf04ea89b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9990d438-6ebf-4308-89f5-ecacf04ea89b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/04/2025 1:52 pm, Jan Beulich wrote:
> On 22.04.2025 13:39, Andrew Cooper wrote:
>> Compilers estimate the size of an asm() block for inlining purposes.
>>
>> Constructs such as ALTERNATIVE appear large due to the metadata, depsite often
>> only being a handful of instructions.  asm inline() overrides the estimation
>> to identify the block as being small.
>>
>> This has a substantial impact on inlining decisions, expected to be for the
>> better given that the compiler has a more accurate picture to work with.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> So this is effectively a generalized version of
> https://lists.xen.org/archives/html/xen-devel/2022-08/msg00712.html

I'm sorry I missed this patch, but my feedback would have been "that's
not specific to altcall".

~Andrew

