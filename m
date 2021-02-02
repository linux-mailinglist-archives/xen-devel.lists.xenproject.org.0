Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B430C91D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 19:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80685.147761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l709u-00046d-Th; Tue, 02 Feb 2021 18:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80685.147761; Tue, 02 Feb 2021 18:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l709u-00046G-Q9; Tue, 02 Feb 2021 18:12:14 +0000
Received: by outflank-mailman (input) for mailman id 80685;
 Tue, 02 Feb 2021 18:12:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l709t-00046B-85
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 18:12:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l709r-0002yA-8y; Tue, 02 Feb 2021 18:12:11 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l709r-0007QK-1e; Tue, 02 Feb 2021 18:12:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3ao1A6dDpSArxpBrWSwd2BFC+8CJxPMrIxJHfLjHuuQ=; b=ieZG9MYo4OpgSIbNeVWkeH9LLh
	GPHWXzwlws5kNYCW5bbIBSaW3eOkSD0e9clXcjV2Y6gtERXj5+39UpL7ckcMfK6fCpUQ5sJQniQ6a
	AP/cL0qOSUyimJuGyLZQ04tpgFoR1LRtx2mFiU1zQs5kqfTX5ahwkaoHfBdVKNMiU5QE=;
Subject: Re: [PATCH] xen/arm: domain_build: Ignore device nodes with invalid
 addresses
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org>
Date: Tue, 2 Feb 2021 18:12:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBmQQ3Tzu++AadKx@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 02/02/2021 17:47, Elliott Mitchell wrote:
> The handle_device() function has been returning failure upon
> encountering a device address which was invalid.  A device tree which
> had such an entry has now been seen in the wild.  As it causes no
> failures to simply ignore the entries, ignore them. >
> Signed-off-by: Elliott Mitchell <ehem+xenn@m5p.com>
> 
> ---
> I'm starting to suspect there are an awful lot of places in the various
> domain_build.c files which should simply ignore errors.  This is now the
> second place I've encountered in 2 months where ignoring errors was the
> correct action.

Right, as a counterpoint, we run Xen on Arm HW for several years now and 
this is the first time I heard about issue parsing the DT. So while I 
appreciate that you are eager to run Xen on the RPI...

>  I know failing in case of error is an engineer's
> favorite approach, but there seem an awful lot of harmless failures
> causing panics.
> 
> This started as the thread "[RFC PATCH] xen/arm: domain_build: Ignore
> empty memory bank".  Now it seems clear the correct approach is to simply
> ignore these entries.

... we first need to fully understand the issues. Here a few questions:
    1) Can you provide more information why you believe the address is 
invalid?
    2) How does Linux use the node?
    3) Is it happening with all the RPI DT? If not, what are the 
differences?

> 
> This seems a good candidate for backport to 4.14 and certainly should be
> in 4.15.
> ---
>   xen/arch/arm/domain_build.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 374bf655ee..c0568b7579 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1407,9 +1407,9 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>           res = dt_device_get_address(dev, i, &addr, &size);
>           if ( res )
>           {
> -            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> +            printk(XENLOG_ERR "Unable to retrieve address of %s, index %u\n",
> +                   dt_node_full_name(dev), i);
> +            continue;
>           }
>   
>           res = map_range_to_domain(dev, addr, size, &mr_data);
> 

Cheers,

-- 
Julien Grall

