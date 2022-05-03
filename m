Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2AA5196C0
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319874.540581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Lr-0004Ty-UK; Wed, 04 May 2022 05:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319874.540581; Wed, 04 May 2022 05:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Lr-0004R0-Qq; Wed, 04 May 2022 05:15:03 +0000
Received: by outflank-mailman (input) for mailman id 319874;
 Tue, 03 May 2022 18:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oaGl=VL=chromium.org=evgreen@srs-se1.protection.inumbo.net>)
 id 1nlwyc-0008L1-TW
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 18:10:22 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b8f12ba-cb0c-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 20:10:21 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e93ff05b23so17959511fac.9
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 11:10:21 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com.
 [209.85.167.175]) by smtp.gmail.com with ESMTPSA id
 h3-20020a056870d24300b000e686d1386fsm7141694oac.9.2022.05.03.11.10.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 11:10:20 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id e189so18977535oia.8
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 11:10:20 -0700 (PDT)
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
X-Inumbo-ID: 4b8f12ba-cb0c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R4/K6aedIUl9MohMPOlkW7bX2DydtcwCMb+CydErQh0=;
        b=CJu9kW5FihxnTA4wr5HdIEfymEuuekA79aJVNMM2F6kdV2+CmmuoX8R9fhQ+4vfzGu
         cwr0+95tIZHFde4YyKyVQIEU1uoccXZ0Wre6iNf7ZQo6N8EA9gsX+jTvyEJvXCE49T6e
         235jqkHQ/du2SkGvAqn3TvfA6e2cYQxB3dcEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R4/K6aedIUl9MohMPOlkW7bX2DydtcwCMb+CydErQh0=;
        b=mANBf/56P26M3i4J+XdC29p3ZzMuNp+xWUru7SFyoFB4C4md3mS2PCPRKYTorwrlQN
         OVnLICJGg7AIm9aCHpCdNGiov49GGbVyqyfrzheRNtwQlfsUGVuuNiJGyqurYkv96lc4
         74V3onSmRgFGP7HwQo9wP746niCExJ+2ibOhXCBruHPY3+FeF3FSG2yALazsjNkVQB9H
         EEoHfnNbjQ1csZxednlee5RjfDV4fHnoCZKSIA+bBGrH4HwqA94id4AVhAvAYmwyFRAj
         nXO7RsM8+SNoU7SZA3FifPpBDDhmWXM9ucfqg+5+cn6E0WWZxhn3ZV8Qf62M1gQF6+lV
         THkA==
X-Gm-Message-State: AOAM530R4oZvl14hMqO0oREPqr8c77InAiEJ+tUdGMR83YzrBjsU8SKB
	el0WGVOT9D1eOumgX0ybqn69tP4BUlXxjA==
X-Google-Smtp-Source: ABdhPJwTfrzb9fERfXK28ycmomtnyX6s1/viu/AmSIMRHMupK9xAnIyo2wHhfFbfgmmsmT/wfOu81Q==
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id z3-20020a056870d68300b000deeaa23550mr2338878oap.253.1651601420400;
        Tue, 03 May 2022 11:10:20 -0700 (PDT)
X-Received: by 2002:a05:6808:d50:b0:322:fb1d:319d with SMTP id
 w16-20020a0568080d5000b00322fb1d319dmr2350498oik.174.1651601052906; Tue, 03
 May 2022 11:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224924.592546-1-gpiccoli@igalia.com> <20220427224924.592546-5-gpiccoli@igalia.com>
In-Reply-To: <20220427224924.592546-5-gpiccoli@igalia.com>
From: Evan Green <evgreen@chromium.org>
Date: Tue, 3 May 2022 11:03:37 -0700
X-Gmail-Original-Message-ID: <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
Message-ID: <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com, pmladek@suse.com, 
	kexec@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, 
	linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	Linux PM <linux-pm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
	netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	rcu@vger.kernel.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, 
	kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, 
	alejandro.j.jimenez@oracle.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>, d.hatayama@jp.fujitsu.com, 
	dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mikelley@microsoft.com, 
	hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de, 
	Kees Cook <keescook@chromium.org>, luto@kernel.org, mhiramat@kernel.org, 
	mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org, 
	rostedt@goodmis.org, senozhatsky@chromium.org, 
	Alan Stern <stern@rowland.harvard.edu>, Thomas Gleixner <tglx@linutronix.de>, vgoyal@redhat.com, 
	vkuznets@redhat.com, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	David Gow <davidgow@google.com>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 3:51 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Currently the gsmi driver registers a panic notifier as well as
> reboot and die notifiers. The callbacks registered are called in
> atomic and very limited context - for instance, panic disables
> preemption, local IRQs and all other CPUs that aren't running the
> current panic function.
>
> With that said, taking a spinlock in this scenario is a
> dangerous invitation for a deadlock scenario. So, we fix
> that in this commit by changing the regular spinlock with
> a trylock, which is a safer approach.
>
> Fixes: 74c5b31c6618 ("driver: Google EFI SMI")
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: David Gow <davidgow@google.com>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  drivers/firmware/google/gsmi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
> index adaa492c3d2d..b01ed02e4a87 100644
> --- a/drivers/firmware/google/gsmi.c
> +++ b/drivers/firmware/google/gsmi.c
> @@ -629,7 +629,10 @@ static int gsmi_shutdown_reason(int reason)
>         if (saved_reason & (1 << reason))
>                 return 0;
>
> -       spin_lock_irqsave(&gsmi_dev.lock, flags);
> +       if (!spin_trylock_irqsave(&gsmi_dev.lock, flags)) {
> +               rc = -EBUSY;
> +               goto out;
> +       }

gsmi_shutdown_reason() is a common function called in other scenarios
as well, like reboot and thermal trip, where it may still make sense
to wait to acquire a spinlock. Maybe we should add a parameter to
gsmi_shutdown_reason() so that you can get your change on panic, but
we don't convert other callbacks into try-fail scenarios causing us to
miss logs.

Though thinking more about it, is this really a Good Change (TM)? The
spinlock itself already disables interrupts, meaning the only case
where this change makes a difference is if the panic happens from
within the function that grabbed the spinlock (in which case the
callback is also likely to panic), or in an NMI that panics within
that window. The downside of this change is that if one core was
politely working through an event with the lock held, and another core
panics, we now might lose the panic log, even though it probably would
have gone through fine assuming the other core has a chance to
continue.

-Evan

