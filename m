Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1F3B38445
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096163.1450954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGhR-0004Ym-16; Wed, 27 Aug 2025 14:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096163.1450954; Wed, 27 Aug 2025 14:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urGhQ-0004WH-UP; Wed, 27 Aug 2025 14:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1096163;
 Wed, 27 Aug 2025 14:00:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urGhO-00036L-VV
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:00:27 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e926872-834e-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 16:00:26 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afead3cf280so249204766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 07:00:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afec55faf24sm140687766b.82.2025.08.27.07.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 07:00:25 -0700 (PDT)
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
X-Inumbo-ID: 2e926872-834e-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756303225; x=1756908025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XxiPTxMIAftH6ubJZkEHfTwXxgMehWYMhpQEvzKk2pU=;
        b=EBEEdsiZ9a+GGkHxF1PeVWfT7kctoXJL2rwjnlZkRo+XPErPinJQ7WSJeQ3Dpwa7/e
         JTo1gin0G0g904JoIobmf/I7mTG3WMrnEHzsLaKVzu7LhkQwgArJiCXo6EFW0PvkmUR9
         cbXfnjepZWtOcWb6L/MT8ziDvh/1fM269hAL7UPXpIA2hwZxxJ4uvXIMcMmui2in9Yfj
         QYRQ0QQQv+T0xFmwXPeRXTSE55EocCuGwcsvY7nz1uc4EssOHYHHwL63RyvZB2l3k1gP
         KVyXmTcylKVADuObUDvbbBzvh5+QYbzbkTcgFEI9uBe7IqNbajaf5RshYAjulQ/E8dY0
         XDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303225; x=1756908025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxiPTxMIAftH6ubJZkEHfTwXxgMehWYMhpQEvzKk2pU=;
        b=azVTxBTfZnWEwK27L5LYs4qkcjJs4cQXfOL4OjwXC+22xMQWVNEdhwX+GWbrZHkdqh
         qCCCPryLgk0un12jlrEmOlOrIIK9jmImll2syKvvJ05b4u77+q6y5DKoJwH2bPTNMSFn
         l89hgUGx2TtM7EHe1ZGZUje4UDcDAzzRxG0ROmcGE2zV87rHvTpiAxKVloap9IH8dcBv
         3ZXWAhWGQgrCmCbDz2U35elVS8bB8h+4j4V7XAOUIKsy0kNOXvg7zMNF8Bnn7NGXCYJi
         5mks+qbmmJRDL3KuhPQlmNzTP/dvQFIDLACyREsm3uwGFk0P4xyO57hKm9doefJFj+UU
         RVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzMPkGzl57nUP0tKkUMMTO/TdSFFTr/d+I767lXIx12LFhBWb6wy3AFuq8VWle4jdkNP4fzD/s2IM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO3zXvBh4Az6BTjQIKVmI+PN8Xvrr/+EbURzWeiqkpLR5aWUar
	JYUYa9nYrQrahUiy9kZOSQ02ImKhEtgVSILw7TYh6y0CPSotsSSfTaapjkPMnT4MLA==
X-Gm-Gg: ASbGncvjJPacvKYatZCPEWIf4wVzdomFuoPGKSj1lvNCLAInxwNXwYRcvu2dXx+BS4B
	PR7oTOLkH/1w7lN70jUKWG7O4JHoPUYHUsvAA2X0LTfh1knA6DD5B818/AaBBQUGHX7GRO+bG9x
	7GuMFmryFZOGIIpAmwSct1VLCTZFxGm/57vm7HKSTeGluPfBhfy9Oa7yJQRjgZ+lrIF5L4NOzeh
	KHyuvc8fG5Ry7REc554BGIYKPY7zjb0/F84wp8ujecKNqBPWakAbbwYkOBYz2MFN/m5yJDKPGSy
	V7ftbkYCz3jH9JG+8KPNN0w/bvYelgr6MZ+UjIkmHKLwgeZcquLUEhuyawB84WlVBnXD6A/AiQx
	GW3Nnm4AW0R8t7xnzrKXWNPQRXkyKXnsvE4pk5wi2D4n0ELz4vxuBYs0pCM8NS5bd+MFWbPPP1z
	ohMAsMCCw=
X-Google-Smtp-Source: AGHT+IEGLQ2FHZJ8FZ8N3Qk6mpHSdFOPgJNkK6laLXvhdBoeocbUYz9p4dGYJlNwOtD8CpZ/L678Og==
X-Received: by 2002:a17:907:7f90:b0:afe:82ef:5433 with SMTP id a640c23a62f3a-afe82ef59a0mr1087393466b.10.1756303225397;
        Wed, 27 Aug 2025 07:00:25 -0700 (PDT)
Message-ID: <73e64580-6b67-4aac-8c87-d4d69662b72f@suse.com>
Date: Wed, 27 Aug 2025 16:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] xen/dom0less: store xenstore event channel in page
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250826210847.126015-1-jason.andryuk@amd.com>
 <20250826210847.126015-9-jason.andryuk@amd.com>
 <609d686e-a41c-47f4-9e5d-3733e9ec7723@suse.com>
 <efe407de-87e5-4434-a434-4d513b50f52c@amd.com>
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
In-Reply-To: <efe407de-87e5-4434-a434-4d513b50f52c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2025 15:19, Jason Andryuk wrote:
> On 2025-08-27 03:58, Jan Beulich wrote:
>> On 26.08.2025 23:08, Jason Andryuk wrote:
>>> --- a/xen/common/device-tree/dom0less-build.c
>>> +++ b/xen/common/device-tree/dom0less-build.c
>>> @@ -26,6 +26,7 @@
>>>   #include <public/event_channel.h>
>>>   #include <public/io/xs_wire.h>
>>>   
>>> +#include <asm/guest_access.h>
>>>   #include <asm/setup.h>
>>>   
>>>   #include <xen/static-memory.h>
>>> @@ -120,8 +121,14 @@ static void __init initialize_domU_xenstore(void)
>>>   
>>>           if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
>>>           {
>>> +            evtchn_port_t port = d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
>>> +            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
>>> +                offsetof(struct xenstore_domain_interface, evtchn_port);
>>> +
>>>               ASSERT(gfn < UINT32_MAX);
>>>               gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
>>> +            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, sizeof(port),
>>> +                                       true /* is_write */);
>>
>> Isn't the use of an arch-specific function going to pose yet another issue
>> for making this code usable on x86? Can't you use copy_to_guest_phys() here?
>> Which may in turn need to be passed in by the caller, see e.g. dtb_load()
>> and initrd_load() (i.e. cache flushing may also be necessary for Arm).
> 
> Yes, that could be done, but it's not my preferred approach.  Using a 
> function pointer to pass a compile time constant seems to me like a 
> misuse of a function pointer.
> 
> I'd rather each arch using dom0less define:
> unsigned long copy_to_guest_phys(struct domain *d,
>                                   paddr_t gpa,
>                                   void *buf,
>                                   unsigned int len);
> 
> Which does the correct thing for the arch.

That would be even better, just that I don't know whether Arm folks would
like it.

Jan

> Alejandro was able to re-work things to re-use the dom0less parsing code 
> (dom0less-bindings.c), but he has so far kept the x86 domain 
> construction separate such that it does not use dom0less-build.c.  So I 
> don't know how that will shake out.
> 
> But, yeah, I can just pass in a function pointer if that is what is 
> agreed upon.
> 
> Regards,
> Jason


