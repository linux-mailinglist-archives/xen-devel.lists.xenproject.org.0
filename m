Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459A90E745
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 11:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743592.1150511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrwS-0006Ym-Ae; Wed, 19 Jun 2024 09:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743592.1150511; Wed, 19 Jun 2024 09:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJrwS-0006WS-77; Wed, 19 Jun 2024 09:49:24 +0000
Received: by outflank-mailman (input) for mailman id 743592;
 Wed, 19 Jun 2024 09:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJrwR-0006WM-0N
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 09:49:23 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343c6228-2e21-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 11:49:21 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso60503111fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 02:49:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f85cb6bee6sm106183835ad.236.2024.06.19.02.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 02:49:20 -0700 (PDT)
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
X-Inumbo-ID: 343c6228-2e21-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718790561; x=1719395361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rtNnn8Ft8MQG02uPu91AUtrQJbjGZNviWikxdslEuSw=;
        b=fjHXoBlwCI5v9b193yMKXO8BzreMBUs2+ODi89ic9zlRSdqtxXcwq7yFooEB1pAJGD
         beHu1UJ4z0+E08xIZljuS8+/Vrkhz8uNb0FzdUPExGyWB4AXYg/FfTC7L0nDNmy4IDQV
         5zGbxX0JrgSOMI4AfUUV4Ljefgq1BMXIV7VcP8wDqeYNcRjmKCBn8ZT3gXdBW/UbA2DO
         apFWmHyUQJC2MHaOU64tuTnNzUYd5mE/V3URf555BprXxGZ0sigMrXypQtgGd0UGx+ze
         iqpZxNLSCpzvyhLc49H3GOLyLKnSuRlkYTS/3Q4LXW+guKCRT0Bad3Ssox9qRjr0GwSq
         QD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718790561; x=1719395361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtNnn8Ft8MQG02uPu91AUtrQJbjGZNviWikxdslEuSw=;
        b=vnVeytjCA/GGER3dm1ViBmWI+OtkvUCZqwNmxAE0nvxEGlkt4mQFRF8lZygmplqKSD
         Jof+6omrxUOI8oKzEJKlo+kmm6Md1bTU519Yd414WNrOrH+sPhUukNg9gwkUVm9NlRqF
         4M1bGYfR9a7wgXe8QtbQ8sqEMiMknYCeXxzI3WNcQQljtZC936cikZFkkIdEMeKsYoGx
         4KEVatqIFrKsuUxiqTzoWBE5tPyNSCUVmBffgFxtI7Nw8Xo1EBkvOGwQ9TdIkWds2ijQ
         zJyIqsnQ42F6La5m6mS5bgJH+Kc6AUOBdEKM055fnXbX+ZU446LIeIp62NCGu/vh4f90
         f5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/eJeZ3xFeXbNrzx3ZefcKAvjbe6GDT/EDkx9OD0cgB3rp0aG2LCtoKUTS0uoWWMwaWON2csyoi7XtGGCybLw8XZ4kEHZNBMAp9GSQtAw=
X-Gm-Message-State: AOJu0YyIHDQV7MfIhjAQa/nqmJjz+ya8IiuG96Cksa1OxzB2CMgJBJoi
	RKHq45ipQ4iwfxcVZmMJY/TvsnnQRWmJrxuSlnefXVxIkagaiWOH+NUyP2blww==
X-Google-Smtp-Source: AGHT+IGhjndnRL8ngkfd5kAuUGzqXE4sMNe7puxMBdwBG7LU3kH8sKLrNN3ZDqrjs/7fz0dsCQNSCw==
X-Received: by 2002:a2e:9eda:0:b0:2ec:1682:b4dc with SMTP id 38308e7fff4ca-2ec3ceb70d4mr13702861fa.10.1718790561158;
        Wed, 19 Jun 2024 02:49:21 -0700 (PDT)
Message-ID: <c83474d9-8c72-412a-92eb-222088a0bf3a@suse.com>
Date: Wed, 19 Jun 2024 11:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-4-Jiqian.Chen@amd.com>
 <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
 <BL1PR12MB5849FE3A4897DF166159B906E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b923a32e-3c22-4e7a-8844-b33322ef8ad1@suse.com>
 <BL1PR12MB5849861E424724C6E9DE3859E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ff66c7aa-585f-4d30-9f4f-e520226825bc@suse.com>
 <BL1PR12MB58498905D185C6A720276D1BE7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58498905D185C6A720276D1BE7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 10:51, Chen, Jiqian wrote:
> On 2024/6/19 16:06, Jan Beulich wrote:
>> On 19.06.2024 09:53, Chen, Jiqian wrote:
>>> On 2024/6/18 16:55, Jan Beulich wrote:
>>>> On 18.06.2024 08:57, Chen, Jiqian wrote:
>>>>> On 2024/6/17 22:52, Jan Beulich wrote:
>>>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>>>> The gsi of a passthrough device must be configured for it to be
>>>>>>> able to be mapped into a hvm domU.
>>>>>>> But When dom0 is PVH, the gsis don't get registered, it causes
>>>>>>> the info of apic, pin and irq not be added into irq_2_pin list,
>>>>>>> and the handler of irq_desc is not set, then when passthrough a
>>>>>>> device, setting ioapic affinity and vector will fail.
>>>>>>>
>>>>>>> To fix above problem, on Linux kernel side, a new code will
>>>>>>> need to call PHYSDEVOP_setup_gsi for passthrough devices to
>>>>>>> register gsi when dom0 is PVH.
>>>>>>>
>>>>>>> So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
>>>>>>> purpose.
>>>>>>>
>>>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>>>> ---
>>>>>>> The code link that will call this hypercall on linux kernel side is as follows:
>>>>>>> https://lore.kernel.org/xen-devel/20240607075109.126277-3-Jiqian.Chen@amd.com/
>>>>>>
>>>>>> One of my v9 comments was addressed, thanks. Repeating the other, unaddressed
>>>>>> one here:
>>>>>> "As to GSIs not being registered: If that's not a problem for Dom0's own
>>>>>>  operation, I think it'll also want/need explaining why what is sufficient for
>>>>>>  Dom0 alone isn't sufficient when pass-through comes into play."
>>>>> I have modified the commit message to describe why GSIs are not registered can cause passthrough not work, according to this v9 comment.
>>>>> " it causes the info of apic, pin and irq not be added into irq_2_pin list, and the handler of irq_desc is not set, then when passthrough a device, setting ioapic affinity and vector will fail."
>>>>> What description do you want me to add?
>>>>
>>>> What I'd first like to have clarification on (i.e. before putting it in
>>>> the description one way or another): How come Dom0 alone gets away fine
>>>> without making the call, yet for passthrough-to-DomU it's needed? Is it
>>>> perhaps that it just so happened that for Dom0 things have been working
>>>> on systems where it was tested, but the call should in principle have been
>>>> there in this case, too [1]? That (to me at least) would make quite a
>>>> difference for both this patch's description and us accepting it.
>>> Oh, I think I know what's your concern now. Thanks.
>>> First question, why gsi of device can work on PVH dom0:
>>> Because when probe a driver to a normal device, it will call linux kernel side:pci_device_probe-> request_threaded_irq-> irq_startup-> __unmask_ioapic-> io_apic_write, then trap into xen side hvmemul_do_io-> hvm_io_intercept-> hvm_process_io_intercept-> vioapic_write_indirect-> vioapic_hwdom_map_gsi-> mp_register_gsi. So that the gsi can be registered.
>>> Second question, why gsi of passthrough can't work on PVH dom0:
>>> Because when assign a device to be passthrough, it uses pciback to probe the device, and it calls pcistub_probe, but in all callstack of pcistub_probe, it doesn't unmask the gsi, and we can see on Xen side, the function vioapic_hwdom_map_gsi-> mp_register_gsi will be called only when the gsi is unmasked, so that the gsi can't work for passthrough device.
>>
>> And why exactly would the fake IRQ handler not be set up by pciback? Its
>> setting up ought to lead to those same IO-APIC RTE writes that Xen
>> intercepts.
> Because isr_on is not set, when xen_pcibk_control_isr is called, it will return due to " !dev_data->isr_on". So that fake IRQ handler aren't installed.

I'm afraid I don't follow you here. Quoting from the function:

	enable =  dev_data->enable_intx;

	/* Asked to disable, but ISR isn't runnig */
	if (!enable && !dev_data->isr_on)
		return;

I.e. we bail if the request was to _disable_ and there is no ISR.

I can't exclude though that command_write()'s logic to set ->enable_intx
is insufficient. But in the common case one would surely expect at least
one of PCI_COMMAND_MEMORY and PCI_COMMAND_IO to be set first by a guest.
IOW at some point I'd expect xen_pcibk_control_isr() to be called with
the second argument 0 and with ->enable_intx set.

> And it seems isr_on is set through driver sysfs " irq_handler_state" for a level device that is to be shared with guest and the IRQ is shared with the initial domain.

The sysfs interface is, according to my reading of the description
of the commit introducing it, merely for debugging / recovery purposes.
(It also looks to me as if this was partly broken: If one would use it,
thus clearing ->isr_on, a subsequent disable request would take exactly
that early bailing path quoted above, with nothing removing the IRQ
handler.)

That description also talks about both an edge vs level distinction in
behavior and one for shared vs non-shared, but neither in that commit
nor in present code I can spot any respective checks. Otherwise I could
understand that there are cases where the necessary information isn't
propagated to Xen.

Jan

