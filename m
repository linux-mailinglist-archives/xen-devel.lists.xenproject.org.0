Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59435E437
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 18:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109988.209926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWM5I-0006Se-On; Tue, 13 Apr 2021 16:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109988.209926; Tue, 13 Apr 2021 16:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWM5I-0006SF-LV; Tue, 13 Apr 2021 16:40:16 +0000
Received: by outflank-mailman (input) for mailman id 109988;
 Tue, 13 Apr 2021 16:40:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWM5H-0006SA-72
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 16:40:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWM5F-0007ok-Rk; Tue, 13 Apr 2021 16:40:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWM5F-0000cr-Kl; Tue, 13 Apr 2021 16:40:13 +0000
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
	bh=4FOCyyxakTCH5GBbZIi7H3l3A7bDKqQJuxjsBP8qsZg=; b=6zT/IE9vzSO0sw/h71X/9up55L
	HsUQMOyCX0aXFm8kpvAGT5phxrL/2zAL176yTyi6EcneN9TV+Gx3nWwFsnOlxKuPcsnUwDZZVFx0x
	F6REGO6J+WV7yPZ3axH/Y1HV6xSVRL8E939SJPilTMC4RB5og2EKsQFiH1MwFycnCAMU=;
Subject: Re: [PATCH v3 1/4] xen/arm: Move dom0 creation in domain_build.c
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5a2f6160-d13b-b554-6e12-2318dfa3a5d3@xen.org>
Date: Tue, 13 Apr 2021 17:40:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412105243.23354-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 12/04/2021 11:52, Luca Fancellu wrote:
> Move dom0 creation and start from setup.c to domain_build.c
> on a dedicate function.

s/dedicate/dedicated/

I would also suggest to add "No functional changes intended" to make 
clear this is only code movement.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v3 changes:
> - move create_dom0 function after construct_dom0 and
>    make construct_dom0 static
> ---
>   xen/arch/arm/domain_build.c | 38 ++++++++++++++++++++++++++++++++++++-
>   xen/arch/arm/setup.c        | 29 +---------------------------
>   xen/include/asm-arm/setup.h |  2 +-
>   3 files changed, 39 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 374bf655ee..359957dc1b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -21,6 +21,7 @@
>   #include <asm/device.h>
>   #include <asm/kernel.h>
>   #include <asm/setup.h>
> +#include <asm/tee/tee.h>
>   #include <asm/platform.h>
>   #include <asm/psci.h>
>   #include <asm/setup.h>
> @@ -2520,7 +2521,7 @@ void __init create_domUs(void)
>       }
>   }
>   
> -int __init construct_dom0(struct domain *d)
> +static int __init construct_dom0(struct domain *d)

This wants a sentence in the commit message. How about the following 
commit message:

"
Move dom0 create and start from setup.c to a dedicated function in 
domain_build.c.

With this change, the function construct_dom0() is not used outside of 
domain_build.c anymore. So it is now a static function.

No functional changes intended.
"

If you agree with the new commit message. I can modify while commiting it:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

