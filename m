Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DFA82565B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 16:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662204.1032182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlpj-0003ay-ST; Fri, 05 Jan 2024 15:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662204.1032182; Fri, 05 Jan 2024 15:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlpj-0003W3-OH; Fri, 05 Jan 2024 15:10:03 +0000
Received: by outflank-mailman (input) for mailman id 662204;
 Fri, 05 Jan 2024 15:10:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLlph-00036n-NX
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 15:10:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLlpg-0008Fp-Q0; Fri, 05 Jan 2024 15:10:00 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLlpg-0003mq-Hr; Fri, 05 Jan 2024 15:10:00 +0000
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
	bh=1CatBldUfLSMIToE+BROeYV/HCODUxCyQZIH3uY2Qlo=; b=lZogrI9NgJtPMd2A6JXCdijbnS
	k1pGDwPAi6xKgVvxQC3sPDVvmtbP8Nz0SDIzsuicuXg2X1OQZJJYmQGR9opo8bsLqMrfNZLbTiaqi
	XQvkCBOaTjoCOnTjC4TLvwcImU8QGb3o9UrOBr7R7F7kpPNwdawRAiY06DDQPHo4V/jM=;
Message-ID: <d4d5f0fc-14e5-4e36-8747-e06d2ad057e4@xen.org>
Date: Fri, 5 Jan 2024 15:09:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] xen/arm: smmu-v3: address violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <93d32bf20bb85b93618be5140edb1be527606b77.1703066935.git.federico.serafini@bugseng.com>
 <0b26cab9-8422-4f5f-ab96-b64a4afbdb24@xen.org>
 <a6a6ce27-76ad-4304-aaa8-d4cdc8e3badc@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a6a6ce27-76ad-4304-aaa8-d4cdc8e3badc@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/01/2024 15:04, Federico Serafini wrote:
> On 20/12/23 12:49, Julien Grall wrote:
>> Hi Federico,
>>
>> On 20/12/2023 11:03, Federico Serafini wrote:
>>> Add a break statement at the end of the switch-clauses to address
>>> violations of MISRA C:2012 Rule 16.3 ("An unconditional `break'
>>> statement shall terminate every switch-clause").
>>> No funtional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>  > I noticed that this has not yet been committed.

The SMMUv3 maintainers are not the same as the rest of the Arm code. So 
you technically need an Ack from one of them before this can get merged.

I have pinged Bertrand on Matrix.

Cheers,

-- 
Julien Grall

