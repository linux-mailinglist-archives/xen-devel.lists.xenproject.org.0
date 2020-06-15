Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B21F9E19
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 19:06:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jksZG-0000vL-LL; Mon, 15 Jun 2020 17:06:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jksZF-0000vB-92
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 17:06:41 +0000
X-Inumbo-ID: 9453c3de-af2a-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9453c3de-af2a-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 17:06:40 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id mb16so18243033ejb.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=fv7nnBeBN3t+0SzoePEsGvirfQqzkR7nUscp0sk7wKg=;
 b=B/UVhXhtGKeUjK5lw2T7YYj4Aswb4muvL7d9g5TG1wmqip47B1oMc+qO8jM/vbKmbb
 z/tf/PIv61WHstnUcvuYc3yVCJ210WeDgadwBZACY+he+wwYgE3vW+K0WZjK/nlXh7rT
 8vPHXWE6/Aj+oLWAVgAnURWghLMs2Yn+DTQqdXzlNfFN99bJQe5f9c+3g7YLUFlGyrg9
 6YcJufo30hNyGOUREZ/wEWMKCkgdTOugrf8+oFPbvrlAK1c7OIKMudTT3vY68J8i0Fuz
 l2cWsFRi7qNPXwVZ54earhr2ppaCU4I/wIigTKAU7RdbCaFV7qHcLwYfXheU8hIoi3q2
 IrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=fv7nnBeBN3t+0SzoePEsGvirfQqzkR7nUscp0sk7wKg=;
 b=ZgRnYKup00ZTxrqBISQR4rSQzvs+5Zh3ZY1Gf9n2dy6qkQlGlbzt5pFjOGFPWWWe+m
 4bIjwT/YlJ1/3gPYos/p9Nn1+KJguf7pFZscL9gy8tn9mEO+chRzCcMLkHkk+yF4W4Je
 XxuFc9cMMXoVJkuHDZmzfVpB9KI8YB6jLF7FD8/A0jkrBOsjq/AtOv13/IUXRkSbfIgW
 e7G4KB0Ps6jGnIso7tGaaV6WMT4WA53RcrM+A9X9ljeWnwufANsSa/zKiQYL2e6Oz0fh
 HTDf2kOYfElhbNfdVYAg5g5s96SB0bNy9GlUzDf9CZl9aNAM2LhVO5CMLzj3VD+ChvrU
 OUhw==
X-Gm-Message-State: AOAM533FVyP16R5uJVmkmoWVWMFtdfDvJ9nms/VlUUP+uYbeu40JKnd2
 8/ePhTFWvqwTzZkjO9eIf2GXhYEndEY=
X-Google-Smtp-Source: ABdhPJwzm23I3hKoXOt9OigmGejD9tyehF1OBbGUOfD/VNvvJ+hZvX/6iLfUx55zI+fB5OY3w/Cl3w==
X-Received: by 2002:a17:906:b2c1:: with SMTP id
 cf1mr28060609ejb.135.1592240799696; 
 Mon, 15 Jun 2020 10:06:39 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id ox27sm9352676ejb.101.2020.06.15.10.06.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 10:06:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
In-Reply-To: <20200610142923.9074-3-roger.pau@citrix.com>
Subject: RE: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
Date: Mon, 15 Jun 2020 18:06:38 +0100
Message-ID: <003201d64337$557ce8c0$0076ba40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHx2+DDRjLQssRal4XfU2f+2Pe7FQIj4hRNqJGXxVA=
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
> Sent: 10 June 2020 15:29
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for =
GSIs not requiring an EOI or
> unmask
>=20
> There's no need to setup a timer for GSIs that are edge triggered,
> since those don't require any EIO or unmask, and hence couldn't block
> other interrupts.
>=20
> Note this is only used by PVH dom0, that can setup the passthrough of
> edge triggered interrupts from the vIO-APIC. One example of such kind
> of interrupt that can be used by a PVH dom0 would be the RTC timer.
>=20
> While there introduce an out label to do the unlock and reduce code
> duplication.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Changes since v1:
>  - Introduce an out label that does the unlock.
> ---
>  xen/drivers/passthrough/io.c  | 24 +++++++++++++++---------
>  xen/include/asm-x86/hvm/irq.h |  2 ++
>  2 files changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/io.c =
b/xen/drivers/passthrough/io.c
> index b292e79382..6b1305a3e5 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -138,7 +138,8 @@ static void pt_pirq_softirq_reset(struct =
hvm_pirq_dpci *pirq_dpci)
>=20
>  bool pt_irq_need_timer(uint32_t flags)
>  {
> -    return !(flags & (HVM_IRQ_DPCI_GUEST_MSI | =
HVM_IRQ_DPCI_TRANSLATE));
> +    return !(flags & (HVM_IRQ_DPCI_GUEST_MSI | HVM_IRQ_DPCI_TRANSLATE =
|
> +                      HVM_IRQ_DPCI_NO_EOI));
>  }
>=20
>  static int pt_irq_guest_eoi(struct domain *d, struct hvm_pirq_dpci =
*pirq_dpci,
> @@ -558,6 +559,12 @@ int pt_irq_create_bind(
>                       */
>                      ASSERT(!mask);
>                      share =3D trigger_mode;
> +                    if ( trigger_mode =3D=3D VIOAPIC_EDGE_TRIG )
> +                        /*
> +                         * Edge IO-APIC interrupt, no EOI or unmask =
to perform
> +                         * and hence no timer needed.
> +                         */
> +                        pirq_dpci->flags |=3D HVM_IRQ_DPCI_NO_EOI;
>                  }
>              }
>=20
> @@ -897,17 +904,13 @@ static void hvm_dirq_assist(struct domain *d, =
struct hvm_pirq_dpci *pirq_dpci)
>              send_guest_pirq(d, pirq);
>=20
>              if ( pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI )
> -            {
> -                spin_unlock(&d->event_lock);
> -                return;
> -            }
> +                goto out;
>          }
>=20
>          if ( pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI )
>          {
>              vmsi_deliver_pirq(d, pirq_dpci);
> -            spin_unlock(&d->event_lock);
> -            return;
> +            goto out;
>          }
>=20
>          list_for_each_entry ( digl, &pirq_dpci->digl_list, list )
> @@ -920,6 +923,8 @@ static void hvm_dirq_assist(struct domain *d, =
struct hvm_pirq_dpci *pirq_dpci)
>          if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
>          {
>              hvm_gsi_assert(d, pirq->pirq);
> +            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
> +                goto out;
>              pirq_dpci->pending++;
>          }
>=20
> @@ -927,8 +932,7 @@ static void hvm_dirq_assist(struct domain *d, =
struct hvm_pirq_dpci *pirq_dpci)
>          {
>              /* for translated MSI to INTx interrupt, eoi as early as =
possible */
>              __msi_pirq_eoi(pirq_dpci);
> -            spin_unlock(&d->event_lock);
> -            return;
> +            goto out;
>          }
>=20
>          /*
> @@ -941,6 +945,8 @@ static void hvm_dirq_assist(struct domain *d, =
struct hvm_pirq_dpci *pirq_dpci)
>          ASSERT(pt_irq_need_timer(pirq_dpci->flags));
>          set_timer(&pirq_dpci->timer, NOW() + PT_IRQ_TIME_OUT);
>      }
> +
> + out:
>      spin_unlock(&d->event_lock);
>  }
>=20
> diff --git a/xen/include/asm-x86/hvm/irq.h =
b/xen/include/asm-x86/hvm/irq.h
> index d306cfeade..532880d497 100644
> --- a/xen/include/asm-x86/hvm/irq.h
> +++ b/xen/include/asm-x86/hvm/irq.h
> @@ -121,6 +121,7 @@ struct dev_intx_gsi_link {
>  #define _HVM_IRQ_DPCI_GUEST_PCI_SHIFT           4
>  #define _HVM_IRQ_DPCI_GUEST_MSI_SHIFT           5
>  #define _HVM_IRQ_DPCI_IDENTITY_GSI_SHIFT        6
> +#define _HVM_IRQ_DPCI_NO_EOI_SHIFT              7
>  #define _HVM_IRQ_DPCI_TRANSLATE_SHIFT          15
>  #define HVM_IRQ_DPCI_MACH_PCI        (1u << =
_HVM_IRQ_DPCI_MACH_PCI_SHIFT)
>  #define HVM_IRQ_DPCI_MACH_MSI        (1u << =
_HVM_IRQ_DPCI_MACH_MSI_SHIFT)
> @@ -129,6 +130,7 @@ struct dev_intx_gsi_link {
>  #define HVM_IRQ_DPCI_GUEST_PCI       (1u << =
_HVM_IRQ_DPCI_GUEST_PCI_SHIFT)
>  #define HVM_IRQ_DPCI_GUEST_MSI       (1u << =
_HVM_IRQ_DPCI_GUEST_MSI_SHIFT)
>  #define HVM_IRQ_DPCI_IDENTITY_GSI    (1u << =
_HVM_IRQ_DPCI_IDENTITY_GSI_SHIFT)
> +#define HVM_IRQ_DPCI_NO_EOI          (1u << =
_HVM_IRQ_DPCI_NO_EOI_SHIFT)
>  #define HVM_IRQ_DPCI_TRANSLATE       (1u << =
_HVM_IRQ_DPCI_TRANSLATE_SHIFT)
>=20
>  struct hvm_gmsi_info {
> --
> 2.26.2



