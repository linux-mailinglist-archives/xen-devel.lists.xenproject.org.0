Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEAB205383
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 15:32:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnj1m-00047V-BB; Tue, 23 Jun 2020 13:31:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaA/=AE=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jnj1k-00047Q-IH
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 13:31:52 +0000
X-Inumbo-ID: e51977c4-b555-11ea-bf69-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e51977c4-b555-11ea-bf69-12813bfff9fa;
 Tue, 23 Jun 2020 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ijd+Fveth8imWAvlOuPD1VFNh4Y4ifIWJ3J6sUSMolc=; b=cbHBd2H5FeJ7eB2iQmhBNOeeHR
 /uUieutH8vfSsoFkPsGxJmUlrgnYCy3dCp1K7NwCSXzJM840Hq1bvDDOqUYPy9JQtulLvtgs9EKM9
 2OpJd8x7YutWE/iwGdiN9/uE88SFlsIrnhVlCzMcqsMugxefrzTOxeWq1NtD75KuTbNU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnj1i-0004zE-Eg; Tue, 23 Jun 2020 13:31:50 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnj1i-0008MI-8H; Tue, 23 Jun 2020 13:31:50 +0000
Subject: Re: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
 <20200619223332.438344-3-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.21.2006221809380.8121@sstabellini-ThinkPad-T480s>
 <87ftampkd7.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2df789f3-e881-36a3-51f4-010b499990f5@xen.org>
Date: Tue, 23 Jun 2020 14:31:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87ftampkd7.fsf@epam.com>
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
 "pdurrant@amazon.com" <pdurrant@amazon.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 23/06/2020 03:49, Volodymyr Babchuk wrote:
> 
> Hi Stefano,
> 
> Stefano Stabellini writes:
> 
>> On Fri, 19 Jun 2020, Volodymyr Babchuk wrote:
>>> Trusted Applications use popular approach to determine required size
>>> of buffer: client provides a memory reference with the NULL pointer to
>>> a buffer. This is so called "Null memory reference". TA updates the
>>> reference with the required size and returns it back to the
>>> client. Then client allocates buffer of needed size and repeats the
>>> operation.
>>>
>>> This behavior is described in TEE Client API Specification, paragraph
>>> 3.2.5. Memory References.
>>>
>>> OP-TEE represents this null memory reference as a TMEM parameter with
>>> buf_ptr = 0x0. This is the only case when we should allow TMEM
>>> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag. This also the
>>> special case for a buffer with OPTEE_MSG_ATTR_NONCONTIG flag.
>>>
>>> This could lead to a potential issue, because IPA 0x0 is a valid
>>> address, but OP-TEE will treat it as a special case. So, care should
>>> be taken when construction OP-TEE enabled guest to make sure that such
>>> guest have no memory at IPA 0x0 and none of its memory is mapped at PA
>>> 0x0.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>
>>> Changes from v1:
>>>   - Added comment with TODO about possible PA/IPA 0x0 issue
>>>   - The same is described in the commit message
>>>   - Added check in translate_noncontig() for the NULL ptr buffer
>>>
>>> ---
>>>   xen/arch/arm/tee/optee.c | 27 ++++++++++++++++++++++++---
>>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
>>> index 6963238056..70bfef7e5f 100644
>>> --- a/xen/arch/arm/tee/optee.c
>>> +++ b/xen/arch/arm/tee/optee.c
>>> @@ -215,6 +215,15 @@ static bool optee_probe(void)
>>>       return true;
>>>   }
>>>   
>>> +/*
>>> + * TODO: There is a potential issue with guests that either have RAM
>>> + * at IPA of 0x0 or some of theirs memory is mapped at PA 0x0. This is
>>                                 ^ their
>>
>>> + * because PA of 0x0 is considered as NULL pointer by OP-TEE. It will
>>> + * not be able to map buffer with such pointer to TA address space, or
>>> + * use such buffer for communication with the guest. We either need to
>>> + * check that guest have no such mappings or ensure that OP-TEE
>>> + * enabled guest will not be created with such mappings.
>>> + */
>>>   static int optee_domain_init(struct domain *d)
>>>   {
>>>       struct arm_smccc_res resp;
>>> @@ -725,6 +734,15 @@ static int translate_noncontig(struct optee_domain *ctx,
>>>           uint64_t next_page_data;
>>>       } *guest_data, *xen_data;
>>>   
>>> +    /*
>>> +     * Special case: buffer with buf_ptr == 0x0 is considered as NULL
>>> +     * pointer by OP-TEE. No translation is needed. This can lead to
>>> +     * an issue as IPA 0x0 is a valid address for Xen. See the comment
>>> +     * near optee_domain_init()
>>> +     */
>>> +    if ( !param->u.tmem.buf_ptr )
>>> +        return 0;
>>
>> Given that today it is not possible for this to happen, it could even be
>> an ASSERT. But I think I would just return an error, maybe -EINVAL?
> 
> Hmm, looks like my comment is somewhat misleading :(

How about the following comment:

We don't want to translate NULL (0) as it can be used by the guest to 
fetch the size of the buffer to allocate. This behavior depends on TA, 
but there is a guarantee that OP-TEE will not try to map it (see more 
details on top of optee_domain_init()).

> 
> What I mean, is that param->u.tmem.buf_ptr == 0 is the normal situation.
> This is the special case, when OP-TEE treats this buffer as a NULL. So
> we are doing nothing there. Thus, "return 0".
> 
> But, as Julien pointed out, we can have machine where 0x0 is the valid
> memory address and there is a chance, that some guest will use it as a
> pointer to buffer.
> 
>> Aside from this, and the small grammar issue, everything else looks fine
>> to me.
>>
>> Let's wait for Julien's reply, but if this is the only thing I could fix
>> on commit.

I agree with Volodymyr, this is the normal case here. There are more 
work to prevent MFN 0 to be mapped in the guest but this shouldn't be an 
issue today.

Cheers,

-- 
Julien Grall

