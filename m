Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072AD3F4A6A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 14:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170404.311201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI8qX-0002tZ-Ts; Mon, 23 Aug 2021 12:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170404.311201; Mon, 23 Aug 2021 12:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI8qX-0002qz-Qq; Mon, 23 Aug 2021 12:14:33 +0000
Received: by outflank-mailman (input) for mailman id 170404;
 Mon, 23 Aug 2021 12:14:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mI8qW-0002qt-AJ
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 12:14:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI8qV-000278-DA; Mon, 23 Aug 2021 12:14:31 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI8qV-0005EL-7c; Mon, 23 Aug 2021 12:14:31 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=l+wpBVu7YLc5UHm7qm4O0gMelctUgnDrA1VRd6IVyE0=; b=OK4qJLD6yzxftWhhm3EEa9k50W
	9z5dYCvzlajdWCmc/NFL49/jzE6ah1evpzJDaLDsnRt6O/R1qlEEPUZ4vKr7FqJgcJi0yGqBvptdZ
	bN8tTsnm4VpXC2QmCGA4Cgq13s2rbxrxuqq+apYVmjTMHlMCcb6WI+c1Rient08TkIKc=;
Subject: Re: [PATCH v2 5/7] xen/arm: Use sanitize values for p2m
From: Julien Grall <julien@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
 <b6d656bd249e85ef192a0bbddae1eb8492e51583.1629713932.git.bertrand.marquis@arm.com>
 <7c8684a1-a20f-0534-2a4b-3a778a80166b@xen.org>
Message-ID: <9b3acf5f-4937-4f4f-d392-f37dcc0e7c3c@xen.org>
Date: Mon, 23 Aug 2021 13:14:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7c8684a1-a20f-0534-2a4b-3a778a80166b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/08/2021 12:47, Julien Grall wrote:
> Hi Bertrand,
> 
> On 23/08/2021 11:32, Bertrand Marquis wrote:
>> Replace the code in p2m trying to find a sane value for the VMID size
>> supported and the PAR to use. We are now using the boot cpuinfo as the
>> values there are sanitized during boot and the value for those
>> parameters is now the safest possible value on the system.
>>
>> On arm32, the system will panic if there are different types of core so
>> those checks were not needed anyway.
> 
> So the assumption is that if you have the same MIDR, then you must have 
> the same features. I understand this is what Xen assumes today but I 
> never viewed that check as the truth. It is more to limit the damage on 
> most platform.
> 
> So can you confirm whether this is something that Arm guarantees?
> 
> That said, I am not against removing the code. But I would like the 
> comment to be amended if this is not a correct assumption.

s/comment/commit message/.

> Cheers,
> 

-- 
Julien Grall

