Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CF5FD95F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421973.667720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixYH-0004bL-GN; Thu, 13 Oct 2022 12:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421973.667720; Thu, 13 Oct 2022 12:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixYH-0004Zq-CX; Thu, 13 Oct 2022 12:43:05 +0000
Received: by outflank-mailman (input) for mailman id 421973;
 Thu, 13 Oct 2022 12:43:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oixYF-0004Zk-B5
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:43:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oixYF-00078A-32; Thu, 13 Oct 2022 12:43:03 +0000
Received: from [15.248.2.148] (helo=[10.24.69.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oixYE-0006Es-UJ; Thu, 13 Oct 2022 12:43:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=Zl6lblYWbiXHkP3SMtuGSxke69bxE+42uQOZFTfd4eY=; b=LxXf/jpzWzQC94WD5mdHUWqcgZ
	Q0C+AGKEKadUmiYLffkI/bywaDSDzSq8Gj1FxZMjsak24IPMu8q/j5epjbUGtNZfDGAgt9/Hdkqv9
	fEr3G2cjQEIvHe3w93p+xp/v5QJzYRgA3lKMyqs5/hsOFtKoED2eaRWxvafu2BwIID/Q=;
Message-ID: <adb0b677-8fd8-1b31-9011-27833da343da@xen.org>
Date: Thu, 13 Oct 2022 13:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
In-Reply-To: <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 13/10/2022 11:58, Julien Grall wrote:
>>>
>>>> +     * when the domain is created. Considering the worst case for page
>>>> +     * tables and keep a buffer, populate 16 pages to the P2M pages 
>>>> pool
>>> here.
>>>> +     */
>>>> +    if ( (rc = p2m_set_allocation(d, 16, NULL)) != 0 )
>>>> +    {
>>>> +        p2m_set_allocation(d, 0, NULL);
>>>
>>> Shouldn't this be done in p2m_fiinal_teardown() to cover so the pages
>>> will be freed anything after this call will fail (include in the caller
>>> domain_create())?
>>
>> Hmm, yes, I will remove this p2m_set_allocation(d, 0, NULL); in v2.
> 
> Just to clarify, I meant that a call in p2m_final_teardown() *is* 
> missing in p2m_final_teardown() (or wherever we decide to add).
> 
> This would make this one redundant.

While chatting with you on IRC, I realized that a call to 
p2m_set_allocation() will only freed unused P2M pages. If some of them 
are in the P2M then they would be skipped.

This means we also need to call p2m_teardown() (which would need to be 
optionally preemptible).

Cheers,

-- 
Julien Grall

