Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC43E1F0395
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 01:44:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhLzi-000699-VI; Fri, 05 Jun 2020 23:43:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RWBJ=7S=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jhLzi-000694-1v
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 23:43:26 +0000
X-Inumbo-ID: 58d78026-a786-11ea-96fb-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58d78026-a786-11ea-96fb-bc764e2007e4;
 Fri, 05 Jun 2020 23:43:24 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id e20so5608312qvu.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 16:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4oKka4He3nRW9OgSI9rsgItl0j6AS9IA/l25DC/YHdk=;
 b=el/2NraBp3xuQ6JOdeJKDO1SKrkNXv03TIU/cHSPGOLcoazpUqpDf/wmVxmhxU0iU2
 KZtd97gf7017uBaOEy+xsywUK1vtO3th7PAbITbYnEaXNnORJNgh5KeTUgj/uKhFMhbT
 wHe+V9zECrLlyet0r0MCfWXvJppdS2S4eKXCACdeKCsPJVSSP8593EQoNBdRqEwDKflV
 E1s4mk4olJiD4X8oC+ac7yaGxC8p4Z8uieT6zCSiGYU/QY36tPNITGbYIvcCEhHKd/UF
 ikycvLcUerd/7mc1RrW7dkja8z/+ryV3FDC74+xcv43Ycxvyki6kCSyfnpEwyD9cxlp1
 cTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4oKka4He3nRW9OgSI9rsgItl0j6AS9IA/l25DC/YHdk=;
 b=YTWoYaQ6AMf7fFJxBN9jRFsI9Z5RZe6Mc4JWYi7oWvI+LIbF0oSQIyTPyhTi+OFt5a
 5PaNoKXk3OkH5dw94OpxnABTaNN6qnr/zCn+IJ5M4fGhcf/1exPp5LSrtKJijNoQWRsZ
 HU8QN2txQ8cNHyqKQCBebsNG9JL22k2wS1jdxcgjOJZD4PTXd1jRU1T+uFvrr4RGyDo/
 r7NSU2THO3K66aPU6gxcUBdUyg2W0ikVSkYSzmVVdGZs3RqTaW/nHVFsgc9lYAB+PaII
 09LrTZvhTfzSrTqvt2t5SpTfykIAACikRKN6CujYqcr0jUKh29lzNPNWqgsfUn5FtZz6
 A9wg==
X-Gm-Message-State: AOAM530Xu0jJY4Kp2c6dT8f8Wt4ZFVqhuYSeK3Js2sSsNrELmI4D81/M
 zg1Qkp5a1g/Mo45cy0gWKPYOdotRh9VfFA8MuQBKLw==
X-Google-Smtp-Source: ABdhPJwcniVNNo4EhtxwgacSCSgMm1FVB40bFpT+gHMVg7J78OLLWTQWEeEthzFefXL4v9p7W1l9sY8GMXiVsPFue+A=
X-Received: by 2002:a05:6214:1c3:: with SMTP id
 c3mr12187299qvt.19.1591400604218; 
 Fri, 05 Jun 2020 16:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200605110240.52545-1-roger.pau@citrix.com>
In-Reply-To: <20200605110240.52545-1-roger.pau@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 5 Jun 2020 16:43:12 -0700
Message-ID: <CAMmSBy8=8tGwLgs+eMbrHcRbSahJHCpts7ODiK-cf-ZATfosxw@mail.gmail.com>
Subject: Re: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC for
 PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 5, 2020 at 4:03 AM Roger Pau Monne <roger.pau@citrix.com> wrote=
:
>
> Mediated access to the RTC was provided for PVHv1 dom0 using the PV
> code paths (guest_io_{write/read}), but those accesses where never
> implemented for PVHv2 dom0. This patch provides such mediated accesses
> to the RTC for PVH dom0, just like it's provided for a classic PV
> dom0.
>
> Pull out some of the RTC logic from guest_io_{read/write} into
> specific helpers that can be used by both PV and HVM guests. The
> setup of the handlers for PVH is done in rtc_init, which is already
> used to initialize the fully emulated RTC.
>
> Without this a Linux PVH dom0 will read garbage when trying to access
> the RTC, and one vCPU will be constantly looping in
> rtc_timer_do_work.
>
> Note that such issue doesn't happen on domUs because the ACPI
> NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> the RTC. Also the X86_EMU_RTC flag is not set for PVH dom0, as the
> accesses are not emulated but rather forwarded to the physical
> hardware.
>
> No functional change expected for classic PV dom0.

For the dense guys like me: what is the user-visible feature that is now be=
ing
offered with this? Would really appreciate a pointer or two.

Thanks,
Roman.

>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
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
>  xen/arch/x86/time.c               | 59 +++++++++++++++++++++++++++++++
>  xen/include/asm-x86/mc146818rtc.h |  3 ++
>  4 files changed, 100 insertions(+), 24 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index 5bbbdc0e0f..9f304a0fb4 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -22,6 +22,7 @@
>   * IN THE SOFTWARE.
>   */
>
> +#include <asm/iocap.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/hvm/vpt.h>
>  #include <asm/hvm/io.h>
> @@ -808,10 +809,43 @@ void rtc_reset(struct domain *d)
>      s->pt.source =3D PTSRC_isa;
>  }
>
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
> +        gdprintk(XENLOG_WARNING, "access to RTC port %x not allowed\n", =
port);
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
>
> +    if ( is_hardware_domain(d) )
> +    {
> +        /* Hardware domain gets mediated access to the physical RTC. */
> +        register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
> +        return;
> +    }
> +
>      if ( !has_vrtc(d) )
>          return;
>
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-o=
p.c
> index fad6c754ad..1597f27ed9 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -280,19 +280,10 @@ static uint32_t guest_io_read(unsigned int port, un=
signed int bytes,
>          {
>              sub_data =3D pv_pit_handler(port, 0, 0);
>          }
> -        else if ( port =3D=3D RTC_PORT(0) )
> -        {
> -            sub_data =3D currd->arch.cmos_idx;
> -        }
> -        else if ( (port =3D=3D RTC_PORT(1)) &&
> +        else if ( (port =3D=3D RTC_PORT(0) || port =3D=3D RTC_PORT(1)) &=
&
>                    ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(=
1)) )
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
> @@ -413,21 +404,10 @@ static void guest_io_write(unsigned int port, unsig=
ned int bytes,
>          {
>              pv_pit_handler(port, (uint8_t)data, 1);
>          }
> -        else if ( port =3D=3D RTC_PORT(0) )
> -        {
> -            currd->arch.cmos_idx =3D data;
> -        }
> -        else if ( (port =3D=3D RTC_PORT(1)) &&
> +        else if ( (port =3D=3D RTC_PORT(0) || port =3D=3D RTC_PORT(1)) &=
&
>                    ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(=
1)) )
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
>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec=
);
>  }
>
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
> diff --git a/xen/include/asm-x86/mc146818rtc.h b/xen/include/asm-x86/mc14=
6818rtc.h
> index 8758528f7c..803b236c0a 100644
> --- a/xen/include/asm-x86/mc146818rtc.h
> +++ b/xen/include/asm-x86/mc146818rtc.h
> @@ -110,4 +110,7 @@ outb_p((val),RTC_PORT(1)); \
>
>  #define RTC_IRQ 8
>
> +unsigned int rtc_guest_read(unsigned int port);
> +void rtc_guest_write(unsigned int port, unsigned int data);
> +
>  #endif /* _ASM_MC146818RTC_H */
> --
> 2.26.2
>
>

