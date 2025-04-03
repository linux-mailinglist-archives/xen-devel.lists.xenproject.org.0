Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FBA79C97
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 09:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936247.1337541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0EgX-0006VF-9W; Thu, 03 Apr 2025 07:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936247.1337541; Thu, 03 Apr 2025 07:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0EgX-0006Sf-6d; Thu, 03 Apr 2025 07:08:21 +0000
Received: by outflank-mailman (input) for mailman id 936247;
 Thu, 03 Apr 2025 07:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0EgV-0006SX-Nv
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 07:08:19 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68ef78ed-105a-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 09:08:14 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so474760f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 00:08:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d92dsm940405f8f.71.2025.04.03.00.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 00:08:13 -0700 (PDT)
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
X-Inumbo-ID: 68ef78ed-105a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743664094; x=1744268894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ygNy7TpE/EybhxZCszoMTx6j9tYNzu3q7HVkiSNenM=;
        b=Du9JgfV2JlI3uJDsjDAx42p2CE1IegRGQfB1EXCbeaV/rtkWFYyMJObJapI6S+suUi
         KNRXaNYV+KGuAA2j4tg7FNwjZDrwc2gegy/mtm0HOK5bA9HV8DYZUTJJ9wApX2AegQSq
         UKBz98mYy9/amAS3DN2TJYs6+aaEAJbw9SdXgDQiSc9MuOLUPqJ9TynjCHtuwPo+OBZr
         2F4heQ7GAGKJ5hLSgO2U7iN+POuB7TvlWGyVHywoI2ppJXnc7KhYgsp/gPBVbgZJN7Ca
         v7C3D3q4TlwwcNPoMLT6O1ZwjyQN6V/HHQ1WxIR2H4H5T/wqcYwC40cuIPWq0A6dyowL
         8WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664094; x=1744268894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ygNy7TpE/EybhxZCszoMTx6j9tYNzu3q7HVkiSNenM=;
        b=JaAeXNLoEXrI+1XI7NPfqXove8jrIqE/hQOOG7JNIXN9GUADb4YeCEQ4yCXe4SwrTI
         b8k+lmkeWrB6DKhQYdKIZnWxMFbgNkx7pIsS3xIqEo0EpSwGYWcAvtoWxHGKLZb0UvqD
         SZNS4E/xu71B72k3pwaWQQSIMbxPua1WPht/Bdu1jDukyA/p0RG0f4QJF8vnTrK2YbiW
         3IMFkofp6+ag1rqXpq3Cmq+/4TBZlAdSpIXgdE4m6jAtuTBe0sjzuqSTww5ayorpmaGy
         NGGKAl8zrTAwPaPd/jK+gNCUKV6mWH3dfXFTeW0axwKDGDfCFnq8UKj5VnMnRUE5UhGT
         9xdA==
X-Forwarded-Encrypted: i=1; AJvYcCWxPaqUaObGycNptWK04/8kVEo98LnSAYVyihUQLBClhui0HnTxbOBVNuQNsv37PGVO73QvvfCojg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyABWM1er7w0zj+k+3idpZ9DQLFqQWdpHPh+R8ztj8fOGSqRoMU
	/xslBXA75iyIpNbBQ4sT4q2RLsk+46w24w9MasHKnQXcFLWKKaLtrerBrTzP9A==
X-Gm-Gg: ASbGncs821KH7+7T+rqsHnq12QbTGsRHb2GfMS+skPFwrXiZIPvGqqnmxyc87mrve7x
	wUnBstbZ8gCTknhMNqAFyLBzQlKzwbnVa6RljxJDItiqheSC4PQ2qPQgrGvCWxeo4/IN6I4cv0Y
	hNJ4e+cfR09CtNpxncLTJ4hVKL8R0HGpE22rE3kprRiI4RH9eG79dpwzeTHfpaoWeyWKo1F172t
	uxsGVnAozaR0NLH9FAf3O0b6MfyPa+TvqWTJxUjAEW8gSmEID64aSg0EtJxuUuhKYBo4ZijThx7
	GkmBzOjDvRcZxyKoZbWiPMzk/FPMMOyjNo9c28oeWeAxX6rRxkTXsnfoBvjVbpe6kIG+hzFdaQA
	B6DrX88ib7jn3LbRfqPloUDAQa1K9Hw==
X-Google-Smtp-Source: AGHT+IFnX6JduAHPOKQnq8RBXyoZ/4SvgwizUWaaQ03B3v/UpmPZS5BPdEF+QaBlxZT+JsjQRMScoQ==
X-Received: by 2002:a05:6000:23c7:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-39c1211b77amr10130061f8f.52.1743664093736;
        Thu, 03 Apr 2025 00:08:13 -0700 (PDT)
Message-ID: <53a596b9-7755-4064-a65c-fb3db1e4550e@suse.com>
Date: Thu, 3 Apr 2025 09:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Change xen-acpi-processor dom0 dependency
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Penny Zheng <penny.zheng@amd.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250331172913.51240-1-jason.andryuk@amd.com>
 <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
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
In-Reply-To: <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.04.2025 16:24, Jürgen Groß wrote:
> On 31.03.25 19:29, Jason Andryuk wrote:
>> xen-acpi-processor functions under a PVH dom0 with only a
>> xen_initial_domain() runtime check.  Change the Kconfig dependency from
>> PV dom0 to generic dom0 to reflect that.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   drivers/xen/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>> index f7d6f47971fd..24f485827e03 100644
>> --- a/drivers/xen/Kconfig
>> +++ b/drivers/xen/Kconfig
>> @@ -278,7 +278,7 @@ config XEN_PRIVCMD_EVENTFD
>>   
>>   config XEN_ACPI_PROCESSOR
>>   	tristate "Xen ACPI processor"
>> -	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
>> +	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
>>   	default m
>>   	help
>>   	  This ACPI processor uploads Power Management information to the Xen
> 
> Assuming that all needed hypercalls are fine for PVH dom0:

If you want to feel further ascertained, you could also add
Tested-by: Jan Beulich <jbeulich@suse.com>
even if that was only in the context of "xen/acpi: upload power and
performance related data from a PVH dom0", where I noticed this issue.

Jan

