Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130668A92CB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707925.1106360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxKyx-0003Za-DG; Thu, 18 Apr 2024 06:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707925.1106360; Thu, 18 Apr 2024 06:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxKyx-0003Xa-A3; Thu, 18 Apr 2024 06:10:51 +0000
Received: by outflank-mailman (input) for mailman id 707925;
 Thu, 18 Apr 2024 06:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxKyv-0003XU-Vb
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:10:49 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 663decbc-fd4a-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 08:10:48 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-418e06c0ef4so3460775e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 23:10:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bd14-20020a05600c1f0e00b004182fab5098sm5244428wmb.20.2024.04.17.23.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 23:10:47 -0700 (PDT)
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
X-Inumbo-ID: 663decbc-fd4a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713420647; x=1714025447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hV1F4wIRmtR6mMupBr/O2T46s+fxrJScQpNxTf6Y7yU=;
        b=YA6gazjcOE+KGff/qnUghXVT/GxAkx9UlJAHpIinojpo/+G8NSxlince9uDPUz6AlN
         5mTOCshNfhT6ztpg3KnNNAsKD51sPt/kd7iS2DEKPhm0qIEgVSmzL6MBBpipDXAacqJe
         m+Wh4qa/4oek3ucqZgsfw4U6YFrKjZTHcVYZAbmB4p41GcxujjEzw6BqApPuWzzsRPnr
         YzH3HpXbpFRAGfsDmq3LIWP+OIX+6fPZUHUOWMKexwPcigdbB66Vfy5CSSfFqxn4R39O
         DnmfNJPNLTVp42sKM+oSOYwXia+Wv7EOPqhfq+lLHO+790zfMJgJ0r+LgxuWmg1YLu4N
         Hkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713420647; x=1714025447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV1F4wIRmtR6mMupBr/O2T46s+fxrJScQpNxTf6Y7yU=;
        b=ILFN9OHSDydyNW+w5Eephe02LuCN1KTYp3tZl87v9nx+QxBLKBSadGjX9KdAbC0en0
         XgbIiazi1Sl9YUgMw8D27xfwb1nyAy+PpUCriDLDhl3g8by3ZYXo8ivzjKDzOesPjl1i
         rSJ7ACOs8+r/XCsf+iYx0JPOneTBkQV/uf0ZyV2aZCG4XjCDIJpEDp1XEZ39BRtu/tMR
         QQ+PWKdYxH4ioMCQT4x2SgTTnhdHLE6bNT5TUh66M1EO/AtU/uakvXx8Gru04OGQ/qBE
         rsXtJOSJy2IweKFcCHDpjKbpfxPd8t/m2Af7YtXKGn6//wnPn9rkVb+/l9qZNdImejW1
         gYSw==
X-Gm-Message-State: AOJu0Yzw3AGXWjHQ9YTzmZ2Z1dRRkaqNIC3bHkSM6Y2LVTXp8CGkjhaE
	d3avgDIyG2sZh14qHBiuoYobXCxrIHFnqZH/meIr6rilWdgi5WC4zsFxvsUqUA==
X-Google-Smtp-Source: AGHT+IFNSB4rMNfAE4p+jpJncex/PyGqCSAiyqDxdzr4gyJcRY3dvM5LGI0T3urA1CHRSaLQrN/HPg==
X-Received: by 2002:a05:600c:310a:b0:416:2d39:bcc2 with SMTP id g10-20020a05600c310a00b004162d39bcc2mr1531822wmo.29.1713420647542;
        Wed, 17 Apr 2024 23:10:47 -0700 (PDT)
Message-ID: <f65ae42d-32e0-4d95-b4a8-625da7158d41@suse.com>
Date: Thu, 18 Apr 2024 08:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] xen/arm64: entry: Use xen/linkage.h to
 annotate symbols
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 edgar.iglesias@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
 <20240410091947.1498695-2-edgar.iglesias@gmail.com>
 <9f12ebbb-5080-4eff-a965-8d5ab8e3ccd0@citrix.com>
 <CAJy5ezraDhjVvAp_VCG0FO0smNK7=5goVOwcnCEY_8LycjwWYQ@mail.gmail.com>
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
In-Reply-To: <CAJy5ezraDhjVvAp_VCG0FO0smNK7=5goVOwcnCEY_8LycjwWYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.04.2024 12:24, Edgar E. Iglesias wrote:
> On Wed, Apr 10, 2024 at 12:21 PM Andrew Cooper <andrew.cooper3@citrix.com>
> wrote:
> 
>> On 10/04/2024 10:19 am, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>>
>>> Use the generic xen/linkage.h macros when annotating symbols.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>  xen/arch/arm/arm64/entry.S | 12 ++++++------
>>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>>> index f963c923bb..6188dd2416 100644
>>> --- a/xen/arch/arm/arm64/entry.S
>>> +++ b/xen/arch/arm/arm64/entry.S
>>> @@ -480,9 +480,9 @@ guest_fiq_invalid_compat:
>>>  guest_error_compat:
>>>          guest_vector compat=1, iflags=IFLAGS__AI_, trap=guest_serror
>>>
>>> -ENTRY(return_to_new_vcpu32)
>>> +FUNC(return_to_new_vcpu32)
>>>          exit    hyp=0, compat=1
>>
>> In the new world, you want an END() too, which sets the size of the symbol.
>>
>> A good cross-check of this annotation stuff is:
>>
>> readelf -Wa xen-syms | grep return_to_new_vcpu32
>>
>> which in this case will tell you that the symbol called
>> return_to_new_vcpu32 still has a size of 0.
> 
> Patch 2/2 adds the END, I should probably have squashed them into one...

Only partly afaics: return_to_new_vcpu{32,64} are still left without. And
yes, preferably the adjustments to the start annotation for a symbol
would come with an END() addition right away.

Jan

