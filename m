Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D3B0CA2A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 19:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051703.1420100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udumq-00012w-5B; Mon, 21 Jul 2025 17:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051703.1420100; Mon, 21 Jul 2025 17:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udumq-0000zp-28; Mon, 21 Jul 2025 17:58:52 +0000
Received: by outflank-mailman (input) for mailman id 1051703;
 Mon, 21 Jul 2025 17:58:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1udumo-0000zj-Nd
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 17:58:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1udumn-00Bd4d-1X;
 Mon, 21 Jul 2025 17:58:49 +0000
Received: from [2a02:8012:3a1:0:f130:2d26:b339:e1b7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1udumn-007YPD-0m;
 Mon, 21 Jul 2025 17:58:49 +0000
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
	bh=N8S/I+MGApXP4qR7CzlM8tKPSeiaNG7v2HEEG0CKHW4=; b=Ba4cAD6nQZlRSjiX4fXVMu3fwq
	8Ibw1kVb0trb5I47LYo0ReKPRDc9ffdtMyzJq6Wp87uSJEhJqSrvHlo4fhok19Vz70yBw3ysLKwwz
	MgpGrc2NAk5ueQOD4cryRTi6GWBygLq/QpWTHKJ05csX9EVprfdHj5qOnsOBRWuHm2CM=;
Message-ID: <5c99a02b-a5f6-4dad-8d55-936697c70f2c@xen.org>
Date: Mon, 21 Jul 2025 18:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-5-jason.andryuk@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250716211504.291104-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jason,

On 16/07/2025 22:14, Jason Andryuk wrote:
> Add a new create domain flag  to indicate if a domain can be the target
> of hypercalls.  By default all domains can be targetted - subject to any
> other permission checks.
> 
> This property is useful in a safety environment to isolate domains for
> freedom from interference.

I see the flag is exposed to the toolstack. However, I don't see how you 
can successfully create a VM if you are not allowed to call hypercalls 
(for instance to add some memory).

I think, at minimum, you would want to allow hypercalls while the domain 
is created. That said, I wonder if this setup would not be better to 
describe with XSM?


[...]

> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 88a294c5be..f1f6f96bc2 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>   #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
>   /* Allow domain to provide device model for multiple other domains */
>   #define XEN_DOMCTL_CDF_device_model   (1U << 9)
> +/* Domain cannot be the target of hypercalls */
> +#define XEN_DOMCTL_CDF_not_hypercall_target   (1U << 10)
>   
>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_not_hypercall_target

I am not sure where to comment. But aren't both flags mutually exclusive?

> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 0b341efd18..f2205575ed 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -91,12 +91,16 @@ static always_inline int xsm_default_action(
>               return 0;
>           fallthrough;
>       case XSM_DM_PRIV:
> +        if ( target && !is_hypercall_target(target) )
> +            return -EPERM;
>           if ( is_dm_domain(src) )
>               return 0;
>           if ( target && evaluate_nospec(src->target == target) )
>               return 0;
>           fallthrough;
>       case XSM_PRIV:
> +        if ( target && !is_hypercall_target(target) )
> +            return -EPERM;
>           if ( is_control_domain(src) )
>               return 0;
>           return -EPERM;

Cheers,

-- 
Julien Grall


