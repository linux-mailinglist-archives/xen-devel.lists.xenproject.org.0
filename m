Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974FEB1C1DF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071353.1434817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZFG-0007fd-11; Wed, 06 Aug 2025 08:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071353.1434817; Wed, 06 Aug 2025 08:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZFF-0007e0-Tj; Wed, 06 Aug 2025 08:11:33 +0000
Received: by outflank-mailman (input) for mailman id 1071353;
 Wed, 06 Aug 2025 08:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oS3N=2S=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1ujZFE-0007cc-Ig
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:11:32 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0a9d23e-729c-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 10:11:27 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bxjYD0qPnz14ML1;
 Wed,  6 Aug 2025 16:06:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 55C9114022F;
 Wed,  6 Aug 2025 16:11:20 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 16:11:19 +0800
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
X-Inumbo-ID: f0a9d23e-729c-11f0-a322-13f23c93f187
Message-ID: <94757d00-5a8e-ac6b-f832-030f33ccf771@huawei.com>
Date: Wed, 6 Aug 2025 16:11:18 +0800
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
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <6bd09b5b-9830-42b4-ad9e-9ad1e153e564@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/8/5 23:08, Ada Couprie Diaz wrote:
> Hi Jinjie,
> 
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> Since commit a70e9f647f50 ("entry: Split generic entry into generic
>> exception and syscall entry") split the generic entry into generic irq
>> entry and generic syscall entry, it is time to convert arm64 to use
>> the generic irq entry. And ARM64 will be completely converted to generic
>> entry in the upcoming patch series.
> Note : I had to manually cherry-pick a70e9f647f50 when pulling the series
> on top of the Linux Arm Kernel for-next/core branch, but there might be
> something I'm missing here.
>>

It seems that it is now in mainline v6.16-rc1 and linux-next but not
Linux Arm Kernel for-next/core branch.

[...]

> I'll spend some time testing the series now, specifically given patch 6's
> changes, but other than that everything I saw made sense and didn't look
> like it would be of concern to me.

Thank you for the test and review.

> 
> Thanks,
> Ada
> 

