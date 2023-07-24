Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6FC75F808
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568958.889206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvQC-0007Lq-VY; Mon, 24 Jul 2023 13:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568958.889206; Mon, 24 Jul 2023 13:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvQC-0007KA-Rh; Mon, 24 Jul 2023 13:16:20 +0000
Received: by outflank-mailman (input) for mailman id 568958;
 Mon, 24 Jul 2023 13:16:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qNvQC-0007K2-3j
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:16:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNvQB-0000vC-8U; Mon, 24 Jul 2023 13:16:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qNvQA-00049t-V5; Mon, 24 Jul 2023 13:16:19 +0000
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
	bh=bz+o/Hq9OltO/IW7Qgu7d5gD1r3RxbSX/CoTGtoJgcU=; b=h8ohktsOIpVk1qdwbp/Xt42hsk
	Yponiq4vOAFc5VcykOCN3MaQWkCTa7ce0GGr61qnseIuR+dMtVu5DMmTo7IjkEjJGqQclLc7naDIS
	AOsR231xAPTpKm9LSiYNs4nUbRQWba3rN4hob6BV/72v9YVoGnQG9aMkWu7464E/oPdY=;
Message-ID: <9de1b328-a1d3-1544-addb-5909618df2ba@xen.org>
Date: Mon, 24 Jul 2023 14:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/dt: Rework the prototype of dt_property_read_string()
 to help Eclair
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230724102443.91894-1-julien@xen.org>
 <014b6c1a-9e83-15f7-67d7-74afaf97b9a2@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <014b6c1a-9e83-15f7-67d7-74afaf97b9a2@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 24/07/2023 13:58, Nicola Vetrini wrote:
> 
> 
> On 24/07/23 12:24, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Eclair vXXX is unable to prove the parameter out_string will only be
>> used the return of dt_property_read_string() is 0. So it will consider
>> that MISRA C:2012 Rule 9.1 was violated.
> 
> This is not correct: ECLAIR cannot prove that the rule is not violated, 
> and hence emits a caution, because the analysis is sound.

Ok. How about: "So it will not be able to prove that MISR C:2012 Rule 
9.1 wasn't violated"?

> 
>>
>> Rework the prototype so the string is returned and use ERR_PTR() to
>> embed the error code.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> The XXX should be replaced with the version of Eclair. Nicola, can you
>> provide it?
> 
> I don't see as valuable mentioning ECLAIR at all, but rather explain 
> what the change is about (encoding the error value as a return value and 
> removing the **out_value parameter).
If Eclair didn't report a caution, then I would not have spent time 
writing this patch.

Also, the point of mentioning the Eclair version is that if someone ever 
want to change the prototype back to where it was (e.g. because another 
tools is unhappy), then we have some details on why it was done and way 
to reproduce. This would avoid endless argument on the ML on whether it 
is safe to revert it.

So overall, the value is not necessarily for today, but for the future 
reader.

Cheers,

-- 
Julien Grall

