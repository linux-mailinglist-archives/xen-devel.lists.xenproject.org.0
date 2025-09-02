Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E37B40706
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106677.1457310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utS7Q-0008NK-NI; Tue, 02 Sep 2025 14:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106677.1457310; Tue, 02 Sep 2025 14:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utS7Q-0008Kt-Jg; Tue, 02 Sep 2025 14:36:20 +0000
Received: by outflank-mailman (input) for mailman id 1106677;
 Tue, 02 Sep 2025 14:36:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utS7O-0008Kn-St
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:36:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utS7K-002vWc-1E;
 Tue, 02 Sep 2025 14:36:14 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utS7K-00DB6X-1H;
 Tue, 02 Sep 2025 14:36:14 +0000
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
	bh=TuzUObI3LBItJXyXZ1OioYm+qlsQl8xxeE5D0ZjfQxw=; b=IQVNW2TQgOehj0t26MDuot/lR7
	N7+bFjMlMFhfnCEnfpPz3Vf5CWyhh8oarnTscgFjfO1V+jdHyxa4EnEPeKFk5pc1zAzeFXIxrPtvN
	yJ6ZU/0QJktCTC2jMcRMPfN+/jnH2Bvk5cb46Pbh1sOk6Wnvqx2TQhPQaJEtHZUpsidg=;
Message-ID: <1b79fedd-582b-4ec0-aa85-d4ae100eba1d@xen.org>
Date: Tue, 2 Sep 2025 15:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
 <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
 <b2968b50-3ca6-416b-86d9-c809ef87c567@xen.org>
 <4e01ed71-cdbb-4d41-8845-33449b08494b@amd.com>
 <8af7ca62-2f05-47d9-8604-170e7a40d8a0@xen.org>
 <411d7b0f-01b8-46df-9bce-929eec366d2d@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <411d7b0f-01b8-46df-9bce-929eec366d2d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 02/09/2025 15:00, Oleksandr Tyshchenko wrote:
> 
> 
> On 02.09.25 15:19, Julien Grall wrote:
> 
> Hello Julien
> 
>> On 02/09/2025 13:10, Orzel, Michal wrote:
>>>
>>>
>>> On 02/09/2025 13:54, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 02/09/2025 11:18, Orzel, Michal wrote:
>>>>>
>>>>>
>>>>> On 02/09/2025 11:49, Oleksandr Tyshchenko wrote:
>>>>>> The said sub-op is not supported on Arm, since it:
>>>>>>     - does not support the buffered emulation (so bufioreq_port/
>>>>>> bufioreq_gfn
>>>>>>       cannot be returned), please refer to ioreq_server_create()
>>>>>>     - does not support "legacy" mechanism of mapping IOREQ Server
>>>>>>       magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned),
>>>>>> please
>>>>>>       refer to arch_ioreq_server_map_pages(). On Arm, only the Acquire
>>>>>>       Resource infrastructure is used to query and map the IOREQ
>>>>>> Server pages.
>>>>>>
>>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>>>
>>>>> Could we perhaps add a Fixes tag here pointing to the commit
>>>>> introducing these
>>>>> DM ops and thus add this patch for this release? Not sure what
>>>>> others think.
>>>>
>>>> Fixes usually implies a bug and I don't see what bug we are solving. In
>>>> fact, I don't understand why we are trying to remove the subop...
>>> Hmm, the issue is that the subop that is not supported at the moment
>>> is listed
>>> as supported in the public header.
>>
>> [...]
>>
>>> As for the code, from safety perspective if this subop is listed
>>> explicilty in Arm's
>>> dm.c, we would need to write a separate test case and test to cover it
>>> that at
>>> the end, still returns -EOPNOTSUPP.
>>
>> Why do you think it is not supported? AFAICT, it is still possible to
>> pass XEN_DMOP_nognfs to figure out whwether bufioreq is currently
>> available. The error code would be 0 not -EOPNOTSUPP.
> 
> 
> Yes, by passing XEN_DMOP_no_gfns we will bypass
> arch_ioreq_server_map_pages() call, and yes, ioreq_server_get_info()
> will return 0 in that case.
> 
> But, "bufioreq_port" field in struct xen_dm_op_get_ioreq_server_info
> (out param) won't be really updated (since the IOREQ Server was created
> with HVM_IOREQSRV_BUFIOREQ_OFF before that).

Sure. But this would be the same behavior on x86, right? If so...

> 
> So, "at the moment", XEN_DMOP_get_ioreq_server_info sub-op is
> non-functional/useless on Arm ("unsupported" is probably not a precise
> word in that particular case), this is my understanding (which might be
> wrong). That is why I have sent a patch to remove the mention from the
> public header.
... I still don't understand why we are just trying to sweep the problem 
under the rug on Arm.

That's assuming there is one. If there is a problem, then we should fix 
it properly for all architectures. If there is no problem, then this 
patch should not exists.

Cheers,

-- 
Julien Grall


