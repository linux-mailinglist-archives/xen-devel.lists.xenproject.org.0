Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EF96272C2
	for <lists+xen-devel@lfdr.de>; Sun, 13 Nov 2022 22:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443038.697421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouKkk-0000mT-KF; Sun, 13 Nov 2022 21:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443038.697421; Sun, 13 Nov 2022 21:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouKkk-0000jO-HG; Sun, 13 Nov 2022 21:42:58 +0000
Received: by outflank-mailman (input) for mailman id 443038;
 Sun, 13 Nov 2022 21:42:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ouKki-0000jI-UV
 for xen-devel@lists.xenproject.org; Sun, 13 Nov 2022 21:42:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ouKki-0007YV-Kl; Sun, 13 Nov 2022 21:42:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ouKki-0001mM-Ev; Sun, 13 Nov 2022 21:42:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=/ypwJxiHzPl9vExkIEqQHC4z5UcjeSfFVjYZkhhExrc=; b=SrAZ5RJv6RIn0BAtwpum5G8o1s
	L5RXxTjbtiRATcir8v8Zd+08fMoouOcBdPwXbwChWUdGEtvsuDfecDClKNjaatz120R6Xwy9UmZlz
	TFeGT0Kk3Xpu9P8/PnzvsTztwVFg5Z6iKdnwZIhCUTpBK+Exr6f7QGf4cR0W1v3grsaw=;
Message-ID: <927355c8-aea1-83c4-60c1-b06f8e0f182f@xen.org>
Date: Sun, 13 Nov 2022 21:42:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-9-wei.chen@arm.com>
 <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
 <PAXPR08MB74206E8C1513DC90DCD71CEC9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
In-Reply-To: <PAXPR08MB74206E8C1513DC90DCD71CEC9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/11/2022 07:36, Wei Chen wrote:
> Hi Julien,

Hi Wei,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年11月7日 4:06
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
>> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Henry Wang <Henry.Wang@arm.com>
>> Subject: Re: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S
>> to head_mmu.S
>>
>> Hi Wei,
>>
>> On 04/11/2022 10:07, Wei Chen wrote:
>>> There are lots of MMU specific code in head.S. This code will not
>>> be used in MPU systems. If we use #ifdef to gate them, the code
>>> will become messy and hard to maintain. So we move MMU related
>>> code to head_mmu.S, and keep common code still in head.S.
>>
>> I am afraid that you can't simply move the MMU code out of head.S
>> because this will break Xen when running using the identity map.
>>
>> This is because we only map the first 4KB of Xen with PA == VA. At the
>> moment, we guarantee it by having everything that needs to be used in
>> the identity mapping before _end_boot and checking at link time if this
>> fits in 4KB.
>>
>> Now that you moved the MMU code outside of head.S. We need to find a
>> different way to guarantee it. One way to do it would be to create a
>> section that would be used for everything that needs to be identity mapped.
>>
> 
> Quote from next email
> "
> Looking at the code this morning, I noticed that we already have the
> section ".text.header". For now, that should do the job. So we just need
> to check the size of .text.header.
> 
> Ideally, checking the size should be done in a separate pre-patch so it
> is easier to review.
> "
> 
> OK. We will create a patch to check the size, and place it in the
> head of the series.

I thought a bit more about what I wrote. Xen binary should always start 
with the Image/Zimage header. At the moment, this is guaranteed because 
there is only one object using the section .text.header.

With the change introduced in this patch, there will be multiple objects 
using with the sections .text.header. This means we are relying on the 
compiler to always put the content of head.S first.

This is basically reverting to the behavior before commit 4267a33b19d 
("xen/build: put image header into a separate section").

Therefore we do need a separate section to be used for head_*.S and 
maybe part of head.S. This new section could be called text.idmap so we 
know what the section is used for.

Cheers,

-- 
Julien Grall

