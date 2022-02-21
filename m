Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0D4BDAB7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 16:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276352.472492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMB5a-00020r-2u; Mon, 21 Feb 2022 15:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276352.472492; Mon, 21 Feb 2022 15:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMB5Z-0001y7-Vj; Mon, 21 Feb 2022 15:59:01 +0000
Received: by outflank-mailman (input) for mailman id 276352;
 Mon, 21 Feb 2022 15:59:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMB5Y-0001xz-9F
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 15:59:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMB5X-0000IS-Vs; Mon, 21 Feb 2022 15:58:59 +0000
Received: from [54.239.6.189] (helo=[192.168.5.64])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMB5X-000390-Pw; Mon, 21 Feb 2022 15:58:59 +0000
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
	bh=Cyh3S6FyANJ9AdFKJ0JpDQ1uhmOVwLLun35IdbpvCUo=; b=3JjzOk6dtHyf5/p+T1PFyRMbWy
	izhb5wgJBR4WEh0Y9HfmALdQRnKlIBqZNnGqEC9AqmMB4aWsJ8Ht7oxC4V0bccMiRHqJ91zfcUnq6
	kUG6nlXnEEW7ABImuyev4dH4lM9C7/W95AUUSFh/yjXHEFk64UmtKQgskb6JRqnR3pH8=;
Message-ID: <1531f49d-c74c-8a41-a917-cfe76bee8e7d@xen.org>
Date: Mon, 21 Feb 2022 15:58:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220221105931.12028-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220221105931.12028-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 21/02/2022 10:59, Michal Orzel wrote:
> Following a discussion [1] it seems like that renaming work has
> been forgotten. 

This is in my todo list of clean-up I need to do for Xen. But I haven't 
yet had a chance to look at it. Thank you for taking a look!

> Perform renaming of psr_mode_is_32bit to
> regs_mode_is_32bit as the function no longer takes psr parameter.

If we modify psr_mode_is_32bit(), then we should also modify 
psr_mode_is_user() because they have the same prototype and we should 
keep the naming consistent.

> 
> [1] https://marc.info/?l=xen-devel&m=156457538423787&w=2

NIT: The first sentence and this link adds value for the review on the 
mailing list (we know where the request came from) but doesn't add any 
after the commit message (there are no extra information in them).

So I would move this information after ---. This will get dropped on commit.

Cheers,

-- 
Julien Grall

