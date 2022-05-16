Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F95289E2
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 18:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330095.553412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdJq-00026e-OU; Mon, 16 May 2022 16:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330095.553412; Mon, 16 May 2022 16:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqdJq-00023D-KM; Mon, 16 May 2022 16:11:38 +0000
Received: by outflank-mailman (input) for mailman id 330095;
 Mon, 16 May 2022 16:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1JD=VY=chromium.org=evgreen@srs-se1.protection.inumbo.net>)
 id 1nqdGz-0007Hk-Dt
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 16:08:41 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7303ed2b-d532-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 18:08:40 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 y22-20020a4acb96000000b0035eb01f5b65so4114409ooq.5
 for <xen-devel@lists.xenproject.org>; Mon, 16 May 2022 09:08:40 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
 [209.85.167.177]) by smtp.gmail.com with ESMTPSA id
 z18-20020a544592000000b00325cda1ffb2sm3939484oib.49.2022.05.16.09.08.38
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 09:08:38 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id r1so19168257oie.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 May 2022 09:08:38 -0700 (PDT)
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
X-Inumbo-ID: 7303ed2b-d532-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ScgtWm2uFkOxfulqs7520gHM/my4MYIe3yq/VcV3Ozw=;
        b=Ui6BaQ6lQ9IwPfOUL4TJm7cJvfYf8UFV8wI0yIE/ecSwLqobvQf4rTIikXPC8Ksnp/
         JRSTr3Fgwya3hm14X44WgUx1HJGuc9H1MoeHAN4VBzxuhJEnypxN8+xF6HAWoKiAVAs3
         mxYrKvjtDKZ5Z0eJvjVSmqSHIwF8R/De7GbNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ScgtWm2uFkOxfulqs7520gHM/my4MYIe3yq/VcV3Ozw=;
        b=QZnwgMZMOrsXeRc08sX2stoIFge4m7tmCmkJdXnEc+yx2/palU8zIhLXs9rMS5xWN5
         zAYTe2hxHm9wXv1fCJwD+EXtp/diB5LZFayGU9gk+LSjMPqaPGahSTA5oldEIEOZ4Fw2
         yvAkpmB4Y3EOMjH8h+RsUUV0uueWMnSJRWbrIfD+XIDC+B3AFr7dHVosPBpuJ/oEnpZ8
         ZTKUIFFGhaEZtyhTXYvbADnOzBp8AZwecGIecE7uLomyzqAMeosEpQgeLYlmJFAyp2L4
         9wSSy4Oosh8KpCFhdirPkPhUsg/KRoI9E8Y4kr2REkV2v6ZhpppBUoFoFndjHbvc5LLR
         VDIw==
X-Gm-Message-State: AOAM533yyjNNtFFLnGhe55Tq6eUtlgpSVxWeJ5CAWaoeWbq4/yvFPc0s
	2aatjFf+IfoEemWMw120x/qavdZB32UqnlKq
X-Google-Smtp-Source: ABdhPJy6AK/zzdhjJHMFZDmy6PViELZ12c6N9gJJ06FZt0q6/kr9w+KO5t3tGH/t+8DMNm+C0IZmlw==
X-Received: by 2002:a4a:9805:0:b0:35e:e501:41fd with SMTP id y5-20020a4a9805000000b0035ee50141fdmr6318052ooi.34.1652717318895;
        Mon, 16 May 2022 09:08:38 -0700 (PDT)
X-Received: by 2002:a05:6870:63a0:b0:f1:8bca:8459 with SMTP id
 t32-20020a05687063a000b000f18bca8459mr4861359oap.174.1652716966894; Mon, 16
 May 2022 09:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224924.592546-1-gpiccoli@igalia.com> <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley> <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
In-Reply-To: <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
From: Evan Green <evgreen@chromium.org>
Date: Mon, 16 May 2022 09:02:10 -0700
X-Gmail-Original-Message-ID: <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
Message-ID: <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Petr Mladek <pmladek@suse.com>, David Gow <davidgow@google.com>, 
	Julius Werner <jwerner@chromium.org>, Scott Branden <scott.branden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Sebastian Reichel <sre@kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com, kexec@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-alpha@vger.kernel.org, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, 
	kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, 
	fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>, d.hatayama@jp.fujitsu.com, 
	dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mikelley@microsoft.com, 
	hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de, 
	Kees Cook <keescook@chromium.org>, luto@kernel.org, mhiramat@kernel.org, 
	mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org, 
	rostedt@goodmis.org, senozhatsky@chromium.org, 
	Alan Stern <stern@rowland.harvard.edu>, Thomas Gleixner <tglx@linutronix.de>, vgoyal@redhat.com, 
	vkuznets@redhat.com, Will Deacon <will@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andrea Parri <parri.andrea@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Brian Norris <computersforpeace@gmail.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, 
	Dexuan Cui <decui@microsoft.com>, Doug Berger <opendmb@gmail.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Hari Bathini <hbathini@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Justin Chen <justinpopo6@gmail.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Lee Jones <lee.jones@linaro.org>, 
	Markus Mayer <mmayer@broadcom.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Mihai Carabas <mihai.carabas@oracle.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>, 
	Shile Zhang <shile.zhang@linux.alibaba.com>, Stephen Hemminger <sthemmin@microsoft.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Tianyu Lan <Tianyu.Lan@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Wang ShaoBo <bobo.shaobowang@huawei.com>, Wei Liu <wei.liu@kernel.org>, 
	zhenwei pi <pizhenwei@bytedance.com>, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022 at 8:07 AM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Thanks for the review!
>
> I agree with the blinking stuff, I can rework and add all LED/blinking
> stuff into the loop list, it does make sense. I'll comment a bit in the
> others below...
>
> On 16/05/2022 11:01, Petr Mladek wrote:
> > [...]
> >> --- a/arch/mips/sgi-ip22/ip22-reset.c
> >> +++ b/arch/mips/sgi-ip22/ip22-reset.c
> >> @@ -195,7 +195,7 @@ static int __init reboot_setup(void)
> >>      }
> >>
> >>      timer_setup(&blink_timer, blink_timeout, 0);
> >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> >
> > This notifier enables blinking. It is not much safe. It calls
> > mod_timer() that takes a lock internally.
> >
> > This kind of functionality should go into the last list called
> > before panic() enters the infinite loop. IMHO, all the blinking
> > stuff should go there.
> > [...]
> >> --- a/arch/mips/sgi-ip32/ip32-reset.c
> >> +++ b/arch/mips/sgi-ip32/ip32-reset.c
> >> @@ -145,7 +144,7 @@ static __init int ip32_reboot_setup(void)
> >>      pm_power_off = ip32_machine_halt;
> >>
> >>      timer_setup(&blink_timer, blink_timeout, 0);
> >> -    atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
> >> +    atomic_notifier_chain_register(&panic_hypervisor_list, &panic_block);
> >
> > Same here. Should be done only before the "loop".
> > [...]
>
> Ack.
>
>
> >> --- a/drivers/firmware/google/gsmi.c
> >> +++ b/drivers/firmware/google/gsmi.c
> >> @@ -1034,7 +1034,7 @@ static __init int gsmi_init(void)
> >>
> >>      register_reboot_notifier(&gsmi_reboot_notifier);
> >>      register_die_notifier(&gsmi_die_notifier);
> >> -    atomic_notifier_chain_register(&panic_notifier_list,
> >> +    atomic_notifier_chain_register(&panic_hypervisor_list,
> >>                                     &gsmi_panic_notifier);
> >
> > I am not sure about this one. It looks like some logging or
> > pre_reboot stuff.
> >
>
> Disagree here. I'm looping Google maintainers, so they can comment.
> (CCed Evan, David, Julius)
>
> This notifier is clearly a hypervisor notification mechanism. I've fixed
> a locking stuff there (in previous patch), I feel it's low-risk but even
> if it's mid-risk, the class of such callback remains a perfect fit with
> the hypervisor list IMHO.

This logs a panic to our "eventlog", a tiny logging area in SPI flash
for critical and power-related events. In some cases this ends up
being the only clue we get in a Chromebook feedback report that a
panic occurred, so from my perspective moving it to the front of the
line seems like a good idea.

-Evan

