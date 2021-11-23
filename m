Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9009545B3B9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229903.397702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVV-0006eZ-JT; Wed, 24 Nov 2021 05:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229903.397702; Wed, 24 Nov 2021 05:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVV-0006Zh-BF; Wed, 24 Nov 2021 05:07:45 +0000
Received: by outflank-mailman (input) for mailman id 229903;
 Tue, 23 Nov 2021 18:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+X5i=QK=arm.com=valentin.schneider@srs-se1.protection.inumbo.net>)
 id 1mpaIW-0005KS-Sd
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 18:13:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 14a584a7-4c89-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 19:13:39 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC8E71FB;
 Tue, 23 Nov 2021 10:13:37 -0800 (PST)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F59E3F5A1;
 Tue, 23 Nov 2021 10:13:35 -0800 (PST)
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
X-Inumbo-ID: 14a584a7-4c89-11ec-9787-a32c541c8605
From: Valentin Schneider <valentin.schneider@arm.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Longpeng \(Mike\, Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Cc: linux-kernel@vger.kernel.org, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, x86@kernel.org, xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be brought up again.
In-Reply-To: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
Date: Tue, 23 Nov 2021 18:13:30 +0000
Message-ID: <87r1b6d9kl.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

On 22/11/21 16:47, Sebastian Andrzej Siewior wrote:
> From: "Longpeng(Mike)" <longpeng2@huawei.com>
>
> A CPU will not show up in virtualized environment which includes an
> Enclave. The VM splits its resources into a primary VM and a Enclave
> VM. While the Enclave is active, the hypervisor will ignore all requests
> to bring up a CPU and this CPU will remain in CPU_UP_PREPARE state.
> The kernel will wait up to ten seconds for CPU to show up
> (do_boot_cpu()) and then rollback the hotplug state back to
> CPUHP_OFFLINE leaving the CPU state in CPU_UP_PREPARE. The CPU state is
> set back to CPUHP_TEARDOWN_CPU during the CPU_POST_DEAD stage.
>

For my own education, this is talking about *host* CPU hotplug, right?

> After the Enclave VM terminates, the primary VM can bring up the CPU
> again.
>
> Allow to bring up the CPU if it is in the CPU_UP_PREPARE state.
>
> [bigeasy: Rewrite commit description.]
>
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: https://lore.kernel.org/r/20210901051143.2752-1-longpeng2@huawei.com
> ---
>
> For XEN: this changes the behaviour as it allows to invoke
> cpu_initialize_context() again should it have have earlier. I *think*
> this is okay and would to bring up the CPU again should the memory
> allocation in cpu_initialize_context() fail.

Virt stuff notwithstanding, that looks OK to me.
Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>

That said, AFAICT only powerpc makes actual use of the state being set to
CPU_UP_PREPARE, it looks to be needless bookkeeping for everyone else (and
there's archs that seem happy using only CPU_DEAD / CPU_POST_DEAD).

>
>  kernel/smpboot.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/kernel/smpboot.c b/kernel/smpboot.c
> index f6bc0bc8a2aab..34958d7fe2c1c 100644
> --- a/kernel/smpboot.c
> +++ b/kernel/smpboot.c
> @@ -392,6 +392,13 @@ int cpu_check_up_prepare(int cpu)
>                */
>               return -EAGAIN;
>
> +	case CPU_UP_PREPARE:
> +		/*
> +		 * Timeout while waiting for the CPU to show up. Allow to try
> +		 * again later.
> +		 */
> +		return 0;
> +
>       default:
>
>               /* Should not happen.  Famous last words. */
> --
> 2.33.1

