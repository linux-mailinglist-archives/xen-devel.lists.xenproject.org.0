Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B107C8D1955
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 13:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731106.1136441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBuuO-000868-QO; Tue, 28 May 2024 11:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731106.1136441; Tue, 28 May 2024 11:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBuuO-00083U-Md; Tue, 28 May 2024 11:22:24 +0000
Received: by outflank-mailman (input) for mailman id 731106;
 Tue, 28 May 2024 11:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wewE=M7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sBuuM-000833-Jb
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 11:22:22 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bac1603-1ce4-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 13:22:20 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-df771cae64aso615675276.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 04:22:19 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abcc1009sm373155385a.33.2024.05.28.04.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 04:22:17 -0700 (PDT)
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
X-Inumbo-ID: 8bac1603-1ce4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716895338; x=1717500138; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nzM3xHL4uqemtoYcFsksOMODFqpqWyU1iMQLlMOajCI=;
        b=HsNKG+XNK7ZZmdr286jYvsIckEMAXYmrPVhIQ+FELX/izdJiYrabbuNo+kmQIM/lBQ
         SRxAvFx4UzG4YgsP2UfZaqSor1lrvmKU1C/TKnKRbsvJjjbORn9Z2SpuAtGfGvW/XttW
         pKCu+E64ssNEMb4AA2ojUama772D4fekxWj2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716895338; x=1717500138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzM3xHL4uqemtoYcFsksOMODFqpqWyU1iMQLlMOajCI=;
        b=E1LUNwJBrWb36P1kSDKL5Qxrpv4tIxpykRIxYL3fFGMDqnPrdRsdbHpkWbSDwHJ895
         Sf9Y7pPGRH8Wskx9MCRnP/2ex+lGyBetez/ohmAggbIxINUmlXQhPX0g8PVlJVcAVB+A
         b0sBtLCRjSNt/O3tFzXUWYvDxThPe0m1K+rImTqO/0rkm5i3VyuDLLVTct/pjy7GAg9u
         BU+Z33tiKjuoyrSg7IKSpOjLuUWp4MKhQ46GUT1gk23yUIIIbB/QvSf3KItEMZnUIHrH
         GYIYDBocq0ZztseqYM2T2wu705OFGW9uGAkgfP0lyqqPk4hlvV9HU+THy6Kf7BB1xtRN
         yFgQ==
X-Gm-Message-State: AOJu0Yx42LLXtnV0opyuLtCjOIwRXvsqOhJy/G0+q7ZawrSEDXMqmO6a
	G31kJlrtH9nKTYI/fKo6h2P+OvtH+QjFQsYxXDvJSLEUHsGDfXOFAg2jbD6obAz9zvkyOHFVbUx
	3
X-Google-Smtp-Source: AGHT+IEfiJTSseUgDEdaVsoCp7jDYWZVg87x7v86n7abjE0gNCiS40BabDAGSMWNNzvg5ZRYJYF3FA==
X-Received: by 2002:a5b:d06:0:b0:de6:3c4:c3a with SMTP id 3f1490d57ef6-df77217db00mr9716437276.10.1716895337946;
        Tue, 28 May 2024 04:22:17 -0700 (PDT)
Date: Tue, 28 May 2024 13:22:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: CPU_DOWN_FAILED hits ASSERTs in scheduling logic
Message-ID: <ZlW-ZyFeAzvh3pGG@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

When the stop_machine_run() call in cpu_down() fails and calls the CPU
notifier CPU_DOWN_FAILED hook the following assert triggers in the
scheduling code:

Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/cred1
----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<ffff82d040248299>] common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
RFLAGS: 0000000000010093   CONTEXT: hypervisor
rax: 0000000000000000   rbx: ffff83202ecc2f80   rcx: ffff83202f3e64c0
rdx: 0000000000000001   rsi: 0000000000000002   rdi: ffff83202ecc2f88
rbp: ffff83203ffffd58   rsp: ffff83203ffffd30   r8:  0000000000000000
r9:  ffff83202f3e6e01   r10: 0000000000000000   r11: 0f0f0f0f0f0f0f0f
r12: ffff83202ecb80b0   r13: 0000000000000001   r14: 0000000000000282
r15: ffff83202ecbbf00   cr0: 000000008005003b   cr4: 00000000007526e0
cr3: 00000000574c2000   cr2: 0000000000000000
fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
Xen code around <ffff82d040248299> (common/sched/credit2.c#csched2_free_pdata+0xc8/0x177):
 fe ff eb 9a 0f 0b 0f 0b <0f> 0b 49 8d 4f 08 49 8b 47 08 48 3b 48 08 75 2e
Xen stack trace from rsp=ffff83203ffffd30:
   ffff83202d74d100 0000000000000001 ffff82d0404c4430 0000000000000006
   0000000000000000 ffff83203ffffd78 ffff82d040257454 0000000000000000
   0000000000000001 ffff83203ffffda8 ffff82d04021f303 ffff82d0404c4628
   ffff82d0404c4620 ffff82d0404c4430 0000000000000006 ffff83203ffffdf0
   ffff82d04022bc4c ffff83203ffffe18 0000000000000001 0000000000000001
   00000000fffffff0 0000000000000000 0000000000000000 ffff82d0405e6500
   ffff83203ffffe08 ffff82d040204fd5 0000000000000001 ffff83203ffffe30
   ffff82d0402054f0 ffff82d0404c5860 0000000000000001 ffff83202ec75000
   ffff83203ffffe48 ffff82d040348c25 ffff83202d74d0d0 ffff83203ffffe68
   ffff82d0402071aa ffff83202ec751d0 ffff82d0405ce210 ffff83203ffffe80
   ffff82d0402343c9 ffff82d0405ce200 ffff83203ffffeb0 ffff82d040234631
   0000000000000000 0000000000007fff ffff82d0405d5080 ffff82d0405ce210
   ffff83203ffffee8 ffff82d040321411 ffff82d040321399 ffff83202f3a9000
   0000000000000000 0000001d91a6fa2d ffff82d0405e6500 ffff83203ffffde0
   ffff82d040324391 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
   0000000000000000 0000000000000000 0000000000000000 0000000000000000
Xen call trace:
   [<ffff82d040248299>] R common/sched/credit2.c#csched2_free_pdata+0xc8/0x177
   [<ffff82d040257454>] F free_cpu_rm_data+0x41/0x58
   [<ffff82d04021f303>] F common/sched/cpupool.c#cpu_callback+0xfb/0x466
   [<ffff82d04022bc4c>] F notifier_call_chain+0x6c/0x96
   [<ffff82d040204fd5>] F common/cpu.c#cpu_notifier_call_chain+0x1b/0x36
   [<ffff82d0402054f0>] F cpu_down+0xa7/0x143
   [<ffff82d040348c25>] F cpu_down_helper+0x11/0x27
   [<ffff82d0402071aa>] F common/domain.c#continue_hypercall_tasklet_handler+0x50/0xbd
   [<ffff82d0402343c9>] F common/tasklet.c#do_tasklet_work+0x76/0xaf
   [<ffff82d040234631>] F do_tasklet+0x5b/0x8d
   [<ffff82d040321411>] F arch/x86/domain.c#idle_loop+0x78/0xe6
   [<ffff82d040324391>] F continue_running+0x5b/0x5d


****************************************
Panic on CPU 0:
Assertion '!cpumask_test_cpu(cpu, &prv->initialized)' failed at common/sched/credit2.c:4111
****************************************

The issue seems to be that since the CPU hasn't been removed, it's
still part of prv->initialized and the assert in csched2_free_pdata()
called as part of free_cpu_rm_data() triggers.

It's easy to reproduce by substituting the stop_machine_run() call in
cpu_down() with an error.

Thanks, Roger.

