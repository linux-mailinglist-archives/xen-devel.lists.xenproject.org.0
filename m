Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FED48A902
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 08:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255626.438091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7C1w-0008Ba-P8; Tue, 11 Jan 2022 07:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255626.438091; Tue, 11 Jan 2022 07:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7C1w-00088C-LF; Tue, 11 Jan 2022 07:57:20 +0000
Received: by outflank-mailman (input) for mailman id 255626;
 Tue, 11 Jan 2022 07:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jbsk=R3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1n7C1u-000884-Vy
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 07:57:19 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 188fb527-72b4-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 08:57:17 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id o15so191172lfo.11
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jan 2022 23:57:17 -0800 (PST)
Received: from ?IPv6:2a00:1370:810c:714f:a10:76ff:fe69:21b6?
 ([2a00:1370:810c:714f:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id x14sm1206180ljd.76.2022.01.10.23.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 23:57:16 -0800 (PST)
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
X-Inumbo-ID: 188fb527-72b4-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LWyZT2KfS7vn2dLo/4rK0hRIU1bTIB9BhSt1xTZyjfs=;
        b=o816YNn0CIDbCy7uwUkg0QIssuplfNYZWg1E7+kMoiU09fEhi1ExzqEDKdXYCKWai9
         qL9GIVzs3SGnxKwGJEOsSM3dx9RhiXQOO+ArNyWLk+C6CEkyik9J0oiqnGoR0d0pIAj9
         53smI6i/pfdhdE0TtmtHvyvhbPCgckL8+ELBFQn7KfvHLFewJSBKJEg5/OYThOUaKs30
         YfS/REggk0oGjchlK3DJSLwWFv3g0lGM/Rxm4G3MobhsE5sy8EV2tAxeU17tchxilpyJ
         Cm1nk2GkD8C8mwFhmX8oxyCwbcyhBHAvQH1mhnlt/pBPXM0S0279pLMAkDnMH4r8aI8U
         4vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LWyZT2KfS7vn2dLo/4rK0hRIU1bTIB9BhSt1xTZyjfs=;
        b=67FDJHrmpamjc9EA8VeFskGdVQC5qSfwIUU68d+c5wJs0BKliLlXRySoEayrZvxN0m
         cS9w0ve5ux2BR3qEcCISvYclmJX4Sw+voBCrXjx/L9XfQs7S7nA8eeRrrDEChJptF57n
         QuenOj2eRSdB46WNaFGHNFrn66u0LmI7Bxyzwh1APBSJ62bKyIXEdjK/USIOhZxXhQaJ
         yC3D4SYuyZiVvc/4Q2/1spf9pSr1yJ0F+kyT41Jh+boM0HBoVyyajuALxCT4U+fMgx4B
         fn0jkprsAU/RCxK1c2EwGqOkBuktQyiI42dDZKk1bopGZv7rieLi1rxASgPwfqhW6D+v
         IeCA==
X-Gm-Message-State: AOAM531sKMbuW95vmLZz84zaZ+sW5s7P2SEZyj5PA+os9uIHd3y7IVfG
	64EaAa0l6xG4FBhVwDvANfU=
X-Google-Smtp-Source: ABdhPJwj4SWIivJF19fC8reHgAOesHmr0N4ouSyiTwjUsKFxuFFgsPk/HMJ5T5WGAATZ9pKSch9NEg==
X-Received: by 2002:a05:651c:49a:: with SMTP id s26mr2063487ljc.109.1641887836867;
        Mon, 10 Jan 2022 23:57:16 -0800 (PST)
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com> <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <80f5a739-0850-a8db-7493-e8c387109ce0@gmail.com>
Date: Tue, 11 Jan 2022 10:57:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

09.01.2022 02:35, Michał Mirosław пишет:
> On Mon, Dec 13, 2021 at 12:02:52AM +0300, Dmitry Osipenko wrote:
> [...]
>> +/**
>> + * struct power_off_data - Power-off callback argument
>> + *
>> + * @cb_data: Callback data.
>> + */
>> +struct power_off_data {
>> +	void *cb_data;
>> +};
>> +
>> +/**
>> + * struct power_off_prep_data - Power-off preparation callback argument
>> + *
>> + * @cb_data: Callback data.
>> + */
>> +struct power_off_prep_data {
>> +	void *cb_data;
>> +};
> 
> Why two exactly same structures? Why only a single pointer instead? If
> it just to enable type-checking callbacks, then thouse could be opaque
> or zero-sized structs that would be embedded or casted away in
> respective callbacks.

Preparation and final execution are two different operations, it's much
cleaner from a user's perspective to have same separated, IMO. In the
future we may would want to extend one of the structs, and not the
other. Type-checking is another benefit, of course.

The single callback pointer is what is utilized by all current kernel
users. This may change in the future and then it won't be a problem to
extend the power-off API without disrupting whole kernel.

>> +
>> +/**
>> + * struct restart_data - Restart callback argument
>> + *
>> + * @cb_data: Callback data.
>> + * @cmd: Restart command string.
>> + * @stop_chain: Further lower priority callbacks won't be executed if set to
>> + *		true. Can be changed within callback. Default is false.
>> + * @mode: Reboot mode ID.
>> + */
>> +struct restart_data {
>> +	void *cb_data;
>> +	const char *cmd;
>> +	bool stop_chain;
>> +	enum reboot_mode mode;
>> +};
>> +
>> +/**
>> + * struct reboot_prep_data - Reboot and shutdown preparation callback argument
>> + *
>> + * @cb_data: Callback data.
>> + * @cmd: Restart command string.
>> + * @stop_chain: Further lower priority callbacks won't be executed if set to
>> + *		true. Can be changed within callback. Default is false.
> 
> Why would we want to stop power-off or erboot chain? If the callback
> succeded, then further calls won't be made. If it doesn't succeed, but
> possibly breaks the system somehow, it shouldn't return. Then the only
> case left would be to just try the next method of shutting down.

This is what some of the API users were doing for years. I don't know
for sure why they want to stop the chain, it indeed looks like an
incorrect behaviour, but that's up to developers to decide. I only
retained the old behaviour for those users.

>> + * @mode: Preparation mode ID.
>> + */
>> +struct reboot_prep_data {
>> +	void *cb_data;
>> +	const char *cmd;
>> +	bool stop_chain;
>> +	enum reboot_prepare_mode mode;
>> +};
>> +
>> +struct sys_off_handler_private_data {
>> +	struct notifier_block power_off_nb;
>> +	struct notifier_block restart_nb;
>> +	struct notifier_block reboot_nb;
> 
> What's the difference between restart and reboot?

Reboot is always executed before restart and power-off callbacks. This
is explained in the doc-comment of the struct sys_off_handler.

+ * @reboot_prepare_cb: Reboot/shutdown preparation callback. All reboot
+ * preparation callbacks are invoked before @restart_cb or @power_off_cb,
+ * depending on the mode. It's registered with register_reboot_notifier().
+ * The point is to remove boilerplate code from drivers which use this
+ * callback in conjunction with the restart/power-off callbacks.
+ *

This reboot callback usually performs early preparations that are need
to be done before machine is placed into reset state, please see [1] for
the examples.

[1] https://elixir.bootlin.com/linux/v5.16/A/ident/register_reboot_notifier

I agree that "reboot" sounds like a misnomer. This name was coined long
time ago, perhaps not worth to rename it at this point. I'm also not
sure what could be a better name.

>> +	void (*platform_power_off_cb)(void);
>> +	void (*simple_power_off_cb)(void *data);
>> +	void *simple_power_off_cb_data;
>> +	bool registered;
>> +};
> 
> BTW, I couldn't find a right description of my idea of unifying the
> chains before, so let me sketch it now.
> 
> The idea is to have a single system-off chain in which the callback
> gets a mode ({QUERY_*, PREP_*, DO_*} for each of {*_REBOOT, *_POWEROFF, ...?).
> The QUERY_* calls would be made in can_kernel_reboot/poweroff(): all
> would be called, and if at least one returned true, then the shutdown
> mode would continue. All of PREP_* would be called then. After that
> all DO_* would be tried until one doesn't return (succeeded or broke
> the system hard). Classic for(;;); could be a final fallback for the
> case where arch/machine (lowest priority) call would return instead
> of halting the system in machine-dependent way. The QUERY and PREP
> stages could be combined, but I haven't thought about it enough to
> see what conditions would need to be imposed on the callbacks in
> that case (maybe it's not worth the trouble, since it isn't a fast
> path anyway?). The goal here is to have less (duplicated) code in
> kernel, but otherwise it seems equivalent to your API proposal.

Michał, thank you for the review and suggestions! I'll take another look
at yours proposal during this merge window, in a preparation to v6.

