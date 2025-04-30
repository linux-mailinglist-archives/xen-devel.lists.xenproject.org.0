Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7456AA50B3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973818.1361857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9fb-0008Nf-5K; Wed, 30 Apr 2025 15:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973818.1361857; Wed, 30 Apr 2025 15:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9fb-0008LZ-1l; Wed, 30 Apr 2025 15:48:23 +0000
Received: by outflank-mailman (input) for mailman id 973818;
 Wed, 30 Apr 2025 15:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9fZ-0008LT-QY
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:48:21 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a076854-25da-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:48:19 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-acec5b99052so377797766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:48:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acec668dd9csm292319366b.96.2025.04.30.08.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:48:19 -0700 (PDT)
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
X-Inumbo-ID: 8a076854-25da-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746028099; x=1746632899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qPGXjTr94IthAvGS1pndkmacKBzQzCH2IJv4hKCEkjg=;
        b=J8kWsf1D8mVccw8mTQ/0kfnueIB4Fzj0eQFp+lrL/kg0IbEGlf9YMFND+VhHyu1Xba
         XoRP2Phiw3trMH4ePzS36FnFPjEW25FGba3UKVHu5yxTx6W3XD9JwYGcLT4m4w0JmehJ
         naFG2Fdb7d7YNoKQPCrBZfaD1J/ZaCp0t1oVSt2mL5q9P0UcFqVZ1pblF9ia0JFFnIxq
         aiZWqYREqmwXq8vDBJeDCt5e+d1RWGC092Pey0HN/SNkAdTSnLr9cMAXN65Vh8Pf7ufN
         LQdBdyLvV7G40Vwq0UFtTuNhjnf7IOnk5aqUULOKRipGxMXydFKmJ+KqK8NqcU42pHEb
         Hoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028099; x=1746632899;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPGXjTr94IthAvGS1pndkmacKBzQzCH2IJv4hKCEkjg=;
        b=Ar0gkHl7pXbG6RJfPlx/LVzqCz9c7zE6ONf9N1LGTM9VGHYbZbPp5T+VixqLVT582h
         9CphoiGzItvIswrDxsbgUfcaLRAH2pHVqiNW9Aifg8fpKwbrOiK7m3x96oPr4jq0yzc7
         D4ghhEMKa4WZ/wtJmxyznhaCYU1eqa50kXOEwsl+QNC0D+Vrf0eJ7W7TUwp3UefTZWpq
         Qt/k4m0vh7ztCgnXWvQRr0fVxKKkNH3X2iRpTl8ktu/HVJYfn9AdwCjP8YBj6GV6NxoR
         /5fAc9YbTyZl039bFpr+n+dwIoTTT3qUbJB/l2GHxMWWjT47ab0CI57A48K7cw9h7QH7
         Q0uw==
X-Forwarded-Encrypted: i=1; AJvYcCXVGHp8BOtX9hQkpHSqvRY5CzWW8VeuGVBvRwFHOTGFyESsQKqqGe1WvCGSKSq4T8xa58xHZ41UPPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJyW0YoIZafNqmj2yU3i9xuN2v423HnvtzRJC74SYgSMeRJyqa
	UPWT+a40AOLaVTqZyHz5/jwf31Vw9x9zkgiyeEhLeM/fWuE/TetbCnqZ+BOXmQ==
X-Gm-Gg: ASbGncsJ1sn7enebrEf07dPpGcDDj+OK4d+tSehQUeJdL+4+4quCn7TiEEJhyxfipS/
	7bMep8Hwwkj5ooFYePK3QUrxJhyJNMOwFOj1FvuZypn7/vUoeGIOAs80zlfwwf2WBWbJDEvtL58
	GBRVCRw5TXvfuTwBqTiIbUzc4d7NpbryTHWQUa5itrX5ctTr/Jz8W2c1UpRhDlxeQSXtwK9GPXT
	M83ugMX2qnydOLGayT3NoZL9bKZ+sEbum1k74LF5lXK+WOm4SnMcAZ+7ezD9i7ASnUI4BgJoZ0F
	bgFezePMgFfdLS+47Dg2oLAw9AQ+tEAyc7ZEwuOYawJTnxkDFgf2YeH7TJwSaUdKQ1iHNKLKN4y
	yeF0ZtLVrQsLUDw3YdVRdLzPbmw==
X-Google-Smtp-Source: AGHT+IEwSCfPALaRpT0Sk5MCylOnSYRcEN6r39i/53vyyErkjdzBElH/0cMeyrqhLkH5yKdjFDN4Fw==
X-Received: by 2002:a17:906:f5a1:b0:ace:6d5b:e785 with SMTP id a640c23a62f3a-acedc700518mr335252666b.47.1746028099327;
        Wed, 30 Apr 2025 08:48:19 -0700 (PDT)
Message-ID: <f70666c1-c69a-4045-abb2-87a06e953bcc@suse.com>
Date: Wed, 30 Apr 2025 17:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] xen: introduce CONFIG_SYSCTL
From: Jan Beulich <jbeulich@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-3-Penny.Zheng@amd.com>
 <f4e6a0ed-c869-4ecc-a6bf-7ef445ac2db5@suse.com>
Content-Language: en-US
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
In-Reply-To: <f4e6a0ed-c869-4ecc-a6bf-7ef445ac2db5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 17:20, Jan Beulich wrote:
> On 21.04.2025 09:37, Penny Zheng wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -581,4 +581,15 @@ config BUDDY_ALLOCATOR_SIZE
>>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>>  	  working alongside the colored one.
>>  
>> +menu "Supported hypercall interfaces"
>> +	visible if EXPERT
>> +
>> +config SYSCTL
>> +	bool "Enable sysctl hypercall"
>> +	default y
> 
> Oh, and - just to re-iterate what I said earlier in the context of another patch:
> Imo you would better introduce the option without prompt (simply "defbool y"),
> and make it user selectable only in the final patch. That'll eliminate the need
> for transient "#ifdef CONFIG_SYSCTL", i.e. reduce overall code churn.

Moving further through the series I noticed that omitting the prompt here will
have an effect on the shim then - it'll be transiently (until the final patch of
the series) be built with all of the sysctl code again. I think that's tolerable
as long as in the final patch that is then being "cured" again. But it of course
needs calling out, to make people explicitly aware.

Jan

