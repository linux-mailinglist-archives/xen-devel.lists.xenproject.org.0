Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CFA57A06
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 12:45:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905653.1313376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqsci-0001CC-UE; Sat, 08 Mar 2025 11:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905653.1313376; Sat, 08 Mar 2025 11:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqsci-00019F-Qy; Sat, 08 Mar 2025 11:45:44 +0000
Received: by outflank-mailman (input) for mailman id 905653;
 Sat, 08 Mar 2025 11:45:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqsch-000199-S6
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 11:45:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqsch-008qkD-2N;
 Sat, 08 Mar 2025 11:45:43 +0000
Received: from [2a02:8012:3a1:0:5057:2808:1e53:9bd7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqsch-00E5nX-0z;
 Sat, 08 Mar 2025 11:45:43 +0000
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
	bh=agIOgA+i3QXuUDkJZqMWNAjpLeF4OSnO/HmWfCNGUI0=; b=cKGvSYmx+UW9UQXt8NoGM5axPp
	F2OYX16nKpFB0FF/NF9CUvsW5HCBREryyujylqKApedt/RmgjpOfPH83vudF5DvkzULc/gGq57Y+m
	BzhGswqOfkeS55MmDXbWY/8HpgvVa/XH4LPrIkOOiqfP/9fIU1pEj5b05Q2e7fQTJbbo=;
Message-ID: <6c5d389e-72b7-4a64-af05-574655a6dcec@xen.org>
Date: Sat, 8 Mar 2025 11:45:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
 <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org>
 <734d9fdf-a201-4a46-9739-26a474683b10@amd.com>
 <39540c8b-e43d-4315-bc34-a61ac6cb1d70@xen.org>
 <alpine.DEB.2.22.394.2503071651090.3032631@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2503071651090.3032631@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/03/2025 00:53, Stefano Stabellini wrote:
> On Fri, 7 Mar 2025, Julien Grall wrote:
>>> init-dom0less only initializes non- introduced domains, so hwdom doesn't get
>>> its "domid" xenstore node populated.  That leads to other errors.
>>>> So I think with Denis's patch, this isn't strictly needed.  It does help
>>> existing toolstack code work today.
>>
>> I don't think the toolstack is ready for a split between control/hardware
>> domain. That said, shouldn't the toolstack run in the control domain? Same for
>> xenstored (unless you have a xenstored domain)?
> 
> Yes, the toolstack (if present) would be in the control domain.
> xenstored doesn't have to be in the control domain and in fact it might
> not be advisable to place it there today.
> 
> The main difference between the toolstack and xenstored is that the
> toolstack only talks to Xen, while xenstored talks to all other VMs,
> which is dangerous in many configurations.

It is not really clear which toolstack you are referring to.

Someone using vanilla Xen upstream will end up to use "xl"  which has to 
talk to xenstored and also indirectly to each domain (e.g. 
shutdown/suspend node in xenstored). So for this setup, "xenstored" is 
not optional and I would argue should be part of the control domain (or 
in a xenstore stubdomain which IIRC is not supported on Arm today).

Cheers,

-- 
Julien Grall


