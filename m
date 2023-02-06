Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20E68BFE8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490477.759187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2Ko-0006y8-Fz; Mon, 06 Feb 2023 14:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490477.759187; Mon, 06 Feb 2023 14:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2Ko-0006w1-Cv; Mon, 06 Feb 2023 14:19:06 +0000
Received: by outflank-mailman (input) for mailman id 490477;
 Mon, 06 Feb 2023 14:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP2Kn-0006vv-7L
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:19:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34ea4873-a629-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 15:19:03 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so10866430wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 06:19:03 -0800 (PST)
Received: from [192.168.1.93] (adsl-89.109.242.139.tellas.gr. [109.242.139.89])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002bfb7c2430bsm8910528wrx.19.2023.02.06.06.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:19:02 -0800 (PST)
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
X-Inumbo-ID: 34ea4873-a629-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X8iHri+YNuscdNIt1Fd45F0jYB6Ei8GSOqfqw55T6yw=;
        b=W3rCxP4jwjYs6Gt/4tRGj/g9AMk11qvxWqNuHivkLnkvLgSyD8wMVoC7SjKea5Zaqs
         Z2ENMT3ifwP+Tl4DiU8eb7MMS9yO3jpmZjoS0btLbfcslZPGjvrXwLcJAe47qJtOOXuQ
         ZmFOJ71kS4Od8Jl/YZpuiAxQ8VI4G5KEll0lLRpQwsEduy/t+w2Au8GzB7u3RB9CFAVV
         +WyGpJd1qwYrmn540SsxxNtf/aEdlgf4z/FS/CZA/caKXh9IoqpFmovSEjAqfw9Oaaxy
         IVfG+zj8cVfD1EQBqUzNpNncb34N5mkx81I3YXo6av7adCHiwxaecniLuZijBOM1xm+5
         OI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8iHri+YNuscdNIt1Fd45F0jYB6Ei8GSOqfqw55T6yw=;
        b=VmiLO4mIUXgbgk5r090xwIxqzzrRYGZxwYuuVUJkm+faEmfODwEYKp9k7ys5SWudX9
         GwhQRqvGxKwCBiF+PmoaKLPNbLPalG/eTQ0b+S5U4nI/TBcSTqppLN+Zbp9uWEKfrbPz
         BqcF1bGmIkfT2my/OwroI3V7Pv0btiLvDWFIpvWFA14Mf0TlFED9HZcbPt6FYS4Of3MF
         NUXxRRGROxfa1gcA5AD5v7DJ8VSWDkzSW+fhtMVKvQk4ep/x0lJr7lp6bPd/h62ypXed
         7cPVPNRFnu0zbGaxZwR9XoJsJNXKQjTMMxo73GSADkegJkv9WtN6T8EQKiKvlPVKXd32
         nDww==
X-Gm-Message-State: AO0yUKXfGod1XePJZa/yQj39hGHNFg+aftG92VfC/gthznQ7Tv//2N9W
	3ZF8p8gME1la3PCybIW3lsE=
X-Google-Smtp-Source: AK7set+vsTH4X6KNB+voWBBlc7R4yDV/0EDuEcoCFBc0kM7k65hXWcxjFgBUCSlAzrBI4a1yRnpOkQ==
X-Received: by 2002:a05:600c:2141:b0:3de:d52:2cd2 with SMTP id v1-20020a05600c214100b003de0d522cd2mr19191611wml.4.1675693142506;
        Mon, 06 Feb 2023 06:19:02 -0800 (PST)
Message-ID: <382c2db1-d18a-388f-3f52-6eef9b33212a@gmail.com>
Date: Mon, 6 Feb 2023 16:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230206125804.950528-1-burzalodowa@gmail.com>
 <59a9d75b-80fa-a5e7-f085-d9813a10eddf@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <59a9d75b-80fa-a5e7-f085-d9813a10eddf@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/6/23 15:32, Andrew Cooper wrote:
> On 06/02/2023 12:58 pm, Xenia Ragiadakou wrote:
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 270bc98195..6138dc0885 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -3011,6 +3011,10 @@ const struct hvm_function_table * __init start_vmx(void)
>>           setup_ept_dump();
>>       }
>>   
>> +    if ( cpu_has_vmx_virtualize_apic_accesses ||
>> +         cpu_has_vmx_virtualize_x2apic_mode )
> 
> x2apic_mode is definitely wrong here, but I think apic_accesses is too.

Why?

> The top of vmx_vlapic_msr_changed() is buggy too.
> 
> Right now, the hook is called unconditionally.  Given no adjustment in
> vmx_vlapic_msr_changed(), the new form (using an alternative) needs
> calling unconditionally too.

Ok, I will initialize it unconditionally when the vmx_function_table is 
defined.

> 
> Naming wise, Linux is fairly bogus too.  This should be
> hvm_update_vlapic_mode(), but I suspect the hook will disappear in due
> course.

I can change the name. I gave the same name for cross reference purposes.

> 
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
>> index 80e4565bd2..b690e2924c 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -786,6 +787,11 @@ static inline int hvm_pi_update_irte(const struct vcpu *v,
>>       return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
>>   }
>>   
>> +static inline void hvm_set_virtual_apic_mode(struct vcpu *v)
>> +{
>> +    alternative_vcall(hvm_funcs.set_virtual_apic_mode, v);
> 
> This has to be something like:
> 
> if ( hvm_funcs.set_virtual_apic_mode )
>      alternative_vcall(...)
> 
> Otherwise, Xen will BUG() every time an SVM guest modifies MSR_APIC_BASE.

Yes, that's true. I will fix it.

> 
> ~Andrew

-- 
Xenia

