Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2C2EF3EB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 15:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63491.112704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxsmZ-0005Qy-Po; Fri, 08 Jan 2021 14:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63491.112704; Fri, 08 Jan 2021 14:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxsmZ-0005QZ-Mm; Fri, 08 Jan 2021 14:30:27 +0000
Received: by outflank-mailman (input) for mailman id 63491;
 Fri, 08 Jan 2021 14:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZn8=GL=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kxsmX-0005QU-Tq
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 14:30:26 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1cb7ace-5dff-4294-b857-8e93a3e6c176;
 Fri, 08 Jan 2021 14:30:24 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m12so23347600lfo.7
 for <xen-devel@lists.xenproject.org>; Fri, 08 Jan 2021 06:30:24 -0800 (PST)
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
X-Inumbo-ID: c1cb7ace-5dff-4294-b857-8e93a3e6c176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E0aZcL1+IO4NWkayB3XOgbKM1v4lsu1rrsCRhiHQMCY=;
        b=s18gofETGnX+4f+i5raNbDXxJt9aFQJhmGS8NkSZpqUdYiDi9NYmRSqFhaBps7nb4O
         Y9iwDBkhWSpYvizbF5Uq3zXNb0JmPltPqC5musRMAi0qb/E0A9J9vepNxzkzjZdNQksu
         ItxJQTz5D8wuo/TpnhY6NXRjvEDlF18pPAiRrx2VOEx4+8gdjB01GI/R2Cj4g4fUsJh6
         fPyDa0okhxanHFdMvjGIuJ6DJmXWPglQaq4+wiMLuKhlXrnC+kFmNWrnc1ZDPwDoRdum
         sgz0z0e1BZMITVagd6QmPjDloswh24EpHeVJNDICaxUscVzo/vj0TyHJlaKeuziaObF3
         8+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E0aZcL1+IO4NWkayB3XOgbKM1v4lsu1rrsCRhiHQMCY=;
        b=otrtOYIgDqjwLVXehdbWvAAB+I7uIYn6Rrtqj0vtD3pJvTlk5JuxFIEkKzYCPReeCw
         idVcS0J24lepHkD5aLEBrOf8cTWuP9mSuVSdPxGrOlAqpxwaAf2AVR2O85kloQDpM3Kq
         bvp83hwYbi3zRr1KNK4s6ANtiBPBCnmlOSNsBDf5j8B/OloGmaYHQuCGPXBMcQ0Lnuvb
         HvU7YBgzqj/LX1rgfLM59pzuYpTx8SXAeSH/qioxZQqhOIY72vo3AcytZ7SmsK1qkGVL
         S0v4baSS7aMZDGmvAQPDFJdlLFk0xw2U+C36d+317q6zE4zkYcosTe8tKBjsnvJX37k+
         OrJw==
X-Gm-Message-State: AOAM533nvvizC66Hh/AFILSitR8zixj7h5QfOOoyQ/WBV/nr71jjJXkP
	i0d9rNsNvOwbcw7oaNLEGlqawrY/pPTnOEpFpME=
X-Google-Smtp-Source: ABdhPJz8PtSulgpZst8oLs9SmR1R6NNNrxxAQrlAbRnd/wlWA7+jcztRfbzz6hi/mWFtU6ZqfYPFFHhq5yDyyLDfGCc=
X-Received: by 2002:a19:675d:: with SMTP id e29mr1617884lfj.491.1610116223491;
 Fri, 08 Jan 2021 06:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20210107010625.5993-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210107010625.5993-1-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 8 Jan 2021 09:30:12 -0500
Message-ID: <CAKf6xpu+5o2v43+kpzjyntt1i3NUKHGe81Z41jbEFVhStZTy7Q@mail.gmail.com>
Subject: Re: [PATCH] x86/timer: Fix boot on Intel systems using ITSSPRC static
 PIT clock gating
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Aaron Janse <aaron@ajanse.me>, Ondrej Balaz <blami@blami.net>, Tamas K Lengyel <tamas@tklengyel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 6, 2021 at 8:06 PM Andrew Cooper <andrew.cooper3@citrix.com> wr=
ote:
>
> Recent Intel client devices have disabled the legacy PIT for powersaving
> reasons, breaking compatibility with a traditional IBM PC.  Xen depends o=
n a
> legacy timer interrupt to check that the IO-APIC/PIC routing is configure=
d
> correctly, and fails to boot with:
>
>   (XEN) *******************************
>   (XEN) Panic on CPU 0:
>   (XEN) IO-APIC + timer doesn't work!  Boot with apic_verbosity=3Ddebug a=
nd send report.  Then try booting with the `noapic` option
>   (XEN) *******************************
>
> While this setting can be undone by Xen, the details of how to differ by
> chipset, and would be very short sighted for battery based devices.  See =
bit 2
> "8254 Static Clock Gating Enable" in:
>
>   https://edc.intel.com/content/www/us/en/design/products-and-solutions/p=
rocessors-and-chipsets/comet-lake-u/intel-400-series-chipset-on-package-pla=
tform-controller-hub-register-database/itss-power-reduction-control-itssprc=
-offset-3300/
>
> All impacted systems have an HPET, but there is no indication of the abse=
nce
> of PIT functionality, nor a suitable way to probe for its absence.  As a =
short
> term fix, reconfigure the HPET into legacy replacement mode.  A better
> longterm fix would be to avoid the reliance on the timer interrupt entire=
ly.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>

On the Dell 7200 that couldn't boot without Xen modification, but with
a build fix below.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Aaron Janse <aaron@ajanse.me>
> CC: Jason Andryuk <jandryuk@gmail.com>
> CC: Ondrej Balaz <blami@blami.net>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>
> Slightly RFC.  On older platforms this does generate some spurious PIC
> interrupts during boot, but they're benign.  I was hoping to have time to=
 fix
> those too, but I'm getting an increasing number of requests to post this
> patch.

Spurious being the timer interrupt is now running?  In my local
patches, I have a function clear HPET_CFG_LEGACY after check_timer():

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e98e08e9c8..b62dea190a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2047,6 +2048,7 @@ void __init setup_IO_APIC(void)
     setup_IO_APIC_irqs();
     init_IO_APIC_traps();
     check_timer();
+    hpet_disable_legacy();
     print_IO_APIC();
     ioapic_pm_state_alloc();

> Other followup actions:
>  * Overhaul our setup logic.  Large quantities of it is legacy for pre-64=
bit
>    systems, and not applicable to Xen these days.
>  * Have Xen turn the PIT off when it isn't being used as the timesource. =
 Its
>    a waste of time servicing useless interrupts.
>  * Make `clocksource=3Dpit` not enter an infinite loop on these systems
>  * Drop all references to `noapic`.  These days, the only thing it will e=
ver
>    do is make a bad situation worse.
> ---
>  xen/arch/x86/hpet.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> index e6fab8acd8..f9541af537 100644
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c

<snip>

> +        /*
> +         * The exact period doesn't have to match a legacy PIT.  All we =
need
> +         * is an interrupt queued up via the IO-APIC to check routing.
> +         *
> +         * Use HZ as the frequency.
> +         */
> +        ticks =3D (SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32))=
 >> 32;

hpet.c: In function =E2=80=98hpet_setup=E2=80=99:
hpet.c:828:70: error: expected =E2=80=98;=E2=80=99 before =E2=80=98)=E2=80=
=99 token
  828 |   ticks =3D (SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) =
>> 32;

Missing an additional leading '('
ticks =3D ((SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;

Thanks,
Jason

