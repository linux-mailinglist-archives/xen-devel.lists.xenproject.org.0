Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B29080E7DD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652784.1018822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzDk-0001zU-Kb; Tue, 12 Dec 2023 09:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652784.1018822; Tue, 12 Dec 2023 09:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzDk-0001xo-Hw; Tue, 12 Dec 2023 09:38:32 +0000
Received: by outflank-mailman (input) for mailman id 652784;
 Tue, 12 Dec 2023 09:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCzDj-0001xi-8x
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:38:31 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34999bad-98d2-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:38:28 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9f62fca3bso69941281fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 01:38:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b0040c2c5f5844sm15927874wms.21.2023.12.12.01.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 01:38:28 -0800 (PST)
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
X-Inumbo-ID: 34999bad-98d2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702373908; x=1702978708; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYVZtZhSR1Rq0Lag/6BK768XzJ3pRiFsk9NAFdAubjk=;
        b=HnxGfHlAFDwgrKwFkABoRgpcsC/ID+p/4AzHbjOT/lV3DLseRFx6SeHVyFjjHdo/e0
         7F71QHVCvRMKze4OO3sHJkWSav+UapLA6bXDPzNcQ0gFA+hR0x+MYLAMEvGHmXV85mOG
         kZqH2UObmAlJx0/BscahbY0XGyW2OiqK3pvl8UBWdu57ereS+1kL8x3YazZoy727fI8W
         uTdBUlyP8hRgAm34SVklVxHz0kgZeBipC7LYI3sDiUbARlqhkJyMMCf8zusnhEHj/vuL
         bhexMfD51lbX2IqwV77amt/T+H8aeQ+83bb6JeUZQngpo1cNIl0/2XoBg2ynzogebmfd
         0T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373908; x=1702978708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYVZtZhSR1Rq0Lag/6BK768XzJ3pRiFsk9NAFdAubjk=;
        b=nAqYGcXNa0F3uinys1R3hfu+hefZyJp9lpEWUcVcjuXCv76hsxtA25x5lNxfaXyE6y
         w3L40c9QlDzY9eqzmnFLjk3OEklz8aE7XB6nTswjgXdx2KDLXGmJhTwrLK6gQfq2FI4f
         Pc4ichZUfQOOmO33r8bsPSeCO9G90QZkU5DjPknl9M9gQVGT2OMbu/bYChvk2qPV4UQK
         JKO9uzOrChE4RP1t372cEQVZ1oIpo0PAqj607z65g5bQfKxjE4B3l/AYt3QReMJww9HR
         DuYNmtal3Jx5JJhsFwW2Ku6/XBAzx0XlU+ZEbhWavQANPARkloSVo1xt1E/XYSa6kt5p
         U1zw==
X-Gm-Message-State: AOJu0YzjbfpnDFMF8FtP3+BbhsC4lJPnzPwFz/Mv82hSyQZzuT+V45st
	A47cP+8JePzecVbdj8azbwZj
X-Google-Smtp-Source: AGHT+IHOT4lbLHXNJN9PVOA+ADujhAtde3saVGZ8zzjwE9/wjMq/MZAp51ltG0UOBFCCv6lER3lnZw==
X-Received: by 2002:a2e:86d8:0:b0:2ca:cb6:f478 with SMTP id n24-20020a2e86d8000000b002ca0cb6f478mr2618844ljj.52.1702373908388;
        Tue, 12 Dec 2023 01:38:28 -0800 (PST)
Message-ID: <50ca26a1-38e3-45fb-9c39-56e4d04de3e0@suse.com>
Date: Tue, 12 Dec 2023 10:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
References: <alpine.DEB.2.22.394.2311301912350.110490@ubuntu-linux-20-04-desktop>
 <ZWmgJNidFsfkDp7q@macbook>
 <alpine.DEB.2.22.394.2312011857260.110490@ubuntu-linux-20-04-desktop>
 <ZW2ptexPQXrWBiOS@macbook>
 <alpine.DEB.2.22.394.2312041413000.110490@ubuntu-linux-20-04-desktop>
 <ZW7rDjjC0gxEI1cq@macbook> <15275706-5c31-4e29-aa29-9f5e90526219@suse.com>
 <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXculMdLgwGaRC7i@macbook>
 <BL1PR12MB584997DDE6839F2340022976E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXgeieg4E8UN0KoN@macbook>
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
In-Reply-To: <ZXgeieg4E8UN0KoN@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(I think the Cc list is too long here, but then I don't know who to
keep and who to possibly drop.)

On 12.12.2023 09:49, Roger Pau Monné wrote:
> On Tue, Dec 12, 2023 at 06:16:43AM +0000, Chen, Jiqian wrote:
>> On 2023/12/11 23:45, Roger Pau Monné wrote:
>>> On Wed, Dec 06, 2023 at 06:07:26AM +0000, Chen, Jiqian wrote:
>>>> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
>>>> +{
>>>> +       struct physdev_setup_gsi setup_gsi;
>>>> +
>>>> +       setup_gsi.gsi = gsi_info->gsi;
>>>> +       setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
>>>> +       setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
>>>> +
>>>> +       return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
>>>> +}
>>>
>>> Hm, why not simply call pcibios_enable_device() from pciback?  What
>> pcibios_enable_device had been called when using cmd "xl pci-assignable-add sbdf" from pciback. But it didn't do map_pirq and setup_gsi.
>> Because pcibios_enable_device-> pcibios_enable_irq-> __acpi_register_gsi(acpi_register_gsi_ioapic PVH specific)
>>> you are doing here using the hypercalls is a backdoor into what's done
>>> automatically by Xen on IO-APIC accesses by a PVH dom0.
>> But the gsi didn't be unmasked, and vioapic_hwdom_map_gsi is never called.
>> So, I think in pciback, if we can do what vioapic_hwdom_map_gsi does.
>>
> 
> I see, it does setup the IO-APIC pin but doesn't unmask it, that's
> what I feared.
> 
>>> It will be much more natural for the PVH dom0 model to simply use the
>>> native way to configure and unmask the IO-APIC pin, and that would
>>> correctly setup the triggering/polarity and bind it to dom0 without
>>> requiring the usage of any hypercalls.
>> Do you still prefer that I called unmask_irq in pcistub_init_device, as this v2 patch do?
>> But Thomas Gleixner think it is not suitable to export unmask_irq.
> 
> Yeah, that wasn't good.
> 
>>>
>>> Is that an issue since in that case the gsi will get mapped and bound
>>> to dom0?
>> Dom0 do map_pirq is to pass the check xc_domain_irq_permission()-> pirq_access_permitted(), 
> 
> Can we see about finding another way to fix this check?
> 
> One option would be granting permissions over the IRQ in
> PHYSDEVOP_setup_gsi?

There's no domain available there, and imo it's also the wrong interface to
possibly grant any permissions.

> Otherwise we could see about modifying the logic in PHYSDEVOP_map_pirq
> so that the hardware domain can map IRQs to other domains without
> having it mapped to itself first?

While this may be possible to arrange for, it still would feel wrong. How
would you express the same in a disaggregated environment? I.e. how would
you make sure a domain trying to grant permission is actually permitted to
do so for the resource in question?

> I think the call to PHYSDEVOP_setup_gsi in pciback is fine, but I
> would really like to avoid the usage of PHYSDEVOP_{,un}map_pirq on a
> PVH dom0 against itself.

+1

Jan

