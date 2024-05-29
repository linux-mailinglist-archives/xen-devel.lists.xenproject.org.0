Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BE8D36A7
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 14:46:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731876.1137630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIh1-0000jt-W0; Wed, 29 May 2024 12:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731876.1137630; Wed, 29 May 2024 12:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIh1-0000hM-SR; Wed, 29 May 2024 12:46:11 +0000
Received: by outflank-mailman (input) for mailman id 731876;
 Wed, 29 May 2024 12:46:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCIgz-0000hG-Ta
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 12:46:09 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68e40220-1db9-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 14:46:04 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-794e5e77b8bso12322685a.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 05:46:04 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abd39bf3sm466104785a.114.2024.05.29.05.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 05:46:03 -0700 (PDT)
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
X-Inumbo-ID: 68e40220-1db9-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716986763; x=1717591563; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFNf5VydKznM4YREguZ+9UnLyeQJGJfw2gjaHbvAWec=;
        b=n/3lRIYmR7TK9os+XGCRBP9AgFT9c9tL/QYnfZNOHSmkWrRT3d8d8BL5f67FK3nUee
         hJCAUzppbKH95tbHCW0ScxfA3YWuBt9AXg/nkS0FbfEjf3EMQqTD3tcbcRo+vMeAEAYJ
         x6RCryL6B/yfoI56FB5scpycaFvHc8bLOeZnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716986763; x=1717591563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFNf5VydKznM4YREguZ+9UnLyeQJGJfw2gjaHbvAWec=;
        b=hV2IdbQCbcRnY8cDO/RjjehA5QILrNtFYGhMNgN7Bn7o3QDPCB2Wrx1+LTksla5ksD
         0oiuKVdrE/3uaAxjpGo72Nop/CZSMWitOm/++nverAr9yCAzjgrxV37IY7ZFDkJweiYt
         FNDZdzZrGr22qZKyzOQ2g7mm36tMaqroy+367lm1T5W+J6A1RfAAcMdrsKT7h+j7Nm+S
         It7wb5ZGMZwR0Kl+Vul6OJlTlTo7J1FJfXckJm/p4D68Ol0Lxt/oaX9ZpGQ8AA4l3Bv2
         RX8F3+dyASKKrc9u/HRj3eXPkCkTSLAWV/VGGEfh4yPXC+fS0as7sJSchQ2fjAzSwJg/
         lPXw==
X-Gm-Message-State: AOJu0YzBbsVxE/gyWBNgvfGvvr+NTYRpfQiD0e73l+blcUhQuDizN5Vy
	I2/EUBiRuborZKpvsDBfMHyQ+2oXoAcb+aA36LhTQ+XjIG4ifx4hPsW5BbICtQM=
X-Google-Smtp-Source: AGHT+IHm6w8Jp8Ddjpkdcix0hcRoRFtcGRl7rBLCzoq+2sGuYXSHTn5haLHWUyW4PicAza0oeeGj7w==
X-Received: by 2002:a05:620a:4089:b0:794:d524:18fc with SMTP id af79cd13be357-794d5241b8dmr565822485a.56.1716986763370;
        Wed, 29 May 2024 05:46:03 -0700 (PDT)
Date: Wed, 29 May 2024 14:46:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: CPU_DOWN_FAILED hits ASSERTs in scheduling logic
Message-ID: <ZlcjiOJyAuvyy48n@macbook>
References: <ZlW-ZyFeAzvh3pGG@macbook>
 <a749c066-0c05-47dd-b499-e712e5454033@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a749c066-0c05-47dd-b499-e712e5454033@suse.com>

On Wed, May 29, 2024 at 01:47:09PM +0200, Jürgen Groß wrote:
> On 28.05.24 13:22, Roger Pau Monné wrote:
> > Hello,
> > 
> > When the stop_machine_run() call in cpu_down() fails and calls the CPU
> > notifier CPU_DOWN_FAILED hook the following assert triggers in the
> > scheduling code:
> > 
> > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/cred1
> > ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
> > CPU:    0
> > RIP:    e008:[<ffff82d040248299>] common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
> > RFLAGS: 0000000000010093   CONTEXT: hypervisor
> > rax: 0000000000000000   rbx: ffff83202ecc2f80   rcx: ffff83202f3e64c0
> > rdx: 0000000000000001   rsi: 0000000000000002   rdi: ffff83202ecc2f88
> > rbp: ffff83203ffffd58   rsp: ffff83203ffffd30   r8:  0000000000000000
> > r9:  ffff83202f3e6e01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
> > r12: ffff83202ecb80b0   r13: 0000000000000001   r14: 0000000000000282
> > r15: ffff83202ecbbf00   cr0: 000000008005003b   cr4: 00000000007526e0
> > cr3: 00000000574c2000   cr2: 0000000000000000
> > fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > Xen code around <ffff82d040248299> (common/sched/credit2.c#csched2_free_pdata+0xc8/0x177):
> >   fe ff eb 9a 0f 0b 0f 0b <0f> 0b 49 8d 4f 08 49 8b 47 08 48 3b 48 08 75 2e
> > Xen stack trace from rsp=ffff83203ffffd30:
> >     ffff83202d74d100 0000000000000001 ffff82d0404c4430 0000000000000006
> >     0000000000000000 ffff83203ffffd78 ffff82d040257454 0000000000000000
> >     0000000000000001 ffff83203ffffda8 ffff82d04021f303 ffff82d0404c4628
> >     ffff82d0404c4620 ffff82d0404c4430 0000000000000006 ffff83203ffffdf0
> >     ffff82d04022bc4c ffff83203ffffe18 0000000000000001 0000000000000001
> >     00000000fffffff0 0000000000000000 0000000000000000 ffff82d0405e6500
> >     ffff83203ffffe08 ffff82d040204fd5 0000000000000001 ffff83203ffffe30
> >     ffff82d0402054f0 ffff82d0404c5860 0000000000000001 ffff83202ec75000
> >     ffff83203ffffe48 ffff82d040348c25 ffff83202d74d0d0 ffff83203ffffe68
> >     ffff82d0402071aa ffff83202ec751d0 ffff82d0405ce210 ffff83203ffffe80
> >     ffff82d0402343c9 ffff82d0405ce200 ffff83203ffffeb0 ffff82d040234631
> >     0000000000000000 0000000000007fff ffff82d0405d5080 ffff82d0405ce210
> >     ffff83203ffffee8 ffff82d040321411 ffff82d040321399 ffff83202f3a9000
> >     0000000000000000 0000001d91a6fa2d ffff82d0405e6500 ffff83203ffffde0
> >     ffff82d040324391 0000000000000000 0000000000000000 0000000000000000
> >     0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >     0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >     0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >     0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >     0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > Xen call trace:
> >     [<ffff82d040248299>] R common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
> >     [<ffff82d040257454>] F free_cpu_rm_data+0x41/0x58
> >     [<ffff82d04021f303>] F common/sched/cpupool.c#cpu_callback+0xfb/0x466
> >     [<ffff82d04022bc4c>] F notifier_call_chain+0x6c/0x96
> >     [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
> >     [<ffff82d0402054f0>] F cpu_down+0xa7/0x143
> >     [<ffff82d040348c25>] F cpu_down_helper+0x11/0x27
> >     [<ffff82d0402071aa>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
> >     [<ffff82d0402343c9>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
> >     [<ffff82d040234631>] F do_tasklet+0x5b/0x8d
> >     [<ffff82d040321411>] F arch/x86/domain.c#idle_loop+0x78/0xe6
> >     [<ffff82d040324391>] F continue_running+0x5b/0x5d
> > 
> > 
> > ****************************************
> > Panic on CPU 0:
> > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
> > ****************************************
> > 
> > The issue seems to be that since the CPU hasn't been removed, it's
> > still part of prv->initialized and the assert in csched2_free_pdata()
> > called as part of free_cpu_rm_data() triggers.
> > 
> > It's easy to reproduce by substituting the stop_machine_run() call in
> > cpu_down() with an error.
> 
> Could you please give the attached patch a try?

I still get the following assert:

Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
----[ Xen-4.19-unstable  x86_64  debug=y  Not tainted ]----
CPU:    0
RIP:    e008:[<ffff82d040248173>] common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
RFLAGS: 0000000000010093   CONTEXT: hypervisor
rax: 0000000000000000   rbx: ffff83202ecc2f80   rcx: ffff83202f3e64c0
rdx: 0000000000000001   rsi: 0000000000000002   rdi: ffff83202ecc2f88
rbp: ffff83203ffffd50   rsp: ffff83203ffffd28   r8:  0000000000000000
r9:  ffff83202f3e6e01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
r12: ffff83202ecb80b0   r13: 0000000000000001   r14: 0000000000000282
r15: ffff83202ecbbf00   cr0: 000000008005003b   cr4: 00000000007526e0
cr3: 00000000574c2000   cr2: 0000000000000000
fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
Xen code around <ffff82d040248173> (common/sched/credit2.c#csched2_free_pdata+0xc8/0x177):
 fe ff eb 9a 0f 0b 0f 0b <0f> 0b 49 8d 4f 08 49 8b 47 08 48 3b 48 08 75 2e
Xen stack trace from rsp=ffff83203ffffd28:
   0000000000000001 ffff83202e029100 ffff82d0404c4430 0000000000000006
   0000000000000000 ffff83203ffffd70 ffff82d040257338 0000000000000000
   0000000000000001 ffff83203ffffda0 ffff82d04021f1e6 ffff82d0404c4628
   ffff82d0404c4620 ffff82d0404c4430 0000000000000006 ffff83203ffffde8
   ffff82d04022bb2f ffff83203ffffe10 0000000000000001 0000000000000001
   0000000000000000 ffff83203ffffe10 0000000000000000 ffff82d0405e6500
   ffff83203ffffe00 ffff82d040204fd5 0000000000000001 ffff83203ffffe30
   ffff82d040205464 ffff82d0404c5860 0000000000000001 ffff83202ec5d000
   0000000000000000 ffff83203ffffe48 ffff82d040348bd0 ffff83202e0290d0
   ffff83203ffffe68 ffff82d04020708d ffff83202ec5d1d0 ffff82d0405ce210
   ffff83203ffffe80 ffff82d0402342a3 ffff82d0405ce200 ffff83203ffffeb0
   ffff82d04023450b 0000000000000000 0000000000007fff ffff82d0405d5080
   ffff82d0405ce210 ffff83203ffffee8 ffff82d040321363 ffff82d0403212eb
   ffff83202f3a9000 0000000000000000 00000014b1552bff ffff82d0405e6500
   ffff83203ffffde0 ffff82d0403242e3 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
Xen call trace:
   [<ffff82d040248173>] R common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
   [<ffff82d040257338>] F free_cpu_rm_data+0x48/0x80
   [<ffff82d04021f1e6>] F common/sched/cpupool.c#cpu_callback+0xfb/0x466
   [<ffff82d04022bb2f>] F notifier_call_chain+0x6c/0x96
   [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
   [<ffff82d040205464>] F cpu_down+0x60/0x83
   [<ffff82d040348bd0>] F cpu_down_helper+0x11/0x27
   [<ffff82d04020708d>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
   [<ffff82d0402342a3>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
   [<ffff82d04023450b>] F do_tasklet+0x5b/0x8d
   [<ffff82d040321363>] F arch/x86/domain.c#idle_loop+0x78/0xe6
   [<ffff82d0403242e3>] F continue_running+0x5b/0x5d


****************************************
Panic on CPU 0:
Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
****************************************

Reboot in five seconds...
Resetting with ACPI MEMORY or I/O RESET_REG.

I have the following bodge to trigger the failure:

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index d76f80fe2e99..b38796038e31 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -126,6 +126,7 @@ int cpu_down(unsigned int cpu)
     if ( err )
         goto fail;

+    goto fail;
     if ( system_state < SYS_STATE_active || system_state == SYS_STATE_resume )
         on_selected_cpus(cpumask_of(cpu), _take_cpu_down, NULL, true);
     else if ( (err = stop_machine_run(take_cpu_down, NULL, cpu)) < 0 )

Thanks, Roger.

