Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F232952BD98
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332296.555975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKwY-0005dl-Rw; Wed, 18 May 2022 14:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332296.555975; Wed, 18 May 2022 14:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKwY-0005bF-Oe; Wed, 18 May 2022 14:46:30 +0000
Received: by outflank-mailman (input) for mailman id 332296;
 Wed, 18 May 2022 14:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldrR=V2=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1nrKwX-0005b9-H7
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:46:29 +0000
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bf75829-d6b9-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 16:46:28 +0200 (CEST)
Received: by mail-yb1-f172.google.com with SMTP id r1so4046557ybo.7
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 07:46:27 -0700 (PDT)
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
X-Inumbo-ID: 4bf75829-d6b9-11ec-bd2c-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3SGArFKDihyEBXlF8/XNeAemrWMKKpCb4khL75HityU=;
        b=m8Kpuq9/icSyAoJLHsexyVxVBj2T2pHsMEWAR0LcyGf7CtlJYOpQWBXoA6nvMx06q9
         96szUnAWRpklNAcPNZjmxp4rVs0IFhr9gQn+iNn1u3uXNhbfvePoShYWSBoQz8iPpI9y
         QEGwTHVtw64hpaKmR9Xs+88ZpI+jJjWM5NM+SoML5xdI6LC7lAUlvnVjfxfldoD87msT
         G+8Ta6u/md9JFXz841AICo+737yFrNVlE/+0lJM8qJ81HgO0tijmp2bcKobJ3idBKki6
         OoOevMCIPq9s6ETTuGT2qNlIDPDv74E3qRw9xUs6RfTA9XHqFN8fpasd2BmpMjrhhRD+
         YZMg==
X-Gm-Message-State: AOAM532YoyWERZdFqNlfd7sByZbtN2RVpwWmIxO11PpTbT0L9WQyUrLf
	T7d3NPFTBG08g8YUia+z19XPHxvP/oMByNfzdoU=
X-Google-Smtp-Source: ABdhPJzrRXyFkOYYP+knWo30LGdADGmZZVDFFkLi378Dx+GKoFEryYPjgFz2aAoFwQStjD/27f3Wowem4YVwVmdPLVU=
X-Received: by 2002:a25:d687:0:b0:64e:3a41:8d5 with SMTP id
 n129-20020a25d687000000b0064e3a4108d5mr3149496ybg.622.1652885186733; Wed, 18
 May 2022 07:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 18 May 2022 16:46:15 +0200
Message-ID: <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
Subject: Re: [PATCH v8 00/27] Introduce power-off+restart call chain API
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Problem
> -------
>
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.
>
> Solution
> --------
>
> Introduce new API that provides call chains support for all restart and
> power-off modes. The new API is designed with simplicity and extensibilit=
y
> in mind.
>
> This is a third attempt to introduce the new API. First was made by
> Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
> In fact the work didn't stop and recently arm_pm_restart() was removed
> from v5.14 kernel, which was a part of preparatory work started by
> Guenter Roeck.
>
> Adoption plan
> -------------
>
> This patchset introduces the new API. It also converts multiple drivers
> and arch code to the new API to demonstrate how it all looks in practice,
> removing the pm_power_off_prepare global variable.
>
> The plan is:
>
> 1. Merge the new API and convert arch code to use do_kernel_power_off().
>    For now the new API will co-exist with the older API.
>
> 2. Convert all drivers and platform code to the new API.
>
> 3. Remove obsoleted pm_power_off and pm_power_off_prepare variables.
>
> Results
> -------
>
> 1. Devices can be powered off properly.
>
> 2. Global variables are removed from drivers.
>
> 3. Global pm_power_off and pm_power_off_prepare callback variables are
> removed once all users are converted to the new API. The latter callback
> is removed by patch #24 of this series.
>
> 4. Ambiguous call chain ordering is prohibited for non-default priorities=
.
>
> Changelog:
>
> v8: - Reworked sys-off handler like was suggested by Rafael Wysocki in
>       the comments to v7.
>
>     - The struct sys-off handler now is private to kernel/reboot.c and
>       new API is simplified.
>
>     - There is a single sys-off API function for all handler types.
>       Users shall pass the required sys-off mode type (restart, power-off
>       and etc).
>
>     - There is single struct sys_off_data callback argument for all
>       handler modes.
>
>     - User's callback now must return NOTIFY_DONE or NOTIFY_STOP.
>
>     - The default priority level is zero now.
>
>     - Multiple handlers now allowed to be registered at the default
>       priority level.
>
>     - Power-off call chain is atomic now, like the restart chain.
>
>     - kernel/reboot.c changes are split up into several logical patches.
>
>     - Added r-b from Micha=C5=82 Miros=C5=82aw to unmodified patches from=
 v7.
>
>     - Added acks that were missing in v7 by accident.

The v8 looks much better than the previous versions to me.

I actually don't really have any comments on it except for the minor
remark regarding patch [1/27] sent separately.

Please just send an update of that one patch and I will queue up the
series for 5.19.

However, I'm going to send a pull request with it in the second half
of the merge window, after the majority of the other changes in the
subsystems touched by it have been integrated.

> v7: - Rebased on a recent linux-next. Dropped the recently removed
>       NDS32 architecture. Only SH and x86 arches left un-acked.
>
>     - Added acks from Thomas Bogendoerfer and Krzysztof Kozlowski
>       to the MIPS and memory/emif patches respectively.
>
>     - Made couple minor cosmetic improvements to the new API.
>
>     - A month ago I joined Collabora and continuing to work on this serie=
s
>       on the company's time, so changed my email address to collabora.com
>
> v6: - Rebased on a recent linux-next.
>
>     - Made minor couple cosmetic changes.
>
> v5: - Dropped patches which cleaned up notifier/reboot headers, as was
>       requested by Rafael Wysocki.
>
>     - Dropped WARN_ON() from the code, as was requested by Rafael Wysocki=
.
>       Replaced it with pr_err() appropriately.
>
>     - Dropped *_notifier_has_unique_priority() functions and added
>       *_notifier_chain_register_unique_prio() instead, as was suggested
>       by Micha=C5=82 Miros=C5=82aw and Rafael Wysocki.
>
>     - Dropped export of blocking_notifier_call_chain_is_empty() symbol,
>       as was suggested by Rafael Wysocki.
>
>     - Micha=C5=82 Miros=C5=82aw suggested that will be better to split up=
 patch
>       that adds the new API to ease reviewing, but Rafael Wysocki asked
>       not add more patches, so I kept it as a single patch.
>
>     - Added temporary "weak" stub for pm_power_off() which fixes linkage
>       failure once symbol is removed from arch/* code. Previously I misse=
d
>       this problem because was only compile-testing object files.
>
> v4: - Made a very minor improvement to doc comments, clarifying couple
>       default values.
>
>     - Corrected list of emails recipient by adding Linus, Sebastian,
>       Philipp and more NDS people. Removed bouncing emails.
>
>     - Added acks that were given to v3.
>
> v3: - Renamed power_handler to sys_off_handler as was suggested by
>       Rafael Wysocki.
>
>     - Improved doc-comments as was suggested by Rafael Wysocki. Added mor=
e
>       doc-comments.
>
>     - Implemented full set of 180 patches which convert whole kernel in
>       accordance to the plan, see link [1] above. Slightly adjusted API t=
o
>       better suit for the remaining converted drivers.
>
>       * Added unregister_sys_off_handler() that is handy for a couple old
>         platform drivers.
>
>       * Dropped devm_register_trivial_restart_handler(), 'simple' variant
>         is enough to have.
>
>     - Improved "Add atomic/blocking_notifier_has_unique_priority()" patch=
,
>       as was suggested by Andy Shevchenko. Also replaced down_write() wit=
h
>       down_read() and factored out common notifier_has_unique_priority().
>
>     - Added stop_chain field to struct restart_data and reboot_prep_data
>       after discovering couple drivers wanting that feature.
>
>     - Added acks that were given to v2.
>
> v2: - Replaced standalone power-off call chain demo-API with the combined
>       power-off+restart API because this is what drivers want. It's a mor=
e
>       comprehensive solution.
>
>     - Converted multiple drivers and arch code to the new API. Suggested =
by
>       Andy Shevchenko. I skimmed through the rest of drivers, verifying t=
hat
>       new API suits them. The rest of the drivers will be converted once =
we
>       will settle on the new API, otherwise will be too many patches here=
.
>
>     - v2 API doesn't expose notifier to users and require handlers to
>       have unique priority. Suggested by Guenter Roeck.
>
>     - v2 API has power-off chaining disabled by default and require
>       drivers to explicitly opt-in to the chaining. This preserves old
>       behaviour for existing drivers once they are converted to the new
>       API.
>
> Dmitry Osipenko (27):
>   notifier: Add atomic_notifier_call_chain_is_empty()
>   notifier: Add blocking/atomic_notifier_chain_register_unique_prio()
>   kernel/reboot: Introduce sys-off handler API
>   kernel/reboot: Wrap legacy power-off callbacks into sys-off handlers
>   kernel/reboot: Add do_kernel_power_off()
>   kernel/reboot: Add stub for pm_power_off
>   kernel/reboot: Add kernel_can_power_off()
>   kernel/reboot: Add register_platform_power_off()
>   ARM: Use do_kernel_power_off()
>   csky: Use do_kernel_power_off()
>   riscv: Use do_kernel_power_off()
>   arm64: Use do_kernel_power_off()
>   parisc: Use do_kernel_power_off()
>   xen/x86: Use do_kernel_power_off()
>   powerpc: Use do_kernel_power_off()
>   m68k: Switch to new sys-off handler API
>   sh: Use do_kernel_power_off()
>   x86: Use do_kernel_power_off()
>   ia64: Use do_kernel_power_off()
>   mips: Use do_kernel_power_off()
>   memory: emif: Use kernel_can_power_off()
>   ACPI: power: Switch to sys-off handler API
>   regulator: pfuze100: Use devm_register_sys_off_handler()
>   reboot: Remove pm_power_off_prepare()
>   soc/tegra: pmc: Use sys-off handler API to power off Nexus 7 properly
>   kernel/reboot: Add devm_register_power_off_handler()
>   kernel/reboot: Add devm_register_restart_handler()
>
>  arch/arm/kernel/reboot.c               |   4 +-
>  arch/arm64/kernel/process.c            |   3 +-
>  arch/csky/kernel/power.c               |   6 +-
>  arch/ia64/kernel/process.c             |   4 +-
>  arch/m68k/emu/natfeat.c                |   3 +-
>  arch/m68k/include/asm/machdep.h        |   1 -
>  arch/m68k/kernel/process.c             |   5 +-
>  arch/m68k/kernel/setup_mm.c            |   1 -
>  arch/m68k/kernel/setup_no.c            |   1 -
>  arch/m68k/mac/config.c                 |   4 +-
>  arch/mips/kernel/reset.c               |   3 +-
>  arch/parisc/kernel/process.c           |   4 +-
>  arch/powerpc/kernel/setup-common.c     |   4 +-
>  arch/powerpc/xmon/xmon.c               |   3 +-
>  arch/riscv/kernel/reset.c              |  12 +-
>  arch/sh/kernel/reboot.c                |   3 +-
>  arch/x86/kernel/reboot.c               |   4 +-
>  arch/x86/xen/enlighten_pv.c            |   4 +-
>  drivers/acpi/sleep.c                   |  16 +-
>  drivers/memory/emif.c                  |   2 +-
>  drivers/regulator/pfuze100-regulator.c |  42 ++-
>  drivers/soc/tegra/pmc.c                |  87 +++++--
>  include/linux/notifier.h               |   7 +
>  include/linux/pm.h                     |   1 -
>  include/linux/reboot.h                 |  91 +++++++
>  kernel/notifier.c                      | 101 +++++--
>  kernel/reboot.c                        | 347 ++++++++++++++++++++++++-
>  27 files changed, 639 insertions(+), 124 deletions(-)
>
> --
> 2.35.1
>

