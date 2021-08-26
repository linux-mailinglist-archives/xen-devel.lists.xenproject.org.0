Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDCF3F917D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173198.316134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCg-0001Y3-6O; Fri, 27 Aug 2021 00:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173198.316134; Fri, 27 Aug 2021 00:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCg-0001Vz-2N; Fri, 27 Aug 2021 00:58:42 +0000
Received: by outflank-mailman (input) for mailman id 173198;
 Thu, 26 Aug 2021 19:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZsfU=NR=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mJLWx-0006T3-LA
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 19:59:19 +0000
Received: from mail-pf1-x431.google.com (unknown [2607:f8b0:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 984133d2-719b-4b03-88d7-a6b088d0c141;
 Thu, 26 Aug 2021 19:59:18 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id 7so3661635pfl.10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 12:59:18 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id o9sm4017917pfh.217.2021.08.26.12.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:59:16 -0700 (PDT)
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
X-Inumbo-ID: 984133d2-719b-4b03-88d7-a6b088d0c141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xc1szHQOZDqB0AYr925levUtn3vNJA/QIKkPEhre7Pk=;
        b=rAH1RZhEJy3MVfBUURq1C3iW4ra2alS9qAREXLkrJFEHcf7iDXDJip4aX5r35skET+
         jo8PoQ7D1SWj6xQfgikhRkl1CH3MaymS1zddz++K76rpR+himQM4eRquOL09b9DEA3zi
         k1GwvAYBbvUNls5+AXaN8glJCjF7KIFEFQhoKckGnN93S31/oYpDxN/8g8Ng4pR7mIlZ
         9PgGk1EPPpJEnhqaB0anqRNL1VkcMXUzqFbZwSiDCOTTGHP0JVVcjlrSX45dE9oUOrpr
         J6hngXVZBF1o5LZ9dJoHWVzIqoA8ysZ3JGu2pnoEjug6L81eTykL5MQK90BtvdNATJv2
         Oyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xc1szHQOZDqB0AYr925levUtn3vNJA/QIKkPEhre7Pk=;
        b=AEYVT5WP2BcstTjVSzOIY4KU1I01MxKUmew+nO5t5shjhanBatEy4GS/+Vk6rXcVYo
         4zrBry8zX6Q3D3l6o20qTjiRQQq+yLaRa2nP1gNioa1mbQkQRRrL+dw/taGtyJI7IVzq
         c5u8O3FxAEUwrA5QlUeM3JUXKMFkIMc55fwEtRolB/UrPnIJ5fcmmEqUFiV31TMrZPqT
         a4ckVacS0rMOaGTv8lKaAHqQdDBmVCZZczPe7VirUZ63tIiAPh72zuG+tH5aHE9MWf2I
         ULjzFkZHStLfxD/+FjJ9ECVBdhots9+7K6s+TUqQ+IVzWFuxnKbN3Mz1Z4rtPpSlsF4I
         6W+Q==
X-Gm-Message-State: AOAM532BuOG7jWNisDzrFNKaTrJzmbJEkZDc6Vqnne9pP+2xUM2OuI9E
	/VZFOSsCYqFBZ6hNCMdpqRqH/w==
X-Google-Smtp-Source: ABdhPJw2eYzVN0czVrpB+FQtPqgZRmO7Z9UXayRPLlAY9AEDiGK/tSK4hOJrAmd1TCnyunzzfHMaVw==
X-Received: by 2002:a62:1b97:0:b0:3ed:d347:fcac with SMTP id b145-20020a621b97000000b003edd347fcacmr5420756pfb.65.1630007957263;
        Thu, 26 Aug 2021 12:59:17 -0700 (PDT)
Date: Thu, 26 Aug 2021 19:59:13 +0000
From: Sean Christopherson <seanjc@google.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: peterz@infradead.org, pbonzini@redhat.com, bp@alien8.de,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	joro@8bytes.org, kan.liang@linux.intel.com, ak@linux.intel.com,
	wei.w.wang@intel.com, eranian@google.com, liuxiangdong5@huawei.com,
	linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	like.xu.linux@gmail.com, boris.ostrvsky@oracle.com,
	Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH V10 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <YSfykbECnC6J02Yk@google.com>
References: <20210806133802.3528-1-lingshan.zhu@intel.com>
 <20210806133802.3528-2-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806133802.3528-2-lingshan.zhu@intel.com>

TL;DR: Please don't merge this patch, it's broken and is also built on a shoddy
       foundation that I would like to fix.

On Fri, Aug 06, 2021, Zhu Lingshan wrote:
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 464917096e73..e466fc8176e1 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6489,9 +6489,18 @@ static void perf_pending_event(struct irq_work *entry)
>   */
>  struct perf_guest_info_callbacks *perf_guest_cbs;
>  
> +/* explicitly use __weak to fix duplicate symbol error */
> +void __weak arch_perf_update_guest_cbs(void)
> +{
> +}
> +
>  int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  {
> +	if (WARN_ON_ONCE(perf_guest_cbs))
> +		return -EBUSY;
> +
>  	perf_guest_cbs = cbs;
> +	arch_perf_update_guest_cbs();

This is horribly broken, it fails to cleanup the static calls when KVM unregisters
the callbacks, which happens when the vendor module, e.g. kvm_intel, is unloaded.
The explosion doesn't happen until 'kvm' is unloaded because the functions are
implemented in 'kvm', i.e. the use-after-free is deferred a bit.

  BUG: unable to handle page fault for address: ffffffffa011bb90
  #PF: supervisor instruction fetch in kernel mode
  #PF: error_code(0x0010) - not-present page
  PGD 6211067 P4D 6211067 PUD 6212063 PMD 102b99067 PTE 0
  Oops: 0010 [#1] PREEMPT SMP
  CPU: 0 PID: 1047 Comm: rmmod Not tainted 5.14.0-rc2+ #460
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
  RIP: 0010:0xffffffffa011bb90
  Code: Unable to access opcode bytes at RIP 0xffffffffa011bb66.
  Call Trace:
   <NMI>
   ? perf_misc_flags+0xe/0x50
   ? perf_prepare_sample+0x53/0x6b0
   ? perf_event_output_forward+0x67/0x160
   ? kvm_clock_read+0x14/0x30
   ? kvm_sched_clock_read+0x5/0x10
   ? sched_clock_cpu+0xd/0xd0
   ? __perf_event_overflow+0x52/0xf0
   ? handle_pmi_common+0x1f2/0x2d0
   ? __flush_tlb_all+0x30/0x30
   ? intel_pmu_handle_irq+0xcf/0x410
   ? nmi_handle+0x5/0x260
   ? perf_event_nmi_handler+0x28/0x50
   ? nmi_handle+0xc7/0x260
   ? lock_release+0x2b0/0x2b0
   ? default_do_nmi+0x6b/0x170
   ? exc_nmi+0x103/0x130
   ? end_repeat_nmi+0x16/0x1f
   ? lock_release+0x2b0/0x2b0
   ? lock_release+0x2b0/0x2b0
   ? lock_release+0x2b0/0x2b0
   </NMI>
  Modules linked in: irqbypass [last unloaded: kvm]

Even more fun, the existing perf_guest_cbs framework is also broken, though it's
much harder to get it to fail, and probably impossible to get it to fail without
some help.  The issue is that perf_guest_cbs is global, which means that it can
be nullified by KVM (during module unload) while the callbacks are being accessed
by a PMI handler on a different CPU.

The bug has escaped notice because all dererfences of perf_guest_cbs follow the
same "perf_guest_cbs && perf_guest_cbs->is_in_guest()" pattern, and AFAICT the
compiler never reload perf_guest_cbs in this sequence.  The compiler does reload
perf_guest_cbs for any future dereferences, but the ->is_in_guest() guard all but
guarantees the PMI handler will win the race, e.g. to nullify perf_guest_cbs,
KVM has to completely exit the guest and teardown down all VMs before it can be
unloaded.

But with a help, e.g. RAED_ONCE(perf_guest_cbs), unloading kvm_intel can trigger
a NULL pointer derference, e.g. this tweak

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 1eb45139fcc6..202e5ad97f82 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2954,7 +2954,7 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
 {
        int misc = 0;

-       if (perf_guest_cbs && perf_guest_cbs->is_in_guest()) {
+       if (READ_ONCE(perf_guest_cbs) && READ_ONCE(perf_guest_cbs)->is_in_guest()) {
                if (perf_guest_cbs->is_user_mode())
                        misc |= PERF_RECORD_MISC_GUEST_USER;
                else


while spamming module load/unload leads to:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: 0000 [#1] PREEMPT SMP
  CPU: 6 PID: 1825 Comm: stress Not tainted 5.14.0-rc2+ #459
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
  RIP: 0010:perf_misc_flags+0x1c/0x70
  Call Trace:
   perf_prepare_sample+0x53/0x6b0
   perf_event_output_forward+0x67/0x160
   __perf_event_overflow+0x52/0xf0
   handle_pmi_common+0x207/0x300
   intel_pmu_handle_irq+0xcf/0x410
   perf_event_nmi_handler+0x28/0x50
   nmi_handle+0xc7/0x260
   default_do_nmi+0x6b/0x170
   exc_nmi+0x103/0x130
   asm_exc_nmi+0x76/0xbf


The good news is that I have a series that should fix both the existing NULL pointer
bug and mostly obviate the need for static calls.  The bad news is that my approach,
making perf_guest_cbs per-CPU, likely complicates turning these into static calls,
though I'm guessing it's still a solvable problem.

Tangentially related, IMO we should make architectures opt-in to getting
perf_guest_cbs and nuke all of the code in the below files.  Except for arm,
which recently lost KVM support, it's all a bunch of useless copy-paste code that
serves no purpose and just complicates cleanups like this.

>  arch/arm/kernel/perf_callchain.c   | 16 +++++++-----
>  arch/csky/kernel/perf_callchain.c  |  4 +--
>  arch/nds32/kernel/perf_event_cpu.c | 16 +++++++-----
>  arch/riscv/kernel/perf_callchain.c |  4 +--

