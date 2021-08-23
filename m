Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0739C3F4BA6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 15:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170436.311236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI9uF-0002tB-GH; Mon, 23 Aug 2021 13:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170436.311236; Mon, 23 Aug 2021 13:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI9uF-0002qE-DB; Mon, 23 Aug 2021 13:22:27 +0000
Received: by outflank-mailman (input) for mailman id 170436;
 Mon, 23 Aug 2021 13:22:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mI9uD-0002q8-4L
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 13:22:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI9uC-0003Iv-1X; Mon, 23 Aug 2021 13:22:24 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI9uB-0005iV-RI; Mon, 23 Aug 2021 13:22:23 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=6Gp4/MtC/YuJnbkLsnbOVjQlaG2aboMt4uZ39O1s70I=; b=BE7PH73pr0SE1pTNte8nj/DUiD
	Ubv0/VZ0zZjd/SQwn4u8Kfy9L08ZCzjW1UMbFFLTYyGeGnBfZ8JVMxecBiLJI11D22WnTZjb9owUO
	0j1uBr1SSrXcEcOhI1ZZ0WG05vWftrznJqX7HxPfn9ePaZMiv21gPxcOkt09t70M+2Wg=;
Subject: Re: [PATCH v2 5/7] xen/arm: Use sanitize values for p2m
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
 <b6d656bd249e85ef192a0bbddae1eb8492e51583.1629713932.git.bertrand.marquis@arm.com>
 <7c8684a1-a20f-0534-2a4b-3a778a80166b@xen.org>
 <D6083043-B649-43E1-9654-99BC1B8FEED5@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f16b3d6-8cb5-499b-6a9e-0bdc08368756@xen.org>
Date: Mon, 23 Aug 2021 14:22:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <D6083043-B649-43E1-9654-99BC1B8FEED5@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/08/2021 13:39, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 23 Aug 2021, at 12:47, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 23/08/2021 11:32, Bertrand Marquis wrote:
>>> Replace the code in p2m trying to find a sane value for the VMID size
>>> supported and the PAR to use. We are now using the boot cpuinfo as the
>>> values there are sanitized during boot and the value for those
>>> parameters is now the safest possible value on the system.
>>> On arm32, the system will panic if there are different types of core so
>>> those checks were not needed anyway.
>>
>> So the assumption is that if you have the same MIDR, then you must have the same features. I understand this is what Xen assumes today but I never viewed that check as the truth. It is more to limit the damage on most platform.
> 
> This was the assumption before, I did not change anything but just explained in the commit message why this was not possible to come to this code.

Yes. This is not a new, however I thought I would mention it because I 
want to avoid continuing to use wrong assumptions.

However, this code is arm64 only as it is #ifdef right? (Sorry I should 
have looked at the code the first time) So ...

> 
>>
>> So can you confirm whether this is something that Arm guarantees?
> 
> For a specific MIDR from Arm (ie a Cortex) the PAR is fixed and VMID size to.
> But for an other Arm architecture processor I cannot say.
> 
>>
>> That said, I am not against removing the code. But I would like the comment to be amended if this is not a correct assumption.
> 
> Would the following be acceptable:
> On arm32, Xen is not booting on systems having different MIDR amongst cores and it is assumed that cores with the same MIDR will have the same PAR and VMID size.
... I would just drop any mention of arm32 here.

Cheers,

-- 
Julien Grall

