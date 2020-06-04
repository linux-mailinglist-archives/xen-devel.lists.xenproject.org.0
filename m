Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648C1EE00E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 10:49:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jglYR-0006v3-Ce; Thu, 04 Jun 2020 08:48:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jglYP-0006uy-QZ
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 08:48:49 +0000
X-Inumbo-ID: 354a0c92-a640-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 354a0c92-a640-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iQIB/lvec4x/vrxGo08+YIUYpANYdEkGnyXNKnZaR3w=; b=rgjjwEc4SKcu8G1bbZOAHyjC/5
 ycMHFwNRrfH6pwHd3N/MoFcBx9cyFjv1CaufSXC0Z3PMAbnyPm6mOOVPypE+vvThIo9uXwMCjSgm0
 Hyoba0jK+bxjtrOwAHUOTOUNB2Xf8qWsHxVs5xwSaNahoQDCQpdN/Ml97+2aEATeSymk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jglYL-0007xf-Ry; Thu, 04 Jun 2020 08:48:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jglYL-0001Cv-Ki; Thu, 04 Jun 2020 08:48:45 +0000
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200603223156.12767-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
Date: Thu, 4 Jun 2020 09:48:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603223156.12767-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: cminyard@mvista.com, tamas@tklengyel.com,
 Andre Przywara <andre.przywara@arm.com>, roman@zededa.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+ Andre)

Hi,

On 03/06/2020 23:31, Stefano Stabellini wrote:
> Touching the watchdog is required to be able to reboot the board.

In general the preferred method is PSCI. Does it mean RPI 4 doesn't 
support PSCI at all?

> 
> The implementation is based on
> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.

Can you give the baseline? This would allow us to track an issue and 
port them.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/platforms/brcm-raspberry-pi.c | 60 ++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> index f5ae58a7d5..0214ae2b3c 100644
> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> @@ -18,6 +18,10 @@
>    */
>   
>   #include <asm/platform.h>
> +#include <xen/delay.h>
> +#include <xen/mm.h>
> +#include <xen/vmap.h>
> +#include <asm/io.h>

We are trying to keep the headers ordered alphabetically within each 
directory and then 'xen/' first following by 'asm/'.

>   
>   static const char *const rpi4_dt_compat[] __initconst =
>   {
> @@ -37,12 +41,68 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>        * The aux peripheral also shares a page with the aux UART.
>        */
>       DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
> +    /* Special device used for rebooting */
> +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
>       { /* sentinel */ },
>   };
>   
> +
> +#define PM_PASSWORD         0x5a000000
> +#define PM_RSTC             0x1c
> +#define PM_WDOG             0x24
> +#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
> +#define PM_RSTC_WRCFG_CLR           0xffffffcf

NIT: It is a bit odd you introduce the 5 define together but the first 3 
have a different indentation compare to the last 2.

> +
> +static void __iomem *rpi4_map_watchdog(void)
> +{
> +    void __iomem *base;
> +    struct dt_device_node *node;
> +    paddr_t start, len;
> +    int ret;
> +
> +    node = dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
> +    if ( !node )
> +        return NULL;
> +
> +    ret = dt_device_get_address(node, 0, &start, &len);
> +    if ( ret )
> +    {
> +        dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");

I would suggest to use printk() rather than dprintk. It would be useful 
for a normal user to know that we didn't manage to reset the platform 
and why.


> +        return NULL;
> +    }
> +
> +    base = ioremap_nocache(start & PAGE_MASK, PAGE_SIZE);
> +    if ( !base )
> +    {
> +        dprintk(XENLOG_ERR, "Unable to map watchdog register!\n");
> +        return NULL;
> +    }
> +
> +    return base;
> +}
> +
> +static void rpi4_reset(void)
> +{
> +    u32 val;

We are trying to get rid of any use of u32 in Xen code (the coding style 
used in this file). Please use uint32_t instead.

> +    void __iomem *base = rpi4_map_watchdog();

Newline here please.

> +    if ( !base )
> +        return;
> +
> +    /* use a timeout of 10 ticks (~150us) */
> +    writel(10 | PM_PASSWORD, base + PM_WDOG);
> +    val = readl(base + PM_RSTC);
> +    val &= PM_RSTC_WRCFG_CLR;
> +    val |= PM_PASSWORD | PM_RSTC_WRCFG_FULL_RESET;
> +    writel(val, base + PM_RSTC);
> +
> +    /* No sleeping, possibly atomic. */
> +    mdelay(1);
> +}
> +
>   PLATFORM_START(rpi4, "Raspberry Pi 4")
>       .compatible     = rpi4_dt_compat,
>       .blacklist_dev  = rpi4_blacklist_dev,
> +    .reset = rpi4_reset,
>       .dma_bitsize    = 30,
>   PLATFORM_END
>   
> 

Cheers,

-- 
Julien Grall

