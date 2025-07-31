Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62829B16C3C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 08:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064884.1430190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNBR-0007fB-Lr; Thu, 31 Jul 2025 06:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064884.1430190; Thu, 31 Jul 2025 06:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNBR-0007dD-JB; Thu, 31 Jul 2025 06:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1064884;
 Thu, 31 Jul 2025 06:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhNBP-0007d6-W4
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 06:54:31 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fda393d-6ddb-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 08:54:21 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b78b2c6ecfso321813f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 23:54:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f30dc9fd0sm3507681a91.1.2025.07.30.23.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 23:54:20 -0700 (PDT)
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
X-Inumbo-ID: 2fda393d-6ddb-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753944861; x=1754549661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TFsvBzkJQR5KTMcKXa+yaxYcxiVVTO40WNJXYp7rpbw=;
        b=da7BTkq1h4sm0YJu90Axh3rWzTn4L2dy5alQW57Hcv+A+hjOu8phMMOta3iQkxAyit
         tt7ltYG+fbJ8j2a9ydmHVyqKKESB/muRKmsY3ze9iB1t79eCKKhsWUrMsHPQG5iBtjo4
         qpgjaw0Vd7Iyi6On6jAJPkl1Fz8P3sMoDo5Keq4OuVSix94vbNDcjrpFjKkmSrKd/yfd
         IFagYs6AZEDrV5IqZO2G2uMlmVdG6yNpkj1sh0KtRRwyS46zlLmFeyQLwcz2hPNWZy4+
         nJaSTuXdmZvNAPeC2354EK7EQ2Fq1ifGVJlfYw66dV7/Mm7eR0tog6jz9cJIq2TmFuyW
         8q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753944861; x=1754549661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFsvBzkJQR5KTMcKXa+yaxYcxiVVTO40WNJXYp7rpbw=;
        b=N5gl0tCtnS2RrXFvAm0KnjlzQDf18MvQh+b2xqXSYcG5w4Uh+yJRBlTdc+CFgXcHod
         FbAQVYEbSecNYhXKu9Hbt4ZsZdV4OTSCPWnQuDXtPCF/nKWw6m7ONrIwhxjnTWjOOqyp
         WOjCUzsFBwtJ8Pe/1AvtIg686FPquCnmz1xTBNCUA25Xa94v2rk4pUOeq+PQ1qwasCrP
         Qt3/nJ5FLTwRr970ntV1xkRUzE0M2UwYnLkScSP0d5y5P+7czWlnghNbihh9DU2g2mRR
         sm05LIokxxTBrGTqNY5AZvHzO5/pTYIJ9V00/rwqzt4bpwGmlpDkjEpopjD9J6mX99MT
         29tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY5HyDsG07xYRbMjAwGweRFBl0/Eb8acn20mm0RXAj3o0K4lJAzX+0pcxwQcJ8AdU/CkYL+3sMhqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+wFyzBb6jfdrGMkuIkljjImwuEarS1XWjdj+NnoHl+2mhSwko
	i1qLLaU2ipbsw4Dekwmo0MUTCN6IwO5EFxvGrlkyaDTTREIkSs063BNQb5/HZspwtg==
X-Gm-Gg: ASbGncuj8I2OdQq3iogx9CwOfAlubF228Vn6o+5N3sGC+MPinx7b3NGVg9fmw7HMsYm
	zFxYubx3AKsWdsMFtb44ygJZXWTAlOMByRhGo1tDuToKpHrQwQlestLHdqw+Vla1fOm+vbo1/K3
	S3nODFHSH61FsasqRUFiprXxs7+eN0EpMUwBkQAKuF0jJSZWXQo1xcqPFK7XWCbAgJnLKTMe4z3
	wrtW7/KJ7YXdAJtX8Wgsf+7FUqG2bgK19VvitknSVXe/L8vUbVZxQGhCn3IGvyKlNFS6QJusxN6
	iAeMVoY6gFVkuoNH3fCoex/ThCmHCqMGgy0efe0yNgpVjDbAZDHEfcsHHl1XVWJNtuVV4J7TAp0
	4QBnPknY+OBlfAtyu/PREpnV2NLff9ExE1AS42QU+j3rGGuW8VjtoJHCQaL8IpwWFEWxcBRnZA7
	PBz+sJsIc=
X-Google-Smtp-Source: AGHT+IHJpErCcWthGzP2cwiDgD0STQAKm0HBvbUp6G70Qn34dEjyihsYCAF2gFCZFWVh7cuScS0keQ==
X-Received: by 2002:a05:6000:2913:b0:3b7:8851:642 with SMTP id ffacd0b85a97d-3b794fb6e4fmr4697807f8f.16.1753944861173;
        Wed, 30 Jul 2025 23:54:21 -0700 (PDT)
Message-ID: <78128ec6-b79f-4d4c-a298-72315b190036@suse.com>
Date: Thu, 31 Jul 2025 08:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250730031249.1613142-1-dmukhin@ford.com>
 <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com> <aIplBkq7BL52Fn/Q@kraken>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aIplBkq7BL52Fn/Q@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 20:31, dmkhn@proton.me wrote:
> On Wed, Jul 30, 2025 at 10:12:54AM +0200, Jan Beulich wrote:
>> On 30.07.2025 05:13, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> As it stands, polling timer is kept in the list of timers even after the
>>> interrupts have been enabled / polling disabled on ns16550-compatible UART.
>>>
>>> Ensure polling timer is removed from the timer list once UART interrupts are
>>> enabled.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>
>> Wasn't it Andrew(?) who suggested something along these lines? That would
>> want reflecting by a tag then.
> 
> Yes, indeed.
> 
>>
>> Also, what's the real problem you want to solve here? The timer function
>> would be run one more time after ->intr_works is set, and then the timer
>> will be permanently inactive (up to a possible S3 resume). Is it being on
>> an inactive list an actual problem? (IOW I'd like to understand if the
>> change is merely cosmetic, or if there is some actual benefit.)
> 
> My understanding is running polling timer one more time after the interrupts
> are enabled is the issue: if there's a pending timer when it is known the
> timer not needed, then the timer should be canceled.

And the effort of canceling outweighs the one extra running of the timer?

Jan

