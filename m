Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8E4CC6FF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 21:19:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283744.482854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPruT-00045B-1i; Thu, 03 Mar 2022 20:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283744.482854; Thu, 03 Mar 2022 20:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPruS-00042L-UO; Thu, 03 Mar 2022 20:18:48 +0000
Received: by outflank-mailman (input) for mailman id 283744;
 Thu, 03 Mar 2022 20:18:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPruR-00042C-4S
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 20:18:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPruQ-0005PJ-S7; Thu, 03 Mar 2022 20:18:46 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPruQ-0005iB-MQ; Thu, 03 Mar 2022 20:18:46 +0000
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
	bh=bY6CbEVQMHGGIqB8zVfBJbxcTWn6l8SqWGyYlgLb+pg=; b=lz/YZ2c5aViFsmIyK9Mb6SDavc
	73LXEZJv2wy9BNleAy8eA9f7jz7V+Xa2p+aWOs4VayaEsDb8tvbpGmqmoqMktd+yWYbEuKjg8UA1w
	Hnxz9gbAaM3rp3aDFEiDOMBN4vMcTEzNk1wcZ2Rmot/+YtlQfa7lpGckhVkDwTBjK73M=;
Message-ID: <df1de087-794c-a49e-2eb6-589a5b33daf5@xen.org>
Date: Thu, 3 Mar 2022 20:18:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm: mm: Encode existing constraints of the memory
 layout
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220228100659.58089-1-julien@xen.org>
 <B4CC57B1-4443-49A4-92FC-25165BEA14CB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B4CC57B1-4443-49A4-92FC-25165BEA14CB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/03/2022 16:04, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 28 Feb 2022, at 10:06, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The boot code expects the regions XEN_VIRT_START, FIXMAP_ADDR(0),
>> BOOT_FDT_VIRT_START to use the same 0th (arm64 only) and 1st slot.
>>
>> Add some BUILD_BUG_ON() to confirm that. This is helpful if one wants
>> to re-order the memory layout.
> 
> Very good idea :-)

I actually hit this issue when trying to re-order the memory layout for 
testing a patch.

> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Just a small NIT after if you want to do it on commit...

I have update the comment and committed the patch.

Thanks!

Cheers,

-- 
Julien Grall

