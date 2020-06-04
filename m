Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF091ED9E6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 02:16:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgdY7-0000WR-Ir; Thu, 04 Jun 2020 00:15:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cgp2=7R=mvista.com=cminyard@srs-us1.protection.inumbo.net>)
 id 1jgdY6-0000WM-MF
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 00:15:58 +0000
X-Inumbo-ID: 8ebf0d10-a5f8-11ea-81bc-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ebf0d10-a5f8-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 00:15:55 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id p70so3491538oic.12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 17:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xNaE8BU6OnVudV+0jcBlA9EVCk9/AsZCS2vA0geAa4Y=;
 b=lM8tc5nSF85XXZ9shJIIrnNTmYah9p+3ij5LyA6KzyiD0gWSLGfvrwnj5FTO6evu6Q
 BJ81o89iBaf7Nn9wlv/Tr+yTgQATCKixCpBBOhRaE6598wn0xV2i5HVbnBBPH1+nXVyn
 f1rtOKqf3yGjvc8NrJTtNGFvfO65+kznCRn3tOjhkOdTpAITJWt9MiaJb46eHEH8nXtx
 twU6oh8+U+nzAs0/R5BkrEIiUDR/tf72gngriLoov7CZgYE9IE7W8cuu9tALG2ypa4OG
 5U5LL8K+A9xj/Q1EGUNbtleFSZivu5UULISfyVB0CG3+4BDWkFwolGC2pHtAKjKXKk2m
 Iicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xNaE8BU6OnVudV+0jcBlA9EVCk9/AsZCS2vA0geAa4Y=;
 b=pMMVcZ5sknOy8mtO6WDwJnJBhCkYndEMp9okzqrYa9TuNO6KL7hhJql4N22eJ0OOJu
 B8kMHvm9FDg+lArv0VQOi1p+fwRoh3LMurDIC+bubut4sJSOzGTusStu7dqQCof/oCnY
 9BXeMPnlTtz7KmMPaB3VXZYlWHpCrZ+z/ZPzh5Z9D+mPoDfhzWkeAGcF2T9byVYBzUAr
 vtJDG/0FPGPmXiu6oGX6T3Hp3HY2JGR8xLw1JJ6oJ/PBybH0by3qcS12y9UyEKyoW+ue
 KofjfFcN66Sa7JpSMlojJWxBosWyhylDnn43K+xkz7nz40QjYZudhXRtnJWC3iff7IZk
 vWjg==
X-Gm-Message-State: AOAM530m6jFyZ7z/HXAG8+gd1GqUrD/SCrGFwKmfnib50s3C8OevwrpP
 mds7cmZgmIMz5EPvVNR1B7sqOA==
X-Google-Smtp-Source: ABdhPJwAzowLe8zoLzVaeSS1eYVvpg4W92K/C0JBzgt54bnfnjfO1APESwKUIcCaGqEKmrnTsWjwdQ==
X-Received: by 2002:aca:4f4a:: with SMTP id d71mr1421012oib.123.1591229754912; 
 Wed, 03 Jun 2020 17:15:54 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:9d35:f7bd:647:6545])
 by smtp.gmail.com with ESMTPSA id g10sm840201otn.34.2020.06.03.17.15.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jun 2020 17:15:54 -0700 (PDT)
Date: Wed, 3 Jun 2020 19:15:52 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
Message-ID: <20200604001552.GC2903@minyard.net>
References: <20200603223156.12767-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603223156.12767-1-sstabellini@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: cminyard@mvista.com
Cc: xen-devel@lists.xenproject.org, roman@zededa.com, julien@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, tamas@tklengyel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 03:31:56PM -0700, Stefano Stabellini wrote:
> Touching the watchdog is required to be able to reboot the board.
> 
> The implementation is based on
> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.

Ah, I was looking at this just today, as it had been annoying me
greatly.  This works for me, so:

Tested-by: Corey Minyard <cminyard@mvista.com>

However, I was wondering if it might be better to handle this by failing
the operation in xen and passing it back to dom0 to do.  On the Pi you
send a firmware message to reboot, and that seems like too much to do in
Xen, but it would seem possible to send this back to dom0.  Just a
thought, as it might be a more general fix for other devices in the same
situation.

Thanks,

-corey

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>  xen/arch/arm/platforms/brcm-raspberry-pi.c | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> index f5ae58a7d5..0214ae2b3c 100644
> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> @@ -18,6 +18,10 @@
>   */
>  
>  #include <asm/platform.h>
> +#include <xen/delay.h>
> +#include <xen/mm.h>
> +#include <xen/vmap.h>
> +#include <asm/io.h>
>  
>  static const char *const rpi4_dt_compat[] __initconst =
>  {
> @@ -37,12 +41,68 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>       * The aux peripheral also shares a page with the aux UART.
>       */
>      DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
> +    /* Special device used for rebooting */
> +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
>      { /* sentinel */ },
>  };
>  
> +
> +#define PM_PASSWORD         0x5a000000
> +#define PM_RSTC             0x1c
> +#define PM_WDOG             0x24
> +#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
> +#define PM_RSTC_WRCFG_CLR           0xffffffcf
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
> +    void __iomem *base = rpi4_map_watchdog();
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
>  PLATFORM_START(rpi4, "Raspberry Pi 4")
>      .compatible     = rpi4_dt_compat,
>      .blacklist_dev  = rpi4_blacklist_dev,
> +    .reset = rpi4_reset,
>      .dma_bitsize    = 30,
>  PLATFORM_END
>  
> -- 
> 2.17.1
> 

