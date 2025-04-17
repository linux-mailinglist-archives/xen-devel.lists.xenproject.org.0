Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72AA916DB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957168.1350343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KvP-0001TL-9d; Thu, 17 Apr 2025 08:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957168.1350343; Thu, 17 Apr 2025 08:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KvP-0001RH-6t; Thu, 17 Apr 2025 08:48:47 +0000
Received: by outflank-mailman (input) for mailman id 957168;
 Thu, 17 Apr 2025 08:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PNlP=XD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u5KvN-0001RB-Dw
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:48:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3ced57e-1b68-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 10:48:42 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 12CC54EE3C77;
 Thu, 17 Apr 2025 10:48:42 +0200 (CEST)
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
X-Inumbo-ID: c3ced57e-1b68-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1744879722;
	b=VA0KRYIvNp1jEN7xEAh7MSGQDyqxt9HKx8aUqf8db/vBfUE9KUJQAS3t7nMlUztnBv+C
	 1trOTds046tLA7fgUolZfqpOcSzgEP0WHIN/AiLnPKrXu2ZnX4pc8LwMBY28NxZ3tQhBA
	 IuaJCcVaamou0henaXg5kIOvlyjbqaE9shNR2jT9zv8wlnyYpLCUXQtxAnOctJ2bza9AP
	 cuxT9o72bfphov/4QVcONjNm+M+ywdOcoXaaoP70WI3vaTGevUkrEbQfvJJ93t6+6+Y5j
	 TUCQJUhZPQ2jXH5Wq0F8da36oyLMRH84MZv+fJxsYiKcelaYqpgCTdFaxJYLDJ/qMk9UE
	 g+6I4NLcZv1WSNQH8Hv62FG14Kjz0bzvv1iZrdOKHEO016/jWyRPT7IKmtveE9WLIlDFP
	 Dyz98mafsv8sRp9Yiwz/ORBOm2/nL2im+vpzFl6e1CM1h28j9o+LdfOc0VzMAV3LvIMFJ
	 yJ1hfXuF8QmKnP/HSBfKU9YOu/tn/0DJHSyZTZ4yyCaV4owZhP5iy+RZ35CERn+1627ah
	 2B66FQlCM1QIb6LQoqy1jjzJZsBm1L1TsyIvGOxfMhIYoVCV3dynaO47UBCKwNEXbe7ib
	 YeOVhJCStQbI97sMhDHnDfNKPxeDRhFdlwGRk1W78DKjxXoxtol0fAAdknYCf4Y=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1744879722;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=R7MrtEuaio1dEUqqHW0mHSP6vjdDz05jioxyuZBttSA=;
	b=ilnF+x1/liE8H2ZN6scuJoGgnDHRKempqWzzyB61lxD3JgQu+wYg6usOQWXl87Ahigq9
	 i8ReIBNprPi7FgwQZOMl+hzHvtxR0c1ZM2qXbRI7hhZ3MMlzIi07xGE8vfAoaP6h8vyn2
	 U8/MUfqNxTNn0gVkKHSBxxd3yoAgWbtMAr8LkMgjvh9GyvTbvQmyxFuco6u2TpUCbN0+M
	 pWNHIVHmiirUJ+cjyeZCQIOy4AWAznN1t0dO0Lduz2iO0P/lytX2gYeXaPxTpIOSUMHF1
	 dYuNTJGYY/3b9Xtiw0jrDlJyFNaEc8Z1oZzppRSFB0+dLNhT4ZJdEbIV4awij4c6Ry2SA
	 b0nQGNA5411NNExgQsT89R+JTo0EZAqP+Q12te00p9cI3oBEiXXpOdSPuemn0u7EL4p3I
	 wI+ExLlJtnXmQ9v5QBDVztcszCxbnbLYuCCR2+UBabPonDnUU9pHGKg+tzM75ilG6l0HM
	 LaK8kVtdn/E+oziEG7OsgjbopaCGKwZWcmhy3FaSMFLuoxQu6kVBJeOsKnOqZp79oYUcn
	 Q18f3uqYZORp8kOKbgKjXREi/DasSCUxOAmQhaTHasjdVjSYoxTogBLI6ubq58bnwmkX9
	 yTbA2ANIJW0a9ErQv7BGxUAfNic/ajZSCAxVSHoS6wBgeNdKSS91Nxj9qPBKZ40=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1744879722; bh=s5G6GXTqcQCd1vzUNVXd/QunZ684UNHvQmRHyiXRaNE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fiPxoT4ZAPFrDvl50e9nTFBWiMmwZ4xwhjh6UeH2/GhPlFrRuCQa+BCOVtEvhiMSe
	 2wFxqQSej9Sg9Gu49Y47DcLSWKFMB3mm8mrzGJ5f3yvo+ouI/ig1dq0ZsuIg3TGQxN
	 fpFAIjLaZdsFmUAyj2wMegJY9q6nEhAu2NzIJsWxd20LFJ+xlyFPWG67Om1MmVX2U2
	 vqgMJAOAAD1FOmcJjA1f/dmMJ7XqDrZTk2fpuDVXKPV5vC4Ja1vhN4XomHgY+/Rt1z
	 56y+jNH4zT3pZmyAjlTaBudMcLbkyGMzA3ATVceDPVNsVdczkIFqq7fRcDrbVcAp/5
	 2wlq0drY1l+TA==
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 10:48:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, consulting@bugseng.com
Subject: Re: [PATCH] Arm: rename smp_clear_cpu_maps()
In-Reply-To: <b792df9c-9912-468b-87a8-bb5d81c14df6@suse.com>
References: <b792df9c-9912-468b-87a8-bb5d81c14df6@suse.com>
Message-ID: <01729ccaa66afcf046a861a565d26d41@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-17 10:36, Jan Beulich wrote:
> The function has lost all clearing operations. Use the commonly
> available name (declared in xen/smp.h), that x86 also uses.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I would have expected this to also address a Misra violation
> (declaration without definition), but I can't spot any rule (having
> looked through 8.x in particular) to this effect.
> 

The rule you are looking for is 8.6: " An identifier with external 
linkage shall have exactly one external definition", which is explicitly 
deviated in Xen to allow declarations that have no definition, 
especially in the case where definitions may be optimized out by the 
compiler or are simply compiled out. I don't recall the specific 
discussion that led to this deviation, but I can dug it up, if needed.

> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -29,7 +29,6 @@ int cpu_up_send_sgi(int cpu);
>  extern void init_secondary(void);
> 
>  extern void smp_init_cpus(void);
> -extern void smp_clear_cpu_maps (void);
>  extern unsigned int smp_get_max_cpus(void);
> 
>  #define cpu_physical_id(cpu) cpu_logical_map(cpu)
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -317,7 +317,7 @@ void asmlinkage __init start_xen(unsigne
>      /* Initialize traps early allow us to get backtrace when an error 
> occurred */
>      init_traps();
> 
> -    smp_clear_cpu_maps();
> +    smp_prepare_boot_cpu();
> 
>      device_tree_flattened = early_fdt_map(fdt_paddr);
>      if ( !device_tree_flattened )
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -107,8 +107,7 @@ static void remove_cpu_sibling_map(int c
>      free_cpumask_var(per_cpu(cpu_core_mask, cpu));
>  }
> 
> -void __init
> -smp_clear_cpu_maps (void)
> +void __init smp_prepare_boot_cpu(void)
>  {
>      cpumask_set_cpu(0, &cpu_online_map);
>      cpumask_set_cpu(0, &cpu_possible_map);

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

