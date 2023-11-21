Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6137F33B8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638032.994254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Tdv-0003RP-JF; Tue, 21 Nov 2023 16:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638032.994254; Tue, 21 Nov 2023 16:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Tdv-0003Od-Fj; Tue, 21 Nov 2023 16:30:31 +0000
Received: by outflank-mailman (input) for mailman id 638032;
 Tue, 21 Nov 2023 16:30:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r5Tdv-0003OV-2D
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:30:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5Tdu-00069Q-ND; Tue, 21 Nov 2023 16:30:30 +0000
Received: from [15.248.3.117] (helo=[10.24.67.37])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5Tdu-00031p-Hm; Tue, 21 Nov 2023 16:30:30 +0000
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
	bh=d+hdjoT7G+jTLO/zptHQLHXIx6n3uh99iJEdz/zENrQ=; b=z+8sZkW1jjyfNc3Uy5zuQMgaMY
	rvhYC0LjDO4bawPl59HSoWP390ku0nVNOdTD7rAXHZNiSU3q7TC4+cS9oBWuv7+vOGadEosBq+wIF
	nCfeS4cWPfhPv9AQ8AtxnIWvT07XPa1JSAK+/rufz8Qf/V+9Ta+Nsd7JX7ubwsfUVvRU=;
Message-ID: <d015e81d-16cd-4e93-80c9-ba6418a23b1d@xen.org>
Date: Tue, 21 Nov 2023 16:30:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm64/mmu: head: Replace load_paddr with adr_l
 where appropriate
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-4-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231121094516.24714-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 21/11/2023 09:45, Michal Orzel wrote:
> Macros load_paddr and adr_l are equivalent when used before the MMU is
> enabled, resulting in obtaining physical address of a symbol. The former
> requires to know the physical offset (PA - VA) and can be used both before
> and after the MMU is enabled. In the spirit of using something only when
> truly necessary, replace all instances of load_paddr with adr_l, except

I don't buy this argument. The advantage with using "load_paddr" is that 
it is pretty clear what you get from the call. With "adr_l" you will 
need to check whether the MMU is on or off.

> in create_table_entry macro. Even though there is currently no use of
> load_paddr after MMU is enabled, this macro used to be call in such a
> context and we can't rule out that it won't happen again.
> 
> This way, the logic behind using load_paddr/adr_l is consistent between
> arm32 and arm64, making it easier for developers to determine which one
> to use and when.

Not really. See above. But there is also no documentation stating that 
"load_paddr" should not be used before the MMU is on. And as I said 
above, I find it easier to work with compare to "adr_l".

Cheers,

-- 
Julien Grall

