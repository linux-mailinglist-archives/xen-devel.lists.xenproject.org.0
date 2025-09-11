Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E21B52B3E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119604.1464887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcO6-0001eV-BC; Thu, 11 Sep 2025 08:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119604.1464887; Thu, 11 Sep 2025 08:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcO6-0001bL-7N; Thu, 11 Sep 2025 08:10:38 +0000
Received: by outflank-mailman (input) for mailman id 1119604;
 Thu, 11 Sep 2025 08:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwcO4-0001bF-1e
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:10:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca2ff67c-8ee6-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:10:33 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b04ba3de760so58014066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 01:10:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da37dsm76772266b.18.2025.09.11.01.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 01:10:32 -0700 (PDT)
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
X-Inumbo-ID: ca2ff67c-8ee6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757578233; x=1758183033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=knyf0yL3ndeWDsGH4Eq8tgKU2oeckIccW+wZEkcHsLU=;
        b=YUHXnAIW06h7iYDzEAIi6w8B4OuGccW7bx9gvDoJpZ9Py17A3Endx58b1CmnH5x8/F
         l3p6WTk4Cj7gAilFeds4rnynmA7inOQug6pTuJ80WkrZSyHO4pBFJ9d9yzXPrr5fnc+V
         lCQPcI8TNJmhcT8xpYBjkvzh6d0eC6bR0wRVj9rIxtNLXFNudf5hjzBiW7B6s7Lx090j
         R8siFyl/UdYS+faxfLJYMomPxS22z4i1BkNXwlapD4XBhhuIQ0RPMNKGr67NOz9VgOyJ
         Lo+Mb4VWCy4arIvbgIw6dR8txSKo3zvFRt5PeD9oXZbU3XTBJAsMhj3va2k8zQV5uBp4
         6HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757578233; x=1758183033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knyf0yL3ndeWDsGH4Eq8tgKU2oeckIccW+wZEkcHsLU=;
        b=ZeyAMJW6yYfITakRTpG4I9e7K96OwlB3Ypb9lb2BQ2/5c6CBRO66bFcMToBIZnk8hQ
         0vBg82HGJvMKwcCWrSxdfQ78i69Krwuq3jfr8n9vkiItQvqqkHLbD5I2NJ48q/5KxsM9
         moMaNh5usRcA/WEXXKTUhGOeot03EkDYs9YWAa7pwZZ13VB4DWPOcaPE16txGxJNu4BB
         BZMWIiThuLh2lYkpeQMiUmBhmP57Hb1Jh4c/uk5u3bD7ihkyThKA6VEeUds2yUpmSh+u
         krK5C86Au+8R1Atim/Ltwxru3l1rmi772L+B6Pt8/xgjmLcXOsst9lewWpR+k+l6jEo8
         n1jA==
X-Forwarded-Encrypted: i=1; AJvYcCVtaebPqQP0L9sMR9giMq0/eFleDOM9qxJLXBPwAfUfUSZsT6bI8oGnd46SgvtYATTcWvvwxntK3Js=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzteFqJjtMwJBX5HB0cCYYcDIcz/DIyDWcGrgrOfcI1G67eyQmu
	jnGwuVWIt9233z2tt5+4z15wDA4xKuP2kxWPWcaUJV412bRJV00oCXs071FbLZcKtA+cBOyXWZx
	IFY8=
X-Gm-Gg: ASbGncsBAfh8mM+KqUlpNgamuj9DASbLELFMxeVVq5E5OgnfgJGWiUsOpwKVSSWRYcG
	2aNtpld3O6wuE5PmbY8UZoVROJ8iUrcIEEJVjlw4p7OPSXj49uxvy9vR2F2swSDS1H1qIiA0QUg
	TK88A/7zZ6yKgqutcEOVJdhiqQTgFyV6aDFxMXJru3vyV8oZcalTFS4+go0GWuxCOeAVYTvhg1r
	QQf83M++1zfVEBGO/GnkT7rM7Uz3kPPIdWZRWEx/LJyPxamNd8xZDJnpKnO+TIiYQYrfINe1m5o
	PikhjE0QPdwzcYz/Lj+LL5zouVqlrXyrOUQKRKFm5mwCXpG58gjOO8T45Na5Jao1xZ8NUM06dFr
	WvzFFId0LiZZvZlEZEiadamYY6YZWPYm6aV/Q+hLlaDRl6wFIzvAcj68xvuH/RPlTSlDEhrOaYO
	Q2FEFmVRA=
X-Google-Smtp-Source: AGHT+IFHdOleZ4VTgSObIOXSTwv1jvDLlQ2sHqF2+DXxk7djHAQ/TgU2b690W9FeRNiRXH3mtVQ7Ww==
X-Received: by 2002:a17:907:7ba3:b0:b04:9c08:e04b with SMTP id a640c23a62f3a-b04b14b1c8dmr1743764066b.29.1757578232777;
        Thu, 11 Sep 2025 01:10:32 -0700 (PDT)
Message-ID: <a588d317-c1b5-4a0d-b300-f5bfd32af30e@suse.com>
Date: Thu, 11 Sep 2025 10:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/26] xen/x86: consolidate vram tracking support
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-4-Penny.Zheng@amd.com>
 <e4a0f7d6-6c8c-41b2-9bb4-19f2403c7d3d@suse.com>
 <DM4PR12MB845197AF26CCC286C1EB1F19E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <DM4PR12MB8451413D745BC2EE9FF5FCD4E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451413D745BC2EE9FF5FCD4E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 09:54, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Penny, Zheng
>> Sent: Thursday, September 11, 2025 3:16 PM
>>
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Wednesday, September 10, 2025 10:09 PM
>>>
>>> On 10.09.2025 09:38, Penny Zheng wrote:
>>>> --- a/xen/arch/x86/include/asm/paging.h
>>>> +++ b/xen/arch/x86/include/asm/paging.h
>>>> @@ -133,13 +133,20 @@ struct paging_mode {
>>>>      (DIV_ROUND_UP(PADDR_BITS - PAGE_SHIFT - (PAGE_SHIFT + 3), \
>>>>                    PAGE_SHIFT - ilog2(sizeof(mfn_t))) + 1)
>>>>
>>>> -#if PG_log_dirty
>>>> +#ifdef CONFIG_HVM
>>>> +/* VRAM dirty tracking support */
>>>> +struct sh_dirty_vram {
>>>> +    unsigned long begin_pfn;
>>>> +    unsigned long end_pfn;
>>>> +#ifdef CONFIG_SHADOW_PAGING
>>>> +    paddr_t *sl1ma;
>>>> +    uint8_t *dirty_bitmap;
>>>> +    s_time_t last_dirty;
>>>> +#endif
>>>> +};
>>>> +#endif
>>>
>>> Subsequently I think we will want to do more cleanup here. Us using a
>>> shadow mode struct also in HAP code is bogus and, afaics, wasteful.
>>> The three latter members are used only by shadow code, so HAP could
>>> have its own, smaller variant of the type. And each type could be
>>> private to the hap/ and shadow/ subtrees respectively.
>>
>> Understood.
> 
> Reading relative codes, found that we have a "struct sh_dirty_vram *dirty_vram" in "struct hvm_domain",
> If we defined different type "struct hap_dirty_vram" and "struct sh_dirty_vram" private to the hap/ and shadow/ subtrees respectively, either we add different type in "struct hvm_domain", or we change it to the "void *" there and do the type casting on referring... maybe the former is safer or any better suggestion?

Yes, but I wasn't really meaning for you to do that further cleanup. I'm
intending to do that once your change has gone in.

Jan

