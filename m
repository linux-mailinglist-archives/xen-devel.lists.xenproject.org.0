Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC37174199F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 22:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556575.869210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEbsx-0000xb-14; Wed, 28 Jun 2023 20:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556575.869210; Wed, 28 Jun 2023 20:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEbsw-0000ub-U5; Wed, 28 Jun 2023 20:35:30 +0000
Received: by outflank-mailman (input) for mailman id 556575;
 Wed, 28 Jun 2023 20:35:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEbsv-0000uV-F5
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 20:35:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEbsu-0005QZ-LR; Wed, 28 Jun 2023 20:35:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.5.86])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEbsu-0007a8-FQ; Wed, 28 Jun 2023 20:35:28 +0000
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
	bh=g8BVXC2zyb1KXr5ogLVdxzZCb/RRyNAhftQfMKBDpKU=; b=NSjmj9DsddtP9QRdIhui9fLBn2
	2YF+JZ4nOXXOSlYA/X4fO7zCXqe1mPTTQZe3YbfuJQkBI6lRq8M1nlZYdZmTg33TzuNFD6REhEVSB
	QJ12sd2Lj1360e55K1oo/FN1mt0Pgfmmexc9pH3Fgpv0szT+LyziQNE2yygO7T6omebI=;
Message-ID: <3caaf967-b7ba-0915-56aa-aeff5450a456@xen.org>
Date: Wed, 28 Jun 2023 21:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <AS8PR08MB7991E5463FC69273FE7A48B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991E5463FC69273FE7A48B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2023 08:29, Henry Wang wrote:
> Hi Julien,

Hi Henry,


>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
> 
> Typo in title: s/USBAN/UBSAN/ and...
> 
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> UBSAN has been enabled a few years ago on x86 but was never
>> enabled on Arm because the final binary is bigger than 2MB (
>> the maximum we can currently handled).
>>
>> With the recent rework, it is now possible to grow Xen over 2MB.
>> So there is no more roadblock to enable Xen other than increasing
>> the reserved area.
>>
>> On my setup, for arm32, the final binaray was very close to 4MB.
>> Furthermore, one may want to enable USBAN and GCOV which would put
> 
> ...here also.
> 
>> the binary well-over 4MB (both features require for some space).
>> Therefore, increase the size to 8MB which should us some margin.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Both typos can be fixed on commit and I think I am good with the
> current approach, so:
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks, I will fix both typos.

> 
> I did a play with UBSAN enabled on FVP (arm64), in my setup,
> the result Xen file is 3.7MB:
> 
> -rwxrwxr-x  1 xinwan02 xinwan02 3.7M Jun 26 14:47 xen
> lrwxrwxrwx  1 xinwan02 xinwan02    3 Jun 26 14:47 xen.efi -> xen
> -rwxrwxr-x  1 xinwan02 xinwan02  14M Jun 26 14:47 xen-syms
> 
> and the Xen and Dom0 booted fine and I can login Dom0. So
> technically:
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> 
> However, I noticed Xen will print below during the Dom0 boot:
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in arch/arm/vgic.c:371:15
> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
> (XEN) Xen WARN at common/ubsan/ubsan.c:172
> 
> Just want to make sure you also noticed this, otherwise maybe you
> can include another patch in the series to fix this? 

I haven't seen this one. Probably because you would need a setup where 
interrupts are around ID 1022.

Or I can do that
> in case you don't have enough bandwidth.

You have the setup to exercise the problem. So it would be best if you 
do it.

Cheers,

-- 
Julien Grall

