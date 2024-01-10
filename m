Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C098296CB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 11:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665362.1035554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVNj-00087K-A5; Wed, 10 Jan 2024 10:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665362.1035554; Wed, 10 Jan 2024 10:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVNj-00085k-61; Wed, 10 Jan 2024 10:00:19 +0000
Received: by outflank-mailman (input) for mailman id 665362;
 Wed, 10 Jan 2024 10:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNVNi-00085e-6a
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 10:00:18 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0db80bc0-af9f-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 11:00:16 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cd703e9014so13876191fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 02:00:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ci7-20020a056e02360700b0035fc82879a4sm1146264ilb.45.2024.01.10.02.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 02:00:15 -0800 (PST)
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
X-Inumbo-ID: 0db80bc0-af9f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704880815; x=1705485615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MtsbeRNRVsJjHFzJqpM0BeFTrra42tXbUWFiQVGdZGw=;
        b=ddgaEu0n97ENBC1S/NgATJnyYs+i5GMCyThxvrf/5NhoE+ogZ/+kESkoyap576IC7J
         PVNWT1+jXYe5xhwKdirG7l/YWwgqzYjCefXH4iJXO63Spw+ZlvsguB7lce3RN3BfiOhB
         U4xZscKD4YtjO/QstWeEYspxzmHvzeYEoQQemrpspU3CLxgD+TC/ABKbjb79mH5eIeU8
         G6eLF9whXUS+sPtYObNdiCdSnRrqwHxjPTlDXt8finDeEQ7OPsNgCZiOqYtS4lx2ihxP
         d6MOFiHyRx6Q+sCn/Klbp1n81nynKoY7zFULfZuhYbMcY4mek+BkHx9L5P339SkrBIbx
         2/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704880815; x=1705485615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtsbeRNRVsJjHFzJqpM0BeFTrra42tXbUWFiQVGdZGw=;
        b=KtzEICYRzka2jkSlXX4fXO8nGvjLW5LDJLi48SOhv/Uj1dVhRKgkbOO8/7gbBnuFXG
         RZRbEQ1aUJncbidAI2r0DW45pizYXYCYqlyBQOtceJtL3fe88tG3mJi+2usFYQ2KG2iS
         4gbfjZBuN9fT9xHL82yenDsDb4ShLLiqDldoXR1jEOeoR7GcGWREZUPAxWnDyUHbDoKC
         2lnS27T5ZN0MQoErq+CJoq1DoF+iD9iNxob8In8Hxr/VwY1ZZuCKpGI9w8G8MR078Hz9
         U+WNGQC/Jw4GLP5u89ugSpQnOtvZ8x5jvThjRsQZyrm/eAgKmq2YbBcALXf2eE3CsIzZ
         BTdw==
X-Gm-Message-State: AOJu0Yy95Cn6WcyUa7vV3EEIWDRTqgVFj7opVwSlnRv00kzZKj2NgeKv
	UfbTEyXWVdIRKihobs8ITqrNhbUcrd7h
X-Google-Smtp-Source: AGHT+IHqTVBPPBy1nnc9v9CsEZ1sLQ9MmsPf9wdh1h3p4vMStNoNJB7mi0VwNIpWSn+rgmAmPSUo8Q==
X-Received: by 2002:a05:651c:1025:b0:2cc:eae4:b3f6 with SMTP id w5-20020a05651c102500b002cceae4b3f6mr428711ljm.44.1704880815610;
        Wed, 10 Jan 2024 02:00:15 -0800 (PST)
Message-ID: <2b3063ec-adad-45fc-908e-8c8680efb2ed@suse.com>
Date: Wed, 10 Jan 2024 11:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 07/15] rangeset: add rangeset_purge() function
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-8-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240109215145.430207-8-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 22:51, Stewart Hildebrand wrote:
> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> 
> This function can be used when user wants to remove all rangeset
> entries but do not want to destroy rangeset itself.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



