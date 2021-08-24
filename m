Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395413F5B99
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170836.311777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITFf-0007hn-FN; Tue, 24 Aug 2021 10:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170836.311777; Tue, 24 Aug 2021 10:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITFf-0007ew-CJ; Tue, 24 Aug 2021 10:01:51 +0000
Received: by outflank-mailman (input) for mailman id 170836;
 Tue, 24 Aug 2021 10:01:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mITFd-0007eq-2z
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:01:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mITFc-0008R7-S6; Tue, 24 Aug 2021 10:01:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mITFc-0003Vl-Kh; Tue, 24 Aug 2021 10:01:48 +0000
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
	bh=/f8AxZ9Yzn9f3v5ry0oTHgtpH+Yh7IChSmBNyuL2yj0=; b=1juNX2hGM+LtSKIdn3SJ8nteVq
	7IQ4uu4CFM8cc9IqAqzM1LVVbFGA2jaRmv/PIudtmTKPqaHInaKLqlSY8fD7a6ciG0/13DP8gH3oa
	Bs6klj6RdHdGIzhigw5fpBEyjmfUwzjHe1G0NAkQ/8Wepwc/GyjFalAIvfzoYLoM+enI=;
Subject: Re: [PATCH v2 0/7] xen/arm: Sanitize cpuinfo
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
 <30ad3be3-b8b2-b83f-e061-5a428175e3f4@xen.org>
 <07661F12-BA25-4854-92A3-86172AC0ACF6@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f9d7e8d4-f804-55f8-5a01-1f1733a83bdf@xen.org>
Date: Tue, 24 Aug 2021 11:01:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <07661F12-BA25-4854-92A3-86172AC0ACF6@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/08/2021 16:48, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> [Keep only arm maintainers in the CC list]
> 
>> On 23 Aug 2021, at 13:10, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 23/08/2021 11:32, Bertrand Marquis wrote:
>>> On arm architecture we might have heterogeneous platforms with different
>>> types of cores. As a guest can potentialy run on any of those cores we
>>> have to present them cpu features which are compatible with all cores
>>> and discard the features which are only available on some cores.
>>
>> Sanitizing the CPU info is important for Xen so it can correctly size the P2M, flush the cache... However, I don't think this is going to be sufficient to be able to move a vCPU between different type of pCPU.
>>
>> The main hurdle I can see so far is errata handling. Not all the errata can be fully handled in Xen so some of them are left to the guest to mitigate.
> 
> I agree this is something to work on and a problem with the current serie.
> 
>>
>> The errata are usually detected based on the MIDR while the OS is booting. IOW, a guest will not be able to know that it needs to handle an errata for pCPU B if it only runs on pCPU A.
> 
> Ack.
> 
>>
>> I don't know yet how this can be solved, but errata are not that uncommon on Arm. So until this addressed, we will still need to make sure that vCPUs are not migrated between pCPUs with at least a different MIDR.
>>
>> This prevention can be either done manually by pinning the vCPUs or implementing the proposal that Dario sent a few years ago (see [1]).
> 
> My current proposal would be the following:
> - add a command line option to allow to use all cores on a heterogeneous platform (different MIDR)

We already have a command line for heterogenous platform. How about 
re-using it?

> - taint Xen on this case
> - keep the feature sanitize as it is as on this case it will create a safer setup (apart from the errata potential problem)
> - keep current behaviour if command line option is not passed
> 
> Having a solution to enable all cores (even if it is unsafe) could still be a good improvement for development on big.LITTLE
> platforms or for people knowing how to properly configure the system to prevent the problems by using properly cpupools so
> I still think this serie with the proposed changes is still making a lot of sense.

+1.

> 
> I will start looking at a long term solution, maybe automatically create a cpupools on boot or investigate on the design you provided.

IIRC, all vCPUs of a domain needs to be in the same cpupool. If your 
plan is to expose big.LITTLE to the guest, then you would need to look 
at the design proposal from Dario.

Cheers,

-- 
Julien Grall

