Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F7A6AC8F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 18:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923064.1326780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvK8T-0006rb-27; Thu, 20 Mar 2025 17:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923064.1326780; Thu, 20 Mar 2025 17:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvK8S-0006pb-Ui; Thu, 20 Mar 2025 17:56:52 +0000
Received: by outflank-mailman (input) for mailman id 923064;
 Thu, 20 Mar 2025 17:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvK8S-0006pV-3z
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 17:56:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3540d00-05b4-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 18:56:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso8072635e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 10:56:51 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995a05sm223484f8f.8.2025.03.20.10.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 10:56:50 -0700 (PDT)
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
X-Inumbo-ID: b3540d00-05b4-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742493410; x=1743098210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7lqwUM+7/e/r6r0bFrbhk+qa14/YRuFpEkx3TyOU+n0=;
        b=lhNMI5anK/TyQpX150/iK7yu/uDMy9azudzJkgov72BrRQXrVzFWlyyilR8Q3kp3cs
         LjspJ3icjZYvCfyznLkIaFuEY0/NGWua6XkW99d1rYQcOMrMBVn0YaRx0URaregT9Fha
         GlWHc2AQwDasHw6vc7D9syq7eYZQ30q9EWqio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742493410; x=1743098210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lqwUM+7/e/r6r0bFrbhk+qa14/YRuFpEkx3TyOU+n0=;
        b=mjc8j/THJSkdbx7oDh5O/GxvtyQJc8wM7L/s9YtHc9LFf8rflvR+RblmjZah2jrWBA
         /UZfL6TtleKo5shTdxd2Ztg6dEhbQc+mtiLyDkEJzO3XAfQLyswSn4p/cVYTBDHxrneW
         zSO2mz3/HIJunaLDeFPfCZkoi8YclACmvHv8cAsn/1d+3OqTDK2JJKiP91QF3wbkc5V1
         qWz+ZNA088P5s79eBzVIYWInMs0LHpxObSBjRUKNfm0shLOEUK0c9fv+ppZQsDsC6L0j
         wzLOr0XsiN9reRgdHNh4BIVIk1ZYgDU3hyF+rcZ8ZG/q/MW8+lXOOIEqxFVPW6aCHm4R
         zA3w==
X-Forwarded-Encrypted: i=1; AJvYcCWHvx+zC85GNSCn2r3EaC09CcTvejXcNFKhAyQC8uqYVTS8u99ct9sTviffsyuVCR7zuLM92jR8Y1o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxO485j7G42hL7H308YhFEe+7KOYRd9WT0EKif0lWcbGc+arbUZ
	AkcJbUPDsfr7Myge+04PvvxPqy8Y2PRrjn+3B/xbXTEuxDU5qtzW8snM0r3rg68=
X-Gm-Gg: ASbGncuwFchu1aAb/MVudIg6zf08rREDtJg5DoFcmscAEh9l1p1mKJ3T2ndrW9kM5rC
	2m6mgAh47iGNgcxuF34h8cstbgzHHqJBoKXXyX9/lOy/XUr2uF9XMwg2bH1y/X9WepTUI32VSdi
	xesgks+AneUFyyfMPCgVzuJCV6iXwxNZYqdGoZBWrTUPQPOWqQEG+OvWUFCzulizw0HLtg0HU8o
	30md2jSlJEHP+Mbd7jok9ho8iH4lTZHx+ate+LYpatlFZn9WBbse68ZAT6Y24yRHhygAVoKUZkK
	ddM+37RVQMoEK23ldBJE8RLBcDxlGaCnemHKWYUe+z94JHRExr1OUDFdIg3EDH8YCQxOLxDFwaj
	5HaHsai/A3A==
X-Google-Smtp-Source: AGHT+IGzkzqatJRfgJN2p10GATn3G8JNBakYgGrsEXISnNqH5n2WKftg9tyGNraEjsK4dtqJ3yQrOA==
X-Received: by 2002:a5d:5f4b:0:b0:391:39fc:6664 with SMTP id ffacd0b85a97d-3997f8ffeb3mr456166f8f.6.1742493410420;
        Thu, 20 Mar 2025 10:56:50 -0700 (PDT)
Message-ID: <29d645e3-f8ae-4f55-8371-aa67da295ff8@citrix.com>
Date: Thu, 20 Mar 2025 17:56:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/traps: Introduce early_traps_init() and simplify
 setup
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-5-andrew.cooper3@citrix.com>
 <801007e0-2c02-48f8-856d-8f06eb698fb5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <801007e0-2c02-48f8-856d-8f06eb698fb5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 3:26 pm, Jan Beulich wrote:
> On 17.03.2025 20:20, Andrew Cooper wrote:
>> Something I overlooked when last cleaning up exception handling is that a TSS
>> is not necessary if IST isn't configured, and IST isn't necessary until we're
>> running guest code.
>>
>> Introduce early_traps_init() which is far more minimal than init_idt_traps();
>> bsp_ist[] is constructed without IST settings, so all early_traps_init() needs
>> to do is load the IDT, and invalidate TR/LDTR.
>>
>> Put the remaining logic into traps_init(), later on boot.  Note that
>> load_system_tables() already contains enable_each_ist(), so the call is simply
>> dropped.
>>
>> This removes some complexity prior to having exception support, and lays the
>> groundwork to not even allocate a TSS when using FRED.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Given the present state of thing:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> What worries me slightly is that ...
>
>> @@ -63,6 +88,13 @@ void __init traps_init(void)
>>      /* Replace early pagefault with real pagefault handler. */
>>      _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
>>  
>> +    this_cpu(idt) = bsp_idt;
>> +    this_cpu(gdt) = boot_gdt;
>> +    if ( IS_ENABLED(CONFIG_PV32) )
>> +        this_cpu(compat_gdt) = boot_compat_gdt;
> ... this being done later now requires more care with e.g. play_dead().

Hmm.  There are multiple things at play here.

load_system_tables() is the important one to defer, and when FRED is
active there really is no IDT.  However, when we're using IDT for early
handing, we probably ought to have the pointer set up.

So I think this block wants to move back early.  It's also used in NMI
crash shootdown too.

> Yet if and when needed, this setting up could of course be moved earlier
> again. It's not entirely clear to me why you specifically want it here
> and not in early_traps_init().

Because I was looking to not even set up an IDT when FRED is in use.

But as said, we probably want to set it up, and then invalidate it when
turning on FRED.

> The sole dependency is percpu_init_areas(),
> which runs - as even visible from patch context here - ahead of
> early_traps_init().

percpu_init_areas() isn't even a dependency.  Notice how it only starts
from CPU1.  CPU0 (which is what this_cpu() refers to in both of these
functions) is correct (i.e. 0) at build time.

I still intend to remove percpu_init_areas().  It's all build-time
constant; it just needs doing by the assembler, rather than the
compiler, as (-(long)__per_cpu_start) is not an integer constant expression.

~Andrew

