Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25D260AF60
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 17:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429233.680126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzfE-0003rB-HF; Mon, 24 Oct 2022 15:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429233.680126; Mon, 24 Oct 2022 15:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzfE-0003pL-Dw; Mon, 24 Oct 2022 15:46:56 +0000
Received: by outflank-mailman (input) for mailman id 429233;
 Mon, 24 Oct 2022 15:46:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omzfD-0003pF-1K
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 15:46:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omzfC-00061f-J5; Mon, 24 Oct 2022 15:46:54 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omzfC-0001PY-BG; Mon, 24 Oct 2022 15:46:54 +0000
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
	bh=ULTtl8PVHx2ckDx28jZKPX2oTrw1nuKEx+tTDRt8vP0=; b=yM+a/Yt6Xmt9miO2tPi+6pVy2O
	mvX4w7854X5cOSW4LgV6FovYCbiwFWzqmkaza0yKyYz15EEqFMImfJUSOpMGPqR6UaPQo+jl3XmHk
	Lnz+90S8HEiXI9x95UmRcfpE7ofGdluylRbi/mOGQqC7NTXYVZpK4Az7ixxM9zkCIbB0=;
Message-ID: <dc8b1ef5-c878-c773-0e73-51833e10e633@xen.org>
Date: Mon, 24 Oct 2022 16:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC v2 00/12] xen/arm: Don't switch TTBR while the MMU is on
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech, lucmiccio@gmail.com,
 carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <8202b890-5aea-f785-55dd-970d82f50d37@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8202b890-5aea-f785-55dd-970d82f50d37@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/10/2022 16:39, Xenia Ragiadakou wrote:
> Hi Julien

Hi Xenia,

> 
> On 10/22/22 18:04, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> Currently, Xen on Arm will switch TTBR whilst the MMU is on. This is
>> similar to replacing existing mappings with new ones. So we need to
>> follow a break-before-make sequence.
>>
>> When switching the TTBR, we need to temporary disable the MMU
>> before updating the TTBR. This means the page-tables must contain an
>> identity mapping.
>>
>> The current memory layout is not very flexible and has an higher chance
>> to clash with the identity mapping.
>>
>> On Arm64, we have plenty of unused virtual address space Therefore, we 
>> can
>> simply reshuffle the layout to leave the first part of the virtual
>> address space empty.
>>
>> On Arm32, the virtual address space is already quite full. Even if we
>> find space, it would be necessary to have a dynamic layout. So a
>> different approach will be necessary. The chosen one is to have
>> a temporary mapping that will be used to jumped from the ID mapping
>> to the runtime mapping (or vice versa). The temporary mapping will
>> be overlapping with the domheap area as it should not be used when
>> switching on/off the MMU.
>>
>> The Arm32 part is not yet addressed in this version. The series is
>> sent as an early RFC to gather some feedback on the approach.
>>
>> After this series, most of Xen page-table code should be compliant
>> with the Arm Arm. The last two issues I am aware of are:
>>   - domheap: Mappings are replaced without using the Break-Before-Make
>>     approach.
>>   - The cache is not cleaned/invalidated when updating the page-tables
>>     with Data cache off (like during early boot).
>>
>> The long term plan is to get rid of boot_* page tables and then
>> directly use the runtime pages. This means for coloring, we will
>> need to build the pages in the relocated Xen rather than the current
>> Xen.
>>
>> For convience, I pushed a branch with everything applied:
>>
>> https://xenbits.xen.org/git-http/people/julieng/xen-unstable.git
>> branch boot-pt-rework-v2
> 
> Are you sure that the branch has been pushed remotely? If yes, ignore.

I forgot to push it. It should now be pushed.

Cheers,

-- 
Julien Grall

