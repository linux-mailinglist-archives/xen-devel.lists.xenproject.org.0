Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50171EF2AE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 10:03:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh7Js-0002ro-Ew; Fri, 05 Jun 2020 08:03:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jh7Jr-0002ri-Fo
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 08:03:15 +0000
X-Inumbo-ID: 01afb58a-a703-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01afb58a-a703-11ea-9dbe-bc764e2007e4;
 Fri, 05 Jun 2020 08:03:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h5so8735000wrc.7
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=IJW0YoI83OHwBJp1AzrB9MzmLzqcr4fHNqYiyV3R2Zc=;
 b=FjvYfeTYZUgBrL17MzC/o1MtAP6p9qgHOZ9El4CRyy7ncDi3eMQvyJPX8qZCWwy+jd
 0swAtfRsGIa81CNCR0B9zLfGpUs0GDE75YotEh0K+n0yQHwPwOT7aneEUqtv4Lem1nOy
 zmTJ+fDJqJ9LIIKLcRKBA718ouuwAicTPJgX6/Nq51pluSkINikQnMWwQUl0X9VXd8RP
 FdlLvAvtwgB8TTY6+c/c5FkXNVxEHbIGfegm+TzqwNw0dpQ1U4fvtPhrPeUBneKuNc+x
 9lvZ7AKDQ4/8r0PevwbZBLLh8BSMvu7hNJY2zm440rCy4T2RO81E8dNGP3ghU61tsNjp
 Hkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=IJW0YoI83OHwBJp1AzrB9MzmLzqcr4fHNqYiyV3R2Zc=;
 b=YvWk6+oIi282CiNfjarPLly1i1WdZ+AWozlCUU60iNAjwBwXPbGPdqgVU8Gwwuln28
 4NSWcCZpaQuPY4fvzXcQjFoBlRk0vEtl6gthj+W1iz4YoNQndsP/hbqedvcQSOFsSsGx
 2gWFCccCPUhbmV1sWOz+XhYBRojd/rVDvOSCXLSUznLXmeGHPpQZ4gYuZmD/ixZwVCET
 f/iD0QsiyUNPMhiXXdNrA7jgcueWPf5rHmuTKCiUE5MzJk4+1zLFIs+ytX/RLR4AKvEN
 Ka7Nzy7kEBxe0fTgrGVD2a4sI7Nm9/ZAiKZD4YsMc5G/juUxbWmZt2xyT4PuSvnqSI5V
 7XJQ==
X-Gm-Message-State: AOAM533jYBzaumJ26HWXhWpnSG0uLtxGQhWlBoTY3gYnz89a/COGC7XW
 2296hJg+/evlzxcPALyDB1Q=
X-Google-Smtp-Source: ABdhPJwVYPE0FOLcYVycEOHbiW4fDC4tBYMJDwn0aILQM+STcDyBuckCweyVguaPg0Rcps4dlaW/dw==
X-Received: by 2002:a05:6000:120b:: with SMTP id
 e11mr8324881wrx.107.1591344193978; 
 Fri, 05 Jun 2020 01:03:13 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id 138sm10815915wma.23.2020.06.05.01.03.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 01:03:13 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200605075006.51238-1-roger.pau@citrix.com>
In-Reply-To: <20200605075006.51238-1-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH
 dom0
Date: Fri, 5 Jun 2020 09:03:11 +0100
Message-ID: <000201d63b0f$c2d27910$48776b30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFb0qjaKgty6gtStLgr1bY9c1VYP6m+eZUA
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
> Sent: 05 June 2020 08:50
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for =
PVH dom0
>=20
> At some point (maybe PVHv1?) mediated access to the RTC was provided
> for PVH dom0 using the PV code paths (guest_io_{write/read}). At some
> point this code has been made PV specific and unhooked from the
> current PVH IO path. This patch provides such mediated access to the
> RTC for PVH dom0, just like it's provided for a classic PV dom0.
>=20
> Instead of re-using the PV paths implement such handler together with
> the vRTC code for HVM, so that calling rtc_init will setup the
> appropriate handlers for all HVM based guests.
>=20
> Without this a Linux PVH dom0 will read garbage when trying to access
> the RTC, and one vCPU will be constantly looping in
> rtc_timer_do_work.
>=20
> Note that such issue doesn't happen on domUs because the ACPI
> NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> the RTC.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> for-4.14 reasoning: the fix is completely isolated to PVH dom0, and as
> such the risk is very low of causing issues to other guests types, but
> without this fix one vCPU when using a Linux dom0 will be constantly
> looping over rtc_timer_do_work with 100% CPU usage, at least when
> using Linux 4.19 or newer.
> ---

I can't say I'm a big fan of the code duplication with emul-priv-op.c, =
but it's not much code and it does keep this patch small. If the =
maintainers are happy to ack then consider this...

Release-acked-by: Paul Durrant <paul@xen.org>

>  xen/arch/x86/hvm/rtc.c | 69 =
++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>=20
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index 5bbbdc0e0f..5d637cf018 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -808,10 +808,79 @@ void rtc_reset(struct domain *d)
>      s->pt.source =3D PTSRC_isa;
>  }
>=20
> +/* RTC mediator for HVM hardware domain. */
> +static unsigned int hw_read(unsigned int port)
> +{
> +    const struct domain *currd =3D current->domain;
> +    unsigned long flags;
> +    unsigned int data =3D 0;
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +          data =3D currd->arch.cmos_idx;
> +          break;
> +
> +    case RTC_PORT(1):
> +          spin_lock_irqsave(&rtc_lock, flags);
> +          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +          data =3D inb(RTC_PORT(1));
> +          spin_unlock_irqrestore(&rtc_lock, flags);
> +          break;
> +    }
> +
> +    return data;
> +}
> +
> +static void hw_write(unsigned int port, unsigned int data)
> +{
> +    struct domain *currd =3D current->domain;
> +    unsigned long flags;
> +
> +    switch ( port )
> +    {
> +    case RTC_PORT(0):
> +          currd->arch.cmos_idx =3D data;
> +          break;
> +
> +    case RTC_PORT(1):
> +          spin_lock_irqsave(&rtc_lock, flags);
> +          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> +          outb(data, RTC_PORT(1));
> +          spin_unlock_irqrestore(&rtc_lock, flags);
> +          break;
> +    }
> +}
> +
> +static int hw_rtc_io(int dir, unsigned int port, unsigned int size,
> +                     uint32_t *val)
> +{
> +    if ( size !=3D 1 )
> +    {
> +        gdprintk(XENLOG_WARNING, "bad RTC access size (%u)\n", size);
> +        *val =3D ~0;
> +        return X86EMUL_OKAY;
> +    }
> +
> +    if ( dir =3D=3D IOREQ_WRITE )
> +        hw_write(port, *val);
> +    else
> +        *val =3D hw_read(port);
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
> --
> 2.26.2



