Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320ABB210B8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 18:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077808.1438835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUyu-0000l0-Hc; Mon, 11 Aug 2025 16:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077808.1438835; Mon, 11 Aug 2025 16:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUyu-0000is-EO; Mon, 11 Aug 2025 16:02:40 +0000
Received: by outflank-mailman (input) for mailman id 1077808;
 Mon, 11 Aug 2025 16:02:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhKo=2X=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ulUyt-0000fu-BR
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 16:02:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 96590cb4-76cc-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 18:02:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0293A267F;
 Mon, 11 Aug 2025 09:02:23 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271C53F738;
 Mon, 11 Aug 2025 09:02:26 -0700 (PDT)
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
X-Inumbo-ID: 96590cb4-76cc-11f0-b898-0df219b8e170
Message-ID: <ced13246-4c00-4837-9d8a-1d140eb0bcb3@arm.com>
Date: Mon, 11 Aug 2025 17:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
 sstabellini@kernel.org, mark.rutland@arm.com, puranjay@kernel.org,
 broonie@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 akpm@linux-foundation.org, chenl311@chinatelecom.cn,
 anshuman.khandual@arm.com, kristina.martsenko@arm.com,
 liaochang1@huawei.com, ardb@kernel.org, leitao@debian.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
 <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
 <bedb35be-100b-95fb-64e4-b38edd3cd327@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <bedb35be-100b-95fb-64e4-b38edd3cd327@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/08/2025 07:39, Jinjie Ruan wrote:

> On 2025/8/5 23:06, Ada Couprie Diaz wrote:
>> Hi Jinjie,
>>
>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>> ARM64 requires an additional check whether to reschedule on return
>>> from interrupt. So add arch_irqentry_exit_need_resched() as the default
>>> NOP implementation and hook it up into the need_resched() condition in
>>> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
>>> the architecture specific version for switching over to
>>> the generic entry code.
>>> [...]
>> I've had some trouble reviewing this patch : on the one hand because
>> I didn't notice `arch_irqentry_exit_need_resched()` was added in
>> the common entry code, which is on me !
>> On the other hand, I felt that the patch itself was a bit disconnected :
>> we add `arch_irqentry_exit_need_resched()` in the common entry code,
>> with a default NOP, but in the same function we add to arm64,
>> while mentioning that this is for arm64's additional checks,
>> which we only implement in patch 7.
> Yes, it does.
>
>> Would it make sense to move the `arch_irqentry_exit_need_resched()`
>> part of the patch to patch 7, so that the introduction and
>> arch-specific implementation appear together ?
>> To me it seems easier to wrap my head around, as it would look like
>> "Move arm64 to generic entry, but it does additional checks : add a new
>> arch-specific function controlling re-scheduling, defaulting to true,
>> and implement it for arm64". I feel it could help making patch 7's
>> commit message clearer as well.
>>
>>  From what I gathered on the archive `arch_irqentry_exit_need_resched()`
>> being added here was suggested previously, so others might not have the
>> same opinion.
> Yes, introduce `arch_irqentry_exit_need_resched()` here may help
> understand the patch's refactoring purpose.
I can see that as well.
I shared my opinion in case it could be useful, but as I mentioned
in my reply to the cover : it's not a big issue and I'm happy for
`arch_irqentry_exit_need_resched()` to be implemented here if that
makes more sense !
>> Maybe improving the commit message and comment for this would be enough
>> as well, as per my suggestions above.
> Thank you! I'll improve the commit message and comment.
>
My pleasure !
Ada

