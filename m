Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC0824EE1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661977.1031835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeCS-0000Dz-8n; Fri, 05 Jan 2024 07:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661977.1031835; Fri, 05 Jan 2024 07:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeCS-0000Ac-5Q; Fri, 05 Jan 2024 07:01:00 +0000
Received: by outflank-mailman (input) for mailman id 661977;
 Fri, 05 Jan 2024 07:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nS5B=IP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLeCR-0000AW-D4
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:00:59 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cfc3099-ab98-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 08:00:57 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-552d39ac3ccso525751a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 23:00:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cl5-20020a0566383d0500b0046de4c01195sm267327jab.179.2024.01.04.23.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 23:00:56 -0800 (PST)
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
X-Inumbo-ID: 2cfc3099-ab98-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704438057; x=1705042857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gVWhwcB9ghzenISWXKk5PUJ6rB1ZcqGlp/oVxWG+AP0=;
        b=bkjWhHSL/swl8aWsD/+L3NgFjCes6nezrPSdcVLWojtel9EHAax+RL3sLItORVjfD+
         mvUSu1D+65F1oZ/A142wOjWHJWDsLuoutj/hVgI+7H7NrDw+SRuCc1kyHqALvA5xypOo
         zQVz6CsTIxVFUrp47SUvjyMAG4n7aqlSxu3wCICLgFt/CB4lOpL2w5b1dvS+HatDHUX7
         HVz7JDiFn2kCJkvQj6R8USXbGGaSFvsxVyQi0VjNJPj0jDzsfr3TRGhdP4wRlIBi1w3z
         dHY5c2PMfQiW9zLNnHtPxw1bnRXp0JfwLtQ1U3HvMcgPzg+J8rdYoRYJS7o5IV8jNqJk
         IZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704438057; x=1705042857;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVWhwcB9ghzenISWXKk5PUJ6rB1ZcqGlp/oVxWG+AP0=;
        b=cv5TW5B/hKyreN0QiVe4YqVBKutx8mvr+8zTNsRHOjZde/HkQQ/HhUn4gsg3Qjgcym
         7tLRByzTrme58rHvfzyoKXPp6ya7PG++5iwRgcFlUOffRCv+hSpf1j+EXVYkKHnmPwuv
         M/QX9QxEh1JGGk02Yj3DQJjwR0bFyJvW7x4i2xi8T22r51PLJKCXLc1io7U+n8JjR0Qn
         mfgFYRXxvXzjyinWAxZslYaqPwIpKNwWcWQ+u0hFAiCyY/t5th9S4AdVsEVmDHEzCVOa
         biNinK2aP9QIZrDVtoYZOYe4Tdllgwci/7IMehBsabW5dTyii5hHesE74YZuUZ7oyE28
         Rv/Q==
X-Gm-Message-State: AOJu0YxaI/q6ISjKQ08iBFJV7f8VLW+K8rcW5hv0RsffyiQDjSX2U0wP
	oZnARQTOpSsQqgeX52lq3nSvyDcGy+Z4
X-Google-Smtp-Source: AGHT+IEe3d0kmNK9utXaa0cQegYBOGJ9vig+BW047X7Cxik1DIZYqBe1hQXJ4vvzRWPrb+npH4FDMw==
X-Received: by 2002:a17:907:b9cc:b0:a28:bc4f:16ff with SMTP id xa12-20020a170907b9cc00b00a28bc4f16ffmr1627600ejc.28.1704438056964;
        Thu, 04 Jan 2024 23:00:56 -0800 (PST)
Message-ID: <4835dfad-cf7e-42a9-825d-f436eb84e0d6@suse.com>
Date: Fri, 5 Jan 2024 08:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
 <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com>
 <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com>
 <5fd69614-a236-4a5b-8ec1-8cfea6d28d32@suse.com>
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
In-Reply-To: <5fd69614-a236-4a5b-8ec1-8cfea6d28d32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2024 16:33, Jan Beulich wrote:
> On 04.01.2024 15:33, Andrew Cooper wrote:
>> On 04/01/2024 1:41 pm, Jan Beulich wrote:
>>> Furthermore this initialize-to-self is a well known pattern to suppress the
>>> -Wuninitialized induced warnings, originally used by Linux'es
>>> uninitialized_var().
>>
>> I'm glad you cited this, because it proves my point.
>>
>> Notice how it was purged from Linux slowly over the course of 8 years
>> because it had been shown to create real bugs, by hiding real uses of
>> uninitialised variables.
> 
> I'm fully aware of this. The construct was used wrongly in too many cases.
> Still I recall times where I was actively asked to use the construct.

And, btw: The construct was (meant to be) used in particular for suppressing
false-positive -Wuninitialized warnings on, in particular, older gcc. Which
means that by enabling this option we may also subsequently need to deal with
fallout. I'm not convinced we want to uniformly do so by adding "normal"
initializers wherever (not really) needed.

Jan

