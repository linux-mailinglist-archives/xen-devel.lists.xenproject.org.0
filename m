Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07BD52A91A
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 19:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331327.554815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0sM-0005PF-8k; Tue, 17 May 2022 17:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331327.554815; Tue, 17 May 2022 17:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0sM-0005Mh-5n; Tue, 17 May 2022 17:20:50 +0000
Received: by outflank-mailman (input) for mailman id 331327;
 Tue, 17 May 2022 17:20:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nr0sK-0005Mb-8I
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 17:20:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr0sJ-0000aT-Ug; Tue, 17 May 2022 17:20:47 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.147.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr0sJ-000701-OV; Tue, 17 May 2022 17:20:47 +0000
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
	bh=tdxgFkAJbWMcqzAdfW43MICaHgB+iXP1p8ozzhZ5qAE=; b=jdoOIShvTsIIQPVFz6j722wu0e
	N6wYF8G+Ji3Z2PFocb9YK5Uo8waiK5ysq1084xxiNOrQPtbR6roqh7UwVcxRAWRDPPqKIzR11BXFo
	oAOVbhzVUwdZNNjttp1oH+b1hkBmkZ1Yc2paLOcA78GDioLPW+OIh/j3UA8JRcYxQqnU=;
Message-ID: <f0b37edd-401c-5790-0134-dbacd4b540f6@xen.org>
Date: Tue, 17 May 2022 18:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220516170246.19908-1-julien@xen.org>
 <89313424-EB15-4A9B-B215-178460F035C4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <89313424-EB15-4A9B-B215-178460F035C4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/05/2022 09:58, Bertrand Marquis wrote:
>> On 16 May 2022, at 18:02, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
>> alloc/free" extended the checks in the buddy allocator to catch any
>> use of the helpers from context with interrupts disabled.
>>
>> Unfortunately, the rule is not followed in the LPI code when allocating
>> the pending table:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<000000000022a678>] alloc_xenheap_pages+0x178/0x194 (PC)
>> (XEN)    [<000000000022a670>] alloc_xenheap_pages+0x170/0x194 (LR)
>> (XEN)    [<0000000000237770>] _xmalloc+0x144/0x294
>> (XEN)    [<00000000002378d4>] _xzalloc+0x14/0x30
>> (XEN)    [<000000000027b4e4>] gicv3_lpi_init_rdist+0x54/0x324
>> (XEN)    [<0000000000279898>] arch/arm/gic-v3.c#gicv3_cpu_init+0x128/0x46
>> (XEN)    [<0000000000279bfc>] arch/arm/gic-v3.c#gicv3_secondary_cpu_init+0x20/0x50
>> (XEN)    [<0000000000277054>] gic_init_secondary_cpu+0x18/0x30
>> (XEN)    [<0000000000284518>] start_secondary+0x1a8/0x234
>> (XEN)    [<0000010722aa4200>] 0000010722aa4200
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 2:
>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
>> (XEN) ****************************************
>>
>> For now the patch extending the checks has been reverted, but it would
>> be good to re-introduce it (allocation with interrupt is not desirable).
>>
>> The logic is reworked to allocate the pending table when preparing the
>> CPU.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> With the print fixed as pointed by Michal you can add my:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks!

> 
> (Fix could be done on commit but that is up to you).

I have fixed it and committed it.

Cheers,

-- 
Julien Grall

