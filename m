Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB99B1B764
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070597.1434231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSi-0001uA-6b; Tue, 05 Aug 2025 15:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070597.1434231; Tue, 05 Aug 2025 15:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSh-0001eN-TC; Tue, 05 Aug 2025 15:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1070597;
 Tue, 05 Aug 2025 15:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jti+=2R=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ujJG6-0007M7-QP
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:07:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e25cef63-720d-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 17:07:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ABA12BCE;
 Tue,  5 Aug 2025 08:07:12 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03633F673;
 Tue,  5 Aug 2025 08:07:15 -0700 (PDT)
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
X-Inumbo-ID: e25cef63-720d-11f0-b898-0df219b8e170
Message-ID: <dbe56865-392e-4705-b841-5612aecd016b@arm.com>
Date: Tue, 5 Aug 2025 16:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 6/7] arm64: entry: Move
 arm64_preempt_schedule_irq() into __exit_to_kernel_mode()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-7-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: mbenes@suse.cz, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 leitao@debian.org, ardb@kernel.org, liaochang1@huawei.com,
 kristina.martsenko@arm.com, anshuman.khandual@arm.com,
 chenl311@chinatelecom.cn, akpm@linux-foundation.org, ryan.roberts@arm.com,
 broonie@kernel.org, puranjay@kernel.org, mark.rutland@arm.com,
 sstabellini@kernel.org, oleg@redhat.com, will@kernel.org,
 catalin.marinas@arm.com, Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The arm64 entry code only preempts a kernel context upon a return from
> a regular IRQ exception. The generic entry code may preempt a kernel
> context for any exception return where irqentry_exit() is used, and so
> may preempt other exceptions such as faults.
>
> In preparation for moving arm64 over to the generic entry code, align
> arm64 with the generic behaviour by calling
> arm64_preempt_schedule_irq() from exit_to_kernel_mode(). To make this
> possible, arm64_preempt_schedule_irq()
> and dynamic/raw_irqentry_exit_cond_resched() are moved earlier in
> the file, with no changes.
>
> As Mark pointed out, this change will have the following 2 key impact:
>
> - " We'll preempt even without taking a "real" interrupt. That
>      shouldn't result in preemption that wasn't possible before,
>      but it does change the probability of preempting at certain points,
>      and might have a performance impact, so probably warrants a
>      benchmark."
>
> - " We will not preempt when taking interrupts from a region of kernel
>      code where IRQs are enabled but RCU is not watching, matching the
>      behaviour of the generic entry code.
>
>      This has the potential to introduce livelock if we can ever have a
>      screaming interrupt in such a region, so we'll need to go figure out
>      whether that's actually a problem.
>
>      Having this as a separate patch will make it easier to test/bisect
>      for that specifically."
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


