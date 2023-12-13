Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEDD810BB0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 08:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653737.1020237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDJri-0004Ku-JU; Wed, 13 Dec 2023 07:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653737.1020237; Wed, 13 Dec 2023 07:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDJri-0004Ir-Gl; Wed, 13 Dec 2023 07:41:10 +0000
Received: by outflank-mailman (input) for mailman id 653737;
 Wed, 13 Dec 2023 07:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDJrh-0004Ij-5s
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 07:41:09 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f938d6f8-998a-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 08:41:06 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so51444265e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 23:41:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fj5-20020a05600c0c8500b0040b2976eb02sm19458404wmb.10.2023.12.12.23.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 23:41:05 -0800 (PST)
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
X-Inumbo-ID: f938d6f8-998a-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702453266; x=1703058066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8o4drzMaers2hVmDmJfFYBeEGuJUWOd6VhlCrOEzu1U=;
        b=XEArAVx1o8FQMao0JFrbMXkM5daC9IYBPBneE0HwAz7z1T2nz2IKnYOcOvhKyLW2DU
         ErBkvZAKVGGDqIrSq6Dvzmah4jZXadQJvS9jUwj7EJZD665Jbef6lWTpv5eOAG4+cIiH
         q9lmnDuUpsJ1KtsM75jWKUjcRuLndLKU3FB05t41fkrYWXRmK8sLU6t+ROgNjB9UI2OD
         lafFW6JrxObdIziNGPzWAzJih4ChTkid4R8+y2R8XkGogoJgZIcbxOtmJnWondv9c2V9
         6QAkaFNGIvH/+MLLRdNEPN+wFT3Aok3WZxLBeBaZQwpcRe7KIv6IB1/ioLGVmMUNPn3o
         98Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702453266; x=1703058066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8o4drzMaers2hVmDmJfFYBeEGuJUWOd6VhlCrOEzu1U=;
        b=iE4hpVORLVS73C2Wys3VdHw/ftznY9VF0vM0deVDFSoqFV2g/HuG2vvhsrICkojPy6
         rQKLaAt2ZefRm7X4z+iHL9+/P5xcur0+Y+tVb6DootIXOO5NgApJ8o0l28hLmnF/PMvc
         C3W/AJ3ob5fvlxCRwSKjcaJcpu1QSDGZCx3zSt1XnpHIoek2NxLNYT3SXJFh8zxvLu4L
         zxH6JU5rZTq3YEAgOXcVRcGE+ktcGtMCY4A7jan7NgGFzw9rx0ZeKprGi4vzOq+i4dLN
         SqAnZRDN9wOMWY/0ZQRzxR1XliLjMCbLDY4SZsMeqOh+s4QXDwZeuJDGcRslWL8COY+s
         KlSw==
X-Gm-Message-State: AOJu0Yz0a21N9jyXaqNhj21Vk7f9Elvg3vKuJrbE/PweYqLid4mrZTvA
	1vgc/Sek5Dcilv8pRG8hoD0Q
X-Google-Smtp-Source: AGHT+IFd3wtuALjmsUXy4mLtYyt0ynj1xNEonxoKPdRqmez2zKHeIvI33I3yODJuVHhKFNb47ru3Kw==
X-Received: by 2002:a7b:ce14:0:b0:40b:5464:b241 with SMTP id m20-20020a7bce14000000b0040b5464b241mr3516231wmc.4.1702453265671;
        Tue, 12 Dec 2023 23:41:05 -0800 (PST)
Message-ID: <b2a64f91-c202-4c28-aade-b38e2f8e47df@suse.com>
Date: Wed, 13 Dec 2023 08:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2312041413000.110490@ubuntu-linux-20-04-desktop>
 <ZW7rDjjC0gxEI1cq@macbook> <15275706-5c31-4e29-aa29-9f5e90526219@suse.com>
 <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXculMdLgwGaRC7i@macbook>
 <BL1PR12MB584997DDE6839F2340022976E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXgeieg4E8UN0KoN@macbook> <50ca26a1-38e3-45fb-9c39-56e4d04de3e0@suse.com>
 <ZXhBb0Vt6gDuprHa@macbook> <c5d4e8a4-b286-4352-bf96-a67cb132b452@suse.com>
 <ZXhGhKkcmlEZOpwZ@macbook>
 <BL1PR12MB5849094EEE3FCE80C9FCBD48E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849094EEE3FCE80C9FCBD48E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.12.2023 08:14, Chen, Jiqian wrote:
> On 2023/12/12 19:39, Roger Pau Monné wrote:
>> On Tue, Dec 12, 2023 at 12:19:49PM +0100, Jan Beulich wrote:
>>> On 12.12.2023 12:18, Roger Pau Monné wrote:
>>>> On Tue, Dec 12, 2023 at 10:38:08AM +0100, Jan Beulich wrote:
>>>>> (I think the Cc list is too long here, but then I don't know who to
>>>>> keep and who to possibly drop.)
>>>>>
>>>>> On 12.12.2023 09:49, Roger Pau Monné wrote:
>>>>>> On Tue, Dec 12, 2023 at 06:16:43AM +0000, Chen, Jiqian wrote:
>>>>>>> On 2023/12/11 23:45, Roger Pau Monné wrote:
>>>>>>>> On Wed, Dec 06, 2023 at 06:07:26AM +0000, Chen, Jiqian wrote:
>>>>>>>>> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
>>>>>>>>> +{
>>>>>>>>> +       struct physdev_setup_gsi setup_gsi;
>>>>>>>>> +
>>>>>>>>> +       setup_gsi.gsi = gsi_info->gsi;
>>>>>>>>> +       setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
>>>>>>>>> +       setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
>>>>>>>>> +
>>>>>>>>> +       return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
>>>>>>>>> +}
>>>>>>>>
>>>>>>>> Hm, why not simply call pcibios_enable_device() from pciback?  What
>>>>>>> pcibios_enable_device had been called when using cmd "xl pci-assignable-add sbdf" from pciback. But it didn't do map_pirq and setup_gsi.
>>>>>>> Because pcibios_enable_device-> pcibios_enable_irq-> __acpi_register_gsi(acpi_register_gsi_ioapic PVH specific)
>>>>>>>> you are doing here using the hypercalls is a backdoor into what's done
>>>>>>>> automatically by Xen on IO-APIC accesses by a PVH dom0.
>>>>>>> But the gsi didn't be unmasked, and vioapic_hwdom_map_gsi is never called.
>>>>>>> So, I think in pciback, if we can do what vioapic_hwdom_map_gsi does.
>>>>>>>
>>>>>>
>>>>>> I see, it does setup the IO-APIC pin but doesn't unmask it, that's
>>>>>> what I feared.
>>>>>>
>>>>>>>> It will be much more natural for the PVH dom0 model to simply use the
>>>>>>>> native way to configure and unmask the IO-APIC pin, and that would
>>>>>>>> correctly setup the triggering/polarity and bind it to dom0 without
>>>>>>>> requiring the usage of any hypercalls.
>>>>>>> Do you still prefer that I called unmask_irq in pcistub_init_device, as this v2 patch do?
>>>>>>> But Thomas Gleixner think it is not suitable to export unmask_irq.
>>>>>>
>>>>>> Yeah, that wasn't good.
>>>>>>
>>>>>>>>
>>>>>>>> Is that an issue since in that case the gsi will get mapped and bound
>>>>>>>> to dom0?
>>>>>>> Dom0 do map_pirq is to pass the check xc_domain_irq_permission()-> pirq_access_permitted(), 
>>>>>>
>>>>>> Can we see about finding another way to fix this check?
>>>>>>
>>>>>> One option would be granting permissions over the IRQ in
>>>>>> PHYSDEVOP_setup_gsi?
>>>>>
>>>>> There's no domain available there, and imo it's also the wrong interface to
>>>>> possibly grant any permissions.
>>>>
>>>> Well, the domain is the caller.
>>>
>>> Granting permission to itself?
>>
>> See below in the previous email, the issue is not with the
>> permissions, which are correctly assigned from
>> dom0_setup_permissions(), but the usage of domain_pirq_to_irq() in
>> pirq_access_permitted() as called by XEN_DOMCTL_irq_permission.
>> There's no need to play with the permissions at all.
> Yes, the problem is pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0, so it failed.
> I am think that since the PVH doesn't use pirq, can we just skip this irq_permission check for PVH?

If not the pIRQ, then the real IRQ would need checking for permissions.
You won't get away without any checking at all, I'm afraid.

Jan

