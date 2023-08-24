Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF26786C88
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 12:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589894.921956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7CP-0004B2-4p; Thu, 24 Aug 2023 10:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589894.921956; Thu, 24 Aug 2023 10:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ7CP-00048l-0w; Thu, 24 Aug 2023 10:04:21 +0000
Received: by outflank-mailman (input) for mailman id 589894;
 Thu, 24 Aug 2023 10:04:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZ7CN-00048f-Il
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 10:04:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ7CM-00016B-Qg; Thu, 24 Aug 2023 10:04:18 +0000
Received: from [15.248.3.1] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ7CM-0001Aq-KD; Thu, 24 Aug 2023 10:04:18 +0000
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
	bh=5P/6oOQP0TOOhowZ/UMN1p0FAtOMNu9HAaRmrNTIeL0=; b=OsxU84PqiAvuDoQjGzgY4YRTf4
	HSmb+5e+EA8nejSMSMwABROdS9+MUTg9Ic8Hzqxy5uHtc8VrVE1HfT4NzGL11xLfCYGYHC7y3gr0T
	Kg74emVnZDyuo4niRmUyebbhTe71ikZv5QM6qY6eBogCFIlHWeQu2ghLsdr10xT/m1Co=;
Message-ID: <832d6508-50d8-4f78-ae58-2203100a67f2@xen.org>
Date: Thu, 24 Aug 2023 11:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Handle empty grant table region in
 find_unallocated_memory()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230824090640.25338-1-michal.orzel@amd.com>
 <7d216ef6-398c-4086-8a7a-33e80dcacda7@xen.org>
 <d029d806-33a2-6774-4aa2-ae8f1303288b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d029d806-33a2-6774-4aa2-ae8f1303288b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/08/2023 10:17, Michal Orzel wrote:
> On 24/08/2023 11:10, Julien Grall wrote:
>> On 24/08/2023 10:06, Michal Orzel wrote:
>>> When creating dom0 with grant table support disabled in Xen and no IOMMU,
>>> the following assert is triggered (debug build):
>>> "Assertion 's <= e' failed at common/rangeset.c:189"
>>
>> A partial stack trace would have been handy. This help the reader to
>> understand how you came to the conclusion that the issue was in
>> find_unallocated_memory().
> Here you go:
> (XEN) Xen call trace:
> (XEN)    [<0000020000218568>] rangeset_remove_range+0xbc/0x2cc (PC)
> (XEN)    [<00000200002c76bc>] domain_build.c#make_hypervisor_node+0x294/0x7c4 (LR)
> (XEN)    [<00000200002ca240>] domain_build.c#handle_node+0x7ec/0x924
> (XEN)    [<00000200002ca7ac>] domain_build.c#construct_dom0+0x434/0x4d8
> 
> Can you append this to the commit msg while committing or do you want a respin?

Thanks. It can be done on commit.

Cheers,

-- 
Julien Grall

