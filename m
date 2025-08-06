Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE31B1BECD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 04:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071073.1434614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujTwh-0006Jg-Nx; Wed, 06 Aug 2025 02:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071073.1434614; Wed, 06 Aug 2025 02:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujTwh-0006IT-J4; Wed, 06 Aug 2025 02:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1071073;
 Wed, 06 Aug 2025 02:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oS3N=2S=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1ujTwg-0006IN-UW
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 02:32:02 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84796c7e-726d-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 04:32:00 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bxZ3V1z9wz13N1Z;
 Wed,  6 Aug 2025 10:28:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 0C3F3140146;
 Wed,  6 Aug 2025 10:31:53 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 10:31:51 +0800
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
X-Inumbo-ID: 84796c7e-726d-11f0-a322-13f23c93f187
Message-ID: <36bd2bb2-31c8-e38f-e420-407742ccc3cc@huawei.com>
Date: Wed, 6 Aug 2025 10:31:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 1/7] arm64: ptrace: Replace interrupts_enabled()
 with regs_irqs_disabled()
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
 <20250729015456.3411143-2-ruanjinjie@huawei.com>
 <beb7e8f2-39f8-499f-a173-b8bf2d3296ea@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <beb7e8f2-39f8-499f-a173-b8bf2d3296ea@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/8/5 23:05, Ada Couprie Diaz wrote:
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> The generic entry code expects architecture code to provide
>> regs_irqs_disabled(regs) function, but arm64 does not have this and
>> provides inerrupts_enabled(regs), which has the opposite polarity.
> Nit: "interrupts_enabled(regs)"

Good catch! thank you for the review.

>> In preparation for moving arm64 over to the generic entry code,
>> relace arm64's interrupts_enabled() with regs_irqs_disabled() and
>> update its callers under arch/arm64.
>>
>> For the moment, a definition of interrupts_enabled() is provided for
>> the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
>> can be removed.
>>
>> Delete the fast_interrupts_enabled() macro as it is unused and we
>> don't want any new users to show up.
>>
>> No functional changes.
>>
>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
> Otherwise looks good to me !
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 

