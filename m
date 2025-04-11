Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6ABA855FD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946758.1344542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39JB-0003zw-DT; Fri, 11 Apr 2025 08:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946758.1344542; Fri, 11 Apr 2025 08:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39JB-0003x0-AA; Fri, 11 Apr 2025 08:00:17 +0000
Received: by outflank-mailman (input) for mailman id 946758;
 Fri, 11 Apr 2025 08:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u39J9-0003wu-Cn
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 08:00:15 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff44a3a1-16aa-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 10:00:13 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso764490f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 01:00:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f207cb88asm77619475e9.37.2025.04.11.01.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 01:00:12 -0700 (PDT)
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
X-Inumbo-ID: ff44a3a1-16aa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744358413; x=1744963213; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oe02DyZ/YnlBlOBVxQUh6vwlzu9gLAwopRjE7HNoyYU=;
        b=NBl1+Pf3ZGWECbS00PE9jk+tGSTcbOgwvRLjLRGed3IBgRioKxKwpPr15WXLAIRQ+t
         pfjkKKiu3TV4SsrNCy8u/xaIyAbKWE9kB9pP4HEY02YkYm8M9ldFh/FNxC1f1mPgeL5Y
         Hkaf1EgFZZkCyCYjE33t4w+xnntz+OGN45CI/ZPgRI7GHV0Rwvw7P8VEFoNbQTfquWqb
         uqKLu+zt3qxWEfrflSgRsvuL79UJ6oFHehbzp/gTtKIxH7YpzYhv4M+eBnedw79XcY45
         JJpAdtrlihfS1+xQt510c7GILP0q87ozFNMAEOYFQ75iENcEkU/BIQ+QxC8zMBsSq3xq
         47sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358413; x=1744963213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe02DyZ/YnlBlOBVxQUh6vwlzu9gLAwopRjE7HNoyYU=;
        b=mJtYSAJ5n9bBAiSW/kNelCP8dnvlaxhHy2obK+2CUuKXKzTxo1IRWeC/urHyFk61Ie
         ECw3dmccwgajPnuygY/HB7Dz90GGdQLfg2D9eSBOsi3qdSq70yqZbsvOS+fIqCJJU9hn
         Z4D/kh7xUbrH7iTbzJ1ZnLFutLrH+hINTT8ekZiO8pkMu4r6fM+DDCkZcETkZzm4RvYA
         jHyACcH3ykpHM8vUXxZ+rzy3n1cETD2qwRFL73yyNaXyN4tp2OfyDzCwo65HHVhMMEq4
         NQrjcjlov+FuMQfc+18oEd0gOUILAtrR54lsfyLK+jzMcHpeW3wihkwG2k2BufJQ1Fhb
         XivQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi5lmuCAv2O9BjaDELUru7gvfXon+v9EHFf3bxmZA/5xveXouOmlro4ANSf+vKoBNOrn3gwsD7/Ss=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXtmJ02b3zOuqGXHC5tTY0iIsnf+PiHw/6wZINzZbGrH1Jh4kQ
	pW/JB2K8Va7ZwaDn4jShjzMQUvROvqq3MkQPo2JL6AYw5fjv8gWKdAcpF2zvfQ==
X-Gm-Gg: ASbGncvAFydb0uqSrMwsYH5TWak9TUkKM9rpXjW71wiQ2oESIKEKln3Tf6FybC/xl6u
	rSCKjh2tV0c/ZFmlexJctjUH9Bqg4gSpkQFSsM7sCC5DRaUuK0Xb8rhrN6yaVjtRgBr70lKSQeM
	hqEMscmQMn8D7eC0EX/luL87FVhSeZ7qCB3pVx0fkWiB2zpxHsS5DwD+NBQcPv+xMnXuUHGGDQd
	2HHOPfeCq1xks75u/yaeoNTwMh/vQgCQ74Gh3ES5zXHEzY4gETttvHY20LA7+maRmBmLomdsRmO
	sipjdlUMz8Gn7UX/VDcoFQodq6YqU/vND0fUADyNzN7J6wWJKMZQ9FT9UWGPypJQJvyt3LSuF1h
	q5pmqQ2EhbA5fr1VvpvCxcvt7Cw==
X-Google-Smtp-Source: AGHT+IFbX984vpulelxzsJdqqmDz4DeISnrXF+OB1Q37SYO1hgxsQDg9Zn40Lxv44tJBogTVbt3uHA==
X-Received: by 2002:a5d:6daa:0:b0:391:ab2:9e71 with SMTP id ffacd0b85a97d-39ea51f55b2mr1115659f8f.20.1744358412722;
        Fri, 11 Apr 2025 01:00:12 -0700 (PDT)
Message-ID: <4c1ec39e-5043-49bc-b7bf-0f193331c146@suse.com>
Date: Fri, 11 Apr 2025 10:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] driver/pci: Get next capability without passing
 caps
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-2-Jiqian.Chen@amd.com>
 <5a18ae61-3ffa-41d1-aa1d-dce4d3ca0381@suse.com>
 <BL1PR12MB5849F5E86496802914619F5EE7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849F5E86496802914619F5EE7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2025 04:51, Chen, Jiqian wrote:
> On 2025/4/10 20:34, Jan Beulich wrote:
>> On 09.04.2025 08:45, Jiqian Chen wrote:
>>> --- a/xen/drivers/pci/pci.c
>>> +++ b/xen/drivers/pci/pci.c
>>> @@ -40,7 +40,7 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>>>  }
>>>  
>>>  unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>>> -                                   const unsigned int caps[], unsigned int n,
>>> +                                   const unsigned int *caps, unsigned int n,
>>
>> I don't follow the need for this change.
> This changed is for my next patch "vpci/header: Emulate legacy capability list for host".
> Currently, vpci only emulates capability list for domU, not for dom0.
> For domU, vpci exposes a fixed capability array which calls "supported_caps".
> My changes want to emulate capability list for dom0.
> I think vpci should expose all devices capabilities to dom0.
> When I emulate it, I need to iterate over all capabilities without another fixed array,
> so I need this function to return the position of next capability directly when passing a zero length array to this function.

This doesn't answer my question. The change you need for the next patch is
the hunk below, not the one above. Aiui at least.

>>> @@ -55,6 +55,10 @@ unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
>>>  
>>>          if ( id == 0xff )
>>>              break;
>>> +
>>> +        if ( !caps || n == 0 )
>>> +            return pos;
>>
>> Checking n to be zero ought to suffice here? In that case it doesn't matter
>> what caps is. Plus if n is non-zero, it clearly is an error if caps was NULL.
> Two checking is to prevent null pointer errors.
> But as you said, if checking n to be zero is enough, then I don't need to change the definition of this function.
> I will change in next version.

If you really wanted to, you could add e.g. ASSERT(caps) after this if().

Jan

