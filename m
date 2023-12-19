Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E77818956
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656856.1025349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFakJ-0002nZ-MJ; Tue, 19 Dec 2023 14:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656856.1025349; Tue, 19 Dec 2023 14:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFakJ-0002kH-IU; Tue, 19 Dec 2023 14:06:55 +0000
Received: by outflank-mailman (input) for mailman id 656856;
 Tue, 19 Dec 2023 14:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFakI-0002jq-1k
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:06:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbce36eb-9e77-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 15:06:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so45797325e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:06:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f6-20020adff446000000b0033657514fcfsm11288001wrp.88.2023.12.19.06.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 06:06:51 -0800 (PST)
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
X-Inumbo-ID: dbce36eb-9e77-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702994812; x=1703599612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gK8drYoHMPNTbT5vrrr+5foWIJYg2kqBWEQ3CCTVyaE=;
        b=VJgn6F/GSa/Wih/yhpvFqUNOUPlsMCZoWwwRnIRAlAz10JclCouzcsyVGZvM2OxyA7
         cNgA22SPbqTfgsfsCe0iCpaXKHP/VlkC5wvmHHApNLYhDuWdQhYKfK8vb6NKRVQJe6f1
         kRlPTRTOuGgikAMB8HGoqGtAEVaAF/xXvIFXd7yFIVItOQTDXc8qNtHcaVyDNQWuiqra
         Sejo5ekGOHEAyN93z1Q4Dr8pZ9TEVdiW6St4t2v14GJdXhgWMhfQQxsEU1/CekoYK3po
         eDqfpIUUTLeto50H6OZczCcs560or573pK8h2bczfa10AiIVI/IOT6IScLwOp925FN56
         05HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702994812; x=1703599612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gK8drYoHMPNTbT5vrrr+5foWIJYg2kqBWEQ3CCTVyaE=;
        b=MRwdFAkwNTShXMSDn2C7N0bocC1LKigs336SIIMez4BjmZJY1F/mtusmNLFAO8FC3Y
         lndrlqCW6LuHNHnUMLBAikhzHkPIn7Su/Z1Hwo+T/dS7W1NG7mdyrsK8D1zrZagCFVJj
         fDtUlqmie+S+SWpQLWwe86yPNK223Utj1Bve0BmsFL2wO/j1ITJx/qcnX5Gso7e4nYXj
         MX9v95j1Ss4O45BsoeJSBkwD0Vu/zmUEZyfujTGbqg8xzq0KwzYA53yYjLw+Va5mRHKP
         XEXyHEvmiM+uRV2FkvmiJ3Tay6v7o/yn6bjR39RXlebxt8D6HPyKpwqqP61YOfhNzNOS
         wBcQ==
X-Gm-Message-State: AOJu0YxjXjA22MwSz3ZaNd/R87LwY7/Hhn+YJPeb+zmPUpSd5+lkZSP4
	fU8VMMEo4h08vM4rh8bp8hpf
X-Google-Smtp-Source: AGHT+IGiHvZO42NOE7TqiiLT8Zdy9PoccWPQ5nfzYPjmA23n8frl0tvrps97wPdTcBYfKXzf2YcFVQ==
X-Received: by 2002:a05:600c:468d:b0:40c:31f1:1468 with SMTP id p13-20020a05600c468d00b0040c31f11468mr10329331wmo.165.1702994811656;
        Tue, 19 Dec 2023 06:06:51 -0800 (PST)
Message-ID: <aacaa220-3e95-4dff-9572-79f9e79faeae@suse.com>
Date: Tue, 19 Dec 2023 15:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com> <ZYCARJAxH9hBD0YQ@macbook>
 <6e022af1-d383-48be-ab54-6ec254aa1502@suse.com> <ZYGC8JaJ45tkbqQC@macbook>
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
In-Reply-To: <ZYGC8JaJ45tkbqQC@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2023 12:48, Roger Pau Monné wrote:
> On Tue, Dec 19, 2023 at 10:56:16AM +0100, Jan Beulich wrote:
>> On 18.12.2023 18:24, Roger Pau Monné wrote:
>>> On Tue, Feb 14, 2023 at 05:12:08PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/pv/domain.c
>>>> +++ b/xen/arch/x86/pv/domain.c
>>>> @@ -455,6 +455,7 @@ static void _toggle_guest_pt(struct vcpu
>>>>  void toggle_guest_mode(struct vcpu *v)
>>>>  {
>>>>      const struct domain *d = v->domain;
>>>> +    struct cpu_info *cpu_info = get_cpu_info();
>>>>      unsigned long gs_base;
>>>>  
>>>>      ASSERT(!is_pv_32bit_vcpu(v));
>>>> @@ -467,15 +468,21 @@ void toggle_guest_mode(struct vcpu *v)
>>>>      if ( v->arch.flags & TF_kernel_mode )
>>>>          v->arch.pv.gs_base_kernel = gs_base;
>>>>      else
>>>> +    {
>>>>          v->arch.pv.gs_base_user = gs_base;
>>>> +
>>>> +        if ( opt_ibpb_mode_switch &&
>>>> +             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
>>>> +             !VM_ASSIST(d, mode_switch_no_ibpb) )
>>>> +            cpu_info->spec_ctrl_flags |= SCF_new_pred_ctxt;
>>>
>>> Likewise similar to the remarks I've made before, if doing an IBPB on
>>> entry is enough to cover for the case here, it must also be fine to
>>> issue the IBPB right here, instead of deferring to return to guest
>>> context?
>>>
>>> The only concern would be (as you mentioned before) to avoid clearing
>>> valid Xen predictions, but I would rather see some figures about what
>>> effect the delaying to return to guest has vs issuing it right here.
>>
>> Part of the reason (aiui) to do things on the exit path was to
>> consolidate the context switch induced one and the user->kernel switch
>> one into the same place and mechanism.
> 
> Isn't it kind of a very specific case that we end up doing a
> user->kernel switch as part of a context switch?  IOW: would require
> the vCPU to be scheduled out at that very specific point.

No, there's no user->kernel switch at the same time as context switch.
What I was trying to explain is that with the actual IBPB being issued
on exit to guest, both the context switch path and the user->kernel
mode switch path set the same indicator, for the exit path to consume.

>>>> + *
>>>> + * By default (on affected and capable hardware) as a safety measure Xen,
>>>> + * to cover for the fact that guest-kernel and guest-user modes are both
>>>> + * running in ring 3 (and hence share prediction context), would issue a
>>>> + * barrier for user->kernel mode switches of PV guests.
>>>> + */
>>>> +#define VMASST_TYPE_mode_switch_no_ibpb  33
>>>
>>> Would it be possible to define the assist as
>>> VMASST_TYPE_mode_switch_ibpb and have it on when enabled?  So that the
>>> guest would disable it if unneeded?  IMO negated options are in
>>> general harder to understand.
>>
>> Negative options aren't nice, yes, but VM assists start out as all
>> clear.
> 
> Are you sure?  I see VMASST_TYPE_pae_extended_cr3 getting set in
> dom0_construct_pv() and that makes me wonder whether other bits
> couldn't start set also.
> 
> Maybe there's some restriction I'm missing, but I don't see any
> wording in the description of the interface that states that all
> assists are supposed to start disabled.

Well, that setting of pae_extended_cr3 is in response to the kernel's
notes section having a respective indicator. So we still only set the
bit in response to what the kernel's asking us to do, just that here
we carry out the request ahead of launching the kernel.

Also consider what would happen during migration if there was a
default-on assist: At the destination we can't know whether the
source simply didn't know of the bit, or whether the guest elected to
clear it.

Jan

