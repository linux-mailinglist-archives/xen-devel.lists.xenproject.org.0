Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858DBA650D5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 14:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916881.1321892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAWu-0001WZ-RA; Mon, 17 Mar 2025 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916881.1321892; Mon, 17 Mar 2025 13:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAWu-0001TT-Ns; Mon, 17 Mar 2025 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 916881;
 Mon, 17 Mar 2025 13:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuAWu-0001TM-1I
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 13:29:20 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1dff809-0333-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 14:29:14 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39127512371so2689542f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 06:29:14 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe065b0sm104385395e9.14.2025.03.17.06.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:29:13 -0700 (PDT)
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
X-Inumbo-ID: d1dff809-0333-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742218154; x=1742822954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hStTkF7j2otea7P+xm7CmRMLUm81O+hHPxrJVVQiLl4=;
        b=FNBpFk0GRDBp5Rt8KBDttqvbaSmxfpO82Ma5hMxd7rt1JDhAxBBarxtnZOOOUBwFtY
         udoZqvsVoXTteYgz5ywSyNbMYAveYAeI+pdcETWQSRalWfPaHX2+eKkkb3V307HM29Kj
         MOHrZlCiEGIzSJGlq5ONk7NBpNdA3L26bA1Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742218154; x=1742822954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hStTkF7j2otea7P+xm7CmRMLUm81O+hHPxrJVVQiLl4=;
        b=FPKt0jed51amuuUmq1lgjzzHNkOedzQL5Ka2cmRIILtZynicvqrr773HCCkzBF0HNi
         KpNYAD+LZ1AMGYAyK7WGcp2p8VyvGZDWyLIfZkiTj9zJ8mI8psi8G+B1h0JgMhnMW44J
         Ryy6STcGkDrMNgAEy2KFINQrC31MULIVgq3umLbJTTzsZ+zpmgwexwPBjVpdv+yUqntM
         DlR8NHw+XoXk8ojTg4/WtIRcwvpwyIScBYvVDWV109OoKNMtfrr3gHAANIXzRwjHWFi/
         X99kowZXjQLAJxp0AZ8NeYej6HCk0JrzlIGsl+E6imojq13c9fmaEgIOHAatbsNaoUZI
         Zntg==
X-Forwarded-Encrypted: i=1; AJvYcCVzMVgIW9E7QBnjGFtPWwJqYDoUpnEdmNuCgVMGr4d60limfeFXS+Ah2r5atIWaJoPWDab2UckxYWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOpaw9wAAMiEqGL03WWAnHgY8d4XTDZLdTMJptgJqpnjwFJNOy
	95mSNmXP8k2kaBNCnJVRuFatgTq9SM+8Rl1RXn5zJyo4GFavyFgYWMM/KCWhrYU=
X-Gm-Gg: ASbGncslB5AroIedRY7KOpFM8U5VtbjmDGjswckG8jmtmGi2ZyGCbWSeQGN6i673kXN
	apd4ivGM+NiHiEtn0angd87iMd7HV7Hcju1PynZ7Lk5N6Q/vuVqgQOwvcCaBkfKVYLkoCe3+jOJ
	kskLOUmtjsroZ4RSAihYZTPbGHPMOaEkt2KpRr4seXbzUT3jWLAAEbRIIHZBb55WQpxNqtbJddW
	O0S7CJeyNyLi1GQM+wMF8XcMG+QUoqubAK8yjZ+ARrqXy1LymVeoVwXWuSS2KurCSpQAp/hPMCS
	d5lJgAn/5PjUcALgUynMSiQU7Xkjn5/z5VqaI0mU44mtFghUxuh+yI7IfGrOjOCJZ7QJC/YNk5q
	h2x1MJyR2
X-Google-Smtp-Source: AGHT+IGcZ2MjuHGarvTM76iqT8zzZB/enpembMVjcg1YGOPPpK9NDPJyTuwSTMckHhhZ52Gai1fZ6A==
X-Received: by 2002:a05:6000:2aa:b0:390:f400:2083 with SMTP id ffacd0b85a97d-3971a2a2ba7mr15686698f8f.0.1742218154269;
        Mon, 17 Mar 2025 06:29:14 -0700 (PDT)
Message-ID: <ddc56efc-5f18-45db-85c2-1749e8ef715a@citrix.com>
Date: Mon, 17 Mar 2025 13:29:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen panic when shutting down ARINC653 cpupool
To: "Choi, Anderson" <Anderson.Choi@boeing.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
References: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <fd4fe44c-6c8d-402c-8b0f-466cf596f8af@suse.com>
 <BN0P110MB21482540CB855953D54BAB1090DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <BN0P110MB21482540CB855953D54BAB1090DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 1:21 pm, Choi, Anderson wrote:
> Jürgen,
>
>> On 17.03.25 06:07, Choi, Anderson wrote:
>>> I'd like to report xen panic when shutting down an ARINC653 domain 
>>> with the following setup. Note that this is only observed when 
>>> CONFIG_DEBUG is enabled.
>>>
>>> [Test environment]
>>> Yocto release : 5.05
>>> Xen release : 4.19 (hash = 026c9fa29716b0ff0f8b7c687908e71ba29cf239)
>>> Target machine : QEMU ARM64
>>> Number of physical CPUs : 4
>>>
>>> [Xen config]
>>> CONFIG_DEBUG = y
>>>
>>> [CPU pool configuration files]
>>> cpupool_arinc0.cfg
>>> - name= "Pool-arinc0"
>>> - sched="arinc653"
>>> - cpus=["2"]
>>>
>>> [Domain configuration file]
>>> dom1.cfg
>>> - vcpus = 1
>>> - pool = "Pool-arinc0"
>>>
>>> $ xl cpupool-cpu-remove Pool-0 2
>>> $ xl cpupool-create -f cpupool_arinc0.cfg $ xl create dom1.cfg $ 
>>> a653_sched -P Pool-arinc0 dom1:100
>>>
>>> ** Wait for DOM1 to complete boot.**
>>>
>>> $ xl shutdown dom1
>>>
>>> [xen log] root@boeing-linux-ref:~# xl shutdown dom1 Shutting down 
>>> domain 1 root@boeing-linux-ref:~# (XEN) Assertion '!in_irq() &&
>>> (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at
>>> common/xmalloc_tlsf.c:714 (XEN) ----[ Xen-4.19.1-pre  arm64  debug=y 
>>> Tainted: I      ]---- (XEN) CPU:    2 (XEN) PC:     00000a000022d2b0
>>> xfree+0x130/0x1a4 (XEN) LR:     00000a000022d2a4 (XEN) SP:    
>>> 00008000fff77b50 (XEN) CPSR:   00000000200002c9 MODE:64-bit EL2h
>>> (Hypervisor, handler) ... (XEN) Xen call trace: (XEN)   
>>> [<00000a000022d2b0>] xfree+0x130/0x1a4 (PC) (XEN)   
>>> [<00000a000022d2a4>] xfree+0x124/0x1a4 (LR) (XEN)   
>>> [<00000a00002321f0>] arinc653.c#a653sched_free_udata+0x50/0xc4 (XEN)   
>>> [<00000a0000241bc0>] core.c#sched_move_domain_cleanup+0x5c/0x80 (XEN)  
>>>  [<00000a0000245328>] sched_move_domain+0x69c/0x70c (XEN)   
>>> [<00000a000022f840>] cpupool.c#cpupool_move_domain_locked+0x38/0x70
>>> (XEN)    [<00000a0000230f20>] cpupool_move_domain+0x34/0x54 (XEN)   
>>> [<00000a0000206c40>] domain_kill+0xc0/0x15c (XEN)   
>>> [<00000a000022e0d4>] do_domctl+0x904/0x12ec (XEN)   
>>> [<00000a0000277a1c>] traps.c#do_trap_hypercall+0x1f4/0x288 (XEN)   
>>> [<00000a0000279018>] do_trap_guest_sync+0x448/0x63c (XEN)   
>>> [<00000a0000262c80>] entry.o#guest_sync_slowpath+0xa8/0xd8 (XEN) 
>>> (XEN)
>>> (XEN) **************************************** (XEN) Panic on CPU 2:
>>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
>>> num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:714 (XEN)
>>> ****************************************
>>>
>>> In commit 19049f8d (sched: fix locking in a653sched_free_vdata()), 
>>> locking
>> was introduced to prevent a race against the list manipulation but 
>> leads to assertion failure when the ARINC 653 domain is shutdown.
>>> I think this can be fixed by calling xfree() after
>>> spin_unlock_irqrestore() as shown below.
>>>
>>> xen/common/sched/arinc653.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-) diff --git 
>>> a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c index 
>>> 7bf288264c..1615f1bc46 100644
>>> --- a/xen/common/sched/arinc653.c
>>> +++ b/xen/common/sched/arinc653.c
>>> @@ -463,10 +463,11 @@ a653sched_free_udata(const struct scheduler 
>>> *ops,
>> void *priv)
>>>       if ( !is_idle_unit(av->unit) )
>>>           list_del(&av->list);
>>> -    xfree(av);
>>>       update_schedule_units(ops);
>>>       
>>>       spin_unlock_irqrestore(&sched_priv->lock, flags);
>>> +
>>> +    xfree(av);
>>>   }
>>> Can I hear your opinion on this?
>> Yes, this seems the right way to fix the issue.
>>
>> Could you please send a proper patch (please have a look at [1] in 
>> case you are unsure how a proper patch should look like)?
>>
>> Juergen
>>
>> [1]
>> http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/process/sending
>> -
>> patches.pandoc
> Thanks for your opinion. Let me read through the link and submit the patch.

Other good references are:

https://lore.kernel.org/xen-devel/20250313093157.30450-1-jgross@suse.com/
https://lore.kernel.org/xen-devel/d8c08c22-ee70-4c06-8fcd-ad44fc0dc58f@suse.com/

One you hopefully recognise, and the other is another bugfix to ARINC
noticed by the Coverity run over the weekend.

~Andrew

