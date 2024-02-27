Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9728691B1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:24:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686165.1067818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexR8-00011K-LQ; Tue, 27 Feb 2024 13:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686165.1067818; Tue, 27 Feb 2024 13:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexR8-0000yZ-IY; Tue, 27 Feb 2024 13:23:58 +0000
Received: by outflank-mailman (input) for mailman id 686165;
 Tue, 27 Feb 2024 13:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rexR7-0000yG-Fs
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:23:57 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7566d18a-d573-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 14:23:56 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so790477066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 05:23:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a21-20020a170906191500b00a413d1eda1bsm764840eje.49.2024.02.27.05.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 05:23:55 -0800 (PST)
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
X-Inumbo-ID: 7566d18a-d573-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709040236; x=1709645036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRT+YB1dAgC5Diu8qeFxjOe6cGLNCgY1w7oc1ceuW84=;
        b=W3FUAY7ZHXFbcVfwDwtR3IeNrHYOpVpN4CLbbBhLjU2dH+wm+5KI0kbLrFsJiM9kPO
         eitW/RElpWXqCY6YCYYQDlm029rlR9xreKLKXk+2VhxPdNdCT+L5JtFDlmAupt56xeL3
         LySIQmcS/OSKzBYJhi7qYNfBYpexCMj+wdebJdJpTL+7iP9E7IQ5zrdB/eNtcFARBnqE
         hW5/7LWcqcgjr34KxbDO5LSnzvPtZjDoztEt8v1ZYaYk5GRic+d8tLTE10lfOnSoEbj9
         /TEIcZ8IYOzZRoXt+c1M/hAD0Msk9MS3zfHe4yYB5p7WjLVko7WRstqqDNoVr0vlbQCL
         TdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709040236; x=1709645036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRT+YB1dAgC5Diu8qeFxjOe6cGLNCgY1w7oc1ceuW84=;
        b=KRepukMtdGJFgW+V+Wrmu2X0r4IghTmSO6T1OoMqFXcxBB4BEolkU1MoBKLo/ykWvD
         U5HwpEjro/Eq3OkZjKtW0l0F41X6paQuhS80/1W3/VzpD4VdQU8wY/CiRTTnyzA3GvJe
         Ry9h+QLw496ad0lxejQHzvIu0CLDFnlcSHTH2TocZOAmlxJdK/jXo+ICgMt37akIhi/o
         2Y4pmRvBwO3y+i/icgUaoC98fK5TKZCWNh8zvE/aVwNRDZKZeIFswvvuUaxGWMeOmgwU
         smIVca03T3sobjDnjFCLoGEpxi/o0jh2MQDjIb83stqE1Gx47N73LtsWNkDJSmlTed2e
         e0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbIIFTf4RiO0BPcG1jXxDWjTdTAttd2ksSmMXZdXPS/TPwGOo0PzCFuf2y77RCxNMYbirjt9QEHy5lt4FQvaUq3rxiiYGxjVOlWcPPHmk=
X-Gm-Message-State: AOJu0Yx44RCVR8hnYR/Ddccl57P+73hi4Ic4c5Pr70coA09dyYcix8C6
	F3Yz2fGpymNClaly5ZKNy0vuLA+5SyuGOlkSaFoXq0D1qCUyAGW9iX8Ivfyrhw==
X-Google-Smtp-Source: AGHT+IFocQw1h4E6mhak6vG9tpYvmwnht6yfbGkoFpEktBxn4s/YEVlTlHL+3YoFK8NTGZMq7EBQDQ==
X-Received: by 2002:a17:906:52cd:b0:a3f:c32:7b0c with SMTP id w13-20020a17090652cd00b00a3f0c327b0cmr9382909ejn.22.1709040235951;
        Tue, 27 Feb 2024 05:23:55 -0800 (PST)
Message-ID: <04a8bc24-0cb9-4eb9-9d68-e1e1defaaba4@suse.com>
Date: Tue, 27 Feb 2024 14:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/spec: do not print thunk option selection if
 not built-in
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-5-roger.pau@citrix.com>
 <30e1bfea-d76b-4e3d-b148-f25d1c811f8d@suse.com> <Zd3Fl6nx-R4aq2wR@macbook>
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
In-Reply-To: <Zd3Fl6nx-R4aq2wR@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.02.2024 12:20, Roger Pau Monné wrote:
> On Mon, Feb 26, 2024 at 01:54:54PM +0100, Jan Beulich wrote:
>> On 26.02.2024 12:07, Roger Pau Monne wrote:
>>> Now that the thunk built-in enable is printed as part of the "Compiled-in
>>> support:" line, avoid printing anything in "Xen settings:" if the thunk is
>>> disabled at build time.
>>
>> Why "Now that ..."? It's other logging the earlier patch adds there.
> 
> 'Now that ...'  would refer to patch 1/4.

But that's why I'm asking: Patch 1 does not add any printing for thunk
usage; it extends that and shadow-paging's printing by the three
hardening ones. But anyway ...

>>> Note the BTI-Thunk option printing is also adjusted to print a colon in the
>>> same way the other options on the line do.
>>>
>>> Requested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> With either a clarification of what's meant or e.g. s/Now that/Since/
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> 'Since' is likely more appropriate.

... I'll switch to this then.

Jan

