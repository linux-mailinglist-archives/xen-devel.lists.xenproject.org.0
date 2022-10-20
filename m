Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE8B606813
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 20:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427021.675839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ola8k-0007Y3-7V; Thu, 20 Oct 2022 18:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427021.675839; Thu, 20 Oct 2022 18:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ola8k-0007V1-43; Thu, 20 Oct 2022 18:19:34 +0000
Received: by outflank-mailman (input) for mailman id 427021;
 Thu, 20 Oct 2022 18:19:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ola8i-0007Uv-W5
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 18:19:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ola8i-0006Gc-HB; Thu, 20 Oct 2022 18:19:32 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ola8i-0008EG-AJ; Thu, 20 Oct 2022 18:19:32 +0000
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
	bh=tTDPMT/bYo1SNeZBluj8cyKZTVoPwSbGq7/2OhLv/AM=; b=VuxTyf75TrJD+hYFQXtT2xKWlE
	SPVjYAcZrxtt5g28MzAv7UbYVoa8vd5Ky9rjQdvkt3XDIEC6k1ldMAvG/lgR1AdgIfotmm1f2yp7G
	eFI0vHUQCYyVPAtgNisahSI4MRFDUAk4uaTsvb2Iovz/2S0yEk7jQgEeNlToVQeyNFBU=;
Message-ID: <fe6ac13f-70c4-8d15-20b5-a52ec88f394d@xen.org>
Date: Thu, 20 Oct 2022 19:19:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v2] xen/arm: mark handle_linux_pci_domain() __init
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
 <20221014200926.15250-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221014200926.15250-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

I nearly missed this one because it was threaded under v1. In the 
future, would you be able to send new version in a separate thread? This 
makes easier to track it.

On 14/10/2022 21:09, Stewart Hildebrand wrote:
> All functions in domain_build.c should be marked __init. This was
> spotted when building the hypervisor with -Og.
> 
> Fixes: 1050a7b91c xen/arm: add pci-domain for disabled devices
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Henry, this patch is fixing a potential build failure on some compiler 
(at the moment we are relying on the compiler to inline 
handle_linux_pci_domain). AFAIU, the problem was introduced in Xen 4.17. 
Would you be happy if we include it in the release?

Cheers,

> 
> ---
> v1 -> v2:
>    Add Fixes: tag
>    Add patch description
> ---
>   xen/arch/arm/domain_build.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 61cda8e843..fc2961895b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1051,8 +1051,8 @@ static void __init assign_static_memory_11(struct domain *d,
>    * The current heuristic assumes that a device is a host bridge
>    * if the type is "pci" and then parent type is not "pci".
>    */
> -static int handle_linux_pci_domain(struct kernel_info *kinfo,
> -                                   const struct dt_device_node *node)
> +static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
> +                                          const struct dt_device_node *node)
>   {
>       uint16_t segment;
>       int res;

-- 
Julien Grall

