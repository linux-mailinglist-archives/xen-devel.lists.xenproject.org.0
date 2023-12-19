Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5688189BC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656902.1025429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFb22-0003n5-57; Tue, 19 Dec 2023 14:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656902.1025429; Tue, 19 Dec 2023 14:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFb22-0003k3-1l; Tue, 19 Dec 2023 14:25:14 +0000
Received: by outflank-mailman (input) for mailman id 656902;
 Tue, 19 Dec 2023 14:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFb20-00038Y-LG
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:25:12 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b435830-9e7a-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 15:25:12 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c41b43e1eso58381135e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:25:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b0040b38292253sm3091637wms.30.2023.12.19.06.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 06:25:11 -0800 (PST)
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
X-Inumbo-ID: 6b435830-9e7a-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702995911; x=1703600711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGwCbA26uMMGJ8VzvVQ8U/cXzAyZkv/6Wdme4zHnVgs=;
        b=DNNAvWVqeSV9/qIFVK5fgjx4+VG1CAxSQumO1LtbJjeasNV8bK2xHsGvrxziI3urbI
         eZJ0TOUg8vMIM9vEr+zqYWus355OLd3I/uArhNr8KxURRwD0RmttgJyuLLpUxC1heKaJ
         GnP9N3BMwuOPl4NsbMnmgigH9UGVxsGuVxI8lepSGa9SZ+4ETwKkj+ZIk1Fbpha+/SeU
         KZ+Ief8PueAePchYvF6LLWjPJGEmp8KCIJnRlHzwN9Fk3IpVKWNVKGqctx1EapKFz0AP
         rRcfwwHIjYVu0J5BVraceCI65Ndr5IpKvs3t34NBCLdfplNer3M8oao0gggqPMFsGRU+
         0Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702995911; x=1703600711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGwCbA26uMMGJ8VzvVQ8U/cXzAyZkv/6Wdme4zHnVgs=;
        b=Pw4f5SAHw/Y/WrP2GejeCv9snTOqU5FG7G9avksXlLeXLYsuphzSW9jHDsFesv7nwR
         eCBr8XVhlKa51NYgNCF4uWHgtPj0CZeJdUpwd6S0qugo4PX1njB3hhJrE+o0tnCstPI9
         S+b9FIBf+TJAhUN58MZ9QNipDVFG9e0EWca8GnGb76TfhT1NtFWRqRKRgQRThHxcK138
         pYINhzx+hcmKdJMPGj+3ZoUBA9wMj9UX5sDys9h6HqUAgQYS95V+F3BhNeDS07E6lvWv
         9ZbFWZ6N+1IPAI12YpcnP5DJ7006Ytzfz0AD8yY7HlNzs6lg9U1UVe8c92AU196GQ/Wq
         pjmw==
X-Gm-Message-State: AOJu0Yymz3ifwva55BeE0C5IEFnnF7v7X5J3+YDLTJVKCHfroHbbBY9U
	kjNM1GkkaiCNxcuhlLq8e+es
X-Google-Smtp-Source: AGHT+IFW2t9A7arW7vKcZN+RrppPjvh0sXiQEFE3EfH/nPyUfG9WyiOlpXVPJKAXM1ySx0td94xmHQ==
X-Received: by 2002:a05:600c:4da5:b0:40c:7a7:d00e with SMTP id v37-20020a05600c4da500b0040c07a7d00emr9616618wmp.49.1702995911392;
        Tue, 19 Dec 2023 06:25:11 -0800 (PST)
Message-ID: <c45d2f87-0670-4975-84e0-a3b462b8e4a7@suse.com>
Date: Tue, 19 Dec 2023 15:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
 <6dbce90b-69c8-4899-9b69-da3b50c17b40@citrix.com>
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
In-Reply-To: <6dbce90b-69c8-4899-9b69-da3b50c17b40@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 15:19, Andrew Cooper wrote:
> On 19/12/2023 1:48 pm, Mykyta Poturai wrote:
>> This patch adds the ability for the device emulator to inject MSI
>> interrupts into guests. This is done by adding a new DM op to the device
>> model library.
>>
>> It is not possible to reuse already existing inject_msi DM op, because
>> it does not have a devid parameter, which is required for translation of
>> MSIs to interrupt numbers on ARM.
> 
> Ok, so the original hypercall is broken.
> 
> But the new hypercall isn't ARM specific. It's just better form of
> inject_msi, and needed for all architectures.
> 
> So, name it DMOP_inject_msi2 and get rid of the ARM infix.
> 
>> This approach was successfully tested on a virtio-pci setup with QEMU
>> backend emulating block devices with following changes from the mainline
>> Xen:
>>
>> This branch was taken as a base for virtio-pci:
>> https://github.com/xen-troops/xen/tree/xen-4.18-xt0.2
>>
>> With added new VGICv3 from here:
>> https://github.com/Deedone/xen/tree/new_vgic_v2
>> (although it should also work with the current VGIC)
>>
>> And patches from this branch to allow for proper ITS emulation in guests:
>> https://github.com/stewdk/xen/commits/pcie-passthrough-arm-vpci-v11
>>
>> The main purpose of this RFC is to get some feedback on the addition of
>> the new DM op. Is it the right approach or should we somehow modify the
>> existing inject_msi DM op to be compatible with ARM?
> 
> The DM_OP ABI does allow you to extend the structure behind
> DMOP_inject_msi, as long as 0 is meaningful.
> 
> However, the semantics of zero-extending are wrong in this case, because
> it would mean that users of DMOP_inject_msi on an updated Xen would be
> sending interrupts with an implicit source id of host bridge.
> 
> So you need a new DMOP_inject_msi2 that has better semantics.

As said in another reply, the existing structure has a 32-bit padding
field, which could be used here. In the handler it's properly being
checked to be zero right now; whether that would want to remain this
way, or whether we'd expect source ID to also be passed on x86 I don't
know (yet).

Jan

