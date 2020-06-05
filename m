Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED56E1EF6E4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:57:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhAyh-0001PJ-V3; Fri, 05 Jun 2020 11:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhAyg-0001PE-8W
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:57:38 +0000
X-Inumbo-ID: bf8e9fce-a723-11ea-ba62-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf8e9fce-a723-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 11:57:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r9so8176464wmh.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=/Z3IiW4Dj+Tgq0+EAhnruPPTjwya0rgFqiypjw0GVPk=;
 b=EvpctvPPcTlUBgxjXtKAkel+uxUrQ4y9ICz6HP7MfG7P9Avj7YGY+EtycnXSVpUO72
 gx5bg8fxhFqL58uBgvX/1jUPRQS+jzNsQPYZHR7VZF17wDX5fNfQGJOlVCrXHx56TI4u
 Y5REPTMPrFu9anN16bJPa4kjBd1itRHdFaqoE2rl9Oc3ULLOjEAq5lGfuX43FoJvJQBk
 gvQH6/3Wk4ALHmpklWAiXgBrmp5xq5MEZRU6FQiozuTNvXN08NJOH7ROplE0lHLm96dQ
 b29TVSPbG1ercEt1rc73+MXWbzFcw8oB0tdBOF0yu6yn8gTojBij6b3wM/4KWJpllET8
 0BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=/Z3IiW4Dj+Tgq0+EAhnruPPTjwya0rgFqiypjw0GVPk=;
 b=tx9GbYX6sJNIHUHh/Hzpu41Q3vxPTp9AisbCyA3CFZP7wVitrcxhI6cHvvMPMtzkXv
 cIv7cV+VTDlfZOOGbhvGgZy4w2aNczlMd/YcFuang0Hu52c/rcF6PT9DXhYwz7TvWe0B
 M0pl0MDcmiYkHItKWTaZjHbSwj8Nc811CrtPNKjjiDGdnP4ABvupSQ8q7jG9jMT2kQZy
 9yXobVtvxKIIIbl2EdkzhzkznS6z0wcxBEAFYmZgi4ET3fmBcqCkDBX02wRJPJyOgmzQ
 75zwXFzkdZxnPpCk0ty8SxbHFYCI+YSoRKP5+SSKZ39p1wgF8feQ4jLLZcEVX/5072nS
 P17Q==
X-Gm-Message-State: AOAM531C7293nQ1fZx7NrioaJfWAe/8fmdUMWFgONdO+h/7b4UPApSsi
 ExH2FgHbRb+ECxTnxb9hUR4=
X-Google-Smtp-Source: ABdhPJxM67AMJEzfD0cpU7FdnjtAdgsVWOvElYNcBxc1ppRbzGCeTxQGm1M5agGrLufD30Kjb5l3tg==
X-Received: by 2002:a1c:6a1a:: with SMTP id f26mr2449090wmc.80.1591358256354; 
 Fri, 05 Jun 2020 04:57:36 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id x66sm11488392wmb.40.2020.06.05.04.57.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 04:57:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200605110240.52545-1-roger.pau@citrix.com>
In-Reply-To: <20200605110240.52545-1-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC for
 PVH dom0
Date: Fri, 5 Jun 2020 12:57:34 +0100
Message-ID: <000801d63b30$8099f250$81cdd6f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH6D0FLdGtfhWalmvEJkq2BGOkEaaiCQlbg
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
> Sent: 05 June 2020 12:03
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC =
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

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> for-4.14 reasoning: the fix is mostly isolated to PVH dom0, and as
> such the risk is very low of causing issues to other guests types, but
> without this fix one vCPU when using a Linux dom0 will be constantly
> looping over rtc_timer_do_work with 100% CPU usage, at least when
> using Linux 4.19 or newer.
> ---
> Changes since v1:
>  - Share the code with PV.
>  - Add access checks to the IO ports.
> ---
>  xen/arch/x86/hvm/rtc.c            | 34 ++++++++++++++++++
>  xen/arch/x86/pv/emul-priv-op.c    | 28 +++------------
>  xen/arch/x86/time.c               | 59 =
+++++++++++++++++++++++++++++++
>  xen/include/asm-x86/mc146818rtc.h |  3 ++
>  4 files changed, 100 insertions(+), 24 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index 5bbbdc0e0f..9f304a0fb4 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -22,6 +22,7 @@
>   * IN THE SOFTWARE.
>   */
>=20
> +#include <asm/iocap.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/hvm/vpt.h>
>  #include <asm/hvm/io.h>
> @@ -808,10 +809,43 @@ void rtc_reset(struct domain *d)
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
> +    if ( !ioports_access_permitted(current->domain, port, port) )
> +    {
> +        gdprintk(XENLOG_WARNING, "access to RTC port %x not =
allowed\n", port);
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
> +    if ( is_hardware_domain(d) )
> +    {
> +        /* Hardware domain gets mediated access to the physical RTC. =
*/
> +        register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
> +        return;
> +    }
> +
>      if ( !has_vrtc(d) )
>          return;
>=20
> diff --git a/xen/arch/x86/pv/emul-priv-op.c =
b/xen/arch/x86/pv/emul-priv-op.c
> index fad6c754ad..1597f27ed9 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -280,19 +280,10 @@ static uint32_t guest_io_read(unsigned int port, =
unsigned int bytes,
>          {
>              sub_data =3D pv_pit_handler(port, 0, 0);
>          }
> -        else if ( port =3D=3D RTC_PORT(0) )
> -        {
> -            sub_data =3D currd->arch.cmos_idx;
> -        }
> -        else if ( (port =3D=3D RTC_PORT(1)) &&
> +        else if ( (port =3D=3D RTC_PORT(0) || port =3D=3D =
RTC_PORT(1)) &&
>                    ioports_access_permitted(currd, RTC_PORT(0), =
RTC_PORT(1)) )
>          {
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
> @@ -413,21 +404,10 @@ static void guest_io_write(unsigned int port, =
unsigned int bytes,
>          {
>              pv_pit_handler(port, (uint8_t)data, 1);
>          }
> -        else if ( port =3D=3D RTC_PORT(0) )
> -        {
> -            currd->arch.cmos_idx =3D data;
> -        }
> -        else if ( (port =3D=3D RTC_PORT(1)) &&
> +        else if ( (port =3D=3D RTC_PORT(0) || port =3D=3D =
RTC_PORT(1)) &&
>                    ioports_access_permitted(currd, RTC_PORT(0), =
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
> index bbaea3aa65..e1c81067ce 100644
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
> @@ -1110,6 +1111,64 @@ static unsigned long get_cmos_time(void)
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
> +    ASSERT(port =3D=3D RTC_PORT(0) || port =3D=3D RTC_PORT(1));
> +    if ( !ioports_access_permitted(currd, port, port) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return data;
> +    }
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +        data =3D currd->arch.cmos_idx;
> +        break;
> +
> +    case RTC_PORT(1):
> +        spin_lock_irqsave(&rtc_lock, flags);
> +        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +        data =3D inb(RTC_PORT(1));
> +        spin_unlock_irqrestore(&rtc_lock, flags);
> +        break;
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
> +    ASSERT(port =3D=3D RTC_PORT(0) || port =3D=3D RTC_PORT(1));
> +    if ( !ioports_access_permitted(currd, port, port) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return;
> +    }
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +        currd->arch.cmos_idx =3D data;
> +        break;
> +
> +    case RTC_PORT(1):
> +        spin_lock_irqsave(&rtc_lock, flags);
> +        outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +        outb(data, RTC_PORT(1));
> +        spin_unlock_irqrestore(&rtc_lock, flags);
> +        break;
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



