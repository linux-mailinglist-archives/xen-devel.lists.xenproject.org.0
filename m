Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC3973CFA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 18:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795854.1205322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3PA-0005Xi-P9; Tue, 10 Sep 2024 16:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795854.1205322; Tue, 10 Sep 2024 16:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3PA-0005VH-MG; Tue, 10 Sep 2024 16:07:48 +0000
Received: by outflank-mailman (input) for mailman id 795854;
 Tue, 10 Sep 2024 16:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so3P9-0005Si-17
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 16:07:47 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0956331-6f8e-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 18:07:44 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso6137266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 09:07:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25833887sm500086566b.28.2024.09.10.09.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 09:07:44 -0700 (PDT)
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
X-Inumbo-ID: d0956331-6f8e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725984464; x=1726589264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g7BYAp8MOSMknDfcSbyWihelzdOQsbObYJOH5CgOKac=;
        b=aOsQ38YT7z2n0gbOeGYPJdyD8hMK0C/1lgu0wLoUdDjwfXGPzKZYcPeJSF8mcL6uwR
         gUX3CIAMP3j41QrCDLE0GlXdCnSL+ixDWKIl6UDxTK0ZFJxqUdlZZo5pCr8Tg43TEdGX
         rWegv54fX1OfhrmLnEL/xC0/sM8nHIVX+SIvJ+5CR/BjnghmQwdiQG1Eqy17U8YRTuDh
         vpCOxa+8wB4Sjdll595/8jCMcy47y6tdpBWbjJyNjZ37KrkmnVnaiqoz4cc1z1eBEU16
         ZacqLCPaUNUAO4awG+LJs14XbuAaCwIO+STqNF1NXSXAzZfoZ4GouY6GVRAHzAtr6v4G
         mp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725984464; x=1726589264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7BYAp8MOSMknDfcSbyWihelzdOQsbObYJOH5CgOKac=;
        b=GciqITV7gHcljf5gn5yDG/1yQbjcZG7m/z783PTxafLfjpd4btbZz2Gms/42itM5F1
         iLvi2MqbDJSgHRLF9YRHjwh1uEF4BO9lUJe12rmJz7OfJiJhGDzb7Yem3vNlDj0WhNO/
         hcfBWvqdzShT5RYAqcky+cN41OIJVhPeOlknHn+z+CTL980/cUqCHuAWZENbvoxu7lCk
         EzRetAEzQDYqgYd4NPWKoxjlXsxiVRHdWeWJTt7pT47a4SkQw5OQOgtgKYJVHUk/56bo
         TWUXnXim5g8ZXotdGZQGsBdXzWiDJS/mBTRS2/EVDnCVAT68g6CbaeR34RDw4SQk4iuf
         yOew==
X-Forwarded-Encrypted: i=1; AJvYcCXShF+aF45TuYQ60aoyYl8ZSgvCJmTGmvPLZ7ra5abHiWHmzuUB+R8SIgoW7025lES8+d5HBRi118A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmFvdSKSGlSq6zBwe1Mnqtgb4WQHFlRpzkOhRTDcYMBNg/wOgk
	XU86NmwZzeBcqHEJg8CQZdFA12EO7HUWXThO0Hj4MGQSSyLkAQ3Ywz9sD/BmOQ==
X-Google-Smtp-Source: AGHT+IH3nmv7BBJeMHmTSYKtiEBAwYtypuokW5JcoCXx6m/zIOJ+rJ960KH4obyAZkwhLI6jQv7ZFw==
X-Received: by 2002:a17:906:4fc4:b0:a8d:e4b:d7fe with SMTP id a640c23a62f3a-a8ffa864071mr169118566b.0.1725984464330;
        Tue, 10 Sep 2024 09:07:44 -0700 (PDT)
Message-ID: <b458516e-dd0c-4cbd-bfb4-a4b2a7377a70@suse.com>
Date: Tue, 10 Sep 2024 18:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] xen/riscv: set up fixmap mappings
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <a05babb0982a3a0709ed08c3eeb9a729421e1bd1.1725295716.git.oleksii.kurochko@gmail.com>
 <4d98b0fb-e797-4a4f-9edc-4894f85b357d@suse.com>
 <707d5c62020ae261ddfbc93a9383e230eb7b7e86.camel@gmail.com>
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
In-Reply-To: <707d5c62020ae261ddfbc93a9383e230eb7b7e86.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 17:55, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-10 at 12:01 +0200, Jan Beulich wrote:
>> On 02.09.2024 19:01, Oleksii Kurochko wrote:
>>> Set up fixmap mappings and the L0 page table for fixmap support.
>>>
>>> Modify the Page Table Entries (PTEs) directly in arch_pmap_map()
>>> instead of using set_fixmap() ( which relies on map_pages_to_xen()
>>> ).
>>
>> What do you derive this from? There's no set_fixmap() here, and hence
>> it's unknown how it is going to be implemented.
> I derived it from the my code where is set_fixmap() is implemented but
> agree that in brackets it is better to write "will use
> map_pages_to_xen()" instead of "which relies on map_pages_to_xen()".
> 
>>  The most you can claim
>> is that it is expected that it will use map_pages_to_xen(), which in
>> turn ...
>>
>>> This change is necessary because PMAP is used when the domain map
>>> page infrastructure is not yet initialized so map_pages_to_xen()
>>> called by set_fixmap() needs to map pages on demand, which then
>>> calls pmap() again, resulting in a loop.
>>
>> ... is only expected to use arch_pmap_map().
> it is what is written in the message, isn't it?

Not quite - the original sentence is written as if map_pages_to_xen()
existed already in the code base, or was brought into existence by
this very patch. (Of course I mean the real function, not the stub
that's there.)

Jan

