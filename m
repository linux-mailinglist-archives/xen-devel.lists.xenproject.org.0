Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7537A9EE8E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970510.1359184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MKZ-0007sO-H0; Mon, 28 Apr 2025 11:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970510.1359184; Mon, 28 Apr 2025 11:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MKZ-0007qv-Di; Mon, 28 Apr 2025 11:07:23 +0000
Received: by outflank-mailman (input) for mailman id 970510;
 Mon, 28 Apr 2025 11:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Olx=XO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9MKX-0007ql-8r
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:07:21 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f413b010-2420-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 13:07:20 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3570027f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:07:20 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46a54sm11031140f8f.67.2025.04.28.04.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:07:19 -0700 (PDT)
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
X-Inumbo-ID: f413b010-2420-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745838440; x=1746443240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3gM4It4SMK59v/8vza29ClPE0i0OYfYk8Sh8ifgnFdc=;
        b=VWBgjJr0OIhCsqyq89EMmxgfy5Pk4lSjh3AS4at2DzIogPcB//PkAm+zhY1yKVs+Dd
         hJntHRsrCuTx1VqvOmIl4F5pehd1kS+t3HiCYPtl+bDrbMMrmh9y4qmypCfA0pMmDLEA
         ADqjfY9BNNJ6cpZo94Z3iMMSWV64lFuLlvIYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838440; x=1746443240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gM4It4SMK59v/8vza29ClPE0i0OYfYk8Sh8ifgnFdc=;
        b=QMAXK2UBGfcmMzqkIrWm3zdiD/kDAkhvZqCk1h/6Lbf06qwHux2PFUUCEA/OtvYk/3
         8hwsx7aMnIZKjVymmKLAGbSJ3qqJcPTJKKFjjnA7oWqfmdgxu0m4srq+T1NW6dovHAAC
         UoH9lg/D5tG8Nl80pJ2C4YaBxONkEPWh/vYJgjslgt7mvEo9SMGEik/nqroMydfgY13E
         uek5rnTygFI/T9fXrvaAAGRuc5FYsMJjfZfWkwiVFpu5qzcpzcSrQIrku015x31lV1Q+
         mJrm/UDinEJV6GYzubAELkHO7GHAe9jIZRa7oOppJd+Vhg8vLDUkhsdSTq6cG4aTHj0F
         hshw==
X-Gm-Message-State: AOJu0YxY0WApPRIY5rsxM1roCelamUtuK+zwxCkCoERGRSGX4fJ3UCkX
	A+p4mkBRBaurzfCSmBpP3tYQfX115bIyITKfHcJbWQGYhDReUFPXC3JHt+gUumw=
X-Gm-Gg: ASbGncuRY8ADMzTKXPAqDcK0itLSdpW7K9d0vt/G7JyphOfk6NSE33Q9EG2gi72H7E6
	VjSbEFvAvVVkTCn/7+K43bX8/gAuWHkcbj8LKYdJheXMsb7H7JqVYXgAh4eNKo4xnowBEDpHt2Y
	+wWwlv4q+VPdTb692NWM0Q9KiWe8CvZikYW1CYdbGOpts0WVB0aZd2NyDVfs7iY/epc0G5wSZcG
	XI9GcNmc7KmVSDDbfYHMdCNs3MVNty4oMcZd5/XPuP6q3tLMkl09VaaSCWeSLiazntHxL5Uvn+d
	iIMDD4sX+RLpK5/aGAZed3AM8g8e62puN1YP+k+JalXwt2hgMmzmq5guI5clAK9Np5uu1VGc53d
	LdP8CDyO5wb//jvfO
X-Google-Smtp-Source: AGHT+IFMfCcKZRq59thsDM7q4TREyc/++JPCEcfXlS3WXiSZ8OBLVWbb3R2yLdSVNoCnf1Kl7dLpkQ==
X-Received: by 2002:a05:6000:4212:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-3a074e144a6mr8508007f8f.8.1745838439491;
        Mon, 28 Apr 2025 04:07:19 -0700 (PDT)
Message-ID: <97d28edb-4274-408f-a825-d09fa771e21d@citrix.com>
Date: Mon, 28 Apr 2025 12:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
To: Alejandro Vallejo <agarciav@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ariadne Conill <ariadne@ariadne.space>, Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Alexander M . Merritt"
 <alexander@edera.dev>
References: <20250425234331.65875-1-ariadne@ariadne.space>
 <aA9NMJVbyXeMOOY-@macbook.lan> <D9I7TPLT0EJD.3F5P95H69CT5K@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D9I7TPLT0EJD.3F5P95H69CT5K@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/04/2025 11:55 am, Alejandro Vallejo wrote:
> On Mon Apr 28, 2025 at 10:41 AM BST, Roger Pau Monné wrote:
>> On Fri, Apr 25, 2025 at 04:43:31PM -0700, Ariadne Conill wrote:
>>> Previously Xen placed the hypercall page at the highest possible MFN,
>>> but this caused problems on systems where there is more than 36 bits
>>> of physical address space.
>>>
>>> In general, it also seems unreliable to assume that the highest possible
>>> MFN is not already reserved for some other purpose.
>>>
>>> Changes from v1:
>>> - Continue to use fixmap infrastructure
>>> - Use panic in Hyper-V setup() function instead of returning -ENOMEM
>>>   on hypercall page allocation failure
>>>
>>> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
>>> Cc: Alejandro Vallejo <agarciav@amd.com>
>>> Cc: Alexander M. Merritt <alexander@edera.dev>
>>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>>> ---
>>>  xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
>>>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
>>>  2 files changed, 7 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
>>> index 6989af38f1..0305374a06 100644
>>> --- a/xen/arch/x86/guest/hyperv/hyperv.c
>>> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
>>> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>>>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>>>      if ( !hypercall_msr.enable )
>>>      {
>>> -        mfn = HV_HCALL_MFN;
>>> +        void *hcall_page = alloc_xenheap_page();
>>> +        if ( !hcall_page )
>>> +            panic("Hyper-V: Failed to allocate hypercall trampoline page");
>>> +
>>> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_page);
>> This likely wants to be a dprintk, and possibly also print the
>> physical address of the used page?  And no period at the end of the
>> sentence IMO.
>>
>> I think Xen might have used the last page in the physical address
>> range to prevent HyperV from possibly shattering a superpage in the
>> second stage translation page-tables if normal RAM was used?
>>
>> However I don't know whether HyperV will shatter super-pages if a
>> sub-page of it is used to contain the hypercall page (I don't think it
>> should?)
> I think it's quite unlikely.

It will shatter superpages.

The overlay is not part of guest memory, and will hide whatever is
behind it while it is mapped, which will force a 4k PTE in EPT/NPT.

Thinking about it, a better position would be adjacent to the APIC MMIO
window, so at 0xfee01000.  The APIC MMIO window is forced to be a 4k
mapping too, and the rest of the 2M window is normally empty.

~Andrew

