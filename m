Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39F80EA3F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652957.1019150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0nr-0001Wl-H4; Tue, 12 Dec 2023 11:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652957.1019150; Tue, 12 Dec 2023 11:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0nr-0001V5-E4; Tue, 12 Dec 2023 11:19:55 +0000
Received: by outflank-mailman (input) for mailman id 652957;
 Tue, 12 Dec 2023 11:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rD0nq-0001Uv-6B
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:19:54 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb59665-98e0-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 12:19:52 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-336221efdceso1560344f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 03:19:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w12-20020adfcd0c000000b003334010a849sm10541037wrm.109.2023.12.12.03.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 03:19:51 -0800 (PST)
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
X-Inumbo-ID: 5eb59665-98e0-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702379992; x=1702984792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwEjDc2CrhhCQ4rSnFOIHTRLclNv351PRw1yqQ6gOvc=;
        b=SsdJT+fzL3PbaBjEzicTqM0/YCVNhIvZ+bqaziKH9MKTohTvReyfOtbPpdbvjpuacJ
         d61NTAHeP4hPhEj1iLiDm//dTzqxbjbQzHCAF/P1WSJPbyXLaz5EjeH1ZcQ5bQp9hX2B
         eWMeNKeIQ3vu7m9Ks3/uNbH246HiZs+eikat6TRXkNIVWhzq7b2MuMcW1Hj2BJvFJ5Jv
         mKBRKJOJp89gddk3aENsehe2lNXlcHODB3I8bCNabTbuPMeQpxcIXjiGXzjsf3+TJDFo
         xjmhDJziHi2wdcI8oRiY1YT0elmIgWzaMm90o9rBI5VJxnEGLqQarFck3lgHDGL4DTVB
         bTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702379992; x=1702984792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwEjDc2CrhhCQ4rSnFOIHTRLclNv351PRw1yqQ6gOvc=;
        b=BD+gkK551U36RCVsZbW/Q4yRMAsOBo57rjRBghGN4PLyCM9V0zkUS1pBRhedsUVKuY
         0bpKky9yCw3XE/3hQ2pTN3nOOHqcQcnu+BJEWmC6HDtKKfy971U2RyJiLuseUjRAfhC4
         HLzBIl9bEVAOYV+2/L3L7O5JEJwe8f0usHrE3AVOI3FoTpHOxyVNOYSXZgG63U1olnb+
         AxgWxE1FIIZNkPAiVtNHEYl1PYlrSuK5ZvtJ54mkaf8JDIHzDFit0GZhchYZCOt7dGLf
         rT25GydwuiJyUimtf8dY6KjMRoIQMiLYl8eVTur7VO7AcRioBco7UEdOEE8B7WxYK1cB
         /+0g==
X-Gm-Message-State: AOJu0YxQysgVPg/+6x4TOxcR3AH68/aLhfDaio3+Iq6gX5Rqs5u28hnb
	+oynubyn9cHY4mLWLPBpKbt2
X-Google-Smtp-Source: AGHT+IGYmuHnHHwZdgS8cmc2M4RXLx4xGGviD6ncm+9+pbUeRvBRME7rh/XWp4ufVM9oE0BOeHwGZQ==
X-Received: by 2002:a05:6000:931:b0:333:3117:c48e with SMTP id cx17-20020a056000093100b003333117c48emr1212743wrb.287.1702379992016;
        Tue, 12 Dec 2023 03:19:52 -0800 (PST)
Message-ID: <c5d4e8a4-b286-4352-bf96-a67cb132b452@suse.com>
Date: Tue, 12 Dec 2023 12:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
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
References: <alpine.DEB.2.22.394.2312011857260.110490@ubuntu-linux-20-04-desktop>
 <ZW2ptexPQXrWBiOS@macbook>
 <alpine.DEB.2.22.394.2312041413000.110490@ubuntu-linux-20-04-desktop>
 <ZW7rDjjC0gxEI1cq@macbook> <15275706-5c31-4e29-aa29-9f5e90526219@suse.com>
 <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXculMdLgwGaRC7i@macbook>
 <BL1PR12MB584997DDE6839F2340022976E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXgeieg4E8UN0KoN@macbook> <50ca26a1-38e3-45fb-9c39-56e4d04de3e0@suse.com>
 <ZXhBb0Vt6gDuprHa@macbook>
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
In-Reply-To: <ZXhBb0Vt6gDuprHa@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2023 12:18, Roger Pau Monné wrote:
> On Tue, Dec 12, 2023 at 10:38:08AM +0100, Jan Beulich wrote:
>> (I think the Cc list is too long here, but then I don't know who to
>> keep and who to possibly drop.)
>>
>> On 12.12.2023 09:49, Roger Pau Monné wrote:
>>> On Tue, Dec 12, 2023 at 06:16:43AM +0000, Chen, Jiqian wrote:
>>>> On 2023/12/11 23:45, Roger Pau Monné wrote:
>>>>> On Wed, Dec 06, 2023 at 06:07:26AM +0000, Chen, Jiqian wrote:
>>>>>> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
>>>>>> +{
>>>>>> +       struct physdev_setup_gsi setup_gsi;
>>>>>> +
>>>>>> +       setup_gsi.gsi = gsi_info->gsi;
>>>>>> +       setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
>>>>>> +       setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
>>>>>> +
>>>>>> +       return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
>>>>>> +}
>>>>>
>>>>> Hm, why not simply call pcibios_enable_device() from pciback?  What
>>>> pcibios_enable_device had been called when using cmd "xl pci-assignable-add sbdf" from pciback. But it didn't do map_pirq and setup_gsi.
>>>> Because pcibios_enable_device-> pcibios_enable_irq-> __acpi_register_gsi(acpi_register_gsi_ioapic PVH specific)
>>>>> you are doing here using the hypercalls is a backdoor into what's done
>>>>> automatically by Xen on IO-APIC accesses by a PVH dom0.
>>>> But the gsi didn't be unmasked, and vioapic_hwdom_map_gsi is never called.
>>>> So, I think in pciback, if we can do what vioapic_hwdom_map_gsi does.
>>>>
>>>
>>> I see, it does setup the IO-APIC pin but doesn't unmask it, that's
>>> what I feared.
>>>
>>>>> It will be much more natural for the PVH dom0 model to simply use the
>>>>> native way to configure and unmask the IO-APIC pin, and that would
>>>>> correctly setup the triggering/polarity and bind it to dom0 without
>>>>> requiring the usage of any hypercalls.
>>>> Do you still prefer that I called unmask_irq in pcistub_init_device, as this v2 patch do?
>>>> But Thomas Gleixner think it is not suitable to export unmask_irq.
>>>
>>> Yeah, that wasn't good.
>>>
>>>>>
>>>>> Is that an issue since in that case the gsi will get mapped and bound
>>>>> to dom0?
>>>> Dom0 do map_pirq is to pass the check xc_domain_irq_permission()-> pirq_access_permitted(), 
>>>
>>> Can we see about finding another way to fix this check?
>>>
>>> One option would be granting permissions over the IRQ in
>>> PHYSDEVOP_setup_gsi?
>>
>> There's no domain available there, and imo it's also the wrong interface to
>> possibly grant any permissions.
> 
> Well, the domain is the caller.

Granting permission to itself?

Jan

