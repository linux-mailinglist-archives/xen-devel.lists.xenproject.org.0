Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5137FD14
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 20:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127028.238684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhFmK-0004DG-Ks; Thu, 13 May 2021 18:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127028.238684; Thu, 13 May 2021 18:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhFmK-0004BF-H4; Thu, 13 May 2021 18:09:44 +0000
Received: by outflank-mailman (input) for mailman id 127028;
 Thu, 13 May 2021 18:09:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhFmI-0004B9-Uj
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 18:09:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhFmH-00086d-FI; Thu, 13 May 2021 18:09:41 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhFmH-0005NU-8r; Thu, 13 May 2021 18:09:41 +0000
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
	bh=MgLoHA2k7GO7Z2EQR8jSmJY7nUTs06X7ED5K0XMm7d4=; b=V2sHJkHKzRz+7GgsfdF0/MPgIR
	r3cXFZ979bLKcQdgiw3ruSXb4mpm2UTd5AERp6vnXp+vJoY9faYDoNZ3+eSPwmAsMOGTEhGiyAcTA
	1jbvxQQu66kNp5HRVUAz5Xh4h537l7K39jksCtkcco25c0Q7U7Eo/U3WY5bS+W8x338g=;
Subject: Re: [PATCH RFCv2 10/15] xen/arm: mm: Allocate xen page tables in
 domheap rather than xenheap
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-11-julien@xen.org>
 <alpine.DEB.2.21.2105121529180.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9429bec0-8706-42b9-cda6-77adde961235@xen.org>
Date: Thu, 13 May 2021 19:09:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105121529180.5018@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/05/2021 23:44, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> xen_{un,}map_table() already uses the helper to map/unmap pages
>> on-demand (note this is currently a NOP on arm64). So switching to
>> domheap don't have any disavantage.
>>
>> But this as the benefit:
>>      - to keep the page tables unmapped if an arch decided to do so
>>      - reduce xenheap use on arm32 which can be pretty small
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks for the patch. It looks OK but let me ask a couple of questions
> to clarify my doubts.
> 
> This change should have no impact to arm64, right?
> 
> For arm32, I wonder why we were using map_domain_page before in
> xen_map_table: it wasn't necessary, was it? In fact, one could even say
> that it was wrong?
In xen_map_table() we need to be able to map pages from Xen binary, 
xenheap... On arm64, we would be able to use mfn_to_virt() because 
everything is mapped in Xen. But that's not the case on arm32. So we 
need a way to map anything easily.

The only difference between xenheap and domheap are the former is always 
mapped while the latter may not be. So one can also view a xenheap page 
as a glorified domheap.

I also don't really want to create yet another interface to map pages 
(we have vmap(), map_domain_page(), map_domain_global_page()...). So, 
when I implemented xen_map_table() a couple of years ago, I came to the 
conclusion that this is a convenient (ab)use of the interface.

Cheers,

-- 
Julien Grall

