Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAC28C4EA8
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721335.1124695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oj0-0003ml-1q; Tue, 14 May 2024 09:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721335.1124695; Tue, 14 May 2024 09:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oiz-0003ka-VH; Tue, 14 May 2024 09:45:33 +0000
Received: by outflank-mailman (input) for mailman id 721335;
 Tue, 14 May 2024 09:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6oiz-0003kU-8y
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:45:33 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4af3207-11d6-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 11:45:32 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso7413700e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:45:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bebb6d5sm7300261a12.34.2024.05.14.02.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:45:31 -0700 (PDT)
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
X-Inumbo-ID: b4af3207-11d6-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715679932; x=1716284732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVOcvwwuLFbSN2m1WLpcMqmAgm5xwYO31xM9tDej/xg=;
        b=fPNJanHhmfu8zCe29q/czxp1kn0FOZm1SxoSbgEyyBHIS9kwqAGgIXHKcv9Q+36tr6
         pV0fle5Ks7p+q+7ct012qq5LUAiEkxQDIG14Y6KzVCaPPl94sgtZA+Zv+Aly0N1EXqCb
         KeZh1qak4mQfRlADghvlEk7mKAk2FAeZoF+Q6whacqqqRBT3JZ72jtY5eZs3H5htBKz+
         TR0sqwKJw6W2GHvRHfA4I54Umh3X6lpLD/NC5kg7DlEVAaLrWiZCbg/2KQ+xM2R3cDSB
         BpqDNkKHYYlFdYdIcYO7PmltzCk2j7C6eluKUVyKlrEu4XOXW8Ae8pPWVQhoCu4qCaG6
         xG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715679932; x=1716284732;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVOcvwwuLFbSN2m1WLpcMqmAgm5xwYO31xM9tDej/xg=;
        b=wAvtV0ZQuKwngdfSqzfnVp/rdN1Agzll6WtIueVpCdx0B/BrRTR6nK/zS0p9n0GDkp
         Z/y7QKGRpzEGy9XOps5JVsFphrXBRn89B60sY7g/WhlCpB9yWkAGYwzsuGXiB+EDRtIu
         Na92cBgBTmw3Dvn+GlPdcGXCs4OVlJ3Ar9UhZKK+SLDdxJWlx9hJdeYmqJ/6qTKePUBz
         0o+BKSLNOJV9TK3iHR9IbbGYTcCT8g33UON7LggjizkkVRKoliZuS/X/crE7UZXqMs4a
         T8QVB553U351tV/T8UcgioEGWDeU4Z8LDdep5mDahW3XQa++mrQPo6YGcQJhEAQtU2jF
         KqLA==
X-Gm-Message-State: AOJu0YzbVqqTcsB/EfcGeBUa9AwIHhPgrzxzq2uLClXthiXK76eO7ML5
	puQwGbNxD9yD2MNODv9EL4AZ+yY04QzZhblASWy4n6lv4BLBTiBkoodX84eQNA==
X-Google-Smtp-Source: AGHT+IGojVhQq61pP0/4k4X1JBBOBbd0KmUNhAsTZkIYljp4nXJSFgiZSvEAxWCRRK/xLmK0OLB6og==
X-Received: by 2002:a19:6455:0:b0:51d:ed1:b44c with SMTP id 2adb3069b0e04-5221006f7e8mr7630891e87.19.1715679932001;
        Tue, 14 May 2024 02:45:32 -0700 (PDT)
Message-ID: <f77ec9b8-d780-42a7-b527-efba0e121286@suse.com>
Date: Tue, 14 May 2024 11:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 08/19] xen/x86: Add build assertion for fixmap
 entries
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-9-eliasely@amazon.com> <ZkMx9O5MtR_eTr1g@macbook>
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
In-Reply-To: <ZkMx9O5MtR_eTr1g@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 11:42, Roger Pau Monné wrote:
> On Mon, May 13, 2024 at 01:40:35PM +0000, Elias El Yandouzi wrote:
>> The early fixed addresses must all fit into the static L1 table.
>> Introduce a build assertion to this end.
>>
>> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
>>
>> ----
>>
>>      Changes in v2:
>>          * New patch
>>
>> diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
>> index a7ac365fc6..904bee0480 100644
>> --- a/xen/arch/x86/include/asm/fixmap.h
>> +++ b/xen/arch/x86/include/asm/fixmap.h
>> @@ -77,6 +77,11 @@ enum fixed_addresses {
>>  #define FIXADDR_SIZE  (__end_of_fixed_addresses << PAGE_SHIFT)
>>  #define FIXADDR_START (FIXADDR_TOP - FIXADDR_SIZE)
>>  
>> +static inline void fixaddr_build_assertion(void)
>> +{
>> +    BUILD_BUG_ON(FIX_PMAP_END > L1_PAGETABLE_ENTRIES - 1);
>> +}
> 
> Just introduce the BUILD_BUG_ON somewhere else, no need for a new
> function just for this.

And especially not in an inline function (thus triggering the potential error
perhaps several dozen times in a highly parallel build).

> Adding the BUILD_BUG_ON() to pmap_map() would be perfectly fine.

Nevertheless we have build_assertions() functions in a couple of places, so
yes, there are precedents to doing so rather that putting the constructs at
more or less random places.

Jan

