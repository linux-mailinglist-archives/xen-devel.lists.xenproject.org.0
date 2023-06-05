Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B162A723002
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543897.849260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6G9m-0000hK-CI; Mon, 05 Jun 2023 19:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543897.849260; Mon, 05 Jun 2023 19:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6G9m-0000fX-9d; Mon, 05 Jun 2023 19:46:22 +0000
Received: by outflank-mailman (input) for mailman id 543897;
 Mon, 05 Jun 2023 19:46:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6G9l-0000fQ-5g
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:46:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6G9k-0004WV-JM; Mon, 05 Jun 2023 19:46:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6G9k-00024K-Ds; Mon, 05 Jun 2023 19:46:20 +0000
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
	bh=P3r5vagAfkT2yE3C7r0zsu4z7Yq/yat9S7mvlTE1vUg=; b=G3sNxw/Ex7d5dm3xHt6bT9CXIG
	4jY+4znkTza4QWnKAdKa+amrqVKVhTwcxgnvDjtMU28msW7wF9M2egVpYRBNHGSoAuuH7k07AkDIm
	SQ3CigQWfDjTUHwqtHiiSsYgO5tAQbSKKcCIRxflzYbgvAtx1UAe9bbEpgHxja0w65Gk=;
Message-ID: <49641d70-9540-1072-d496-772e83a555e4@xen.org>
Date: Mon, 5 Jun 2023 20:46:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v7 13/19] asm/smp.h: Fix circular dependency for
 device_tree.h and rwlock.h
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-14-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230602004824.20731-14-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Dynamic programming ops will modify the dt_host and there might be other
> function which are browsing the dt_host at the same time. To avoid the race
> conditions, adding rwlock for browsing the dt_host.

Reading this sentence, it sounds like you are adding the rwlock in this 
patch. However, this is not the case. Also, the rwlock is not only for 
browsing but also add new node. So how about ", we will need to add a 
rwlock to protect access to the dt_host".

> But adding rwlock in
> device_tree.h causes following circular dependency:
>      device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h
> 
> To fix this, removed the "#include <xen/device_tree.h> and forward declared
> "struct dt_device_node".
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/include/asm/smp.h | 3 ++-
>   xen/arch/arm/smpboot.c         | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
> index a37ca55bff..b12949ba8a 100644
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -3,13 +3,14 @@
>   
>   #ifndef __ASSEMBLY__
>   #include <xen/cpumask.h>
> -#include <xen/device_tree.h>
>   #include <asm/current.h>
>   #endif
>   
>   DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>   DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>   
> +struct dt_device_node;

Can you add the declaration just above arch_cpu_init()? This will make 
clearer why the forward declaration is necessary.

> +
>   #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
>   
>   #define smp_processor_id() get_processor_id()
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index e107b86b7b..eeb76cd551 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -10,6 +10,7 @@
>   #include <xen/cpu.h>
>   #include <xen/cpumask.h>
>   #include <xen/delay.h>
> +#include <xen/device_tree.h>
>   #include <xen/domain_page.h>
>   #include <xen/errno.h>
>   #include <xen/init.h>

Cheers,

-- 
Julien Grall

