Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67D867995
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 16:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685604.1066590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reccW-0006Pq-Jh; Mon, 26 Feb 2024 15:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685604.1066590; Mon, 26 Feb 2024 15:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reccW-0006NH-Go; Mon, 26 Feb 2024 15:10:20 +0000
Received: by outflank-mailman (input) for mailman id 685604;
 Mon, 26 Feb 2024 15:10:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reccV-0006NB-L8
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 15:10:19 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 260aa71b-d4b9-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 16:10:16 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512f54c81d2so1667876e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 07:10:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm2027637ejc.197.2024.02.26.07.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 07:10:16 -0800 (PST)
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
X-Inumbo-ID: 260aa71b-d4b9-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708960216; x=1709565016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tIbkpeNLAozugUEmgofrslaIe2aW51Xk6gGsC1waq4=;
        b=EBlxBlghvPN38b4dxtcpqYcFLLAu5DpQGXeK4PZSQt5ONcv3olrkDLHHiUdvjIPhOE
         G5zOowU8z7uNS5NKhy5Iic14NfLUpDfzBvLYJS7tWZCPf6Wbg7VaCmpKMvWP9Yv77T6U
         m4AspVvgz6XPa3WGZ2NL/mzAvE4qUXQKK6W06rpXuuxEW4vQ/EpVOgIC2Ho0h6u8njJY
         HEb3eutbBxlMVDSEuTuz0M/fbJBalINzN4Iwv4BDrj8OLYwyp6ipOL0cW+eWKQl69tWK
         fW3IpVim6GEPMlKcDdy2AC8inv1ikjTWqOBWDUjh/IJ17iDWrvfML4C3yFHqYFs91/Eb
         qWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708960216; x=1709565016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tIbkpeNLAozugUEmgofrslaIe2aW51Xk6gGsC1waq4=;
        b=tyY5K2yG7HZwTzGpfHz10PsFfJpfWUBztFAhfPtDuYvxVndT2FS+OcApTesRtN+SQc
         QOxHC+Xjp3wFcbN/f3aM10cQs3t5CTNwvTTOaVxxZbqqaL7vEwcVd5/NkLRlzuZvGYxa
         IwMWubfGl9oa3XaYlUQi3ygNfJxL78cTDVryqboM0nIpisicFNs0roEFEuZpUiyivOyi
         YrXuH3mShLk7zRQB3+Amd/nESPgnSG3W0PLpiKBKJhQlfz0jCu3S7WITEXrnn1nPtA3g
         zR2EAd0duk0U8W0bica63OoxKAcNw5HoXJSAGbPKnD83xrU2Lq1VhauRl7qLrUtQxzBi
         U+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIrx7wJ8jq4HYvSGEaW6Hd92yWUdutTRTw8eSCgNGuuNjs6JrKviUZ/r8aE2jorzqfVzczh+ysA7XRwAN0LllHKbpozaYz+b9bubZEyUs=
X-Gm-Message-State: AOJu0Yw2G2aKcoNhH7hPDhzD1UhzDdbr/u6clsAKz3HIc3Q2kpOfNCu+
	rejR5sU+imX9cje5BYZy6SFuZVcxrUgODwMY8vN9ozhBXHIHW9qUexUnHEc5rA==
X-Google-Smtp-Source: AGHT+IE1qjn6qMl56PMhj+xQ/Y4Us0rvHI3X4iHVV2yuGB85Sa9OZtm+uCYZjZnNXSS65QQfd6REcg==
X-Received: by 2002:a05:6512:3da8:b0:512:f5b9:2e23 with SMTP id k40-20020a0565123da800b00512f5b92e23mr4368043lfv.11.1708960216359;
        Mon, 26 Feb 2024 07:10:16 -0800 (PST)
Message-ID: <38edbe43-307a-4f70-a099-d31e155df076@suse.com>
Date: Mon, 26 Feb 2024 16:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation: Rework "build-each-commit-gcc" test
Content-Language: en-US
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240220140733.40980-1-anthony.perard@citrix.com>
 <e48c4fce-e7f3-4bce-bf7b-2cfcc0659426@suse.com>
 <d2cef00e-019d-44d6-9c12-a628455aea88@perard>
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
In-Reply-To: <d2cef00e-019d-44d6-9c12-a628455aea88@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 15:49, Anthony PERARD wrote:
> On Mon, Feb 26, 2024 at 10:23:37AM +0100, Jan Beulich wrote:
>> On 20.02.2024 15:07, Anthony PERARD wrote:
>>> --- a/automation/scripts/build-test.sh
>>> +++ b/automation/scripts/build-test.sh
>>> @@ -9,6 +9,37 @@
>>>  # Set NON_SYMBOLIC_REF=1 if you want to use this script in detached HEAD state.
>>>  # This is currently used by automated test system.
>>>  
>>> +# Colors with ANSI escape sequences
>>> +txt_info='[32m'
>>> +txt_err='[31m'
>>> +txt_clr='[0m'
>>> +
>>> +# $GITLAB_CI should be "true" or "false".
>>> +if [ "$GITLAB_CI" != true ]; then
>>> +    GITLAB_CI=false
>>> +fi
>>> +
>>> +gitlab_log_section() {
>>> +    if $GITLAB_CI; then
>>> +        echo -n "[0Ksection_$1:$(date +%s):$2
>>> [0K"
>>
>> ... there was either corruption on transmit here, or there's an embedded
>> newline that I don't know how to deal with.
> 
> No corruption here, there is a \r in this string. There's also \e a few
> times. Most tools can deal with these characters just fine, so I didn't
> even think there could be an issue.

Okay, in an entirely different 2nd attempt I got it committed fine (I
hope). It's probably too old fashioned of me / my scripts that I
demand for every patch to pass a "patch --dry-run" first.

Jan

> If that byte is really an issue, I could rewrite the patch to use
> printf, and I think it would read as:
> 
>         printf "\e[0Ksection_$1:$(date +%s):$2\r\e[0K"
> 
> Thanks,
> 


