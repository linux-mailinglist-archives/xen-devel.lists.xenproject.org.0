Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8BA6E8158
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 20:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523741.814092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCl1-0004Tb-3q; Wed, 19 Apr 2023 18:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523741.814092; Wed, 19 Apr 2023 18:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCl1-0004RF-0r; Wed, 19 Apr 2023 18:42:19 +0000
Received: by outflank-mailman (input) for mailman id 523741;
 Wed, 19 Apr 2023 18:42:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ppCkz-0004R9-H0
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 18:42:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCky-0005Rl-UM; Wed, 19 Apr 2023 18:42:16 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCky-0000Sn-Ng; Wed, 19 Apr 2023 18:42:16 +0000
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
	bh=+YTg87TRLWy8kwISNa9qkM4Xpo8XA4iiV4IhtWsdpn8=; b=gq91/KHslv0BbGCgSjYaXnnbW2
	ZbjYWdshgDl0HRoXAawp33OoISTeGSBVwQykZHbr4AL/AdocosWzsjuCAlbQaPhz2QxcxGipRqvdy
	yZeIsHEnqxcfIVVR2T4MunhGL5Jt/RTw525dMbRYNYJsgY4407XiVGvUsJkMar9/sU8k=;
Message-ID: <7578ab9d-40d0-2ca1-394f-b0de38684103@xen.org>
Date: Wed, 19 Apr 2023 19:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v7 0/5] xen/arm: Don't switch TTBR while the MMU is on
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230416143211.72227-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230416143211.72227-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/04/2023 15:32, Julien Grall wrote:
  > Currently, Xen on Arm will switch TTBR whilst the MMU is on. This is
> similar to replacing existing mappings with new ones. So we need to
> follow a break-before-make sequence.
> 
> When switching the TTBR, we need to temporarily disable the MMU
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
> branch boot-pt-rework-v7
> 
> Cheers,
> 
> Julien Grall (5):
>    xen/arm32: head: Widen the use of the temporary mapping
>    xen/arm64: Rework the memory layout
>    xen/arm64: mm: Introduce helpers to prepare/enable/disable the
>      identity mapping
>    xen/arm64: mm: Rework switch_ttbr()
>    xen/arm64: smpboot: Directly switch to the runtime page-tables

This series is now fully committed.

Thanks for the help to review it!

Cheers,

-- 
Julien Grall

