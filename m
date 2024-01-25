Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952783CB43
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671731.1045234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4co-00051L-UT; Thu, 25 Jan 2024 18:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671731.1045234; Thu, 25 Jan 2024 18:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4co-0004yJ-QS; Thu, 25 Jan 2024 18:38:54 +0000
Received: by outflank-mailman (input) for mailman id 671731;
 Thu, 25 Jan 2024 18:38:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rT4cn-0004yD-SE
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:38:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4cn-0002N1-7L; Thu, 25 Jan 2024 18:38:53 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.5.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4cm-00085r-Vi; Thu, 25 Jan 2024 18:38:53 +0000
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
	bh=SHSwFOjAUhi+bk6nvItESzNwlg2aQIOOYgGaTS9Wc6w=; b=EtQQIRhErv6n4/RIHOG81mgxLU
	+NRPLFwP88g7nCr080kthYhY+4C7WZygtFZEriIw+/P+6bJcv+G41vFdUuA1wW9Q9ANAa1VHhnwSy
	uzhYNa1NKFIg58zX8Nmvv8/vKz0bQI67twlT8L8dVESGdY/vUAyaiwakbTIxxzmgSgRc=;
Message-ID: <5bb011fe-3026-483a-8529-19294f1ad001@xen.org>
Date: Thu, 25 Jan 2024 18:38:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code (idmap)
 so it is self-contained
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240116143709.86584-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/01/2024 14:37, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> Right now, the MMU-off code will access may access data that are either
> in .rodata or .data. With the enablement of cache coloring, Xen may
> not be physcally contiguous anymore when secondary CPUs are brought up.
> 
> There are multiple way to solve this problem. The first is to keep
> a copy of Xen physically contiguous in memory. The downside is this
> means we are using up to 8MB (maximum size of Xen) when only a few
> KBs is necessary.
> 
> This series is reworking the logic so all the MMU-off code is now
> self-contained for secondary boot CPUs on arm64.
> 
> On arm32, this is not yet possible because secondary CPUs needs to
> rebuild boot page-tables.
> 
> Cheers,
> 
> Julien Grall (4):
>    arm/mmu: Move init_ttbr to a new section .data.idmap
>    arm/smpboot: Move smp_up_cpu to a new section .data.idmap
>    xen/arm64: head: Use PRINT_ID() for secondary CPU MMU-off boot code

The first 3 patches are now committed.

Cheers,

-- 
Julien Grall

