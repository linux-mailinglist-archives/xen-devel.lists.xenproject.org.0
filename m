Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32092B8AF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 13:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756211.1164754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9G0-0006uM-5i; Tue, 09 Jul 2024 11:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756211.1164754; Tue, 09 Jul 2024 11:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9G0-0006ss-38; Tue, 09 Jul 2024 11:43:40 +0000
Received: by outflank-mailman (input) for mailman id 756211;
 Tue, 09 Jul 2024 11:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR9Fy-0006sk-IM
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 11:43:38 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ad86ba6-3de8-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 13:43:37 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3679df4cb4cso3076171f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 04:43:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b43967345sm1589396b3a.112.2024.07.09.04.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 04:43:36 -0700 (PDT)
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
X-Inumbo-ID: 7ad86ba6-3de8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720525417; x=1721130217; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7u26yw/8x8iuye2JcguQ6wlemP77U9t/sOaudZYZ2f8=;
        b=CE26bQmNSLCMHI5balvc0FEFsv5bI+ohHh32RVyVGCLRkckWLBHQWyzMRHlAuxFe9I
         xdCx6NwOQH8UaKZVBQBGL4tcAVV4A5TmKJjLwXQFt2GKh5CMFhkA/qRo7WERWo4wWmHB
         w6xGi+t1GJne8xDeAeAzsoGXeoq2rqQ/ZIt3NfB9wuk/b5Cvkltk5t3aurKI3TWrKAen
         RXQ9W0jBWuxog918RULMvA1sinT98MmcKxM1xX2rkXMssHphzWbCH8d4Yq4J2ZmPpa9J
         V7xi1w8fttTzGJoFGRq8zg9qLRKijGUKtAoxXQWJKaNSu48w18oEj84hkI0IJJtxOeXB
         695Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720525417; x=1721130217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u26yw/8x8iuye2JcguQ6wlemP77U9t/sOaudZYZ2f8=;
        b=m7/HsIlTJ8uwroMVN2i39mE64glzCbJkLu8Qe7Qk8R5UWGF40SGnzXZaCmk1sCz0yN
         +pmSDnJ+K5Ua2fxTadUR3AAxzNzaKqQgqqf2rtXoRKGPoKibsxMzKBDMKSZjETRA9aqp
         EF0q3ljSVPJsUwS3xULWG+rrv5M1BAimGPEWYlj7vUSjSZDlUMLkmQC8pUFrWsWjqjFv
         y+l78IJj9y1g/H70kCTDOhXuCqGTA5pAKc51qBdvLuX+qdFoiEm19PHLFQk+WxFHq3NM
         BS1Nr0XGVwKdKeQU3eUWmnEJ+3YIGbq08Zk2Ubf+Ld4tjq7EloG/ROM+CqUtVNsTwze5
         leOg==
X-Forwarded-Encrypted: i=1; AJvYcCWuUEtSeLDBy69dBuxB2riyk/Go9lvpESDkuumHNjjCx0t6Rf2dEDH1pIDCGxLPvnolGYU3HJQSveOOriTHWUhvdkSSCdxyj9KuacCksZU=
X-Gm-Message-State: AOJu0YxymgCnnHbkNHBjSh95kCrl7ybkGo83mcQqZLxPrCGPFBe9qTDI
	uTjU04SdaNEGFxbXcx5tCER6Yb8aovtPirj4nqejyF5Guj3hupMnfeJ81U1EOw==
X-Google-Smtp-Source: AGHT+IE+N2OIa0/De/AR/cXvNNNcQ/TAKjzj8eVedZKAtPv3HliYzWBbWLwK8jReJAS6wU6u1FjiiA==
X-Received: by 2002:a05:6000:2c5:b0:367:9268:bfca with SMTP id ffacd0b85a97d-367d2e687a6mr2323873f8f.22.1720525416970;
        Tue, 09 Jul 2024 04:43:36 -0700 (PDT)
Message-ID: <a85777f7-b892-4363-9e65-f7e9f0516682@suse.com>
Date: Tue, 9 Jul 2024 13:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Matthew Barnes <matthew.barnes@cloud.com>
References: <c0a9f52107e22957daaa5b1b0e05e4160db5f064.1720452354.git.matthew.barnes@cloud.com>
 <103d60b6-001b-43f0-bbff-a0806cebda73@suse.com>
 <D2KYO4GHH7VR.1XBQKN2LWF54P@cloud.com>
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
In-Reply-To: <D2KYO4GHH7VR.1XBQKN2LWF54P@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 13:11, Alejandro Vallejo wrote:
> I'll pitch in, seeing as I created the GitLab ticket.
> 
> On Tue Jul 9, 2024 at 7:40 AM BST, Jan Beulich wrote:
>> On 08.07.2024 17:42, Matthew Barnes wrote:
>>> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
>>> startup.
>>>
>>> There are efforts to support a maximum of 128 vCPUs, which would involve
>>> bumping the OVMF constant from 64 to 128.
>>>
>>> However, it would be more future-proof for OVMF to access the maximum
>>> number of vCPUs for a domain and set itself up appropriately at
>>> run-time.
>>>
>>> For OVMF to access the maximum vCPU count, Xen will have to expose this
>>> property via cpuid.
>>
>> Why "have to"? The information is available from xenstore, isn't it?
> 
> That would create an avoidable dependency between OVMF and xenstore, precluding
> xenstoreless UEFI-enabled domUs.

Right, but that's a desirable thing, so still not "have to".

>>> This patch exposes the max_vcpus field via cpuid on the HVM hypervisor
>>> leaf in edx.
>>
>> If exposing via CPUID, why only for HVM?
>>
>>> --- a/xen/include/public/arch-x86/cpuid.h
>>> +++ b/xen/include/public/arch-x86/cpuid.h
>>> @@ -87,6 +87,7 @@
>>>   * Sub-leaf 0: EAX: Features
>>>   * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT flag)
>>>   * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT flag)
>>> + * Sub-leaf 0: EDX: max vcpus (iff EAX has XEN_HVM_CPUID_MAX_VCPUS_PRESENT flag)
>>>   */
>>
>> Unlike EBX and ECX, the proposed value for EDX cannot be zero. I'm therefore
>> not entirely convinced that we need a qualifying flag. Things would be
>> different if the field was "highest possible vCPU ID", which certainly would
>> be the better approach if the field wasn't occupying the entire register.
>> Even with it being 32 bits, I'd still suggest switching its meaning this way.
> 
> Using max_vcpu_id instead of max_vcpus is also fine, but the flag is important
> as otherwise it's impossible to retroactively change the meaning of EDX (i.e: to
> stop advertising this datum, or repurpose EDX altogether)

Hmm, re-purposing. Very interesting thought. I don't think we should ever do
that.

> We could also reserve only the lower 16bits of EDX rather than the whole thing;
> but we have plenty of subleafs for growth, so I'm not sure it's worth it.

And I was only mentioning it, without meaning to suggest to shrink.

Jan

