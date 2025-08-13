Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9415B24827
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 13:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079750.1440452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9Qi-000769-L1; Wed, 13 Aug 2025 11:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079750.1440452; Wed, 13 Aug 2025 11:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um9Qi-000739-Hs; Wed, 13 Aug 2025 11:14:04 +0000
Received: by outflank-mailman (input) for mailman id 1079750;
 Wed, 13 Aug 2025 11:14:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1um9Qg-000732-F0
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 11:14:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c7aafef-7836-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 13:13:59 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a0dc77a15so18128005e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 04:13:59 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a16dffb63sm26604115e9.29.2025.08.13.04.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 04:13:58 -0700 (PDT)
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
X-Inumbo-ID: 9c7aafef-7836-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755083639; x=1755688439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B8vSB0+rV6l3e8E3zeiWrsPZzISbuCZrZhYDht06bwE=;
        b=HNDhqrLx0ekRQU/HOU9fRKePcmW7afQHghzgx5FlDJN9dN1Uzxfes9p9AQbm4v6mG5
         ceB5IifT2T4cbTOi7DZ+CxGpiBwUuZDMhJ7lPh/HfSlGA6dQQp5ObGSQn5VBd4e/ue15
         +ZllS6qVWn6dViXkE8ft0pwmPRdkRV0nxaJlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755083639; x=1755688439;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8vSB0+rV6l3e8E3zeiWrsPZzISbuCZrZhYDht06bwE=;
        b=mo5NG7uxkTS9QnVLT0LDMhaKNNwKAZ/vmQb9TP1W9nI1B/79fD+ZBJf6qpxVZPFG4z
         lTiWVN/vDm7neyoUoqUaCtih/Hoc1v8MbGU/cYgDzRl0W5I8LX452+JpRRLPbF8+qMHC
         qCj0FsEiiezmPB2McgHn7BGKjPpLRjR3KGGjakokwylEK7/3+XC6RKfpsTWS5YQ7dAmC
         BP3q9Z+pZVOSnOHyX7hrlIlVvNL7OZPiS+1YNG6xP360IO98riHuOPGieT2YDGjaoLqY
         FsaFJKcrLjhT79p2ZYeBcWUxsUYo4E0xgWYAygFFUWdenSbpHElF9ftyFDZfFkIO3sqO
         H4mg==
X-Forwarded-Encrypted: i=1; AJvYcCWEpl83xtV2r1nN5/nJcx8o1ZvlLq4n5PtDe9Y3HWN9BMO939I6qP3A+4Ifb2wImlmVnSjynLF3niA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye8pfm6HuEZX81v+XZMcV3kRGePQbi3X+oE/DaczKr5MHB+mxl
	fDwQXbE7a/tUl0cSqAekhQGIorvRT9KUqSNlBGbCNXljf9xjwvdqhKcoiepQiCc93Hk=
X-Gm-Gg: ASbGnctIsex8Q4r0eGbCMxxGgyTvGydDkPI5Wf6FuBlLPUFlyMM0MzDvcMPGwaUm3Fb
	Oh1zAsf1bJsmsKxnj7XNTw2ODTtdISAG/eFZULoXKpZlgbU8uDxhkMnrIVcLa850qC28Avnbp8T
	ZC/ezFIPTh4wYLrflQl0qz45CvboDtSJqIrJURA1kkzigoJh7KoY387DtyHZ1C65UVd0gJf/73y
	n/XihdRVBS4+BsrJeov0DmHRJ+JFvnYFfEX4deoFJdEpPzIAiSqpo5mMqizEExpmgYIX3S3KiK2
	VGcI18nSYz/w7hMstQzKZuKif4DKdBE7DxjZAaP1/GF00E6EGGkUsDiATq5YOYQI14F7EL9DsCE
	0CX93UYdQTOoUB89TcIgguLeaMV+ofARLqGbddMIMisUBynCFlwVa3eC+sWMLJ3+4bGkt
X-Google-Smtp-Source: AGHT+IGxQbQqy849mubTXsKB3Pfv+vfUZfcS/adkGw5qp7AYPLsGsdIC/bXOICBe5fxIl835nHmEXA==
X-Received: by 2002:a05:600c:45c7:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45a165db0d1mr18842915e9.21.1755083639187;
        Wed, 13 Aug 2025 04:13:59 -0700 (PDT)
Message-ID: <3e590b78-b2ac-435d-98d7-89c39d6f731f@citrix.com>
Date: Wed, 13 Aug 2025 12:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 08/22] x86/traps: Introduce ap_early_traps_init() and set
 up exception handling earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-9-andrew.cooper3@citrix.com>
 <d6573487-14ed-4e1f-9525-b702048bb87e@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d6573487-14ed-4e1f-9525-b702048bb87e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 9:41 am, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>> @@ -63,6 +63,9 @@ LABEL(s3_resume)
>>          pushq   %rax
>>          lretq
>>  1:
>> +        /* Set up early exceptions and CET before entering C properly. */
>> +        call    ap_early_traps_init
> But this is the BSP?

By the end of the cleanup, what we have is:

At boot only:
 * really early init, basic exception handling only
 * regular init (inc syscall trampolines)
 * late re-init as we change the stack linear address

For everything else (APs, S3, hot-online):
 * early, full exception handling
 * regular init (inc syscall trampolines)


Currently, these are named:
 * bsp_early_traps_init()
 * traps_init()
 * bsp_traps_reinit()

and
 * ap_early_traps_init()
 * percpu_traps_init()


Perhaps ap_early_traps_init() should be named
percpu_early_traps_init()?  But I'm open to suggestions.

>
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -327,12 +327,7 @@ void asmlinkage start_secondary(void)
>>      struct cpu_info *info = get_cpu_info();
>>      unsigned int cpu = smp_processor_id();
>>  
>> -    /* Critical region without IDT or TSS.  Any fault is deadly! */
>> -
>> -    set_current(idle_vcpu[cpu]);
>> -    this_cpu(curr_vcpu) = idle_vcpu[cpu];
>>      rdmsrl(MSR_EFER, this_cpu(efer));
>> -    init_shadow_spec_ctrl_state(info);
>>  
>>      /*
>>       * Just as during early bootstrap, it is convenient here to disable
>> @@ -352,14 +347,6 @@ void asmlinkage start_secondary(void)
>>       */
>>      spin_debug_disable();
>>  
>> -    get_cpu_info()->use_pv_cr3 = false;
>> -    get_cpu_info()->xen_cr3 = 0;
>> -    get_cpu_info()->pv_cr3 = 0;
>> -
>> -    load_system_tables();
>> -
>> -    /* Full exception support from here on in. */
>> -
>>      if ( cpu_has_pks )
>>          wrpkrs_and_cache(0); /* Must be before setting CR4.PKS */
>>  
>> @@ -1064,8 +1051,12 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>>              goto out;
>>  
>>      info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
>> +    memset(info, 0, sizeof(*info));
> Why do we suddenly need this? Or is this just out of an abundance of
> caution (while making the individual ->*_cr3 writes unnecessary)?

cpu_alloc_stack() explicitly uses alloc_xenheap_pages() which uses
MEMF_no_scrub.  It will usually be zeroed memory because we allocate
them all at the start of day, but it also has a habbit of being 0xc2'd
when running under Xen.

Also yes, I do dislike the ad-hoc zeroes of misc fields.

>
>> +    init_shadow_spec_ctrl_state(info);
> May I suggest to move this further down a little, at least ...
>
>>      info->processor_id = cpu;
> ... past here? Just in case other values in the struct may be needed
> in the function at some point.

Ok.

>
>>      info->per_cpu_offset = __per_cpu_offset[cpu];
>> +    info->current_vcpu = idle_vcpu[cpu];
> To be able to spot this, I think it wants /* set_current() */ or some
> such.

Ok.

>
>> +    per_cpu(curr_vcpu, cpu) = idle_vcpu[cpu];
> It's a little odd to do this early (and remotely), but it looks all fine
> with how the variable is currently used.

It did take a little while for me to conclude that it is safe, but yes -
it does relax a lot of ordering constraints for AP bringup.

~Andrew


