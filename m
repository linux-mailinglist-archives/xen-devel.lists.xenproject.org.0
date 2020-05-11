Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE531CD60D
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY5Op-0003D4-B3; Mon, 11 May 2020 10:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jY5On-0003Cz-9q
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:11:01 +0000
X-Inumbo-ID: b645fe34-936f-11ea-b07b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b645fe34-936f-11ea-b07b-bc764e2007e4;
 Mon, 11 May 2020 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589191860;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FJoMCbjbJhOvYHy5EPW+wuBFemCOUU0k9wl/bu+6Bsc=;
 b=KsBMvY2DV/0/wbDmM5Z65YcF4JyPhGQ3UFlZsOyEgIrsLRXnBEY1Zj6e
 QeIfv3sAhTMnWbBrkYzLQMkrwkAR45xSPmkHGERwiVXVfRT7DmfivkFfD
 WS8I5z6ELY24LVu/v4wvNI+v376HL6npX/uz2LVCeaBjTFT9BwTJbGZw1 g=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: CdnZXZRQ0ENSIfshlULNDRMrprxrdCSpdfgDQYAfxBTUDmqEs7wM/ly2AaShST4uQ9ALXQjcTw
 +4u21gS3ysdjlJ5tLGQY1FMk6jhjpRMIjc4z78O+6ZkLfwyC38pHR30wnJt1EFMJT6W510tRWg
 hz2Izq4D2OC8STdJS5aNApQxPqVnDzblnbRB957RrYAlUS/igwOPWkjgApEcO2k3r4/DuyG7pO
 huCcETzn6uMxYphf+OOvCV7Rso7zQya1JtG/a52gQBGuBMrvepCfAA2MDI3IyYlf8BaJwR5KH1
 T5I=
X-SBRS: 2.7
X-MesageID: 17479590
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17479590"
Subject: Re: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
To: Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
Date: Mon, 11 May 2020 11:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 11/05/2020 10:34, Julien Grall wrote:
> Hi Volodymyr,
>
> On 06/05/2020 02:44, Volodymyr Babchuk wrote:
>> Normal World can share buffer with OP-TEE for two reasons:
>> 1. Some client application wants to exchange data with TA
>> 2. OP-TEE asks for shared buffer for internal needs
>>
>> The second case was handle more strictly than necessary:
>>
>> 1. In RPC request OP-TEE asks for buffer
>> 2. NW allocates buffer and provides it via RPC response
>> 3. Xen pins pages and translates data
>> 4. Xen provides buffer to OP-TEE
>> 5. OP-TEE uses it
>> 6. OP-TEE sends request to free the buffer
>> 7. NW frees the buffer and sends the RPC response
>> 8. Xen unpins pages and forgets about the buffer
>>
>> The problem is that Xen should forget about buffer in between stages 6
>> and 7. I.e. the right flow should be like this:
>>
>> 6. OP-TEE sends request to free the buffer
>> 7. Xen unpins pages and forgets about the buffer
>> 8. NW frees the buffer and sends the RPC response
>>
>> This is because OP-TEE internally frees the buffer before sending the
>> "free SHM buffer" request. So we have no reason to hold reference for
>> this buffer anymore. Moreover, in multiprocessor systems NW have time
>> to reuse buffer cookie for another buffer. Xen complained about this
>> and denied the new buffer registration. I have seen this issue while
>> running tests on iMX SoC.
>>
>> So, this patch basically corrects that behavior by freeing the buffer
>> earlier, when handling RPC return from OP-TEE.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>   xen/arch/arm/tee/optee.c | 24 ++++++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
>> index 6a035355db..af19fc31f8 100644
>> --- a/xen/arch/arm/tee/optee.c
>> +++ b/xen/arch/arm/tee/optee.c
>> @@ -1099,6 +1099,26 @@ static int handle_rpc_return(struct
>> optee_domain *ctx,
>>           if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_ALLOC )
>>               call->rpc_buffer_type =
>> shm_rpc->xen_arg->params[0].u.value.a;
>>   +        /*
>> +         * OP-TEE signals that it frees the buffer that it requested
>> +         * before. This is the right for us to do the same.
>> +         */
>> +        if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_FREE )
>> +        {
>> +            uint64_t cookie = shm_rpc->xen_arg->params[0].u.value.b;
>> +
>> +            free_optee_shm_buf(ctx, cookie);
>> +
>> +            /*
>> +             * This should never happen. We have a bug either in the
>> +             * OP-TEE or in the mediator.
>> +             */
>> +            if ( call->rpc_data_cookie && call->rpc_data_cookie !=
>> cookie )
>> +                gprintk(XENLOG_ERR,
>> +                        "Saved RPC cookie does not corresponds to
>> OP-TEE's (%"PRIx64" != %"PRIx64")\n",
>
> s/corresponds/correspond/
>
>> +                        call->rpc_data_cookie, cookie);
>
> IIUC, if you free the wrong SHM buffer then your guest is likely to be
> running incorrectly afterwards. So shouldn't we crash the guest to
> avoid further issue?

No - crashing the guest prohibits testing of the interface, and/or the
guest realising it screwed up and dumping enough state to usefully debug
what is going on.

Furthermore, if userspace could trigger this path, we'd have to issue an
XSA.

Crashing the guest is almost never the right thing to do, and definitely
not appropriate for a bad parameter.

~Andrew

