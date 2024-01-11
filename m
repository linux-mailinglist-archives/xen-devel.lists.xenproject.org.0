Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7BF82ABC0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666113.1036575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs7G-0001pn-M0; Thu, 11 Jan 2024 10:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666113.1036575; Thu, 11 Jan 2024 10:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs7G-0001o2-JL; Thu, 11 Jan 2024 10:16:50 +0000
Received: by outflank-mailman (input) for mailman id 666113;
 Thu, 11 Jan 2024 10:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNs7F-0001nw-P0
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:16:49 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8788a0db-b06a-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 11:16:48 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e60e13762so2764675e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 02:16:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b0040e54f15d3dsm5184782wms.31.2024.01.11.02.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 02:16:47 -0800 (PST)
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
X-Inumbo-ID: 8788a0db-b06a-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704968208; x=1705573008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tinWbhY1oAJ5POkapwj+NY5JxGwLGaeX9VcKGfPSrkw=;
        b=FEKktgVW2lSsJj4FT0vE/A0c2MfXaJkvtgU8dfAiA93G4dPDBr6Yhomlfk0i+uNx8u
         tFJfylJUnlfnu7GEA+4sZ7Jz8HZy1Pn5MvGUx9IW+Zjl2hstoSw8cyU/gjIHnPwLbMAn
         6bNJgIC/HoMPN2ruBxvunnlF1sXt3E2wVHCmf75uwhXi4+8kxpKcJb8AkyAGZ3fKEyM5
         LTCSaxtuhChDjYmadpAe2qXMrJ90H3Bbz62iOVqpVDHruB9jXm89M8gAZs4CaR/MyboX
         3f0EiglSHk1eexQCItPvOaxXD+iXsdBHw3meGG8aaGQlewYQCm4DDq8czFEezUo//e21
         zXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704968208; x=1705573008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tinWbhY1oAJ5POkapwj+NY5JxGwLGaeX9VcKGfPSrkw=;
        b=FfC4SapWO7yMRh33Xa5Be6YoYlc7HM4yk7/cJt9SgdkUeWveaVxK8gh3q54oXtlIEp
         bwe/wEIwX93uLGwXvraB021A9szX0o98exyN7J4VImXDMgC69Yts5gcd/U/yWug92xw7
         yPFPhQoQKemuZjFPQ0L4KgbMlOOnmtyEng4mAyApy1c/G9TSHdbZQhHBzzF0rtTT9Dir
         HYWPPoja6EHvFSQxw17EmiIP2sYV3LtabDv8626XHNeeTxcrPGwbe1CmpWrpU8QmCQHB
         hyy3TLu6AzWGPnInFOIJCl5SoSJfP3wxWgyQEHIA7VxzAfcTBfhLlKG6oVHee4DZcYX3
         D/Fw==
X-Gm-Message-State: AOJu0YyWFB+Byf4p2eI0QT/d7FwFhIBQR0sKqsvNBKBXSGxmMKy6Ln7R
	c0czMcNKUYbEZZSJeA+Yh/ww90ig7xZr
X-Google-Smtp-Source: AGHT+IGa5dZulY+98rKGmiLUdRAnZIPyWTzrJvX/7oVrgAr/nGWa+OFqeaUjNDZf7h2xTzGJ4oyOqQ==
X-Received: by 2002:a05:600c:4e89:b0:40d:55c6:b80a with SMTP id f9-20020a05600c4e8900b0040d55c6b80amr126378wmq.203.1704968207847;
        Thu, 11 Jan 2024 02:16:47 -0800 (PST)
Message-ID: <c2140315-af7c-4f39-a8c9-3d2d8b42cd92@suse.com>
Date: Thu, 11 Jan 2024 11:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-2-carlo.nonato@minervasys.tech>
 <feb5542a-081a-4677-b569-5d4218eb794d@suse.com>
 <CAG+AhRWkasky8hrNBrtXsmmnmsJjf+-Nj3Nr7Nu4LfXvFYvwvQ@mail.gmail.com>
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
In-Reply-To: <CAG+AhRWkasky8hrNBrtXsmmnmsJjf+-Nj3Nr7Nu4LfXvFYvwvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 11:10, Carlo Nonato wrote:
> On Mon, Jan 8, 2024 at 5:53 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 02.01.2024 10:51, Carlo Nonato wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -626,6 +626,11 @@ struct domain
>>>
>>>      /* Holding CDF_* constant. Internal flags for domain creation. */
>>>      unsigned int cdf;
>>> +
>>> +#ifdef CONFIG_LLC_COLORING
>>> +    unsigned int *llc_colors;
>>
>> Can the color values change over the lifetime of a domain? If not,
>> it may be prudent to have this be pointer-to-const.
> 
> Can I free a pointer-to-const array?

Well, you certainly can by using a cast. Avoiding the need for such call-
site casts is why I've been advocating to make xfree() / vfree() match e.g.
vunmap() / _vfree() in this regard. Yet other opinions are that the const
there ought to be dropped (without me really following the reasoning) ...

There's also the option of circumventing the need for a cast by doing

    xfree(__va(__pa(ptr)));

Jan

