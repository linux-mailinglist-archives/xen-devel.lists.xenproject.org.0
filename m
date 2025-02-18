Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241FA3A0C5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891882.1300895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPAm-0002vM-1y; Tue, 18 Feb 2025 15:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891882.1300895; Tue, 18 Feb 2025 15:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPAl-0002tu-VV; Tue, 18 Feb 2025 15:06:07 +0000
Received: by outflank-mailman (input) for mailman id 891882;
 Tue, 18 Feb 2025 15:06:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkPAl-0002to-9M
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:06:07 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dffd6719-ee09-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 16:06:05 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e05717755bso3494360a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:06:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9e44b7fasm359648966b.120.2025.02.18.07.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:06:04 -0800 (PST)
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
X-Inumbo-ID: dffd6719-ee09-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739891165; x=1740495965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LueX3QKs+Wj2CWvF48fYLBcsYsF22UqinciBtK5fboE=;
        b=MiQ7aMDG/EZ6Lk3v4oQOg4Duk8+ECGM8yUlzSI7WHEe9FQ3Edukl+SA8032fwd6xyY
         llNZKXaxALD22rkN7c3rVRIMjProkzlyzKUQCXPmHLXGBEQneKHTaTgsLtkxFT5B+x2L
         Fj2FTW132fX2niw8ket5cvGmmbTmcw4SFLPSkGY5DWjuoNrm2X3daygfeC/xfPE6h7uk
         +FC+JRWyuEPFSFZfi4jhjhyOBNpskd4v9jeGyr2xAMlFGiiLReUEiCuUiDw4EuPOi6he
         MRV/5V2D3Y+wNPnx3FAitJ98luovTUpKSVVOMqTLlxeQDdcfZuNeLDNyH3/h3kqQLUGU
         2Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739891165; x=1740495965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LueX3QKs+Wj2CWvF48fYLBcsYsF22UqinciBtK5fboE=;
        b=MTv2bM3LU+9H7AuexGaa6uBcFg67+55EdkE1nAIKhYSMTSq8W2m3ceXPRVG2Tjhk1w
         Js0jP78v5aLFVDwKevE4TbNz5a8XxzKp6BMRXJsaipRxmeGRG0BFdNuuJwgsrPzTNbB2
         AcKLr24G6UFH5wqS3nYdsighwGaHNd/mcJugiAGi8TFiaYt9MNpwWpCiIop6+Vyht67B
         si2ZDhO5LdgGmNjaSAoVEXfhDuCcAN1s/WwFr52bosg0awgEMNiRMO8gItiJXFlA4SLA
         Es2Yshq6fU7nHvdRw/6n9BczBRkjfzDHOOG7CZamvdkMC/oRpm4+x0qp+VtyJPuK9kDn
         KYbg==
X-Forwarded-Encrypted: i=1; AJvYcCX2PAoR4+W2oPR1oNU+wL/ZJSBHRyiqWZ3qaBInHsaVvTwo+TCLlwrlB/xWYzqvinE9nju1OK/s6eU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZXbGweRKUWxHG00+R3OF6UANvyD5WLLJETHBU9HSDi531UquI
	LUIsXzrd1HG7a69zDpapjcX0XiFfNTb6PGjgn/7nGwQhmT9aC1+wtE3vw9jxCw==
X-Gm-Gg: ASbGncspnvrM0tRHzNBKdNu6j5x6MOnwHTcT1Qykkt/Wv/g1OLvRRXN33JbGY/eI7UD
	13XugGA38BccEohUFG6exMjmEB0r7Fs1Y/QxzQXoSiy3J2ug9/xJhGRh/jxqL1Ize2wqyfF7BOZ
	++TPpQpIhEBxCzA/P7s8fRs9qhYyNITlAYTixCjoL6EyU0OCA7hOm0UVH1AIsADATB6cFyBLPMl
	8JgOLmo5XZ2oBddTLVYUdcAqsyFUHbI6Jsx02v012Y5Ye6qqm0aHdS9mQae0opyoBaIW5AWs3gH
	qXuNuBcrV7hAD8k3qCw9Pef/OB24sTuBjJfHB+fCDpDyGtxCkdt52+K4du2ZuuoApnvfvJUJ1zd
	m
X-Google-Smtp-Source: AGHT+IFt0oOgBYUT9Vo83jqX8r3F2Iihu1uEHijjJBsp2+ukLvwZpTtWlCADqyVPNd4td9O+CJT/jA==
X-Received: by 2002:a17:906:2454:b0:abb:9c8a:fbcd with SMTP id a640c23a62f3a-abb9c8afde3mr818079966b.53.1739891164276;
        Tue, 18 Feb 2025 07:06:04 -0800 (PST)
Message-ID: <4b31f272-2bb2-40d8-94d9-8137586b59fa@suse.com>
Date: Tue, 18 Feb 2025 16:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-3-luca.fancellu@arm.com>
 <eeb91fb4-ef2e-4f07-a1b8-1812f0371113@suse.com>
 <1133b3cc-4051-44d9-83ab-88c4c30f260a@amd.com>
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
In-Reply-To: <1133b3cc-4051-44d9-83ab-88c4c30f260a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 16:01, Orzel, Michal wrote:
> On 18/02/2025 14:44, Jan Beulich wrote:
>> On 18.02.2025 10:51, Luca Fancellu wrote:
>>> LLC coloring can be used only on MMU system,
>>
>> Just for my own education: Why is this?
> I read this as it refers to the feature we have in Xen, not the generic concept.
> You could in theory achieve cache coloring without MMU using static allocation
> or some custom allocator but in general we benefit from being able to map VA
> to PA aligning with cache coloring scheme.

Oh, okay. Then maybe the sentence would better be worded to express that
it's our present choice, rather than an inherent limitation?

Jan


