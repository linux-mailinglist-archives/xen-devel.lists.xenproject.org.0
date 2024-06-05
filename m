Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A548FC720
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 11:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735613.1141739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEmUy-0003KI-OV; Wed, 05 Jun 2024 09:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735613.1141739; Wed, 05 Jun 2024 09:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEmUy-0003H7-LJ; Wed, 05 Jun 2024 09:00:00 +0000
Received: by outflank-mailman (input) for mailman id 735613;
 Wed, 05 Jun 2024 08:59:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sEmUx-0003H1-AU
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 08:59:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sEmUx-0002d3-0K; Wed, 05 Jun 2024 08:59:59 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sEmUw-00054M-Qb; Wed, 05 Jun 2024 08:59:58 +0000
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
	bh=ssTzv1/QZF99OCEaq78ROZ1+aT4W6/KPfeuLbk6bRMY=; b=pSzS786pS3wdfAY0VximTe7Scl
	91UP+oAyAaLZ5sdHsivKPb672n7x1VObVSn+1fuC1Mn7Z4pzcdVUsjfXDYNpNRNSLEfmsta3RQhbN
	2zlQUPzVvekOtq6YzUGWKLJCe9vW8E9zdcnt6CzGJb9InqzzaOTjtCDAgQm07LCcW0TU=;
Message-ID: <17a4df22-f45b-418e-8a64-834a33978190@xen.org>
Date: Wed, 5 Jun 2024 09:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] xen/arm: smmuv3: Mark more init-only functions
 with __init
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, edgar.iglesias@amd.com
References: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 22/05/2024 14:28, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> I was scanning for code that we could potentially move from the
> .text section into .init.text and found a few candidates.
> 
> I'm not sure if this makes sense, perhaps we don't want to mark
> these functions for other reasons but my scripts found this chain
> of SMMUv3 init functions as only reachable by .inittext code.
> Perhaps it's a little late in the release cycle to consider this...

The risk of the change is limited and the SMMUv3 driver is still in tech 
preview. So I would say it would be fine as long as it is fully reviewed 
by the code freeze date (14th June).

CCing the release manager (Oleksii) to check if he is happy with 
committing this patch in 4.19. If not, I can queue it in a personal 
branch until the tree is re-opened.

But note this still need a review frome either Bertrand or Rahul.

Cheers,

-- 
Julien Grall

