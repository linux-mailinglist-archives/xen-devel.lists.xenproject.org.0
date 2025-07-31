Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE7B16D36
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064992.1430333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOM5-0006SS-Jo; Thu, 31 Jul 2025 08:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064992.1430333; Thu, 31 Jul 2025 08:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOM5-0006R1-Gr; Thu, 31 Jul 2025 08:09:37 +0000
Received: by outflank-mailman (input) for mailman id 1064992;
 Thu, 31 Jul 2025 08:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhOM4-0006Qv-9q
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:09:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2218052-6de5-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:09:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so367057f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 01:09:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f60dsm954875b3a.15.2025.07.31.01.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 01:09:34 -0700 (PDT)
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
X-Inumbo-ID: b2218052-6de5-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753949375; x=1754554175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=taDWfMmKUzVUiHCdSYb0C3EwRgKnUo63VwryN5vdyzk=;
        b=JyNPIH5prNy9YpVsNjrWm1cDKC8vESKaRO+YOuvVlP1BogclJzTpG57R+WgYH3/Ndy
         Rn9B90XC1VX/JKXuw7jwA1MXUFJwW/91iaMAFXiJLaOCdocdjuI1uZMA4LVHIHgh3+OF
         Zc6J+BpMCgW5d7vbfdFqg5dO5UHrI+CZZWAdrVezEFrc9/Vg71JjlRaVK1xVtwanvQro
         EzyYOUJ9kV7j/p/rF37KMoQYeFw+wkNIuqdJRaylhO8ZQRHv6k4Ku9PLJFWQbzM8nRc8
         QZcqPpvyCy4hY/ornT9d/vMDV3eObOXv6T+jBPIWql8RD30zckyqOnMSJVMWScX+YWjF
         f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949375; x=1754554175;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taDWfMmKUzVUiHCdSYb0C3EwRgKnUo63VwryN5vdyzk=;
        b=VeHAgL9gVrbw25GdhD1bVqkwXihaki32d7NbF78Pr/LqyJB2oH7RLxpGGiwfQg6vtM
         n/UmlrF3sxu6ePNl+PPIlEXjeM2SU1hCLFioi9L6i2Rtao2DF7i82L313ca2vAMIhnzZ
         mHGq8P6RwKOycUmbc4zHRw7CYx940qeZ0KUeRY8h2dh7L5eHGZE3k949G3j6BopsO+qx
         TtwRglp14TefYclgU2zOC8s7iJaikt06N+eDFdfwyZLxodjN2am7meXi7go0VvnREzzg
         +jhDHprsHNgCjBMT9+H04waammfXbA69S8ceM++nlet9tcL04NRzFONeiMYH3gJgaI/N
         3OdA==
X-Forwarded-Encrypted: i=1; AJvYcCXzTBXEnhVDc2djNzIEAqYkmIkeM2/welgP4MWAGETznv1AJo48tH7/dypkvEF3XSnKS6fdbssLpE0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVHQojerSjNSewKtpIuoKO+8k+zUhHNW3JXnX95mE+A2p4lXNk
	7gi5EfFV4C3nxTQwEtxemBkloPfMWgJQYn4Qh7lMZPfiIRl14481nlAh05L0cMuXlw==
X-Gm-Gg: ASbGncsff3BekeU8KACOPy375MQ8+c2pGjSbaPxEk6gRDH5Yraxg/1Kk7/Q3C0cZuXx
	6fKWTwrGyU8Mre1u4tOs9Xkrtl3svE1BJ9QV+VVZI4Cx8jfVKIC14dA6VHMxC3GixNUtDTAibFD
	v6s0nYnKHBRHUb2n6P/vxx7a9g75uqSXmRyi6Mi0LOyASjM2Wr4gF1HWDjIfoiqoIshoQh+XZVP
	vE6F/vbNdDPSSCWc/GWi7tQvRdzD/HLCulDe9aQ8XTyljSxWLD5ew08mxB6ZIwNFWCRvoYld4tN
	UwAIki59DFh7cy7xKFFPWOovcxo/dX+jHFYG8GU47EcZPCSZ0DqKNWxr1XIv8Yw8BUDZCmURL/Z
	1Y5JlAkb3fgRRWEckFkRwdSAT2/koq/lgjd9SMJzuaUkBphzP6bsnPBzpcU3890X1g242IdSplY
	/JNB6Tdcg=
X-Google-Smtp-Source: AGHT+IENVx/sN/J7os1tx6S/oJ+lBF8Km7ZfP4tQmO/ZVTVNbB74kgHzRrlXPmOn9GrMwKiHZ1ebIw==
X-Received: by 2002:a05:6000:310c:b0:3b7:8851:659 with SMTP id ffacd0b85a97d-3b794fed307mr4573937f8f.19.1753949374616;
        Thu, 31 Jul 2025 01:09:34 -0700 (PDT)
Message-ID: <3c7c0eda-bfb1-4bb2-9921-3d1c9d31aef8@suse.com>
Date: Thu, 31 Jul 2025 10:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-5-jason.andryuk@amd.com>
 <222ea3ed-8ce3-4622-90d4-763bc0fd1217@suse.com>
 <bade3386-4296-4e4d-8eb2-840f2ac07b93@amd.com>
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
In-Reply-To: <bade3386-4296-4e4d-8eb2-840f2ac07b93@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 23:30, Jason Andryuk wrote:
> On 2025-07-30 11:06, Jan Beulich wrote:
>> On 16.07.2025 23:14, Jason Andryuk wrote:
>>> Add a new create domain flag  to indicate if a domain can be the target
>>> of hypercalls.  By default all domains can be targetted - subject to any
>>> other permission checks.
>>
>> I think terminology needs clarifying here: What exactly does "targeted"
>> mean? Is that e.g. also intended to cover
>> XENMEM_{current,maximum}_reservation, which "target" a particular domain,
>> when at the same time they don't interfere with the targeted domain in
>> any way?
> 
> Avoiding interference is the primary goal.  Those hypercalls definitely 
> need to be blocked.  xsm_default_action() has limited information 
> available, so we can't differentiate particular hypercalls.  Blocking 
> extra non-interfering hypercalls is not a problem for us.

Except that later patches then "punch holes" into the fence pulled up here.
And over time we may learn that more holes are needed, or at least wanted.

>>> --- a/xen/include/xsm/dummy.h
>>> +++ b/xen/include/xsm/dummy.h
>>> @@ -91,12 +91,16 @@ static always_inline int xsm_default_action(
>>>               return 0;
>>>           fallthrough;
>>>       case XSM_DM_PRIV:
>>> +        if ( target && !is_hypercall_target(target) )
>>> +            return -EPERM;
>>>           if ( is_dm_domain(src) )
>>>               return 0;
>>>           if ( target && evaluate_nospec(src->target == target) )
>>>               return 0;
>>>           fallthrough;
>>>       case XSM_PRIV:
>>> +        if ( target && !is_hypercall_target(target) )
>>> +            return -EPERM;
>>
>> Hmm, for TARGET, XS_PRIV, and DM_PRIV we're now doing the same check
>> twice.
> 
> The different cases need to be covered somehow.  I didn't see a good way 
> to avoid the duplication.

Maybe this is the point where the fall-through wants (needs?) doing away with.

Jan

