Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2123FFCAE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 11:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177942.323734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM587-0003b5-3R; Fri, 03 Sep 2021 09:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177942.323734; Fri, 03 Sep 2021 09:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM587-0003ZG-0A; Fri, 03 Sep 2021 09:04:59 +0000
Received: by outflank-mailman (input) for mailman id 177942;
 Fri, 03 Sep 2021 09:04:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mM584-0003ZA-Sn
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 09:04:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mM581-0000er-Sf; Fri, 03 Sep 2021 09:04:53 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mM581-0002uw-MR; Fri, 03 Sep 2021 09:04:53 +0000
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
	bh=GBrzngP5vJbdy9YlVKO13Ln629Mn55ISUbjkYvuttWo=; b=kcv2bQrhr9WWltUjml2Nfb25yz
	HWgnrzQwnnlM6x8Q3WujjW7esIL6kVj7aov6pPkAwz7IqXH7Po2kTCn/XVW56erKwwMqr8rTedZ8Y
	X3jqaAbzis2k7ekcwSeYhQ24qltM2vKDTYAbpnwbjJmc6VCVubc9ks5tqaJunNI8UF3g=;
Subject: Re: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-12-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
Date: Fri, 3 Sep 2021 10:04:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903083347.131786-12-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vPCI may map and unmap PCI device memory (BARs) being passed through which
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
> Run the corresponding vPCI code while switching a vCPU.

IIUC, you are talking about the function map_range() in 
xen/drivers/vpci/header. The function has the following todo for Arm:

         /*
          * ARM TODOs:
          * - On ARM whether the memory is prefetchable or not should be 
passed
          *   to map_mmio_regions in order to decide which memory attributes
          *   should be used.
          *
          * - {un}map_mmio_regions doesn't support preemption.
          */

This doesn't seem to be addressed in the two series for PCI passthrough 
sent so far. Do you have any plan to handle it?

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   xen/arch/arm/traps.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fbde..1571fb8afd03 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -34,6 +34,7 @@
>   #include <xen/symbols.h>
>   #include <xen/version.h>
>   #include <xen/virtual_region.h>
> +#include <xen/vpci.h>
>   
>   #include <public/sched.h>
>   #include <public/xen.h>
> @@ -2304,6 +2305,11 @@ static bool check_for_vcpu_work(void)
>       }
>   #endif
>   
> +    local_irq_enable();
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )

Looking at the code of vpci_process_pending(), it looks like there are 
some rework to do for guest. Do you plan to handle it as part of the 
vPCI series?

> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +    local_irq_disable();
> +

 From my understanding of vcpi_process_pending(). The function will 
return true if there are more work to schedule. However, if 
check_for_vcpu_for_work() return false, then we will return to the guest 
before any work for vCPI has finished. This is because 
check_for_vcpu_work() will not be called again.

In this case, I think you want to return as soon as you know we need to 
reschedule.

However, looking at the rest of the code, we already have a check for 
vpci in the common IOREQ code. So we would end up to call twice 
vpci_process_pending(). Maybe we should move the call from the IOREQ to 
arch-code.

Cheers,

-- 
Julien Grall

