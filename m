Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F5A6D80D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925230.1328106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twegh-0000H0-1e; Mon, 24 Mar 2025 10:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925230.1328106; Mon, 24 Mar 2025 10:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twegg-0000Dt-UU; Mon, 24 Mar 2025 10:05:42 +0000
Received: by outflank-mailman (input) for mailman id 925230;
 Mon, 24 Mar 2025 10:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twegf-0000Dn-Dy
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:05:41 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a60022d-0897-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:05:40 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43948021a45so33894825e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:05:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abe4971b0sm5435434f8f.26.2025.03.24.03.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 03:05:39 -0700 (PDT)
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
X-Inumbo-ID: 8a60022d-0897-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742810740; x=1743415540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+T1CBCpEzt7baE3PVBi+epotLIQuQty1Zn29FAgx9so=;
        b=bH6gJUfZiC/ZWd/x/PT+bQchTFKAKlJGXOQyqsGEQlkK9lLWtoSFdC+WdzrHm9C4oM
         UyLQl4HAtzYrcD6WgxJwpVIk4FMuJj4DnrC6iltWe39W08nH3xtGe4iXBoS2ZtiwOql0
         Ko5jPf3PVvP9yzFa/Xf/qu+nfB5EALSbxfOqX3kfPq977d3qAxRB9KGU//RclQIoqwJN
         NNAkLh73r0mk8MVkhKLfOz6hbHuMnxYKxfpwCUCS9QWpIkWvvfkIua4QzWlGBQzK2MIK
         9mx5kwaN713FXiFVxmcSmdD6M5/W+DCSCmrAcJjtrgwhoMMhfTOQMLeY701DB/zA4y5H
         he2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810740; x=1743415540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T1CBCpEzt7baE3PVBi+epotLIQuQty1Zn29FAgx9so=;
        b=mYgjxMnBHEk2+pyEbNAwL/FUiSjgB20Pvltl7m51qHY0M2s5HN7/PQCco6KAPESsFc
         n1mB4KXpv3HGOWBzN81lKN9scBediiH+/oakOK/RWE6lq1GYEeNO9DyvBoswBPdlfCVT
         Pu+FMgyvL5QYmEx8MgHqlTHgm+6voA2wmlgweGaSQZKFRpmobm/4YPvZ0wHwRPgkREQR
         /KnMdUoiDoVpcpHtDVc8e8bYDiTB6NX8UffBSST5ypUxrbGuh1IidaUvbfaG7PlR42gd
         Sg1+Z5uSZqx9IEwVtklzBnRWYt/l0xTR3OhmeJui7UktFysLGRCGcVpck6yvB/bAs7Kl
         dQqg==
X-Forwarded-Encrypted: i=1; AJvYcCVTksjrsn7sliYGbemSqCL7W12FMdwYYKux4bmt084u3a58Vx0ya1nvAQfx6zwbC2uEbESJ3/xj32U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/wXAGa3mEk0BjlWi+eJ6E0nfIx+/6cUwvpoJKVMT7FAg7BuKN
	gd5DmGb5032pew9EWaaiW//Qfwo8lXrJb+5xbpBoOwhim9UE1W0YmcVflg719w==
X-Gm-Gg: ASbGncvKDYbJbPZSWRmPJKZp7d/v3SQiwAWRhYQ81l3Gu5b7GNEYkw1oAFzHuCT8n7v
	pfdkYuQRejEUnV8Og+RD+x6F4BsoEALiYuYLqIxhV8Hs+p3kr4iMwhZ9GpACBIKXvIDU5/7478g
	m+iksrQSBtXIS/pei89e9MyBDbACedRHzlZlIz8mDvj0e4AZJBgW5C04rVLkERphaJNsFbVwdEj
	Q77WVBss7EmDwfj5abNxaxToFlRtqcneTpK3Iyr5u57FJXTUiaactc8lffHOaliVL4vj9q7ghut
	HYj8OA28RAt7c8kJxfN/7cI86OK9IPE565+dyYgtyqpvTk/5V5OybVmWqAzl9ZVlKunq7HeyCj3
	WA4TLkari+9tw3aKBTal0nooFmVvgtQ==
X-Google-Smtp-Source: AGHT+IEMtxsesm5bKZq94y9c1CZnqKeM47GZYNKhy98LWfhSj+6bN+w26fdu/cOucy2x9E/dO59+Wg==
X-Received: by 2002:a05:600c:1989:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43d509e9dd0mr104557845e9.7.1742810739805;
        Mon, 24 Mar 2025 03:05:39 -0700 (PDT)
Message-ID: <15bea88c-8294-4164-83df-7ccdb61f9697@suse.com>
Date: Mon, 24 Mar 2025 11:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Grygorii Strashko <gragst.linux@gmail.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
 <5190f71c-4a93-4f66-91d0-aec43a97ddab@epam.com>
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
In-Reply-To: <5190f71c-4a93-4f66-91d0-aec43a97ddab@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.03.2025 10:00, Oleksii Moisieiev wrote:
> Hi Jan,
> 
> Let me answer one of your comment. Please see below:
> 
> On 11/03/2025 13:43, Jan Beulich wrote:
>> On 11.03.2025 12:16, Grygorii Strashko wrote:
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -526,6 +526,12 @@ S:	Supported
>>>   F:	xen/arch/arm/include/asm/tee/
> [snip]
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>>   #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>>   #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>>>   
>>> +#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>>> +
>>>   struct xen_arch_domainconfig {
>>>       /* IN/OUT */
>>>       uint8_t gic_version;
>>> @@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
>>>        *
>>>        */
>>>       uint32_t clock_frequency;
>>> +    /* IN */
>>> +    uint8_t arm_sci_type;
>>>   };
>> You're not re-using a pre-existing padding field, so I don't see how you
>> can get away without bumping XEN_DOMCTL_INTERFACE_VERSION.
> 
> We are reusing an existing padding field in xen_domctl, which is defined 
> as pad[128].
> 
> The xen_arch_domainconfig structure is a part of the following domctl 
> structures:
> 
> - xen_domctl_createdomain
> 
> - xen_domctl_getdomaininfo
> 
> These structures are included in the union within xen_domctl, which 
> defines pad[128] for padding.

Except that "an existing padding field" means a field which isn't just
there in space, but is also checked to be zero right now. That is, new
code setting the field to non-zero needs to properly get an error
indicator back from an older hypervisor.

Jan

