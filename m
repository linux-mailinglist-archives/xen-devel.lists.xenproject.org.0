Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD0608E15
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428401.678463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGSb-00083k-RA; Sat, 22 Oct 2022 15:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428401.678463; Sat, 22 Oct 2022 15:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omGSb-00081w-OC; Sat, 22 Oct 2022 15:30:53 +0000
Received: by outflank-mailman (input) for mailman id 428401;
 Sat, 22 Oct 2022 15:30:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omGSa-00081q-9H
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:30:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omGSZ-0005lf-DQ; Sat, 22 Oct 2022 15:30:51 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.29.245]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omGSZ-00034O-3b; Sat, 22 Oct 2022 15:30:51 +0000
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
	bh=sInZb5q0RfCvzurZG+VzUppWnv1M4vNyGRYuy5GGj9g=; b=K6S47xNImgaHkyEfKAq+Lvx6ka
	hQzfZqMt+GDJ4xjhiZBpeQWnQNWOLN3XFiCyE/sriyBVtojV44Qh/EZpdaNzap235Ls6RJWFUQL/Z
	aECGaqSmBpQejf2AqYGFXhh5Nazumg95m7v+2ubG+q2wohoTIjzESyyqZ63mqS6iM2r0=;
Message-ID: <61e8475d-868d-3ff0-041f-8f6790990ce4@xen.org>
Date: Sat, 22 Oct 2022 16:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v2] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Is this intended for 4.17?

On 09/09/2022 15:30, Jan Beulich wrote:
> Gcc12 takes issue with core_parking_remove()'s
> 
>      for ( ; i < cur_idle_nums; ++i )
>          core_parking_cpunum[i] = core_parking_cpunum[i + 1];
> 
> complaining that the right hand side array access is past the bounds of
> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
> zero in this case (as the sole CPU cannot be parked).
> 
> Arrange for core_parking.c's contents to not be needed altogether, and
> then disable its building when NR_CPUS == 1.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Disable building of core_parking.c altogether.
> 
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -10,7 +10,7 @@ config X86
>   	select ALTERNATIVE_CALL
>   	select ARCH_MAP_DOMAIN_PAGE
>   	select ARCH_SUPPORTS_INT128
> -	select CORE_PARKING
> +	select CORE_PARKING if NR_CPUS > 1
>   	select HAS_ALTERNATIVE
>   	select HAS_COMPAT
>   	select HAS_CPUFREQ
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -727,12 +727,17 @@ ret_t do_platform_op(
>           case XEN_CORE_PARKING_SET:
>               idle_nums = min_t(uint32_t,
>                       op->u.core_parking.idle_nums, num_present_cpus() - 1);
> -            ret = continue_hypercall_on_cpu(
> -                    0, core_parking_helper, (void *)(unsigned long)idle_nums);
> +            if ( CONFIG_NR_CPUS > 1 )
> +                ret = continue_hypercall_on_cpu(
> +                        0, core_parking_helper,
> +                        (void *)(unsigned long)idle_nums);
> +            else if ( idle_nums )
> +                ret = -EINVAL;
>               break;
>   
>           case XEN_CORE_PARKING_GET:
> -            op->u.core_parking.idle_nums = get_cur_idle_nums();
> +            op->u.core_parking.idle_nums = CONFIG_NR_CPUS > 1
> +                                           ? get_cur_idle_nums() : 0;
>               ret = __copy_field_to_guest(u_xenpf_op, op, u.core_parking) ?
>                     -EFAULT : 0;
>               break;
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -157,7 +157,7 @@ long arch_do_sysctl(
>           long (*fn)(void *);
>           void *hcpu;
>   
> -        switch ( op )
> +        switch ( op | -(CONFIG_NR_CPUS == 1) )
This code is quite confusing to read and potentially risky as you are 
are relying the top bit of 'op' to never be 1. While I am expecting this 
will ever be the case, this will be a "fun" issue to debug if this ever 
happen. So I would suggest to check CONFIG_NR_CPUS == 1 separately.

The rest of the changes looks fine to me.

Cheers,

-- 
Julien Grall

