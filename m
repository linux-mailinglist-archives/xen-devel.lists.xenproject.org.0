Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED946D8F2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 17:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242513.419427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0C0-0005g2-2f; Wed, 08 Dec 2021 16:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242513.419427; Wed, 08 Dec 2021 16:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv0Bz-0005do-US; Wed, 08 Dec 2021 16:53:19 +0000
Received: by outflank-mailman (input) for mailman id 242513;
 Wed, 08 Dec 2021 16:53:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mv0By-0005di-NG
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 16:53:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv0Bx-0001oY-IB; Wed, 08 Dec 2021 16:53:17 +0000
Received: from [54.239.6.189] (helo=[192.168.13.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv0Bx-0004cT-Ba; Wed, 08 Dec 2021 16:53:17 +0000
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
	bh=O05kB8Vl7RHOAiMe94cfoJE5/NLlSmmoEh+WONy/5To=; b=PCU8f+LEf7AmShiHv4smzuTJr6
	NnHnfV8KL6ce1hO1vLoUwW+pPv41UUkBEvkAdeGQYVC0P/YBE/Qw9zvHu/jk/UJpI3iYbUj7FPtZp
	2nl8a3RNomSRdP9QjefCE73V7b1dmOiRMmsNF9IKc95QFWTIAGNOZjrXlYSoqaFzXulA=;
Message-ID: <77326c24-9d2a-22ef-00cf-b89f1e70eaaf@xen.org>
Date: Wed, 8 Dec 2021 16:53:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v7 4/7] xen/arm: account IO handler for emulated PCI host
 bridge
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-5-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211124075942.2645445-5-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 24/11/2021 07:59, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> At the moment, we always allocate an extra 16 slots for IO handlers
> (see MAX_IO_HANDLER). So while adding an IO trap handler for the emulated
> PCI host bridge we are not breaking anything, but we have a latent bug
> as the maximum number of IOs may be exceeded.
> Fix this by explicitly telling that we have an additional IO handler, so it is
> accounted.
> 
> Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")

In general, it is better to have the fixes at the beginning of a series. 
So they are relying on less rework and easier to backport (if needed).

In this case, PCI passthrough is still a technical preview so it doesn't 
matter too much.

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
 >
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index ccd998d8dba2..8e801f275879 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -126,7 +126,8 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>           return ret < 0 ? 0 : ret;
>       }
>   
> -    return 0;
> +    /* For a single emulated host bridge's configuration space. */

This comment is lacking some context. I would suggest to reword to 
something like:

"For the guests, each host bridge requires one region to cover the 
configuration space. At the moment, we only expose a single host bridge.
"

With that (or a similar comment):

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

