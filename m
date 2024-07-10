Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96392CE1D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756634.1165307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTX0-0008LF-MT; Wed, 10 Jul 2024 09:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756634.1165307; Wed, 10 Jul 2024 09:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTX0-0008JJ-Ih; Wed, 10 Jul 2024 09:22:34 +0000
Received: by outflank-mailman (input) for mailman id 756634;
 Wed, 10 Jul 2024 09:22:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sRTWy-0008JD-BO
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:22:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRTWy-00064B-2F; Wed, 10 Jul 2024 09:22:32 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRTWx-0006JO-RK; Wed, 10 Jul 2024 09:22:31 +0000
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
	bh=eKFv+cAzEbVb9TqWWzAPymuAY55cN/r4OurNjcCLqmw=; b=mXMF23689wdHdVEVA3pj4DOAUQ
	O96RUczS7j/ojM8rU32PVPuIhwmtFAhgNS9VbFS0NShxv2CJIfTI5MW0lQoTnq6jbIlpVptYZfs6i
	XZxAgNbdj78/tbp7uJKEF1PsBye8X0nChADKvKeHsxsvmeUDJtj0KOeH4MSP1cTkiZF4=;
Message-ID: <10bffe82-150a-4004-b989-b78f36bb9404@xen.org>
Date: Wed, 10 Jul 2024 10:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory node
 probing
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
References: <20240626080428.18480-1-michal.orzel@amd.com>
 <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
 <b5c861a4-1431-44c5-a1ec-bc859ea011c3@amd.com>
 <ae447b0b-f791-4ca8-8b33-3600ae059b47@xen.org>
 <03bad4dd-9d6e-4341-b72c-5bb516f3ce36@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <03bad4dd-9d6e-4341-b72c-5bb516f3ce36@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/06/2024 13:01, Michal Orzel wrote:
>>>>> +/*
>>>>> + * Check if a node is a proper /memory node according to Devicetree
>>>>> + * Specification v0.4, chapter 3.4.
>>>>> + */
>>>>> +static bool __init device_tree_is_memory_node(const void *fdt, int node,
>>>>> +                                              int depth)
>>>>> +{
>>>>> +    const char *type;
>>>>> +    int len;
>>>>> +
>>>>> +    if ( depth != 1 )
>>>>> +        return false;
>>>>> +
>>>>> +    if ( !device_tree_node_matches(fdt, node, "memory") )
>>>>> +        return false;
>>>>> +
>>>>> +    type = fdt_getprop(fdt, node, "device_type", &len);
>>>>> +    if ( !type )
>>>>> +        return false;
>>>>> +
>>>>> +    if ( (len <= 0) || strcmp(type, "memory") )
>>>>
>>>> I would consider to use strncmp() to avoid relying on the property to be
>>>> well-formed (i.e. nul-terminated).
>>> Are you sure? AFAIR, libfdt returns NULL and -FDT_ERR_TRUNCATED as len if a string is non null terminated.
>>
>> I can't find such code in path. Do you have any pointer?
> I checked and I cannot find such code either. I made the wrong assumption thinking that fdt_getprop can only work with strings.
> Therefore, I'm ok with changing s/strcmp/strncmp/ for hardening. Shall I respin the patch marking it as for-4.20?

Sorry this e-mail fell through the cracks. Yes please. I need to create 
a branch to collect all simple patches for 4.20.

Cheers,

-- 
Julien Grall

