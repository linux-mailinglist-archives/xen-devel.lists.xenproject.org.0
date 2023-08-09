Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBBB77597D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580883.909350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgvl-0006As-DH; Wed, 09 Aug 2023 11:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580883.909350; Wed, 09 Aug 2023 11:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgvl-00068i-Ag; Wed, 09 Aug 2023 11:00:45 +0000
Received: by outflank-mailman (input) for mailman id 580883;
 Wed, 09 Aug 2023 11:00:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgvj-00068Y-Qd
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:00:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgvj-0005yO-A5; Wed, 09 Aug 2023 11:00:43 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgvj-0002MQ-3I; Wed, 09 Aug 2023 11:00:43 +0000
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
	bh=iMjVP/GQZiK3SrVoydRLINYyt3X0YfehMkN5udkQGA4=; b=gLB3b951or8PiyjoQMiqqmOUxK
	dTcMUgIoo/otkCoinJ5gAwrpg5L7waaiY8HCOigj0oEFdJPdubkNlS26j1x5txIZwJCemRwHuQAIB
	tfufF6yR5VIxhaLN+spL/Wz/RpC0k0axnHSasCvsuv8W1vAtY+N117X8zEfEFoZBbge0=;
Message-ID: <55750925-8966-47ef-ace1-712a9467876b@xen.org>
Date: Wed, 9 Aug 2023 12:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: head: Introduce a helper to flush local TLBs
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230808110739.1296-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230808110739.1296-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 08/08/2023 12:07, Michal Orzel wrote:
> Instead of repeating the same sequence of instructions to flush the TLBs
> in various places, introduce a macro flush_xen_tlb_local and make use of
> it. This is similar to what was done for arm32 by the commit:
> dea9dddeceec8a1d68da24b14d5b2396effe555f

NIT: In general, we tend to refer to commit with the abbreviated ID and 
the title.

> 
> This is also making the flush sequence in enable_mmu more clear and
> consistent.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

