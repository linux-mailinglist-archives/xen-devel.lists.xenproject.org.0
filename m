Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA2808782
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649827.1014787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDMT-0004pC-Nl; Thu, 07 Dec 2023 12:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649827.1014787; Thu, 07 Dec 2023 12:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDMT-0004mm-LB; Thu, 07 Dec 2023 12:20:13 +0000
Received: by outflank-mailman (input) for mailman id 649827;
 Thu, 07 Dec 2023 12:20:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBDMS-0004mg-0G
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:20:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDMR-0002Yb-EC; Thu, 07 Dec 2023 12:20:11 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDMR-00049O-5C; Thu, 07 Dec 2023 12:20:11 +0000
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
	bh=UKcwwZI0V+9uCGvdUndJdWIwmUQcJJVqMeBbc6VBpHU=; b=DxGFzEL6Lx10VydoOzPl3saeLM
	jDYmf7lTiCv9GtXjAa0gMTEP+BM+flePP33480eBm+R68+fS9udrko7iaYxnWAHBd7jYE2L6+09cq
	us6r0sQbh7ZmnMa7Xfsyv+2s07OLbKC3wUuJWUO09O7GcfS4H6WPLXGnuzx3aS6UUqAo=;
Message-ID: <d45f0d37-dbca-44a8-a27f-b9e709bb9cfd@xen.org>
Date: Thu, 7 Dec 2023 12:20:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: bootfdt: Check return code of
 device_tree_for_each_node()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231207101432.37732-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231207101432.37732-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 07/12/2023 10:14, Michal Orzel wrote:
> As a result of not checking the return code of device_tree_for_each_node()
> in boot_fdt_info(), any error occured during early FDT parsing does not
> stop Xen from booting. This can result in an unwanted behavior in later
> boot stages. Fix it by checking the return code and panicing on an error.
> 
> Fixes: 9cf4a9a46717 ("device tree: add device_tree_for_each_node()")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> I've lost count how many times I had to fix missing rc check. However, I have
> not yet found any checker for this (-Wunused-result is pretty useless).
> ---
>   xen/arch/arm/bootfdt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index b1f03eb2fcdd..f496a8cf9494 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -541,7 +541,9 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>   
>       add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>   
> -    device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
> +    ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
> +    if ( ret )
> +        panic("Early FDT parsing failed (%d)\n", ret);

AFAIU, the parsing is done before the console is setup. This means a 
user would not be able to get some logs unless they are re-compiling Xen 
with earlyprintk.

I understand this is not a new issue, but I am getting concerned of the 
amount of check we add before the console is up and running.

What is the impact if we don't check the return here? Is it missing regions?

I wonder whether we can either enable the console earlier, or make 
earlyprintk more dynamic (similar to what Linux is doing with 
earlyprintk=...).

Cheers,

-- 
Julien Grall

