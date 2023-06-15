Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83AC7320C9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 22:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549817.858576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tQ6-0000cJ-MP; Thu, 15 Jun 2023 20:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549817.858576; Thu, 15 Jun 2023 20:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tQ6-0000Yn-JO; Thu, 15 Jun 2023 20:18:14 +0000
Received: by outflank-mailman (input) for mailman id 549817;
 Thu, 15 Jun 2023 20:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9tQ5-0000Yh-5q
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 20:18:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9tQ4-0006N8-Hf; Thu, 15 Jun 2023 20:18:12 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9tQ4-0001Ts-Bd; Thu, 15 Jun 2023 20:18:12 +0000
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
	bh=jtZKD26kUdhPWE7c6OM5qsUOkMskYdjWVF8qnBnZvKs=; b=4gHZZ0k4Kw6oqBt33cl3JKLC/E
	HNK0RvF++YquCG8sJHuGQ3YZaoMheGDY2tMKkA86kpiVL79QZcMOS7lgkLCnYpmpYhJXQdMcW97Ws
	l897hqifxt5QjhDPK6qS/OBv+c+uvu2z/+6vuHeWrEG8kZme1QaSzfuUShnLZKFMqCeU=;
Message-ID: <c1bb5894-e6ac-f6f3-bd89-9a454f7c2c05@xen.org>
Date: Thu, 15 Jun 2023 21:18:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen/arch/arm/traps: remove inlining of
 handle_ro_raz()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <98c6fb7ace8fce22bc263fe1d7fffac4e8130b57.1686835890.git.federico.serafini@bugseng.com>
 <7a3becdb-6002-47ce-96f0-844fff23ee7b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7a3becdb-6002-47ce-96f0-844fff23ee7b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2023 15:49, Michal Orzel wrote:
> Hi Federico,
> 
> NIT: for Arm, we use "xen/arm: " as a component name in a commit title or if you want to also specify
> the sub component, then "xen/arm: <subcomponent>: " e.g. "xen/arm: traps: "
> 
> On 15/06/2023 15:50, Federico Serafini wrote:
>>
>>
>> To comply with MISRA C:2012 Rule 8.10 ("An inline function shall be
>> declared with the static storage class"), remove inline function
>> specifier from handle_ro_raz() since asking the compiler to inline
>> such function does not seem to add any kind of value.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I will update the title while committing.

Cheers,

-- 
Julien Grall

