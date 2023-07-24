Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA0D75F852
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568972.889236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvgx-0002cL-TK; Mon, 24 Jul 2023 13:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568972.889236; Mon, 24 Jul 2023 13:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvgx-0002Zu-Q7; Mon, 24 Jul 2023 13:33:39 +0000
Received: by outflank-mailman (input) for mailman id 568972;
 Mon, 24 Jul 2023 13:33:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qNvgv-0002Zo-Hv
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:33:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNvgu-0001P5-I5; Mon, 24 Jul 2023 13:33:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNvgu-000585-B1; Mon, 24 Jul 2023 13:33:36 +0000
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
	bh=OaSl5ntvJ0tXrit0QV4hVHKLq8QJbIXzvhZb6nRwBC4=; b=CzZrMbI4gZhfMI6ho+22/dKGoU
	cQ94UbSlfg4/RHowDLnukIBxs6tQqGwPkKW3cozCvDYk2AyxKl1t8zdRFzZWpcdfN71LLDQ6qZ4QI
	0h/TFnyDSyzlHHV5XYfyuu17+yKkT3icUkIp5dgJrucXTFVMXVWoSdRcqsztUolQbajY=;
Message-ID: <27d35ad9-188f-499f-c80c-4bb0b022813e@xen.org>
Date: Mon, 24 Jul 2023 14:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/arm: p2m: refactor 'p2m_get_entry'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <118566cd8b9ebbcedd2b610f5f602cc31c12fd55.1689922099.git.nicola.vetrini@bugseng.com>
 <9c1b7c53-f8da-76a2-cc02-7c72a3030be4@xen.org>
 <33af17e5-2942-e263-22bf-7e60148e1de1@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <33af17e5-2942-e263-22bf-7e60148e1de1@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2023 14:15, Nicola Vetrini wrote:
> 
> 
> On 21/07/23 12:01, Julien Grall wrote:
>> Hi Nicola,
>>
>> I would add "to please ECLAIR" in the commit title.
> 
> I would be against this. It's the MISRA assessor that needs
> to understand and agree on what has been done to claim MISRA compliance. 
> A static analysis tool is just a useful way to help reaching this aim.

I have already mentioned in [1], but I will repeat here in a shorter 
version. If Eclair wasn't complaining about it, then this is not a patch 
I would have accepted with the current justification.

>
>>
>> On 21/07/2023 07:49, Nicola Vetrini wrote:
>>> This function is refactored to avoid using a
>>> local dummy variable that served as a fallback
>>> if the parameter 't' is NULL.
>>>
>>> Storing the address of that variable into 't' caused
>>> static analysis tools not to be able to recognize the
>>
>> Can you mention which static analysis tools is not happy and the 
>> version? This could help us in the future if we decided to revert the 
>> patch.
>>
> 
> It is not a matter of tool happiness, but of MISRA compliance.
 From my understanding, the code you are modifying is compliant with 
MISRA. So you are only doing this patch to:

   1) Help Eclair to figure out there is no issue
   2) Avoid adding an explanation in the documentation why this is safe

> There are several tools (even emblazoned ones) that have lots
> of false negatives, also for mandatory guidelines such as Rule 9.1:
> the fact that they do not issue messages for possible violations
> they cannot exclude is happiness for nobody (especially for those
> who have to ensure there are indeed no violations). Two things
> that have to be kept well in mind are:

My point is that someone in the future may decide to use a tool that 
will complain about your change here. A possible course of action would 
be to revert the patch but this would not work for Eclair.

By explicitly mentioning Eclair in the commit message/title, you are 
making a statement that a simple revert would not work. This will save a 
lot of back and forth, including arguments on the ML.

Cheers,

-- 
Julien Grall

