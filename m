Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822B28D4BE2
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 14:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732703.1138735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCf9n-0002Qx-Gv; Thu, 30 May 2024 12:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732703.1138735; Thu, 30 May 2024 12:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCf9n-0002PH-E5; Thu, 30 May 2024 12:45:23 +0000
Received: by outflank-mailman (input) for mailman id 732703;
 Thu, 30 May 2024 12:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XHBK=NB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sCf9l-0002PB-Lx
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 12:45:21 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78fe07ea-1e82-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 14:45:20 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5785f861868so1023797a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 05:45:19 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578f47126f0sm7401739a12.91.2024.05.30.05.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 05:45:18 -0700 (PDT)
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
X-Inumbo-ID: 78fe07ea-1e82-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717073119; x=1717677919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwL9VC6bw4mSsExmP/I8aaPL6juThXBiKzt+hu5ZDtY=;
        b=acqxpm4045fiUTfYPMITqjT+Uryj8O7XaMqljWG0GodqYvZ/CyNFISejM1wh55a2Ag
         ZbGpBULnIeBVWUq3BC23kkX9sctfmjrOAim3Gcxi3mBGmjZcvkH9a9hYcNW+0X/4FQPa
         VArTKNT0SIenWAMPS3RohqGtSKoNiZon8J5r9ibcegr1dOEPUbyJTJCc+TLbzya7IMpn
         sKEHO0nKFAGNJDDegRSHQkASTA7fL+JQrojegH3MgGl67v4alZ/XCW0CLI5lxm917XPv
         DOKQZ01/Pj4tjOJzRxydS2vNkD688Oyn23JT08cCVHgnfRroqnu//uP1BHvc3zVc8XYe
         WY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717073119; x=1717677919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwL9VC6bw4mSsExmP/I8aaPL6juThXBiKzt+hu5ZDtY=;
        b=FqpCEBpDZCu9qDsH5sHMuVCMFRj0+jqQMU5gb6e3FOyVmJ0S7J2pfcU7KYL1pwEiSb
         DM3TsWcFQ9TIburH5FKMYhtiL5a9RN4R+Zrr33qe9i6BYv1ih7bafoRfp1aYE8MzOF3S
         BCXJLG6RazXHig1RC17xdwz2aPq+P+KmqGSnQW2ZWj//RxlXo06mN7ZOEk00byTFA+LG
         h2tU4Li5HCmYLTMSMySPI4PcaFLwLvckTKjdjOhVy7TfoXUAwkn6zKsCkoYxTwDOMNlw
         f3RUYorJOeLzbQ0udjXJ6wlOHwAqYEEvMeR7aRiTKTM5F4/QBUNlp2S4u2dnOK+N4VGv
         bdUw==
X-Gm-Message-State: AOJu0YxQ6Epj4TJbm62iqBGuUy/VTYRVrO8oy0fM6mb21L4lEuWeZLFE
	eJpPy6WOv8mboMedFk47k74uEyUIBNeuDx5cP7EbYNxg02P/aKRyIjWhYi0EpRI=
X-Google-Smtp-Source: AGHT+IHyNKid3eB/fKP3NQqMI5VnTEBQyzcnBRyQtsdGDgH+OxSqAvFHZwSsMStY3wI8w9ZhF22bYg==
X-Received: by 2002:a50:9ec8:0:b0:572:9b20:fa with SMTP id 4fb4d7f45d1cf-57a17952d26mr1490565a12.33.1717073119076;
        Thu, 30 May 2024 05:45:19 -0700 (PDT)
Message-ID: <bba693b3-ad73-4fb8-ae9c-dba025f6f5c1@suse.com>
Date: Thu, 30 May 2024 14:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CPU_DOWN_FAILED hits ASSERTs in scheduling logic
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ZlW-ZyFeAzvh3pGG@macbook>
 <a749c066-0c05-47dd-b499-e712e5454033@suse.com> <ZlcjiOJyAuvyy48n@macbook>
 <1147a06d-d9ec-4fa9-a1d0-dfecd7a670dc@suse.com> <ZldRusciaXuwTC9u@macbook>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZldRusciaXuwTC9u@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.05.24 18:03, Roger Pau Monné wrote:
> On Wed, May 29, 2024 at 03:08:49PM +0200, Jürgen Groß wrote:
>> On 29.05.24 14:46, Roger Pau Monné wrote:
>>> On Wed, May 29, 2024 at 01:47:09PM +0200, Jürgen Groß wrote:
>>>> On 28.05.24 13:22, Roger Pau Monné wrote:
>>>>> Hello,
>>>>>
>>>>> When the stop_machine_run() call in cpu_down() fails and calls the CPU
>>>>> notifier CPU_DOWN_FAILED hook the following assert triggers in the
>>>>> scheduling code:
>>>>>
>>>>> Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/cred1
>>>>> ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
>>>>> CPU:    0
>>>>> RIP:    e008:[<ffff82d040248299>] common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
>>>>> RFLAGS: 0000000000010093   CONTEXT: hypervisor
>>>>> rax: 0000000000000000   rbx: ffff83202ecc2f80   rcx: ffff83202f3e64c0
>>>>> rdx: 0000000000000001   rsi: 0000000000000002   rdi: ffff83202ecc2f88
>>>>> rbp: ffff83203ffffd58   rsp: ffff83203ffffd30   r8:  0000000000000000
>>>>> r9:  ffff83202f3e6e01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
>>>>> r12: ffff83202ecb80b0   r13: 0000000000000001   r14: 0000000000000282
>>>>> r15: ffff83202ecbbf00   cr0: 000000008005003b   cr4: 00000000007526e0
>>>>> cr3: 00000000574c2000   cr2: 0000000000000000
>>>>> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>>> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>>> Xen code around <ffff82d040248299> (common/sched/credit2.c#csched2_free_pdata+0xc8/0x177):
>>>>>     fe ff eb 9a 0f 0b 0f 0b <0f> 0b 49 8d 4f 08 49 8b 47 08 48 3b 48 08 75 2e
>>>>> Xen stack trace from rsp=ffff83203ffffd30:
>>>>>       ffff83202d74d100 0000000000000001 ffff82d0404c4430 0000000000000006
>>>>>       0000000000000000 ffff83203ffffd78 ffff82d040257454 0000000000000000
>>>>>       0000000000000001 ffff83203ffffda8 ffff82d04021f303 ffff82d0404c4628
>>>>>       ffff82d0404c4620 ffff82d0404c4430 0000000000000006 ffff83203ffffdf0
>>>>>       ffff82d04022bc4c ffff83203ffffe18 0000000000000001 0000000000000001
>>>>>       00000000fffffff0 0000000000000000 0000000000000000 ffff82d0405e6500
>>>>>       ffff83203ffffe08 ffff82d040204fd5 0000000000000001 ffff83203ffffe30
>>>>>       ffff82d0402054f0 ffff82d0404c5860 0000000000000001 ffff83202ec75000
>>>>>       ffff83203ffffe48 ffff82d040348c25 ffff83202d74d0d0 ffff83203ffffe68
>>>>>       ffff82d0402071aa ffff83202ec751d0 ffff82d0405ce210 ffff83203ffffe80
>>>>>       ffff82d0402343c9 ffff82d0405ce200 ffff83203ffffeb0 ffff82d040234631
>>>>>       0000000000000000 0000000000007fff ffff82d0405d5080 ffff82d0405ce210
>>>>>       ffff83203ffffee8 ffff82d040321411 ffff82d040321399 ffff83202f3a9000
>>>>>       0000000000000000 0000001d91a6fa2d ffff82d0405e6500 ffff83203ffffde0
>>>>>       ffff82d040324391 0000000000000000 0000000000000000 0000000000000000
>>>>>       0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>>>       0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>>>       0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>>>       0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>>>       0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>>> Xen call trace:
>>>>>       [<ffff82d040248299>] R common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
>>>>>       [<ffff82d040257454>] F free_cpu_rm_data+0x41/0x58
>>>>>       [<ffff82d04021f303>] F common/sched/cpupool.c#cpu_callback+0xfb/0x466
>>>>>       [<ffff82d04022bc4c>] F notifier_call_chain+0x6c/0x96
>>>>>       [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
>>>>>       [<ffff82d0402054f0>] F cpu_down+0xa7/0x143
>>>>>       [<ffff82d040348c25>] F cpu_down_helper+0x11/0x27
>>>>>       [<ffff82d0402071aa>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
>>>>>       [<ffff82d0402343c9>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
>>>>>       [<ffff82d040234631>] F do_tasklet+0x5b/0x8d
>>>>>       [<ffff82d040321411>] F arch/x86/domain.c#idle_loop+0x78/0xe6
>>>>>       [<ffff82d040324391>] F continue_running+0x5b/0x5d
>>>>>
>>>>>
>>>>> ****************************************
>>>>> Panic on CPU 0:
>>>>> Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
>>>>> ****************************************
>>>>>
>>>>> The issue seems to be that since the CPU hasn't been removed, it's
>>>>> still part of prv->initialized and the assert in csched2_free_pdata()
>>>>> called as part of free_cpu_rm_data() triggers.
>>>>>
>>>>> It's easy to reproduce by substituting the stop_machine_run() call in
>>>>> cpu_down() with an error.
>>>>
>>>> Could you please give the attached patch a try?
>>>
>>> I still get the following assert:
>>
>> Oh, silly me. Without core scheduling active nr_sr_unused will be 0 all
>> the time. :-(
>>
>> Next try.
> 
> I'm afraid I have a new trace for you:
> 
> Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:3987
> ----[ Xen-4.19-unstable  x86_64  debug=y  Not tainted ]----
> CPU:    0
> RIP:    e008:[<ffff82d040247d27>] common/sched/credit2.c#csched2_switch_sched+0x115/0x339
> RFLAGS: 0000000000010093   CONTEXT: hypervisor
> rax: 000000000000c000   rbx: 0000000000000001   rcx: ffff82d0405e6500
> rdx: 0000004feee13000   rsi: 0000000000000004   rdi: ffff83202ecc2f88
> rbp: ffff83203ffffc80   rsp: ffff83203ffffc38   r8:  0000000000000000
> r9:  ffff83202ecbbf01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
> r12: ffff83202ecc2f80   r13: ffff83402ca50100   r14: ffff83402ca50140
> r15: ffff83202ecc2f88   cr0: 000000008005003b   cr4: 00000000007526e0
> cr3: 00000000574c2000   cr2: 0000000000000000
> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> Xen code around <ffff82d040247d27> (common/sched/credit2.c#csched2_switch_sched+0x115/0x339):
>   7c ff ff ff 0f 0b 0f 0b <0f> 0b 0f 0b 41 8b 56 30 89 de 48 8d 3d e8 00 1a
> Xen stack trace from rsp=ffff83203ffffc38:
>     ffff83203ffffc48 ffff82d0402332ba ffff83203ffffc68 ffff82d04023343d
>     0000000000000001 ffff82d0405cf398 ffff83402ca50100 ffff82d0405e6500
>     ffff83202ecbbdb0 ffff83203ffffd18 ffff82d040256e1a ffff83203fff386c
>     ffff83203fff2000 0000000000000005 ffff83202ecbbf00 ffff83402ca50140
>     ffff83203fff3868 0000000000000282 0000000040233509 ffff83202ecbbdb0
>     ffff83402ca50100 ffff83202f3e6d80 ffff83202ecc2ec0 ffff83202ecc2ec0
>     0000000000000001 ffff82d0403da460 0000000000000048 0000000000000000
>     ffff83203ffffd48 ffff82d0402414b7 0000000000000001 0000000000000000
>     ffff82d0403da460 0000000000000006 ffff83203ffffd70 ffff82d04024173d
>     0000000000000000 0000000000000001 ffff82d0404c4430 ffff83203ffffda0
>     ffff82d04021f1f9 ffff82d0404c4628 ffff82d0404c4620 ffff82d0404c4430
>     0000000000000006 ffff83203ffffde8 ffff82d04022bb2f ffff83203ffffe10
>     0000000000000001 0000000000000001 0000000000000000 ffff83203ffffe10
>     0000000000000000 ffff82d0405e6500 ffff83203ffffe00 ffff82d040204fd5
>     0000000000000001 ffff83203ffffe30 ffff82d040205464 ffff82d0404c5860
>     0000000000000001 ffff83202ec86000 0000000000000000 ffff83203ffffe48
>     ffff82d040348c32 ffff83402ca500d0 ffff83203ffffe68 ffff82d04020708d
>     ffff83202ec861d0 ffff82d0405ce210 ffff83203ffffe80 ffff82d0402342a3
>     ffff82d0405ce200 ffff83203ffffeb0 ffff82d04023450b 0000000000000000
>     0000000000007fff ffff82d0405d5080 ffff82d0405ce210 ffff83203ffffee8
> Xen call trace:
>     [<ffff82d040247d27>] R common/sched/credit2.c#csched2_switch_sched+0x115/0x339
>     [<ffff82d040256e1a>] F schedule_cpu_add+0x1a4/0x463
>     [<ffff82d0402414b7>] F common/sched/cpupool.c#cpupool_assign_cpu_locked+0x5a/0x17e
>     [<ffff82d04024173d>] F common/sched/cpupool.c#cpupool_cpu_add+0x162/0x16c
>     [<ffff82d04021f1f9>] F common/sched/cpupool.c#cpu_callback+0x10e/0x466
>     [<ffff82d04022bb2f>] F notifier_call_chain+0x6c/0x96
>     [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
>     [<ffff82d040205464>] F cpu_down+0x60/0x83
>     [<ffff82d040348c32>] F cpu_down_helper+0x11/0x27
>     [<ffff82d04020708d>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
>     [<ffff82d0402342a3>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
>     [<ffff82d04023450b>] F do_tasklet+0x5b/0x8d
>     [<ffff82d040321372>] F arch/x86/domain.c#idle_loop+0x78/0xe6
>     [<ffff82d0403242f2>] F continue_running+0x5b/0x5d
> 
> 
> ****************************************
> Panic on CPU 0:
> Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:3987
> ****************************************
> 
> This time is one of the asserts in init_pdata().

Yeah, the reason is similar, but fixing this is a little bit more work
than the other patch.

Not sure I'll manage to do this before Xen Summit.


Juergen

