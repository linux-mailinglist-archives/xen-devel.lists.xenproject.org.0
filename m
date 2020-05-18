Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B011D7306
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 10:34:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jabDR-0006qA-TQ; Mon, 18 May 2020 08:33:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/+tu=7A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jabDQ-0006q5-5J
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 08:33:40 +0000
X-Inumbo-ID: 4565dfc2-98e2-11ea-a841-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4565dfc2-98e2-11ea-a841-12813bfff9fa;
 Mon, 18 May 2020 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RhCPo2G5xnrshzZHN/F6+mQVwMUA8xrhcFyLYhc6USE=; b=kwsfwk3doSQJTs0PxwlFK7nWxx
 FvYXJwR5YiWIfOQH1L24HYZRiHaVNdrfBE7YaD7ASoyiGXQzthciJwz2x5lCxjZis7Uo5S/8xMoHN
 jp4KpHKi4PBRjti+w4w3d2Get7LWM1gYjkLxRDTUYGbOM4OLVYdKEACMeE08unOCcztU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jabDN-0002fJ-BL; Mon, 18 May 2020 08:33:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jabDN-0007em-49; Mon, 18 May 2020 08:33:37 +0000
Subject: Re: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
 <878c09ec58b9c9bef81497fa7e7a0ac47ddd8f21.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <15c29139-e790-e085-9d86-3f806cd19f3a@xen.org>
Date: Mon, 18 May 2020 09:33:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <878c09ec58b9c9bef81497fa7e7a0ac47ddd8f21.camel@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/05/2020 03:04, Volodymyr Babchuk wrote:
> Hi Julien,

Hi,

> On Mon, 2020-05-11 at 10:34 +0100, Julien Grall wrote:
>> Hi Volodymyr,
>>
>> On 06/05/2020 02:44, Volodymyr Babchuk wrote:
>>> Normal World can share buffer with OP-TEE for two reasons:
>>> 1. Some client application wants to exchange data with TA
>>> 2. OP-TEE asks for shared buffer for internal needs
>>>
>>> The second case was handle more strictly than necessary:
>>>
>>> 1. In RPC request OP-TEE asks for buffer
>>> 2. NW allocates buffer and provides it via RPC response
>>> 3. Xen pins pages and translates data
>>> 4. Xen provides buffer to OP-TEE
>>> 5. OP-TEE uses it
>>> 6. OP-TEE sends request to free the buffer
>>> 7. NW frees the buffer and sends the RPC response
>>> 8. Xen unpins pages and forgets about the buffer
>>>
>>> The problem is that Xen should forget about buffer in between stages 6
>>> and 7. I.e. the right flow should be like this:
>>>
>>> 6. OP-TEE sends request to free the buffer
>>> 7. Xen unpins pages and forgets about the buffer
>>> 8. NW frees the buffer and sends the RPC response
>>>
>>> This is because OP-TEE internally frees the buffer before sending the
>>> "free SHM buffer" request. So we have no reason to hold reference for
>>> this buffer anymore. Moreover, in multiprocessor systems NW have time
>>> to reuse buffer cookie for another buffer. Xen complained about this
>>> and denied the new buffer registration. I have seen this issue while
>>> running tests on iMX SoC.
>>>
>>> So, this patch basically corrects that behavior by freeing the buffer
>>> earlier, when handling RPC return from OP-TEE.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>    xen/arch/arm/tee/optee.c | 24 ++++++++++++++++++++----
>>>    1 file changed, 20 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
>>> index 6a035355db..af19fc31f8 100644
>>> --- a/xen/arch/arm/tee/optee.c
>>> +++ b/xen/arch/arm/tee/optee.c
>>> @@ -1099,6 +1099,26 @@ static int handle_rpc_return(struct optee_domain *ctx,
>>>            if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_ALLOC )
>>>                call->rpc_buffer_type = shm_rpc->xen_arg->params[0].u.value.a;
>>>    
>>> +        /*
>>> +         * OP-TEE signals that it frees the buffer that it requested
>>> +         * before. This is the right for us to do the same.
>>> +         */
>>> +        if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_FREE )
>>> +        {
>>> +            uint64_t cookie = shm_rpc->xen_arg->params[0].u.value.b;
>>> +
>>> +            free_optee_shm_buf(ctx, cookie);
>>> +
>>> +            /*
>>> +             * This should never happen. We have a bug either in the
>>> +             * OP-TEE or in the mediator.
>>> +             */
>>> +            if ( call->rpc_data_cookie && call->rpc_data_cookie != cookie )
>>> +                gprintk(XENLOG_ERR,
>>> +                        "Saved RPC cookie does not corresponds to OP-TEE's (%"PRIx64" != %"PRIx64")\n",
>>
>> s/corresponds/correspond/
> Will fix in the next version.
> 
>>> +                        call->rpc_data_cookie, cookie);
>>
>> IIUC, if you free the wrong SHM buffer then your guest is likely to be
>> running incorrectly afterwards. So shouldn't we crash the guest to avoid
>> further issue?
>>
> 
> Well, we freed the exact buffer that OP-TEE asked us to free. So guest
> didn't anything bad. Moreover, optee driver in Linux kernel does not
> have similar check, so it will free this buffer without any complains.
> I'm just being overcautious here. Thus, I see no reason to crash the
> guest.

My point is not whether the guest did anything bad but whether 
acknowledging a bug and continuing like nothing happened is the right 
thing to do.

I can't judge whether the bug is critical enough. However I don't 
consider a single message on the console to be sufficient in a case of a 
bug. This is likely going to be missed and it may cause side-effect 
which may only be noticed a long time after. The amount of debugging 
required to figure out the original problem may be quite consequent.

The first suggestion would be to expand your comment and explain why it 
is fine continue.

Secondly, if it is consider safe to continue but still needs attention, 
then I would suggest to add a WARN() to make easier to spot in the log.

Cheers,

-- 
Julien Grall

