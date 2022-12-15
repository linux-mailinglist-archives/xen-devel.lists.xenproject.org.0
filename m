Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA064DAA5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 12:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463343.721509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mjM-0001Ws-L8; Thu, 15 Dec 2022 11:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463343.721509; Thu, 15 Dec 2022 11:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mjM-0001UY-IJ; Thu, 15 Dec 2022 11:48:52 +0000
Received: by outflank-mailman (input) for mailman id 463343;
 Thu, 15 Dec 2022 11:48:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5mjL-0001US-DL
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 11:48:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mjK-0000sx-Ti; Thu, 15 Dec 2022 11:48:50 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.85.36.201])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mjK-00089F-Ld; Thu, 15 Dec 2022 11:48:50 +0000
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
	bh=qnLBV7KKs6q81TdD/t1q4AMwJ45czQCYUMDDWXhiV30=; b=DI8IyLJaoRlSaQ/PIoEfb/YNrh
	IBrWiJEZ7t3TH2UfE0MGPnEJgkCJw4rLATyyWjnk8RqHTLV5jzKXHpdYIuKh0iyWVUdYEVSKh8HX8
	LTnLe4suL09YmVBrOkc2dWIHFxgoDHjpMEEfn/21D12JQbgMJ/NR6AupT76uX6iIgM7A=;
Message-ID: <b457e07f-8ec6-66b8-dad6-15125b9c9151@xen.org>
Date: Thu, 15 Dec 2022 11:48:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 00/18] xen/arm: Don't switch TTBR while the MMU is on
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, Luca.Fancellu@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/2022 09:55, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> Currently, Xen on Arm will switch TTBR whilst the MMU is on. This is
> similar to replacing existing mappings with new ones. So we need to
> follow a break-before-make sequence.
> 
> When switching the TTBR, we need to temporary disable the MMU
> before updating the TTBR. This means the page-tables must contain an
> identity mapping.
> 
> The current memory layout is not very flexible and has an higher chance
> to clash with the identity mapping.
> 
> On Arm64, we have plenty of unused virtual address space Therefore, we can
> simply reshuffle the layout to leave the first part of the virtual
> address space empty.
> 
> On Arm32, the virtual address space is already quite full. Even if we
> find space, it would be necessary to have a dynamic layout. So a
> different approach will be necessary. The chosen one is to have
> a temporary mapping that will be used to jumped from the ID mapping
> to the runtime mapping (or vice versa). The temporary mapping will
> be overlapping with the domheap area as it should not be used when
> switching on/off the MMU.
> 
> The Arm32 part is not yet addressed and will be handled in a follow-up
> series.
> 
> After this series, most of Xen page-table code should be compliant
> with the Arm Arm. The last two issues I am aware of are:
>   - domheap: Mappings are replaced without using the Break-Before-Make
>     approach.
>   - The cache is not cleaned/invalidated when updating the page-tables
>     with Data cache off (like during early boot).
> 
> The long term plan is to get rid of boot_* page tables and then
> directly use the runtime pages. This means for coloring, we will
> need to build the pages in the relocated Xen rather than the current
> Xen.
> 
> For convience, I pushed a branch with everything applied:
> 
> https://xenbits.xen.org/git-http/people/julieng/xen-unstable.git
> branch boot-pt-rework-v3
> 
> Cheers,
> 
> Julien Grall (18):
>    xen/arm: Enable use of dump_pt_walk() early during boot

[...]

>    xen/arm: mm: Allow xen_pt_update() to work with the current root table
>    xen/arm: mm: Allow dump_hyp_walk() to work on the current root table

I have pushed those 3 patches because they are ready.

Cheers,

-- 
Julien Grall

