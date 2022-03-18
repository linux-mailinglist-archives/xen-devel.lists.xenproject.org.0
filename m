Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622E4DE0DC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 19:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292182.496256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVH8m-0002Lo-11; Fri, 18 Mar 2022 18:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292182.496256; Fri, 18 Mar 2022 18:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVH8l-0002JY-U2; Fri, 18 Mar 2022 18:15:55 +0000
Received: by outflank-mailman (input) for mailman id 292182;
 Fri, 18 Mar 2022 18:15:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVH8k-0002JL-6M
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 18:15:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVH8j-0007td-ND; Fri, 18 Mar 2022 18:15:53 +0000
Received: from [54.239.6.185] (helo=[192.168.15.239])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVH8j-0006D9-HW; Fri, 18 Mar 2022 18:15:53 +0000
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
	bh=yS4zStiCcXlz+FAhjm54uQnUpkk5NghZvttvPUi8khY=; b=0QU22i9B4hKbh0FOKZe2d+nvJr
	qt5QF6KEDm9fpdZ7aWOLra9aOD3Tt//H7j+3rng3L/BpizElJ80JsnORsxtthwr3GpcH9oWhXMo3R
	EnXizpVy3eqBo5b1hVzyoMNrA9MiG2lAl4eAQ7WF7S9Wgw0uaRHu76brOgsrWnd08upk=;
Message-ID: <846a872e-07ce-d744-a07f-8df80cc64721@xen.org>
Date: Fri, 18 Mar 2022 18:15:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 2/3] xen/arm64: io: Handle the abort due to access to
 stage1 translation table
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-3-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220317140046.64563-3-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 17/03/2022 14:00, Ayan Kumar Halder wrote:
> If the abort was caused due to access to stage1 translation table, Xen
> will try to set the p2m entry (assuming that the Stage 1 translation
> table is in a non MMIO region).
> If there is no such entry found, then Xen will try to map the address as
> a MMIO region (assuming that the Stage 1 translation table is in a
> direct MMIO region).
> 
> If that fails as well, then there are the two following scenarios:-
> 1. Stage 1 translation table being in an emulated MMIO region - Xen
> can read the region, but it has no way to return the value read to the
> CPU page table walker (which tries to go through the stage1 tables to
> resolve the translation fault).
> 
> 2. Stage 1 translation table address is invalid.
> 
> In both the above scenarios, Xen will forward the abort to the guest.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

