Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B978C687F
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722415.1126341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FWX-0001NF-5p; Wed, 15 May 2024 14:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722415.1126341; Wed, 15 May 2024 14:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FWX-0001Li-2m; Wed, 15 May 2024 14:22:29 +0000
Received: by outflank-mailman (input) for mailman id 722415;
 Wed, 15 May 2024 14:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHxB=MS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7FWV-0001LJ-Gs
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:22:27 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d61b016-12c6-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 16:22:25 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso98427971fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 07:22:25 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351d21c8106sm284788f8f.60.2024.05.15.07.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 07:22:22 -0700 (PDT)
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
X-Inumbo-ID: 8d61b016-12c6-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715782945; x=1716387745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RtwMB00+s5qMmn/kqwmbEpnVdTHjnFeYVb3ciF6v32M=;
        b=KoGHTQJ4f2lSUimq4VVDewbC3msBWD4RJeB8FosAKEXYd1rhGeuvcVtY+ZgMAJrGCR
         uRDE8UtIt8Vgy9lHzlYe4qnt3y+bhQMUEahNo/KH4wlMVO1+7mDF7Ps4voroAt0oo9uF
         X7JTQY5uKgQdHxMQCw1RHYOJVY7VM39uYckWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715782945; x=1716387745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtwMB00+s5qMmn/kqwmbEpnVdTHjnFeYVb3ciF6v32M=;
        b=P7hf3JyiBjU2Lm2yo/f9llHLKXUYdZddo7fzSwrLg0/cD4hMfiZ0W+T5vopvPk6t7f
         Yx+DG012MI9+VHVciJg8foVxmrfgGP0aIEHcgZIf3uvokwXo6b7voS/oH68qd2DCRA4z
         r+56yvGkx1a45F3l6FPaT2XXoHLV38pi6uWzxBroSNC6bm9tX/Pc5pqHER8hwqKTPZtg
         QGIazyAph/ACtOh4FWK72Xzl+ZJBgyv8juJlrBFO4CP2EqOqxS3P+V9lyW/skzLRsBjQ
         d7awS5W1ePxMDAFRBqdCdFtg64Vqi8+hedmZFQ9nQHSqQRZgU0Vuj6MmdqAS30ws62No
         gxVw==
X-Gm-Message-State: AOJu0YxPjQp+LPdnekk7ULgYYrpV8NQLK3tfDlsF0DimSHbd37LJ8vND
	b8y7Ez1eZRi/SuSJ//RPus3BIlw1Wt/RVxMz+N/XHiZFjQH6C696/Xkl/0Q7ELw=
X-Google-Smtp-Source: AGHT+IGdRvyP7NWoa+ddjY6+WWxZOOgtzddKaEM9rI1w6GZ05qB3qUuyMqLILy1LLJNpKll5gBynow==
X-Received: by 2002:a05:651c:1542:b0:2de:7046:b8f8 with SMTP id 38308e7fff4ca-2e51fd2e6a8mr162451611fa.5.1715782943154;
        Wed, 15 May 2024 07:22:23 -0700 (PDT)
Message-ID: <4ddc5acc-fc7b-4ed6-8e63-412f34da00b2@citrix.com>
Date: Wed, 15 May 2024 15:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen crash in scheduler during cpu hotplug
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <41ae17df-fb06-40b3-a98a-02f6f495f169@citrix.com>
 <7553291c-f88d-49c7-a1bd-5f8dbd21fd2b@suse.com>
 <9fdbf8a1-56a6-4be3-96a0-fcded0382cf0@citrix.com>
 <6766f9f1-2ceb-42d8-8ddd-f98671106579@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6766f9f1-2ceb-42d8-8ddd-f98671106579@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/05/2024 2:38 pm, Jürgen Groß wrote:
> On 15.05.24 15:22, Andrew Cooper wrote:
>> On 15/05/2024 1:39 pm, Jan Beulich wrote:
>>> On 15.05.2024 13:58, Andrew Cooper wrote:
>>>> Just so it doesn't get lost.  In XenRT, we've found:
>>>>
>>>>> (XEN) ----[ Xen-4.19.0-1-d  x86_64  debug=y  Tainted:     H  ]----
>>>>> (XEN) CPU:    45
>>>>> (XEN) RIP:    e008:[<ffff82d040244cbf>]
>>>>> common/sched/credit.c#csched_load_balance+0x41/0x877
>>>>> (XEN) RFLAGS: 0000000000010092   CONTEXT: hypervisor
>>>>> (XEN) rax: ffff82d040981618   rbx: ffff82d040981618   rcx:
>>>>> 0000000000000000
>>>>> (XEN) rdx: 0000003ff68cd000   rsi: 000000000000002d   rdi:
>>>>> ffff83103723d450
>>>>> (XEN) rbp: ffff83207caa7d48   rsp: ffff83207caa7b98   r8:
>>>>> 0000000000000000
>>>>> (XEN) r9:  ffff831037253cf0   r10: ffff83103767c3f0   r11:
>>>>> 0000000000000009
>>>>> (XEN) r12: ffff831037237990   r13: ffff831037237990   r14:
>>>>> ffff831037253720
>>>>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4:
>>>>> 0000000000f526e0
>>>>> (XEN) cr3: 000000005bc2f000   cr2: 0000000000000010
>>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
>>>>> 0000000000000000
>>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>>> (XEN) Xen code around <ffff82d040244cbf>
>>>>> (common/sched/credit.c#csched_load_balance+0x41/0x877):
>>>>> (XEN)  48 8b 0c 10 48 8b 49 08 <48> 8b 79 10 48 89 bd b8 fe ff ff 49
>>>>> 8b 4e 28 48
>>>>> <snip>
>>>>> (XEN) Xen call trace:
>>>>> (XEN)    [<ffff82d040244cbf>] R
>>>>> common/sched/credit.c#csched_load_balance+0x41/0x877
>>> While this is of course pretty little information, I've still tried to
>>> decipher it, first noticing it's credit1 that's being used here. Once
>>> forcing csched_load_balance() non-inline (no idea why it is a separate
>>> function in your build), I can see a sufficiently matching pattern at
>>> approximately the same offset into the function. That's
>>>
>>>      const struct cpupool *c = get_sched_res(cpu)->cpupool;
>>>      ...
>>>      const cpumask_t *online = c->res_valid;
>>>      ...
>>>      BUG_ON(get_sched_res(cpu) != snext->unit->res);
>>>
>>> overlapping, with the crash being on the middle of the quoted lines.
>>> IOW the CPU pool is still NULL for this sched resource. Cc-ing
>>> Jürgen for possible clues ...
>>
>> We've seen it in 4.13, 4.17 and upstream, after Roger extended the
>> existing CPU hotplug testing to try and reproduce the MTRR watchdog
>> failure.  We've found yet another "no irq for handler" from this too.
>>
>> It's always a deference at NULL+0x10, somewhere within
>> csched_schedule().
>
> I think I've found the reason.
>
> In schedule_cpu_add() the cpupool and granularity are set only after
> releasing the scheduling lock. I think those must be inside the locked
> region.
>
> Can you give this one a try (not tested at all)?
>
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 0cb33831d2..babac7aad6 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3176,6 +3176,8 @@ int schedule_cpu_add(unsigned int cpu, struct
> cpupool *c)
>
>      sr->scheduler = new_ops;
>      sr->sched_priv = ppriv;
> +    sr->granularity = cpupool_get_granularity(c);
> +    sr->cpupool = c;
>
>      /*
>       * Reroute the lock to the per pCPU lock as /last/ thing. In fact,
> @@ -3188,8 +3190,6 @@ int schedule_cpu_add(unsigned int cpu, struct
> cpupool *c)
>      /* _Not_ pcpu_schedule_unlock(): schedule_lock has changed! */
>      spin_unlock_irqrestore(old_lock, flags);
>
> -    sr->granularity = cpupool_get_granularity(c);
> -    sr->cpupool = c;
>      /* The  cpu is added to a pool, trigger it to go pick up some
> work */
>      cpu_raise_softirq(cpu, SCHEDULE_SOFTIRQ);

This change seems to be standing up to the test, in a way that the
previous form very much didn't.

Thanks for the quick fix.

~Andrew

