Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569E4DE92C
	for <lists+xen-devel@lfdr.de>; Sat, 19 Mar 2022 17:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292423.496696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVbUQ-0008P6-Og; Sat, 19 Mar 2022 15:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292423.496696; Sat, 19 Mar 2022 15:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVbUQ-0008Mc-Lp; Sat, 19 Mar 2022 15:59:38 +0000
Received: by outflank-mailman (input) for mailman id 292423;
 Sat, 19 Mar 2022 15:59:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVbUP-0008MW-C2
 for xen-devel@lists.xenproject.org; Sat, 19 Mar 2022 15:59:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVbUP-0003gx-3S; Sat, 19 Mar 2022 15:59:37 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVbUO-0006T8-Rw; Sat, 19 Mar 2022 15:59:36 +0000
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
	bh=Z0daPzM+BvS/I4W929gyCo8+vlXUmNoOZUIgyrJTD/U=; b=EdlyTSZC7Jp0wtjr84PYCES8Xr
	lb2cNT3+a36IAsFRpEhnIdgWVRhM+0PN1Wfa6u8o19YkM2zASDN0p5hu82ioVvpMVhYzqDt58qiB2
	64jOmIMPR0wLn0EW8tcjZk1GIBXW/UudlWgyZPPRZVg/jnDvdnonlvDTufHVDooGFMcI=;
Message-ID: <3e97abc3-3a4e-b5b1-a46d-e05d04730d2d@xen.org>
Date: Sat, 19 Mar 2022 15:59:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 09/19] xen/arm32: mm: Check if the virtual address is
 shared before updating it
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-10-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220221102218.33785-10-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/02/2022 10:22, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Only the first 2GB of the virtual address space is shared between all
> the page-tables on Arm32.
> 
> There is a long outstanding TODO in xen_pt_update() stating that the
> function can only work with shared mapping. Nobody has ever called
> the function with private mapping, however as we add more callers
> there is a risk to mess things up.
> 
> Introduce a new define to mark the end of the shared mappings and use
> it in xen_pt_update() to verify if the address is correct.
> 
> Note that on Arm64, all the mappings are shared. Some compiler may
> complain about an always true check, so the new define is not introduced
> for arm64 and the code is protected with an #ifdef.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>      Changes in v2:
>          - New patch
> ---
>   xen/arch/arm/include/asm/config.h |  4 ++++
>   xen/arch/arm/mm.c                 | 11 +++++++++--

While I working on removing the identity mapping, I realized this patch 
is actually getting in my way for arm32. I am planning to have multiple 
region that are shared, but still a single unshared region (the domheap 
mapping area).

So I will rework the patch to check is the address is part of the 
unshared region.

I will drop the patch from the series and move it to the next one.

Cheers,

-- 
Julien Grall

