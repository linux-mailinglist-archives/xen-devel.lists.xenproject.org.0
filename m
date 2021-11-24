Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056D45D09E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 23:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230588.398631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq1AA-0004rx-PG; Wed, 24 Nov 2021 22:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230588.398631; Wed, 24 Nov 2021 22:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq1AA-0004p7-MB; Wed, 24 Nov 2021 22:54:50 +0000
Received: by outflank-mailman (input) for mailman id 230588;
 Wed, 24 Nov 2021 22:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCoO=QL=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mq1A8-0004p0-V6
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 22:54:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8582ffe0-4d79-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 23:54:47 +0100 (CET)
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
X-Inumbo-ID: 8582ffe0-4d79-11ec-9787-a32c541c8605
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637794485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=33e828wB9dEjeifz4XOcX4tXiHJV404Ri36l36adBdc=;
	b=QL25vkWz5mQq9ypR1mfmeECHaoZFXVS51EIdeocF5QL5UpPcPy/vofDZ9im05kSuQzGiBJ
	hmVnAE32Zwr1VkRpV1E2d3zSHp/NaafeFx27NyPu3NeXBUKveOHM8EaU3XHWHEOM9acx4v
	TWEwjphxl+Xa8N5TxXy+pF+QZh0oBWvQ9a133TJwQqhgl5uKgyToljpih/0s43EbY/3lIm
	cqA8t+/NdjU5XMTORklBghjPF/S6+ETzyUnMQxqFwpOfWrExhkE8lszWssWX+C4T/s5tlu
	pI/lWC3ZBTxtDAQGnymKdUUdgrmG7v8S4EW/yoFY7yrdWzSp9BUsjrBqKIRw+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637794485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=33e828wB9dEjeifz4XOcX4tXiHJV404Ri36l36adBdc=;
	b=mA9Ro9+xZCYf8cq+L5iHAjp5rtiwfJn3ClnLyxZNu70rRhIHMx8CyC3LbEXLTKodK5/j7L
	0IJbIbc/zuN/RbDA==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: linux-kernel@vger.kernel.org, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, x86@kernel.org, xen-devel@lists.xenproject.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to
 be brought up again.
In-Reply-To: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
Date: Wed, 24 Nov 2021 23:54:44 +0100
Message-ID: <87y25djhaj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 22 2021 at 16:47, Sebastian Andrzej Siewior wrote:
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

Any comment from XEN folks?

Thanks,

        tglx

