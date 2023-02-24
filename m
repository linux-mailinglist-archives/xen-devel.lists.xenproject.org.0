Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C26A1F3B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501245.772908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaVq-0007Cx-QQ; Fri, 24 Feb 2023 16:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501245.772908; Fri, 24 Feb 2023 16:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaVq-0007B2-NQ; Fri, 24 Feb 2023 16:01:34 +0000
Received: by outflank-mailman (input) for mailman id 501245;
 Fri, 24 Feb 2023 16:01:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVaVp-0007Ar-9T
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:01:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVaVp-0002Sg-6t; Fri, 24 Feb 2023 16:01:33 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.156.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVaVp-0004NT-1d; Fri, 24 Feb 2023 16:01:33 +0000
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
	bh=95FPTHzD+3E2P5+fq2zcpOgCjxu434nv+7It7boYjBE=; b=lDUwy9Pfo5RywqUqStuC/tatNO
	ieMOhuWyamNSF4GCQu5aZgfmZRcj3L6csvvvX/J5trGT+6XEt0xXg6rYfImdDAXSzo2srXIXj/Xde
	KgHPUqayC7a7hEs5l27O9LF13LDVhuoe16FU8DtNLksKmULpk96LWfvFTAOd/V7WcLI4=;
Message-ID: <3bb3e5d3-06c5-8c06-014e-5aef226b5f31@xen.org>
Date: Fri, 24 Feb 2023 16:01:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: xenstored: Interaction bettwen SET_PERMS and transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b7b9bde2-5856-979d-a2e4-d01145a0cb6c@xen.org>
 <338d9214-fce4-6158-7696-bf8a7421ee9a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <338d9214-fce4-6158-7696-bf8a7421ee9a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 24/02/2023 16:00, Juergen Gross wrote:
> On 24.02.23 16:00, Julien Grall wrote:
>> Hi Juergen,
>>
>> For some internal purpose, I need to write a script that would do the 
>> following:
>>
>>    1) Start a transaction
>>    2) Call GET_PERMS
>>    3) Call SET_PERMS with the permission just retrieved
>>    4) Commit the transaction
>>
>> (Don't ask why :))
>>
>> This was executed from dom0 on every nodes. In some cases, we noticed 
>> that 4) would return -ENOSPC.
>>
>> When digging through the code, it looks like this is because 
>> transaction_fix_domains() (now called acc_fix_domains()) will check 
>> that the quota is correct.
>>
>> The domain is question were over its limit, but given this is called 
>> by dom0, I would have expected that it should not never return -ENOSPC 
>> (note that a SET_PERMS outside of a transaction would work, but this 
>> can't be used our case).
>>
>> Furthermore, the transaction is not changing any accounting. So I find 
>> a bit strange that we would prevent it even if this was run from an 
>> unprivileged domain.
>>
>> Do you know if this issues would be fixed by your current rework?
>>
>> If not, then I think we at least want to skip the quota check if the 
>> domain is privileged.
>>
>> For non-privileged domain, I am not entirely sure what to do. I was 
>> originally thinking to check if cd->nbentry is 0 and then skip the 
>> quota check. But this would allow a domain to remove a node and then 
>> replace by a new one (I think we still want to forbid that).
>>
>> What do you think?
> 
> Patch sent. Could you please test it with your script?

Thanks! I will give a try next week and let you know the result.

Cheers,

-- 
Julien Grall

