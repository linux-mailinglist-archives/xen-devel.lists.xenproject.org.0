Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E39694DD3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 18:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494778.764942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRcTk-0003N4-BE; Mon, 13 Feb 2023 17:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494778.764942; Mon, 13 Feb 2023 17:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRcTk-0003LM-8D; Mon, 13 Feb 2023 17:19:00 +0000
Received: by outflank-mailman (input) for mailman id 494778;
 Mon, 13 Feb 2023 17:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRcTj-0003L7-12
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 17:18:59 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f7957f8-abc2-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 18:18:57 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id n10so6700721ejc.4
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 09:18:57 -0800 (PST)
Received: from [192.168.1.93] (adsl-89.109.242.139.tellas.gr. [109.242.139.89])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906199600b0087bd629e9e4sm7071403ejd.179.2023.02.13.09.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:18:56 -0800 (PST)
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
X-Inumbo-ID: 7f7957f8-abc2-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RetJnbAkXuIXXMbuAB91Lo14JxtS+jzS2wxOg+0VJoE=;
        b=V8EeUz6rTIB1nirL8CXtJgjCW3ub5IYdkBtO+SlxTek47Mx2LZ3+74GPHC8gEhJQmM
         fAOeA0mYZo3b2iAgXFAlRYjiY2kdLo4rD9A4Lwn9rSFFFzxataFzIbBYsowRMNolr9IX
         VdTG5VszmWJHifRyoZRhCkCPtdXUaXUrIExZYPaTlfNBzy4avrJ/ROTJ073Jz6VauHdC
         TRa1yj9BqZaXuvamw1AIELeGhUdEaFOp5oMoJZSe8uE7Zi9cnPVTauXjwXClzARz8pbQ
         Y0LUYp2RCzOsafFhLFGlIKKZ6sBJT2TAo8M4Fht8+tB2luutq+IMWIKW8mYO+9dFjBeV
         i9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RetJnbAkXuIXXMbuAB91Lo14JxtS+jzS2wxOg+0VJoE=;
        b=TStIeHk0/gsevG5X6uSTeQ/xTi4eUkYs0noI4FIw7m/0hUG6N0Yz4Zc1Zw+oH9od4I
         NPLXniUlTEoPLn1E3wBM5PfYWt1/m2UKfeoOHuovl7/+eQdpE3wSFmFxAQ9qWi9qNmRQ
         eDkW8uQ5GIE/s+lQfXfKo//w9FOG8/8Aw1G/iNWzVADHEO+mDyqmxAe7c7jcCWry7+cs
         oOuY2r7Lj3nMpgC7xHrXICD27uxw/vDwHjIdFX6GXMbcMwIOG6ht1JlA68T1GTyDt8EN
         gk89+bJrGIvmQBdCtkeifxemXxy6qU4kFrkmuuqOU2TqeCBApk59RS3VjJEkPA0Xi7+V
         LaUQ==
X-Gm-Message-State: AO0yUKWAIx/3o+wXG12Aafx7wZq/naLF14OQeD2kJa2lV3KDnkoJKLND
	HnImcccLxDqyf6rQcyDDu38=
X-Google-Smtp-Source: AK7set+c0lKs4ZC91Oj6WTxdetARCvhy/B1YN9rC0n3zZEYCEvFBGPQrwl8cQKR6sIjOd1ozSy8XeQ==
X-Received: by 2002:a17:906:584:b0:888:6294:a1fa with SMTP id 4-20020a170906058400b008886294a1famr25338715ejn.14.1676308736678;
        Mon, 13 Feb 2023 09:18:56 -0800 (PST)
Message-ID: <27df9808-b206-7cbe-7075-f4b04d22b87b@gmail.com>
Date: Mon, 13 Feb 2023 19:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 02/10] x86/hvm: separate AMD-V and Intel VT-x
 hvm_function_table initializers
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-3-burzalodowa@gmail.com>
 <60b459c3-f81a-ecb4-35ff-76466a392db5@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <60b459c3-f81a-ecb4-35ff-76466a392db5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/13/23 18:47, Jan Beulich wrote:
> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -261,8 +261,16 @@ extern struct hvm_function_table hvm_funcs;
>>   extern bool_t hvm_enabled;
>>   extern s8 hvm_port80_allowed;
>>   
>> +#ifdef CONFIG_AMD_SVM
>>   extern const struct hvm_function_table *start_svm(void);
>> +#else
>> +static inline const struct hvm_function_table *start_svm(void) { return NULL; }
>> +#endif
>> +#ifdef CONFIG_INTEL_VMX
>>   extern const struct hvm_function_table *start_vmx(void);
>> +#else
>> +static inline const struct hvm_function_table *start_vmx(void) { return NULL; }
>> +#endif
>>   
>>   int hvm_domain_initialise(struct domain *d,
>>                             const struct xen_domctl_createdomain *config);
> 
> Instead of this (which I consider harder to read), may I suggest
> 
>      if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
>          fns = start_vmx();
>      else if ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )
>          fns = start_svm();
> 
> in hvm_enable() instead (with DCE taking care of removing the dead
> calls)?

Sure, it looks much better this way.

> 
> Jan

-- 
Xenia

