Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76FEC8601E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 17:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172098.1497200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNw5v-0003tP-AX; Tue, 25 Nov 2025 16:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172098.1497200; Tue, 25 Nov 2025 16:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNw5v-0003rc-6t; Tue, 25 Nov 2025 16:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1172098;
 Tue, 25 Nov 2025 16:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNw5t-0003rW-O3
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 16:40:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c973fbb-ca1d-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 17:40:44 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so31482065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 08:40:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf22dfc1sm256938985e9.12.2025.11.25.08.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 08:40:43 -0800 (PST)
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
X-Inumbo-ID: 7c973fbb-ca1d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764088844; x=1764693644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tES4zmwS3vaxkwdUFqxlsBq9lG/kqXqC++8fDbpGh1M=;
        b=azIPds/pgcoYsu/hZElsc/fPp6nJcPohNYWEYedTnlnaDtCaswZL35M06qj1WdGmEy
         l9OsTvshtxx72Muiez4AgYuAUgzwqzxU2luk/vD5rE9q7celcgX2EErhRlFgJIlGWDj3
         lDJZ9IdApTY5mxHsFKRvV931+xjGsU0H3Mwr55PoufdD6ZDnH2UCHvoGQBMmwCUCpb5+
         OwngFLp7ii+/DGwIooVtXDeYVLUi3p32gpYmez7IXWx5SkkjX8elnT5qrKGgdPAT5Tsv
         nsdOjdt45ElJeivg7GxKQAjx0kpZSq0iJQdT3dXM2uYsMFGz3e6EeZZQJRzQdiY17XYr
         HcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764088844; x=1764693644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tES4zmwS3vaxkwdUFqxlsBq9lG/kqXqC++8fDbpGh1M=;
        b=t0/6vXkk2r4B53I4AwETDQ10dqx4FuwwJzKzRFRXNjPDk7z8HxBSgf4+i9eWU9UGK7
         BK1Btvas8chH2ErgWLirhDPaYFSM1WgjmGHxCNN2/eJqEhzq5/K1gw+CQKjGq7JpEy6i
         nqagukbrIWOMh+sLoJZR437yCfqYGt909qKaJ7KW9iXynzTV9Wihc0wnup5yV7G115TJ
         kAH5I7KwbO9sPMrmi796ADZdCOO2NpwtUfDXpZYuRBupkDGGKXQ5IFLmYg9jGRJibJR9
         mt673NwRemy0W1oYSEWhBMmPkujLYvY4xrU12Xu/RqI+eMe9RMmZlVw42qnS07ofoDsJ
         Ww0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqL8KG0XwAU+2DSpWFgc1OrA+ZhkU2VdK9x12GXj1xmG5yGZJP4GVXh7YnF6yw2U6Ewm1Un0un+cI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyrqdwPx8FTLhmtUjoXyy9NLusWp1uuA1D0JRKNbJ5rinUVA7U
	HKcFjowitYG6ybqWoi+T/bC13ptCCLMiXB4aB89yBZkrdUI82tPdbfBtF7RYKki/0A==
X-Gm-Gg: ASbGncuqXkKlle9CnpcLbBYVZpvMfTlFi6a3GFcaP24CXU3eMp6JH0v8+ZZ/vDnW62C
	USPvy/CoK6HLWdmd30W3/Sm8WGhYG28/7BZp9ZOAO4pjyRnmObWfQoCn5dtI0igiKLCRb1XW+1g
	6B2AaaaoJUWz6AyH7kujim6zd3Vb3ZpQNU9fFfYOZLV6HqMfCF3wEpqJeYK/491qyQK6MoU28Wq
	5hnxF+pUVXlF1f6MspEDglgx4QGiHsRD8KxYPH29fCyIVPROdiuUU2Zc0/CXl33IJrUrqlAUpGS
	r1I1SaNjpjozKz5mLG0wpm4DcWzxpC7l9CpQ/9PkCNpnXytIF5lLSf0wrRHZwEKsN9RpVWBCAEC
	Sb0O0RNR2wmHyIjmQK78XC5wuxtEOWTYUgJWLt6uW6sVLdNIye3S7pEG0fnOr6gN9s27Q3WH+gv
	jSSYNDSgBfvApnfNL29rMALQ0pzfL+wIKf/Fl7PMmWocrksbW+6TYprpVJT9fQ78r+nDd5MBM=
X-Google-Smtp-Source: AGHT+IGfKdzHlbPqPiGixZUXnFKU/IEN1mxzAAymJWn9Bt94tET5r7bBSrYYST4CK0IxGRa0wszV3g==
X-Received: by 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr246640535e9.24.1764088843613;
        Tue, 25 Nov 2025 08:40:43 -0800 (PST)
Message-ID: <705a3b5f-3b69-45ea-95e7-877137c6f038@suse.com>
Date: Tue, 25 Nov 2025 17:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/24] xen/domctl: wrap hvm_save{,load} with
 CONFIG_MGMT_HYPERCALLS
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-20-Penny.Zheng@amd.com>
 <13cded84-19b7-432d-a9b1-2b9ad9f83283@suse.com>
 <bdd2555d-4c56-44ab-b942-a4977dd50c48@epam.com>
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
In-Reply-To: <bdd2555d-4c56-44ab-b942-a4977dd50c48@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2025 17:30, Grygorii Strashko wrote:
> On 25.11.25 17:59, Jan Beulich wrote:
>> On 21.11.2025 11:57, Penny Zheng wrote:
>>> The following functions have been referenced in places which is either guarded
>>> with CONFIG_MGMT_HYPERCALLS or CONFIG_MEM_SHARING:
>>> - arch_hvm_save
>>> - arch_hvm_check
>>> - arch_hvm_load
>>> - hvm_save_size
>>> - hvm_save
>>> - hvm_load
>>> While CONFIG_MEM_SHARING is also dependent on CONFIG_MGMT_HYPERCALLS.
>>> So they shall be wrapped under MGMT_HYPERCALLS, otherwise they will become
>>> unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
>>> We move arch_hvm_save(), arch_hvm_check(), arch_hvm_load() and hvm_save_size()
>>> nearer to the left functions, to avoid scattered #ifdef-wrapping.
>>
>> Why would you move things? What is in this source file that is of any use when
>> MGMT_HYPERCALLS=n? The only caller of hvm_save_one() lives in x86/domctl.c. With
>> that also removed, hvm_sr_handlers[] is only ever written to afaict, which means
>> that's an effectively dead array then too.
>>
>> The final few functions ...
>>
>>> @@ -390,6 +391,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
>>>   
>>>       /* Not reached */
>>>   }
>>> +#endif /* CONFIG_MGMT_HYPERCALLS */
>>>   
>>>   int _hvm_init_entry(struct hvm_domain_context *h, uint16_t tc, uint16_t inst,
>>>                       uint32_t len)
>>
>> ... here and below are only helpers for the save/restore machinery, i.e. that
>> _all_ is also usable only when MGMT_HYPERCALLS=y. Yes, that's a lot of further
>> work, but what do you do? You'll then have quite a bit more code removed from
>> the set that as per coverage analysis is never reached.
> 
> I have a local patch which allows to disable all HVM save/load code at once by using
> separated Kconfig option SAVE_RESTORE.
> 
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -127,4 +127,8 @@ config VHPET
> 
> +config SAVE_RESTORE
> +    depends on MGMT_HYPERCALLS
> +    def_bool y
> 
> SAVE_RESTORE - annotates all HVM save/load code and, in general, could made a feature by
> allowing it to be selectable.
> Of course, It all can be done by just using MGMT_HYPERCALLS.
> 
> So, I'd be appreciated for you opinion - does it make sense to have separate SAVE_RESTORE?

Yes, why not? The granularity of MGMT_HYPERCALLS is getting a little unwieldy
anyway, so why not leverage what you have to split it up at least some. (Of
course much depends on how intrusive that change is. Then again the same
intrusiveness would have to be expected if it all went under MGMT_HYPERCALLS.)

Jan

