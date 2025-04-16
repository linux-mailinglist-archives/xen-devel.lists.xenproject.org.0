Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B3A8B06D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 08:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955122.1348952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4wOe-0001jR-WC; Wed, 16 Apr 2025 06:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955122.1348952; Wed, 16 Apr 2025 06:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4wOe-0001hY-T1; Wed, 16 Apr 2025 06:37:20 +0000
Received: by outflank-mailman (input) for mailman id 955122;
 Wed, 16 Apr 2025 06:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4wOd-0001hS-Bp
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 06:37:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b69f654-1a8d-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 08:37:13 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso45188045e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 23:37:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ee2172a12sm1802154f8f.99.2025.04.15.23.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 23:37:13 -0700 (PDT)
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
X-Inumbo-ID: 3b69f654-1a8d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744785433; x=1745390233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gQA7EVFX9QR0ZYzsOggsi31DJpBi0/Y6sNmJ0+bLo/0=;
        b=Ms9a2keEaMyyji7/VfhKxoxjtBZrcAXpkQDhMftGHTH2aQHSYoyWYcx4f4FmejRgjj
         5D9GGGpqVvtM6wGWoYgeMV/PpSu31uDrA28AbxFO11odPUzpjuLgGjZ7140bqNcLft04
         W+ZXUT/m0uuk/42iQFFsfsxAR2OLs9zqDrck0qOyqh+kko/MfXmsPWwZtvid/AsIWsjk
         E9q4HSOOCplV6nUZIGFzCIs2SIwopl2UigCUXxDA8N0OmizL5nkClGsleJZeA1A2BFLs
         /W2vif2UDkEEAeD53Oye0lQx1Z/NODGa61gIX8F7GZSn0xA6W66CwzYvNN90Y9JnPK3B
         6klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744785433; x=1745390233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQA7EVFX9QR0ZYzsOggsi31DJpBi0/Y6sNmJ0+bLo/0=;
        b=qXHBKVtmno2jQtGaDLWYfFplC2U6LsUKpIae0EebnlNOONYsd1m/Wa/ygytuEstx8g
         3Me8EHhazXMrOj8udT659NtSDZNA4a2IiCaf97vV5UgSbvevbkwQKJvAv/vg7GPZwSx4
         XJu57Ip7VqiJ5XtWQPW6v3Bm5UDhmW8+If9dHzcg2Iy10/iPvG3j9pmZHJI9BUIR2t7g
         a3rVowVeO2TFCzdRxw/0iYPhU7+i5lBL9cuE9SN7Cs0oYENIRh4A25O/v5Epkd4+gUVa
         8KF7QPPkhb/0XuFdehkLXxnThAM9CYwKHT1QrB2iJHmgwbiHyibi3nscw/BjJrti+4jX
         8Mgg==
X-Forwarded-Encrypted: i=1; AJvYcCXj7b7Rff8sQj+zgbZJl71Z85zYSTTCiHvWMAkvDg+MT872pFVWrKaOuFGe6QHlTJHgka+y4/E2Y/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzblGI8/qesZHaQXh9d0XjonWPeSQdHKpVUqoxzGRcqVmIONk+n
	yCYyrv3aRl0+xwtYMtB/HMPMXKW2mLyIJDj9x35X7fN0ep7pqojTf4wyW/2cCg==
X-Gm-Gg: ASbGnctP91LZXC6JMnAdr6WlBf7Rhi2iYoRD+7KWd9CtV4waT1+pT8n3xgm7FDB/i+w
	TKNgJeRUcS/KqAthxDdotVAPHqQBBnqWNHVORj55TQ0n9/J/wRW1TUDaWKUfdzeX13h695AcO5B
	9Y7k5/v5kqgwUyyRFTDvSrKeZaUvtFTJ1DjlEv07TGRJfBamTBOPvgcaLfewsKgvXxDARdMXQ2u
	4oIOJtq7OXADxC9WH9S1EZx1V1N/FLPbCUtMRC2xXhZM/zB/d/5NPGKQC83xQOItbSp34pd2cul
	xuny3aUPn6II0PS1MnZGXg7F/5X+widkHWvdALGh8YZN7dS6QFJcOOabTCTizxrujdpDjujXjNi
	zBQxhD/wg4KK8jFF59QMAYmDVNw==
X-Google-Smtp-Source: AGHT+IFzHlIHdBoJngYdbiakfhUgxJO5FfTeJOxU0+dAmJ9mbr4hNNQbUhgEOJkmP437Bh9mcAdM1g==
X-Received: by 2002:a5d:47af:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-39ee5b13061mr416503f8f.8.1744785433394;
        Tue, 15 Apr 2025 23:37:13 -0700 (PDT)
Message-ID: <6c5b4f07-0f7a-47aa-9469-a5a7adffe27f@suse.com>
Date: Wed, 16 Apr 2025 08:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/19] xen/sysctl: introduce CONFIG_PM_STATS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-11-Penny.Zheng@amd.com>
 <df30d9fa-15dd-4923-bdaf-04f9476529d1@suse.com>
 <DM4PR12MB84519E18C6F4FA7724C03751E1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84519E18C6F4FA7724C03751E1BD2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 05:54, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, April 1, 2025 9:10 PM
>>
>> On 26.03.2025 06:50, Penny Zheng wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -557,4 +557,9 @@ config SYSCTL
>>>       to reduce Xen footprint.
>>>  endmenu
>>>
>>> +config PM_STATS
>>> +   bool "Enable Performance Management Statistics"
>>> +   depends on ACPI && HAS_CPUFREQ && SYSCTL
>>> +   default y
>>
>> As per above - either name, prompt and the description that Stefano suggested
>> are wrong, or it is too much that is being covered by this new control.
>>
> 
> We have two sysctl-op on performance, do_get_pm_info() and do_pm_op().
> I think do_get_pm_info() is to collect PM statistic info, which could be wrapped with
> CONFIG_PM_STATS, while maybe do_pm_op() is more focusing on performance tuning.
> How about we introduce another Kconfig CONFIG_PM_TUNE to wrap  do_pm_op()
> and related helpers? I suggest to introduce a new file pmtune.c to contain.
> Or any better suggestion?

"tune" is too narrow imo. "ctrl" may be an option, but how about simply pm-op.c,
fitting do_pm_op() pretty nicely? Question is what else is going to end up in
that file.

Jan

