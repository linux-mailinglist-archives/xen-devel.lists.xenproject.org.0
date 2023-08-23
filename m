Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB98786346
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 00:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589617.921603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwCD-0001d1-75; Wed, 23 Aug 2023 22:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589617.921603; Wed, 23 Aug 2023 22:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwCD-0001bB-31; Wed, 23 Aug 2023 22:19:25 +0000
Received: by outflank-mailman (input) for mailman id 589617;
 Wed, 23 Aug 2023 22:19:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYwCB-0001b5-B5
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 22:19:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYwC7-0005QT-60; Wed, 23 Aug 2023 22:19:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYwC6-00033Q-Pv; Wed, 23 Aug 2023 22:19:19 +0000
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
	bh=33s2DgLQamOcLT2FRHeQPnLr2AQuUoKCZImE8zMUQDU=; b=2PbsnHGQUb+wuUqKPFtqCPZTNA
	78fDNdZeOeS/UPZY7kvOca8gXQe9pAryKph8rqGvDeS+hxEZDkwlnkX3i5o/7kfABBjRd/Vfs5iio
	vqQKDN/sGtOM1HA10kOHMylbdRpPExZVCVOx6A3+E/qb+zu4/kPl6Mt7dA1e681xopAg=;
Message-ID: <3bf898d4-b07f-4036-9b8e-15ec995252ed@xen.org>
Date: Wed, 23 Aug 2023 23:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 00/19] dynamic node programming using overlay dtbo
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Hi,

Hi Vikram,

> This patch series is for introducing dynamic programming i.e. add/remove the
> devices during run time. Using "xl dt_overlay" a device can be added/removed
> with dtbo.

Do you have any pointer where one can find more details about the dtbo? 
How can it be created? What's the internal device-tree format?

> 
> For adding a node using dynamic programming:
>      1. flatten device tree overlay node will be added to a fdt
>      2. Updated fdt will be unflattened to a new dt_host_new
>      3. Extract the newly added node information from dt_host_new
>      4. Add the added node under correct parent in original dt_host.
>      3. Map/Permit interrupt and iomem region as required.
> 
> For removing a node:
>      1. Find the node with given path.
>      2. Check if the node is used by any of domus. Removes the node only when
>          it's not used by any domain.
>      3. Removes IRQ permissions and MMIO access.
>      5. Find the node in dt_host and delete the device node entry from dt_host.
>      6. Free the overlay_tracker entry which means free dt_host_new also(created
> in adding node step).
> 
> The main purpose of this series to address first part of the dynamic programming
> i.e. making Xen aware of new device tree node which means updating the dt_host
> with overlay node information. Here we are adding/removing node from dt_host,
> and checking/set IOMMU and IRQ permission but never mapping them to any domain.
> Right now, mapping/Un-mapping will happen only when a new domU is
> created/destroyed using "xl create".

I am ok with this restriction. However are you planning to handle it 
because this goes out of tech preview?

The reason I am asking is, AFAICT, your code will not even look at the 
xen,passthrough (which is used to indicate that only permissions will be 
given). So if the ABI becomes stable, then we would need to invent a new 
property to say "Please map the device resources".

I would rather want the behavior of the dt-overlay to act the same as 
for the host DT. IOW, the device would be mapped to dom0 by default 
unless the propery "xen,passthrough" is added.

I would be OK to say that we don't currently support DT overlay if the 
property "xen,passthrough" is not present in the top-level node.

Cheers,

-- 
Julien Grall

