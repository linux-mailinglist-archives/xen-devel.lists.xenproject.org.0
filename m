Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE147A67DA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604882.942428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicVw-0001tv-Hy; Tue, 19 Sep 2023 15:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604882.942428; Tue, 19 Sep 2023 15:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicVw-0001rn-DZ; Tue, 19 Sep 2023 15:19:48 +0000
Received: by outflank-mailman (input) for mailman id 604882;
 Tue, 19 Sep 2023 15:19:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qicVv-0001rF-3y
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:19:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qicVu-0006YU-HW; Tue, 19 Sep 2023 15:19:46 +0000
Received: from [15.248.3.4] (helo=[10.24.67.44])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qicVu-0001N3-8D; Tue, 19 Sep 2023 15:19:46 +0000
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
	bh=Z2lx6ONGQm2uS+X+WAnyQzXiR1Ccu298NDollx8pxf8=; b=7FoawOrRFvbCQahLmkk+V1sulj
	UY0UOhLRmefImiMA9gH+vh1IOMiRTsXxtNICcVEUhlZjqGWkyZR0PXNqNceqk1J1Jd71GgSXN75SV
	4l+I+le5j6N1n0ZV0ToMWwXpxe8XdBEdibvd4hFtsHWYC34rNF62RtFtG3Sren9CunxQ=;
Message-ID: <597db9f5-b959-4b75-9410-0d0c16e3acda@xen.org>
Date: Tue, 19 Sep 2023 16:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-3-volodymyr_babchuk@epam.com>
 <1614d73f-72b0-44f2-8e34-0e6c58a1a375@xen.org> <87fs3afcxb.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87fs3afcxb.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/09/2023 15:36, Volodymyr Babchuk wrote:
> Julien Grall <julien@xen.org> writes:
>> On 19/09/2023 12:28, Volodymyr Babchuk wrote:
>>> There is no need to invalidate cache entry because we just wrote into a
>>> memory region. Writing itself guarantees that cache entry is valid.
>>
>> The goal of invalidate is to remove the line from the cache. So I
>> don't quite understand the reasoning here.
>>
> 
> Well, I may be wrong, but what is the goal in removing line from the
> cache? As I see this, we want to be sure that ITS sees data written in
> the memory, so we should flush a cache line. But why do we need to
> remove it from CPU's cache?

I don't exactly know. From a brief look I agree with you. However, our 
driver is based on Linux where the clean & invalidate is also used. So I 
am a little be cautious to remove it.

The way forward would be to ask the Marc Zyngier (GICv3 maintainer) why 
it was added in Linux. Then we can decide whether this can be removed in 
Xen.

Cheers,

-- 
Julien Grall

