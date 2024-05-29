Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61638D3BB1
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 18:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732224.1138123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLlh-0007ay-W1; Wed, 29 May 2024 16:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732224.1138123; Wed, 29 May 2024 16:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLlh-0007ZU-Se; Wed, 29 May 2024 16:03:13 +0000
Received: by outflank-mailman (input) for mailman id 732224;
 Wed, 29 May 2024 16:03:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCLlg-0007ZO-Ga
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 16:03:12 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17de2d0-1dd4-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 18:03:10 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-794e5e77ca2so32479885a.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 09:03:10 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abcc0c0fsm481958085a.49.2024.05.29.09.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 09:03:08 -0700 (PDT)
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
X-Inumbo-ID: f17de2d0-1dd4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716998589; x=1717603389; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9KShG6rduuKgiTh52KMZseWBuFaT08ch1UyxawXl2sg=;
        b=BJSACBpjDUlzGW+XYwQ5WoSn+Q06wgRr4x244VRkNoNosWOyFZsGGvow/WwoTZzyru
         kKaHTjqyRn9F7aD3+U5ZxwmX4ecLckFW25ZtOvWCnf//g42YDVJtGK/xTg+ksJ3Axl2J
         VdyzQ/21PCosIP4bbe+RSco4Nm7Qd7C3IHXTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716998589; x=1717603389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KShG6rduuKgiTh52KMZseWBuFaT08ch1UyxawXl2sg=;
        b=ueaVHWBXwcENll+sCzRKabt0sgooPn1paErQJa+/s1XI6sGFrkr9l42NLA3nM/xAAS
         tQ/wRW2moLGI++DpXQj05u3TaXTulpa3auFzTlX48m08omjoioen+3AbcWHtNImpJ1sm
         xWCf48l+8lJQiJgF93ACXexh3xHpbND4bw786R7lu9xd2XAIMfqilYl1quNMzb6aOBfn
         Fz2biZPm6G9LFfNl5DsG6WFsvVQhI96GRKDilA3W+USW7nSUBNQuNhsZyE6njRmOhccS
         tXtEegF+ZQFSxiyIjJ/I0ii9QBJefST1fVPWtBkxliKdv5XEaP9851ajtodbXTzWDr2m
         N0sw==
X-Gm-Message-State: AOJu0YzKXGMP607RpwFtWZSg+sDNX1I3mCmpf+0aiTGS//ocf7/OIFn4
	5/mJzeFQHtkaFACXc2e+6YiIIWy8P/LjHEK/Po0XC8c+NeIhwniFPiXEFRokE4Y=
X-Google-Smtp-Source: AGHT+IEQHfHuEA36kApM6r2/jvPlfsCNtEE0R+8wJYreAscgWUtRziIYc+Erl2zTQpZIrgojwpf4hw==
X-Received: by 2002:a05:620a:3722:b0:792:c708:601c with SMTP id af79cd13be357-794ab0f4961mr1926559685a.57.1716998588723;
        Wed, 29 May 2024 09:03:08 -0700 (PDT)
Date: Wed, 29 May 2024 18:03:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: CPU_DOWN_FAILED hits ASSERTs in scheduling logic
Message-ID: <ZldRusciaXuwTC9u@macbook>
References: <ZlW-ZyFeAzvh3pGG@macbook>
 <a749c066-0c05-47dd-b499-e712e5454033@suse.com>
 <ZlcjiOJyAuvyy48n@macbook>
 <1147a06d-d9ec-4fa9-a1d0-dfecd7a670dc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1147a06d-d9ec-4fa9-a1d0-dfecd7a670dc@suse.com>

On Wed, May 29, 2024 at 03:08:49PM +0200, Jürgen Groß wrote:
> On 29.05.24 14:46, Roger Pau Monné wrote:
> > On Wed, May 29, 2024 at 01:47:09PM +0200, Jürgen Groß wrote:
> > > On 28.05.24 13:22, Roger Pau Monné wrote:
> > > > Hello,
> > > > 
> > > > When the stop_machine_run() call in cpu_down() fails and calls the CPU
> > > > notifier CPU_DOWN_FAILED hook the following assert triggers in the
> > > > scheduling code:
> > > > 
> > > > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/cred1
> > > > ----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
> > > > CPU:    0
> > > > RIP:    e008:[<ffff82d040248299>] common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
> > > > RFLAGS: 0000000000010093   CONTEXT: hypervisor
> > > > rax: 0000000000000000   rbx: ffff83202ecc2f80   rcx: ffff83202f3e64c0
> > > > rdx: 0000000000000001   rsi: 0000000000000002   rdi: ffff83202ecc2f88
> > > > rbp: ffff83203ffffd58   rsp: ffff83203ffffd30   r8:  0000000000000000
> > > > r9:  ffff83202f3e6e01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
> > > > r12: ffff83202ecb80b0   r13: 0000000000000001   r14: 0000000000000282
> > > > r15: ffff83202ecbbf00   cr0: 000000008005003b   cr4: 00000000007526e0
> > > > cr3: 00000000574c2000   cr2: 0000000000000000
> > > > fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > > > ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > > > Xen code around <ffff82d040248299> (common/sched/credit2.c#csched2_free_pdata+0xc8/0x177):
> > > >    fe ff eb 9a 0f 0b 0f 0b <0f> 0b 49 8d 4f 08 49 8b 47 08 48 3b 48 08 75 2e
> > > > Xen stack trace from rsp=ffff83203ffffd30:
> > > >      ffff83202d74d100 0000000000000001 ffff82d0404c4430 0000000000000006
> > > >      0000000000000000 ffff83203ffffd78 ffff82d040257454 0000000000000000
> > > >      0000000000000001 ffff83203ffffda8 ffff82d04021f303 ffff82d0404c4628
> > > >      ffff82d0404c4620 ffff82d0404c4430 0000000000000006 ffff83203ffffdf0
> > > >      ffff82d04022bc4c ffff83203ffffe18 0000000000000001 0000000000000001
> > > >      00000000fffffff0 0000000000000000 0000000000000000 ffff82d0405e6500
> > > >      ffff83203ffffe08 ffff82d040204fd5 0000000000000001 ffff83203ffffe30
> > > >      ffff82d0402054f0 ffff82d0404c5860 0000000000000001 ffff83202ec75000
> > > >      ffff83203ffffe48 ffff82d040348c25 ffff83202d74d0d0 ffff83203ffffe68
> > > >      ffff82d0402071aa ffff83202ec751d0 ffff82d0405ce210 ffff83203ffffe80
> > > >      ffff82d0402343c9 ffff82d0405ce200 ffff83203ffffeb0 ffff82d040234631
> > > >      0000000000000000 0000000000007fff ffff82d0405d5080 ffff82d0405ce210
> > > >      ffff83203ffffee8 ffff82d040321411 ffff82d040321399 ffff83202f3a9000
> > > >      0000000000000000 0000001d91a6fa2d ffff82d0405e6500 ffff83203ffffde0
> > > >      ffff82d040324391 0000000000000000 0000000000000000 0000000000000000
> > > >      0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > >      0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > >      0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > >      0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > >      0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > > Xen call trace:
> > > >      [<ffff82d040248299>] R common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
> > > >      [<ffff82d040257454>] F free_cpu_rm_data+0x41/0x58
> > > >      [<ffff82d04021f303>] F common/sched/cpupool.c#cpu_callback+0xfb/0x466
> > > >      [<ffff82d04022bc4c>] F notifier_call_chain+0x6c/0x96
> > > >      [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
> > > >      [<ffff82d0402054f0>] F cpu_down+0xa7/0x143
> > > >      [<ffff82d040348c25>] F cpu_down_helper+0x11/0x27
> > > >      [<ffff82d0402071aa>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
> > > >      [<ffff82d0402343c9>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
> > > >      [<ffff82d040234631>] F do_tasklet+0x5b/0x8d
> > > >      [<ffff82d040321411>] F arch/x86/domain.c#idle_loop+0x78/0xe6
> > > >      [<ffff82d040324391>] F continue_running+0x5b/0x5d
> > > > 
> > > > 
> > > > ****************************************
> > > > Panic on CPU 0:
> > > > Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
> > > > ****************************************
> > > > 
> > > > The issue seems to be that since the CPU hasn't been removed, it's
> > > > still part of prv->initialized and the assert in csched2_free_pdata()
> > > > called as part of free_cpu_rm_data() triggers.
> > > > 
> > > > It's easy to reproduce by substituting the stop_machine_run() call in
> > > > cpu_down() with an error.
> > > 
> > > Could you please give the attached patch a try?
> > 
> > I still get the following assert:
> 
> Oh, silly me. Without core scheduling active nr_sr_unused will be 0 all
> the time. :-(
> 
> Next try.

I'm afraid I have a new trace for you:

Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:3987
----[ Xen-4.19-unstable  x86_64  debug=y  Not tainted ]----
CPU:    0
RIP:    e008:[<ffff82d040247d27>] common/sched/credit2.c#csched2_switch_sched+0x115/0x339
RFLAGS: 0000000000010093   CONTEXT: hypervisor
rax: 000000000000c000   rbx: 0000000000000001   rcx: ffff82d0405e6500
rdx: 0000004feee13000   rsi: 0000000000000004   rdi: ffff83202ecc2f88
rbp: ffff83203ffffc80   rsp: ffff83203ffffc38   r8:  0000000000000000
r9:  ffff83202ecbbf01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
r12: ffff83202ecc2f80   r13: ffff83402ca50100   r14: ffff83402ca50140
r15: ffff83202ecc2f88   cr0: 000000008005003b   cr4: 00000000007526e0
cr3: 00000000574c2000   cr2: 0000000000000000
fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
Xen code around <ffff82d040247d27> (common/sched/credit2.c#csched2_switch_sched+0x115/0x339):
 7c ff ff ff 0f 0b 0f 0b <0f> 0b 0f 0b 41 8b 56 30 89 de 48 8d 3d e8 00 1a
Xen stack trace from rsp=ffff83203ffffc38:
   ffff83203ffffc48 ffff82d0402332ba ffff83203ffffc68 ffff82d04023343d
   0000000000000001 ffff82d0405cf398 ffff83402ca50100 ffff82d0405e6500
   ffff83202ecbbdb0 ffff83203ffffd18 ffff82d040256e1a ffff83203fff386c
   ffff83203fff2000 0000000000000005 ffff83202ecbbf00 ffff83402ca50140
   ffff83203fff3868 0000000000000282 0000000040233509 ffff83202ecbbdb0
   ffff83402ca50100 ffff83202f3e6d80 ffff83202ecc2ec0 ffff83202ecc2ec0
   0000000000000001 ffff82d0403da460 0000000000000048 0000000000000000
   ffff83203ffffd48 ffff82d0402414b7 0000000000000001 0000000000000000
   ffff82d0403da460 0000000000000006 ffff83203ffffd70 ffff82d04024173d
   0000000000000000 0000000000000001 ffff82d0404c4430 ffff83203ffffda0
   ffff82d04021f1f9 ffff82d0404c4628 ffff82d0404c4620 ffff82d0404c4430
   0000000000000006 ffff83203ffffde8 ffff82d04022bb2f ffff83203ffffe10
   0000000000000001 0000000000000001 0000000000000000 ffff83203ffffe10
   0000000000000000 ffff82d0405e6500 ffff83203ffffe00 ffff82d040204fd5
   0000000000000001 ffff83203ffffe30 ffff82d040205464 ffff82d0404c5860
   0000000000000001 ffff83202ec86000 0000000000000000 ffff83203ffffe48
   ffff82d040348c32 ffff83402ca500d0 ffff83203ffffe68 ffff82d04020708d
   ffff83202ec861d0 ffff82d0405ce210 ffff83203ffffe80 ffff82d0402342a3
   ffff82d0405ce200 ffff83203ffffeb0 ffff82d04023450b 0000000000000000
   0000000000007fff ffff82d0405d5080 ffff82d0405ce210 ffff83203ffffee8
Xen call trace:
   [<ffff82d040247d27>] R common/sched/credit2.c#csched2_switch_sched+0x115/0x339
   [<ffff82d040256e1a>] F schedule_cpu_add+0x1a4/0x463
   [<ffff82d0402414b7>] F common/sched/cpupool.c#cpupool_assign_cpu_locked+0x5a/0x17e
   [<ffff82d04024173d>] F common/sched/cpupool.c#cpupool_cpu_add+0x162/0x16c
   [<ffff82d04021f1f9>] F common/sched/cpupool.c#cpu_callback+0x10e/0x466
   [<ffff82d04022bb2f>] F notifier_call_chain+0x6c/0x96
   [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
   [<ffff82d040205464>] F cpu_down+0x60/0x83
   [<ffff82d040348c32>] F cpu_down_helper+0x11/0x27
   [<ffff82d04020708d>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
   [<ffff82d0402342a3>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
   [<ffff82d04023450b>] F do_tasklet+0x5b/0x8d
   [<ffff82d040321372>] F arch/x86/domain.c#idle_loop+0x78/0xe6
   [<ffff82d0403242f2>] F continue_running+0x5b/0x5d


****************************************
Panic on CPU 0:
Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:3987
****************************************

This time is one of the asserts in init_pdata().

Roger.

