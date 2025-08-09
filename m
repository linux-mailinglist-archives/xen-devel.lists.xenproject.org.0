Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B3B1F72A
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 01:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076376.1437974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uksah-0006hL-Nx; Sat, 09 Aug 2025 23:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076376.1437974; Sat, 09 Aug 2025 23:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uksah-0006fq-Kl; Sat, 09 Aug 2025 23:03:07 +0000
Received: by outflank-mailman (input) for mailman id 1076376;
 Sat, 09 Aug 2025 23:03:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jH7k=2V=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1uksah-0006fJ-53
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 23:03:07 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0112c7f8-7575-11f0-b898-0df219b8e170;
 Sun, 10 Aug 2025 01:03:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3016245CB4
 for <xen-devel@lists.xenproject.org>; Sat,  9 Aug 2025 23:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D429C4CEF8
 for <xen-devel@lists.xenproject.org>; Sat,  9 Aug 2025 23:03:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3323b99094fso27909031fa.0
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 16:03:02 -0700 (PDT)
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
X-Inumbo-ID: 0112c7f8-7575-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754780583;
	bh=st/eweHiwV92mUXCvAGpIiPGkvX3rErOBfHnwy2GSps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NhkQpTou8reSM51IS+2E4WNb4pJgZFOq/hiUQIN0TiElPNcMp+LS6vjXxnv71d4GX
	 CZ8daBgABogz2YQMbScCOF/d8NbeFW758Rd7zV2ByVOhKuIt2kltfkzhwnHxif1Tm3
	 9VQYogOHuqRGA+YDMuekUicwZt+o5UA5FCbCY72jizCTMxVBRyJyfTrP9oh0MGmZAQ
	 N2g5GZu8o3juqPBxT6HV374BnxqpEcyNfGmE1jlFN7gDhQzD2Qsv20tH/QBo+X9vRE
	 9t/LN5bDUAIJ4uIwGiW0lkf2p8zzdxxw28/w7CukWqdthBfNDALjDtlGDEGzwidSC5
	 bfV52PDqTIPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWomncXOWwigfuHOV5zQBsO52QEaLL1+Jg1NVX4tdAwKJ2hVlrrlcSRQ3TcEv/INelR1iFiy5NizxI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvjzJOundgbMXaWyUdb2sknLw1GAQi1qhlJmT8mlihNse7tutJ
	zlCGGQPEK5CNQtLyYG8qq1Fg7CqU6RA6CecrjLnKDsqtJPR1217ZOcUoS5dBaE6Z/gxhEtkQDUz
	MKYOiAsGqzt51rNxL0b5SJTgKMQj3k60=
X-Google-Smtp-Source: AGHT+IHacj93S4TAyJS2Y33dq5fDEf3fw3H8pVieqGYKOrts0lqIXyoZID+Z9tXd8YeI87NlNCl9WjBC2eK/6u6auvE=
X-Received: by 2002:a05:651c:3799:b0:32a:7270:5c29 with SMTP id
 38308e7fff4ca-333a213e262mr13218821fa.2.1754780581250; Sat, 09 Aug 2025
 16:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-6-ardb+git@google.com>
 <20250803010449df1f5cfb@mail.local>
In-Reply-To: <20250803010449df1f5cfb@mail.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 10 Aug 2025 09:02:49 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGQyLXwk9Bq24xhPPsB1nO9RcSkvh=0p8aNP=Q=Az8V7w@mail.gmail.com>
X-Gm-Features: Ac12FXyxSfM9EC_oe23LQ4fW6u1l84sRZB4iGnVNSBFl1E9opWCoKNhC-oXMcUQ
Message-ID: <CAMj1kXGQyLXwk9Bq24xhPPsB1nO9RcSkvh=0p8aNP=Q=Az8V7w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Aug 2025 at 11:05, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> Apart from the topic that should be "rtc: efi:...", I'm ready to apply
> this patch.
>

Thanks, please go ahead.

> On 14/07/2025 08:08:45+0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The EFI rtc driver is used by non-x86 architectures only, and exposes
> > the get/set wakeup time functionality provided by the underlying
> > platform. This is usually broken on most platforms, and not widely used
> > to begin with [if at all], so let's just remove it.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  drivers/rtc/rtc-efi.c | 76 +-------------------
> >  1 file changed, 2 insertions(+), 74 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
> > index fa8bf82df948..b4f44999ef0f 100644
> > --- a/drivers/rtc/rtc-efi.c
> > +++ b/drivers/rtc/rtc-efi.c
> > @@ -112,48 +112,6 @@ convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
> >       return true;
> >  }
> >
> > -static int efi_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> > -{
> > -     efi_time_t eft;
> > -     efi_status_t status;
> > -
> > -     /*
> > -      * As of EFI v1.10, this call always returns an unsupported status
> > -      */
> > -     status = efi.get_wakeup_time((efi_bool_t *)&wkalrm->enabled,
> > -                                  (efi_bool_t *)&wkalrm->pending, &eft);
> > -
> > -     if (status != EFI_SUCCESS)
> > -             return -EINVAL;
> > -
> > -     if (!convert_from_efi_time(&eft, &wkalrm->time))
> > -             return -EIO;
> > -
> > -     return rtc_valid_tm(&wkalrm->time);
> > -}
> > -
> > -static int efi_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> > -{
> > -     efi_time_t eft;
> > -     efi_status_t status;
> > -
> > -     convert_to_efi_time(&wkalrm->time, &eft);
> > -
> > -     /*
> > -      * XXX Fixme:
> > -      * As of EFI 0.92 with the firmware I have on my
> > -      * machine this call does not seem to work quite
> > -      * right
> > -      *
> > -      * As of v1.10, this call always returns an unsupported status
> > -      */
> > -     status = efi.set_wakeup_time((efi_bool_t)wkalrm->enabled, &eft);
> > -
> > -     dev_warn(dev, "write status is %d\n", (int)status);
> > -
> > -     return status == EFI_SUCCESS ? 0 : -EINVAL;
> > -}
> > -
> >  static int efi_read_time(struct device *dev, struct rtc_time *tm)
> >  {
> >       efi_status_t status;
> > @@ -188,17 +146,13 @@ static int efi_set_time(struct device *dev, struct rtc_time *tm)
> >
> >  static int efi_procfs(struct device *dev, struct seq_file *seq)
> >  {
> > -     efi_time_t        eft, alm;
> > +     efi_time_t        eft;
> >       efi_time_cap_t    cap;
> > -     efi_bool_t        enabled, pending;
> > -     struct rtc_device *rtc = dev_get_drvdata(dev);
> >
> >       memset(&eft, 0, sizeof(eft));
> > -     memset(&alm, 0, sizeof(alm));
> >       memset(&cap, 0, sizeof(cap));
> >
> >       efi.get_time(&eft, &cap);
> > -     efi.get_wakeup_time(&enabled, &pending, &alm);
> >
> >       seq_printf(seq,
> >                  "Time\t\t: %u:%u:%u.%09u\n"
> > @@ -214,26 +168,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
> >               /* XXX fixme: convert to string? */
> >               seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
> >
> > -     if (test_bit(RTC_FEATURE_ALARM, rtc->features)) {
> > -             seq_printf(seq,
> > -                        "Alarm Time\t: %u:%u:%u.%09u\n"
> > -                        "Alarm Date\t: %u-%u-%u\n"
> > -                        "Alarm Daylight\t: %u\n"
> > -                        "Enabled\t\t: %s\n"
> > -                        "Pending\t\t: %s\n",
> > -                        alm.hour, alm.minute, alm.second, alm.nanosecond,
> > -                        alm.year, alm.month, alm.day,
> > -                        alm.daylight,
> > -                        enabled == 1 ? "yes" : "no",
> > -                        pending == 1 ? "yes" : "no");
> > -
> > -             if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
> > -                     seq_puts(seq, "Timezone\t: unspecified\n");
> > -             else
> > -                     /* XXX fixme: convert to string? */
> > -                     seq_printf(seq, "Timezone\t: %u\n", alm.timezone);
> > -     }
> > -
> >       /*
> >        * now prints the capabilities
> >        */
> > @@ -249,8 +183,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
> >  static const struct rtc_class_ops efi_rtc_ops = {
> >       .read_time      = efi_read_time,
> >       .set_time       = efi_set_time,
> > -     .read_alarm     = efi_read_alarm,
> > -     .set_alarm      = efi_set_alarm,
> >       .proc           = efi_procfs,
> >  };
> >
> > @@ -271,11 +203,7 @@ static int __init efi_rtc_probe(struct platform_device *dev)
> >       platform_set_drvdata(dev, rtc);
> >
> >       rtc->ops = &efi_rtc_ops;
> > -     clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> > -     if (efi_rt_services_supported(EFI_RT_SUPPORTED_WAKEUP_SERVICES))
> > -             set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->features);
> > -     else
> > -             clear_bit(RTC_FEATURE_ALARM, rtc->features);
> > +     clear_bit(RTC_FEATURE_ALARM, rtc->features);
> >
> >       device_init_wakeup(&dev->dev, true);
> >
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

