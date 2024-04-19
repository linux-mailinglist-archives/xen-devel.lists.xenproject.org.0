Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9098AB0CE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709132.1108395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpIP-0007Ly-R2; Fri, 19 Apr 2024 14:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709132.1108395; Fri, 19 Apr 2024 14:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpIP-0007KK-Ni; Fri, 19 Apr 2024 14:32:57 +0000
Received: by outflank-mailman (input) for mailman id 709132;
 Fri, 19 Apr 2024 14:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxpIO-0007KE-49
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:32:56 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b521592e-fe59-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 16:32:54 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-418c979ddf3so15783635e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:32:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b0041496734318sm10480923wms.24.2024.04.19.07.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 07:32:53 -0700 (PDT)
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
X-Inumbo-ID: b521592e-fe59-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713537173; x=1714141973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icTUvpL0KP7AzjT9QbJf6l1gjRt/R2EDHpEQEXXrD1c=;
        b=cOfJWfvZRQVyAUkD6samVjxRdrsGlyv/Z/xtjH3MAU6MRZBgTYVlw4DekQEhgjl9Cj
         /vioNIIwgn6Zu6xjLP+wy/uz9NobXxzjiyQCl3JtLZbKBBxCdkRrvOjsL0t6Td2AM6dE
         xcTP4V5y3l52U+j4kJL9418A4Nm8Ro94fno+9LHZoEQ+DS0THPfDVB4+dZD1ZTOJRJLp
         vYqqe92UzdyQS+4k1623A8OCnosNVTr21c8wfOek+gpi9AgOSJbgYfh9zocfchDw1Ado
         BE1T7eOZLjyXYy8Agsl/T/prg4HfdiN/G2eJutXR0D/cn/Izp51HmmFR8m/q3BRvgJom
         nEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713537173; x=1714141973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icTUvpL0KP7AzjT9QbJf6l1gjRt/R2EDHpEQEXXrD1c=;
        b=H5Z/HynSELzmHYLVyJpbeONgTj6js11FfUvBzUdkIj5vsy6RMrLP+lwssoiMjLR4uA
         RtP9ETkCeFHhqpAIy0Kz4/mL1HYW9nydG6KGau6qETydxmDkz73ga3nr7gIoXgSafFzE
         yVbijsjTbWRKAohSYcnOtCmwRmCoevG00jDxVAPUYy3a+SGOadBmWskOmqt1q0cxGP4e
         h9TpUMf9En80dr97lVqcGqFx1vdTMNkBkmmcFwVhvR78mZkKPEFEJuTqH/OJCuGiwf+G
         pP1w/aJOYLtug7Yk4a2qRTRzhELS/a2CCnn901PPPj5qljKvk8i0tJph6k9c1BSLZF8y
         3NUw==
X-Forwarded-Encrypted: i=1; AJvYcCXmzCW8v7u5BPrGBNWbdRi28PmS/s0AY+rO+amm3OnSy7d+N4GDxdEZzduBzdlBaicpuHpvvk7EokhBGC32kNkqWL+mRt3sefzPfgBd5ZY=
X-Gm-Message-State: AOJu0YxhjdHj6sh34bl/s/PYeq21evVB7eWHMhFmvBxOqqghyAgFD7e9
	eM4Mu6hHYR6jJTUH23jrfaowbtyTFL7YKEhzfdxPqw8GJWS4GPyhuffV+AEZNg==
X-Google-Smtp-Source: AGHT+IFa/1mPaKWaw2ubOF2jyfVdmnhhDx4XBAb/quY366agSEl2FUeSMAtdg2PO9Z/QHYsIK+ry7w==
X-Received: by 2002:a05:600c:3b94:b0:416:9f45:e639 with SMTP id n20-20020a05600c3b9400b004169f45e639mr1619917wms.20.1713537173512;
        Fri, 19 Apr 2024 07:32:53 -0700 (PDT)
Message-ID: <83004b7a-039c-4c5d-8f43-486d79813752@suse.com>
Date: Fri, 19 Apr 2024 16:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: introduce header file with section related
 symbols
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-2-roger.pau@citrix.com>
 <a5253ad9-02e6-408d-862c-91a3a87ad9e2@citrix.com>
 <0fe755cd-722e-41cd-9499-49dc628bf52b@suse.com>
 <65c9f3c5-5583-4c87-b2d3-8ecfba9b88cc@citrix.com>
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
In-Reply-To: <65c9f3c5-5583-4c87-b2d3-8ecfba9b88cc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.04.2024 12:16, Andrew Cooper wrote:
> On 19/04/2024 11:12 am, Jan Beulich wrote:
>> On 19.04.2024 12:08, Andrew Cooper wrote:
>>> On 19/04/2024 11:02 am, Roger Pau Monne wrote:
>>>> Start by declaring the beginning and end of the init section.
>>>>
>>>> No functional change intended.
>>>>
>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> TYVM for doing this.  There's a lot of cleanup which can follow on for it.
>>>
>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> although if anyone has a better name than sections.h then speak now.
>> For what is put there now, and for any other section bounds markers the
>> name is fine with me. I'm not presently convinced though we want to put
>> __read_mostly and friends there.
> 
> Well that's exactly what I intend to clean up into it, because it's far
> better in sections.h than (duplicated per arch) cache.h

The duplication per arch has had a patch pending for a long time, which
you've been blocking. What you're suggesting is not only a very different
sections-related use of the header (which is probably okay), but also
requires touching a fair part of the code base (each and every .c file
using __read_mostly). That's what I'd like to avoid. Yet what I could
live with if it's not me needing to perform this tedious work (hence why
I didn't want to adjust my patch along these lines).

> (Also I intend to strip down kernel.h for the other major sections too.)

I certainly have no issue with this; I was in fact already expecting that
to happen as a follow-on step.

Jan

