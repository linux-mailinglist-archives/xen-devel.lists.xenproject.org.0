Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAE8D4F73
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 17:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732812.1138835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCi3Y-00050d-1g; Thu, 30 May 2024 15:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732812.1138835; Thu, 30 May 2024 15:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCi3X-0004xz-Ur; Thu, 30 May 2024 15:51:07 +0000
Received: by outflank-mailman (input) for mailman id 732812;
 Thu, 30 May 2024 15:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCi3W-0004xt-PM
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 15:51:06 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ab6d9e1-1e9c-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 17:51:02 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ea82db9a1fso12117171fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 08:51:02 -0700 (PDT)
Received: from ?IPV6:2003:ca:b724:491c:251a:48e:75b1:a320?
 (p200300cab724491c251a048e75b1a320.dip0.t-ipconnect.de.
 [2003:ca:b724:491c:251a:48e:75b1:a320])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578524bb86bsm9603759a12.97.2024.05.30.08.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 08:51:01 -0700 (PDT)
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
X-Inumbo-ID: 6ab6d9e1-1e9c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717084262; x=1717689062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M0mOBzAZp90VOVLlxifP8OSrPoz+pnEc2VAGr0EWOe0=;
        b=GuI+3bw7QlFyCP3BJJIp7fZ8lc3kAc5Z3CprMSCrh0J9ave0cPOSBDng+E2rA6IIkq
         EeZYJggjRO04bvZ3U45ZNrxfT3+fogtkXmP8KLGa7ms4FEIvIu3P7sDzpoTc4RuJwvJU
         cHa7P3nEFeloMBacj61BDpSUoPdAF6L+6Hcp7eFKAfMSl6jXzt594beYY5FU2+H8Y5YI
         zzz1QNa0pZmecgNGCofLBNNICiFwmVVwds5KhFWhdkvjaGUUZFKXnvhfmhsmH7OdDRRN
         ZcKtOqa17FDMIvI6Ndo4OwM2aS5G1zNSASuvVLEUCh2YsQcJQKQsRXNis1WxXyxWvdxU
         JLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717084262; x=1717689062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0mOBzAZp90VOVLlxifP8OSrPoz+pnEc2VAGr0EWOe0=;
        b=ZaP2YZ1Kto4myD7LPTSayhzS4kKd1cXlDnfjGbUTq0wMLH/DBVAOnxPFCfCave4xys
         hbMJA7eL592UFFgde4ZyTJUDLn2ACoensrh7OPNvyC3B7Ggk1Q+YzPqxQoUee140C0Ka
         5H4wsP/37PhMq/R9oK2ZajtxzIs8073RuHyn54IbRbOnJwGjbjVUdrEsLJ3AFAU9ES2c
         pYlfNC2/kTNome5RWZxGCqq+6pis1NmfcC427SofTg+F6QKFhFl0jE1XTipt0nx0+XJ1
         CEpv0GPOeQADJ/V3AcTkYfsCVeNclvWQK5JFAwkPa0/aheHfwTeh20DqcVnFzccSDzmy
         neUA==
X-Forwarded-Encrypted: i=1; AJvYcCWIideQaOJvSC/ZvJRgUCYH+J7iSzMqZumfK1yZnwCJfq63OomtYQFlbRgpia33S1Xk7U8DYLwAQQ8vk4y5pRgoGxcV5IatrCxQZcMiYcA=
X-Gm-Message-State: AOJu0YxoyHmuBOV1nuO8SV70O1H0hL/ju7iKeLQJKnokJQpt1B2ufEnH
	HWm4x/QAlLBA9nKwQXpxZ/WU4JrFchqDE/GE5Y1ZicRW1XRftndfZDDJRcfoGA==
X-Google-Smtp-Source: AGHT+IFZLpzoZIyXErnvVdHQSnEEyhOoh4f9oGCYrW7Xhi5VQzOGDXA9VB3dEVl9g4xK1LxTZfegZQ==
X-Received: by 2002:a2e:be23:0:b0:2ea:8217:214a with SMTP id 38308e7fff4ca-2ea84826aa3mr16438861fa.32.1717084262073;
        Thu, 30 May 2024 08:51:02 -0700 (PDT)
Message-ID: <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
Date: Thu, 30 May 2024 17:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2024 13:19, Chen, Jiqian wrote:
> On 2024/5/29 20:22, Jan Beulich wrote:
>> On 29.05.2024 13:13, Chen, Jiqian wrote:
>>> On 2024/5/29 15:10, Jan Beulich wrote:
>>>> On 29.05.2024 08:56, Chen, Jiqian wrote:
>>>>> On 2024/5/29 14:31, Jan Beulich wrote:
>>>>>> On 29.05.2024 04:41, Chen, Jiqian wrote:
>>>>>>> But I found in function init_irq_data:
>>>>>>>     for ( irq = 0; irq < nr_irqs_gsi; irq++ )
>>>>>>>     {
>>>>>>>         int rc;
>>>>>>>
>>>>>>>         desc = irq_to_desc(irq);
>>>>>>>         desc->irq = irq;
>>>>>>>
>>>>>>>         rc = init_one_irq_desc(desc);
>>>>>>>         if ( rc )
>>>>>>>             return rc;
>>>>>>>     }
>>>>>>> Does it mean that when irq < nr_irqs_gsi, the gsi and irq is a 1:1 mapping?
>>>>>>
>>>>>> No, as explained before. I also don't see how you would derive that from the code above.
>>>>> Because here set desc->irq = irq, and it seems there is no other place to change this desc->irq, so, gsi 1 is considered to irq 1.
>>>>
>>>> What are you taking this from? The loop bound isn't nr_gsis, and the iteration
>>>> variable isn't in GSI space either; it's in IRQ numbering space. In this loop
>>>> we're merely leveraging that every GSI has a corresponding IRQ;
>>>> there are no assumptions made about the mapping between the two. Afaics at least.
>>>>
>>>>>> "nr_irqs_gsi" describes what its name says: The number of
>>>>>> IRQs mapping to a (_some_) GSI. That's to tell them from the non-GSI (i.e.
>>>>>> mainly MSI) ones. There's no implication whatsoever on the IRQ <-> GSI
>>>>>> mapping.
>>>>>>
>>>>>>> What's more, when using PHYSDEVOP_setup_gsi, it calls mp_register_gsi,
>>>>>>> and in mp_register_gsi, it uses " desc = irq_to_desc(gsi); " to get irq_desc directly.
>>>>>>
>>>>>> Which may be wrong, while that wrong-ness may not have hit anyone in
>>>>>> practice (for reasons that would need working out).
>>>>>>
>>>>>>> Combining above, can we consider "gsi == irq" when irq < nr_irqs_gsi ?
>>>>>>
>>>>>> Again - no.
>>>>> Since you are certain that they are not equal, could you tell me where show they are not equal or where build their mappings,
>>>>> so that I can know how to do a conversion gsi from irq.
>>>>
>>>> I did point you at the ACPI Interrupt Source Override structure before.
>>>> We're parsing those in acpi_parse_int_src_ovr(), to give you a place to
>>>> start going from.
>>> Oh! I think I know.
>>> If I want to transform gsi to irq, I need to do below:
>>> 	int irq, entry, ioapic, pin;
>>>
>>> 	ioapic = mp_find_ioapic(gsi);
>>> 	pin = gsi - mp_ioapic_routing[ioapic].gsi_base;
>>> 	entry = find_irq_entry(ioapic, pin, mp_INT);
>>> 	irq = pin_2_irq(entry, ioapic, pin);
>>>
>>> Am I right?
>>
>> This looks plausible, yes.
> I dump all mpc_config_intsrc of array mp_irqs, it shows:
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 0 dstapic 33 dstirq 2
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 15 srcbus 0 srcbusirq 9 dstapic 33 dstirq 9
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 1 dstapic 33 dstirq 1
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 3 dstapic 33 dstirq 3
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 4 dstapic 33 dstirq 4
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 5 dstapic 33 dstirq 5
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 6 dstapic 33 dstirq 6
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 7 dstapic 33 dstirq 7
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 8 dstapic 33 dstirq 8
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 10 dstapic 33 dstirq 10
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 11 dstapic 33 dstirq 11
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 12 dstapic 33 dstirq 12
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 13 dstapic 33 dstirq 13
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 14 dstapic 33 dstirq 14
> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 15 dstapic 33 dstirq 15
> 
> It seems only Legacy irq and gsi[0:15] has a mapping in mp_irqs.
> Other gsi can be considered 1:1 mapping with irq? Or are there other places reflect the mapping between irq and gsi?

It may be uncommon to have overrides for higher GSIs, but I don't think ACPI
disallows that.

Jan

