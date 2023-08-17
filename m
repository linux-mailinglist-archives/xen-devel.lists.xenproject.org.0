Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B337677F0E0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 09:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585165.916202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWX5D-0001eN-4W; Thu, 17 Aug 2023 07:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585165.916202; Thu, 17 Aug 2023 07:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWX5D-0001cE-0E; Thu, 17 Aug 2023 07:06:15 +0000
Received: by outflank-mailman (input) for mailman id 585165;
 Thu, 17 Aug 2023 07:06:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWX5B-0001bu-Gv
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 07:06:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWX58-0003rK-Bc; Thu, 17 Aug 2023 07:06:10 +0000
Received: from [54.239.6.180] (helo=[192.168.0.78])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWX58-00088h-5j; Thu, 17 Aug 2023 07:06:10 +0000
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
	bh=vFlTq0qAP9sK/h17Q0OwLZSijlYFsYkoXXuBC6thpY0=; b=ht/v86tupgQZA0DjWPvyTmelb1
	FSJjIp8DgiqD+j9ZXb5Mbb1p9zO3cie5cSkBiSa9Ux/r0rUl3adnh4z2VBh3vba7DuvLm6+hBSPqG
	u5k4oAMECyR8KG8XalyG3HjbXnrV1xmkMRrbwboa3WaVzeqn6D23p/Wr7tEKKI+5pXzM=;
Message-ID: <3b15eb0c-eada-4729-aff6-e1daf67fc6ba@xen.org>
Date: Thu, 17 Aug 2023 08:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] IOMMU/x86: fix build with old gcc after IO-APIC RTE
 changes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf497b79-7661-8fa8-6979-90f9951c8735@suse.com>
 <cc82ac63-a019-4243-aa2b-2a4a3a07857c@xen.org>
 <3ad06a1c-2337-fd66-cf2f-9151544dc8db@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3ad06a1c-2337-fd66-cf2f-9151544dc8db@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/08/2023 07:39, Jan Beulich wrote:
> On 16.08.2023 18:57, Julien Grall wrote:
>> On 16/08/2023 10:51, Jan Beulich wrote:
>>> Old gcc won't cope with initializers involving unnamed struct/union
>>
>> Can you specify the newest version of GCC that breaks? This would help
>> to reproduce your problem in case someone complain about this change.
> 
> I can't, without actually putting in effort to find out. I'm observing
> these problems with 4.3.x iirc.

You are proving my point. :) If you can't already remember which version 
of GCC was breaking. How can you expect someone in a few months time to 
figure out why this was added and whether and it can reworked differently?

>  And of course this isn't the first such
> change, and I don't think we ever bothered writing down precise version
> boundaries in any of the commits.

I am not looking at a precise boundary. What I meant by the 'newest' is 
the newest one you try.

With 'old', it is not clear what this really mean. For instance, 
technically the previous GCC version is already old. So a bit more 
information about the GCC version you tried on would be useful.

Cheers,

-- 
Julien Grall

