Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473093891F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 08:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761474.1171398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVmti-0003NW-9R; Mon, 22 Jul 2024 06:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761474.1171398; Mon, 22 Jul 2024 06:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVmti-0003LJ-6n; Mon, 22 Jul 2024 06:51:50 +0000
Received: by outflank-mailman (input) for mailman id 761474;
 Mon, 22 Jul 2024 06:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVmtg-0003LD-UA
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 06:51:48 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9bbc01-47f6-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 08:51:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77c349bb81so365979366b.3
 for <xen-devel@lists.xenproject.org>; Sun, 21 Jul 2024 23:51:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7bbdfesm382605966b.62.2024.07.21.23.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jul 2024 23:51:47 -0700 (PDT)
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
X-Inumbo-ID: dd9bbc01-47f6-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721631107; x=1722235907; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qixsUfr2YVZJHFkxp8y5agYb/shJBoQky6y2snMLOys=;
        b=Mv9kuCIbOa4LFchNEIXyLAwM5tQYu7ul1X4wDcG16ZquG2mCmim4nfHsav/hW/W2/a
         BZXfIW2Y5chYF8sxxtRb5vkWlDJgbdk8hrr0si5VL0gYUCQ+pFRO3PnkOIYQKWrf4kxR
         zmuoZWgzjVZPAF+WNRYgzGCNGN3Hs5M4GdDGra/7S0bFr5/E6+CbqZzn8E97XQz8rhtt
         57hFBEVQEPUXJmZfUeAeDFzDcpsHd6vNF4b7qWV7F78SyngnkPi1rJZy72TZY8PiG07y
         b2HeAhcFbUPVPFWYe8aHsFPJ9RTyJN+IPxALel8QmqbuMwCii8f8lKXjPIIOXkg/k7QV
         b0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631107; x=1722235907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qixsUfr2YVZJHFkxp8y5agYb/shJBoQky6y2snMLOys=;
        b=I/mRfBTcean6Jol51SBO/X9GkMRfH3NzRVpCx4pjqrGUGfQ4rHVIIUqSbDtXbPw7Zv
         +rzktbO8B6tvlCRrpbihk/1J+a7bS/aAg+PnU1090HBUzYhZ+pqDrS7ZJspJIfwB+adx
         liDx69rpBdmpxGow+OoUeFkCllEmeAWUpDv64RcODJ49BJYr6xFUp8rcQaa6O8qmFoTA
         OzGumXC2TKNiNPji3IDr4J6jxAwFuBEoiY3f0CPBN3s1HZWbDip2zmhfSBvb1nLoHu9y
         bUWJjmRQVyPABQtvH/pclr9vXeBDhUIDXxBhsYa+3XsmaYounN6sDP7q39mdi3CHGwra
         5B8w==
X-Forwarded-Encrypted: i=1; AJvYcCW8mpsBXrfpGl1wu44Gbv+3KsCZlPNkp81zWAYNMWn3Hs3oXWPaPIiaL4oXsTxTB9cwDw2CPDCkw7BlUSQsqDBZVdhjJR7ZXzGBEllkGvc=
X-Gm-Message-State: AOJu0YwDe6BhbcbL77/h7iZZPfDzwEJt0iO4sSVD78ypYPt5EY4Z2KBe
	JIMw9bcrSqkw0yArM9zhqcha6gE1w/8Ey1gYyCmSeHkKJTcNhmjV5eIitzQgHQ==
X-Google-Smtp-Source: AGHT+IHylJpR5uouYiNAs+4Vo7Ed2Q5j518fSa8Pv34aG1zB+79fvylcMy5l3OFPzDFuvS9f+RBdOA==
X-Received: by 2002:a17:907:94c9:b0:a77:a415:f815 with SMTP id a640c23a62f3a-a7a4c00f701mr377267466b.20.1721631107270;
        Sun, 21 Jul 2024 23:51:47 -0700 (PDT)
Message-ID: <fdf84512-2f3b-4977-8d39-08a971454541@suse.com>
Date: Mon, 22 Jul 2024 08:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 02/14] x86/altp2m: add static inline stub for
 altp2m_vcpu_idx()
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <952cb307528f16fc36a3fadbe26d83bc6805f81e.1720501197.git.Sergiy_Kibrik@epam.com>
 <f917837a-e9ee-4d55-b158-208de57ee034@suse.com>
 <8969dd83-2fd7-4afe-9809-d6ebd342f8f8@epam.com>
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
In-Reply-To: <8969dd83-2fd7-4afe-9809-d6ebd342f8f8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2024 12:25, Sergiy Kibrik wrote:
> 09.07.24 10:09, Jan Beulich:
>> On 09.07.2024 07:48, Sergiy Kibrik wrote:
>>> The stub just returns 0 due to implementation of  p2m_get_mem_access() for
>>> x86 & ARM expects it to be 0 when altp2m not active or not implemented.
>>>
>>> The separate stub is favoured over dynamic check for alt2pm availability
>>> inside regular altp2m_vcpu_idx() because this way we retain the possibility
>>> to later put the whole struct altp2mvcpu under CONFIG_ALTP2M.
>>>
>>> The purpose of the change is later to be able to disable altp2m support and
>>> exclude its code from the build completely, when not supported by target
>>> platform (as of now it's implemented for Intel EPT only).
>>>
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>
>> Yet what doesn't become clear is why 0 is a valid value to return. On the
>> surface 0 is a valid index when altp2m is enabled. In which case it
>> couldn't be used (without clarification) when altp2m is disabled.
>>
> 
> I looked into it a bit more and found your concerns to be valid -- 
> indeed altp2m_vcpu_idx() should not return valid index when altp2m not 
> supported. In fact it seems that this routine should not even be called 
> when altp2m is not active -- all but one call sites check 
> altp2m_active() first, and there's stub in include/asm-generic/altp2m.h 
> to block accidental calls to it.
> 
> So I think about falling back to v2 of this patch i.e. to guard that one 
> out of line call in hvm_monitor_check_p2m() but with better patch 
> description:
> 
> https://lore.kernel.org/xen-devel/01767c3f98a88999d4b8ed3ae742ad66a0921ba3.1715761386.git.Sergiy_Kibrik@epam.com/
> 
> would that be acceptable ?

Yes, if a stub can't properly fulfill the needed role, then that's the
(about only) way to go, I think.

Jan

