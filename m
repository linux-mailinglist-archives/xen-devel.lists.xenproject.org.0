Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7537643F229
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 23:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218314.378685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDPy-0001Xk-UA; Thu, 28 Oct 2021 21:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218314.378685; Thu, 28 Oct 2021 21:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgDPy-0001VS-R4; Thu, 28 Oct 2021 21:58:38 +0000
Received: by outflank-mailman (input) for mailman id 218314;
 Thu, 28 Oct 2021 21:58:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CzqG=PQ=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mgDPx-0001VM-43
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 21:58:37 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0997cad3-c347-4fe7-8756-bde0ef1cf61f;
 Thu, 28 Oct 2021 21:58:36 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id n7so13170227ljp.5
 for <xen-devel@lists.xenproject.org>; Thu, 28 Oct 2021 14:58:35 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id t17sm248350ljc.136.2021.10.28.14.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:58:34 -0700 (PDT)
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
X-Inumbo-ID: 0997cad3-c347-4fe7-8756-bde0ef1cf61f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c23uil5g78FyKWMRLgZ6hSpJ/5dZjfgZdNOr6DwhpW8=;
        b=fN/sghTD1TZsVWGg7UdNVpmnpsJmxwTIReywOn3iS879FfwyrwTro/6JMf4MaGrEqh
         0NHbUx8tMPVCykH7rLffN6x80gPATjYeRH0X7Rke1JX3QXf40ikAhOl25K5S1BWImyNK
         Ws74ZKNhvY45yMsuq3FCKQn2UeHbmrvMca8cD6CCJ0R2lYcZYJkrBjgifHSN/5oWm7n1
         lFtQ6NQQUb7L/5VMhM9mJogVid13IyjOv29tIrHnCgMGRUpYmk/I5bl/5lJ21eD61OSt
         uVSSMkzEczkDy+3W/RlWkglTIAMMvdWcaEVw6izXBz+EOktxUqL8EL8FpyIQN0i0+0ax
         cKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c23uil5g78FyKWMRLgZ6hSpJ/5dZjfgZdNOr6DwhpW8=;
        b=hpCQNYdFvIeIMCR+kM2/oZjAkzXhjgplLWRBpSVlgZ5XFf7Eh5fgSIboGW5mzG436J
         c0nbWXSDvQ/8ZnJ1NMQKj1Zpooyeatoir0eyL0PRsbOh1VTNz3espHA1XZy3GeVLQqV+
         srAmKsdKTtSD0zFguFcnBTnWu0m+wl6k3mjUnaG9EYlkNQdQJs5uOwIR7v365e+NZcv5
         aANGXALF/hQh3ojl6gkYKb81u2SlxnREJC0yChHlqCtnWeCebx8ObfTNyt/sXRrlKdqq
         m+S3u4TBaq0ST2y/dWULM0p3r7VmRGHkm0+X7viTG46xplH+lDSLFZNCSP4qCejwevpZ
         ziPQ==
X-Gm-Message-State: AOAM532mw3PwgpKwzko7WEKW9RB5Aonddp4ykKBCQSnN965KFHJ6o8yR
	aj6pf2uQy8VpKDdWecKs6co=
X-Google-Smtp-Source: ABdhPJwU+yd9K4RKqPYJGKdWrmOtthi6PCwOlEc1MXGCnrTPBunu0coGknm3bBb5A7s1sx8AG2GBkw==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr7402126ljp.157.1635458314886;
        Thu, 28 Oct 2021 14:58:34 -0700 (PDT)
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>,
 xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 openbmc@lists.ozlabs.org, linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
 <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <28560da7-8ab6-3bd5-b4d6-e34b21a9bbb0@gmail.com>
Date: Fri, 29 Oct 2021 00:58:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

28.10.2021 12:59, Rafael J. Wysocki пишет:
>> +#define RESTART_PRIO_RESERVED          0
>> +#define RESTART_PRIO_DEFAULT           128
>> +#define RESTART_PRIO_HIGH              192
>>
>>  enum reboot_mode {
>>         REBOOT_UNDEFINED = -1,
>> @@ -49,6 +55,167 @@ int register_restart_handler(struct notifier_block *);
>>  int unregister_restart_handler(struct notifier_block *);
>>  void do_kernel_restart(char *cmd);
>>
>> +/*
>> + * Unified poweroff + restart API.
>> + */
>> +
>> +#define POWEROFF_PRIO_RESERVED         0
>> +#define POWEROFF_PRIO_PLATFORM         1
>> +#define POWEROFF_PRIO_DEFAULT          128
>> +#define POWEROFF_PRIO_HIGH             192
>> +#define POWEROFF_PRIO_FIRMWARE         224
> Also I'm wondering why these particular numbers were chosen, here and above?

These values are chosen based on priorities that drivers already use. I looked thorough them all and ended with this scheme that fulfills the needs of the current API users.

I'll add these comments in v3:

/*
 * Standard restart priority levels. Intended to be set in the
 * sys_off_handler.restart_priority field.
 *
 * Use `RESTART_PRIO_XXX +- prio` style for additional levels.
 *
 * RESTART_PRIO_RESERVED:	Falls back to RESTART_PRIO_DEFAULT.
 *				Drivers may leave priority initialized
 *				to zero, to auto-set it to the default level.
 *
 * RESTART_PRIO_DEFAULT:	Use this for generic handler.
 *
 * RESTART_PRIO_HIGH:		Use this if you have multiple handlers and
 *				this handler has higher priority than the
 *				default handler.
 */

/*
 * Standard power-off priority levels. Intended to be set in the
 * sys_off_handler.power_off_priority field.
 *
 * Use `POWEROFF_PRIO_XXX +- prio` style for additional levels.
 *
 * POWEROFF_PRIO_RESERVED:	Falls back to POWEROFF_PRIO_DEFAULT.
 *				Drivers may leave priority initialized
 *				to zero, to auto-set it to the default level.
 *
 * POWEROFF_PRIO_PLATFORM:	Intended to be used by platform-level handler.
 *				Has lowest priority since device drivers are
 *				expected to take over platform handler which
 *				doesn't allow further callback chaining.
 *
 * POWEROFF_PRIO_DEFAULT:	Use this for generic handler.
 *
 * POWEROFF_PRIO_HIGH:		Use this if you have multiple handlers and
 *				this handler has higher priority than the
 *				default handler.
 *
 * POWEROFF_PRIO_FIRMWARE:	Use this if handler uses firmware call.
 *				Has highest priority since firmware is expected
 *				to know best how to power-off hardware properly.
 */

