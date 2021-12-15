Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F6475F70
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 18:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247496.426757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYCb-0006Xo-GW; Wed, 15 Dec 2021 17:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247496.426757; Wed, 15 Dec 2021 17:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYCb-0006VL-Da; Wed, 15 Dec 2021 17:36:29 +0000
Received: by outflank-mailman (input) for mailman id 247496;
 Wed, 15 Dec 2021 17:36:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxYCZ-0006VF-SO
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 17:36:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxYCZ-0000Zx-Ki; Wed, 15 Dec 2021 17:36:27 +0000
Received: from [54.239.6.190] (helo=[10.85.97.145])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxYCZ-0008SP-EP; Wed, 15 Dec 2021 17:36:27 +0000
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
	bh=hUUFyS/gdCmhvpgv+kxy2T441Ba74d4RYuLPHMiEqT8=; b=cRbtBA1v5CRmGJ88iKDTMlzwxN
	OS8frRS2OIrUhva85beiAmibTKkQJc3y3UTQai3AZ++dDuKO3QdhkbC7nLRTDMZPmxbmVWm2Jeol+
	dsSltonPorsYMNflb03qbq+fyABxmM0zWW7R5jGb0LFZ8wPyIce/l+2Fi9l6baUCE7mM=;
Message-ID: <bf28a521-9187-4d12-2072-77f20e2c69ca@xen.org>
Date: Wed, 15 Dec 2021 17:36:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v8 2/4] xen/arm: setup MMIO range trap handlers for
 hardware domain
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
 <20211209072918.460902-3-andr2000@gmail.com>
 <78ee3d68-7901-2cfe-b0f1-76239339dc49@xen.org>
 <d58e87db-2be9-e982-b78e-64d72afb59ef@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d58e87db-2be9-e982-b78e-64d72afb59ef@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/2021 18:37, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hello,

> On 10.12.21 19:52, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 09/12/2021 07:29, Oleksandr Andrushchenko wrote:
>>> +unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>>> +{
>>> +    if ( !has_vpci(d) )
>>> +        return 0;
>>> +
>>> +    if ( is_hardware_domain(d) )
>>> +    {
>>> +        int ret = pci_host_iterate_bridges_and_count(d, vpci_get_num_handlers_cb);
>>> +
>>> +        return ret < 0 ? 0 : ret;
>>
>> Sorry I only spotted this now. AFAICT, ret is not meant to return ret < 0 in this case. But if it were then I think it would be wrong to continue as nothing happened because the code will likely fall over/crash when registering the I/O handlers.
>>
>> I would document this oddity with
>>
>> if ( ret < 0 )
>> {
>>     ASSERT_UNREACHABLE();
>>     return 0;
>> }
>>
>> I can do the change on commit if the others are happy with it.
> Yes, please, do me a favor

Ok. With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

>>
>> Cheers,
>>
> Thank you,
> Oleksandr

-- 
Julien Grall

