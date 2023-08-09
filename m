Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1E776680
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 19:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581267.909871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTn4e-0007qk-VD; Wed, 09 Aug 2023 17:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581267.909871; Wed, 09 Aug 2023 17:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTn4e-0007oU-SL; Wed, 09 Aug 2023 17:34:20 +0000
Received: by outflank-mailman (input) for mailman id 581267;
 Wed, 09 Aug 2023 17:34:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTn4d-0007oO-Mq
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 17:34:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTn4c-0007Mm-Uv; Wed, 09 Aug 2023 17:34:18 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTn4c-0007dh-Kh; Wed, 09 Aug 2023 17:34:18 +0000
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
	bh=dvABPzMPqixvm+5Bz9qkLEvwpUhsKZKnJlXFqeYdjBQ=; b=Ic2u3D5/FNJZEp52KnUH8tDh91
	TF5hR62ME40gxBj6ebIPUVCJXjAWEbDlaQdDDvUhAPqQQ3mg7+AiKLQRD4GfkbtfDo+bMV7EVi8TH
	NVOa+klOzAU7XYfG3rQNMxIKiVwUL2WeW9T26nPnnDqHJ/MSFh/1v+/F+sIstcoaoC7I=;
Message-ID: <79702aee-e02e-4503-a808-288ba00b8df3@xen.org>
Date: Wed, 9 Aug 2023 18:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] xen/arm: Split MMU code as the prepration of MPU
 work
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <4f43b069-cb78-f356-628e-29b8ca8e595a@xen.org>
 <AS8PR08MB7991DDC48815259C6B857E22920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991DDC48815259C6B857E22920BA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2023 04:59, Henry Wang wrote:
> Hi Julien,

Hi Henry,

-----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v4 00/13] xen/arm: Split MMU code as the prepration of
>> MPU work
>>
>> Hi,
>>
>> On 01/08/2023 04:44, Henry Wang wrote:
>>> Based on the discussion in the Xen Summit [1], sending this series out after
>>> addressing the comments in v3 [2] as the preparation work to add MPU
>> support.
>>>
>>> Mostly code movement, with some of Kconfig and build system (mainly
>> Makefiles)
>>> adjustment. No functional change expected.
>>
>> I can't really review this series without knowing how this will
>> integrate with the rest of the MPU work.
> 
> Sorry about it, I should have asked before sending the series.
> 
>> Can you at least provide a tree
>> with all the patches applied (including the MPU one)?
> 
> See [1] for the full single core MPU implementation which I've verified
> locally about the MMU and MPU single core Linux boot on FVP, and
> looks like Gitlab is also not complaining [2].

Thanks for the link!

> 
> Note that I've addressed comments from you and Ayan in v3 about the
> MMU/MPU helpers duplication and the arm32/arm64 split work. I didn't
> address the comment in [3] about the RES0 stuff, but I think this is not
> related to the MMU split series I sent yesterday to mailing list and the
> formal v4 MPU work sent to the mailing list will contain the fix for this
> comment.

Agree, the RES0 bit is MPU specific.

Cheers,

-- 
Julien Grall

