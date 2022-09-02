Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773FB5AA962
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397424.637995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1fI-0001La-D6; Fri, 02 Sep 2022 08:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397424.637995; Fri, 02 Sep 2022 08:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1fI-0001I7-9g; Fri, 02 Sep 2022 08:04:36 +0000
Received: by outflank-mailman (input) for mailman id 397424;
 Fri, 02 Sep 2022 08:04:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oU1fH-0001Hz-HA
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:04:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1fH-0001Ts-8k; Fri, 02 Sep 2022 08:04:35 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1fH-0002aB-2r; Fri, 02 Sep 2022 08:04:35 +0000
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
	bh=Iww+qkUmQIk4OGAhsIEZ1lk3lfswIjMNRrkLlcu0fXY=; b=XP36nketlO92QFgYOx/Y6pB7dC
	LSTzlKeY8PqjnREn2dNnkmfwHsjOOofOSMdAPCGT30Z5fMAVauFiE1qwWMKs8edklBA9txmk+vLZt
	t0rIJ+4iCpdkbl2HINsh6cppq6pSz2oYzndNLXgn47sSxj0B8Rki7NCNoV8o982YAHzs=;
Message-ID: <ba62b094-d187-8a61-5e7d-e5d3d592ce42@xen.org>
Date: Fri, 2 Sep 2022 09:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop>
 <fc0706f6-7635-6b0d-811a-c3ed41f481fc@xen.org>
 <alpine.DEB.2.22.394.2209011849040.3931@ubuntu-linux-20-04-desktop>
 <PAXPR08MB74203A415B8F56B83B20B7739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB74206D3DB72C207F1E2EC2739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB74206D3DB72C207F1E2EC2739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wei,

On 02/09/2022 04:07, Wei Chen wrote:
> 
> 
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Wei
>> Chen
>> Sent: 2022年9月2日 11:03
>> To: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
>> <julien@xen.org>
>> Cc: Henry Wang <Henry.Wang@arm.com>; xen-devel@lists.xenproject.org;
>> Bertrand Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>
>> Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and
>> heap allocator
>>
>> Hi Julien and Stefano,
>>
>>> -----Original Message-----
>>> From: Stefano Stabellini <sstabellini@kernel.org>
>>> Sent: 2022年9月2日 9:51
>>> To: Julien Grall <julien@xen.org>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>; Henry Wang
>>> <Henry.Wang@arm.com>; xen-devel@lists.xenproject.org; Bertrand Marquis
>>> <Bertrand.Marquis@arm.com>; Wei Chen <Wei.Chen@arm.com>; Volodymyr
>> Babchuk
>>> <Volodymyr_Babchuk@epam.com>
>>> Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and
>>> heap allocator
>>>
>>> On Thu, 1 Sep 2022, Julien Grall wrote:
>>>> Hi Stefano,
>>>
>>
>>> In any case, I think we can postpone to after the release.
> 
> Maybe we can add some notes to say that this feature is still
> experimental in EFI + DTS boot?

Why EFI + DTS only? Regardless the discussion about how to properly 
checking the region, I think this wants to be a tech preview.

Cheers,

-- 
Julien Grall

