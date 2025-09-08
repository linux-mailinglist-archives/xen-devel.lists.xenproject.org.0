Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53453B487D7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114873.1461673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXrd-0000RN-1v; Mon, 08 Sep 2025 09:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114873.1461673; Mon, 08 Sep 2025 09:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvXrc-0000Px-Ta; Mon, 08 Sep 2025 09:08:40 +0000
Received: by outflank-mailman (input) for mailman id 1114873;
 Mon, 08 Sep 2025 09:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvXrb-0000Pr-AD
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:08:39 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67e26256-8c93-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 11:08:38 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b0472bd218bso648864666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:08:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040d44c9adsm2138413466b.9.2025.09.08.02.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:08:37 -0700 (PDT)
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
X-Inumbo-ID: 67e26256-8c93-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757322517; x=1757927317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WEpQWJAguHNxZnf5RskzNGHiQ7p8CvADHoDg7CzPj7o=;
        b=Bq4/pcEnUKpjpsdjteCiwvkJ9caw57YGGGrmtGGaPqjvOP7o8e/GS61irq70qo8NLX
         Gpo3lGDPP42psmTblFAfyPvncfsK9Th2lJssfFpoIgEgOjhd5ZPY+j2B9rTIWMrnYZiH
         bj9Cw6EZZWYDYIyY4/f5lo2RlT0p3Du01OgpI6XVnQUr9idwp8gSoBaiK2iR2LSWDIGC
         NQSK5qqwzY1Hn4XvNI8wYhjMODrXT/Ozyi15r+Zx7UKaf+bRDI62Xx3LHY/Cd9FnR6KE
         D9xSyfpr+w0q2WjdKf6pdSP5IHm6OamMaW5OujKe21TJSq5f/tq0r7T5pMY3y5oMN53P
         zdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757322517; x=1757927317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEpQWJAguHNxZnf5RskzNGHiQ7p8CvADHoDg7CzPj7o=;
        b=K1dlRnLqug6m8Q6QnKYWv6jkBEQmK88NkFqoTomcQt9nZgIc13Gdq1oxPS8/n8KvgI
         e8xt97oFJ06LNEDqUqXG4xyh9A8/wOeEj32lO0GM0mx0bcEm4G7WIvP0bGytpMaZCpoC
         ixv+L38ZDtf1wChK5/T1VUBVfDRTxmgNB0fdOuitwe5c1D+Sburhd7PjbsMPQpucVnjc
         Iwn4NWWPwoDH4Nnp4N3umUpgKcqRZmrru9Ps1kegFANZ0ZhRP2X9veCfl2t5gDu2qRli
         KCfYeNbTwAzG/9CQaQSqWl0/ZsTPc/0W0C3a9WFvrRoKtBzefAf+WOtEp8Lwbab/hTgM
         4trA==
X-Forwarded-Encrypted: i=1; AJvYcCWU9iri2SFkUj05GwQdWp+VuHxUzmf/L8r36pPyIASZGchPZ2Ojl1/S/E1sEnQtTkNLUTyEGUgT8sc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyhzy05Myh3K0aIy8fvq+o642vHfvmVFB5tlqwps3+aH/FdwVbQ
	Ed3VadV9IRku6yBXEfdPS8CL0jTSolrqw2zpWtQ+kFyIpLQ/UilfT5SD65VGpbQSKA==
X-Gm-Gg: ASbGnctXKrjK4TUfHsZ9yBdCX6RBRNLZd0CrsEIpNOnSfBVA1UV3ISwU49iBtC0JIlq
	xAgcT8y6yEMfEu+0oNNUh6B/c+cHfAuNQFJAJtl7644T5AzqjMKscjQSh0BULBxJqXw/BbCeDEe
	2y5gGgkIYxTnd35AhDZ23r/a4OynCVwyUQ+xG1/VqAysc6f4PSg6czzrbJAdalTlU6iMj3xHkF5
	sSioZhckIPOmRaud0LyiJCLUbGW9rNuHjz3NkPbW1OhCiPiwsKfK8h7TSF7dhqlJZu1xo/lBYUW
	/UB2IZ0vlVk3KjwsUjeBkFA2WPEwJriy/ZOcQ4TXEWFl1MzO3Pn0ppw32VWva+nxC3PLzG1HZJM
	6CTebvcv3IYOCsosZ2ZBIOBtl3OiCEh+E2ZNDeBHmrS0zAIPHag+h93KN8dpQTCJpwuxXoZszQe
	y66b9alAs=
X-Google-Smtp-Source: AGHT+IEW4wwj4VNlz0B5HbTxnvcFvYP81avxbkLEMWkrCUvZv4sXjXpZbEAB0fYPq1fPULOgS3qxMA==
X-Received: by 2002:a17:907:1c10:b0:b04:1a80:35b9 with SMTP id a640c23a62f3a-b04b13cd575mr676078766b.12.1757322517466;
        Mon, 08 Sep 2025 02:08:37 -0700 (PDT)
Message-ID: <89d0b668-537b-4ee4-8cda-e0d95d9eed90@suse.com>
Date: Mon, 8 Sep 2025 11:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mcheck: allow varying bank counts per CPU
To: Jason Andryuk <jason.andryuk@amd.com>,
 Soham Dandapat <Soham.Dandapat@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250905165212.96843-1-Soham.Dandapat@amd.com>
 <32f89ab8-9742-4bc8-a5ef-848b66e788b2@amd.com>
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
In-Reply-To: <32f89ab8-9742-4bc8-a5ef-848b66e788b2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2025 19:02, Jason Andryuk wrote:
> 
> 
> On 2025-09-05 12:52, Soham Dandapat wrote:
>> In mca_cap_init function,the mcabanks_alloc allocates and
>> initializes an mca_banks structure for managing MCA banks,
>> setting up a bank map and storing the specified or default number
>> of banks.
>>
>> After this we will call mcabanks_set(i, mca_allbanks);
>> The mcabanks_set function sets a specific bit in the bank_map of
>> an mca_banks structure, provided the structure, its bank_map, and
>> the bit index are valid.
>>
>> At the end, we will call
>> mcabanks_free(xchg(&mca_allbanks, all));
>> This function is thread safe and does below:
>>     1. Atomically exchanges the value of "mca_allbanks" with "all"
>>     2. Returns the old value that was previously in "mca_allbanks"
>> So, when we will call mcabanks_free , that will free the memory.
>>
>> The problem is that mcabanks_set(i, mca_allbanks) function is updating
>> mca_allbanks which will be freed via mcabanks_free later. This means
>> new mca_allbanks instance("all") will never get chance to update
>> it's bank_map.
>>
>> Due to this when we will collect log from mcheck_mca_logout function ,
>> the condition "if ( !mcabanks_test(i, bankmask) )" will always fails
>> and MCA logs will not be collected for any bank.
>>
>> The fix is to solve this problem.
>>
>> Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
>> Signed-off-by: Soham Dandapat <soham.dandapat@amd.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Maybe the patch subject should be "x86/mcheck: Fix mca bank 
> initialization" to differentiate from the Fixes commit?

That's still more generic than wanted. How about "x86/mcheck: fix
mca_allbanks updating"? With a more concise title (which can be
adjusted while committing, so long as there's agreement):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

