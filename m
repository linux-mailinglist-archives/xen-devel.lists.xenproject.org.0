Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08EE1CD682
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:27:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY5e8-0004X6-W2; Mon, 11 May 2020 10:26:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HsYJ=6Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jY5e7-0004X1-Sg
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:26:51 +0000
X-Inumbo-ID: ed4ef032-9371-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed4ef032-9371-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GoavD/MUgf+PSwDniYE0pGVYwTzzjpu0yCLvKrwJIPM=; b=3xgzBAkOl6QCdU6GL3H0sdgjht
 W0wNbGQpmK7lOgAB9d0pULooLFtqPGe+GBIbwhl+ICacyIxrTVkL2foC7X2fn5fpIbqoW1LgPZoMN
 1qK4qD6xH25nkYL/WAMRkcibTXaIY5HNow9vYOPexdr2RxBQZq0NmTwhQJNUqBne6XtQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jY5e6-0003DG-Ga; Mon, 11 May 2020 10:26:50 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jY5e6-0000cZ-5E; Mon, 11 May 2020 10:26:50 +0000
Subject: Re: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
 <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cc94a26c-3364-163a-4ec6-f410c17c671f@xen.org>
Date: Mon, 11 May 2020 11:26:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 11/05/2020 11:10, Andrew Cooper wrote:
> On 11/05/2020 10:34, Julien Grall wrote:
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
>>>    xen/arch/arm/tee/optee.c | 24 ++++++++++++++++++++----
>>>    1 file changed, 20 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
>>> index 6a035355db..af19fc31f8 100644
>>> --- a/xen/arch/arm/tee/optee.c
>>> +++ b/xen/arch/arm/tee/optee.c
>>> @@ -1099,6 +1099,26 @@ static int handle_rpc_return(struct
>>> optee_domain *ctx,
>>>            if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_ALLOC )
>>>                call->rpc_buffer_type =
>>> shm_rpc->xen_arg->params[0].u.value.a;
>>>    +        /*
>>> +         * OP-TEE signals that it frees the buffer that it requested
>>> +         * before. This is the right for us to do the same.
>>> +         */
>>> +        if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_FREE )
>>> +        {
>>> +            uint64_t cookie = shm_rpc->xen_arg->params[0].u.value.b;
>>> +
>>> +            free_optee_shm_buf(ctx, cookie);
>>> +
>>> +            /*
>>> +             * This should never happen. We have a bug either in the
>>> +             * OP-TEE or in the mediator.
>>> +             */
>>> +            if ( call->rpc_data_cookie && call->rpc_data_cookie !=
>>> cookie )
>>> +                gprintk(XENLOG_ERR,
>>> +                        "Saved RPC cookie does not corresponds to
>>> OP-TEE's (%"PRIx64" != %"PRIx64")\n",
>>
>> s/corresponds/correspond/
>>
>>> +                        call->rpc_data_cookie, cookie);
>>
>> IIUC, if you free the wrong SHM buffer then your guest is likely to be
>> running incorrectly afterwards. So shouldn't we crash the guest to
>> avoid further issue?
> 
> No - crashing the guest prohibits testing of the interface, and/or the
> guest realising it screwed up and dumping enough state to usefully debug
> what is going on.

The comment in the code suggests it is a bug in the OP-TEE/mediator:

/*
  * This should never happen. We have a bug either in the
  * OP-TEE or in the mediator.
  */

So I am not sure why this would be the guest fault here.

> 
> Furthermore, if userspace could trigger this path, we'd have to issue an
> XSA.

Why so? We don't issue XSAs for hypercalls issued through privcmd. While 
this is not hypercalls but close enough as this is using smc (Supervisor 
Mode Call) and hvc. Both are only accessible from kernel mode.

> 
> Crashing the guest is almost never the right thing to do, and definitely
> not appropriate for a bad parameter.

AFAICT, the bad parameter is not from the guest but OP-TEE firmware (or 
mediator) itself. If OP-TEE/mediator is returning buggy value, then it 
may mean you break the isolation. So I don't think simply printing a 
message and continue is the right thing to do.

Cheers,

-- 
Julien Grall

