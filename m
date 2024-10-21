Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332119A60C8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 11:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823283.1237255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2p8t-0004XW-Gr; Mon, 21 Oct 2024 09:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823283.1237255; Mon, 21 Oct 2024 09:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2p8t-0004Uy-Do; Mon, 21 Oct 2024 09:56:03 +0000
Received: by outflank-mailman (input) for mailman id 823283;
 Mon, 21 Oct 2024 09:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2p8r-0004Qi-DM
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 09:56:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aca1657c-8f92-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 11:55:59 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso15348575e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 02:55:59 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f570a97sm51818395e9.9.2024.10.21.02.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:55:58 -0700 (PDT)
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
X-Inumbo-ID: aca1657c-8f92-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729504559; x=1730109359; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL+8dy6zztf9H4+yhyuoyf8ApGGeck1aRp1m8vKu9LM=;
        b=a75Ta8HNQOTTEZW7C1PPj0bn1RDa4njEabfE2oMjx/iPnVWDg7yZXi7EUHa+FtyFug
         nMX1DTi7gB3uup1oDzjRBohZSmLgLIHEI8ThNg55WX6tnVi/JoeJp988V/eYO09VeKNj
         9DmokXh6atniSWwxWH/xdsSqBdLLEdqpkIUgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729504559; x=1730109359;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EL+8dy6zztf9H4+yhyuoyf8ApGGeck1aRp1m8vKu9LM=;
        b=f0hg7jSVvwZwhUiLSv1zwYJoOhPFUt5dlBvRr6tZVSbdes79a7TKF6Tl/NZUQOHq70
         Z2LWMbRS3spDWJVoAnHuX4J9OhWNBZMcSDo0o/t/HBEEjVX3c7hkPJybWEFhdR2Wsuxn
         +yt2+qqt+982E7je+Rquz/mc+gAKKjLsItc77DPf9W4Yaksc8tKR3BkLKVOqOw/DsdRI
         QAc2z/4qvAczSfqbKBks2abbScUiEA4a12dSQ9OGoeca9KgCe9xYveRCOqSyG9HhonYe
         PTGjd39S0Zycgp2e38dpcjEF0XhQt0+oOSRRDVscL374zlrLkNxUXTH6qrwBNX2vPuyq
         qjAg==
X-Forwarded-Encrypted: i=1; AJvYcCUle2SSsPpWY0FwfWw+TAj3aJWP0j7Rc9SyARy9CdFAOVsPHcWJ/LsYlFOj05Sx8DGEw9OzdgGDRoo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxP8HzUwtNrXnKzhuH0iJluuX98+bSFzf+9K3Qdehetu6JYT6P6
	w1kyFxZ9cRiKbOhHWagc72krtnqdxT+bbQ8o2yMpQag4vWruBtH9Cw6oUcW98F0=
X-Google-Smtp-Source: AGHT+IH6Au0XrzfXXOI3VfeWFzBR2NqhP2KmO5qyEQQXOXVxq8vKIazy0COmhnS7eW9isr5AwEPwaA==
X-Received: by 2002:a05:6000:11c1:b0:37d:5282:1339 with SMTP id ffacd0b85a97d-37ea2196749mr7520271f8f.22.1729504559108;
        Mon, 21 Oct 2024 02:55:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 10:55:54 +0100
Message-Id: <D51E73OWU4LY.3GIECD0KR4UW@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Willi Junga" <xenproject@ymy.be>, "David
 Woodhouse" <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241018080813.45759-1-roger.pau@citrix.com>
In-Reply-To: <20241018080813.45759-1-roger.pau@citrix.com>

On Fri Oct 18, 2024 at 9:08 AM BST, Roger Pau Monne wrote:
> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE=
 is
> repurposed to contain part of the offset into the remapping table.  Previ=
ous to

For my own education. Is that really a repurpose? Isn't the RTE vector fiel=
d
itself simply remapped, just like any MSI?

> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remappin=
g
> table would match the vector.  Such logic was mandatory for end of interr=
upt to
> work, since the vector field (even when not containing a vector) is used =
by the
> IO-APIC to find for which pin the EOI must be performed.
>
> Introduce a table to store the EOI handlers when using interrupt remappin=
g, so

The table seems to store the pre-IR vectors. Is this a matter of nomenclatu=
re
or leftover from a previous implementation?

> that the IO-APIC driver can translate pins into EOI handlers without havi=
ng to
> read the IO-APIC RTE entry.  Note that to simplify the logic such table i=
s used
> unconditionally when interrupt remapping is enabled, even if strictly it =
would
> only be required for AMD-Vi.

Given that last statement it might be worth mentioning that the table is
bypassed when IR is off as well.

>
> Reported-by: Willi Junga <xenproject@ymy.be>
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a=
 static mapping')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index e40d2f7dbd75..8856eb29d275 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
> =20
>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
> =20
> +/*
> + * Store the EOI handle when using interrupt remapping.

That explains the when, but not the what. This is "a LUT from IOAPIC pin to=
 its
vector field", as far as I can see.=20

The order in which it's meant to be indexed would be a good addition here a=
s
well. I had to scroll down to see how it was used to really see what this w=
as.

> + *
> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry rem=
apped
> + * format repurposes the vector field to store the offset into the Inter=
rupt
> + * Remap table.  This causes directed EOI to longer work, as the CPU vec=
tor no
> + * longer matches the contents of the RTE vector field.  Add a translati=
on
> + * table so that directed EOI uses the value in the RTE vector field whe=
n

nit: Might be worth mentioning that it's a merely cache and is populated
on-demand from authoritative state in the IOAPIC.

> + * interrupt remapping is enabled.
> + *
> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vecto=
r field
> + * when using the remapped format, but use the translation table uniform=
ly in
> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> + */
> +static unsigned int **apic_pin_eoi;

This should be signed to allow IRQ_VECTOR_UNASSIGNED, I think. Possibly
int16_t, matching arch_irq_desc->vector. This raises doubts about the exist=
ing
vectors here typed as unsigned too.

On naming, I'd rather see ioapic rather than apic, but that's a an existing=
 sin
in the whole file. Otherwise, while it's used for EOI ATM, isn't it really =
just
an ioapic_pin_vector?

> +
>  static void share_vector_maps(unsigned int src, unsigned int dst)
>  {
>      unsigned int pin;
> @@ -273,6 +289,13 @@ void __ioapic_write_entry(
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        /*
> +         * Might be called before apic_pin_eoi is allocated.  Entry will=
 be
> +         * updated once the array is allocated and there's an EOI or wri=
te
> +         * against the pin.
> +         */
> +        if ( apic_pin_eoi )
> +            apic_pin_eoi[apic][pin] =3D e.vector;
>      }
>      else
>          iommu_update_ire_from_apic(apic, pin, e.raw);
> @@ -298,9 +321,17 @@ static void __io_apic_eoi(unsigned int apic, unsigne=
d int vector, unsigned int p

Out of curiosity, how could this vector come to be unassigned as a paramete=
r?
The existing code seems to assume that may happen.

>      /* Prefer the use of the EOI register if available */
>      if ( ioapic_has_eoi_reg(apic) )
>      {
> +        if ( apic_pin_eoi )
> +            vector =3D apic_pin_eoi[apic][pin];
> +
>          /* If vector is unknown, read it from the IO-APIC */
>          if ( vector =3D=3D IRQ_VECTOR_UNASSIGNED )
> +        {
>              vector =3D __ioapic_read_entry(apic, pin, true).vector;
> +            if ( apic_pin_eoi )
> +                /* Update cached value so further EOI don't need to fetc=
h it. */
> +                apic_pin_eoi[apic][pin] =3D vector;
> +        }
> =20
>          *(IO_APIC_BASE(apic)+16) =3D vector;
>      }
> @@ -1022,7 +1053,23 @@ static void __init setup_IO_APIC_irqs(void)
> =20
>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
> =20
> +    if ( iommu_intremap )
> +    {
> +        apic_pin_eoi =3D xzalloc_array(typeof(*apic_pin_eoi), nr_ioapics=
);
> +        BUG_ON(!apic_pin_eoi);
> +    }
> +
>      for (apic =3D 0; apic < nr_ioapics; apic++) {

Was here before, but it might be a good time to reformat this line and the =
loop
below.

> +        if ( iommu_intremap )
> +        {
> +            apic_pin_eoi[apic] =3D xmalloc_array(typeof(**apic_pin_eoi),
> +                                               nr_ioapic_entries[apic]);
> +            BUG_ON(!apic_pin_eoi[apic]);
> +
> +            for ( pin =3D 0; pin < nr_ioapic_entries[apic]; pin++ )
> +                apic_pin_eoi[apic][pin] =3D IRQ_VECTOR_UNASSIGNED;
> +        }
> +

Rather than doing this, we could have a single allocation for everything, a=
nd
store the different bases accounting for the number of pins of each IOAPIC.

    apic_pin_eoi[0] =3D base;
    for_each_ioapic
        apic_pin_eoi[i+1] =3D apic_pin_eoi[i] + nr_ioapic_entries[i];

>          for (pin =3D 0; pin < nr_ioapic_entries[apic]; pin++) {
>              /*
>               * add it to the IO-APIC irq-routing table:

Cheers,
Alejandro

