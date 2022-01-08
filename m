Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E34886F6
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 00:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254934.436814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6LFJ-0002f4-Rh; Sat, 08 Jan 2022 23:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254934.436814; Sat, 08 Jan 2022 23:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6LFJ-0002cB-NR; Sat, 08 Jan 2022 23:35:37 +0000
Received: by outflank-mailman (input) for mailman id 254934;
 Sat, 08 Jan 2022 23:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zN0Z=RY=rere.qmqm.pl=mirq-linux@srs-se1.protection.inumbo.net>)
 id 1n6LFH-0002c5-Cq
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 23:35:36 +0000
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abfbd283-70db-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 00:35:33 +0100 (CET)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4JWbzn6Bf4z9c;
 Sun,  9 Jan 2022 00:35:17 +0100 (CET)
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
X-Inumbo-ID: abfbd283-70db-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1641684931; bh=PlUOfTOJmz/Ue3/EDBlVUxJ2DxqecfDU18/1xQbQtoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FscL30pAUhiOa20r1Aci5nnOyAPPM7+JoY4I/TdvClRTh0U4D6S+wg1hl5DP6lTxY
	 uXsR1x49ZX58OBDSXL5QGeKh44OE5Qx3HX+fhAHnzzl6d2Bb3RMolFLW/CZs7ANyT9
	 2B2bqDVSaDvrnFLV9W4laov2KVjSpYZyXNNSx0uhvIf6/Ty/Jc6im2Ya6WtOK+mKnU
	 8tBa912YBdNEWU6kN5XGlGndW+KwbfYMSoJHIv4OJWOXoW7NdW+vFlXd5iG2C0Sl5t
	 yLjrrdYJpGeB9xfuugFJFXVZkd4+VRh97hWFY+LEwPEsT5kUEeN00fOMl2F0IbFH2g
	 x9nJQfgC6GmfA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date: Sun, 9 Jan 2022 00:35:15 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Joshua Thompson <funaho@jurai.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
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
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
Message-ID: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211212210309.9851-5-digetx@gmail.com>

On Mon, Dec 13, 2021 at 12:02:52AM +0300, Dmitry Osipenko wrote:
[...]
> +/**
> + * struct power_off_data - Power-off callback argument
> + *
> + * @cb_data: Callback data.
> + */
> +struct power_off_data {
> +	void *cb_data;
> +};
> +
> +/**
> + * struct power_off_prep_data - Power-off preparation callback argument
> + *
> + * @cb_data: Callback data.
> + */
> +struct power_off_prep_data {
> +	void *cb_data;
> +};

Why two exactly same structures? Why only a single pointer instead? If
it just to enable type-checking callbacks, then thouse could be opaque
or zero-sized structs that would be embedded or casted away in
respective callbacks.

> +
> +/**
> + * struct restart_data - Restart callback argument
> + *
> + * @cb_data: Callback data.
> + * @cmd: Restart command string.
> + * @stop_chain: Further lower priority callbacks won't be executed if set to
> + *		true. Can be changed within callback. Default is false.
> + * @mode: Reboot mode ID.
> + */
> +struct restart_data {
> +	void *cb_data;
> +	const char *cmd;
> +	bool stop_chain;
> +	enum reboot_mode mode;
> +};
> +
> +/**
> + * struct reboot_prep_data - Reboot and shutdown preparation callback argument
> + *
> + * @cb_data: Callback data.
> + * @cmd: Restart command string.
> + * @stop_chain: Further lower priority callbacks won't be executed if set to
> + *		true. Can be changed within callback. Default is false.

Why would we want to stop power-off or erboot chain? If the callback
succeded, then further calls won't be made. If it doesn't succeed, but
possibly breaks the system somehow, it shouldn't return. Then the only
case left would be to just try the next method of shutting down.

> + * @mode: Preparation mode ID.
> + */
> +struct reboot_prep_data {
> +	void *cb_data;
> +	const char *cmd;
> +	bool stop_chain;
> +	enum reboot_prepare_mode mode;
> +};
> +
> +struct sys_off_handler_private_data {
> +	struct notifier_block power_off_nb;
> +	struct notifier_block restart_nb;
> +	struct notifier_block reboot_nb;

What's the difference between restart and reboot?

> +	void (*platform_power_off_cb)(void);
> +	void (*simple_power_off_cb)(void *data);
> +	void *simple_power_off_cb_data;
> +	bool registered;
> +};

BTW, I couldn't find a right description of my idea of unifying the
chains before, so let me sketch it now.

The idea is to have a single system-off chain in which the callback
gets a mode ({QUERY_*, PREP_*, DO_*} for each of {*_REBOOT, *_POWEROFF, ...?).
The QUERY_* calls would be made in can_kernel_reboot/poweroff(): all
would be called, and if at least one returned true, then the shutdown
mode would continue. All of PREP_* would be called then. After that
all DO_* would be tried until one doesn't return (succeeded or broke
the system hard). Classic for(;;); could be a final fallback for the
case where arch/machine (lowest priority) call would return instead
of halting the system in machine-dependent way. The QUERY and PREP
stages could be combined, but I haven't thought about it enough to
see what conditions would need to be imposed on the callbacks in
that case (maybe it's not worth the trouble, since it isn't a fast
path anyway?). The goal here is to have less (duplicated) code in
kernel, but otherwise it seems equivalent to your API proposal.

Best Regards
Micha³ Miros³aw

