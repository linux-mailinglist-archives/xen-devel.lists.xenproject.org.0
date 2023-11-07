Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B557E381E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 10:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628712.980455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Ii3-0004C9-GW; Tue, 07 Nov 2023 09:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628712.980455; Tue, 07 Nov 2023 09:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Ii3-0004A7-Ds; Tue, 07 Nov 2023 09:49:23 +0000
Received: by outflank-mailman (input) for mailman id 628712;
 Tue, 07 Nov 2023 09:49:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0Ii1-00048w-GI
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 09:49:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0Ii0-0006lB-GA; Tue, 07 Nov 2023 09:49:20 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.15.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0Ii0-0004py-8P; Tue, 07 Nov 2023 09:49:20 +0000
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
	bh=LmnmiesngsThpnZAbp21+L/BwuPlQSle++iW029sMCE=; b=5tUBHsZmkbDZ0C76hMFU17lyV4
	NZXElR8hA+OwQmOq3y0+V3g2cZBKdGsaxQeqN51CGSrZE/hssPtZrRUXMQWovCYGTsk10bNPOWK+L
	LNMvuThLOKM4werehqC4zWjGCyPWHYB5RQmf69Rk15HDeU7P4g1xDr0oMH+2u61Xf4M4=;
Message-ID: <859bbbc7-617a-4df0-893d-320b7e1e6e5b@xen.org>
Date: Tue, 7 Nov 2023 09:49:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <334b360fada7177e0b6e074fbdd33e02ce186b8f.1699034672.git.nicola.vetrini@bugseng.com>
 <ef60f721-f784-4595-8866-e1c57da7e48f@xen.org>
 <bb40675e3372abf264dcd63d0d64d476@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bb40675e3372abf264dcd63d0d64d476@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/11/2023 08:36, Nicola Vetrini wrote:
> On 2023-11-06 23:57, Julien Grall wrote:
>> Hi Nicola,
>>
>> On 03/11/2023 18:05, Nicola Vetrini wrote:
>>> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
>>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>> The deviation with a comment based on the SAF framework is also
>>> mentioned as a last resort.
>>
>> I don't see any reason to keep SAF-1 after this patch. So can this be 
>> removed?
>>
> 
> In documenting-violations.rst it's stated:
> "Entries in the database shall never be removed, even if they are not used
> anymore in the code (if a patch is removing or modifying the faulty line).
> This is to make sure that numbers are not reused which could lead to 
> conflicts
> with old branches or misleading justifications."

I read this as the number can not be re-used. But we could replace the 
description with "Not used anymore".

> 
> that's why I kept SAF-1 in the safe.json file and added the remark about it
> being a last resort. 

Right, but this is confusing. What is the last resort? Why would one use 
it? It would be best to not mention SAF-1 at all in deviations.rst.

Cheers,

-- 
Julien Grall

