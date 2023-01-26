Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7267C886
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 11:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484932.751824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzRt-0001eN-Bh; Thu, 26 Jan 2023 10:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484932.751824; Thu, 26 Jan 2023 10:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzRt-0001cf-8S; Thu, 26 Jan 2023 10:25:41 +0000
Received: by outflank-mailman (input) for mailman id 484932;
 Thu, 26 Jan 2023 10:25:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKzRs-0001cZ-4u
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 10:25:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzRr-0007bV-OH; Thu, 26 Jan 2023 10:25:39 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.8.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzRr-00005w-Ir; Thu, 26 Jan 2023 10:25:39 +0000
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
	bh=0Kg20AapJpmlw0BBBiAJrM4D4nqJNkf4ZrfuQfHy8Ac=; b=hM83Cvd5PFQMtQ0hbDGpGok3Fo
	jI4Vo+4DddanwM7bn1f70wF5WdWUi3ZV2YJS0YalRTiGppVSESwF1p85oA6zPRRLzL1KbXmJucOGZ
	OFecMkx+kNle7kb8prImFOZ2HPe8ghxjxA910V6aE5THVpQkkygyMgRSWAFE1sSEef3A=;
Message-ID: <79a1cd30-b2b6-f7e1-f000-d78520ec9e0e@xen.org>
Date: Thu, 26 Jan 2023 10:25:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/11] xen/arm: use colored allocator for p2m page
 tables
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-9-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230123154735.74832-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 23/01/2023 15:47, Carlo Nonato wrote:
> Cache colored domains can benefit from having p2m page tables allocated
> with the same coloring schema so that isolation can be achieved also for
> those kind of memory accesses.
> In order to do that, the domain struct is passed to the allocator and the
> MEMF_no_owner flag is used.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v4:
> - fixed p2m page allocation using MEMF_no_owner memflag
> ---
>   xen/arch/arm/p2m.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 948f199d84..f9faeb61af 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -4,6 +4,7 @@
>   #include <xen/iocap.h>
>   #include <xen/ioreq.h>
>   #include <xen/lib.h>
> +#include <xen/llc_coloring.h>
>   #include <xen/sched.h>
>   #include <xen/softirq.h>
>   
> @@ -56,7 +57,10 @@ static struct page_info *p2m_alloc_page(struct domain *d)
>        */
>       if ( is_hardware_domain(d) )
>       {
> -        pg = alloc_domheap_page(NULL, 0);
> +        if ( is_domain_llc_colored(d) )
> +            pg = alloc_domheap_page(d, MEMF_no_owner);
> +        else
> +            pg = alloc_domheap_page(NULL, 0);
I don't think we need to special case a colored domain here.You could 
simply always pass the domain/MEMF_no_owner and let the function decide 
what to do.

This approach would also be useful when NUMA will be supported on Arm 
(the series is still under review).

>           if ( pg == NULL )
>               printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
>       }
> @@ -105,7 +109,10 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>           if ( d->arch.paging.p2m_total_pages < pages )
>           {
>               /* Need to allocate more memory from domheap */
> -            pg = alloc_domheap_page(NULL, 0);
> +            if ( is_domain_llc_colored(d) )
> +                pg = alloc_domheap_page(d, MEMF_no_owner);
> +            else
> +                pg = alloc_domheap_page(NULL, 0);

Ditto.

>               if ( pg == NULL )
>               {
>                   printk(XENLOG_ERR "Failed to allocate P2M pages.\n");

Cheers,

-- 
Julien Grall

