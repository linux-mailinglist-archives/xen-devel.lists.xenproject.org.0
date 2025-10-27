Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B705CC0D4DC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 12:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151530.1482063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLn5-0005aN-PV; Mon, 27 Oct 2025 11:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151530.1482063; Mon, 27 Oct 2025 11:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLn5-0005Yy-Mm; Mon, 27 Oct 2025 11:53:35 +0000
Received: by outflank-mailman (input) for mailman id 1151530;
 Mon, 27 Oct 2025 11:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDLn4-0005Yq-Ri
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 11:53:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 905a4a72-b32b-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 12:53:33 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so25337825e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 04:53:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4924a4sm134556335e9.7.2025.10.27.04.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:53:32 -0700 (PDT)
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
X-Inumbo-ID: 905a4a72-b32b-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761566013; x=1762170813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0hkePjppX1XIU6ikWgg8zRVcODJECRudaAgSviJjimA=;
        b=GyWol96Ra7MAv6+m61ndadGZkl8OTl+fNPGfW4G5nXTHMmU+/lY8XTJRauo2KxYvZr
         wb0AtTfEBotyJ6kzktvXUaK9a7y0Fmmrx8IJLuhx7pW9d33HPU5/jSl4zYuqdA2XWJal
         0byz7La/DgmrM9ls6f+GTFADcatDxHWM15WaUj+JPQLmGzzt0tQ4V5zyqVfGfkXhybjs
         bO1iWY/mrMWONnBhhsI92YnlTExTZ+dZokZ215ao7r7edhjxz0Y7vj+ib4bOOcD3+Fx/
         qpc9anyNtdabKxG2vu0kfhhaHwhKoyxkS2hglZj1aSMdEZO8gkmVp1WMF30nH0MHsKUV
         rDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566013; x=1762170813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hkePjppX1XIU6ikWgg8zRVcODJECRudaAgSviJjimA=;
        b=Zu+PF6MG5GATl2s7+dvEm+kviRc0/49dbdHr/fzsUD/GqvfOOk3qnBYiymUAcys6KO
         TYPGJYBfesxrrfsK67bVUi8sBFxbuUSbK1NJj0tSZjtNCmIWexhlb1DEu5pwOxD08gH+
         CIyirJRadY2qD7v/f3g+tvZUcrySxxixgxrtSwuxflGvIwc1+iI0Lhs0aUrUXfMGub6P
         35NVSibOMNENr0szgrejp7Pe+WxO6fsOo/hR7o/dV/GAbW3vKyFNoJBQ18h5v9dbLSgt
         VuEyWNbayNW5HVx+3zs/UFfsPex4tcClzfVqd7e0T4mmLq5jhgsLVRs0/+qOCj+l0FXy
         glrw==
X-Gm-Message-State: AOJu0YzVRmPtzSmj0eCqurmPCpC6wXmXeDberbkWkVHBJCRZ3p7S/Ztm
	88YFX7r76Zn6rKxlF+PAUvjnljM3s5WX0mVa5XWn5IyetKV6KH3LzTQIz2sszq8Ejw==
X-Gm-Gg: ASbGncspcXDj2HmHgL/u2EMk63LRCPPzLVIQy8eJYafOFTsZNhUEoKUhrZzzWsETnbe
	BTg88PIqPqTDauLM0BOhjTA7ivqV7DFM02Sl0q+TqVQMNLSnuMvVlaH1EuPZ3fr9V0I6EsVjtp1
	kjWHIiDQcwZSmufNG/JWgoxhrDs15kPjWkWEkOeySsS5LAcjDTmw7/rKkt1tx6jmAjInr6B2f+H
	zHn34PdpDU7VIBejvkSCztev0NGrjOnC6vhvgIJ2fOh4DyybxnsIJ+nLzIKpKtjJDFupLJ34wz1
	J6bN+w6mXxhf++d7QQE/HXZYA3+rETiR+xjdREbPPUvUYWWCGV7xh8U2U14Y8HG11x07yxSoksp
	wjDK8TYXfSsMgEZGd8VkAS6sMKkH4rlQg4tqVAHwuSRyjCBkqHPo2tP6iqvpbsUe8W6wD4KXr/L
	lcF4qR2T4Tpty1AZgI3aJRxftUdcZG4fgo3/0MtSxl9exNy/hGQbnHi4Cre1R2xAxf2jV8ov757
	vhohqWeCw==
X-Google-Smtp-Source: AGHT+IHJT/zOrXI4Z1S8JJ4uAmoe1sEdEDEyeLV1PSHzs1xbPwlo+O9+/8l5MedMa6LnSADEPY72ng==
X-Received: by 2002:a05:600c:4446:b0:471:1717:421 with SMTP id 5b1f17b1804b1-475d2ebf3e0mr95683925e9.19.1761566012911;
        Mon, 27 Oct 2025 04:53:32 -0700 (PDT)
Message-ID: <536c4e25-1e32-4adf-865d-7750f08a2922@suse.com>
Date: Mon, 27 Oct 2025 12:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <545d98e0-755d-471b-84c5-54f129a5aece@suse.com> <aPt-B5R-FwJpQbZR@Mac.lan>
 <6428217d-b5f6-4948-aff2-b007a6cfcfc0@suse.com> <aP9YkLo782XbfMQM@Mac.lan>
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
In-Reply-To: <aP9YkLo782XbfMQM@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.10.2025 12:33, Roger Pau Monné wrote:
> On Mon, Oct 27, 2025 at 11:23:58AM +0100, Jan Beulich wrote:
>> On 24.10.2025 15:24, Roger Pau Monné wrote:
>>> On Thu, Oct 23, 2025 at 05:50:17PM +0200, Jan Beulich wrote:
>>>> @@ -343,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
>>>>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>>>>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>>>>  
>>>> +    clear_irq_vector(ch->msi.irq);
>>>> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
>>>
>>> By passing cpu_online_map here, it leads to _bind_irq_vector() doing:
>>>
>>> cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);
>>>
>>> Which strictly speaking is wrong.  However this is just a cosmetic
>>> issue until the irq is used for the first time, at which point it will
>>> be assigned to a concrete CPU.
>>>
>>> You could do:
>>>
>>> cpumask_clear(desc->arch.cpu_mask);
>>> cpumask_set_cpu(cpumask_any(&cpu_online_map), desc->arch.cpu_mask);
>>>
>>> (Or equivalent)
>>>
>>> To assign the interrupt to a concrete CPU and reflex it on the
>>> cpu_mask after the bind_irq_vector() call, but I can live with it
>>> being like this.  I have patches to adjust _bind_irq_vector() myself,
>>> which I hope I will be able to post soon.
>>
>> Hmm, I wrongly memorized hpet_broadcast_init() as being pre-SMP-init only.
>> It has three call sites:
>> - mwait_idle_init(), called from cpuidle_presmp_init(),
>> - amd_cpuidle_init(), calling in only when invoked the very first time,
>>   which is again from cpuidle_presmp_init(),
>> - _disable_pit_irq(), called from the regular initcall disable_pit_irq().
>> I.e. for the latter you're right that the CPU mask is too broad (in only a
>> cosmetic way though). Would be you okay if I used cpumask_of(0) in place
>> of &cpu_online_map?
> 
> Using cpumask_of(0) would be OK, as the per-cpu vector_irq array will
> be updated ahead of assigning the interrupt to a CPU, and hence it
> doesn't need to be done for all possible online CPUs in
> _bind_irq_vector().
> 
> In the context here it would be more accurate to provide an empty CPU
> mask, as the interrupt is not yet targeting any CPU.  Using CPU 0
> would be a placeholder, which seems fine for the purpose.

Putting an empty mask there, while indeed logically correct, would (I fear)
again put us at risk with other code making various assumptions. I'll go
with cpumask_of(0).

>>>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>>>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>>>> @@ -551,6 +551,13 @@ int cf_check amd_iommu_msi_msg_update_ir
>>>>          for ( i = 1; i < nr; ++i )
>>>>              msi_desc[i].remap_index = msi_desc->remap_index + i;
>>>>          msg->data = data;
>>>> +        /*
>>>> +         * While the low address bits don't matter, "canonicalize" the address
>>>> +         * by zapping the bits that were transferred to the IRTE.  This way
>>>> +         * callers can check for there actually needing to be an update to
>>>> +         * wherever the address is put.
>>>> +         */
>>>> +        msg->address_lo &= ~(MSI_ADDR_DESTMODE_MASK | MSI_ADDR_DEST_ID_MASK);
>>>
>>> You might want to mention this change on the commit message also, as
>>> it could look unrelated to the rest of the code?
>>
>> I thought the comment here provided enough context and detail. I've added
>> "AMD interrupt remapping code so far didn't "return" a consistent MSI
>>  address when translating an MSI message. Clear respective fields there, to
>>  keep the respective assertion in set_channel_irq_affinity() from
>>  triggering."
> 
> LGTM, I would possibly remove the last "respective" for being
> repetitive given the previous one in the sentence.

Oh, indeed. Replaced it by "related" rather than dropping it completely.

Jan

