Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779142004ED
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:23:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmDEr-0002o9-GV; Fri, 19 Jun 2020 09:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m4t/=AA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jmDEq-0002o4-Ek
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:23:08 +0000
X-Inumbo-ID: 7c811b6c-b20e-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c811b6c-b20e-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4L1+2ofd40nD+e0zXmN+kCCWAhLuklnDtMFFkL2Aesg=; b=DGBQNRngAfaSBS6rU9H0dDGWFG
 QcZn+l2trWP5oMplR3QnOEPgPB6zHeWo3bhCYHk6rBPvqlcx84sp2jc8xI4EJ/NDdBE1BxowQrdKR
 +xNd5EmWsUsFoGg0QhU+v+QtF6O6LBNncAB9vn68seILvpgn4XoQyFIESSjBByIgkS3w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmDEp-00035H-Cg; Fri, 19 Jun 2020 09:23:07 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmDEp-0007Ii-5v; Fri, 19 Jun 2020 09:23:07 +0000
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org> <878sgk2bst.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8d2f3475-4191-fa80-f476-e72af73e0559@xen.org>
Date: Fri, 19 Jun 2020 10:23:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <878sgk2bst.fsf@epam.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 19/06/2020 00:29, Volodymyr Babchuk wrote:
> 
> Hi Julien,

Hi Volodymyr,

> 
> Julien Grall writes:
> 
>> (+Paul)
>>
>> Hi,
>>
>> On 18/05/2020 02:53, Volodymyr Babchuk wrote:
>>> Trusted Applications use popular approach to determine required size
>>> of buffer: client provides a memory reference with the NULL pointer to
>>> a buffer. This is so called "Null memory reference".  TA updates the
>>
>> NIT: You use double space after '.' here but all the others use a
>> single space.
> 
> Oops, missed that.
> 
>>> reference with the required size and returns it back to client. Then
>>> client allocates buffer of needed size and repeats the operation.
>>>
>>> This behavior is described in TEE Client API Specification, paragraph
>>> 3.2.5. Memory References.
>>
>>  From the spec, it is not a clear cut that NULL will always used as
>> fetching the required size of an output buffer. In particular, they
>> suggest to refer to the protocol.
>>
>> In your commit message you indirectly point to an example where 0/NULL
>> would have a different meaning depending on the flags. This is not
>> explained in the TEE Client API Specification. Do you have some
>> pointer I could use to check the behavior?
> 
> Well, GP specification describes application interface. It does not
> specifies how implementation should handle this internally. Basically,
> GP defines functions, data types, macros, etc to be used by CAs and
> TAs. But it does not define how exactly call from CA will be delivered
> to TA. Implementation is free to use any means as far, as they conform
> with rules described in the specification.
> 
> OPTEE's REE<->TEE interface is described in the header files, that I
> added to xen (optee_msg.h, optee_rpc_cmd.h,optee_smc.h). But it does not
> describe every aspect, unfortunately.

Thanks for digging-through! More below.

> 
>>>
>>> OP-TEE represents this null memory reference as a TMEM parameter with
>>> buf_ptr == NULL. This is the only case when we should allow TMEM
>>> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.
>>
>> IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the buffer
>> at address 0" but with the flag cleared, it would mean "return the
>> size". Am I correct?
> 
> Not exactly. This flag does not affect behavior for buffers with address
> NULL. In any case, this would not mean "return the size" to
> OP-TEE. This is because OP-TEE works as a transport between CA and TA
> and it does not assign any meaning to client buffers. But certainly,
> null buffer will mean "return the size" for some TAs, as described in
> GlobalPlatform specification.

Does it mean a guest TA may potentially access address 0?

I am asking that because 0 can be a valid host physical address. We are 
currently carving out 0 from the heap allocator to workaround a bug, but 
there is no promise this address will be used by the boot allocator and 
therefore Xen.

> Reason why I prohibited buffers without OPTEE_MSG_ATTR_NONCONTIG flag in
> the the original patch is that such buffers could span across page
> boundary, which is no-go for fragmented p2m.
> 
> But I missed that special case: null buffer without
> OPTEE_MSG_ATTR_NONCONTIG flag. As this is a special type of buffer, it
> can be allowed with and without said flag.

Looking at translate_noncontig(), there is no specific treatment for 
NULL. So the address will get translated. This is likely to result to an 
error as usually a guest doesn't have anything mapped at address 0.

Did I miss anything?

Cheers,

-- 
Julien Grall

