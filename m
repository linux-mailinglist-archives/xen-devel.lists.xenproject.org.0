Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B81F1754
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:12:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiFht-0000Ua-Ag; Mon, 08 Jun 2020 11:12:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiFhs-0000UU-9t
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:12:44 +0000
X-Inumbo-ID: f91b7a94-a978-11ea-ba62-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f91b7a94-a978-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 11:12:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m21so13050948eds.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 04:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=xVNzWPEWtJn48LR3763BNFv9x8q3B7iB/H4BXfv98lk=;
 b=A2kGQ5V8hrHJtFzz8wgLEZbWB+OtQkHPXW2kvX2+AxzVyfwxI+kiTMNoywi/kEKC1J
 KvrrJY8xqXNAli7b/fmtbl0MZtzVZfO0ZGugyo8Qxix0UcIOupBA0tjdiuWFktKZWhD6
 qcQKRXx29eJOL6l98Lr6HxdyTlWVhRD9HhQvXKh5HxOhFcNjQvOo0JLswADh97HBmFhq
 dN0+0U5FLTR0+vNm0ZjTAWuBSlpfqPR8QIMDX+fS2mVfzgqocVGASHHIjDr3mNrptT7L
 l7I5LNMGkIkrlRFQYg/hIRTNcJuNqr63s4+VsFoaYemcSQbpRBDTTMdxEHvV6kPY7Wbo
 1ULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=xVNzWPEWtJn48LR3763BNFv9x8q3B7iB/H4BXfv98lk=;
 b=fbkUKg25m5PAORDtOJjPW8vaSOwqsvWDKhIyUGhV1hGFQhYLpFhrsT4DL8gIHJsNIQ
 3L8c/OdHM6qS4fEg3ITlE0mWrhI5WDgoPMfrtgYufxuE3Cr2Ke0zcOjz5zfXRdOtvmwh
 TX1XH95mtdQZ9RQGZkbHA/bOt7MhZ8DxiW3xX1/8D3gVmCwQpbrcHXS/rNm1vHWhZXjA
 rHjezDZDi60Q+UdXQ/hm0V6JO6WTvonAUIRq5wZGNxhvPjPHnPa/gAZGIWL7sofjI7xM
 c9nU8g8i/BrZ/hSLn/ds8UD4gtvDEhJUye5Q4QcdDn2HOsY3MEhOUcjwrd6fO2uMe7zS
 G76A==
X-Gm-Message-State: AOAM533K4sC6v0AIjSXe98wdIZmtcxPnMLv4FBYpZ5fhvyVU8yHgHAvm
 ceMy4xMePC00yGpmkNfX6f8=
X-Google-Smtp-Source: ABdhPJxpxNoZV56A0JtFGXhjMq2UGuWid1J7T9k2f5HnTjDDGt+MzPfSYe/QbOwmAejxbH/Z46L4aA==
X-Received: by 2002:a05:6402:897:: with SMTP id
 e23mr21799578edy.217.1591614762393; 
 Mon, 08 Jun 2020 04:12:42 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id q3sm6919125eds.0.2020.06.08.04.12.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 04:12:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200608102948.7327-1-roger.pau@citrix.com>
In-Reply-To: <20200608102948.7327-1-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14 v3] x86/rtc: provide mediated access to RTC for
 PVH dom0
Date: Mon, 8 Jun 2020 12:12:40 +0100
Message-ID: <002c01d63d85$ba36da30$2ea48e90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKSbMd9fsAVDk5Ayc3mrBjFSbfGhKdWMD5Q
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 08 June 2020 11:30
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14 v3] x86/rtc: provide mediated access to RTC =
for PVH dom0
>=20
> Mediated access to the RTC was provided for PVHv1 dom0 using the PV
> code paths (guest_io_{write/read}), but those accesses where never
> implemented for PVHv2 dom0. This patch provides such mediated accesses
> to the RTC for PVH dom0, just like it's provided for a classic PV
> dom0.
>=20
> Pull out some of the RTC logic from guest_io_{read/write} into
> specific helpers that can be used by both PV and HVM guests. The
> setup of the handlers for PVH is done in rtc_init, which is already
> used to initialize the fully emulated RTC.
>=20
> Without this a Linux PVH dom0 will read garbage when trying to access
> the RTC, and one vCPU will be constantly looping in
> rtc_timer_do_work.
>=20
> Note that such issue doesn't happen on domUs because the ACPI
> NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> the RTC. Also the X86_EMU_RTC flag is not set for PVH dom0, as the
> accesses are not emulated but rather forwarded to the physical
> hardware.
>=20
> No functional change expected for classic PV dom0.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> for-4.14 reasoning: the fix is mostly isolated to PVH dom0, and as
> such the risk is very low of causing issues to other guests types, but
> without this fix one vCPU when using a Linux dom0 will be constantly
> looping over rtc_timer_do_work with 100% CPU usage, at least when
> using Linux 4.19 or newer.
> ---
> Changes since v2:
>  - Move the access check into the read/write handler.
>  - Allow access to the latched first RTC port by all PV guests.
>  - Register the handlers for HVM native accesses if vRTC is disabled.
>=20
> Changes since v1:
>  - Share the code with PV.
>  - Add access checks to the IO ports.
> ---
>  xen/arch/x86/hvm/rtc.c            | 26 +++++++++++++
>  xen/arch/x86/pv/emul-priv-op.c    | 30 ++-------------
>  xen/arch/x86/time.c               | 62 =
+++++++++++++++++++++++++++++++
>  xen/include/asm-x86/mc146818rtc.h |  3 ++
>  4 files changed, 95 insertions(+), 26 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index 5bbbdc0e0f..3150f5f147 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -808,12 +808,38 @@ void rtc_reset(struct domain *d)
>      s->pt.source =3D PTSRC_isa;
>  }
>=20
> +/* RTC mediator for HVM hardware domain. */
> +static int hw_rtc_io(int dir, unsigned int port, unsigned int size,
> +                     uint32_t *val)
> +{
> +    if ( dir =3D=3D IOREQ_READ )
> +        *val =3D ~0;
> +
> +    if ( size !=3D 1 )
> +    {
> +        gdprintk(XENLOG_WARNING, "bad RTC access size (%u)\n", size);
> +        return X86EMUL_OKAY;
> +    }
> +
> +    if ( dir =3D=3D IOREQ_WRITE )
> +        rtc_guest_write(port, *val);
> +    else
> +        *val =3D rtc_guest_read(port);
> +
> +    return X86EMUL_OKAY;
> +}
> +
>  void rtc_init(struct domain *d)
>  {
>      RTCState *s =3D domain_vrtc(d);
>=20
>      if ( !has_vrtc(d) )
> +    {
> +        if ( is_hardware_domain(d) )
> +            /* Hardware domain gets mediated access to the physical =
RTC. */
> +            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
>          return;
> +    }
>=20
>      spin_lock_init(&s->lock);
>=20
> diff --git a/xen/arch/x86/pv/emul-priv-op.c =
b/xen/arch/x86/pv/emul-priv-op.c
> index fad6c754ad..2cedaab6b9 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -280,19 +280,9 @@ static uint32_t guest_io_read(unsigned int port, =
unsigned int bytes,
>          {
>              sub_data =3D pv_pit_handler(port, 0, 0);
>          }
> -        else if ( port =3D=3D RTC_PORT(0) )
> +        else if ( (port =3D=3D RTC_PORT(0) || port =3D=3D =
RTC_PORT(1)) )
>          {
> -            sub_data =3D currd->arch.cmos_idx;
> -        }
> -        else if ( (port =3D=3D RTC_PORT(1)) &&
> -                  ioports_access_permitted(currd, RTC_PORT(0), =
RTC_PORT(1)) )
> -        {
> -            unsigned long flags;
> -
> -            spin_lock_irqsave(&rtc_lock, flags);
> -            outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> -            sub_data =3D inb(RTC_PORT(1));
> -            spin_unlock_irqrestore(&rtc_lock, flags);
> +            sub_data =3D rtc_guest_read(port);
>          }
>          else if ( (port =3D=3D 0xcf8) && (bytes =3D=3D 4) )
>          {
> @@ -413,21 +403,9 @@ static void guest_io_write(unsigned int port, =
unsigned int bytes,
>          {
>              pv_pit_handler(port, (uint8_t)data, 1);
>          }
> -        else if ( port =3D=3D RTC_PORT(0) )
> -        {
> -            currd->arch.cmos_idx =3D data;
> -        }
> -        else if ( (port =3D=3D RTC_PORT(1)) &&
> -                  ioports_access_permitted(currd, RTC_PORT(0), =
RTC_PORT(1)) )
> +        else if ( (port =3D=3D RTC_PORT(0) || port =3D=3D =
RTC_PORT(1)) )
>          {
> -            unsigned long flags;
> -
> -            if ( pv_rtc_handler )
> -                pv_rtc_handler(currd->arch.cmos_idx & 0x7f, data);
> -            spin_lock_irqsave(&rtc_lock, flags);
> -            outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> -            outb(data, RTC_PORT(1));
> -            spin_unlock_irqrestore(&rtc_lock, flags);
> +            rtc_guest_write(port, data);
>          }
>          else if ( (port =3D=3D 0xcf8) && (bytes =3D=3D 4) )
>          {
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index bbaea3aa65..9863108f41 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -27,6 +27,7 @@
>  #include <xen/keyhandler.h>
>  #include <xen/guest_access.h>
>  #include <asm/io.h>
> +#include <asm/iocap.h>
>  #include <asm/msr.h>
>  #include <asm/mpspec.h>
>  #include <asm/processor.h>
> @@ -1110,6 +1111,67 @@ static unsigned long get_cmos_time(void)
>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, =
rtc.sec);
>  }
>=20
> +/* Helpers for guest accesses to the physical RTC. */
> +unsigned int rtc_guest_read(unsigned int port)
> +{
> +    const struct domain *currd =3D current->domain;
> +    unsigned long flags;
> +    unsigned int data =3D ~0;
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +        /*
> +         * All PV domains are allowed to read the latched value of =
the first
> +         * RTC port. This is useful in order to store data when =
debugging.
> +         */

Is this comment correct. AFAICT your call to register_portio_handler() =
would allow a PVH dom0 to access this too.

> +        data =3D currd->arch.cmos_idx;
> +        break;
> +
> +    case RTC_PORT(1):
> +        if ( !ioports_access_permitted(currd, RTC_PORT(0), =
RTC_PORT(1)) )

Why RTC_PORT(0) (and not RC_PORT(1)) as base here?

Same queries for the write function.

  Paul

> +            break;
> +        spin_lock_irqsave(&rtc_lock, flags);
> +        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +        data =3D inb(RTC_PORT(1));
> +        spin_unlock_irqrestore(&rtc_lock, flags);
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +
> +    return data;
> +}
> +
> +void rtc_guest_write(unsigned int port, unsigned int data)
> +{
> +    struct domain *currd =3D current->domain;
> +    unsigned long flags;
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +        /*
> +         * All PV domains are allowed to write to the latched value =
of the
> +         * first RTC port. This is useful in order to store data when
> +         * debugging.
> +         */
> +        currd->arch.cmos_idx =3D data;
> +        break;
> +
> +    case RTC_PORT(1):
> +        if ( !ioports_access_permitted(currd, RTC_PORT(0), =
RTC_PORT(1)) )
> +            break;
> +        spin_lock_irqsave(&rtc_lock, flags);
> +        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +        outb(data, RTC_PORT(1));
> +        spin_unlock_irqrestore(&rtc_lock, flags);
> +        break;
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +}
> +
>  static unsigned long get_wallclock_time(void)
>  {
>  #ifdef CONFIG_XEN_GUEST
> diff --git a/xen/include/asm-x86/mc146818rtc.h =
b/xen/include/asm-x86/mc146818rtc.h
> index 8758528f7c..803b236c0a 100644
> --- a/xen/include/asm-x86/mc146818rtc.h
> +++ b/xen/include/asm-x86/mc146818rtc.h
> @@ -110,4 +110,7 @@ outb_p((val),RTC_PORT(1)); \
>=20
>  #define RTC_IRQ 8
>=20
> +unsigned int rtc_guest_read(unsigned int port);
> +void rtc_guest_write(unsigned int port, unsigned int data);
> +
>  #endif /* _ASM_MC146818RTC_H */
> --
> 2.26.2



