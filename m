Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAAC96B0E7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789777.1199411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slj7r-0000L3-Pd; Wed, 04 Sep 2024 06:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789777.1199411; Wed, 04 Sep 2024 06:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slj7r-0000I7-MP; Wed, 04 Sep 2024 06:04:19 +0000
Received: by outflank-mailman (input) for mailman id 789777;
 Wed, 04 Sep 2024 06:04:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slj7q-0000I1-AC
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:04:18 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8487fcb1-6a83-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 08:04:17 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c3c3b63135so158419a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:04:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d6f16sm762929866b.150.2024.09.03.23.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:04:15 -0700 (PDT)
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
X-Inumbo-ID: 8487fcb1-6a83-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725429856; x=1726034656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=chX9gfk+IgMffBEcPO2RNPqwH70C+Lw+/O3YbIFzM+8=;
        b=gMqv8cTWfyF06ndiVSKJFwSbjRZX2qUMsccXTWBFC3xUpglUxQO0T1ONVppuMOF6pM
         fL8ILC4GUCqmRaYBVfes6a4/U+Ni1S9VDuf/MMn6pZlnxQvzbB4h6mWAEotYwoaNREU1
         GqXkwRv9OVj6hQMdoeqcwspKhOTv5GUvqpAQFdSYSPjRnqfG41R2r/s0kYhbE+wKUoU0
         ydmBz7yvosDhRGGpjXyF5t3lPBpkuZULLsbBnt6ZOpVyQkbzXYAOVMRV477tc7XYDAKF
         +wP1CUAHGj1IG29OtZn47F3Sy8PEeOidsrqw225+O9WIQCzkoWemsmgfm1lPCTPGo8xl
         ysUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725429856; x=1726034656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chX9gfk+IgMffBEcPO2RNPqwH70C+Lw+/O3YbIFzM+8=;
        b=wMQAsXP0JE4bRIvSOLEA3oMjNJc2A4kkxOMvDIm63NTGP83TgKhYJXMH7c4qI8sW0X
         5zWax+8oqgpt/X72G+OJUjyPh7ETh/1UezVmVw0ZDPRyBwHbQ89x1D8+qvJcTv3nxw5e
         enNMSLwxwPXQ6BNymc4Smzj/5QVI35tam5q3OBc9UI9P3tvaxYhVJWSFBRT4naWHmnT6
         hv1gxTTEp2tJ6pBUlanA8jbNio5aYptUYbzXru2BLhxJUlrfCOTt0FI9TaDaV51DUzJ3
         3kBFlRbwfDMIDdWdMy4Bdcagk4SknR+Y5rXW5/TeEOkqUFTlSCV4NWSQlC/UsRU5xO1V
         1G3A==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2KMiKII1Lbh17HHney8Ridvk1BJH0+mxUkFiNloeAZoWdAb0Ar0eduC1eau5urjU+50DNEWVqJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywg9mRcs4r2jdGNBmzZxym3VqsGjOO16nscyJx7Q5ZjMXtwxhsH
	cYRLyYKhQlSXfgaeRrswUNZpQNHTYZ9yRpGzOVi6jj68uugWKNjZ6LmIH6kUOg==
X-Google-Smtp-Source: AGHT+IHTlsySerKiWGuVLlT73zY0S0R9dWluXiriCMsO+twpSqiI0rpW429o54+NDOB/1bgLavMbbA==
X-Received: by 2002:a17:907:5087:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a8a32e7642dmr167634766b.26.1725429856239;
        Tue, 03 Sep 2024 23:04:16 -0700 (PDT)
Message-ID: <ea41eb5d-f8a1-4120-b5c1-70bdf02d8038@suse.com>
Date: Wed, 4 Sep 2024 08:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-3-Jiqian.Chen@amd.com>
 <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com>
 <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <905fe9ef-d311-4956-b862-49f2f588afcd@suse.com>
 <BL1PR12MB58492EE11D404B2E09DA0210E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b2b7b716-974c-4172-ba68-261453a96932@suse.com>
 <alpine.DEB.2.22.394.2409031839550.53815@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2409031839550.53815@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2024 03:43, Stefano Stabellini wrote:
> On Tue, 3 Sep 2024, Jan Beulich wrote:
>> On 03.09.2024 12:53, Chen, Jiqian wrote:
>>> On 2024/9/3 17:25, Jan Beulich wrote:
>>>> On 03.09.2024 09:58, Chen, Jiqian wrote:
>>>>> On 2024/9/3 15:42, Jan Beulich wrote:
>>>>>> On 03.09.2024 09:04, Jiqian Chen wrote:
>>>>>>> When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
>>>>>>> xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
>>>>>>> xc_physdev_map_pirq map a pirq for passthrough devices.
>>>>>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
>>>>>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
>>>>>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
>>>>>>> codes.
>>>>>>>
>>>>>>> But it is fine to map interrupts through pirq to a HVM domain whose
>>>>>>> XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
>>>>>>> reference interrupts and it is just the way for the device model to
>>>>>>> identify which interrupt should be mapped to which domain, however
>>>>>>> has_pirq() is just to check if HVM domains route interrupts from
>>>>>>> devices(emulated or passthrough) through event channel, so, the has_pirq()
>>>>>>> check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.
>>>>>>>
>>>>>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>>>>>> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
>>>>>>> interrupt of a passthrough device can be successfully mapped to pirq for domU.
>>>>>>
>>>>>> As before: When you talk about just Dom0, ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>>>>>> @@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>>      {
>>>>>>>      case PHYSDEVOP_map_pirq:
>>>>>>>      case PHYSDEVOP_unmap_pirq:
>>>>>>> +        break;
>>>>>>> +
>>>>>>>      case PHYSDEVOP_eoi:
>>>>>>>      case PHYSDEVOP_irq_status_query:
>>>>>>>      case PHYSDEVOP_get_free_pirq:
>>>>>>
>>>>>> ... that ought to match the code. IOW you've again lost why it is okay(ish)
>>>>>> (or even necessary) to also permit the op for non-Dom0 (e.g. a PVH stubdom).
>>>>>> Similarly imo Dom0 using this on itself wants discussing.
>>>>> Do you mean I need to talk about why permit this op for all HVM
>>>>
>>>> You don't need to invent reasons, but it needs making clear that wider than
>>>> necessary (for your purpose) exposure is at least not going to be a problem.
>>>>
>>>>> and  where can prevent PVH domain calling this for self-mapping, not only dom0?
>>>>
>>>> Aiui use on itself is limited to Dom0, so only that would need clarifying
>>>> (along the lines of the above, i.e. that/why it is not a problem). For
>>>> has_pirq() domains use on oneself was already permitted before.
>>>
>>> Changed commit message to below. Please check and that will be great helpful if you would show me how to modify it.
>>> {
>>> x86/pvh: Allow (un)map_pirq when dom0 is PVH
>>>
>>> Problem: when dom0 is PVH type and passthrough a device to HVM domU, Qemu
>>> code xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
>>> xc_physdev_map_pirq map a pirq for passthrough devices.
>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
>>> codes.
>>>
>>> To solve above problem, need to remove the chack has_pirq() for that
>>> situation(PHYSDEVOP_map_pirq is issued by dom0 for domUs). But without
>>> adding other restrictions, PHYSDEVOP_map_pirq will be allowed wider than
>>> what the problem need.
>>> So, clarify below:
>>>
>>> For HVM domUs whose XENFEAT_hvm_pirqs is not enabled,it is fine to map
>>> interrupts through pirq for them. Because pirq field is used as a way to
>>> reference interrupts and it is just the way for the device model to
>>> identify which interrupt should be mapped to which domain, however
>>> has_pirq() is just to check if HVM domains route interrupts from
>>> devices(emulated or passthrough) through event channel, so, remove
>>> has_pirq() check has no impact on HVM domUs.
>>>
>>> For PVH domUs that performs such an operation will fail at the check
>>> xsm_map_dedomain_pirq() in physdev_map-nirq().
>>>
>>> For PVH dom0, it uses vpci and doesn't use event channel, as above talks,
>>> it also has no impact.
>>> }
>>
>> This is better than what you had before, and I don't really fancy re-
>> writing the description effectively from scratch. So let's just go from
>> there. As to the "excess" permission for the sub-ops: The main thing I'm
>> after is that it be clarified that we're not going to introduce any
>> security issues here. That requires auditing the code, and merely saying
>> "also has no impact" is a little too little for my taste. For Dom0 an
>> argument may be that it is overly powerful already anyway, even if for
>> PVH we're a little more strict than for PV (I think).
> 
> Hi Jan, for clarity and to make this actionable, are you suggesting to
> clarify the commit message by adding wording around "Dom0 is overly
> powerful already anyway so it is OK so this is OK" ?

Yes, perhaps with "deemed" added. And text for DomU-s similarly extended,
as the pointing at the XSM check is presently incomplete (stubdom-s can
pass that check, after all, as can de-priv qemu running in Dom0).

Jan

