Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBCB26122
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 11:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081174.1441302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umUPH-0005f5-Rb; Thu, 14 Aug 2025 09:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081174.1441302; Thu, 14 Aug 2025 09:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umUPH-0005dH-Ob; Thu, 14 Aug 2025 09:37:59 +0000
Received: by outflank-mailman (input) for mailman id 1081174;
 Thu, 14 Aug 2025 09:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVY3=22=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1umUPG-0005dB-3B
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 09:37:58 +0000
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 582c0f9a-78f2-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 11:37:54 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c2g7t6B27z2TT7M;
 Thu, 14 Aug 2025 17:35:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 51B151A0188;
 Thu, 14 Aug 2025 17:37:48 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:37:46 +0800
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
X-Inumbo-ID: 582c0f9a-78f2-11f0-a328-13f23c93f187
Message-ID: <2530ba09-73eb-c0fd-5d77-4e6c5a0810a6@huawei.com>
Date: Thu, 14 Aug 2025 17:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 0/7] arm64: entry: Convert to generic irq entry
Content-Language: en-US
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<anshuman.khandual@arm.com>, <kristina.martsenko@arm.com>,
	<liaochang1@huawei.com>, <ardb@kernel.org>, <leitao@debian.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
 <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
 <a3a8c0b8-e953-4c93-ab4d-0d9a4b3e47b1@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a3a8c0b8-e953-4c93-ab4d-0d9a4b3e47b1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/8/12 0:03, Ada Couprie Diaz wrote:
> On 06/08/2025 09:11, Jinjie Ruan wrote:
> 
>> On 2025/8/5 23:08, Ada Couprie Diaz wrote:
>>> Hi Jinjie,
>>>
>>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>>
>>>> Since commit a70e9f647f50 ("entry: Split generic entry into generic
>>>> exception and syscall entry") split the generic entry into generic irq
>>>> entry and generic syscall entry, it is time to convert arm64 to use
>>>> the generic irq entry. And ARM64 will be completely converted to
>>>> generic
>>>> entry in the upcoming patch series.
>>> Note : I had to manually cherry-pick a70e9f647f50 when pulling the
>>> series
>>> on top of the Linux Arm Kernel for-next/core branch, but there might be
>>> something I'm missing here.
>> It seems that it is now in mainline v6.16-rc1 and linux-next but not
>> Linux Arm Kernel for-next/core branch.
> You're right, I misinterpreted the `-next` of the subject, thanks for the
> clarification !
>>> I'll spend some time testing the series now, specifically given patch
>>> 6's
>>> changes, but other than that everything I saw made sense and didn't look
>>> like it would be of concern to me.
>> Thank you for the test and review.
> 
> I've spent some time testing the series with a few different
> configurations,
> including PREEMPT_RT, pNMI, various lockup and hang detection options,
> UBSAN, shadow call stack, and various CONFIG_DEBUG_XYZ (focused on locks
> and IRQs), on both hardware (AMD Seattle) and KVM guests.
> 
> I tried to generate a diverse set of interrupts (via debug exceptions,
> page faults, perf, kprobes, swapping, OoM) while loading the system with
> different workloads, some generating a lot of context switches : hackbench
> and signaltest from rt-tests[0], and mc-crusher[1], a memcached
> stress-test.
> 
> I did not have any issues, nor any warning reported by the various
> debug features during all my hours of testing, so it looks good !
> 
> Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Thank you for your comprehensive testing and code review.

> 
> Thank you for the series !
> Ada
> 
> [0]: https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/
> [1]: https://github.com/memcached/mc-crusher
> 
> 

