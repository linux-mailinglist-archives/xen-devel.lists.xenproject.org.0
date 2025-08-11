Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06EB210BF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 18:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077823.1438856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUzR-0001i8-VW; Mon, 11 Aug 2025 16:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077823.1438856; Mon, 11 Aug 2025 16:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUzR-0001fl-SE; Mon, 11 Aug 2025 16:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1077823;
 Mon, 11 Aug 2025 16:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhKo=2X=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ulUzP-0000Eb-Mc
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 16:03:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ada6d0c8-76cc-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 18:03:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 387D9266C;
 Mon, 11 Aug 2025 09:03:02 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CEB73F738;
 Mon, 11 Aug 2025 09:03:06 -0700 (PDT)
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
X-Inumbo-ID: ada6d0c8-76cc-11f0-a325-13f23c93f187
Message-ID: <a3a8c0b8-e953-4c93-ab4d-0d9a4b3e47b1@arm.com>
Date: Mon, 11 Aug 2025 17:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 0/7] arm64: entry: Convert to generic irq entry
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
 <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
 <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2025 09:11, Jinjie Ruan wrote:

> On 2025/8/5 23:08, Ada Couprie Diaz wrote:
>> Hi Jinjie,
>>
>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>
>>> Since commit a70e9f647f50 ("entry: Split generic entry into generic
>>> exception and syscall entry") split the generic entry into generic irq
>>> entry and generic syscall entry, it is time to convert arm64 to use
>>> the generic irq entry. And ARM64 will be completely converted to generic
>>> entry in the upcoming patch series.
>> Note : I had to manually cherry-pick a70e9f647f50 when pulling the series
>> on top of the Linux Arm Kernel for-next/core branch, but there might be
>> something I'm missing here.
> It seems that it is now in mainline v6.16-rc1 and linux-next but not
> Linux Arm Kernel for-next/core branch.
You're right, I misinterpreted the `-next` of the subject, thanks for the
clarification !
>> I'll spend some time testing the series now, specifically given patch 6's
>> changes, but other than that everything I saw made sense and didn't look
>> like it would be of concern to me.
> Thank you for the test and review.

I've spent some time testing the series with a few different configurations,
including PREEMPT_RT, pNMI, various lockup and hang detection options,
UBSAN, shadow call stack, and various CONFIG_DEBUG_XYZ (focused on locks
and IRQs), on both hardware (AMD Seattle) and KVM guests.

I tried to generate a diverse set of interrupts (via debug exceptions,
page faults, perf, kprobes, swapping, OoM) while loading the system with
different workloads, some generating a lot of context switches : hackbench
and signaltest from rt-tests[0], and mc-crusher[1], a memcached stress-test.

I did not have any issues, nor any warning reported by the various
debug features during all my hours of testing, so it looks good !

Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Thank you for the series !
Ada

[0]: https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/
[1]: https://github.com/memcached/mc-crusher


