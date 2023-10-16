Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E47CA9CA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617576.960288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNnU-0006ZU-Ka; Mon, 16 Oct 2023 13:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617576.960288; Mon, 16 Oct 2023 13:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNnU-0006Wb-Gs; Mon, 16 Oct 2023 13:38:16 +0000
Received: by outflank-mailman (input) for mailman id 617576;
 Mon, 16 Oct 2023 13:38:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsNnT-0006WV-9V
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:38:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsNnS-00032V-N6; Mon, 16 Oct 2023 13:38:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsNnS-0008Me-He; Mon, 16 Oct 2023 13:38:14 +0000
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
	bh=XcvR6zZ5gHmxBXXaOKx/XccO6YllDbX/J4fIFNqKEpw=; b=SEdeq7cu5PYP82D4p2OvkGwreU
	PbWMRwqGQacrODyUXEem11bPcSsa0rZjOUHS3/yvhlr454m7VI9WJSfIwQcVcAmbY8gB+wDJmhFtz
	kzDiBn2iamBgzX9clcxnO4waZ0r+wbcwKe7GnypatykGgxNVTMaNvkeyxmx42MFjOR9w=;
Message-ID: <c9a7f059-4cf5-4a75-b231-573c4fe29b37@xen.org>
Date: Mon, 16 Oct 2023 14:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
 <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org>
 <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2023 14:31, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 16 Oct 2023, at 11:07, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 13/10/2023 16:24, Federico Serafini wrote:
>>> Add missing parameter names, no functional change.
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>>   xen/drivers/passthrough/arm/smmu.c | 6 +++---
>>
>> This file is using the Linux coding style because it is imported from Linux. I was under the impression we would exclude such file for now.
>>
>> Looking at exclude-list.json, it doesn't seem to be present. I think this patch should be replaced with adding a line in execlude-list.json.
> 
> I think that during one of the discussions we said that this file already deviated quite a lot from the status in Linux and we wanted to turn it to Xen coding style in the future hence it is not listed in the exclude file.
AFAIK the SMMUv{1, 2} code didn't deviate very much from Linux. I can't 
tell about the SMMUv3.

> At the end having a working smmu might be critical in a safety context so it will make sense to also check this part of xen.
I don't buy this argument right now. We have files in exclude-lists.json 
that I would consider critical for Xen to run (e.g. common/bitmap.c, 
common/libfdt). So if you want to use this argument then we need to move 
critical components of Xen out of the exclusion list.

Cheers,

-- 
Julien Grall

