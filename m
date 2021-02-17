Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234ED31D88C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86231.161734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCLDJ-0006eC-4X; Wed, 17 Feb 2021 11:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86231.161734; Wed, 17 Feb 2021 11:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCLDJ-0006dn-1T; Wed, 17 Feb 2021 11:41:49 +0000
Received: by outflank-mailman (input) for mailman id 86231;
 Wed, 17 Feb 2021 11:41:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCLDH-0006di-2m
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:41:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCLDG-0001tn-86; Wed, 17 Feb 2021 11:41:46 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCLDF-0000t6-T6; Wed, 17 Feb 2021 11:41:46 +0000
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
	bh=kkSMwpoCBdsQ15EvRDIrJENmC7LLyhxIFTzsa1kTE+Y=; b=gGJTCp0hkXyVv7zuiH3osWTbSN
	m/hzt43HhXtfYdQ1pjsMYYYZtJqNfvVm7KABAnWpAZvzz3Ys111ZVVCN31daxP01auIGw1PhN4JVd
	RT7+40Cix9jK63E5oi+R9UNe9SnGWZ7ZIKJ+rp369pIA2ug1hrUXVybhrtJLkQDglQDo=;
Subject: Re: [PATCH 2/3] gnttab: bypass IOMMU (un)mapping when a domain is
 (un)mapping its own grant
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
 <5bb4fba7-a10b-90c4-82f7-8cde6e8cacfb@suse.com>
 <a267959c-538e-0f90-f9a5-72e836f33cb4@xen.org>
 <283d8514-16fb-8973-e395-0a86bf820306@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ece0308-504f-5127-b7af-5c801630253b@xen.org>
Date: Wed, 17 Feb 2021 11:41:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <283d8514-16fb-8973-e395-0a86bf820306@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/02/2021 11:38, Jan Beulich wrote:
> On 17.02.2021 12:03, Julien Grall wrote:
>> On 17/02/2021 10:46, Jan Beulich wrote:
>>> Mappings for a domain's own pages should already be present in the
>>> IOMMU. While installing the same mapping again is merely redundant (and
>>> inefficient), removing the mapping when the grant mapping gets removed
>>> is outright wrong in this case: The mapping was there before the map, so
>>> should remain in place after unmapping.
>>>
>>> This affects
>>> - Arm Dom0 in the direct mapped case,
>>> - x86 PV Dom0 in the "iommu=dom0-strict" / "dom0-iommu=strict" cases,
>>> - all x86 PV DomU-s, including driver domains.
>>>
>>> Reported-by: Rahul Singh <Rahul.Singh@arm.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -1243,7 +1243,7 @@ map_grant_ref(
>>>            goto undo_out;
>>>        }
>>>    
>>> -    need_iommu = gnttab_need_iommu_mapping(ld);
>>> +    need_iommu = ld != rd && gnttab_need_iommu_mapping(ld);
>>
>> AFAICT, the owner of the page may not always be rd. So do we want to
>> check against the owner instead?
> 
> For the DomIO case - specifically not. And the DomCOW case can't
> happen when an IOMMU is in use. Did I overlook any other cases
> where the page may not be owned by rd?

For the current code, it looks like not. But it feels to me this code is 
fragile as we are assuming that other cases should never happen.

I think it would be worth explaining in a comment and the commit message 
why check rd rather than the page owner is sufficient.

Cheers,

-- 
Julien Grall

