Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE8B40004
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106259.1456979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPzF-0006K4-6s; Tue, 02 Sep 2025 12:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106259.1456979; Tue, 02 Sep 2025 12:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utPzF-0006Hp-4I; Tue, 02 Sep 2025 12:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1106259;
 Tue, 02 Sep 2025 12:19:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utPzD-0006Hj-NB
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:19:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utPz6-002sVN-0p;
 Tue, 02 Sep 2025 12:19:36 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utPz6-00D4VF-0u;
 Tue, 02 Sep 2025 12:19:36 +0000
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
	bh=sOKsIW24p88VjgDar2drj4yIlw5UGQV0WxDlzQqNj8k=; b=Iq1g98H6nr0C5MNm5xyLc3KtpH
	WJQYk9er0uF+I/pk4Vi0m59RMwrON23q7SnLnOESdKfrSlalJgJPeSTOvVbuD8p6MrOqj61p1cRYd
	QMpS+Bwo82g7c9k/Oxqq0X9NfhhcqPEY23qACPZKaWxPL0nQLY0HM/TlN7Lzd6L9Aon8=;
Message-ID: <8af7ca62-2f05-47d9-8604-170e7a40d8a0@xen.org>
Date: Tue, 2 Sep 2025 13:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
 <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
 <b2968b50-3ca6-416b-86d9-c809ef87c567@xen.org>
 <4e01ed71-cdbb-4d41-8845-33449b08494b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4e01ed71-cdbb-4d41-8845-33449b08494b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 13:10, Orzel, Michal wrote:
> 
> 
> On 02/09/2025 13:54, Julien Grall wrote:
>> Hi,
>>
>> On 02/09/2025 11:18, Orzel, Michal wrote:
>>>
>>>
>>> On 02/09/2025 11:49, Oleksandr Tyshchenko wrote:
>>>> The said sub-op is not supported on Arm, since it:
>>>>    - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
>>>>      cannot be returned), please refer to ioreq_server_create()
>>>>    - does not support "legacy" mechanism of mapping IOREQ Server
>>>>      magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
>>>>      refer to arch_ioreq_server_map_pages(). On Arm, only the Acquire
>>>>      Resource infrastructure is used to query and map the IOREQ Server pages.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> Could we perhaps add a Fixes tag here pointing to the commit introducing these
>>> DM ops and thus add this patch for this release? Not sure what others think.
>>
>> Fixes usually implies a bug and I don't see what bug we are solving. In
>> fact, I don't understand why we are trying to remove the subop...
> Hmm, the issue is that the subop that is not supported at the moment is listed
> as supported in the public header.

[...]

> As for the code, from safety perspective if this subop is listed explicilty in Arm's
> dm.c, we would need to write a separate test case and test to cover it that at
> the end, still returns -EOPNOTSUPP.

Why do you think it is not supported? AFAICT, it is still possible to 
pass XEN_DMOP_nognfs to figure out whwether bufioreq is currently 
available. The error code would be 0 not -EOPNOTSUPP.

 > I think if we mistakenly mention sth as> supported in e.g. SUPPORT.md 
we would have no issues adding a Fixes tag. There
 > are many cases where Fixes was used just to change something in a 
comment, so
 > I'm having a hard time reasoning about when it's appropriate to use it.
I think what we would want is "Amends". This is currently proposed by [1].

[1] 
https://lore.kernel.org/xen-devel/e7c99116-f6a9-43e1-80ae-b3a4d44857b7@amd.com/T/#t

> 
> ~Michal
> 

-- 
Julien Grall


