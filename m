Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943328D4C5A
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 15:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732716.1138756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCfdG-0006uD-2p; Thu, 30 May 2024 13:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732716.1138756; Thu, 30 May 2024 13:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCfdF-0006r1-VD; Thu, 30 May 2024 13:15:49 +0000
Received: by outflank-mailman (input) for mailman id 732716;
 Thu, 30 May 2024 13:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCfdE-0006qr-ND
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 13:15:48 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba12cf6b-1e86-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 15:15:47 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-794ab12341aso88920485a.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 06:15:47 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abcdca88sm552340385a.66.2024.05.30.06.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 06:15:45 -0700 (PDT)
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
X-Inumbo-ID: ba12cf6b-1e86-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717074946; x=1717679746; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9+qqFQq3i9fpO4By1QcUnaKmtZDkBza7jyHqUqOSYUQ=;
        b=tX0lr+N6YI/pTKoLIATLWxIpa+BfgaF4yI1JAIMvnpRrc86W2Vtzcns1lwITC1To1O
         R1J1JqSMOrbleYDcHS8iLwmLObV6NKGZcjEwNiePhCvmqooFYzb0U3fI9fVgWfDTRlt+
         FKU40fBf9syCFd8CoQblaPKj2+XagwO1dz8CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717074946; x=1717679746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+qqFQq3i9fpO4By1QcUnaKmtZDkBza7jyHqUqOSYUQ=;
        b=JPRIvimqr5vYfKxohKsda7y1WOYtVMmWQTZlqCOzN7P/O6krNpu+0c5dHsCadDdOBj
         1fK3RRMoCfp/0YjFO65Ze9JgZjfUl9o1ra270gH4kZN7on6n7bGPRdv8sVga5OCtoTWf
         z+fkdC6uvaOMz8chTyvV0zmy/6bcH1UdmYLTJHfDclgHQszqIyGuttf6K2x+3nNmZqzg
         T5D2xxY1PXpJVMjre5Yv/yZBiOCmFe2rZkzjyCoGT4ViDW420kqxnr91Rk+D4x5OVj02
         YttSd7twIng22mkYplA6urPQELlxaD2+OCxczydQfn+5Yqshp5XzTy6VjxRfn2L01q4z
         9uRw==
X-Gm-Message-State: AOJu0YzlcTSp2SzwSrGT5eLfaqe3160qUOnQ4N03TbxebIcYtjIEf/59
	+hxGdpUoRKUHlE3GvkBh6QSs0VfZoNXAD9HuU6HvAKt0yAiesxWrFzxVRRxXbZM=
X-Google-Smtp-Source: AGHT+IFsmOvsoe0XMJa9f4G/2/j2L1HfkUjQfPzr6qOAXFu6m/dFtUDSbMZnR//tpZ5JwNRbTxDxmA==
X-Received: by 2002:a05:620a:4506:b0:794:e68c:260a with SMTP id af79cd13be357-794eaeb14aemr314917085a.4.1717074946225;
        Thu, 30 May 2024 06:15:46 -0700 (PDT)
Date: Thu, 30 May 2024 15:15:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: CPU_DOWN_FAILED hits ASSERTs in scheduling logic
Message-ID: <Zlh7_zYCV0Pc8ZUl@macbook>
References: <ZlW-ZyFeAzvh3pGG@macbook>
 <a749c066-0c05-47dd-b499-e712e5454033@suse.com>
 <ZlcjiOJyAuvyy48n@macbook>
 <1147a06d-d9ec-4fa9-a1d0-dfecd7a670dc@suse.com>
 <ZldRusciaXuwTC9u@macbook>
 <bba693b3-ad73-4fb8-ae9c-dba025f6f5c1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bba693b3-ad73-4fb8-ae9c-dba025f6f5c1@suse.com>

On Thu, May 30, 2024 at 02:45:18PM +0200, Jürgen Groß wrote:
> On 29.05.24 18:03, Roger Pau Monné wrote:
> > On Wed, May 29, 2024 at 03:08:49PM +0200, Jürgen Groß wrote:
> > > On 29.05.24 14:46, Roger Pau Monné wrote:
> > > > On Wed, May 29, 2024 at 01:47:09PM +0200, Jürgen Groß wrote:
> > > > > On 28.05.24 13:22, Roger Pau Monné wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > When the stop_machine_run() call in cpu_down() fails and calls the CPU
> > > > > > notifier CPU_DOWN_FAILED hook the following assert triggers in the
> > > > > > scheduling code:
> > > > > > 
> > > > > > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/cred1
> > > > > > ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
> > > > > > CPU:    0
> > > > > > RIP:    e008:[<ffff82d040248299>] common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
> > > > > > RFLAGS: 0000000000010093   CONTEXT: hypervisor
> > > > > > rax: 0000000000000000   rbx: ffff83202ecc2f80   rcx: ffff83202f3e64c0
> > > > > > rdx: 0000000000000001   rsi: 0000000000000002   rdi: ffff83202ecc2f88
> > > > > > rbp: ffff83203ffffd58   rsp: ffff83203ffffd30   r8:  0000000000000000
> > > > > > r9:  ffff83202f3e6e01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
> > > > > > r12: ffff83202ecb80b0   r13: 0000000000000001   r14: 0000000000000282
> > > > > > r15: ffff83202ecbbf00   cr0: 000000008005003b   cr4: 00000000007526e0
> > > > > > cr3: 00000000574c2000   cr2: 0000000000000000
> > > > > > fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > > > > > ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > > > > > Xen code around <ffff82d040248299> (common/sched/credit2.c#csched2_free_pdata+0xc8/0x177):
> > > > > >     fe ff eb 9a 0f 0b 0f 0b <0f> 0b 49 8d 4f 08 49 8b 47 08 48 3b 48 08 75 2e
> > > > > > Xen stack trace from rsp=ffff83203ffffd30:
> > > > > >       ffff83202d74d100 0000000000000001 ffff82d0404c4430 0000000000000006
> > > > > >       0000000000000000 ffff83203ffffd78 ffff82d040257454 0000000000000000
> > > > > >       0000000000000001 ffff83203ffffda8 ffff82d04021f303 ffff82d0404c4628
> > > > > >       ffff82d0404c4620 ffff82d0404c4430 0000000000000006 ffff83203ffffdf0
> > > > > >       ffff82d04022bc4c ffff83203ffffe18 0000000000000001 0000000000000001
> > > > > >       00000000fffffff0 0000000000000000 0000000000000000 ffff82d0405e6500
> > > > > >       ffff83203ffffe08 ffff82d040204fd5 0000000000000001 ffff83203ffffe30
> > > > > >       ffff82d0402054f0 ffff82d0404c5860 0000000000000001 ffff83202ec75000
> > > > > >       ffff83203ffffe48 ffff82d040348c25 ffff83202d74d0d0 ffff83203ffffe68
> > > > > >       ffff82d0402071aa ffff83202ec751d0 ffff82d0405ce210 ffff83203ffffe80
> > > > > >       ffff82d0402343c9 ffff82d0405ce200 ffff83203ffffeb0 ffff82d040234631
> > > > > >       0000000000000000 0000000000007fff ffff82d0405d5080 ffff82d0405ce210
> > > > > >       ffff83203ffffee8 ffff82d040321411 ffff82d040321399 ffff83202f3a9000
> > > > > >       0000000000000000 0000001d91a6fa2d ffff82d0405e6500 ffff83203ffffde0
> > > > > >       ffff82d040324391 0000000000000000 0000000000000000 0000000000000000
> > > > > >       0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > > >       0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > > >       0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > > >       0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > > >       0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > > > Xen call trace:
> > > > > >       [<ffff82d040248299>] R common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
> > > > > >       [<ffff82d040257454>] F free_cpu_rm_data+0x41/0x58
> > > > > >       [<ffff82d04021f303>] F common/sched/cpupool.c#cpu_callback+0xfb/0x466
> > > > > >       [<ffff82d04022bc4c>] F notifier_call_chain+0x6c/0x96
> > > > > >       [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
> > > > > >       [<ffff82d0402054f0>] F cpu_down+0xa7/0x143
> > > > > >       [<ffff82d040348c25>] F cpu_down_helper+0x11/0x27
> > > > > >       [<ffff82d0402071aa>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
> > > > > >       [<ffff82d0402343c9>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
> > > > > >       [<ffff82d040234631>] F do_tasklet+0x5b/0x8d
> > > > > >       [<ffff82d040321411>] F arch/x86/domain.c#idle_loop+0x78/0xe6
> > > > > >       [<ffff82d040324391>] F continue_running+0x5b/0x5d
> > > > > > 
> > > > > > 
> > > > > > ****************************************
> > > > > > Panic on CPU 0:
> > > > > > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
> > > > > > ****************************************
> > > > > > 
> > > > > > The issue seems to be that since the CPU hasn't been removed, it's
> > > > > > still part of prv->initialized and the assert in csched2_free_pdata()
> > > > > > called as part of free_cpu_rm_data() triggers.
> > > > > > 
> > > > > > It's easy to reproduce by substituting the stop_machine_run() call in
> > > > > > cpu_down() with an error.
> > > > > 
> > > > > Could you please give the attached patch a try?
> > > > 
> > > > I still get the following assert:
> > > 
> > > Oh, silly me. Without core scheduling active nr_sr_unused will be 0 all
> > > the time. :-(
> > > 
> > > Next try.
> > 
> > I'm afraid I have a new trace for you:
> > 
> > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:3987
> > ----[ Xen-4.19-unstable  x86_64  debug=y  Not tainted ]----
> > CPU:    0
> > RIP:    e008:[<ffff82d040247d27>] common/sched/credit2.c#csched2_switch_sched+0x115/0x339
> > RFLAGS: 0000000000010093   CONTEXT: hypervisor
> > rax: 000000000000c000   rbx: 0000000000000001   rcx: ffff82d0405e6500
> > rdx: 0000004feee13000   rsi: 0000000000000004   rdi: ffff83202ecc2f88
> > rbp: ffff83203ffffc80   rsp: ffff83203ffffc38   r8:  0000000000000000
> > r9:  ffff83202ecbbf01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
> > r12: ffff83202ecc2f80   r13: ffff83402ca50100   r14: ffff83402ca50140
> > r15: ffff83202ecc2f88   cr0: 000000008005003b   cr4: 00000000007526e0
> > cr3: 00000000574c2000   cr2: 0000000000000000
> > fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > Xen code around <ffff82d040247d27> (common/sched/credit2.c#csched2_switch_sched+0x115/0x339):
> >   7c ff ff ff 0f 0b 0f 0b <0f> 0b 0f 0b 41 8b 56 30 89 de 48 8d 3d e8 00 1a
> > Xen stack trace from rsp=ffff83203ffffc38:
> >     ffff83203ffffc48 ffff82d0402332ba ffff83203ffffc68 ffff82d04023343d
> >     0000000000000001 ffff82d0405cf398 ffff83402ca50100 ffff82d0405e6500
> >     ffff83202ecbbdb0 ffff83203ffffd18 ffff82d040256e1a ffff83203fff386c
> >     ffff83203fff2000 0000000000000005 ffff83202ecbbf00 ffff83402ca50140
> >     ffff83203fff3868 0000000000000282 0000000040233509 ffff83202ecbbdb0
> >     ffff83402ca50100 ffff83202f3e6d80 ffff83202ecc2ec0 ffff83202ecc2ec0
> >     0000000000000001 ffff82d0403da460 0000000000000048 0000000000000000
> >     ffff83203ffffd48 ffff82d0402414b7 0000000000000001 0000000000000000
> >     ffff82d0403da460 0000000000000006 ffff83203ffffd70 ffff82d04024173d
> >     0000000000000000 0000000000000001 ffff82d0404c4430 ffff83203ffffda0
> >     ffff82d04021f1f9 ffff82d0404c4628 ffff82d0404c4620 ffff82d0404c4430
> >     0000000000000006 ffff83203ffffde8 ffff82d04022bb2f ffff83203ffffe10
> >     0000000000000001 0000000000000001 0000000000000000 ffff83203ffffe10
> >     0000000000000000 ffff82d0405e6500 ffff83203ffffe00 ffff82d040204fd5
> >     0000000000000001 ffff83203ffffe30 ffff82d040205464 ffff82d0404c5860
> >     0000000000000001 ffff83202ec86000 0000000000000000 ffff83203ffffe48
> >     ffff82d040348c32 ffff83402ca500d0 ffff83203ffffe68 ffff82d04020708d
> >     ffff83202ec861d0 ffff82d0405ce210 ffff83203ffffe80 ffff82d0402342a3
> >     ffff82d0405ce200 ffff83203ffffeb0 ffff82d04023450b 0000000000000000
> >     0000000000007fff ffff82d0405d5080 ffff82d0405ce210 ffff83203ffffee8
> > Xen call trace:
> >     [<ffff82d040247d27>] R common/sched/credit2.c#csched2_switch_sched+0x115/0x339
> >     [<ffff82d040256e1a>] F schedule_cpu_add+0x1a4/0x463
> >     [<ffff82d0402414b7>] F common/sched/cpupool.c#cpupool_assign_cpu_locked+0x5a/0x17e
> >     [<ffff82d04024173d>] F common/sched/cpupool.c#cpupool_cpu_add+0x162/0x16c
> >     [<ffff82d04021f1f9>] F common/sched/cpupool.c#cpu_callback+0x10e/0x466
> >     [<ffff82d04022bb2f>] F notifier_call_chain+0x6c/0x96
> >     [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
> >     [<ffff82d040205464>] F cpu_down+0x60/0x83
> >     [<ffff82d040348c32>] F cpu_down_helper+0x11/0x27
> >     [<ffff82d04020708d>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
> >     [<ffff82d0402342a3>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
> >     [<ffff82d04023450b>] F do_tasklet+0x5b/0x8d
> >     [<ffff82d040321372>] F arch/x86/domain.c#idle_loop+0x78/0xe6
> >     [<ffff82d0403242f2>] F continue_running+0x5b/0x5d
> > 
> > 
> > ****************************************
> > Panic on CPU 0:
> > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:3987
> > ****************************************
> > 
> > This time is one of the asserts in init_pdata().
> 
> Yeah, the reason is similar, but fixing this is a little bit more work
> than the other patch.
> 
> Not sure I'll manage to do this before Xen Summit.

No worries, I'm not in a rush.  I'm happy as long as it's on your
plate and not mine :).

Thanks, Roger.

