Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4367DB2631A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081486.1441565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVSt-0006JY-KY; Thu, 14 Aug 2025 10:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081486.1441565; Thu, 14 Aug 2025 10:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVSt-0006HU-Hu; Thu, 14 Aug 2025 10:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1081486;
 Thu, 14 Aug 2025 10:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umVSr-0006HO-RC
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:45:45 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3a9c936-78fb-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 12:45:43 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb7abfc5cso136022366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 03:45:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af99518bfacsm1601378466b.72.2025.08.14.03.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 03:45:42 -0700 (PDT)
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
X-Inumbo-ID: d3a9c936-78fb-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755168343; x=1755773143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4X7YZaUO/HkiX2tspA2ymlBcX2E4W2Q1pFBZD3QqNns=;
        b=Oc3m7ieAgK6GqukrQSij31qRYQ9Y4IxzdGNvaddLhNodwwXqkklyeJ7diNh8vyAK5o
         TcNPxoWCdDkk3NvmRgriFmVw2syeCPTOOV2smTyNW8VELR0s0gb6E3v0UVZUG57h6Rym
         Rn8TFWm94HQK0weZ1ZhgJZolfNrYVC+LWa/RC6FLfyOx4+E7PkZZWgZCFkEnJuNgS0pK
         A+ocglHvWMSugjW6cqd+79QxMtvHU9tX3fPDNXL0xhHICytNAhbZ6uzp7Wm5XGW1MQF+
         DLlvadE/b4QBvFZQQXLtce8FDR2OFzfk01X4+EUG4wcqZlJ80P6lp58HLxCEHxYvyr/K
         NX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168343; x=1755773143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X7YZaUO/HkiX2tspA2ymlBcX2E4W2Q1pFBZD3QqNns=;
        b=pvjHU2cFwMCFyrZIn5ORGaUVOqKqdQLf+dp4zw/KWRzVbTcKlpHUuBxxa0Nd8Hk0fL
         IOzh/d0XEfVmilzIW3R902KaFR2FxzsVFqLFiv4OrUbSFjluHdk2hhhXhTu8cWe9d6zz
         OTnyRnxdiRK9/Rx3w9X4w8sWMLO+Iu+DxrgzpX5t+vJcUwatbll1EwOjYSZPGAsEgLkQ
         ohUuMeraiH3TkP9Tt/ZKZgR5Lg5QbUfObQT/k7J7irvht4OYYt8D6/6bP2oPjnxWJeZh
         4yUZ7MVv2LmCqyFBpr7HdZSd5Ijkl/y4SaaZkeUZpmD946De/nXVBQxSnZNXVbExloQf
         69lw==
X-Forwarded-Encrypted: i=1; AJvYcCXBOY+rTKJwvXAnOXl4PMgclw0nYw3vv+PaUXT4IcWihO+2w06dBNkUDjcAnecXYY5lfDIpwYq+TVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2a5ND6S6iCsUbR6Qpg905Z5+Ewhm+gTKzwApo79o4L1Sp8llZ
	HG2eIea4LhSNrgyrF+ySx2H20qIuld5Eqnah2aBKBj0VsMyPqZ7evlFed5B0gQp5Dg==
X-Gm-Gg: ASbGncsmJvdHO16vZTpUv14XVXTYUjrWMsx5nxViqLNT+As/+i5TqJynJiHc36bXvyA
	HBm5EiFpvlvZRReRQRpcl/cO+uB762E2pm678sBEEtR4l4aq4Z4XVKRq8kZz1fneg+qR0XKklHl
	G0ZPHN0TSvGYmvuTloWzVBPPZoLZGWMcZqHw/7dApPGEGVlmRl6Ux9o17o1fJqV6DKXW1fpH51z
	yAeJxQ4b8C+zB5+Nv55SeJ5ZrKHmvmSS0OgNrsYITTktLF5yhj9l3GJ3QbJjn6eGltpdoaf4Xsg
	nl4DdSxVMvIlYV8ZAdlWSgRtSIYOTajhVEtQ6X5A+IpEM5q9W+VvQ33dSzUZLuVx+cSeOycAo2H
	t1x19TNiLiq01Cu4eom8M9EMEJyBjGmG+2B2i167yAStobpRQdLrWauK8lVOZxDvpzHAKZoarWB
	af5Ik6ufI=
X-Google-Smtp-Source: AGHT+IEnbgOkWPxvR9bNoRyd+T+v493eyVNNvacR6UTZcdbp797BddeeMwb4iL74cpEeWjziKppQ0Q==
X-Received: by 2002:a17:906:9f85:b0:af9:5260:9ed3 with SMTP id a640c23a62f3a-afcb9799755mr223949166b.14.1755168342642;
        Thu, 14 Aug 2025 03:45:42 -0700 (PDT)
Message-ID: <3fbdd1fc-e739-42cf-892b-a561910a5693@suse.com>
Date: Thu, 14 Aug 2025 12:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250813125538.78174-1-roger.pau@citrix.com>
 <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
 <aJ26UmemwxyyTioE@macbook.local>
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
In-Reply-To: <aJ26UmemwxyyTioE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 12:28, Roger Pau Monné wrote:
> On Thu, Aug 14, 2025 at 09:18:45AM +0200, Jan Beulich wrote:
>> On 13.08.2025 14:55, Roger Pau Monne wrote:
>>> --- a/xen/common/pdx.c
>>> +++ b/xen/common/pdx.c
>>> @@ -288,7 +288,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
>>>  
>>>      pfn_pdx_hole_shift  = hole_shift;
>>>      pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
>>> -    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
>>> +    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;
>>
>> Given
>>
>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>
>> this shouldn't be needed, except maybe for Arm32. There, however, ...
>>
>>>      pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
>>
>> ... this and the shift immediately ahead would also be a problem afaict,
>> which makes me conclude this isn't what Coverity has looked at. I expect
>> the problem is with the toolstack side definition of PAGE_SIZE, which imo
>> would rather be addressed there. (And yes, I'm pretty averse to arbitrary
>> casts like this being introduced.)
> 
> As I've realized while looking at this, wouldn't ma_va_bottom_mask
> also better be of type paddr_t, since it's not operating on pfns, but
> physical addresses.  I didn't adjust the type of ma_va_bottom_mask,
> but I would be happy to do it if you agree.

No, as its name says it's also used on virtual addresses (really: offsets
into the direct map). It hence would better not have any bits set outside
of the range that VAs can cover. With that, imo the cast (if any) also
should have been to unsigned long, not paddr_t. Yet as said, im the cast
would better not be there in the first place. Just that meanwhile I've
learned that this was committed already.

Jan

