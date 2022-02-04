Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B1A4A973A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265325.458671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvLS-00076x-7w; Fri, 04 Feb 2022 09:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265325.458671; Fri, 04 Feb 2022 09:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvLS-00074B-47; Fri, 04 Feb 2022 09:57:34 +0000
Received: by outflank-mailman (input) for mailman id 265325;
 Fri, 04 Feb 2022 09:57:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFvLQ-000744-QN
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:57:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFvLQ-0006B3-4j; Fri, 04 Feb 2022 09:57:32 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.2.73])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFvLP-0000br-Up; Fri, 04 Feb 2022 09:57:32 +0000
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
	bh=1kudkR96MbM2oMcKiRN9cRxXSLnW1OKFSnC0kW4HfqI=; b=Fuef2VxD3AbYbQ5bhmubHL9BTi
	565oxp+QNtl1EoJKT9xaG1KOyOK+3e+uiMaaYH/+f4ygtiOjAeGnfs8O9Ohvl6akG3ekbpBrcTc61
	A6O7VqpLM9lnnac6KuU00NcOg7y0VQB482MvGrFshzpjO4y1Edrgynju+FkM5/dduqAk=;
Message-ID: <ad90a3df-7049-8ff2-979a-dec3b8c542a1@xen.org>
Date: Fri, 4 Feb 2022 09:57:29 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <43cab3d0-1a62-dca0-0d2d-5ea8fe237b21@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/02/2022 09:47, Oleksandr Andrushchenko wrote:
>>> Could you please help me with the exact message you would like to see?
>>
>> Here a summary of the discussion (+ some my follow-up thoughts):
>>
>> is_memory_hole() was recently introduced on x86 (see commit 75cc460a1b8c "xen/pci: detect when BARs are not suitably positioned") to check whether the BAR are positioned outside of a valid memory range. This was introduced to work-around quirky firmware.
>>
>> In theory, this could also happen on Arm. In practice, this may not happen but it sounds better to sanity check that the BAR contains "valid" I/O range.
>>
>> On x86, this is implemented by checking the region is not described is in the e820. IIUC, on Arm, the BARs have to be positioned in pre-defined ranges. So I think it would be possible to implement is_memory_hole() by going through the list of hostbridges and check the ranges.
>>
>> But first, I'd like to confirm my understanding with Rahul, and others.
>>
>> If we were going to go this route, I would also rename the function to be better match what it is doing (i.e. it checks the BAR is correctly placed). As a potentially optimization/hardening for Arm, we could pass the hostbridge so we don't have to walk all of them.
> It seems this needs to live in the commit message then? So, it is easy to find
> as everything after "---" is going to be dropped on commit
I expect the function to be fully implemented before this is will be merged.

So if it is fully implemented, then a fair chunk of what I wrote would 
not be necessary to carry in the commit message.

Cheers,

-- 
Julien Grall

