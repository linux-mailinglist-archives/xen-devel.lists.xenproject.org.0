Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67486D10D7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516892.801747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phznz-0003D5-3b; Thu, 30 Mar 2023 21:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516892.801747; Thu, 30 Mar 2023 21:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phznz-00039p-0O; Thu, 30 Mar 2023 21:27:35 +0000
Received: by outflank-mailman (input) for mailman id 516892;
 Thu, 30 Mar 2023 21:27:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phzny-00039j-Ai
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 21:27:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzny-00033z-01; Thu, 30 Mar 2023 21:27:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phznx-0003oa-R3; Thu, 30 Mar 2023 21:27:33 +0000
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
	bh=EErW5ytElLiKja3//Z1aZAcNs5ZuHLsSuXIftpylWJA=; b=hmq22jCuGadB+fgMSJ7ojUjPL1
	nsYKv9gRD2GIgaEiVqD429c6G+26p5j9vS2avlB4oKrrqxD/Khe0UlAejaemhZAj7uxIC72yGDd9m
	Ad3/TDTEfZydk3nxnM8yA+xd/AF4ISuyJ9ePmZaNHb0WDGTNWiPOO8E7kQw/a8jjBjWw=;
Message-ID: <f1e638f2-28c8-fcee-bfb4-a7d459281420@xen.org>
Date: Thu, 30 Mar 2023 22:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 06/11] xen/arm: smmu: Use writeq_relaxed_non_atomic() for
 writing to SMMU_CBn_TTBR0
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-7-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230321140357.24094-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
> SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
> writeq_relaxed_non_atomic() to write to it instead of invoking
> writel_relaxed() twice for lower half and upper half of the register.
> 
> This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
> Thus, one can assign p2maddr to a 64 bit register and do the bit
> manipulations on it, to generate the value for SMMU_CBn_TTBR0.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

The tags should be ordered in a timeline. So Signed-off-by should be first.

I am happy to do it on commit if you can confirm that this patch doesn't 
dependent on the patches before.

Cheers,

-- 
Julien Grall

