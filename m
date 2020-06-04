Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBB1EE8B0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:38:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgssy-0003xU-Ty; Thu, 04 Jun 2020 16:38:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gChz=7R=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1jgssx-0003xN-Fu
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:38:31 +0000
X-Inumbo-ID: d2e530d0-a681-11ea-aec2-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d2e530d0-a681-11ea-aec2-12813bfff9fa;
 Thu, 04 Jun 2020 16:38:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FEA31FB;
 Thu,  4 Jun 2020 09:38:30 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 651183F6CF;
 Thu,  4 Jun 2020 09:38:29 -0700 (PDT)
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
 <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 xsFNBFNPCKMBEAC+6GVcuP9ri8r+gg2fHZDedOmFRZPtcrMMF2Cx6KrTUT0YEISsqPoJTKld
 tPfEG0KnRL9CWvftyHseWTnU2Gi7hKNwhRkC0oBL5Er2hhNpoi8x4VcsxQ6bHG5/dA7ctvL6
 kYvKAZw4X2Y3GTbAZIOLf+leNPiF9175S8pvqMPi0qu67RWZD5H/uT/TfLpvmmOlRzNiXMBm
 kGvewkBpL3R2clHquv7pB6KLoY3uvjFhZfEedqSqTwBVu/JVZZO7tvYCJPfyY5JG9+BjPmr+
 REe2gS6w/4DJ4D8oMWKoY3r6ZpHx3YS2hWZFUYiCYovPxfj5+bOr78sg3JleEd0OB0yYtzTT
 esiNlQpCo0oOevwHR+jUiaZevM4xCyt23L2G+euzdRsUZcK/M6qYf41Dy6Afqa+PxgMEiDto
 ITEH3Dv+zfzwdeqCuNU0VOGrQZs/vrKOUmU/QDlYL7G8OIg5Ekheq4N+Ay+3EYCROXkstQnf
 YYxRn5F1oeVeqoh1LgGH7YN9H9LeIajwBD8OgiZDVsmb67DdF6EQtklH0ycBcVodG1zTCfqM
 AavYMfhldNMBg4vaLh0cJ/3ZXZNIyDlV372GmxSJJiidxDm7E1PkgdfCnHk+pD8YeITmSNyb
 7qeU08Hqqh4ui8SSeUp7+yie9zBhJB5vVBJoO5D0MikZAODIDwARAQABzS1BbmRyZSBQcnp5
 d2FyYSAoQVJNKSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT7CwXsEEwECACUCGwMGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheABQJTWSV8AhkBAAoJEAL1yD+ydue63REP/1tPqTo/f6StS00g
 NTUpjgVqxgsPWYWwSLkgkaUZn2z9Edv86BLpqTY8OBQZ19EUwfNehcnvR+Olw+7wxNnatyxo
 D2FG0paTia1SjxaJ8Nx3e85jy6l7N2AQrTCFCtFN9lp8Pc0LVBpSbjmP+Peh5Mi7gtCBNkpz
 KShEaJE25a/+rnIrIXzJHrsbC2GwcssAF3bd03iU41J1gMTalB6HCtQUwgqSsbG8MsR/IwHW
 XruOnVp0GQRJwlw07e9T3PKTLj3LWsAPe0LHm5W1Q+euoCLsZfYwr7phQ19HAxSCu8hzp43u
 zSw0+sEQsO+9wz2nGDgQCGepCcJR1lygVn2zwRTQKbq7Hjs+IWZ0gN2nDajScuR1RsxTE4WR
 lj0+Ne6VrAmPiW6QqRhliDO+e82riI75ywSWrJb9TQw0+UkIQ2DlNr0u0TwCUTcQNN6aKnru
 ouVt3qoRlcD5MuRhLH+ttAcmNITMg7GQ6RQajWrSKuKFrt6iuDbjgO2cnaTrLbNBBKPTG4oF
 D6kX8Zea0KvVBagBsaC1CDTDQQMxYBPDBSlqYCb/b2x7KHTvTAHUBSsBRL6MKz8wwruDodTM
 4E4ToV9URl4aE/msBZ4GLTtEmUHBh4/AYwk6ACYByYKyx5r3PDG0iHnJ8bV0OeyQ9ujfgBBP
 B2t4oASNnIOeGEEcQ2rjzsFNBFNPCKMBEACm7Xqafb1Dp1nDl06aw/3O9ixWsGMv1Uhfd2B6
 it6wh1HDCn9HpekgouR2HLMvdd3Y//GG89irEasjzENZPsK82PS0bvkxxIHRFm0pikF4ljIb
 6tca2sxFr/H7CCtWYZjZzPgnOPtnagN0qVVyEM7L5f7KjGb1/o5EDkVR2SVSSjrlmNdTL2Rd
 zaPqrBoxuR/y/n856deWqS1ZssOpqwKhxT1IVlF6S47CjFJ3+fiHNjkljLfxzDyQXwXCNoZn
 BKcW9PvAMf6W1DGASoXtsMg4HHzZ5fW+vnjzvWiC4pXrcP7Ivfxx5pB+nGiOfOY+/VSUlW/9
 GdzPlOIc1bGyKc6tGREH5lErmeoJZ5k7E9cMJx+xzuDItvnZbf6RuH5fg3QsljQy8jLlr4S6
 8YwxlObySJ5K+suPRzZOG2+kq77RJVqAgZXp3Zdvdaov4a5J3H8pxzjj0yZ2JZlndM4X7Msr
 P5tfxy1WvV4Km6QeFAsjcF5gM+wWl+mf2qrlp3dRwniG1vkLsnQugQ4oNUrx0ahwOSm9p6kM
 CIiTITo+W7O9KEE9XCb4vV0ejmLlgdDV8ASVUekeTJkmRIBnz0fa4pa1vbtZoi6/LlIdAEEt
 PY6p3hgkLLtr2GRodOW/Y3vPRd9+rJHq/tLIfwc58ZhQKmRcgrhtlnuTGTmyUqGSiMNfpwAR
 AQABwsFfBBgBAgAJBQJTTwijAhsMAAoJEAL1yD+ydue64BgP/33QKczgAvSdj9XTC14wZCGE
 U8ygZwkkyNf021iNMj+o0dpLU48PIhHIMTXlM2aiiZlPWgKVlDRjlYuc9EZqGgbOOuR/pNYA
 JX9vaqszyE34JzXBL9DBKUuAui8z8GcxRcz49/xtzzP0kH3OQbBIqZWuMRxKEpRptRT0wzBL
 O31ygf4FRxs68jvPCuZjTGKELIo656/Hmk17cmjoBAJK7JHfqdGkDXk5tneeHCkB411p9WJU
 vMO2EqsHjobjuFm89hI0pSxlUoiTL0Nuk9Edemjw70W4anGNyaQtBq+qu1RdjUPBvoJec7y/
 EXJtoGxq9Y+tmm22xwApSiIOyMwUi9A1iLjQLmngLeUdsHyrEWTbEYHd2sAM2sqKoZRyBDSv
 ejRvZD6zwkY/9nRqXt02H1quVOP42xlkwOQU6gxm93o/bxd7S5tEA359Sli5gZRaucpNQkwd
 KLQdCvFdksD270r4jU/rwR2R/Ubi+txfy0dk2wGBjl1xpSf0Lbl/KMR5TQntELfLR4etizLq
 Xpd2byn96Ivi8C8u9zJruXTueHH8vt7gJ1oax3yKRGU5o2eipCRiKZ0s/T7fvkdq+8beg9ku
 fDO4SAgJMIl6H5awliCY2zQvLHysS/Wb8QuB09hmhLZ4AifdHyF1J5qeePEhgTA+BaUbiUZf
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <fb58e72b-2731-9d1b-5fb1-1fc14e3ef31f@arm.com>
Date: Thu, 4 Jun 2020 17:37:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: cminyard@mvista.com, tamas@tklengyel.com, Julien Grall <julien@xen.org>,
 roman@zededa.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04/06/2020 17:24, Stefano Stabellini wrote:
> On Thu, 4 Jun 2020, André Przywara wrote:
>> On 04/06/2020 09:48, Julien Grall wrote:
>>
>> Hi,
>>
>>> On 03/06/2020 23:31, Stefano Stabellini wrote:
>>>> Touching the watchdog is required to be able to reboot the board.
>>>
>>> In general the preferred method is PSCI. Does it mean RPI 4 doesn't
>>> support PSCI at all?
>>
>> There is mainline Trusted Firmware (TF-A) support for the RPi4 for a few
>> months now, which includes proper PSCI support (both for SMP bringup and
>> system reset/shutdown). At least that should work, if not, it's a bug.
>> An EDK-2 build for RPi4 bundles TF-A automatically, but you can use TF-A
>> without it, with or without U-Boot: It works as a drop-in replacement
>> for armstub.bin. Instruction for building it (one line!) are here:
>> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/rpi4.rst
>>
>>>>
>>>> The implementation is based on
>>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
>>>
>>> Can you give the baseline? This would allow us to track an issue and
>>> port them.
>>
>> Given the above I don't think it's a good idea to add extra platform
>> specific code to Xen.
> 
> The RPi4, at least the one I have, doesn't come with any TF, and it

My RPi4 didn't come with anything, actually ;-) It's just a matter of
what you put in the uSD card slot.

> doesn't come with PSCI in device tree.

TF-A patches the PSCI nodes in:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/plat/rpi/rpi4?id=f67fa69cb6937a7fc559bbec4a7acce5edefa888

> As a user, I would rather have
> this patch (even downstream) than having to introduce TF in my build and
> deployment just to be able to reboot.

I get your point, but would rather put more pressure on people using
TF-A. After all you run without CPU hotplug, A72 errata workarounds and
without Spectre/Meltdown fixes. What was the IP address of your board
again? ;-)

> 
> Do other RPi4 users on this thread agree?
> 
> 
> But fortunately this one of the few cases where we can have our cake and
> eat it too :-)
> 
> If PSCI is supported on the RPi4, Xen automatically uses the PSCI reboot
> method first. (We could even go one step further and check for PSCI
> support in rpi4_reset below.) See
> xen/arch/arm/shutdown.c:machine_restart:
> 
>     /* This is mainly for PSCI-0.2, which does not return if success. */
>     call_psci_system_reset();
> 
>     /* Alternative reset procedure */
>     while ( 1 )
>     {
>         platform_reset();
>         mdelay(100);
>     }
> 
> 
> In other words, this patch won't take anything away from the good work
> done in TF, and when/if available, Xen will use it.

Sure, it doesn't block anything. I won't be in your way, after all I
don't have much of a say anyway ;-)

But how do you actually run Xen on the board? I guess this involves
quite some hacks on the firmware side to get it running (bootloader?
EFI? grub? hack the DTB?). I wonder if adding bl31.bin is really your
biggest problem, then.

Cheers,
Andre

>>>>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>> ---
>>>>   xen/arch/arm/platforms/brcm-raspberry-pi.c | 60 ++++++++++++++++++++++
>>>>   1 file changed, 60 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c
>>>> b/xen/arch/arm/platforms/brcm-raspberry-pi.c
>>>> index f5ae58a7d5..0214ae2b3c 100644
>>>> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
>>>> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
>>>> @@ -18,6 +18,10 @@
>>>>    */
>>>>     #include <asm/platform.h>
>>>> +#include <xen/delay.h>
>>>> +#include <xen/mm.h>
>>>> +#include <xen/vmap.h>
>>>> +#include <asm/io.h>
>>>
>>> We are trying to keep the headers ordered alphabetically within each
>>> directory and then 'xen/' first following by 'asm/'.
>>>
>>>>     static const char *const rpi4_dt_compat[] __initconst =
>>>>   {
>>>> @@ -37,12 +41,68 @@ static const struct dt_device_match
>>>> rpi4_blacklist_dev[] __initconst =
>>>>        * The aux peripheral also shares a page with the aux UART.
>>>>        */
>>>>       DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
>>>> +    /* Special device used for rebooting */
>>>> +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
>>>>       { /* sentinel */ },
>>>>   };
>>>>   +
>>>> +#define PM_PASSWORD         0x5a000000
>>>> +#define PM_RSTC             0x1c
>>>> +#define PM_WDOG             0x24
>>>> +#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
>>>> +#define PM_RSTC_WRCFG_CLR           0xffffffcf
>>>
>>> NIT: It is a bit odd you introduce the 5 define together but the first 3
>>> have a different indentation compare to the last 2.
>>>
>>>> +
>>>> +static void __iomem *rpi4_map_watchdog(void)
>>>> +{
>>>> +    void __iomem *base;
>>>> +    struct dt_device_node *node;
>>>> +    paddr_t start, len;
>>>> +    int ret;
>>>> +
>>>> +    node = dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
>>>> +    if ( !node )
>>>> +        return NULL;
>>>> +
>>>> +    ret = dt_device_get_address(node, 0, &start, &len);
>>>> +    if ( ret )
>>>> +    {
>>>> +        dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
>>>
>>> I would suggest to use printk() rather than dprintk. It would be useful
>>> for a normal user to know that we didn't manage to reset the platform
>>> and why.
>>>
>>>
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    base = ioremap_nocache(start & PAGE_MASK, PAGE_SIZE);
>>>> +    if ( !base )
>>>> +    {
>>>> +        dprintk(XENLOG_ERR, "Unable to map watchdog register!\n");
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    return base;
>>>> +}
>>>> +
>>>> +static void rpi4_reset(void)
>>>> +{
>>>> +    u32 val;
>>>
>>> We are trying to get rid of any use of u32 in Xen code (the coding style
>>> used in this file). Please use uint32_t instead.
>>>
>>>> +    void __iomem *base = rpi4_map_watchdog();
>>>
>>> Newline here please.
>>>
>>>> +    if ( !base )
>>>> +        return;
>>>> +
>>>> +    /* use a timeout of 10 ticks (~150us) */
>>>> +    writel(10 | PM_PASSWORD, base + PM_WDOG);
>>>> +    val = readl(base + PM_RSTC);
>>>> +    val &= PM_RSTC_WRCFG_CLR;
>>>> +    val |= PM_PASSWORD | PM_RSTC_WRCFG_FULL_RESET;
>>>> +    writel(val, base + PM_RSTC);
>>>> +
>>>> +    /* No sleeping, possibly atomic. */
>>>> +    mdelay(1);
>>>> +}
>>>> +
>>>>   PLATFORM_START(rpi4, "Raspberry Pi 4")
>>>>       .compatible     = rpi4_dt_compat,
>>>>       .blacklist_dev  = rpi4_blacklist_dev,
>>>> +    .reset = rpi4_reset,
>>>>       .dma_bitsize    = 30,
>>>>   PLATFORM_END
>>>>  
>>>
>>> Cheers,
>>>


