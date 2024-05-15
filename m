Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66D8C6783
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722361.1126222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EqM-0002IK-IC; Wed, 15 May 2024 13:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722361.1126222; Wed, 15 May 2024 13:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EqM-0002G1-Ee; Wed, 15 May 2024 13:38:54 +0000
Received: by outflank-mailman (input) for mailman id 722361;
 Wed, 15 May 2024 13:38:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8u5V=MS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s7EqL-0002Fo-HF
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:38:53 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f67b57-12c0-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:38:52 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e1baf0380so1985314a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:38:52 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea6586sm9063284a12.14.2024.05.15.06.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:38:51 -0700 (PDT)
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
X-Inumbo-ID: 77f67b57-12c0-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715780332; x=1716385132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IHLvH0jBQ36Nd1AJeKYFlGQwwOrZNPOSXcdtFh5fo0=;
        b=cf+Y3OmecZ8/nV55fkyz38u7H8aOImAAygZyBuzDT6C80dSFSlj8ueDvoVRYJHEH1V
         JAZ5hkLJvgMV3S45g24hLT6ZsNbOgsmv2C6vmIhk5ZqHKmyc0kvgUroQMHvfUwh3utIZ
         KL34Oar5nDRtwBQmys5P94uR9b5Ac0iabHQfLTV9Nca8+ERP6HjaMVqJVxHgULDBkoPk
         Eo3yzT3VBEpw6jBlbWoxUiA+HdiKYiNlSyvVreCx8YWSVOW6eOzV1rTqKHqjhvid+lH+
         0WJ8elYTeQDiflAwHwSBCwKe2nmgzU5MHRnjzJD5ErSfenyEIScWV/cs5PBMBL/7sO5y
         m4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780332; x=1716385132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IHLvH0jBQ36Nd1AJeKYFlGQwwOrZNPOSXcdtFh5fo0=;
        b=fgRXiZhHw8nPp2vG5hniar4ec8t9N5SVPnFqmadwXKnEkT2eFc/jI2o6b4SSLIySPn
         dOXiDYSEkCZ2ijY7P0bBpf5XDwRdiGxzWhFWCC5tCshpR2Uk6S1QqLUNh7IqShoqD4dK
         1wMQS0TzqJKOTaACzQGkPuAEUAP4/zKulFFBepLCpzCIQwNKKx1LBtBfWTyStlk3/J1t
         G/81yZ8pSN1xKpHS2E4qKAA7oXeJstu7UAu1COGnK7vtHv0XZymZQe5EG3+/+gTudOhi
         HKWhJgHYZmzb8fPqnnsfta5VggQIV/dhtSL0hAfpPqlWPioYDy5rRMprxcb0Y+JKzoU1
         seLA==
X-Gm-Message-State: AOJu0YzCPkGrUUN1pcGGtfWbtrlnOZ4i8AVCJNg95nbycaLPnR4OhzON
	eaGbc7I0EKJL7CeYhwbo8S4mCd90UjT7YWj9Mi9UVULszZ/PTDAlqSHXvPmNrx8=
X-Google-Smtp-Source: AGHT+IGOgXOmPffKTpU+z1Rl1VO+wY9OPMHGn9q9sNEJ9dvaC+U8AelZcxuPQDnZ4g+MNGa8/f5UAg==
X-Received: by 2002:a50:998e:0:b0:572:3cc4:2dcf with SMTP id 4fb4d7f45d1cf-5734d5be329mr12201843a12.14.1715780332150;
        Wed, 15 May 2024 06:38:52 -0700 (PDT)
Message-ID: <6766f9f1-2ceb-42d8-8ddd-f98671106579@suse.com>
Date: Wed, 15 May 2024 15:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen crash in scheduler during cpu hotplug
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <41ae17df-fb06-40b3-a98a-02f6f495f169@citrix.com>
 <7553291c-f88d-49c7-a1bd-5f8dbd21fd2b@suse.com>
 <9fdbf8a1-56a6-4be3-96a0-fcded0382cf0@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <9fdbf8a1-56a6-4be3-96a0-fcded0382cf0@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.05.24 15:22, Andrew Cooper wrote:
> On 15/05/2024 1:39 pm, Jan Beulich wrote:
>> On 15.05.2024 13:58, Andrew Cooper wrote:
>>> Just so it doesn't get lost.  In XenRT, we've found:
>>>
>>>> (XEN) ----[ Xen-4.19.0-1-d  x86_64  debug=y  Tainted:     H  ]----
>>>> (XEN) CPU:    45
>>>> (XEN) RIP:    e008:[<ffff82d040244cbf>]
>>>> common/sched/credit.c#csched_load_balance+0x41/0x877
>>>> (XEN) RFLAGS: 0000000000010092   CONTEXT: hypervisor
>>>> (XEN) rax: ffff82d040981618   rbx: ffff82d040981618   rcx:
>>>> 0000000000000000
>>>> (XEN) rdx: 0000003ff68cd000   rsi: 000000000000002d   rdi:
>>>> ffff83103723d450
>>>> (XEN) rbp: ffff83207caa7d48   rsp: ffff83207caa7b98   r8:
>>>> 0000000000000000
>>>> (XEN) r9:  ffff831037253cf0   r10: ffff83103767c3f0   r11:
>>>> 0000000000000009
>>>> (XEN) r12: ffff831037237990   r13: ffff831037237990   r14:
>>>> ffff831037253720
>>>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4:
>>>> 0000000000f526e0
>>>> (XEN) cr3: 000000005bc2f000   cr2: 0000000000000010
>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
>>>> 0000000000000000
>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>> (XEN) Xen code around <ffff82d040244cbf>
>>>> (common/sched/credit.c#csched_load_balance+0x41/0x877):
>>>> (XEN)  48 8b 0c 10 48 8b 49 08 <48> 8b 79 10 48 89 bd b8 fe ff ff 49
>>>> 8b 4e 28 48
>>>> <snip>
>>>> (XEN) Xen call trace:
>>>> (XEN)    [<ffff82d040244cbf>] R
>>>> common/sched/credit.c#csched_load_balance+0x41/0x877
>> While this is of course pretty little information, I've still tried to
>> decipher it, first noticing it's credit1 that's being used here. Once
>> forcing csched_load_balance() non-inline (no idea why it is a separate
>> function in your build), I can see a sufficiently matching pattern at
>> approximately the same offset into the function. That's
>>
>>      const struct cpupool *c = get_sched_res(cpu)->cpupool;
>>      ...
>>      const cpumask_t *online = c->res_valid;
>>      ...
>>      BUG_ON(get_sched_res(cpu) != snext->unit->res);
>>
>> overlapping, with the crash being on the middle of the quoted lines.
>> IOW the CPU pool is still NULL for this sched resource. Cc-ing
>> Jürgen for possible clues ...
> 
> We've seen it in 4.13, 4.17 and upstream, after Roger extended the
> existing CPU hotplug testing to try and reproduce the MTRR watchdog
> failure.  We've found yet another "no irq for handler" from this too.
> 
> It's always a deference at NULL+0x10, somewhere within csched_schedule().

I think I've found the reason.

In schedule_cpu_add() the cpupool and granularity are set only after
releasing the scheduling lock. I think those must be inside the locked
region.

Can you give this one a try (not tested at all)?

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 0cb33831d2..babac7aad6 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3176,6 +3176,8 @@ int schedule_cpu_add(unsigned int cpu, struct cpupool *c)

      sr->scheduler = new_ops;
      sr->sched_priv = ppriv;
+    sr->granularity = cpupool_get_granularity(c);
+    sr->cpupool = c;

      /*
       * Reroute the lock to the per pCPU lock as /last/ thing. In fact,
@@ -3188,8 +3190,6 @@ int schedule_cpu_add(unsigned int cpu, struct cpupool *c)
      /* _Not_ pcpu_schedule_unlock(): schedule_lock has changed! */
      spin_unlock_irqrestore(old_lock, flags);

-    sr->granularity = cpupool_get_granularity(c);
-    sr->cpupool = c;
      /* The  cpu is added to a pool, trigger it to go pick up some work */
      cpu_raise_softirq(cpu, SCHEDULE_SOFTIRQ);


Juergen


