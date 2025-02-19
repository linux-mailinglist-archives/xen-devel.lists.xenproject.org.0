Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B8A3C41A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893182.1302107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmK7-0004Jy-Cp; Wed, 19 Feb 2025 15:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893182.1302107; Wed, 19 Feb 2025 15:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmK7-0004Hn-A8; Wed, 19 Feb 2025 15:49:19 +0000
Received: by outflank-mailman (input) for mailman id 893182;
 Wed, 19 Feb 2025 15:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkmK5-0004Hh-Ji
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:49:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12d8646c-eed9-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 16:49:16 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e0505275b7so6413014a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 07:49:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5337634bsm1307999566b.91.2025.02.19.07.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 07:49:15 -0800 (PST)
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
X-Inumbo-ID: 12d8646c-eed9-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739980156; x=1740584956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cY2QzgEwuZWFxjh6g65ON2gxTFdM5VH/WZWb2jpEnx4=;
        b=BkcA4w4Xbia4V4zv6Xfww4whcg8DnqNVqW/UXFiE3i6QJ/1W63Uj+t3+eZaE2/Rht3
         hTcF0S4z6ihKD47IsA9lMhuwTB60j/kG/2AOKX+LrmKBowN9lnj8Jqa8WCqgn6avBEgk
         1HyyXnV7DAza+N2ZSjBaZUXYXrAlR0iRLZ7useax6gc0w/lLDb77NQT9dzQ5K96pdAcK
         q6W4QVAN1avfVnv+FT6xmWl/DIBarq3ugeTRES3tSCkCuitiSWznVd/z5/ZDdAzRY5bg
         FnGmcbxnihl6N9SEkWQniBCXqemwnxIXqfu4CeG1GskTY5zYQ6BzPQCbdRx9gqgxnRjw
         jEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980156; x=1740584956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cY2QzgEwuZWFxjh6g65ON2gxTFdM5VH/WZWb2jpEnx4=;
        b=hQW46kLg/0pR5s151jEuwhXgz2qGVOEiW7/5zIk404mFHoqsPXdcwZT/61uxK+Xj7O
         trV8M5V4Luz4oJytL2/D308y0AKv2epQHhOK5rICw1L6hCabJQy8p4FvyLlu6wAWf/K8
         TD0hnxmXqQo2VYNxh+Ru1X1AYTTj+2D9U3IBwSmN3wh/pzrgaHHpWeTl1DIW19Nc8BQK
         imfNdhQGRu7w256iKtNyGhp6l+uSpdRW7IROjih62iHHpI7R6Lrt62NFxw9fITZIz5w0
         CGmJQPkGZcSb6WYwg605GfOSK4fYLWxlm2AAX6jr+p23lxhz4TyN72fhN1UYtZIWvVw5
         dd6g==
X-Forwarded-Encrypted: i=1; AJvYcCWGE6uK25SGguhn+Cbf3PJUOqOok5FRCdTZArpnpM5ZUcrMaPR33ymwZ6cg342w1Cfw8w5Abz/eCU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkrGMhsoIBIhhNYmQeSL9OpKG5rqRW6GOizM2yKC3F8TxEmonj
	E9jia3xY4ypV5d5zahgFXMJ5ofae/6DS9rF2BVJhOCPCVrqomYnxulB5xmhoIw==
X-Gm-Gg: ASbGncu2BfxvxS3yP27xTiNNg8txUpKRm7BHOdhSdNUfRBL44ZbSGInMVgjFbyYxKUR
	KuJvLVWV0SBzBnIMpu5g3Nfue5iPCRjqVW8bfxofAlLnDDS79s51DZR9KaQbsyusVo0ee+xerTg
	51IpN5ZBVaM0VyHx4wXTX94UamRFZM+luzB6SZGnuj7sAOqq1hWVghWai3bIgIXfryaL041IkKC
	oS0wOE5RdvrP9fnc3lgiCcsxOG/h2zOk9oe5mHXF9p9liJ9kU6fHQDRyfZhRV9JWjf6gc7cZGgz
	FsHKNrFE7cRW+W1Xh6zDNj59tb/jZDKFykV1Ny5yOhLCZfJbMtH2QCNIPQSziFRWpfOkinE6T9b
	I
X-Google-Smtp-Source: AGHT+IHB0fpQQhjMANt7PT9qUnlUAC5pz1xocTpOHKAdWQXkzARaD8onCIX/So2ObBICEAoigOFJkg==
X-Received: by 2002:a17:907:a710:b0:ab7:e1d5:d0c3 with SMTP id a640c23a62f3a-abbcd0b97efmr338841266b.51.1739980155823;
        Wed, 19 Feb 2025 07:49:15 -0800 (PST)
Message-ID: <1c4844a0-89e7-4699-894a-4957fedc4dee@suse.com>
Date: Wed, 19 Feb 2025 16:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-2-luca.fancellu@arm.com>
 <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com>
 <E6E21F32-EA02-4DE1-80CC-98D3A21FBF79@arm.com>
 <cc864728-0302-4ddc-88e0-c5330e3dc409@suse.com>
 <59D691D9-5A06-49C1-8B0C-E874029A97C6@arm.com>
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
In-Reply-To: <59D691D9-5A06-49C1-8B0C-E874029A97C6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 16:25, Luca Fancellu wrote:
>> On 19 Feb 2025, at 13:30, Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.02.2025 14:06, Luca Fancellu wrote:
>>>> On 19 Feb 2025, at 12:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>> As per the
>>>> respective revlog entry, this change looks to belong into whatever is
>>>> going to be done to deal with the one Arm use of the macro. Or maybe
>>>> it's unneeded altogether.
>>>
>>> I didn’t understand that you were opposing to protecting iommu_use_hap_pt() when
>>> !HAS_PASSTHROUGH, I thought you were referring only to the stub in the #else
>>> branch.
>>> Can I ask why?
>>
>> Sure. And no, I'm not against the extra protection. I'm against unnecessary
>> code churn. That is, any such a re-arrangement wants to have some kind of
>> justification.
> 
> ok, yes the justification is that MPU system will be built with !HAS_PASSTHROUGH,
> but there is a common function (p2m_set_way_flush) to MMU/MPU subsystem that
> I would like to keep common, to do so I have to hide the macro in this particular
> configuration and afterwards I have two choices:
> 
> 1) provide a stub implementation on the Arm side
> 2) provide a stub implementation in iommu.h
> 
> number 2 felt better because it could be applied on any Xen configuration without
> HAS_PASSTHROUGH, even if at the moment there is only MPU.
> 
> Number 1 let the possibility for the specific configuration to choose what to do in absence
> of HAS_PASSTHROUGH.
> 
> Now I would like your view on what would be acceptable here.

I think I indicated earlier that I'd like the Arm maintainers to voice
their preference. Doing it in iommu.h may be okay, but also may not be.
Yet to decide that very Arm use of the macro needs taking into account,
and I lack context there.

>>> in any case when !HAS_PASSTHROUGH, this macro is not usable
>>> since dom_iommu() is resolved to a membed that doesn’t exist in the configuration,
>>> am I missing something?
>>
>> You very likely aren't, yet the macro's presence also does no harm. We
>> have lots of macros and declarations which are usable only in certain
>> configurations. Sometimes this just happens to be that way, sometimes it's
>> actually deliberate (e.g. to facilitate DCE).
> 
> Ok, in this particular case, as I explained above, this macro is one of the thing preventing
> Arm MPU side to build, otherwise I wouldn’t have touched it.

Yes, except that this wasn't said anywhere. Also if you mean to take
care of this macro here, then in full please. I.e. either don't touch
that area of the header at all, or provide (wherever suitable) a
stub alongside moving the #ifdef.

Jan

