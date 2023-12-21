Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067D81BF07
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 20:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659129.1028589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGOa0-0001OC-3m; Thu, 21 Dec 2023 19:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659129.1028589; Thu, 21 Dec 2023 19:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGOa0-0001Ku-0q; Thu, 21 Dec 2023 19:19:36 +0000
Received: by outflank-mailman (input) for mailman id 659129;
 Thu, 21 Dec 2023 19:19:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rGOZy-0001Km-Pe
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 19:19:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGOZx-0007tH-Gr; Thu, 21 Dec 2023 19:19:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGOZx-0006sw-9d; Thu, 21 Dec 2023 19:19:33 +0000
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
	bh=TMT37EPywLcrHdFLyaPINfUueikf9PSyqpis82OaOzI=; b=pzw8OCK5ey0d46+BuHgflJVFhL
	fxxLcBfJVmAuoEH5E5cf9AXRQ6qXHytj3w9yv/k5gzdsKs+xBUStjqYu37+nS3pUK014r2790EZz6
	3GmPlIMHftdk/v0O4p1Mzn2qampqX5T3Hlbdr30lLmEUbNIEb91PU2cCK69PGqj5t658=;
Message-ID: <cc26db95-c141-4392-a948-52ea3cb917c8@xen.org>
Date: Thu, 21 Dec 2023 19:19:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <e49bae656ed6c0fe689703f78df4e815b955f5b2.1703072575.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e49bae656ed6c0fe689703f78df4e815b955f5b2.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 20/12/2023 14:08, Oleksii Kurochko wrote:
> Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
> generation of empty <asm/grant_table.h> for cases when
> CONFIG_GRANT_TABLE is not enabled.

It would have been nice to explain the reason of this change. Is this a 
compilation error or just a nice thing to have?

The reason I am asking is...

> 
> The following changes were done for Arm:
> <asm/grant_table.h> should be included directly because it contains
> gnttab_dom0_frames() macros which is unique for Arm and is used in
> arch/arm/domain_build.c.
> <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
> <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
> won't be available for use in arch/arm/domain_build.c.

... I find rather ugly that we require domain_build.c to include both 
asm/grant_table.h and xen/grant_table.h.

Right now, I don't have a better approach, so I would be ok so long the 
rationale of the change is explained in the commit message.

> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

