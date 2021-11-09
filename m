Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9344B8FA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 23:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224131.387237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZvu-00023U-Pz; Tue, 09 Nov 2021 22:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224131.387237; Tue, 09 Nov 2021 22:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZvu-00021h-Mj; Tue, 09 Nov 2021 22:49:38 +0000
Received: by outflank-mailman (input) for mailman id 224131;
 Tue, 09 Nov 2021 22:49:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mkZvs-00021a-SI
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 22:49:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkZvr-0001BV-Gz; Tue, 09 Nov 2021 22:49:35 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.31.175]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkZvr-0000Lh-9i; Tue, 09 Nov 2021 22:49:35 +0000
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
	bh=Du4/KguE4VPJ59pKpLRshGmbfowT/wmlbuJqwGN27PQ=; b=NA3laJt8bhcUz8i+bB4bkjS3Pf
	QmoUE5pnUoDLjEuqU5dhKYGI1BBuaJi+jRE/IhPw9mrJ+0nWwKYVQozkfWM94SsZpZ5h8ndOwlMz8
	hzUK+I+7bQC7ueJ0+ibg9MqxQNv5FRqLrCzF1zcPajwxIQCpFvYuUvie6QZgUtlUKhhs=;
Message-ID: <41fcacd5-bb8d-3a30-44f4-b86c741ad4f4@xen.org>
Date: Tue, 9 Nov 2021 22:49:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] xen/arm: allocate_bank_memory: don't create
 memory banks of size zero
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_tyshchenko@epam.com,
 iwj@xenproject.org, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20211109222944.531368-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211109222944.531368-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/11/2021 22:29, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> allocate_bank_memory can be called with a tot_size of zero.

Please add some details how this can be called with tot_size == 0. 
AFAIU, this happens when creating the second bank.

> In that
> case, don't create an empty memory bank, just return immediately without
> error. Otherwise a zero-sized memory bank will be added to the domain
> device tree.

There are actually DTs out with zero-size memory bank (see [1]) and, 
AFAIR, Linux is able to cope with it.

Instead, it looks like the issue is some part of Xen may fall over if 
one of the bank is zero-sized. But from the earlier discussion [2], this 
is just latent. So I think this should be clarified in the commit message.

> 
> Fixes: f2931b4233ec "xen/arm: introduce allocate_memory"
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/domain_build.c | 3 +++
>   1 file changed, 3 insertions(+)

Please explain why you would like to include it in 4.16. In particular 
that as I wrote above, Linux is able to cope with zero-size memory bank.

> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9e92b640cd..578ea80e40 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -395,6 +395,9 @@ static bool __init allocate_bank_memory(struct domain *d,
>       struct membank *bank;
>       unsigned int max_order = ~0;
>   
> +    if ( tot_size == 0 )
> +        return true;

One may argue this is a bug. So I think it would be worth explaining in 
a comment that we can safely ignore empty bank and why.

Cheers,

[1] commit 5a37207df52066efefe419c677b089a654d37afc
Author: Julien Grall <jgrall@amazon.com>
Date:   Fri Sep 18 18:11:16 2020 +0100

     xen/arm: bootfdt: Ignore empty memory bank

     At the moment, Xen will stop processing the Device Tree if a memory
     bank is empty (size == 0).

     Unfortunately, some of the Device Tree (such as on Colibri imx8qxp)
     may contain such a bank. This means Xen will not be able to boot
     properly.

     Relax the check to just ignore the banks. FWIW this also seems to 
be the
     behavior adopted by Linux.

[2] alpine.DEB.2.22.394.2111091423020.440530@ubuntu-linux-20-04-desktop

-- 
Julien Grall

