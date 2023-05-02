Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93CC6F4DEC
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528927.822707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzqi-0001Oe-1X; Tue, 02 May 2023 23:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528927.822707; Tue, 02 May 2023 23:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzqh-0001MD-Uw; Tue, 02 May 2023 23:55:59 +0000
Received: by outflank-mailman (input) for mailman id 528927;
 Tue, 02 May 2023 23:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PvCK=AX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ptzqg-0001M7-UZ
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:55:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfb62e28-e944-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:55:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 464DE6133A;
 Tue,  2 May 2023 23:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E40C433D2;
 Tue,  2 May 2023 23:55:51 +0000 (UTC)
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
X-Inumbo-ID: dfb62e28-e944-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683071752;
	bh=21q8w7ad/mG6Dz+Zc8o3O6b5fBKnpcih2EQHedK29+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T0y+SeALxGjv7qjOAHnrqgrZT6aZedSmotuF2IoKNPZ8uxf8OkvphYb0qZIo6MFE+
	 1NAsx6pVeLibpHQ8TZM/tEvGzTtr5CUajFlDBi+UNyKdtt+I6LYtlbGIe/ztos7pQ6
	 boF1nDodstjmLzeBx6dDvgyLxCJH0vJglPyMc/gvHZCeG0cN4gpxlBcBU2StAgY7Dm
	 8dczSL+C5RmIjH2vG/xX1YKaInsCFLpDqgPPIanh2DOP3D3IsoyO1PeP8PMdUTEVEu
	 WDfd7vSPHOZovoZEwt8vKQgafg1f5wvQhWSvG5mv+YfA9zN+nFzsqmKQy3kSi6wC4a
	 nAfVh5kPvrM0Q==
Date: Tue, 2 May 2023 16:55:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based
 systems
In-Reply-To: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2305021643010.974517@ubuntu-linux-20-04-desktop>
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 May 2023, Ayan Kumar Halder wrote:
> On some of the Arm32 based systems (eg Cortex-R52), smpboot is supported.
> In these systems PSCI may not always be supported. In case of Cortex-R52, there
> is no EL3 or secure mode. Thus, PSCI is not supported as it requires EL3.
> 
> Thus, we use 'spin-table' mechanism to boot the secondary cpus. The primary
> cpu provides the startup address of the secondary cores. This address is
> provided using the 'cpu-release-addr' property.
> 
> To support smpboot, we have copied the code from xen/arch/arm/arm64/smpboot.c
> with the following changes :-
> 
> 1. 'enable-method' is an optional property. Refer to the comment in
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml
> "      # On ARM 32-bit systems this property is optional"
> 
> 2. psci is not currently supported as a value for 'enable-method'.
> 
> 3. update_identity_mapping() is not invoked as we are not sure if it is
> required.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> The dts snippet with which this has been validated is :-
> 
>     cpus {
>         #address-cells = <0x02>;
>         #size-cells = <0x00>;
> 
>         cpu-map {
> 
>             cluster0 {
> 
>                 core0 {
> 
>                     thread0 {
>                         cpu = <0x02>;
>                     };
>                 };
>                 core1 {
> 
>                     thread0 {
>                         cpu = <0x03>;
>                     };
>                 };
>             };
>         };
> 
>         cpu@0 {
>             device_type = "cpu";
>             compatible = "arm,armv8";
>             reg = <0x00 0x00>;
>             phandle = <0x02>;
>         };
> 
>         cpu@1 {
>             device_type = "cpu";
>             compatible = "arm,armv8";
>             reg = <0x00 0x01>;
>             enable-method = "spin-table";
>             cpu-release-addr = <0xEB58C010>;
>             phandle = <0x03>;
>         };
>     };
> 
> Although currently I have tested this on Cortex-R52, I feel this may be helpful
> to enable smp on other Arm32 based systems as well. Happy to hear opinions.

I think you are right


>  xen/arch/arm/arm32/smpboot.c | 84 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/smpboot.c b/xen/arch/arm/arm32/smpboot.c
> index 518e9f9c7e..feb249d3f8 100644
> --- a/xen/arch/arm/arm32/smpboot.c
> +++ b/xen/arch/arm/arm32/smpboot.c
> @@ -1,24 +1,100 @@
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
>  #include <xen/smp.h>
> +#include <xen/vmap.h>
> +#include <asm/io.h>
>  #include <asm/platform.h>
>  
> +struct smp_enable_ops {
> +        int             (*prepare_cpu)(int);
> +};

coding style


> +static uint32_t cpu_release_addr[NR_CPUS];
> +static struct smp_enable_ops smp_enable_ops[NR_CPUS];

they could be __initdata


>  int __init arch_smp_init(void)
>  {
>      return platform_smp_init();
>  }
>  
> -int __init arch_cpu_init(int cpu, struct dt_device_node *dn)
> +static int __init smp_spin_table_cpu_up(int cpu)
> +{
> +    uint32_t __iomem *release;
> +
> +    if (!cpu_release_addr[cpu])

code style


> +    {
> +        printk("CPU%d: No release addr\n", cpu);
> +        return -ENODEV;
> +    }
> +
> +    release = ioremap_nocache(cpu_release_addr[cpu], 4);
> +    if ( !release )
> +    {
> +        dprintk(XENLOG_ERR, "CPU%d: Unable to map release address\n", cpu);
> +        return -EFAULT;
> +    }
> +
> +    writel(__pa(init_secondary), release);
> +
> +    iounmap(release);

I think we need a wmb() ?


> +    sev();
> +
> +    return 0;
> +}
> +
> +static void __init smp_spin_table_init(int cpu, struct dt_device_node *dn)
>  {
> -    /* Not needed on ARM32, as there is no relevant information in
> -     * the CPU device tree node for ARMv7 CPUs.
> +    if ( !dt_property_read_u32(dn, "cpu-release-addr", &cpu_release_addr[cpu]) )

It looks like cpu-release-addr could be u64 or u32. Can we detect the
size of the property and act accordingly? If the address is u64 and
above 4GB it is fine to abort.


> +    {
> +        printk("CPU%d has no cpu-release-addr\n", cpu);
> +        return;
> +    }
> +
> +    smp_enable_ops[cpu].prepare_cpu = smp_spin_table_cpu_up;
> +}
> +
> +static int __init dt_arch_cpu_init(int cpu, struct dt_device_node *dn)
> +{
> +    const char *enable_method;
> +
> +    /*
> +     * Refer Documentation/devicetree/bindings/arm/cpus.yaml, it says on
> +     * ARM 32-bit systems this property is optional.
>       */
> +    enable_method = dt_get_property(dn, "enable-method", NULL);
> +    if (!enable_method)

coding style


> +    {
> +        return 0;
> +    }
> +
> +    if ( !strcmp(enable_method, "spin-table") )
> +        smp_spin_table_init(cpu, dn);
> +    else
> +    {
> +        printk("CPU%d has unknown enable method \"%s\"\n", cpu, enable_method);
> +        return -EINVAL;
> +    }
> +
>      return 0;
>  }
>  
> +int __init arch_cpu_init(int cpu, struct dt_device_node *dn)
> +{
> +    return dt_arch_cpu_init(cpu, dn);
> +}
> +
>  int arch_cpu_up(int cpu)
>  {
> -    return platform_cpu_up(cpu);
> +    int ret = 0;
> +
> +    if ( smp_enable_ops[cpu].prepare_cpu )
> +        ret = smp_enable_ops[cpu].prepare_cpu(cpu);
> +
> +    if ( !ret )
> +        return platform_cpu_up(cpu);

I think this should be:

    if ( smp_enable_ops[cpu].prepare_cpu )
        ret = smp_enable_ops[cpu].prepare_cpu(cpu);
    else
        ret = platform_cpu_up(cpu);




> +    return ret;
>  }
>  
>  void arch_cpu_up_finish(void)
> -- 
> 2.17.1
> 
> 

