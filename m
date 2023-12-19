Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1692818A7D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656949.1025478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbTU-0007aT-4U; Tue, 19 Dec 2023 14:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656949.1025478; Tue, 19 Dec 2023 14:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbTU-0007YJ-1u; Tue, 19 Dec 2023 14:53:36 +0000
Received: by outflank-mailman (input) for mailman id 656949;
 Tue, 19 Dec 2023 14:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFbTS-0007YD-Na
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:53:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6172d9a2-9e7e-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 15:53:33 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3365f1326e4so3337551f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:53:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bl2-20020adfe242000000b0033668ac65ddsm5358373wrb.25.2023.12.19.06.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 06:53:32 -0800 (PST)
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
X-Inumbo-ID: 6172d9a2-9e7e-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702997613; x=1703602413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GyI7qlSUFegVz1/Sgk7VevbZXaMk3OP8IfNCB2YCQA=;
        b=I05iiZ8bq5oVEdZwhcDkA3hYMFz1wYJGbIfmKCeIkiHkdOajwEtRCcN2u8xabEvnV2
         rKQtcMGL6wGw3BGQ/jppANPxCcS1C+3OkL2Wskt/USYVhWPZNgiCTEZv/YXVTzPzLaw0
         wCHrRzkbBU9aSpiitCwh75cg76sILsNC1EuOi933qRELeNa0PWJpzXlGwNaUzrNxaGM/
         AA6WCMoLLFkh3LXdgZnmMrhgzMGS+qBCGLHwqlpRVJEyH7xjRh0JBAtdU/wOu5kFxJ+t
         n45G+ci8L3xY1pXqhx20IVqP74WTpb7ymZ6Y+HjSGqi+pPyzHmyD8PeEtYvUNzkCIxaN
         OKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702997613; x=1703602413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GyI7qlSUFegVz1/Sgk7VevbZXaMk3OP8IfNCB2YCQA=;
        b=Xsz8NYHZNTrSM8IAiSjpNpjgLzGuuZAa6AEQBCuhEGzg5Xs1F/OJ2+Oxd7ZKiItiHx
         n5CZnF1RLxp2lDE42GQVRfLXnBw6wCA84lE6GBsCnBGZjRMSh9PXE+LWO8zMTJqfoRhV
         jI5BzjHM/bpPhkSBg0fzWBO7+BARxronPmnBA0h4zweHUJXYYmClepSy6/vDvnF++dxR
         n0RGJ7jJgfLxKd3Kbr7tUYNnrdIbOPH9R4Fd+1XHxF0k4SPNZ0+ZO+5Emu7cXWBqrOPD
         +KJcAQwP8bMqTQPOCIy/sax331s8KHqdbR9jwsYVpO8QlzbqsLIuy9TSySo6csf2HDw3
         5dQw==
X-Gm-Message-State: AOJu0YzmuMLgIPQ8d3j7dglw2S7Q1bUWeQXlc7kbgX5u0rZWu750XfTX
	8wdVgT02W5MCOrqZNEJERAka
X-Google-Smtp-Source: AGHT+IG6pC9wdygtwybVPOUQHwecI4cy6/vg1RTIxsV8KKvshIedxfmbkDhC8O+RMQOkrfFmoQOgLA==
X-Received: by 2002:adf:e610:0:b0:336:5c03:c594 with SMTP id p16-20020adfe610000000b003365c03c594mr3157882wrm.36.1702997612867;
        Tue, 19 Dec 2023 06:53:32 -0800 (PST)
Message-ID: <2e29597d-8686-459d-81fb-932941c72fa7@suse.com>
Date: Tue, 19 Dec 2023 15:53:31 +0100
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
 <c45d2f87-0670-4975-84e0-a3b462b8e4a7@suse.com>
 <5beee36e-781e-4a95-8401-8af7657b8dce@citrix.com>
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
In-Reply-To: <5beee36e-781e-4a95-8401-8af7657b8dce@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 15:33, Andrew Cooper wrote:
> On 19/12/2023 2:25 pm, Jan Beulich wrote:
>> On 19.12.2023 15:19, Andrew Cooper wrote:
>>> On 19/12/2023 1:48 pm, Mykyta Poturai wrote:
>>>> This patch adds the ability for the device emulator to inject MSI
>>>> interrupts into guests. This is done by adding a new DM op to the device
>>>> model library.
>>>>
>>>> It is not possible to reuse already existing inject_msi DM op, because
>>>> it does not have a devid parameter, which is required for translation of
>>>> MSIs to interrupt numbers on ARM.
>>> Ok, so the original hypercall is broken.
>>>
>>> But the new hypercall isn't ARM specific. It's just better form of
>>> inject_msi, and needed for all architectures.
>>>
>>> So, name it DMOP_inject_msi2 and get rid of the ARM infix.
>>>
>>>> This approach was successfully tested on a virtio-pci setup with QEMU
>>>> backend emulating block devices with following changes from the mainline
>>>> Xen:
>>>>
>>>> This branch was taken as a base for virtio-pci:
>>>> https://github.com/xen-troops/xen/tree/xen-4.18-xt0.2
>>>>
>>>> With added new VGICv3 from here:
>>>> https://github.com/Deedone/xen/tree/new_vgic_v2
>>>> (although it should also work with the current VGIC)
>>>>
>>>> And patches from this branch to allow for proper ITS emulation in guests:
>>>> https://github.com/stewdk/xen/commits/pcie-passthrough-arm-vpci-v11
>>>>
>>>> The main purpose of this RFC is to get some feedback on the addition of
>>>> the new DM op. Is it the right approach or should we somehow modify the
>>>> existing inject_msi DM op to be compatible with ARM?
>>> The DM_OP ABI does allow you to extend the structure behind
>>> DMOP_inject_msi, as long as 0 is meaningful.
>>>
>>> However, the semantics of zero-extending are wrong in this case, because
>>> it would mean that users of DMOP_inject_msi on an updated Xen would be
>>> sending interrupts with an implicit source id of host bridge.
>>>
>>> So you need a new DMOP_inject_msi2 that has better semantics.
>> As said in another reply, the existing structure has a 32-bit padding
>> field, which could be used here. In the handler it's properly being
>> checked to be zero right now;
> 
> It's still not safe to reuse this zero for a source ID semantic behind
> the back of older userspace.

As long as we simply ignore that field's value, I don't see anything
wrong there (not very different from Arm ignoring the address, as the
intent looks to be). And ...

>>  whether that would want to remain this
>> way, or whether we'd expect source ID to also be passed on x86 I don't
>> know (yet).
> 
> We do need the source ID in x86, as soon as the guest has vIOMMU for any
> reason.

... I wonder whether I'll still be around when Xen actually gets there.

Jan

> It's a design error that it wasn't added originally, but I suppose you
> can say the same of x86 platforms in general, having to retrofit an
> OS-visible Source ID to HPETs/IO-APICs to make them compatible with IOMMUs.
> 
> ~Andrew
> 


