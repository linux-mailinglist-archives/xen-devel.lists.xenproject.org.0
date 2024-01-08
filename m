Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E98269C5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 09:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663228.1033089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlLJ-0000dO-Rb; Mon, 08 Jan 2024 08:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663228.1033089; Mon, 08 Jan 2024 08:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMlLJ-0000bo-Og; Mon, 08 Jan 2024 08:50:45 +0000
Received: by outflank-mailman (input) for mailman id 663228;
 Mon, 08 Jan 2024 08:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMlLI-0000bi-4E
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 08:50:44 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01902622-ae03-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 09:50:43 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cce6c719caso15711091fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 00:50:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v22-20020a5ec116000000b007bd82040498sm525036iol.6.2024.01.08.00.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 00:50:42 -0800 (PST)
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
X-Inumbo-ID: 01902622-ae03-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704703842; x=1705308642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4csWNLnnG9+bQHdS/9ZZ5TOsfFWVW9lY6Bdn1Ooero=;
        b=Nc+cSZDaxsY/u1DMUXX4/TDjzDKQxUhG2Echf1QGxyFDxSoycUJJrKP7yWZuWr7UEW
         gqWVp/Ixj07PyEzKM1A5Tgww/CuJ8YMyagUJ1wW7OBZk2UbIqHDIA0D5r2n4HiFjumD2
         cc4RbdmWHNxQF4XPcVKzx7UZun8Jc9cL1h4+BeV1lpNrz17yp0VQYpBDQV6WjYQA8Gmh
         PU0c0KKd0dQHKydvSI7SFoLbtGxhN2a1OV1xm2uaG8z4oiIvNiwUHFuYNJN+a2T7c2DC
         pNjrJ19PIMMtmaIWPBolZRZ2w3kL9izdeT9oPyCQ5XJFkKkRyCIu8oLPzV6w2jUtWcN4
         1IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704703842; x=1705308642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4csWNLnnG9+bQHdS/9ZZ5TOsfFWVW9lY6Bdn1Ooero=;
        b=ne9AQRnOhqMojSBW/qaLy63gQuY78/7reav8XqYMKMr8B0GCeyDHJnV5AIQzKWz2Xf
         xWAeE4OlBpP1VHgPWJI6b00LT/+vzpkwVHu5PMGKR1MQDbypomosKokBVJj+G4UOUxBR
         RDYjI0XKHbXHtAyXS0pPgz4dPjpYxVcLEWKneJqXSENQ+RpQo4hAA7lVuqUFU01pEN0T
         08UvhxoWXKw5SW9jORJ7/aSE7VX2gUd1nepZVFnGI42Add2JCeappbAe4DC0WKuiT1fw
         HAjkioRSq8+MVbtaFPHW6y6QZ0nPJP6JXBEi2iKRGFS4OJfpHZ0Z2+iFREiDtQxgQv9Y
         Ya3w==
X-Gm-Message-State: AOJu0Yxx4nv2+3HPc2L9QZ5EA06FSjuMtxfU75gxb9hVLAhaPGQudfdS
	KqW6Tr/7mBHyXzyds6t9FIroCwJWHPWz
X-Google-Smtp-Source: AGHT+IFw3ArwREfnJ0Cfk0upXVFNFMgMsy5Gypj7BSgJJU+y00+q7FUrx5dDCwXe5zaKVGudWEibmA==
X-Received: by 2002:a05:6512:3a86:b0:50e:c6f3:ab93 with SMTP id q6-20020a0565123a8600b0050ec6f3ab93mr167889lfu.5.1704703842599;
        Mon, 08 Jan 2024 00:50:42 -0800 (PST)
Message-ID: <5db2cde7-7fb1-460f-ab78-c462c3a1d46e@suse.com>
Date: Mon, 8 Jan 2024 09:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-4-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051651270.3675@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2401051651270.3675@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2024 01:54, Stefano Stabellini wrote:
> On Fri, 5 Jan 2024, Jiqian Chen wrote:
>> On PVH dom0, the gsis don't get registered, but
>> the gsi of a passthrough device must be configured for it to
>> be able to be mapped into a hvm domU.
>> On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
>> passthrough devices to register gsi when dom0 is PVH.
>> So, add PHYSDEVOP_setup_gsi for above purpose.
>>
>> Co-developed-by: Huang Rui <ray.huang@amd.com>
>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>> ---
>>  xen/arch/x86/hvm/hypercall.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
>> index 632a68be3cc4..e27d3ca15185 100644
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -97,6 +97,12 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>          break;
>>      }
>>  
>> +    case PHYSDEVOP_setup_gsi:
>> +        if ( is_hardware_domain(currd) && !has_pirq(currd) )
>> +            break;
>> +        else
>> +            return -ENOSYS;
> 
> I am not sure what is the best "if" check for this situation but I am
> guessing we don't need has_pirq(currd). Maybe this is sufficient:
> 
> if ( is_hardware_domain(currd) )
>     break;
> else
>     return -ENOSYS;

Maybe

    if ( !is_hardware_domain(currd) )
        return -EOPNOTSUPP;
    ASSERT(!has_pirq(currd));
    break;

? What I primarily dislike in both earlier proposals is the (imo
confusing) use of "else".

Jan

