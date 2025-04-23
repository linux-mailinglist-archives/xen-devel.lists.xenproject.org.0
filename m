Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87614A98A81
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964679.1355418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zpu-0000Do-1E; Wed, 23 Apr 2025 13:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964679.1355418; Wed, 23 Apr 2025 13:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zpt-0000CI-So; Wed, 23 Apr 2025 13:08:21 +0000
Received: by outflank-mailman (input) for mailman id 964679;
 Wed, 23 Apr 2025 13:08:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Zpt-0000C3-0I
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:08:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07392fb2-2044-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 15:08:20 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so47642915e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 06:08:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d29b73sm25419085e9.17.2025.04.23.06.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:08:19 -0700 (PDT)
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
X-Inumbo-ID: 07392fb2-2044-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745413699; x=1746018499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TIl5AAqaF4gjd3jATkj4ZhtvLt8ilKHYRw28A8s+irI=;
        b=G/P9ydXSYKo4FUqj/woRrzvX7YxaoJWFNoW9yIzrQawsNUCmy/fWBaTff/SEtRA3Og
         QHazMKywkErGr/jSc4xqNnaQloYRLvLxwjqYpucLgUTlXp+Q/+0eu6QACCleQPnoqH/7
         skYKC04cEIofkD5yrR8HdpQjspoIsi/8JuculO+jvAj3FGQBGUgDtIWeQsl5CvuWOr7g
         BaQQyvGq+HkDXVLxjED5P6aW+8zXNKahgchL78RuBU52QNM1yIHMplSzuUTkG0m1ybnE
         HqSHKCOturpXuXViDfjBl3AZi/VVaXRsZFmOQZSkiuM4pN+b9/XornkLL98+Mad1SDs0
         fLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413699; x=1746018499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIl5AAqaF4gjd3jATkj4ZhtvLt8ilKHYRw28A8s+irI=;
        b=KdbCXOzBRafisQkj5BHUDFg7eSep7ccZxlH5Pbvjo0rOpTUJ7FGEkUd9b3Octz5t8c
         hw+/2j+NJZ6SJfHN8oD94cgdXT+9yDY7rV5empxKQGs5s114G8q8juRF5/0ZblTlMI1J
         s9fQ2ZR6NY+wsk+zi0GmhSjbzmqbhF9gcNUgVoxSdq/XZ2qwn5pxB0+YDrJLTnqOTmzE
         guXxtLtgHlHn6s/9m5CY03DgLwJnjMSmUisO4XkH6Ugv/EBgQ5KURYfz2sb6VtdQFegw
         EP87JQ+GXMGBJlWxq5icw/jazysvlU4SXsZpKHPdBhv+NBagnN5sMVKoeWbcPdOMy0lW
         epvQ==
X-Gm-Message-State: AOJu0Ywifl2htmgu66WHwo570rFRYvRj28ENXmZR1vfFOFC5ux5FJNJC
	eab6urZAgvnD0v2xALVnO/CVwjxAIRCVtp2sCfkcpiBmLmkrIhSJyi4FMWIerA==
X-Gm-Gg: ASbGnctQptpWlOOEtrJv89C+vU9dGXCVvzpm5guxOBbhBQAnQYt/esdkd20w5mFqVT+
	Fdhxm0ALKnarEGKtqHF465PTZCRFn5mMnO8OpEl/RYhf/blNKvJyRkhdKnYY3IAAtEgzFgsXYCM
	gNZVLZXt1u7lKTrekSkHm5nvpDS+t/coVzwNhcEMeYTajudbIRiOkr1KJovMcaatzvIx7iM4e3t
	pKmJ5Hd0PACqQsp8XM9oAM2ypEq8jCVYzKkG83tZ7EyqBTxm15zYVijKPE5tPtXyVSc5Z/mPDgO
	s7Pm1rRVrtVWxbSiv94OLUyhb/fcwHpNMp3DuP7bVuwC2skUhVI/w75ahV6ScKE6EgR4qhOcwp2
	aGMjOxhiSNOS/Xj03UgJY+0QXRg==
X-Google-Smtp-Source: AGHT+IEZG1H1mMD0acc0I4IxL8udodY13OrB2Zu2B2ThWNM0Oz2TL4UAOMkdhie9t1i8eeEVtJoB/w==
X-Received: by 2002:a05:600c:3c8d:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-4406abb0ca5mr185672835e9.18.1745413699480;
        Wed, 23 Apr 2025 06:08:19 -0700 (PDT)
Message-ID: <4813aeb3-72c6-4705-8591-1af63ec05ae8@suse.com>
Date: Wed, 23 Apr 2025 15:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] x86/hyperlaunch: obtain cmdline from device tree
To: Alejandro Vallejo <agarciav@amd.com>, dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-8-agarciav@amd.com> <aALX/NgsSi5sTyz3@kraken>
 <D9E1DIGCGP1O.QQ1KK0P3NX0K@amd.com>
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
In-Reply-To: <D9E1DIGCGP1O.QQ1KK0P3NX0K@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 15:01, Alejandro Vallejo wrote:
> On Fri Apr 18, 2025 at 11:53 PM BST, dmkhn wrote:
>> On Thu, Apr 17, 2025 at 01:48:29PM +0100, Alejandro Vallejo wrote:
>>> --- a/xen/common/domain-builder/fdt.h
>>> +++ b/xen/common/domain-builder/fdt.h
>>> @@ -9,6 +9,30 @@ struct boot_info;
>>>  /* hyperlaunch fdt is required to be module 0 */
>>>  #define HYPERLAUNCH_MODULE_IDX 0
>>>
>>> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int offset)
>>> +{
>>> +    int ret;
>>> +
>>> +    fdt_get_property_by_offset(fdt, offset, &ret);
>>
>> Perhaps something like
>>
>>        (void)fdt_get_property_by_offset...
>>
>> since there's no need to check the return value?
> 
> I vaguely seem to remember doing something like that a few years ago
> (because it does show intent and many linters require it) and being told
> not to. But maybe I misremember. I'm definitely happy to use that
> convention here and later unless someone pushes back for some reason.

Unless we settle on the need for such for Misra's sake, I'd like to ask
to avoid them. We generally try to avoid casts as much as possible. We
then also shouldn't add ones like suggested here.

Jan

