Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058D381712
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 11:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127701.240021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhqCs-0002nR-Kk; Sat, 15 May 2021 09:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127701.240021; Sat, 15 May 2021 09:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhqCs-0002lA-HQ; Sat, 15 May 2021 09:03:34 +0000
Received: by outflank-mailman (input) for mailman id 127701;
 Sat, 15 May 2021 09:03:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhqCr-0002l4-9h
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 09:03:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhqCp-0003YX-Kd; Sat, 15 May 2021 09:03:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhqCp-000616-EE; Sat, 15 May 2021 09:03:31 +0000
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
	bh=y3NJOJ5MxxGvXEvPLHrkIjwPF7NbgRCq4+z8KJCmBAw=; b=vKcMfiCLuL+/Rub5jb0qv1wE5m
	rH0LEWCZ04cQpeE4HPq6vKcF8SCqvLBODk5MeYEYVPQxE+t0mnHOtbREjF/PH39IL6L1LCWAShwN0
	W+OZBL8vQmD55nNY87NEKH30G4xyQ2KDbFSKk/TNtrWBNBvnid5lrvI4D+b+8e8GZbWk=;
Subject: Re: [PATCH RFCv2 13/15] xen/arm: mm: Use the PMAP helpers in
 xen_{,un}map_table()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-14-julien@xen.org>
 <alpine.DEB.2.21.2105141628130.14426@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9ea1479f-d914-3ee0-7794-f7a7a2c8ee0c@xen.org>
Date: Sat, 15 May 2021 10:03:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105141628130.14426@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/05/2021 00:35, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> During early boot, it is not possible to use xen_{,un}map_table()
>> if the page tables are not residing the Xen binary.
>>
>> This is a blocker to switch some of the helpers to use xen_pt_update()
>> as we may need to allocate extra page tables and access them before
>> the domheap has been initialized (see setup_xenheap_mappings()).
>>
>> xen_{,un}map_table() are now updated to use the PMAP helpers for early
>> boot map/unmap. Note that the special case for page-tables residing
>> in Xen binary has been dropped because it is "complex" and was
>> only added as a workaround in 8d4f1b8878e0 ("xen/arm: mm: Allow
>> generic xen page-tables helpers to be called early").
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> In terms of boot stages:
> 
> - SYS_STATE_early_boot --> use pmap_map
> - greater than SYS_STATE_early_boot --> map_domain_page
> 
> While actually pmap would be able to work as far as SYS_STATE_boot, but
> we don't need it. Is it worth simplifying it by changing the checks in
> the previous patch to be against SYS_STATE_early_boot?

We need to differentiate between when this is used and when PMAP can be 
used. The ASSERT() is here to check that the PMAP code is not used 
outside of its limit.

In the current implementation, PMAP can be used at any time until we 
start bring-up secondary CPUs. So the ASSERT() is correct because 
doesn't restrict unnecessarily the use of it.

Note, the code is going to be moved to common code in the next revision.

> 
> In any case:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you!

Cheers,

-- 
Julien Grall

