Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627291EE884
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:25:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgsfm-0002d6-QT; Thu, 04 Jun 2020 16:24:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3HA=7R=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgsfl-0002cv-6d
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:24:53 +0000
X-Inumbo-ID: eb04e95a-a67f-11ea-81bc-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb04e95a-a67f-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 16:24:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A77DD2053B;
 Thu,  4 Jun 2020 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591287892;
 bh=ukrGrGORqvH+sAsyI0NWX88q0bFOxhvCuNQwV63W9H0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=HhwLA5H12LWCMIx96y7AwnnO86K2Mj+EpWmQFE7VfRAuhzgQAg6n7/ddvMnCigIEJ
 B1n5Sgn6kBepWwfRkHYgIpbF2hR4/f610TknkBdemf/u356wkjciEoOaTI5uFPHOtE
 Ncofv8zqKn+wo22LY5CwKZPE0x58zNIpQCacd3ao=
Date: Thu, 4 Jun 2020 09:24:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
In-Reply-To: <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
Message-ID: <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1824644307-1591287891=:6774"
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
Cc: cminyard@mvista.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, roman@zededa.com, tamas@tklengyel.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1824644307-1591287891=:6774
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Jun 2020, André Przywara wrote:
> On 04/06/2020 09:48, Julien Grall wrote:
> 
> Hi,
> 
> > On 03/06/2020 23:31, Stefano Stabellini wrote:
> >> Touching the watchdog is required to be able to reboot the board.
> > 
> > In general the preferred method is PSCI. Does it mean RPI 4 doesn't
> > support PSCI at all?
> 
> There is mainline Trusted Firmware (TF-A) support for the RPi4 for a few
> months now, which includes proper PSCI support (both for SMP bringup and
> system reset/shutdown). At least that should work, if not, it's a bug.
> An EDK-2 build for RPi4 bundles TF-A automatically, but you can use TF-A
> without it, with or without U-Boot: It works as a drop-in replacement
> for armstub.bin. Instruction for building it (one line!) are here:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/rpi4.rst
> 
> >>
> >> The implementation is based on
> >> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
> > 
> > Can you give the baseline? This would allow us to track an issue and
> > port them.
> 
> Given the above I don't think it's a good idea to add extra platform
> specific code to Xen.

The RPi4, at least the one I have, doesn't come with any TF, and it
doesn't come with PSCI in device tree. As a user, I would rather have
this patch (even downstream) than having to introduce TF in my build and
deployment just to be able to reboot.

Do other RPi4 users on this thread agree?


But fortunately this one of the few cases where we can have our cake and
eat it too :-)

If PSCI is supported on the RPi4, Xen automatically uses the PSCI reboot
method first. (We could even go one step further and check for PSCI
support in rpi4_reset below.) See
xen/arch/arm/shutdown.c:machine_restart:

    /* This is mainly for PSCI-0.2, which does not return if success. */
    call_psci_system_reset();

    /* Alternative reset procedure */
    while ( 1 )
    {
        platform_reset();
        mdelay(100);
    }


In other words, this patch won't take anything away from the good work
done in TF, and when/if available, Xen will use it.



> >>
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >> ---
> >>   xen/arch/arm/platforms/brcm-raspberry-pi.c | 60 ++++++++++++++++++++++
> >>   1 file changed, 60 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> >> b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> >> index f5ae58a7d5..0214ae2b3c 100644
> >> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> >> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> >> @@ -18,6 +18,10 @@
> >>    */
> >>     #include <asm/platform.h>
> >> +#include <xen/delay.h>
> >> +#include <xen/mm.h>
> >> +#include <xen/vmap.h>
> >> +#include <asm/io.h>
> > 
> > We are trying to keep the headers ordered alphabetically within each
> > directory and then 'xen/' first following by 'asm/'.
> > 
> >>     static const char *const rpi4_dt_compat[] __initconst =
> >>   {
> >> @@ -37,12 +41,68 @@ static const struct dt_device_match
> >> rpi4_blacklist_dev[] __initconst =
> >>        * The aux peripheral also shares a page with the aux UART.
> >>        */
> >>       DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
> >> +    /* Special device used for rebooting */
> >> +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
> >>       { /* sentinel */ },
> >>   };
> >>   +
> >> +#define PM_PASSWORD         0x5a000000
> >> +#define PM_RSTC             0x1c
> >> +#define PM_WDOG             0x24
> >> +#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
> >> +#define PM_RSTC_WRCFG_CLR           0xffffffcf
> > 
> > NIT: It is a bit odd you introduce the 5 define together but the first 3
> > have a different indentation compare to the last 2.
> > 
> >> +
> >> +static void __iomem *rpi4_map_watchdog(void)
> >> +{
> >> +    void __iomem *base;
> >> +    struct dt_device_node *node;
> >> +    paddr_t start, len;
> >> +    int ret;
> >> +
> >> +    node = dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
> >> +    if ( !node )
> >> +        return NULL;
> >> +
> >> +    ret = dt_device_get_address(node, 0, &start, &len);
> >> +    if ( ret )
> >> +    {
> >> +        dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
> > 
> > I would suggest to use printk() rather than dprintk. It would be useful
> > for a normal user to know that we didn't manage to reset the platform
> > and why.
> > 
> > 
> >> +        return NULL;
> >> +    }
> >> +
> >> +    base = ioremap_nocache(start & PAGE_MASK, PAGE_SIZE);
> >> +    if ( !base )
> >> +    {
> >> +        dprintk(XENLOG_ERR, "Unable to map watchdog register!\n");
> >> +        return NULL;
> >> +    }
> >> +
> >> +    return base;
> >> +}
> >> +
> >> +static void rpi4_reset(void)
> >> +{
> >> +    u32 val;
> > 
> > We are trying to get rid of any use of u32 in Xen code (the coding style
> > used in this file). Please use uint32_t instead.
> > 
> >> +    void __iomem *base = rpi4_map_watchdog();
> > 
> > Newline here please.
> > 
> >> +    if ( !base )
> >> +        return;
> >> +
> >> +    /* use a timeout of 10 ticks (~150us) */
> >> +    writel(10 | PM_PASSWORD, base + PM_WDOG);
> >> +    val = readl(base + PM_RSTC);
> >> +    val &= PM_RSTC_WRCFG_CLR;
> >> +    val |= PM_PASSWORD | PM_RSTC_WRCFG_FULL_RESET;
> >> +    writel(val, base + PM_RSTC);
> >> +
> >> +    /* No sleeping, possibly atomic. */
> >> +    mdelay(1);
> >> +}
> >> +
> >>   PLATFORM_START(rpi4, "Raspberry Pi 4")
> >>       .compatible     = rpi4_dt_compat,
> >>       .blacklist_dev  = rpi4_blacklist_dev,
> >> +    .reset = rpi4_reset,
> >>       .dma_bitsize    = 30,
> >>   PLATFORM_END
> >>  
> > 
> > Cheers,
> > 
> 
--8323329-1824644307-1591287891=:6774--

