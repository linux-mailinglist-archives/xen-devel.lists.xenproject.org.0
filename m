Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10579698CD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 11:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788894.1198391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPmt-0006dh-Mx; Tue, 03 Sep 2024 09:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788894.1198391; Tue, 03 Sep 2024 09:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPmt-0006bb-KF; Tue, 03 Sep 2024 09:25:23 +0000
Received: by outflank-mailman (input) for mailman id 788894;
 Tue, 03 Sep 2024 09:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slPms-0006bV-MA
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 09:25:22 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 707bcd9d-69d6-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 11:25:20 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso56771265e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 02:25:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f62fsm659990566b.63.2024.09.03.02.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 02:25:19 -0700 (PDT)
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
X-Inumbo-ID: 707bcd9d-69d6-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725355520; x=1725960320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oMVbvCGuH5kbi12ivIc1bGL2T/SjnWn4O7fRSLt3KHk=;
        b=goxFtlnfi4eFSPP+6WPCIItpRnQ8hyaf9BbmwApXBQV9cbUAdCaPIuqntjQ6GZfYHf
         NC3d79aFzszppFA3Ke+8slo/WTiuYttevapgviL+w5qcfrkCbDQp3gdXDJ9ZluU/u5zf
         kxp264ZuF/pSHjBVQpOB82eAHnoPsU0MGJjBKuU9PEKbMNVLATMuBJ7e9uuAibrSSR8i
         wDUO1uvRVf5I1pHx3k6OJ+F7GtraT6Z2Z3wrdnekMilzkOA5j9dJGuVoOKSCGpmzEFmB
         568Ggvsf+f5ypZgCAY4QS4dOoAsplIeh3JBliUtzglYsn1OzVz6sVqHYwWYVzVsqOG61
         KAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355520; x=1725960320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMVbvCGuH5kbi12ivIc1bGL2T/SjnWn4O7fRSLt3KHk=;
        b=o4vfG5Gr5t0MzDZH1F9tzX86rcSHu8DO+vumEXNAXkXbTJIvvGVsTGKmhkT0xiLRUm
         OF3O1PoGtgGqXE6RTzzrhEQLcQDVLykqNBLmjxf215p6Rz761k7kaIbFWlVNHoOHlRsT
         WVE0W5ziI2cLe1iMqlLLIBnxbtXkcKurm9/i4zmgBcF7PAQpARpPALv/d88QXEYtznFC
         sSrmFkc8tAwoergwQHm33mAJooBKfm83oF6k8BDGQwrM2Ei8RNyTxYnP34ScFPVs84pi
         a9xQmSd8ciK9TC/MdnPVsmUl9XbHfAbK3O9wBaLp4C/HuGIcfib84zH5ZAHsBx0B319d
         +A2w==
X-Forwarded-Encrypted: i=1; AJvYcCV0fLIVS+K4Mp7uIm8uWkeIjigOfk3DBAVrISNSJP4EgsSuGGwlfYyp2cNQjjq8tAX7eBly2lRzzFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYee9Q6x4gtLkv1BataGvmuSV9yqweZN7wkJLYl3ALNplaopFc
	9VY/tl+kedr5tycySL8S8IOy5VZM8BPkgwnJNdCQs+4l/WU3eLs76X7Wyo5umA==
X-Google-Smtp-Source: AGHT+IGt10U+YCc9mq0Gi+/N8AMlN+N0FrI5f07T+2C1h23S1amopMEAgmEIhBJXo3OjiFEpdNL0Ng==
X-Received: by 2002:a5d:48c8:0:b0:374:ccb2:f2cd with SMTP id ffacd0b85a97d-374ccb2f32dmr3222916f8f.60.1725355519655;
        Tue, 03 Sep 2024 02:25:19 -0700 (PDT)
Message-ID: <905fe9ef-d311-4956-b862-49f2f588afcd@suse.com>
Date: Tue, 3 Sep 2024 11:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-3-Jiqian.Chen@amd.com>
 <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com>
 <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 09:58, Chen, Jiqian wrote:
> On 2024/9/3 15:42, Jan Beulich wrote:
>> On 03.09.2024 09:04, Jiqian Chen wrote:
>>> When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
>>> xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
>>> xc_physdev_map_pirq map a pirq for passthrough devices.
>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
>>> codes.
>>>
>>> But it is fine to map interrupts through pirq to a HVM domain whose
>>> XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
>>> reference interrupts and it is just the way for the device model to
>>> identify which interrupt should be mapped to which domain, however
>>> has_pirq() is just to check if HVM domains route interrupts from
>>> devices(emulated or passthrough) through event channel, so, the has_pirq()
>>> check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.
>>>
>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
>>> interrupt of a passthrough device can be successfully mapped to pirq for domU.
>>
>> As before: When you talk about just Dom0, ...
>>
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      {
>>>      case PHYSDEVOP_map_pirq:
>>>      case PHYSDEVOP_unmap_pirq:
>>> +        break;
>>> +
>>>      case PHYSDEVOP_eoi:
>>>      case PHYSDEVOP_irq_status_query:
>>>      case PHYSDEVOP_get_free_pirq:
>>
>> ... that ought to match the code. IOW you've again lost why it is okay(ish)
>> (or even necessary) to also permit the op for non-Dom0 (e.g. a PVH stubdom).
>> Similarly imo Dom0 using this on itself wants discussing.
> Do you mean I need to talk about why permit this op for all HVM

You don't need to invent reasons, but it needs making clear that wider than
necessary (for your purpose) exposure is at least not going to be a problem.

> and  where can prevent PVH domain calling this for self-mapping, not only dom0?

Aiui use on itself is limited to Dom0, so only that would need clarifying
(along the lines of the above, i.e. that/why it is not a problem). For
has_pirq() domains use on oneself was already permitted before.

Jan

