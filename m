Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAA1BFE5A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAFC-0003VS-Gb; Thu, 30 Apr 2020 14:32:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jUAFB-0003VN-7n
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:32:53 +0000
X-Inumbo-ID: 78fcfcb8-8aef-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78fcfcb8-8aef-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 14:32:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD360AEF8;
 Thu, 30 Apr 2020 14:32:50 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/Kconfig: define EXPERT a bool rather than a string
To: Julien Grall <julien@xen.org>
References: <20200430124343.29886-1-julien@xen.org>
 <20200430124343.29886-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d069d81b-24bf-1aac-3009-63e90a45af4b@suse.com>
Date: Thu, 30 Apr 2020 16:32:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430124343.29886-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.2020 14:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit f80fe2b34f08 "xen: Update Kconfig to Linux v5.4" EXPERT
> can only have two values (enabled or disabled). So switch from a string
> to a bool.
> 
> Take the opportunity to replace all "EXPERT = y" to "EXPERT".
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a remark:

> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -33,7 +33,7 @@ source "arch/Kconfig"
>  
>  config ACPI
>  	bool
> -	prompt "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT = "y"
> +	prompt "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
>  	depends on ARM_64
>  	---help---
>  
> @@ -51,7 +51,7 @@ config GICV3
>  
>  config HAS_ITS
>          bool
> -        prompt "GICv3 ITS MSI controller support" if EXPERT = "y"
> +        prompt "GICv3 ITS MSI controller support" if EXPERT
>          depends on GICV3 && !NEW_VGIC

Could I talk you info switching ones like the above (looks like
there aren't further ones) to ...

> @@ -81,7 +81,7 @@ config SBSA_VUART_CONSOLE
>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>  
>  config ARM_SSBD
> -	bool "Speculative Store Bypass Disable" if EXPERT = "y"
> +	bool "Speculative Store Bypass Disable" if EXPERT

... this more compact form on this occasion?

Jan

