Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF98056A6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647911.1011652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVxy-0002Mv-Kb; Tue, 05 Dec 2023 14:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647911.1011652; Tue, 05 Dec 2023 14:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVxy-0002Jg-HT; Tue, 05 Dec 2023 14:00:02 +0000
Received: by outflank-mailman (input) for mailman id 647911;
 Tue, 05 Dec 2023 14:00:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAVxw-0001wF-Ir
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:00:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 934ee92e-9376-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 14:59:58 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40bd5eaa66eso38944425e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:59:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk14-20020a05600c0cce00b0040b2a52ecaasm22784362wmb.2.2023.12.05.05.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:59:57 -0800 (PST)
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
X-Inumbo-ID: 934ee92e-9376-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701784798; x=1702389598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yshCHNldBlAnFm1ij+X3Ur7gze1BanWPgtNuhU6jShE=;
        b=dAMSxuU4Js04S1lo4l+4xsxx6MZiyB2XB1BwQxi9Xbp60AqWMGMxPGpQr8CBwyP+dV
         0Qdqzr1p3sETV0+VzD/9L/OXJgaKlDp8owsEbCT/8CAeLGSQ2cRnL9jpKn08N1nwVV58
         B/eTeEHR4/qC0ZB3IZtzN3Gg15rRY3tSJwsXpKRFiRhVVMQ+NvduUghAj6g5kWeieKvb
         BmTqQyXOQ31Hmz5K4FXXmTnprMoWu/RZM4Rk4KV1YIxi6/l+Hsz0bSuwyNUIID69quud
         MenvVpdKhqr5GVyS4n7dT3bik2aHom13XSisG2B6UUrw2Z++K2W6N9qyQbXFw/Xetq2D
         HQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784798; x=1702389598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yshCHNldBlAnFm1ij+X3Ur7gze1BanWPgtNuhU6jShE=;
        b=NGLmx4AlZQufSvyrjfETcRky5IUzPA9jmAhzFdR88/tcWDKR3vZ3depO23MVoH9GsH
         g6cGVnko19gq5iuNHBudLSA8+gzmwjiGHt7nZalBGhfHQvfnXlz1SfRk0Bh/ZN4mTueR
         h2HvABwS3nhenIB0uijhhf6kDuwvFjSIex6Y+S/NFIF48czHBv555e8/OgjYzeIEyaiS
         yiJqaXftu9cceMnzt1CP9r/aajh9woeoSQB6Zmnv5Xztt98/p/SNSlIYuyuFPsf9O3N7
         qJMxZp86OhPQtMOrdZPaTkCaVRWFSKssVZrW4Eqcvg6mLRGaJ/f9tloS5HUB4jiE2+OU
         T95g==
X-Gm-Message-State: AOJu0YxPu9lK/ugeoa0vbgcVxYdNVcVtmusQP7vnRYaZNQjqjsRu/8Ip
	luVjUKSTUFheVREFdZVSxuQS2mYTN/+qT5+BQnJi
X-Google-Smtp-Source: AGHT+IED4j8777n1Anxf6EgyulW8VJlL9uT2hNdonM67Q3ZwxMTMTfQwDBYt0ReJcMTnoxPnvgIEOA==
X-Received: by 2002:a05:600c:4f8f:b0:40b:5e21:ec34 with SMTP id n15-20020a05600c4f8f00b0040b5e21ec34mr517528wmq.102.1701784797857;
        Tue, 05 Dec 2023 05:59:57 -0800 (PST)
Message-ID: <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
Date: Tue, 5 Dec 2023 14:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
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
In-Reply-To: <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 14:46, Julien Grall wrote:
> On 05/12/2023 13:41, Juergen Gross wrote:
>> On 05.12.23 14:31, Julien Grall wrote:
>>> Anyway, given you don't seem to have a use-case yet, I would simply to 
>>> consider to surround the declaration with an a config which can be 
>>> selected if unaligned access is supported.
>>
>> Like in xen/common/lzo.c et al?
> 
> Just to clarify, I am suggesting to add in unaligned.h:
> 
> #ifdef CONFIG_HAS_UNALIGNED_ACCESS
> 
> your definitions
> 
> #endif

But that would be wrong: HAS_UNALIGNED_ACCESS would be there to indicate
one does _not_ need any special accessors.

Jan

