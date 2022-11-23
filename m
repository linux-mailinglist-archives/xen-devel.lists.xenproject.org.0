Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD763653C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 17:04:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447681.704199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsE6-0000bG-CV; Wed, 23 Nov 2022 16:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447681.704199; Wed, 23 Nov 2022 16:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsE6-0000Z0-9U; Wed, 23 Nov 2022 16:03:54 +0000
Received: by outflank-mailman (input) for mailman id 447681;
 Wed, 23 Nov 2022 16:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFfC=3X=huawei.com=xiujianfeng@srs-se1.protection.inumbo.net>)
 id 1oxsE4-0000Yd-MZ
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 16:03:52 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b20ca29-6b48-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 17:03:51 +0100 (CET)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NHQn54Mp3zqSV2;
 Wed, 23 Nov 2022 23:59:53 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 00:03:49 +0800
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
X-Inumbo-ID: 6b20ca29-6b48-11ed-91b6-6bf2151ebd3b
Subject: Re: [PATCH 0/2] x86/xen: Fix memory leak issue
To: Juergen Gross <jgross@suse.com>, <boris.ostrovsky@oracle.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <jeremy@goop.org>
CC: <x86@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20221119085923.114889-1-xiujianfeng@huawei.com>
 <33b9d446-9907-ded6-114e-ce6c43cc3446@suse.com>
From: xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <22003e76-0aae-e699-f231-85f8313e4a36@huawei.com>
Date: Thu, 24 Nov 2022 00:03:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <33b9d446-9907-ded6-114e-ce6c43cc3446@suse.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

Hi,

在 2022/11/23 23:23, Juergen Gross 写道:
> On 19.11.22 09:59, Xiu Jianfeng wrote:
>> The new string allocated by kasprintf() is leaked on error path
>>
>> Xiu Jianfeng (2):
>>    x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
>>    x86/xen: Fix memory leak in xen_init_lock_cpu()
>>
>>   arch/x86/xen/smp.c      | 16 ++++++++++++----
>>   arch/x86/xen/smp_pv.c   |  8 ++++++--
>>   arch/x86/xen/spinlock.c |  3 ++-
>>   3 files changed, 20 insertions(+), 7 deletions(-)
>>
> 
> Hmm, I think it would make more sense to always store the name generated
> via kasprintf() in the percpu variable (independently from succeeding to
> bind the irq), and in the related free function to always kfree() it and
> set it to NULL again.
> 
> This would result in less code.

Thanks, It's good to me, already sent v2.
> 
> 
> Juergen

