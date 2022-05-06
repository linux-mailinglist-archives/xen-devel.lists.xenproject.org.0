Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A188651DC11
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 17:29:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323332.544917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzt8-0006nU-Av; Fri, 06 May 2022 15:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323332.544917; Fri, 06 May 2022 15:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmzt8-0006kh-7W; Fri, 06 May 2022 15:29:02 +0000
Received: by outflank-mailman (input) for mailman id 323332;
 Fri, 06 May 2022 15:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlOn=VO=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1nmzt6-0006kb-Kj
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 15:29:00 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4016bbeb-cd51-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 17:28:59 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A73061F46AFF
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
X-Inumbo-ID: 4016bbeb-cd51-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1651850936;
	bh=36GvcdSB/pf30ZP9RtiH75vOy9s3MxY1/p1dsQRCX00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j4PWvQ+KBo4etBUy0FbW/p7HgcgQKy32GPpN6vjoThFzS1+RGmcEmteL2lFd/bVBT
	 AknDobZqw5O4tK0BEn0jni1jZ1Y8w81F2B2OWV3FF7FrvJT7Y7bQUJJnPaIFMtFHn0
	 reKyy4wB8Xbrn+puiesHuayZefx8p/F1dSlMuhF2rKVyTgZW8aR+4U0aGftdyXJz/m
	 3XXXthcoiK77QOv1j4fPfZKN7nj7ru6E9U9WMrpUGrEUEDI35YvC+Jqrddc9aKOX41
	 7IjiAmfXml1CMKMBOqZ8jj6SNKFVNBjY8WGAT41UAfMzpF3zkqjQi1yQ9WbfUjIX3x
	 36sMhgh0cdItw==
Message-ID: <296e6f6f-e96d-2db1-77b9-288dc47d1b98@collabora.com>
Date: Fri, 6 May 2022 18:28:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 04/20] kernel: Add combined power-off+restart handler
 call chain API
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-5-dmitry.osipenko@collabora.com>
 <CAJZ5v0gnTSoeNP+QXwrZ45FQY4howVkJMuCjM=j+_-2BngJdQg@mail.gmail.com>
 <990621e7-9f8a-8b4a-02ec-fd6c1e1f48ff@collabora.com>
 <CAJZ5v0jxXtwot0qpib4UG8Tz8Hd1dEbgo58tEdPFboU8xwKHNw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJZ5v0jxXtwot0qpib4UG8Tz8Hd1dEbgo58tEdPFboU8xwKHNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/20/22 21:47, Rafael J. Wysocki wrote:
>>>> +       spin_unlock(&platform_power_off_lock);
>>>> +
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       ret = register_power_off_handler(&priv->power_off_nb);
>>>> +       if (ret)
>>>> +               priv->platform_power_off_cb = NULL;
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(register_platform_power_off);
>>>> +
>>>> +/**
>>>> + *     unregister_platform_power_off - Unregister platform-level power-off callback
>>>> + *     @power_off: Power-off callback
>>>> + *
>>>> + *     Unregisters previously registered platform power-off callback.
>>>> + *
>>>> + *     Returns zero on success, or error code on failure.
>>>> + */
>>>> +int unregister_platform_power_off(void (*power_off)(void))
>>>> +{
>>>> +       struct sys_off_handler_private_data *priv;
>>>> +       int ret;
>>>> +
>>>> +       priv = sys_off_handler_private_data(&platform_power_off_handler);
>>>> +
>>>> +       if (priv->platform_power_off_cb != power_off)
>>>> +               return -EINVAL;
>>>> +
>>>> +       ret = unregister_power_off_handler(&priv->power_off_nb);
>>>> +       priv->platform_power_off_cb = NULL;
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(unregister_platform_power_off);
>>>> +
>>>> +/**
>>>> + *     do_kernel_power_off - Execute kernel power-off handler call chain
>>>> + *
>>>> + *     Calls functions registered with register_power_off_handler.
>>>> + *
>>>> + *     Expected to be called as last step of the power-off sequence.
>>>> + *
>>>> + *     Powers off the system immediately if a power-off handler function has
>>>> + *     been registered. Otherwise does nothing.
>>>> + */
>>>> +void do_kernel_power_off(void)
>>>> +{
>>>> +       /* legacy pm_power_off() is unchained and has highest priority */
>>>> +       if (pm_power_off && pm_power_off != dummy_pm_power_off)
>>>> +               return pm_power_off();
>>>> +
>>>> +       blocking_notifier_call_chain(&power_off_handler_list, POWEROFF_NORMAL,
>>>> +                                    NULL);
>>>> +}
>>>> +
>>>> +static void do_kernel_power_off_prepare(void)
>>>> +{
>>>> +       /* legacy pm_power_off_prepare() is unchained and has highest priority */
>>>> +       if (pm_power_off_prepare)
>>>> +               return pm_power_off_prepare();
>>>> +
>>>> +       blocking_notifier_call_chain(&power_off_handler_list, POWEROFF_PREPARE,
>>>> +                                    NULL);
>>>> +}
>>>> +
>>>>  /**
>>>>   *     kernel_power_off - power_off the system
>>>>   *
>>>> @@ -304,8 +893,7 @@ EXPORT_SYMBOL_GPL(kernel_halt);
>>>>  void kernel_power_off(void)
>>>>  {
>>>>         kernel_shutdown_prepare(SYSTEM_POWER_OFF);
>>>> -       if (pm_power_off_prepare)
>>>> -               pm_power_off_prepare();
>>>> +       do_kernel_power_off_prepare();
>>>>         migrate_to_reboot_cpu();
>>>>         syscore_shutdown();
>>>>         pr_emerg("Power down\n");
>>>> @@ -314,6 +902,16 @@ void kernel_power_off(void)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(kernel_power_off);
>>>>
>>>> +bool kernel_can_power_off(void)
>>>> +{
>>>> +       if (!pm_power_off &&
>>>> +           blocking_notifier_call_chain_is_empty(&power_off_handler_list))
>>>> +               return false;
>>>> +
>>>> +       return true;
>>> return pm_power_off ||
>>> blocking_notifier_call_chain_is_empty(&power_off_handler_list);
>> Thank you for the thorough review!
> You're very welcome!

Thanks again for taking a look at the patches. I don't have strong
preferences about the names and etc, so I'll update it all in v8 like
you suggested.

-- 
Best regards,
Dmitry

