Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA46A94289A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 10:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768304.1179078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4Hm-0002Tm-G4; Wed, 31 Jul 2024 08:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768304.1179078; Wed, 31 Jul 2024 08:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4Hm-0002Rw-D0; Wed, 31 Jul 2024 08:02:14 +0000
Received: by outflank-mailman (input) for mailman id 768304;
 Wed, 31 Jul 2024 08:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ4Hl-0002Rq-Jd
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 08:02:13 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30fdb2e5-4f13-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 10:02:11 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a79df5af51so1245982a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 01:02:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb80c3sm736808166b.197.2024.07.31.01.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 01:02:10 -0700 (PDT)
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
X-Inumbo-ID: 30fdb2e5-4f13-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722412931; x=1723017731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ks4vOAYP+psPxcMsr0VFWwkCJ0sUggPF4HxzEbFTtes=;
        b=f/dSHpXO4JfG/mmUpeDu3eN31lPlJRoG46qZtvdETRkZen25Futcs3l+Se9F4L8YlA
         2h71sH2KWsUqojw+rdBdfQJzvlOg5m2Sd2kupclUiwoP39obB/jduPXWW1dv2kU+SbqN
         zKh7mJpwY+mxK/mUGYrBSTCswB66RjYO9i0sN6RpwBXbokkORXw1si5ZekXDKKurjKd/
         GO51vUN4jMve1olJOAeIVUo+xBkv795ZoHMhljl6+1TFqxv1Vob+BCRpS6nGpL1Vq+dn
         eiGh8EG023lGvgoPG/jUkG/rmCyUis+ra9QDDaDU+LO5M9fbkc0QFJroTzcXLq8O9485
         sqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412931; x=1723017731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ks4vOAYP+psPxcMsr0VFWwkCJ0sUggPF4HxzEbFTtes=;
        b=Q2VZfvbQHl993rpC5ODM13G6rN6V89l6/2/WNzvrDoTuJFwfgNoLiHqq5tGMyweIIJ
         7hIXQ3e/GRCfhHokSvFCtwzwD/dCr814n1J3e+01LxhzOINGCcNTJF6+5k1fDuR23HJh
         kq6AV6I7WP6KC1CI+/yfVkgUVPxWd9sk9lzaVoyOGapWdtyx19ifylr98Q4P0fo+xD2j
         aTSQhLlPEWIob0ATvPClsbQRYVD5ZZXifbROIQuFLQVxLGYMApoPfu/YurbT6FsnZ6q3
         L1Le0vZ3Gw2smlKPLYEsqAcooOPUP3XY4LIAKCb/EqLjuxuvftHnrXO/eP+Y68+D2aXV
         C1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/mxB5QmDNkSPcoXUSfLTn9ZVwMWp1GPc7lnYNwxLQi9P1tn/eNZwvrIsoA+osPo9pvS/piHlEv8/GTha8K3YdHhcJefaNIdeh+SS2HcM=
X-Gm-Message-State: AOJu0YwYiY4ZCz7qRE3Agidgf9Fu3krlpV3+1AB093qEjKPsaRSstSEB
	0Rm2kZ6A2pHaxvZ5DFm6X40i4f3D4AwcCoJXA6IR5lOFuAOYeNwhsNL9UR+GKw==
X-Google-Smtp-Source: AGHT+IGUbNRg630Coyd3CF7XZhW0LX3oS9KngjA6LsGRJGzd2lRe105axRScO8mP+XDDOcd911/WQg==
X-Received: by 2002:a17:907:7e97:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a7d858b3d6cmr399153866b.7.1722412931088;
        Wed, 31 Jul 2024 01:02:11 -0700 (PDT)
Message-ID: <cb785319-ab42-44d6-b2df-5777fe829eae@suse.com>
Date: Wed, 31 Jul 2024 10:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/dom0: fix restoring %cr3 and the mapcache
 override on PV build error
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-2-roger.pau@citrix.com>
 <5e5cc6b2-cdf3-4670-a2dc-2e23dc22d520@suse.com> <ZqnuhBkM9hpSbSw1@macbook>
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
In-Reply-To: <ZqnuhBkM9hpSbSw1@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 09:57, Roger Pau Monné wrote:
> On Wed, Jul 31, 2024 at 08:32:03AM +0200, Jan Beulich wrote:
>> On 30.07.2024 17:28, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/pv/dom0_build.c
>>> +++ b/xen/arch/x86/pv/dom0_build.c
>>> @@ -825,6 +825,8 @@ int __init dom0_construct_pv(struct domain *d,
>>>      rc = elf_load_binary(&elf);
>>>      if ( rc < 0 )
>>>      {
>>> +        mapcache_override_current(NULL);
>>> +        switch_cr3_cr4(current->arch.cr3, read_cr4());
>>>          printk("Failed to load the kernel binary\n");
>>>          goto out;
>>>      }
>>
>> Just below here we have
>>
>>     bootstrap_map(NULL);
>>
>> This too is wanted in the error case aiui. Happy to move it up immediately
>> ahead of the if() while committing, so long as you agree. Then:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm happy with this, but note there are further instances of error
> paths above this one that already don't remove the bootstrap mappings.

Hmm, you're right. I'll leave that untouched then.

Jan

