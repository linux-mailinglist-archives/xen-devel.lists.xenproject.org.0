Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA34A981D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 12:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265379.458744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwKe-0000CK-Pb; Fri, 04 Feb 2022 11:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265379.458744; Fri, 04 Feb 2022 11:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwKe-00009I-MO; Fri, 04 Feb 2022 11:00:48 +0000
Received: by outflank-mailman (input) for mailman id 265379;
 Fri, 04 Feb 2022 11:00:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFwKd-00009C-5F
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 11:00:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFwKb-0007Kr-Rr; Fri, 04 Feb 2022 11:00:45 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.2.73])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFwKb-0005AC-Lw; Fri, 04 Feb 2022 11:00:45 +0000
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
	bh=gqgnLLmbPo+T3r4xhRHV2tZ9fcEAOm2xqli39SrES64=; b=gcNtWYaUU8OV+xyBUv7olGLw6G
	HMq7cB1y/i9LkZ54Uz4txjGrCc6OGqLycpQc+fgxBEmYj6gbn1T8glCx/Bi4z3mnFGDf6r4zQcTcq
	K75xZ5KvqeaZd99dMN4WoOVePKSwMMA/qZiHraQHLFJ3cghdmW1zjeGi1yw23UQgQ+m4=;
Message-ID: <e5f0fd5d-b685-c559-6850-c2e06824b7d7@xen.org>
Date: Fri, 4 Feb 2022 11:00:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-2-andr2000@gmail.com>
 <000ac24e-fdac-855d-7fb4-2165a1192ea4@xen.org>
 <19e50632-5865-9a75-756b-88db85007e96@epam.com>
 <d9741ff0-2152-6792-5249-09e3b0960972@xen.org>
 <43cab3d0-1a62-dca0-0d2d-5ea8fe237b21@epam.com>
 <ad90a3df-7049-8ff2-979a-dec3b8c542a1@xen.org>
 <86e51f3c-6ef8-a86d-acf3-38334db430a7@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <86e51f3c-6ef8-a86d-acf3-38334db430a7@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/02/2022 10:35, Oleksandr Andrushchenko wrote:
> 
> 
> On 04.02.22 11:57, Julien Grall wrote:
>> Hi,
>>
>> On 04/02/2022 09:47, Oleksandr Andrushchenko wrote:
>>>>> Could you please help me with the exact message you would like to see?
>>>>
>>>> Here a summary of the discussion (+ some my follow-up thoughts):
>>>>
>>>> is_memory_hole() was recently introduced on x86 (see commit 75cc460a1b8c "xen/pci: detect when BARs are not suitably positioned") to check whether the BAR are positioned outside of a valid memory range. This was introduced to work-around quirky firmware.
>>>>
>>>> In theory, this could also happen on Arm. In practice, this may not happen but it sounds better to sanity check that the BAR contains "valid" I/O range.
>>>>
>>>> On x86, this is implemented by checking the region is not described is in the e820. IIUC, on Arm, the BARs have to be positioned in pre-defined ranges. So I think it would be possible to implement is_memory_hole() by going through the list of hostbridges and check the ranges.
>>>>
>>>> But first, I'd like to confirm my understanding with Rahul, and others.
>>>>
>>>> If we were going to go this route, I would also rename the function to be better match what it is doing (i.e. it checks the BAR is correctly placed). As a potentially optimization/hardening for Arm, we could pass the hostbridge so we don't have to walk all of them.
>>> It seems this needs to live in the commit message then? So, it is easy to find
>>> as everything after "---" is going to be dropped on commit
>> I expect the function to be fully implemented before this is will be merged.
>>
>> So if it is fully implemented, then a fair chunk of what I wrote would not be necessary to carry in the commit message.
> Well, we started from that we want *something* with TODO and now
> you request it to be fully implemented before it is merged.

I don't think I ever suggested this patch would be merged as-is. Sorry 
if this may have crossed like this.

Instead, my intent by asking you to send a TODO patch is to start a 
discussion how this function could be implemented for Arm.

You sent a TODO but you didn't provide any summary on what is the issue, 
what we want to achieve... Hence my request to add a bit more details so 
the other reviewers can provide their opinion more easily.

Cheers,

-- 
Julien Grall

