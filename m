Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB229E78E4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850441.1264855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdxx-00006R-2h; Fri, 06 Dec 2024 19:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850441.1264855; Fri, 06 Dec 2024 19:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdxw-0008Vb-Vp; Fri, 06 Dec 2024 19:26:16 +0000
Received: by outflank-mailman (input) for mailman id 850441;
 Fri, 06 Dec 2024 19:26:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJdxw-0008VV-0B
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:26:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdxu-007AAA-39;
 Fri, 06 Dec 2024 19:26:15 +0000
Received: from [2a02:8012:3a1:0:9908:37eb:1c5c:6583]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdxv-0032oS-0C;
 Fri, 06 Dec 2024 19:26:15 +0000
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
	bh=f2hV8vQerxdrLlUqlo7ZJV61XvPPtKY/LyMAxZY2f+A=; b=O4/BgEpfMb/KqCnrdEahIN1vdm
	9TaL2emnlC9piXSxL1osEZCw+eWc3En8gyd3y11d+FTiDO/0Ralv2z9HsDJjc3KY+QKqcrT2PAJrI
	8SU6fgXUB3aO9j/auc0VYgkNQyBJNISK7I6P5885lmz3q39HjvRiluyw2M0muIPL/NpU=;
Message-ID: <64ae8244-f8d1-4d50-b3b8-f29f4ff3d584@xen.org>
Date: Fri, 6 Dec 2024 19:26:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Prerequisite patches for R82 upstreaming
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20241203094811.427076-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241203094811.427076-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 03/12/2024 09:48, Luca Fancellu wrote:
> In this serie I've taken out patches from the R82 branch already in the ML[1]
> and some new patches I've done based on the current status of staging that will
> not impact the current Armv8-R earlyboot work.
> 
> [1] https://patchwork.kernel.org/project/xen-devel/cover/20230626033443.2943270-1-Penny.Zheng@arm.com/
> 
> Changes between v2 and v3:
>   - New patch
>   - changes to previous patch are listed inside them
> 
> Luca Fancellu (4):

I have committed all the patches but...

>    common/vmap: Fall back to simple allocator when !HAS_VMAP
>    arm/setup: Move MMU specific extern declarations to mmu/setup.h
>    xen/arm: Use vmap_contig instead of __vmap where it's possible
 >    xen/arm: Move setup_frametable_mappings to arm/mmu>
> Penny Zheng (1):
>    xen/arm: Check for Static Heap feature when freeing resources

.. this one where I left a comment. This could possibly be handled on 
commit.

Cheers,

-- 
Julien Grall


