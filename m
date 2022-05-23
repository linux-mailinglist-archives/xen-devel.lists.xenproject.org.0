Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAD05315DE
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 22:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336077.560353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntEEN-0004Ot-Ok; Mon, 23 May 2022 20:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336077.560353; Mon, 23 May 2022 20:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntEEN-0004MZ-LM; Mon, 23 May 2022 20:00:43 +0000
Received: by outflank-mailman (input) for mailman id 336077;
 Mon, 23 May 2022 20:00:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntEEM-0004MT-64
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 20:00:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntEEL-0007SA-Ol; Mon, 23 May 2022 20:00:41 +0000
Received: from [54.239.6.190] (helo=[192.168.27.218])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntEEL-0000Sk-Hq; Mon, 23 May 2022 20:00:41 +0000
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
	bh=wRY8tqA1hCi8XCRT4NmiiUUUX/HPYmvPuBsmr1ycrnk=; b=wKrPjBNHgNHZgPetjAwdsTPAZo
	kDA3cjmNIPE/3elbgCY3gAL5jeSbwNkKvgIY5ENiVcp8dLeWSGWFYxukOu4Ydb8R6lOxoiJfTs2Xr
	WD48jJbdpHQ/emMrLg5CeD/RnO5Hp2ytEV03VVnfkAA/dGF48lsZYidZdz2xRx1L9PFw=;
Message-ID: <3236e8e6-c25d-1733-9315-e0363cc73f84@xen.org>
Date: Mon, 23 May 2022 21:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] xen/arm: Allow setting the number of CPUs to activate at
 runtime
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220523091324.137350-1-michal.orzel@arm.com>
 <45054a80-3958-a6b8-1575-02dd5bb17892@xen.org>
 <cb1e1ce0-4667-c436-6e5d-abc26add4ebe@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb1e1ce0-4667-c436-6e5d-abc26add4ebe@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/05/2022 11:21, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 23.05.2022 12:05, Julien Grall wrote:
>> Hi,
>>
>> On 23/05/2022 10:13, Michal Orzel wrote:
>>> Introduce a command line parameter "maxcpus" on Arm to allow adjusting
>>> the number of CPUs to activate.
>>
>> The current definition "maxcpus" is not really suitable for big.LITTLE systems as you have no flexibility to say how many types of each cores you want to boot.
>>
>> Instead, Xen will pick-up the first CPUs it parsed from the firmware tables.
>>
>>
>> So what's your use-case/target?
>>
> - use cases where we have no big little (although even on big.LITTLE limiting this number makes sense if we do not care about the types)

This may make sense in debug build, but for prod I think you need some 
certainty how which CPUs you are going to use.

So I would like a warning in the documentation "maxcpus" that in 
big.LITTLE system, there are no guarantee on which types will be used.

This is technically a lie, but I don't want a user to start relying on 
how Xen will parse the DT.

> - debug cases where we want to set maxcpus=1

Thanks for the clarification. I would be happy to add my tag with a 
warning in the documentation.

Cheers,

-- 
Julien Grall

