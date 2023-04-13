Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11FC6E0D86
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520688.808543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwBg-0001x9-U4; Thu, 13 Apr 2023 12:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520688.808543; Thu, 13 Apr 2023 12:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwBg-0001to-RE; Thu, 13 Apr 2023 12:36:28 +0000
Received: by outflank-mailman (input) for mailman id 520688;
 Thu, 13 Apr 2023 12:36:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmwBf-0001tf-HJ
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:36:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwBf-00025L-3y; Thu, 13 Apr 2023 12:36:27 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmwBe-00056E-TF; Thu, 13 Apr 2023 12:36:27 +0000
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
	bh=rFaQOQZqtnuZCv66vbPgUNGabOZCkbkvgGmoXQcw9Yw=; b=TXYAaVXq0oLG7bDbTNU6uUCqSE
	VqnqfX7vZp3irdfobVXvVSjoQ4XDv6WNcsbG5Nhmu+2szP99ainFVkbqMWU7RviO26XsKK3gD2wtF
	mIARx/mUsmOUwtdvG+IhyGDskc4SgnV1lx8CloV3O/Krcq6ktI/q0sqQk4B9ycIXC5W4=;
Message-ID: <137a1457-aacc-e763-b313-4266be3fa032@xen.org>
Date: Thu, 13 Apr 2023 13:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-9-jens.wiklander@linaro.org>
 <AS8PR08MB7991020B2BB9676DACD2494392989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991020B2BB9676DACD2494392989@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/04/2023 12:07, Henry Wang wrote:
> Hi Jens,
> 
>> -----Original Message-----
>> Subject: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
>>
>> Adds support for the FF-A function FFA_ID_GET to return the ID of the
>> calling client.
>>
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> ---
>>   xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 90ed71cbfda3..f129879c5b81 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -181,6 +181,12 @@ static bool ffa_get_version(uint32_t *vers)
>>       return true;
>>   }
>>
>> +static uint16_t get_vm_id(const struct domain *d)
>> +{
>> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
>> +    return d->domain_id + 1;
> 
> Since here you want 0 to be reserved, I think maybe you can use
> the "d->arch.p2m.vmid"? According to the logic in p2m_alloc_vmid(),
> the "d->arch.p2m.vmid" is also a per-domain u16 value that starts
> from 1.

I would rather not do that for a few reasons:
  1) This is assuming the P2M code is initialized first
  2) We should not rely on the VMID to be fixed. We may need to change 
that if we want to run more VMs than the number of VMIDs (we may even 
need multiple VMIDs per domain...).

Cheers,

-- 
Julien Grall

