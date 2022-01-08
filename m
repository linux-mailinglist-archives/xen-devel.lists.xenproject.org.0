Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4344B488121
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 04:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254788.436664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62c9-0000Gj-Vq; Sat, 08 Jan 2022 03:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254788.436664; Sat, 08 Jan 2022 03:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62c9-0000E6-Sc; Sat, 08 Jan 2022 03:41:57 +0000
Received: by outflank-mailman (input) for mailman id 254788;
 Sat, 08 Jan 2022 03:41:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n62c7-0000Ds-Qo
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 03:41:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62c6-0002Wy-7O; Sat, 08 Jan 2022 03:41:54 +0000
Received: from [5.195.40.20] (helo=[10.235.48.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62c5-0004HA-Tm; Sat, 08 Jan 2022 03:41:54 +0000
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
	bh=uGUzn1dJHB1rmyS3yE1UNNt1WyiZNs1IrflKdcku34M=; b=zXIcMo7Q1Km9M4qX6jz7A3MFPT
	Ckivg9qdg8/VSeteKJf5CDzloEZAzraoe2k1cb+cAohTMXxJHgoRS/+ijdoJmoCzIqDe7V7hU9Lxl
	jeQTZ/PDJcyFD2MHrLUzUTnduwmBqRisl1yZajoKQtqclAyDlud5j/3V8WIoMe35j7sQ=;
Message-ID: <580a888e-24c4-5d16-8c70-f3d7b34ac2c9@xen.org>
Date: Sat, 8 Jan 2022 07:41:49 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220108004912.3820176-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/01/2022 00:49, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Introduce a new feature flag to signal that xenstore will not be
> immediately available at boot time. Instead, xenstore will become
> available later, and a notification of xenstore readiness will be
> signalled to the guest using the xenstore event channel.

Hmmm... On the thread [1], you semmed to imply that new Linux version (I 
am assuming master) are ready to be used in dom0less with the node xen. 
So I am bit confused why this is necessary?

> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>   xen/arch/arm/include/asm/domain.h | 2 ++
>   xen/common/kernel.c               | 2 ++
>   xen/include/public/features.h     | 6 ++++++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 9b3647587a..e5ae57cd09 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -89,6 +89,8 @@ struct arch_domain
>   #ifdef CONFIG_TEE
>       void *tee;
>   #endif
> +    /* Is this guest a dom0less domain? */
> +    bool is_dom0less;
>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index e119e5401f..c00ea67e5f 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -550,6 +550,8 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>               if ( is_hardware_domain(d) )
>                   fi.submap |= 1U << XENFEAT_dom0;
>   #ifdef CONFIG_ARM
> +            if ( d->arch.is_dom0less )
> +                fi.submap |= (1U << XENFEAT_xenstore_late_init);
>               fi.submap |= (1U << XENFEAT_ARM_SMCCC_supported);
>   #endif
>   #ifdef CONFIG_X86
> diff --git a/xen/include/public/features.h b/xen/include/public/features.h
> index 9ee2f760ef..18f32b1a98 100644
> --- a/xen/include/public/features.h
> +++ b/xen/include/public/features.h
> @@ -128,6 +128,12 @@
>   #define XENFEAT_not_direct_mapped         16
>   #define XENFEAT_direct_mapped             17
>   
> +/*
> + * The xenstore interface should be initialized only after receiving a
> + * xenstore event channel notification.
> + */
> +#define XENFEAT_xenstore_late_init 18

You are assuming that there will be no event until Xenstored has 
discovered the domain. If I am not mistaken, this works because when you 
allocate an unbound port, we will not raise the event.

But I am not sure this is a guarantee for the event channel ABI. For 
instance, when using bind interdomain an event will be raised on the 
local port.

Looking at the Xenstore interface, there are a field connection. Could 
we use it (maybe a flag) to tell when the connection was fully initiated?

> +
>   #define XENFEAT_NR_SUBMAPS 1
>   
>   #endif /* __XEN_PUBLIC_FEATURES_H__ */

Cheers,

[1] <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>

-- 
Julien Grall

