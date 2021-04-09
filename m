Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227743598EF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 11:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107701.205860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUnBd-0004tv-Fy; Fri, 09 Apr 2021 09:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107701.205860; Fri, 09 Apr 2021 09:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUnBd-0004tW-Cf; Fri, 09 Apr 2021 09:12:21 +0000
Received: by outflank-mailman (input) for mailman id 107701;
 Fri, 09 Apr 2021 09:12:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUnBc-0004tR-8B
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 09:12:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUnBY-0006Pa-Dl; Fri, 09 Apr 2021 09:12:16 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUnBY-00057X-2C; Fri, 09 Apr 2021 09:12:16 +0000
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
	bh=uRJPOQODoy4IXN4+v6qQ0IVkspn+XW1Sl/lUizAD00I=; b=2h/idNwGYRxorj21LrLBFnN+E9
	WrNTutptjasVtqxQTkiEza/DEa8VROg7s9NE3K3eHt9uuu/HLWkiw39sqpUtRVj6RwM8C4k/cky2i
	bkvAn4Z8Hj+N4bTdu6clLLfUW4l8aMGEunBWQTCoquge4siP6IiHgXAlgw7TIY3T3Ifc=;
Subject: Re: [PATCH v2 4/4] xen/arm: Prevent Dom0 to be loaded when using
 dom0less
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ebd93270-c8c3-7fb9-9abe-e40fdce8680a@xen.org>
Date: Fri, 9 Apr 2021 10:12:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408094818.8173-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 08/04/2021 10:48, Luca Fancellu wrote:
> This patch prevents the dom0 to be loaded skipping its
> building and going forward to build domUs when the dom0
> kernel is not found and at least one domU is present.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   docs/features/dom0less.pandoc |  7 +++---
>   xen/arch/arm/setup.c          | 42 ++++++++++++++++++++++++++++++++---
>   2 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
> index d798596cdf..a5eb5bcda0 100644
> --- a/docs/features/dom0less.pandoc
> +++ b/docs/features/dom0less.pandoc
> @@ -16,9 +16,10 @@ Multiboot specification has been extended to allow for multiple domains
>   to be passed to Xen. See docs/misc/arm/device-tree/booting.txt for more
>   information about the Multiboot specification and how to use it.
>   
> -Currently, a control domain ("dom0") is still required, but in the
> -future it will become unnecessary when all domains are created
> -directly from Xen. Instead of waiting for the control domain to be fully
> +Currently, a control domain ("dom0") is still required to manage the DomU
> +domains, but the system can start also without dom0 if the hypervisor

"hypervisor Device Tree" sounds a bit strange to me. I would either drop 
"hypervisor" or say "host Devicet Tree".

> +Device Tree doesn't specify it and it declares one or more domUs.

AFAICT, the first "it" refer to dom0 but it is not clear what exact 
property will used to do the decision.

Also you have two 'it' in a row that refers to two different entities. I 
would name it to avoid confusion.

> +Instead of waiting for the control domain (when declared) to be fully
>   booted and the Xen tools to become available, domains created by Xen
>   this way are started right away in parallel. Hence, their boot time is
>   typically much shorter.
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index b405f58996..ecc4f0ae98 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -793,6 +793,38 @@ static void __init setup_mm(void)
>   }
>   #endif
>   
> +static bool __init is_dom0less_mode(void)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +    bool dom0found = false;
> +    bool domUfound = false;
> +
> +    /* Look into the bootmodules */
> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        /* Find if dom0 and domU kernels are present */
> +        if ( mod->kind == BOOTMOD_KERNEL )
> +        {
> +            if ( mod->domU == false )
> +            {
> +                dom0found = true;
> +                break;
> +            }

NIT: You can directly return false here because if you have dom0 the it 
can't be dom0less.

> +            else
> +                domUfound = true;
> +        }
> +    }
> +
> +    /*
> +     * If there is no dom0 kernel but at least one domU, then we are in
> +     * dom0less mode
> +     */
> +    return ( !dom0found && domUfound );
> +}
> +
>   size_t __read_mostly dcache_line_bytes;
>   
>   /* C entry point for boot CPU */
> @@ -803,7 +835,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>       int cpus, i;
>       const char *cmdline;
>       struct bootmodule *xen_bootmodule;
> -    struct domain *dom0;
> +    struct domain *dom0 = NULL;
>       int rc;
>   
>       dcache_line_bytes = read_dcache_line_bytes();
> @@ -958,7 +990,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>       enable_errata_workarounds();
>   
>       /* Create initial domain 0. */
> -    dom0 = create_dom0();
> +    if ( !is_dom0less_mode() )
> +        dom0 = create_dom0();
> +    else
> +        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>   
>       heap_init_late();
>   
> @@ -976,7 +1011,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>       if ( acpi_disabled )
>           create_domUs();
>   
> -    domain_unpause_by_systemcontroller(dom0);
> +    if ( dom0 )
> +        domain_unpause_by_systemcontroller(dom0);
>   
>       /* Switch on to the dynamically allocated stack for the idle vcpu
>        * since the static one we're running on is about to be freed. */
> 

Cheers,

-- 
Julien Grall

