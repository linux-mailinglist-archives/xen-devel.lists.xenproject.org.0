Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8A7881DC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590728.923110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRye-00070f-LA; Fri, 25 Aug 2023 08:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590728.923110; Fri, 25 Aug 2023 08:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRye-0006xk-HO; Fri, 25 Aug 2023 08:15:32 +0000
Received: by outflank-mailman (input) for mailman id 590728;
 Fri, 25 Aug 2023 08:15:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZRyd-0006v4-97
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:15:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZRyc-0004xA-TV; Fri, 25 Aug 2023 08:15:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZRyc-0005op-Ol; Fri, 25 Aug 2023 08:15:30 +0000
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
	bh=2bmNJPhTrxYF1+FPTyPFrd88F9ui/0HO/j3S/l9APvM=; b=12M7RkjVItb/VTe4wW4ufsC6mi
	2Ami+cAaMycLCJqfYp7MvBhKNnLsp7KfF6k0PZvn4y7YjFBXHtb4D49Flq8s9CHw4Cfo66ixEm4Xf
	+tEI8TpOwBhmYCKg5N9zMbPgBM4/BgBjPlJOY+ukHZcF8xVdLK1rqPshGwRQgzT/61LM=;
Message-ID: <aa2caa60-c914-4403-b6c0-b320a396ab9f@xen.org>
Date: Fri, 25 Aug 2023 09:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 14/19] common/device_tree: Add rwlock for dt_host
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 sstabellini@kernel.org, jbeulich@suse.com
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-15-vikram.garhwal@amd.com>
 <d5e658e4-e30e-4783-8fcc-0bd93126abf3@xen.org> <ZOhIiLg0thx3Q2N_@amd.com>
 <ZOhd1HwM4km0_MfG@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZOhd1HwM4km0_MfG@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/08/2023 08:52, Vikram Garhwal wrote:
> Hi,
> On Thu, Aug 24, 2023 at 11:22:00PM -0700, Vikram Garhwal wrote:
>> Hi Julien,
>> On Wed, Aug 23, 2023 at 11:06:59PM +0100, Julien Grall wrote:
>>> Hi Vikram,
>>>
>>> On 19/08/2023 01:28, Vikram Garhwal wrote:
>>>>    Dynamic programming ops will modify the dt_host and there might be other
>>>>    function which are browsing the dt_host at the same time. To avoid the race
>>>
>>> Typo: I think you want to write 'functions'
>>>
>>>>    conditions, adding rwlock for browsing the dt_host during runtime. dt_host
>>>>    writer will be added in the follow-up patch titled "xen/arm: Implement device
>>>>    tree node addition functionalities."
>>>
>>> I would prefer if we avoid mention the name of the follow-up commit. This
>>> will reduce the risk that the name of the commit is incorrect if we decide
>>> to commit this patch before the rest of the series is ready.
>>>
>>> Also, the commit message seems to be indented. Was it intended?
>>>
>>>>
>>>>    Reason behind adding rwlock instead of spinlock:
>>>>       For now, dynamic programming is the sole modifier of dt_host in Xen during
>>>>           run time. All other access functions like iommu_release_dt_device() are
>>>>           just reading the dt_host during run-time. So, there is a need to protect
>>>>           others from browsing the dt_host while dynamic programming is modifying
>>>>           it. rwlock is better suitable for this task as spinlock won't be able to
>>>>           differentiate between read and write access.
>>>
>>> The indentation looks odd here as well.
>>>
>> Changed above comments in v10.
>>>>
>>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>>>
>>>> ---
>>>> Changes from v7:
>>>>       Keep one lock for dt_host instead of lock for each node under dt_host.
>>>> ---
>>>> ---
>>>>    xen/common/device_tree.c              |  5 +++++
>>>>    xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
>>>>    xen/include/xen/device_tree.h         |  6 ++++++
>>>>    3 files changed, 26 insertions(+)
>>>
>>> I am not sue where to put the comment. I noticed that you didn't touch
>>> iommu_remove_dt_device() and iommu_add_dt_device(). Does this mean the
>>> caller is expected to held the lock? If so, then this should be documented
>>> and an ASSERT() should be added.
>> Added ASSERT in iommu_(add,remove,assign and deassign)_dt_device(),
> iommu_add_ and iommu_assign_ are called at boot time. Also, only other callers
> are handle_device via overlays and iommu_do_dt_domctl() which will hold the
> dt_host_lock. 

The goal of the ASSERT() is to confirm that this holds true today and in 
the future.

> Will look into it more but for now sending v10 with ASSER in these
> two functions.
You could have at least written a comment on top... Regarding the boot 
function, I would consider to take the lock there too.

Otherwise, you could use:

ASSERT(system_state <= SYS_STATE_active || check lock);

Cheers,

-- 
Julien Grall

