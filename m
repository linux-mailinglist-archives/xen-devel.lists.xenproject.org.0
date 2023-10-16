Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE917CA2F1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 10:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617348.959878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJQR-00043F-Kn; Mon, 16 Oct 2023 08:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617348.959878; Mon, 16 Oct 2023 08:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJQR-000416-H1; Mon, 16 Oct 2023 08:58:11 +0000
Received: by outflank-mailman (input) for mailman id 617348;
 Mon, 16 Oct 2023 08:58:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsJQP-000410-SR
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 08:58:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJQP-0004Pt-Ci; Mon, 16 Oct 2023 08:58:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJQP-0004P8-6W; Mon, 16 Oct 2023 08:58:09 +0000
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
	bh=/FV0ULCLRUkz6s3k9gTZAifjCN5+iB1CIx1EQoAd7SA=; b=vuq/5iz8aZV6xMw5ZMWbRoMP2Z
	xkuV5ySyR+/bvcDVzuqZIFL5WuuCilUbcuDwacAnAdebl9J8SjKJycM2EOjhiasYbGPrlS4jF0Qv0
	epM0r2t2BEA/2auu0Keo4OkJ1VmG2mR45ZybwYLwjA3ehbnOuN171MIke93gfC/f03m8=;
Message-ID: <0e5a8d7a-4003-41a1-a041-8c8765351cb6@xen.org>
Date: Mon, 16 Oct 2023 09:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 02/10] arm/cpufeature: address violations of MISRA
 C:2012 Rule 8.2
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <henry.wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310131610440.965337@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2310131633520.965337@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310131633520.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/10/2023 00:34, Stefano Stabellini wrote:
> On Fri, 13 Oct 2023, Stefano Stabellini wrote:
>> On Fri, 13 Oct 2023, Federico Serafini wrote:
>>> Add missing parameter names, no functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>>   xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
>>> index 8011076b8c..41e97c23dd 100644
>>> --- a/xen/arch/arm/include/asm/cpufeature.h
>>> +++ b/xen/arch/arm/include/asm/cpufeature.h
>>> @@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
>>>   struct arm_cpu_capabilities {
>>>       const char *desc;
>>>       u16 capability;
>>> -    bool (*matches)(const struct arm_cpu_capabilities *);
>>> -    int (*enable)(void *); /* Called on every active CPUs */
>>> +    bool (*matches)(const struct arm_cpu_capabilities *caps);
>>
>> all the implementations of matches I found in xen/arch/arm/cpuerrata.c
>> actually call the parameter "entry"
>>
>>
>>> +    int (*enable)(void *ptr); /* Called on every active CPUs */
>>
>> this one instead is "data"
> 
> I committed all the other patches in this series to the my for-4.19 branch

I have left some comments in patch #1. Given this is not the latest 
master, I think we should consider to remove/replace the patch rather 
than introducing a follow-up.

Cheers,

-- 
Julien Grall

