Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31144749A
	for <lists+xen-devel@lfdr.de>; Sun,  7 Nov 2021 18:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222857.385257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjm2W-0007dX-OL; Sun, 07 Nov 2021 17:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222857.385257; Sun, 07 Nov 2021 17:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjm2W-0007ac-Ke; Sun, 07 Nov 2021 17:33:08 +0000
Received: by outflank-mailman (input) for mailman id 222857;
 Sun, 07 Nov 2021 17:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXOO=P2=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1mjm2V-0007aW-2U
 for xen-devel@lists.xenproject.org; Sun, 07 Nov 2021 17:33:07 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c32ab10d-3ff0-11ec-9787-a32c541c8605;
 Sun, 07 Nov 2021 18:33:05 +0100 (CET)
Received: by mail-oi1-x230.google.com with SMTP id bk14so1028934oib.7
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 09:33:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c18sm4840649otr.32.2021.11.07.09.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:33:03 -0800 (PST)
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
X-Inumbo-ID: c32ab10d-3ff0-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tMVMvSELY54S0UdLfdOcY9hXGDCgRpBmnCTKjFa8UlE=;
        b=QIfw+m72ItgaApqkAoLUYKEHkpy+eMpUCLymo2SVE2e06bxlhsvsGBIpx80FAFL6zX
         lQmhx5vWsnqdO5AzfRwzYmC9JyeI+x703tpvfwQKurLg2VtZOzsNtJVqgO0A8u3N2B9I
         BYJElUmFFKGlmNuNH1pVTHbG46IPWj2FGkpJks4IWHqhA3hkwgU7q4GC5oDjmilXskFD
         oTKdooszpWu854bZrRMH7UW0QrvSFFnK9cGOfGPg2b3g5hqd+nvAec6GccpfULS1MyoN
         kwidN5WRwT1FH2PsDPsfoM+Wt2eEwiLbpjLKm84c+sezJpyJvFv7kmoqDjei75CdMOoF
         bVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tMVMvSELY54S0UdLfdOcY9hXGDCgRpBmnCTKjFa8UlE=;
        b=76p0t7He7dT9JLX3C9xs+YdA9Lo6Z7zmxZ6AR0GhxaT+SuoJXfVtz5a5ZJwRIcxNcC
         LkYsuabNZ3jQd1YchAfdD484MGiomR12l6c9RQ40Uqm4/8/Q2LVE8DnDZFQfiW4DKN4B
         fG/rIUen9XOwyVmF6zDnUzCRUbhCGszI1JwywLeDjZhlAAcaZmdar3xOCvH6jKC2QWsO
         CvUuZU6G60stjg3XRdnE7VIW7gYidMQt4fl9v/4Z5lXCwyNYJ6JQf716LfB1+pjo8Xcg
         a2n2vtPuByS8UPTot8eH4rqbzda08vVCLFBwEtT7XYET4KVY1h7Nmffqvg38l1Xbdq1B
         bk7A==
X-Gm-Message-State: AOAM5310RNJC3o8Dti527E9mmhmifftNs7+HeBxawBC48bYaCm8MVIqv
	FLbBehAoH4aIbY9OHjOTgWI=
X-Google-Smtp-Source: ABdhPJygB0wkAZr+IyDwhIXD/1Ky9Z1d16PhZAI/x4npp+2qcv9Jc+QXaxpUDgRoNUJ2QI01eNmjeA==
X-Received: by 2002:aca:650d:: with SMTP id m13mr16262607oim.42.1636306383620;
        Sun, 07 Nov 2021 09:33:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
Message-ID: <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
Date: Sun, 7 Nov 2021 09:32:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/7/21 9:16 AM, Dmitry Osipenko wrote:
> 07.11.2021 20:08, Guenter Roeck пишет:
>> On 11/7/21 8:53 AM, Dmitry Osipenko wrote:
>>> 06.11.2021 23:54, Jonathan Neuschäfer пишет:
>>>> Hi,
>>>>
>>>> On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
>>>>> Use devm_register_power_handler() that replaces global pm_power_off
>>>>> variable and allows to register multiple power-off handlers. It also
>>>>> provides restart-handler support, i.e. all in one API.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>
>>>> When I boot with (most of) this patchset applied, I get the warning at
>>>> kernel/reboot.c:187:
>>>>
>>>>      /*
>>>>       * Handler must have unique priority. Otherwise call order is
>>>>       * determined by registration order, which is unreliable.
>>>>       */
>>>>      WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list,
>>>> nb));
>>>>
>>>> As the NTXEC driver doesn't specify a priority, I think this is an issue
>>>> to be fixed elsewhere.
>>>>
>>>> Other than that, it works and looks good, as far as I can tell.
>>>>
>>>>
>>>> For this patch:
>>>>
>>>> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>>>> Tested-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>>>
>>> Thank you. You have conflicting restart handlers, apparently NTXEC
>>> driver should have higher priority than the watchdog driver. It should
>>> be a common problem for the watchdog drivers, I will lower watchdog's
>>> default priority to fix it.
>>>
>>
>> The watchdog subsystem already uses "0" as default priority, which was
>> intended as priority of last resort for restart handlers. I do not see
>> a reason to change that.
> 
> Right, I meant that watchdog drivers which use restart handler set the
> level to the default 128 [1]. Although, maybe it's a problem only for
> i.MX drivers in practice, I'll take a closer look at the other drivers.
> 

They don't have to do that. The default is priority 0. It is the decision
of the driver author to set the watchdog's restart priority. So it is wrong
to claim that this would be "a common problem for the watchdog drivers",
because it isn't. Presumably there was a reason for the driver author
to select the default priority of 128. If there is a platform which has
a better means to restart the system, it should select a priority of
129 or higher instead of affecting _all_ platforms using the imx watchdog
to reset the system.

Sure, you can negotiate that with the driver author, but the default should
really be to change the priority for less affected platforms.

Guenter

