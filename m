Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39685B3C06C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101810.1454735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mS-0006Hq-LL; Fri, 29 Aug 2025 16:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101810.1454735; Fri, 29 Aug 2025 16:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1mS-0006Fb-ID; Fri, 29 Aug 2025 16:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1101810;
 Fri, 29 Aug 2025 16:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OeP6=3J=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1us1mQ-0006FV-E8
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:16:46 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e96bbe3-84f3-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 18:16:45 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55f6507bd53so1870846e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 09:16:45 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336b95430b8sm4058341fa.13.2025.08.29.09.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 09:16:42 -0700 (PDT)
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
X-Inumbo-ID: 8e96bbe3-84f3-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756484205; x=1757089005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z54ks6koaBdMBZxbfT+23ZKmh12XRsqqTIqNVJkSEPA=;
        b=BcHc6NSZy+sshR5i9jntF9YroDbcQMt+354GsM6WEZp4egL+QFOxhTn2PYZyopRzRW
         EgJgjYXqfQHTVVdypcPLxBZd3oqzjQHu7E2iltmWElZEdDm1lDj3uLhVWrhldKIv7ZhQ
         /CmF/RczOdL/wW+OpmVgzmAQ4GB3Ew3se7+rtCrcAGqJ7PIIFn9a9Aqn3e+nG3BC+Nbi
         QjF6ajbI0urE5UEGn+kIEc2Sp8LwaQsAXeF4FuOPoNouL4+vwUSzdfPcRXMts6nEekgl
         qErroqXh3qoAZ/0nxM1erJUwyaCV5cM1qd7C568GGvy8S2ouIriJ5T0YV4q2YN0bAy/1
         sTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756484205; x=1757089005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z54ks6koaBdMBZxbfT+23ZKmh12XRsqqTIqNVJkSEPA=;
        b=KkU/zvajrt67IVDiLnWAgSNiBmui2awCpc0HVvYmOJPiTSIfvA7/k4t3wEbmhgooIV
         0W9OZVWyS3+5ihknQ7TpOnY5GrPnygr6ikmvWOlVVcBacaG+ZnvV1vkIiLjxccD8ssiL
         gXL06LoXJYf1dtKsgAso5wwiHi2f8dmd1TuR6TMEDxwTR4m1QdWRIZOns1MPA72KwpTs
         Gay+Ra37dNOHpK3Z0aeio4hsnvRPlky+6QS2knGEAfoxKLdqYWOcTiCfZtm2fayfLBmO
         GSLt9Dv/mTfHAQoBaHhumV0KWdyeOjOH5UNrrBeICQiI5OZnpQYv7lxTYuAcVW//19ZR
         Afgw==
X-Forwarded-Encrypted: i=1; AJvYcCX/0iwrt49L+2ppweNmAPTXiZ30nfvTtvXtt7riRfcwSaV4qZP4Hb+mhIi1wLCkaRA59PpUa9sShiw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywcg1Xgy8zeqUwhV5/BBzVqkUhl9qHtzXgFxy/ZU086MD7vLSfo
	aMTtU4XDhKxYs6mL45Q235ntTIl4+Bmx8qSM/x5sxKR7hU2CVQluiD4t
X-Gm-Gg: ASbGncskoTVdXer054P9A3usO0xEw4+Fl5hBE4jOOW7NCPjTqJ7XDArW780Mq8maDpw
	xfc3fTgIRGZoXrk9s+aLA9zxacNLUmPLLteKFFTeekuwek1OyONVc1KN4CZtEsc1HhDiMfRm1rb
	M2G/h35ljAutkQEAAK6d8FX2/cPpB/uHCAMN9ftWL+N7fC4LR+3IRuC5nSwO4rR6xJd5R3naZY+
	jxzKg3toI8/S2p1hznRz4NcoEXoHjfYTNAIoqLeVILpIbTHXhVovTQFVGZ1dSsvRmuuRgi3D1Lt
	3A1CU6A7i38qRH+8XTxPzdfX75jbYwIcKBlrs08QhpV9yc42s11dlLgHkyPxOSWDZC/rN1TFuTD
	1XRWpgUOxZQMAls66tjyZ/w5TYQ==
X-Google-Smtp-Source: AGHT+IHFMthIQu56FmJTPAjG1v7yHuBILZd/+bp5p7VeDQuEBiXuR91CjcWjr1NtMihiz2nbPfn9Ww==
X-Received: by 2002:a05:651c:1541:b0:336:96cc:ac0 with SMTP id 38308e7fff4ca-33696cc10c0mr21902341fa.43.1756484204278;
        Fri, 29 Aug 2025 09:16:44 -0700 (PDT)
Message-ID: <632637dc-99c0-42f2-a16c-dc9502a1ee2c@gmail.com>
Date: Fri, 29 Aug 2025 19:16:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] xen/arm: scmi-smc: passthrough SCMI SMC to domain,
 single agent
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <02b79eaa0a611fb43a2146a5f41aec435d3db6c7.1756399156.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.08.25 19:40, Oleksii Moisieiev wrote:

Hello Oleksii

the patch lgtm, just some comments

> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
> handling layer") introduces simple driver which forwards SCMI over SMC
> calls from hwdom/dom0 to EL3 firmware (TF-A) with a single SCMI OSPM agent
> support. While it is working gracefully for hwdom/dom0 use case it doesn't
> cover "thin Dom0 with guest domain, which serves as Driver domain"
> use-case. In this case HW need to be enable in Driver domain and dom0 is
> performing only control functions.
> 
> The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is
> pretty generic case for the default vendors SDK and new platforms.
> 
> This patch enables passthrough of SCMI SMC single agent interface to the
> one guest domain serving as Driver domain.
> 
> Configure Dom0 to enable SCMI passthrough:
> 
>   - dom0: add scmi-smc-passthrough to the Xen Command Line
> 
> Enabled SCMI passthrough for guest using toolstack in the following way:
> 
>   - domD: xl.cfg add "arm_sci" option as below
> 
>     arm_sci = "type=scmi_smc"
> 
>   - domD: xl.cfg enable access to the "arm,scmi-shmem"
> 
> iomem = [
>      "47ff0,1@22001",
> ]
> 
>   - domD: add SCMI nodes to the Driver domain partial device tree as in the
>   below example:
> 
> passthrough {
>     scmi_shm_0: sram@22001000 {
>         compatible = "arm,scmi-shmem";
>         reg = <0x0 0x22001000 0x0 0x1000>;
>     };
> 
>     firmware {
>          compatible = "simple-bus";
>              scmi: scmi {
>                  compatible = "arm,scmi-smc";
>                  shmem = <&scmi_shm_0>;
>                  ...
>              }
>      }
> }
> 
> dom0less case configuration:
> 
> - add "xen,sci_type" property for required DomU ("xen,domain") node
> 
>     xen,sci_type="scmi_smc"
> 
> - add scmi nodes to the Driver domain partial device tree the same way
> as above and enable access to the "arm,scmi-shmem" according to
> dom0less documentation. For example:
> 
>    scmi_shm_0: sram@22001000 {
>          compatible = "arm,scmi-shmem";
>          reg = <0x00 0x22001000 0x00 0x1000>;
> ->        xen,reg = <0x0 0x47ff0000 0x0 0x1000 0x0 0x22001000>;
> ->        xen,force-assign-without-iommu;
>    };
> 
> The SCMI SMC single agent interface can be enabled for one and only one
> domain. In general, the configuration is similar to any other HW
> passthrough, except explicitly enabling SCMI with "arm_sci" xl.cfg option.
> 
> Note that "arm,scmi-smc" and "arm,scmi-shmem" nodes will be removed from
> dom0/hwdom DT in case of

?

> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Acked-by: Anthony PERARD <anthony.perard@vates.tech> # tools
> ---
> 
> Changes in v6:
> - added generated helpers and types go files
> - rename cmdline parameter to scmi-smc-passthrough
> - fix goto tag in parse_arm_sci_config
> 
> Changes in v5:
> - rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
> 
> Changes in v4:
> - xl.cfg doc
> - fix comments from Stefano Stabellini
> - fix toolstack code as sugested by Anthony PERARD
>    - use MATCH_OPTION()
>    - move arm_sci struct and cfg params in "arch_arm"
> - add SCMI passthrough for dom0less case
> 
>   docs/man/xl.cfg.5.pod.in              |  34 ++++++++
>   docs/misc/arm/device-tree/booting.txt |  15 ++++
>   docs/misc/xen-command-line.pandoc     |   9 +++
>   tools/golang/xenlight/helpers.gen.go  |  41 ++++++++++
>   tools/golang/xenlight/types.gen.go    |  12 +++
>   tools/include/libxl.h                 |   5 ++
>   tools/libs/light/libxl_arm.c          |  14 ++++
>   tools/libs/light/libxl_types.idl      |  10 +++
>   tools/xl/xl_parse.c                   |  36 +++++++++
>   xen/arch/arm/dom0less-build.c         |  34 +++++++-
>   xen/arch/arm/firmware/Kconfig         |   4 +-
>   xen/arch/arm/firmware/scmi-smc.c      | 112 +++++++++++++++++++++++++-
>   12 files changed, 321 insertions(+), 5 deletions(-)
> 

[snip]

> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 0094cf9e40..7422f4be30 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -279,6 +279,36 @@ int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
>       return sci_assign_dt_device(kinfo->bd.d, node);
>   }
>   
> +int __init domu_dt_sci_parse(struct dt_device_node *node,
> +                             struct xen_domctl_createdomain *d_cfg)
> +{
> +    const char *sci_type = NULL;

NIT: I think "= NULL" can be omitted.

> +    int ret;
> +
> +    d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
> +
> +    if ( !IS_ENABLED(CONFIG_ARM_SCI) ||
> +         !dt_property_read_bool(node, "xen,sci_type") )
> +        return 0;
> +
> +    ret = dt_property_read_string(node, "xen,sci_type", &sci_type);
> +    if ( ret )
> +        return ret;
> +
> +    if ( !strcmp(sci_type, "none") )
> +        d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
> +    else if ( !strcmp(sci_type, "scmi_smc") )
> +        d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
> +    else
> +    {
> +        printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n",
> +               sci_type, dt_node_name(node));
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
>   int __init arch_parse_dom0less_node(struct dt_device_node *node,
>                                       struct boot_domain *bd)
>   {
> @@ -288,7 +318,9 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>   
>       d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>       d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
> -    d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
> +
> +    if ( domu_dt_sci_parse(node, d_cfg) )
> +        panic("Error getting SCI configuration\n");
>   
>       if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>       {
> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> index bbf88fbb9a..5c5f0880c4 100644
> --- a/xen/arch/arm/firmware/Kconfig
> +++ b/xen/arch/arm/firmware/Kconfig
> @@ -25,7 +25,9 @@ config SCMI_SMC
>   	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>   	  compatible only). The value of "arm,smc-id" DT property from SCMI
>   	  firmware node is used to trap and forward corresponding SCMI SMCs
> -	  to firmware running at EL3, for calls coming from the hardware domain.
> +	  to firmware running at EL3, for calls coming from the hardware domain or
> +	  driver domain.
> +	  Use with EL3 firmware which supports only single SCMI OSPM agent.
>   
>   endchoice
>   
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> index 13d1137592..edc54b11b6 100644
> --- a/xen/arch/arm/firmware/scmi-smc.c
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> @@ -14,6 +14,8 @@
>   #include <xen/device_tree.h>
>   #include <xen/errno.h>
>   #include <xen/init.h>
> +#include <xen/iocap.h>
> +#include <xen/param.h>
>   #include <xen/sched.h>
>   #include <xen/types.h>
>   
> @@ -22,7 +24,11 @@
>   
>   #define SCMI_SMC_ID_PROP   "arm,smc-id"
>   
> +static bool __ro_after_init opt_scmi_smc_passthrough = false;

NIT: I think "= false" can be omitted.


> +boolean_param("scmi-smc-passthrough", opt_scmi_smc_passthrough);
> +
>   static uint32_t __ro_after_init scmi_smc_id;
> +static struct domain __read_mostly *scmi_dom;
>   
>   /*
>    * Check if provided SMC Function Identifier matches the one known by the SCMI
> @@ -50,7 +56,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
>           return false;
>   
>       /* Only the hardware domain should use SCMI calls */
> -    if ( !is_hardware_domain(current->domain) )
> +    if ( scmi_dom != current->domain )
>       {
>           gdprintk(XENLOG_WARNING, "SCMI: Unprivileged access attempt\n");
>           return false;
> @@ -75,12 +81,45 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
>       return true;
>   }
>   
> +static int
> +scmi_smc_domain_sanitise_config(struct xen_domctl_createdomain *config)
> +{
> +    if ( config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
> +         config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC )
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +
>   static int scmi_smc_domain_init(struct domain *d,
>                                   struct xen_domctl_createdomain *config)
>   {
> -    if ( !is_hardware_domain(d) )
> +    /*
> +     * scmi_passthrough is not enabled:
> +     * - proceed only for hw_domain
> +     * - fail if guest domain has SCMI enabled.
> +     */
> +    if ( !opt_scmi_smc_passthrough && !is_hardware_domain(d) )
> +    {
> +        if ( config->arch.arm_sci_type == XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC )
> +            return -EINVAL;
> +        else
> +            return 0;
> +    }
> +    /*
> +     * scmi_passthrough is enabled:
> +     * - ignore hw_domain
> +     * - proceed only for domain with SCMI enabled.
> +     */
> +    if ( opt_scmi_smc_passthrough &&
> +         (config->arch.arm_sci_type == XEN_DOMCTL_CONFIG_ARM_SCI_NONE ||
> +          is_hardware_domain(d)) )
>           return 0;
>   
> +    if ( scmi_dom )
> +        return -EEXIST;
> +
> +    scmi_dom = d;
>       d->arch.sci_enabled = true;
>       printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
>       return 0;
> @@ -88,12 +127,77 @@ static int scmi_smc_domain_init(struct domain *d,
>   
>   static void scmi_smc_domain_destroy(struct domain *d)
>   {
> -    if ( !is_hardware_domain(d) )
> +    if ( scmi_dom && scmi_dom != d )
>           return;
>   
> +    scmi_dom = NULL;
> +    d->arch.sci_enabled = false;
>       printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
>   }
>   
> +/*
> + * Handle Dom0 SCMI SMC specific DT nodes
> + *
> + * if scmi_smc_passthrough=false:
> + * - Copy SCMI nodes into Dom0 device tree.
> + * if scmi_smc_passthrough=true:
> + * - skip SCMI nodes from Dom0 DT
> + * - give dom0 control access to SCMI shmem MMIO, so SCMI can be passed
> + *   through to guest.
> + */
> +static bool scmi_smc_dt_handle_node(struct domain *d,
> +                                    struct dt_device_node *node)
> +{
> +    static const struct dt_device_match shmem_matches[] __initconst = {
> +        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
> +        { /* sentinel */ },
> +    };
> +    static const struct dt_device_match scmi_matches[] __initconst = {
> +        DT_MATCH_PATH("/firmware/scmi"),
> +        { /* sentinel */ },
> +    };
> +
> +    /* skip scmi shmem node for dom0 if scmi not enabled */
> +    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
> +    {
> +        dt_dprintk("Skip scmi shmem node\n");
> +        return true;
> +    }
> +
> +    /*
> +     * skip scmi node for dom0 if scmi not enabled, but give dom0 control
> +     * access to SCMI shmem
> +     */
> +    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
> +    {
> +        struct dt_device_node *shmem_node;
> +        const __be32 *prop;
> +        u64 paddr, size;

NIT: uint64_t please for the new code

> +        int ret;
> +
> +        /* give dom0 control access to SCMI shmem */
> +        prop = dt_get_property(node, "shmem", NULL);
> +        if ( !prop )
> +            return true;
> +
> +        shmem_node = dt_find_node_by_phandle(be32_to_cpu(*prop));
> +        if ( !shmem_node )
> +            return true;
> +
> +        ret = dt_device_get_address(shmem_node, 0, &paddr, &size);
> +        if ( ret )
> +            return true;
> +
> +        ret = iomem_permit_access(d, paddr_to_pfn(paddr),
> +                                  paddr_to_pfn(paddr + size - 1));

Shouldn't we at least warn if the access to SCMI shmem is not permitted 
for Dom0? Or this is not going to be an issue at all?


> +
> +        dt_dprintk("Skip scmi node\n");
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>   static int __init scmi_check_smccc_ver(void)
>   {
>       if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
> @@ -108,8 +212,10 @@ static int __init scmi_check_smccc_ver(void)
>   
>   static const struct sci_mediator_ops scmi_smc_ops = {
>       .handle_call = scmi_handle_smc,
> +    .domain_sanitise_config = scmi_smc_domain_sanitise_config,
>       .domain_init = scmi_smc_domain_init,
>       .domain_destroy = scmi_smc_domain_destroy,
> +    .dom0_dt_handle_node = scmi_smc_dt_handle_node,
>   };
>   
>   /* Initialize the SCMI layer based on SMCs and Device-tree */


