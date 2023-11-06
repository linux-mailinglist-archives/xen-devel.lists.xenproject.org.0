Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EA7E1D88
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 10:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627857.978707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwHq-0007mY-2G; Mon, 06 Nov 2023 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627857.978707; Mon, 06 Nov 2023 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwHp-0007kT-Vf; Mon, 06 Nov 2023 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 627857;
 Mon, 06 Nov 2023 09:52:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qzwHo-0007kN-3E
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 09:52:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzwHn-00052W-Fq; Mon, 06 Nov 2023 09:52:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzwHn-0004nH-9f; Mon, 06 Nov 2023 09:52:47 +0000
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
	bh=//ZYwYu36g+6CwoNnXnY06ymeF7+F/xC9kHo5vXQDN4=; b=AjMv8mNr80PYvdAyeJ0FnpqVuZ
	hX9Kves20ORnJOylVNSHNqmNYlP0RFZG3Ui5SdFkOrSfKFTKqHEcqOhAPhtMSAhMhrVNmjf51+PqK
	j+EXlwYivTMXyODMXcUykq4HKzcDVbiJCxjf2TthPh9deuZEg/dcyuK5yppKc1kFacdw=;
Message-ID: <191b5aa4-182f-4b2e-8430-e605de592890@xen.org>
Date: Mon, 6 Nov 2023 09:52:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm: Skip memory nodes if not enabled
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20231013120442.1267488-1-leo.yan@linaro.org>
 <20231106021742.GA90848@leoy-huanghe.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231106021742.GA90848@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/11/2023 02:18, Leo Yan wrote:
> Hi maintainers,

Hi Leo,

> On Fri, Oct 13, 2023 at 08:04:42PM +0800, Leo Yan wrote:
>> Currently, Xen doesn't check the status property of memory/reserved
>> memory nodes, which may lead to the following issues:
>>
>> - If a memory node has a status "disabled" it implies that it should
>>    not be used. Xen does not handle the status property for the memory
>>    node and ends up using it.
>>
>> - If a reserved memory node has a status "disabled", it means that this
>>    region is no longer reserved and can be used, but the "disabled"
>>    status is not handled by Xen.
>>
>>    Xen passes the intact device tree binding of the reserved memory nodes
>>    to Dom0 and creates a memory node to cover reserved regions. Disabled
>>    reserved memory nodes are ignored by the Dom0 Linux kernel, thus the
>>    Dom0 Linux kernel will continue to allocate pages from such a region.
>>
>>    On the other hand, since the disabled status is not handled by Xen,
>>    the disabled reserved memory regions are excluded from the page
>>    management in Xen which results in Xen being unable to obtain the
>>    corresponding MFN, in the end, Xen reports error like:
>>
>>    (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
>>
>> This patch introduces a function device_tree_node_is_available(). If it
>> detects a memory node is not enabled, Xen will not add the memory region
>> into the memory lists. In the end, this avoids to generate the memory
>> node for the disabled memory regions sent to the kernel and the kernel
>> cannot use the disabled memory nodes any longer.
>>
>> Since this patch adds checking device node's status in the
>> device_tree_get_meminfo() function, except it checks for memory nodes
>> and reserved memory nodes, it also supports status for static memory
>> and static heap.
>>
>> Suggested-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Gentle ping.
> 
> I don't see this patch is landed in Xen master or staging branch, should
> anything I need to follow up?

The tree has been frozen for the past few weeks for any patches that are 
not meant for 4.18. We branched for 4.18 last week so staging is now in 
soft-reopening until 4.18 is released.

I am aware of few patches that are ready to be merged. But I haven't yet 
gone through all of them and merge to 4.19. It will probably be done 
once 4.18 is released.

Cheers,

-- 
Julien Grall

