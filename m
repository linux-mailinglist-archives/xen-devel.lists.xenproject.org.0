Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC3A64782
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916443.1321531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6rD-0006rR-IS; Mon, 17 Mar 2025 09:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916443.1321531; Mon, 17 Mar 2025 09:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6rD-0006pJ-FT; Mon, 17 Mar 2025 09:34:03 +0000
Received: by outflank-mailman (input) for mailman id 916443;
 Mon, 17 Mar 2025 09:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu6rC-0006pD-FI
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:34:02 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5140de2-0312-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 10:34:00 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso3338262f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:34:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb93csm14186074f8f.86.2025.03.17.02.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:33:58 -0700 (PDT)
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
X-Inumbo-ID: f5140de2-0312-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742204040; x=1742808840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Niy/iHLD1cx+NjomfId6TbUa9e9Rx6SiUHj9X5fnXqE=;
        b=agsoFqj55cUqwel/gTI30MloJvXwKZ574MyGrMrIMF1JpeOqXpP0SdDE4u9yWYzIcN
         U7Vo5JT4Yu/eRQdCh+MIf0cpjQHdT9AOB3C/4igO38D2ljpPlCwSgL071BEKzmkobB+6
         iWym9ST9Sx9LQTvAYd+LukVJD7J1RY1Mj5Q0Y/zbZTV2B1e0w5xXk1UDXsLoqOKrgiPx
         iRUACoBOGKhkqA0CUY7tSqEGIckAE21uU7Z0hNLYIJ28WtXBtnCSpGRLD1gCfpnVBpgZ
         1gNFuqQsz+R5EW4NifYMXcvIn4Sua5bgVb/e0Ng3Z67g1uMsnOpLUKV55828g85BUhlN
         tRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742204040; x=1742808840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Niy/iHLD1cx+NjomfId6TbUa9e9Rx6SiUHj9X5fnXqE=;
        b=GX4xbwho6ajgQny65WR8ZRDbmzrxgqJ/yVqRedwtAy4pV2h3tOUavnFixr6CZV/QHD
         YD+3e35TdlfbBzoWIfiXhlB+BP/J0BDKy20gRzDoJXBm+V+JgrM1f+JkYnozFcXUeAZV
         vzX/BC98t+BTIVXgVUSKLqL6uzo7f/RNyGLaYoLrOq9vsQqAFDeQFj4vDa9x36lhVS01
         wjdzi82OApbfayiO9mTiIeF09+z/4GjTyQOaadFqwuoFFRjNG+AxmE/xlXRmbEuNgQkU
         iIzZPHoEOwM/kAQd1frXFXD/iDr0kAooNHy3RAwFW4kna3JjSkkeqx78N6xY8CogHoga
         4lPw==
X-Forwarded-Encrypted: i=1; AJvYcCUgyq30Qp+zrii4MVPbVNo6Irs05GnSWCApMr2hBt3y3mIkaF2tqFKIJgeyeI+6Zd6LHN6Xs7YjR5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8gmlYfkuHI4q9cyUvXAOkelCs4N5mzGLtzUdG5l9Lhxlfie+D
	c4yWOhCcSbxlNf8NXQi2t3cgAazoWuA0bBsVwtISRlmsFyzzjjEVYbaXDQzG3Q==
X-Gm-Gg: ASbGncsNPqtqob+gi2Fd+gT2aFEqrSxeCcg6x+UWeXYTA6zIVALxErOK/WPt5jq21M0
	HlOOr+6svKbPAG6vLqzdwATT8dLuhkvAb9tlY3mP2mTmAM9so12J0yqAXfXfVDt+zwjUvBiPZ3v
	dpiTEaZFnIKGZTyNPdm33CqneWPrHYtQL1RXHmFzMm/Iqi+IpzCnDZSFK6IDpRYxskkQk4VJFXI
	0mMOOimoNTai6miqqLpgM5aRpMcSs54fK+1AF9UDNbPBNhun8rXExFnYrrqgXEHj6ywd+Wenbqi
	bR1GKgLLzbRqgv+KUSD24H2khx4zNeJIbGPtxYou3yEPqahbmiIDPYNbDqDhCxAZQgzEhWg+Fln
	Rwn+Xt3UCD77LI9ug9pTywoz5VEo0Q2MRzJWWrKsD
X-Google-Smtp-Source: AGHT+IFb2BeFimz5AU7AvoauIQdOqnvm+ypGUqm9kPA1VAlQ1Xr6GxXM99seSLsYIqxzekwEz9JyGA==
X-Received: by 2002:a5d:6d81:0:b0:391:1199:22b5 with SMTP id ffacd0b85a97d-395b758f9afmr13811568f8f.10.1742204039941;
        Mon, 17 Mar 2025 02:33:59 -0700 (PDT)
Message-ID: <e62767b6-caa0-4ede-8549-f6421e2db94a@suse.com>
Date: Mon, 17 Mar 2025 10:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen: introduce Kconfig HAS_PAGING_MEMPOOL
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-7-luca.fancellu@arm.com>
 <763a55dc-79ff-4176-9286-17a144bd8da7@suse.com>
 <B33096DB-1CFC-41CE-8906-FA4AC7708FF9@arm.com>
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
In-Reply-To: <B33096DB-1CFC-41CE-8906-FA4AC7708FF9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.03.2025 10:29, Luca Fancellu wrote:
>> On 17 Mar 2025, at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
>> On 16.03.2025 20:24, Luca Fancellu wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -74,6 +74,9 @@ config HAS_KEXEC
>>> config HAS_LLC_COLORING
>>> bool
>>>
>>> +config HAS_PAGING_MEMPOOL
>>> + bool
>>
>> Imo this is too little of a change outside of Arm-specific code here. Just
>> go grep for "paging_mempool" to see what pretty obviously wants to fall
>> under that new control. There may be more stuff. The stubs for
>> arch_{get,set}_paging_mempool_size() likely also want to live in a header,
>> perhaps even one in asm-generic/.
> 
> I’m wondering, since we already have arch_{get,set}_paging_mempool_size
> architecture specific, I believe this config needs to be ARCH_PAGING_MEMPOOL
> and needs to provide stubs inside include/xen/domain.h in a similar way of how
> ARCH_MAP_DOMAIN_PAGE is done.
> 
> What do you think?

Imo both routes are possible. I'm not sure we have a clear preference when
looking at the code base as a whole.

Jan

