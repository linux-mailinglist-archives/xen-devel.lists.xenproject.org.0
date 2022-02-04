Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532584A96FB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:41:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265301.458638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFv5h-0004BU-6S; Fri, 04 Feb 2022 09:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265301.458638; Fri, 04 Feb 2022 09:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFv5h-00049O-3G; Fri, 04 Feb 2022 09:41:17 +0000
Received: by outflank-mailman (input) for mailman id 265301;
 Fri, 04 Feb 2022 09:41:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFv5f-00049I-Fu
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:41:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFv5e-0005td-Ox; Fri, 04 Feb 2022 09:41:14 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.2.73])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFv5e-00081t-IR; Fri, 04 Feb 2022 09:41:14 +0000
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
	bh=mBtYiWysKWiP29tVIhYQCH7+vJLjrvISMol4iats01w=; b=5e1m2gQ7wwO1irsV0HA7dQZ4K4
	fZ6oelho4ePMDeJRiZ8Hdwia37dvtgcg2nt0apo264mEroiOvFIDnA+gIvLUKgAGj8mHOm28dvKKu
	k9SnSxb7iNmB3Nova35BtRCbuGnhEsVPO/m2emQYWDk06w1mNF+dwhisybfYkjt29jic=;
Message-ID: <d9741ff0-2152-6792-5249-09e3b0960972@xen.org>
Date: Fri, 4 Feb 2022 09:41:11 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <19e50632-5865-9a75-756b-88db85007e96@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/02/2022 09:01, Oleksandr Andrushchenko wrote:
> On 04.02.22 10:51, Julien Grall wrote:
>> Hi,
>>
>> On 04/02/2022 06:34, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Add a stub for is_memory_hole which is required for PCI passthrough
>>> on Arm.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> ---
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> New in v6
>>> ---
>>>    xen/arch/arm/mm.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index b1eae767c27c..c32e34a182a2 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -1640,6 +1640,12 @@ unsigned long get_upper_mfn_bound(void)
>>>        return max_page - 1;
>>>    }
>>>    +bool is_memory_hole(mfn_t start, mfn_t end)
>>> +{
>>> +    /* TODO: this needs to be properly implemented. */
>>
>> I was hoping to see a summary of the discussion from IRC somewhere in the patch (maybe after ---). This would help to bring up to speed the others that were not on IRC.
> I am not quite sure what needs to be put here as the summary

At least some details on why this is a TODO. Is it because you are 
unsure of the implementation? Is it because you wanted to send early?...

IOW, what are you expecting from the reviewers?

> Could you please help me with the exact message you would like to see?

Here a summary of the discussion (+ some my follow-up thoughts):

is_memory_hole() was recently introduced on x86 (see commit 75cc460a1b8c 
"xen/pci: detect when BARs are not suitably positioned") to check 
whether the BAR are positioned outside of a valid memory range. This was 
introduced to work-around quirky firmware.

In theory, this could also happen on Arm. In practice, this may not 
happen but it sounds better to sanity check that the BAR contains 
"valid" I/O range.

On x86, this is implemented by checking the region is not described is 
in the e820. IIUC, on Arm, the BARs have to be positioned in pre-defined 
ranges. So I think it would be possible to implement is_memory_hole() by 
going through the list of hostbridges and check the ranges.

But first, I'd like to confirm my understanding with Rahul, and others.

If we were going to go this route, I would also rename the function to 
be better match what it is doing (i.e. it checks the BAR is correctly 
placed). As a potentially optimization/hardening for Arm, we could pass 
the hostbridge so we don't have to walk all of them.

Cheers,

-- 
Julien Grall

