Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31658951F40
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777516.1187652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGOO-0002d2-Q4; Wed, 14 Aug 2024 15:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777516.1187652; Wed, 14 Aug 2024 15:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seGOO-0002aA-NJ; Wed, 14 Aug 2024 15:58:32 +0000
Received: by outflank-mailman (input) for mailman id 777516;
 Wed, 14 Aug 2024 15:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seGOO-0002a4-0M
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:58:32 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c97dd7a-5a56-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 17:58:29 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so106194a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:58:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f4184ec9sm187785466b.219.2024.08.14.08.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 08:58:28 -0700 (PDT)
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
X-Inumbo-ID: 0c97dd7a-5a56-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723651109; x=1724255909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HgLhLx0ki4Prcn8cg+ZnAMezOZadSVby5sGVEOp17Qo=;
        b=eBTfqJa9TOwLTjLOv92wcx8yApM6C+g6fP45+aERmtc/9glrLJesz40ljWNdUkcnXb
         frYwjOtXo70P+zrGfZK5xsuSKJnPlYVxNoFA8qKkqwNrYo9Q6urwWPhrCY8I8v+nFQdp
         4vCW9HtXB0T8BvJr2HKw7wjWKDliF+9M0yb876eV2Zesnem92sGQl1gs7dhi79T2AWxh
         AzmgrLjOnzl3gifX4SdPmTCVcaf4jmjc82IgxsPFJVktlVUO6xOrVJi7qpQ1P27yAXbn
         scVv/1ft1fhi3Az6K35Xd3Ca9ZSJkRVsgd9rnJinCfC1ss8PrKwzeUXrPfqNEXxnraRN
         pX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651109; x=1724255909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgLhLx0ki4Prcn8cg+ZnAMezOZadSVby5sGVEOp17Qo=;
        b=HLMd9cX7j2Mdn1tGHCco4HfjRqpgbfyldag4jIS7hI4Hy7hVate1Uk8xJUJlEyOhBl
         +NrohxcoiYrEL02yCx8gzgP06DPL3Vr1RYzeEE+of0axBhw9zJ4XqHGq6D8dP3opHre7
         Cb5P7bkXTg7MZ8BjSV2Dd+SasGYT8dBk2xFyMawimvy41NAnZiQp0PRQBhXLXfgI8NUu
         PPVSJbEQg7aJ6HqaoI7fOBHr2H3A3ZUdyYDb3WQiE+iQEWUNMYpLLLZgHW+rL8dig8i5
         js7TEUgO9KdPwQlOnNhJ0AwoA8oOftazKBDqHAg0YIeE/38tn+uu7lBgH26Cl9oepDeB
         d2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWoe7ZVyP9D0zNivvSp2UmhfCK1KG0cFBIEYmQHpLfohF9m8lndhYlYo01ezm25E9lOuOC7x1KLbtlWjvAX9Cm0bXEsjVbKlwxPIok70Mc=
X-Gm-Message-State: AOJu0Yz0QDKeDBDUu42LnZPzpxV5ALwtksMqNuBj4GkIy0BZTykkMGs6
	wEAbvSTpindwkF1+bGcYanjxpegoj3OmHQdsaJAG8WP0wjc3P41nGonQMPT0lg==
X-Google-Smtp-Source: AGHT+IGyHXwPNydQfyoM/ym/picSbK18+Z+SyvrNMQRDIxoROY7xifgr8jmHnB/YSfjJgduV0coZxw==
X-Received: by 2002:a17:906:dc93:b0:a80:d683:4d23 with SMTP id a640c23a62f3a-a8367070e5cmr224765866b.62.1723651109093;
        Wed, 14 Aug 2024 08:58:29 -0700 (PDT)
Message-ID: <d2a71d20-d3c5-45cc-9e3e-10a0773508a0@suse.com>
Date: Wed, 14 Aug 2024 17:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
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
In-Reply-To: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 17:52, Matthew Barnes wrote:
> Upon running `xen-cpuid -d` on a host machine with Sapphire Rapids
> within Dom0, there exist unrecognised features.

Without looking at the particular bits yet, just a question up front:
Why SPR? There's newer hardware available with presumably yet more newly
used bits. If the goal is to cover everything that's known, this is only
one step in the right direction. Which would be okay if expressed that
way, ideally with a plan to subsequently go further.

Jan

