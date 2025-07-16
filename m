Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E79B07B07
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045483.1415604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4sP-000824-J3; Wed, 16 Jul 2025 16:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045483.1415604; Wed, 16 Jul 2025 16:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4sP-0007zd-G7; Wed, 16 Jul 2025 16:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1045483;
 Wed, 16 Jul 2025 16:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc4sO-0007zX-JW
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:21:00 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db60d052-6260-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 18:20:58 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so23736f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:20:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4285ecbsm130172995ad.48.2025.07.16.09.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:20:57 -0700 (PDT)
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
X-Inumbo-ID: db60d052-6260-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752682858; x=1753287658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IwVjAT0moOk87hPanS258jzGvrWDt8uZdQcRTx/MZQE=;
        b=bXjFsiD5RNcwX9NR/JQxH8Paqpeog6QBd91UmZDvKgAtDWG2MjGMupyBF8QPnZ3lwg
         JBP5668NCqTWE3f3U5KG/tSBOe7GQAvYPapMH8YFvXiPCn9aH+SbwzdYxeA/By3Czaaq
         Lr+qRZ4UjwERcJTo5uZxx1JMM5BMhvmyAFkOtvqWiZUBqJNDkDJ81qNbHRKMvmZkabVX
         3PfKi2nzdTHareIFvMKPrZXhJjgTLuonvuiECOQ92KwAKi5OHmWXWNiYbEJdquItSHVN
         ab65NLKQlsOTCRogj7E6m52q3oekOtGVAtERnKY23OzwWKrcIOfqwaZazaf1U7x/yFNE
         iWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752682858; x=1753287658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwVjAT0moOk87hPanS258jzGvrWDt8uZdQcRTx/MZQE=;
        b=f7CFeTlL0igsRchCv8COKaLlTKz7Cesd02nryNw31OJaKWxs7nLwvwGYGa3u721luQ
         t2uPWq9SWrHtuGS8kVhU1eVeTBAhzVLFOWZ+mXtspzN/nV2UwRvLTOKFlizy1vIKs/5B
         fw7GLqRpTOIQ50GDVjWPMgq2FzRLOtVArJRBcWMTBetIUA6INPNppHcGUvWeN4lqSVl6
         5GyyF2dyQCCXVAbcoZVggw3178r9+ZglcIT7BFOPVL/asNbYErUYWzBCrgDBlTkniatZ
         i1+wzmgsijpc8sqpoQiqynbQhIo3i068nDa9D44XRYj+piH82yLrWoWMtdo8ao7iYmF+
         Wxrw==
X-Gm-Message-State: AOJu0YwV43yfN3HDSVjW3GPtWgncI2NHfwSgPSyEgyk0QpHC/HJtZhQx
	M8/gtHboGyEvCRFeo4o2Wmv7SWDf7h/SuVCWw8+UaDVEJ0TJqDE+WacZ3wvLQzGpLg==
X-Gm-Gg: ASbGncvaSWVSJHm6CHi7u3XB47D02fHCek3RReD6Fzvcx7Sfps9/MAr+OnIEouWMJvp
	GUqfm+Uf6hIRxuQ5xnAx7LGWfFHo3MExnvUvtzoQWjW0aAUJBOInxPm25zcCZgtp41Pvb4QHe6V
	WoHEz9/l8hNAYDEmYPJ4w5bAlKbTsSNL2S70+MOOQJ+/eODX9+Bj1ktMlLAvGYsxpvdqIl5QE59
	2zN8bfwnYrrDcBPUPuW6UOuJ1TQIZkndGc1FTFZAHDh4LjjR4CGohYMO+TbbQq7Bv6H3upPQ59N
	OWklS40PwzMZK9es7aWOLEDM2QoNX62IkG5fSXCK1mmaRPsBSo8sxYAW1wJEjbMpZPu4MlyvP2r
	QHCKL/mR67oZiWODF2OV2g0LfoiFyLDIhRygca8qgNXmNk05TnX27lJ1Ia3QJREaZ0ne3D5QgNk
	ZpegRkORI=
X-Google-Smtp-Source: AGHT+IHZ7U+OJgPKvCNuQiXiilSDsl2b4HWizdy3wtX24PXKyjFzy1nSrQEImYpXoSI6zFxfMkXw2w==
X-Received: by 2002:a05:6000:2b03:b0:3a4:d722:5278 with SMTP id ffacd0b85a97d-3b60dd7b038mr2062869f8f.39.1752682858054;
        Wed, 16 Jul 2025 09:20:58 -0700 (PDT)
Message-ID: <b75a26bc-90e2-4bec-a862-ab0cc564277c@suse.com>
Date: Wed, 16 Jul 2025 18:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
 <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
 <e47fafa1-e02c-432b-84bc-44c48af66859@suse.com>
 <312509c2-fb06-4fef-b632-c4719264efb8@epam.com>
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
In-Reply-To: <312509c2-fb06-4fef-b632-c4719264efb8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 18:04, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/15/25 13:50, Jan Beulich wrote:
>> On 15.07.2025 12:07, Dmytro Prokopchuk1 wrote:
>>> ARM only are:
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>>
>> This one's probably fine.
>>
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
>>
>> These two look too broad: They're affecting common/grant_table.c only, aren't
>> they?
>>
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>>
>> This one also looks overly broad, but it's perhaps unavoidable to be that way.
> 
> Those deviations can be narrowed (specifying file name):
> 
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(any_loc(file(^xen/include/xen/bitops\\.h$)) && 
> macro(name(__test_and_set_bit||__test_and_clear_bit||__test_and_change_bit||test_bit)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(any_loc(file(^xen/common/grant_table\\.c$))&&macro(name(update_gnttab_par||parse_gnttab_limit)))"}
> -config=MC3A2.R5.5,reports+={deliberate, 
> "any_area(any_loc(file(^xen/include/xen/irq\\.h$))&&macro(name(pirq_cleanup_check)))"}
> 
> Are you OK with it?

This looks acceptable to me, yes.

Jan

