Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4DB4A958D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 09:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265178.458483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuJ9-00082a-Dl; Fri, 04 Feb 2022 08:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265178.458483; Fri, 04 Feb 2022 08:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFuJ9-00080k-AM; Fri, 04 Feb 2022 08:51:07 +0000
Received: by outflank-mailman (input) for mailman id 265178;
 Fri, 04 Feb 2022 08:51:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFuJ8-00080e-Ib
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 08:51:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFuJ7-0004zO-30; Fri, 04 Feb 2022 08:51:05 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.31.165]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFuJ6-0004pp-SZ; Fri, 04 Feb 2022 08:51:05 +0000
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
	bh=QbPLx9302bQDr56ww36ibnkP7vYC1Av2h3v8BLGChx0=; b=y4OEfhmBJ1Amnw9koQuNeg7bCS
	5sVKWUNZT7yUz3H7hig+ZKbJKhsQ7NMS3H6OrHs5zoaErGH1YacZEdklrNyhK1z46KNObmNKfyatK
	uqOkoPXy1KzaOsM/p4tE1tBMibJ8iC44VVf8ljsliY/LZhIKFfDUf439v+OuCNXv5PdE=;
Message-ID: <000ac24e-fdac-855d-7fb4-2165a1192ea4@xen.org>
Date: Fri, 4 Feb 2022 08:51:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-2-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220204063459.680961-2-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/02/2022 06:34, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add a stub for is_memory_hole which is required for PCI passthrough
> on Arm.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
> New in v6
> ---
>   xen/arch/arm/mm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b1eae767c27c..c32e34a182a2 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1640,6 +1640,12 @@ unsigned long get_upper_mfn_bound(void)
>       return max_page - 1;
>   }
>   
> +bool is_memory_hole(mfn_t start, mfn_t end)
> +{
> +    /* TODO: this needs to be properly implemented. */

I was hoping to see a summary of the discussion from IRC somewhere in 
the patch (maybe after ---). This would help to bring up to speed the 
others that were not on IRC.

> +    return true;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C

-- 
Julien Grall

