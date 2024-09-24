Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02B984A50
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 19:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803275.1213782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st9OH-0007sf-9L; Tue, 24 Sep 2024 17:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803275.1213782; Tue, 24 Sep 2024 17:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st9OH-0007r5-6T; Tue, 24 Sep 2024 17:31:57 +0000
Received: by outflank-mailman (input) for mailman id 803275;
 Tue, 24 Sep 2024 17:31:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1st9OF-0007qz-HZ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 17:31:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st9OF-0005LR-2K; Tue, 24 Sep 2024 17:31:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st9OE-0000bI-RY; Tue, 24 Sep 2024 17:31:54 +0000
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
	bh=fA6MF0vzXGquGJOWUNdKDg8l46JBWYF/RPdrWQYAmog=; b=nTzOFnJbZXytwNNu5zDwnDl4JQ
	XWk1eu+WXolb0c9CMzP80mBOeaErORx6Ex9K56lK3C9pLZ0Tm8g2gxScPkhVZ7MHwtvbbIRUJnkQJ
	zykxnZjIk5/nb6qt5Su16+swvql4fTxrD82JE9Dq8ddy7+f8P84PAajoB9mU65Us1ACQ=;
Message-ID: <530ad746-a84b-45e4-89e1-c350eac255ac@xen.org>
Date: Tue, 24 Sep 2024 18:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] xen/arm: ffa: Rework feature discovery
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <6c841c341b7dc9e06eb1c02555e30b29bd400d20.1726676338.git.bertrand.marquis@arm.com>
 <4f1c91c2-a4ec-4dcf-a5b8-7d0607b1778c@xen.org>
 <66012F72-AEF4-478C-98A2-6D37195348B5@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <66012F72-AEF4-478C-98A2-6D37195348B5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 24/09/2024 09:16, Bertrand Marquis wrote:
>> On 22 Sep 2024, at 11:07, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 19/09/2024 14:19, Bertrand Marquis wrote:
>>> Store the list of ABI we need in a list and go through the list instead
>>> of having a list of conditions inside the code.
>>> No functional change.
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>>   xen/arch/arm/tee/ffa.c | 61 +++++++++++++++++++++---------------------
>>>   1 file changed, 30 insertions(+), 31 deletions(-)
>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>> index 7c84aa6aa43d..7ff2529b2055 100644
>>> --- a/xen/arch/arm/tee/ffa.c
>>> +++ b/xen/arch/arm/tee/ffa.c
>>> @@ -74,6 +74,24 @@
>>>   /* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
>>>   static uint32_t __ro_after_init ffa_fw_version;
>>>   +/* List of ABI we use from the firmware */
>>> +static const uint32_t ffa_fw_feat_needed[] = {
>>> +    FFA_VERSION,
>>> +    FFA_FEATURES,
>>> +    FFA_NOTIFICATION_BITMAP_CREATE,
>>> +    FFA_NOTIFICATION_BITMAP_DESTROY,
>>> +    FFA_PARTITION_INFO_GET,
>>> +    FFA_NOTIFICATION_INFO_GET_64,
>>> +    FFA_NOTIFICATION_GET,
>>> +    FFA_RX_RELEASE,
>>> +    FFA_RXTX_MAP_64,
>>> +    FFA_RXTX_UNMAP,
>>> +    FFA_MEM_SHARE_32,
>>> +    FFA_MEM_SHARE_64,
>>> +    FFA_MEM_RECLAIM,
>>> +    FFA_MSG_SEND_DIRECT_REQ_32,
>>> +    FFA_MSG_SEND_DIRECT_REQ_64,
>>> +};
>>
>> NIT: As we are creating an array, could be take the opportunity to provide a name for each feature (we could use macro for that)? This would make easier for the user to know which feature is missing.
> 
> In fact those are not "features" per say but ABI we need to use with the firmware so maybe i should first rename the variable to say abi instead of feat.

Thanks for the clarification! With that in mind...

> 
> Now we could create some features out of those as in practice several ABIs are needed to be able to use one feature (for example notifications support require the INFO_GET and the GET).
> 
> In your mind you wanted to have something like:
> "Version", FFA_VERSION
> "Direct Messages", FFA_MSG_SEND_DIRECT_REQ_32,
> "Direct Messages", FFA_MSG_SEND_DIRECT_REQ_64
> 
> So that we could print a more meaningfull name or would you be ok with just printing "FFA_MSG_SEND_DIRECT_REQ_32" ?

... I was more thinking about printing which ABI is missing. This is 
more helpful to the user than knowning which features will be missing.

This has also the advantage that we can use macro to generate the names.

Cheers,

-- 
Julien Grall


