Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072BA5D0FF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909244.1316228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6Vd-0006S7-M5; Tue, 11 Mar 2025 20:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909244.1316228; Tue, 11 Mar 2025 20:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6Vd-0006P6-IN; Tue, 11 Mar 2025 20:47:29 +0000
Received: by outflank-mailman (input) for mailman id 909244;
 Tue, 11 Mar 2025 20:47:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts6Vc-0006P0-Sp
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:47:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6Vc-00EieD-1v;
 Tue, 11 Mar 2025 20:47:28 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6Vc-004mH9-0Z;
 Tue, 11 Mar 2025 20:47:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=tLFA7kKQvzEQR9IfzGpLKmS7eFJ87zudw2MVTlSWs9k=; b=B28xG44ehYEjbpycfEoz07LS0e
	YojRfG1sdGGAdeQILKPDmzT0EpBnMm0YFD7nEh797dTOH5onwZz2gT+mm9LAC96JFsbQgLThs+GeQ
	WEshotycIslsEq4bZhuep4ql2QUPfV+3SzMSZEoMO8TdjrqnSKbGzaVFNbUCrmKNnHtU=;
Message-ID: <30681b52-0d81-47d9-959f-90238863b88e@xen.org>
Date: Tue, 11 Mar 2025 20:47:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] xen/cpu: prevent disable_nonboot_cpus crash on
 ARM64
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <e6cc20510acf49d90c08007a2308ef3dcaccc368.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e6cc20510acf49d90c08007a2308ef3dcaccc368.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 05/03/2025 09:11, Mykola Kvach wrote:
> If we call disable_nonboot_cpus on ARM64 with system_state set
> to SYS_STATE_suspend, the following assertion will be triggered:
> 
> ```
> (XEN) [   25.582712] Disabling non-boot CPUs ...
> (XEN) [   25.587032] Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:714
> [...]
> (XEN) [   25.975069] Xen call trace:
> (XEN) [   25.978353]    [<00000a000022e098>] xfree+0x130/0x1a4 (PC)
> (XEN) [   25.984314]    [<00000a000022e08c>] xfree+0x124/0x1a4 (LR)
> (XEN) [   25.990276]    [<00000a00002747d4>] release_irq+0xe4/0xe8
> (XEN) [   25.996152]    [<00000a0000278588>] time.c#cpu_time_callback+0x44/0x60
> (XEN) [   26.003150]    [<00000a000021d678>] notifier_call_chain+0x7c/0xa0
> (XEN) [   26.009717]    [<00000a00002018e0>] cpu.c#cpu_notifier_call_chain+0x24/0x48
> (XEN) [   26.017148]    [<00000a000020192c>] cpu.c#_take_cpu_down+0x28/0x34
> (XEN) [   26.023801]    [<00000a0000201944>] cpu.c#take_cpu_down+0xc/0x18
> (XEN) [   26.030281]    [<00000a0000225c5c>] stop_machine.c#stopmachine_action+0xbc/0xe4
> (XEN) [   26.038057]    [<00000a00002264bc>] tasklet.c#do_tasklet_work+0xb8/0x100
> (XEN) [   26.045229]    [<00000a00002268a4>] do_tasklet+0x68/0xb0
> (XEN) [   26.051018]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
> (XEN) [   26.057585]    [<00000a0000277e30>] start_secondary+0x21c/0x220
> (XEN) [   26.063978]    [<00000a0000361258>] 00000a0000361258
> ```
> 
> This happens because before invoking take_cpu_down via the stop_machine_run
> function on the target CPU, stop_machine_run requests
> the STOPMACHINE_DISABLE_IRQ state on that CPU. Releasing memory in
> the release_irq function then triggers the assertion:
> 
> /*
>   * Heap allocations may need TLB flushes which may require IRQs to be
>   * enabled (except when only 1 PCPU is online).
>   */
> #define ASSERT_ALLOC_CONTEXT()
> 
> This patch introduces a new tasklet to perform the CPU_DYING call chain for
> a particular CPU. However, we cannot call take_cpu_down from the tasklet
> because the __cpu_disable function disables local IRQs, causing the system
> to crash inside spin_lock_irq, which is called after the tasklet function
> invocation inside do_tasklet_work:
> 
> void _spin_lock_irq(spinlock_t *lock)
> {
>      ASSERT(local_irq_is_enabled());
> 
> To resolve this, take_cpu_down is split into two parts. The first part triggers
> the CPU_DYING call chain, while the second part, __cpu_disable, is invoked from
> stop_machine_run.

Rather than modifying common code, have you considered allocating from 
the IRQ action from the percpu area? This would also reduce the number 
of possible failure when bringup up a pCPU.

Cheers,

-- 
Julien Grall


