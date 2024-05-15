Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441338C63ED
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722117.1125999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7B9E-00010n-Dm; Wed, 15 May 2024 09:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722117.1125999; Wed, 15 May 2024 09:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7B9E-0000yj-AZ; Wed, 15 May 2024 09:42:08 +0000
Received: by outflank-mailman (input) for mailman id 722117;
 Wed, 15 May 2024 09:42:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7B9D-0000yd-Ih
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:42:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 643ead0e-129f-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:42:06 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so3329866a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 02:42:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c323d3asm8639408a12.90.2024.05.15.02.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 02:42:05 -0700 (PDT)
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
X-Inumbo-ID: 643ead0e-129f-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715766126; x=1716370926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKqlAuc7F5Y4rxj0U5Gq5uII2uWKzDs6jAXSHw/Xv5I=;
        b=CsEAAncJ7GWGqe1wbo3mBZBmID0o/IeywKB3wXTonb0PR8OPeKMCkK1f924iRZA2lD
         rOQ3vVX6Szbc1y4l+7K9z53Cy9nggkISD7ytjKowg/9zKkbVoCuq9BgcsqIP+AMcnC1g
         ZsqbUGWPLz1Bu7vP1k02r7kAF9b+DDBGsAH1eQILRrYsV86uICo5+I6tOvUAbZdpWzZm
         FLymX7f3q72HUBo0H+2JeFNSXx2Kefz9ZEHtgbI+BiIjnjWxDUwaFFPuPwVu920K5fIe
         h3U2AfrLPi8TcRNrk/oDTh6TKldXsdVkR59+B77nmaOlmSDxHNERkyuaTmBfTLToYgKc
         L4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766126; x=1716370926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKqlAuc7F5Y4rxj0U5Gq5uII2uWKzDs6jAXSHw/Xv5I=;
        b=KN3b5t+stRUGWVamwT83xY2t31vyolpyTtfMVGFQ4L4mt9Q1F+ewZkJJjmAXoDFEuJ
         UvPeepOy6Qj3fRO6p7GXBRvnILb/zgXGdOEJRsV5B23S4rMqNmncsN0y6GUGW7PDlH2R
         E7xMQqPy8bKoqCYrujRk7j6NxBanSEoJcqvmUnmjseVo+qbWuAirqZ5lNTjPaSjDcHGi
         vuWHfQ0V+AJjuIqSny+C62MKgP5vV0MNc1RoaMp9F8/4Qp7OYmotxOmr15aeO1XHVND4
         68WbsYCuiMF11XW9JPf4K9A1dX9j3rDk5+0BsRTTMgrlkg3DL/CqCHMDe6nnhfh8z9SX
         Gf8g==
X-Gm-Message-State: AOJu0YyFLTl210Ck/SdJ3z9Ha9y12u1f4yqdNQ4NGtR2FjfCe8gPWlYA
	H0O/a/P0c0QDgcViI58F3knY7OiN102qclYo5dphGTOkE2FRaavCVbhp7iW8Hg==
X-Google-Smtp-Source: AGHT+IESUncwEkoGxob5ePb5DglU5QlZfsoY53BgS3BYyYgcQTTDHhLy5Gu+QJLOL3+ppKhbPsnGGA==
X-Received: by 2002:aa7:c485:0:b0:572:7d77:179d with SMTP id 4fb4d7f45d1cf-573326edde8mr14112600a12.5.1715766125863;
        Wed, 15 May 2024 02:42:05 -0700 (PDT)
Message-ID: <da8f0d28-f3d5-4d64-963f-954adc7dcb45@suse.com>
Date: Wed, 15 May 2024 11:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 14/19] Rename mfn_to_virt() calls
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Elias El Yandouzi <eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-15-eliasely@amazon.com> <ZkOHHtRPTqC4Zvnp@macbook>
 <df8cc51d-60ea-452b-809e-c75aab957929@suse.com> <ZkSCju4RicXRuAvu@macbook>
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
In-Reply-To: <ZkSCju4RicXRuAvu@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2024 11:38, Roger Pau Monné wrote:
> On Tue, May 14, 2024 at 06:22:59PM +0200, Jan Beulich wrote:
>> On 14.05.2024 17:45, Roger Pau Monné wrote:
>>> On Mon, May 13, 2024 at 01:40:41PM +0000, Elias El Yandouzi wrote:
>>>> Until directmap gets completely removed, we'd still need to
>>>> keep some calls to mfn_to_virt() for xenheap pages or when the
>>>> directmap is enabled.
>>>>
>>>> Rename the macro to mfn_to_directmap_virt() to flag them and
>>>> prevent further use of mfn_to_virt().
>>>
>>> Both here and in the following patch, I'm afraid I'm unsure of it's
>>> usefulness.  I'm leaning towards this being code churn for very little
>>> benefit.
>>
>> I expect this patch is a response to an earlier comment of mine. I'm
>> rather worried that at the time this series actually goes in, un-audited
>> mfn_to_virt() uses remain (perhaps because of introduction between patch
>> submission and its committing). Such uses would all very likely end in
>> crashes or worse, but they may not be found by testing.
> 
> I see, would be good to note the intention on the commit message then.
> 
>>> Also, I'm not sure I see how the patch prevents further usage of
>>> mfn_to_virt(), as (for Arm) the existing macro is not removed.  If
>>> anything I would prefer a comment clearly stating that the macro
>>> operates on directmap space, and avoid the name change.
>>
>> But Arm isn't switched to this sparse direct map mode, I think? At which
>> point uses in Arm-specific code continue to be okay.
> 
> Right, it's just that Arm will have both mfn_to_virt() and
> mfn_to_directmap_virt() which seems a bit confusing when they are
> actually the same implementation.

Right, I agree it ends up slightly confusing. I don't think though that we
need to keep both longer term; we can likely switch back relatively soon.
We just need some "settling" period to allow people to notice and adjust
their code in whatever they have in the works.

Jan

