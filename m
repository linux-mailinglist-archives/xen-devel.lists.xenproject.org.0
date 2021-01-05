Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A680E2EB367
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 20:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62179.109953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwrsT-0007uX-Ew; Tue, 05 Jan 2021 19:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62179.109953; Tue, 05 Jan 2021 19:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwrsT-0007u8-Bt; Tue, 05 Jan 2021 19:20:21 +0000
Received: by outflank-mailman (input) for mailman id 62179;
 Tue, 05 Jan 2021 19:20:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwrsS-0007u3-Ew
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 19:20:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwrsM-0008C3-Nd; Tue, 05 Jan 2021 19:20:14 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwrsM-00061g-F2; Tue, 05 Jan 2021 19:20:14 +0000
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
	bh=n+9VYMUuCUAFtRFpil3X268193X7jEHCqwXEN4OxvWI=; b=02X7pXgsSQJgW2i+E2XBFdPZJ1
	EYXM/aLHOsKja5pIOeIMXFeLwm4EAFjB7raY3LsSaYlG/2pqqWP0cpkh1zhAoPwzvW0pm/ir7Vxj+
	crtsrmjkZk3j7FnkM6x/GSsms5d/Cs3dnzDYtd+JHHEXOdSv8vpVpn3Is+dq1C6N8Q0E=;
Subject: Re: [PATCH] xen/arm: do not read MVFR2 on arm32
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, iwj@xenproject.org, Andrew.Cooper3@citrix.com,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s>
 <20210105190548.13677-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <2646e16b-e59e-3f94-5d3e-59c8b8dab857@xen.org>
Date: Tue, 5 Jan 2021 19:20:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105190548.13677-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 05/01/2021 19:05, Stefano Stabellini wrote:
> MVFR2 is not available on arm32. Don't try to read it. Make MVFR2 arm64
> only.

Not really, MVFR2 is allocated when running in AArch32 mode on Armv8. It 
just doesn't exist on Armv7. See my answer your previous e-mail for more 
details.

> 
> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/cpufeature.c        | 2 ++
>   xen/include/asm-arm/cpufeature.h | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 1f6a85aafe..9e3377eae3 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -150,7 +150,9 @@ void identify_cpu(struct cpuinfo_arm *c)
>   
>           c->mvfr.bits[0] = READ_SYSREG(MVFR0_EL1);
>           c->mvfr.bits[1] = READ_SYSREG(MVFR1_EL1);
> +#ifdef CONFIG_ARM_64
>           c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
> +#endif
>   }
>   
>   /*
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index 6058744c18..fa20cb493a 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -272,7 +272,7 @@ struct cpuinfo_arm {
>       } isa32;
>   
>       struct {
> -        register_t bits[3];
> +        register_t bits[2 + IS_ENABLED(CONFIG_ARM_64)];

mvfr.bits[2] will be accessed from arch/arm/vcpreg.c, so you will 
provide garbagge to guest if the user happen to run Xen on Arm32 on Armv8.

Given that MVFR2 exists, I think it would be best to keep the definition 
in cpuinfo_arm around and only hardcode the value in cpufeature.c.

Please see my previous e-mail for more rationale on this approach.


Cheers,

-- 
Julien Grall

