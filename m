Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BAD6EC7B4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525190.816226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrIu-0000JG-QD; Mon, 24 Apr 2023 08:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525190.816226; Mon, 24 Apr 2023 08:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrIu-0000FX-MO; Mon, 24 Apr 2023 08:12:08 +0000
Received: by outflank-mailman (input) for mailman id 525190;
 Mon, 24 Apr 2023 08:12:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pqrIt-0000FR-4a
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:12:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqrIs-0004yr-FL; Mon, 24 Apr 2023 08:12:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqrIs-0006gy-9O; Mon, 24 Apr 2023 08:12:06 +0000
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
	bh=pCgIVEL+Cqz/tjpINl/21T7ppjaJXybvIn8sEOMR5ZM=; b=HeBY3KIE8fg088QfG2fi6ito/i
	DyXLJbjVfcjRNkyoNYbkfQL3TOmiKLHxbZ4y8XYO24xpE8Y6Whe55nvDB3HaCobvHPlJwlXWIuNBP
	+nZIE9vWU+9Ac18EnqBuz3JRi7c+LrCEiy4/K8kZVuppDaIwOAdlWf1l0/UXPRfNs2yI=;
Message-ID: <bac775c3-8a28-bd69-8c2a-bd1c9a8d6d4c@xen.org>
Date: Mon, 24 Apr 2023 09:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 01/10] xen/arm: domain_build: Track unallocated pages
 using the frame number
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-2-ayan.kumar.halder@amd.com>
 <77b015b2-cc30-0534-4e0c-c392b5e8a7b3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <77b015b2-cc30-0534-4e0c-c392b5e8a7b3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/04/2023 13:05, Michal Orzel wrote:
> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>
>>
>> rangeset_{xxx}_range() functions are invoked with 'start' and 'size' as
>> arguments which are either 'uint64_t' or 'paddr_t'. However, the function
>> accepts 'unsigned long' for 'start' and 'size'. 'unsigned long' is 32 bits for
>> Arm32. Thus, there is an implicit downcasting from 'uint64_t'/'paddr_t' to
>> 'unsigned long' when invoking rangeset_{xxx}_range().
>>
>> So, it may seem there is a possibility of lose of data due to truncation.
>>
>> In reality, 'start' and 'size' are always page aligned. And Arm32 currently
>> supports 40 bits as the width of physical address.
>> So if the addresses are page aligned, the last 12 bits contain zeroes.
>> Thus, we could instead pass page frame number which will contain 28 bits (40-12
>> on Arm32) and this can be represented using 'unsigned long'.
>>
>> On Arm64, this change will not induce any adverse side effect as the width of
>> physical address is 48 bits.
> NIT: This reads as const, so it would be better to write: "as the max supported width of ..."
> 
> Thus, the width of 'gfn' (ie 48 - 12 = 36) can be
>> represented using 'unsigned long' (which is 64 bits wide).
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> With or without (after all this is just a commit msg):

It is always good to have accurate commit message for the future reader.

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

-- 
Julien Grall

