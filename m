Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F47447436
	for <lists+xen-devel@lfdr.de>; Sun,  7 Nov 2021 17:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222827.385209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjlPp-0001hY-Ow; Sun, 07 Nov 2021 16:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222827.385209; Sun, 07 Nov 2021 16:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjlPp-0001fY-Lm; Sun, 07 Nov 2021 16:53:09 +0000
Received: by outflank-mailman (input) for mailman id 222827;
 Sun, 07 Nov 2021 16:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=peUb=P2=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjlPn-0001fS-Mb
 for xen-devel@lists.xenproject.org; Sun, 07 Nov 2021 16:53:07 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c1d748b-3feb-11ec-a9d2-d9f7a1cc8784;
 Sun, 07 Nov 2021 17:53:06 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id bi35so30724675lfb.9
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 08:53:03 -0800 (PST)
Received: from [192.168.2.145] (79-139-182-132.dynamic.spd-mgts.ru.
 [79.139.182.132])
 by smtp.googlemail.com with ESMTPSA id c3sm860233lfb.122.2021.11.07.08.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 08:53:02 -0800 (PST)
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
X-Inumbo-ID: 2c1d748b-3feb-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FuxjUSeidJvAMVHKU9E/d55P+zyTiwTeSCeqf/uVMDo=;
        b=Lwzfxq5uEYmwUHQaauy1zdfEe4xJydQ9b9Od8uYrwBczi5NJMIekKLJg7wlYTXl+4h
         aBwFrnzPjUuQZKv1Ia+S222jU8dJElyFhzTX7Y6Z3zgW5uo6fxyJ6Ub7QZuJOpIcD/5G
         Z5zvDqw9CupdRxfoeBn7XfS8iSTjIzecdpz5R8YfLYHN44fPq2Sj3DZqQfYaE9SGw4KM
         9QVgWsVoZpReO+np7PVvhGoeoi2Muq2En7xd12JC02FvD5KUvlS8dKa1pfLtqGdyB8C3
         Q31AQZyOLu3Y3rBXma7EsV9dMapOWW+H7dfnyyasqa2gU34jVZGgiKgGYKDrTdyFanCB
         8Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FuxjUSeidJvAMVHKU9E/d55P+zyTiwTeSCeqf/uVMDo=;
        b=SLwDr5wpW2pKQ9kx/lm5riompaXHxmaeA2vLjTopSnpltK4yQCIBdDz+BRIjmrSqsc
         2ziL5T7JFOx4K2iYhkDZC1lm5R/FL2soUYEQadLKqVsZLKMOSoT/mgEVyL7fxFxOksSr
         4DRVKgbZ09sge/Kb7qUBWQnhcvqMFNEBVEnwMoGOqrF9kYCpnJxjacN0hqj+qhEANI7q
         a3iIMa5MzsTrgGNI83SC5ujAzJXJ/DF+R6LJgP6gjISZDNjAnAEo81PO0iOjTe94S2Yx
         DwMJrSGDP6Rxc2m2rCO0fU7YQK9qjTyfkQ+rvGUYEgunaCfITMx1RRDuf0lL1OQVKqOT
         YnTg==
X-Gm-Message-State: AOAM531x42WVD5/GkULjInY5vTQwln3Hctr9eRPPV94QLtvSzt0hNU+7
	GVqNKxEs9VJTlvUCG+AcE3E=
X-Google-Smtp-Source: ABdhPJyYdIEr6ONtuDBexIQwg75AwiW2LoF8DEUBqYkEbum61pW0vPuGJTsEH8z54RKtLjaAI2MWow==
X-Received: by 2002:a05:6512:1082:: with SMTP id j2mr64106958lfg.568.1636303982698;
        Sun, 07 Nov 2021 08:53:02 -0800 (PST)
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
Date: Sun, 7 Nov 2021 19:53:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYbqlmOM95q7Hbjo@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

06.11.2021 23:54, Jonathan Neuschäfer пишет:
> Hi,
> 
> On Thu, Oct 28, 2021 at 12:16:57AM +0300, Dmitry Osipenko wrote:
>> Use devm_register_power_handler() that replaces global pm_power_off
>> variable and allows to register multiple power-off handlers. It also
>> provides restart-handler support, i.e. all in one API.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
> 
> When I boot with (most of) this patchset applied, I get the warning at
> kernel/reboot.c:187:
> 
> 	/*
> 	 * Handler must have unique priority. Otherwise call order is
> 	 * determined by registration order, which is unreliable.
> 	 */
> 	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));
> 
> As the NTXEC driver doesn't specify a priority, I think this is an issue
> to be fixed elsewhere.
> 
> Other than that, it works and looks good, as far as I can tell.
> 
> 
> For this patch:
> 
> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> Tested-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Thank you. You have conflicting restart handlers, apparently NTXEC
driver should have higher priority than the watchdog driver. It should
be a common problem for the watchdog drivers, I will lower watchdog's
default priority to fix it.

