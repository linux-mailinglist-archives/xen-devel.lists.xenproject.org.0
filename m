Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2802D80CDEE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652212.1017974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCh3n-00082e-Qr; Mon, 11 Dec 2023 14:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652212.1017974; Mon, 11 Dec 2023 14:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCh3n-00080z-OF; Mon, 11 Dec 2023 14:15:03 +0000
Received: by outflank-mailman (input) for mailman id 652212;
 Mon, 11 Dec 2023 14:15:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCh3m-00080t-6C
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:15:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCh3l-00062f-Jb; Mon, 11 Dec 2023 14:15:01 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.158.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCh3l-0000xf-DF; Mon, 11 Dec 2023 14:15:01 +0000
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
	bh=mEBBgSkRStZd7PzlH3APts9TAgftohcaYCwW+Ry2Glg=; b=nJMkUnG/5111N5WBmKxM8CWB0i
	/s3p8/0JP5Z0bhp1+78zbbQX8LprIwEZTPyxgS9U34ki4UrxiXmIB8+PTCAIYvJGFLwybyPiFdJ/y
	9f5t7HQpcQYlusXWIPhGjz1DhU2xUcySLe/NjwjnvhyuLxxhsB2eL2UtDYJNU0HqK6Vc=;
Message-ID: <731ed3e1-bbf5-4309-90ec-e9f8e7be6620@xen.org>
Date: Mon, 11 Dec 2023 14:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/7] xen/arm: address MISRA C:2012 Rule 2.1
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <4c0d38f2b707afa9aed1853a99d286fa2424fb9d.1702283415.git.nicola.vetrini@bugseng.com>
 <e86f46bd-b404-4feb-82f5-90c52837e169@xen.org>
 <0f554dea-60fe-409a-935d-87f3eac30a87@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0f554dea-60fe-409a-935d-87f3eac30a87@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2023 13:06, Michal Orzel wrote:
> 
> 
> On 11/12/2023 13:29, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>> The "return 1;" statements at the end of some cases in the switch
>>> of function 'vgic_v3_its_mmio_write' in 'vcig-v3-its.c' cause the
>>> unreachability of the "return 1;" statement after the switch, thus
>>> violating MISRA C:2012 Rule 2.1:
>>> "A project shall not contain unreachable code".
>>>
>>> The same is true for the switch in 'arch_memory_op' from
>>> 'xen/arch/arm/mm.c'.
>>
>> For both cases, I actually much prefer the "return" version in the
>> cases. In particular for the vGIC emulation the switch is quite large
>> and it would not be trivial to know what happens after the break.
> Because of this...
> 
>>
>> IOW, I would much prefer if we remove the "return ..." outside of the
>> switch.
> wouldn't it be better to add ASSERT_UNREACHABLE() before this return instead of removing it?
> This is what we have in e.g. vpl011 and it prevents mistakes.

I am ok with that. But I am not sure if this would make ECLAIR unhappy.

Cheers,

-- 
Julien Grall

