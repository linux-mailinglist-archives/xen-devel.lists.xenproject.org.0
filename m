Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023F9A64C5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 12:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823331.1237304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2pyb-0002S6-8V; Mon, 21 Oct 2024 10:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823331.1237304; Mon, 21 Oct 2024 10:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2pyb-0002QQ-5q; Mon, 21 Oct 2024 10:49:29 +0000
Received: by outflank-mailman (input) for mailman id 823331;
 Mon, 21 Oct 2024 10:49:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2pyZ-0002QK-PV
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 10:49:27 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24171c46-8f9a-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 12:49:26 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso62863971fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 03:49:26 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ecda8sm187225166b.47.2024.10.21.03.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 03:49:25 -0700 (PDT)
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
X-Inumbo-ID: 24171c46-8f9a-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729507766; x=1730112566; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3DyZ13pPdG43U6GXZMBlRYIk4dI8g09vSS0nw6afr/s=;
        b=ku+KYx0o/XsTmDJnTllw8BKH5wKEa+iobkIFV7U3rp6TlgKOWWVX9YCrpL6WXLSrY+
         PeeCKXGEgW9B9IURa99ah7hczVHhKHgM018lrP5oWPSWEiXFWX2Gwqe7QdIKg0X3T/MS
         9LZmZz6sDDh3wSuNHjuhn/KTu+ACCBExrJ/oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507766; x=1730112566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DyZ13pPdG43U6GXZMBlRYIk4dI8g09vSS0nw6afr/s=;
        b=oFV9GMqIvknWpF+IY5bkyN6pLdT+2IN6sr9W6r2ERru6wBapkW2W+mspdEqllrb+pb
         JfUz4sEH936nE4YZH4oUdRIAK7JSDHO9iORAwLtV/orm+4k+EV6eTd6Jc+NiwXVgpdIW
         sTUMdGhpmLEOl5T2G7BBm1OFSn3GbyDyQiA5yKPA6PxGi1lhQMK8lMpzEpuBUevLhYDd
         3ZW59u4ckm2xF4w69cH36TiabHC0Gs/R51CQ8MpjFGyHjZ47eOj53+yLINsUa8iizcWU
         q5xKDriVOiRfSL5wjv3W8+9TC7EZ890cHuctqDMvqSJHMSuKZFbVvtX+doJDX15VUPoF
         xr3A==
X-Gm-Message-State: AOJu0YylWjI2RRbRfe+HocyGsGGYyCMHsP2+9GXXPrzlA5i80zhnm3QK
	/vBiAmGFasADNrssg2E5EGVuxlO8hBAg9wVQ1HsWjenBa8XNqNPMPv9o8cVkTDs=
X-Google-Smtp-Source: AGHT+IFZMVCRmxzwlPVV3QZDuOgGN1oMQp/obgc3HbRYvvDvQHSwwlTJIht9bCiskxHRTZN4exQorA==
X-Received: by 2002:a2e:8ecd:0:b0:2fb:4f8e:efd with SMTP id 38308e7fff4ca-2fb831ef969mr64911881fa.32.1729507765874;
        Mon, 21 Oct 2024 03:49:25 -0700 (PDT)
Date: Mon, 21 Oct 2024 12:49:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZxYxtIenThvt7zDz@macbook.local>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <D51E73OWU4LY.3GIECD0KR4UW@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D51E73OWU4LY.3GIECD0KR4UW@cloud.com>

On Mon, Oct 21, 2024 at 10:55:54AM +0100, Alejandro Vallejo wrote:
> On Fri Oct 18, 2024 at 9:08 AM BST, Roger Pau Monne wrote:
> > When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
> > repurposed to contain part of the offset into the remapping table.  Previous to
> 
> For my own education. Is that really a repurpose? Isn't the RTE vector field
> itself simply remapped, just like any MSI?

Well, the vector field no longer stores a vector, but an offset into
the Interrupt Remapping table.

> > 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> > table would match the vector.  Such logic was mandatory for end of interrupt to
> > work, since the vector field (even when not containing a vector) is used by the
> > IO-APIC to find for which pin the EOI must be performed.
> >
> > Introduce a table to store the EOI handlers when using interrupt remapping, so
> 
> The table seems to store the pre-IR vectors. Is this a matter of nomenclature
> or leftover from a previous implementation?

IR doesn't change the vector, so pre-IR and post-IR vectors are the
same.

However, the table stores the value of 'raw' IO-APIC RTEs, which would
be the RTEs as written by the IOMMU code (post-IR).  See how IOMMU
code calls __ioapic_write_entry() to update the IO-APIC RTEs to use
the remapped format.

> > that the IO-APIC driver can translate pins into EOI handlers without having to
> > read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> > unconditionally when interrupt remapping is enabled, even if strictly it would
> > only be required for AMD-Vi.
> 
> Given that last statement it might be worth mentioning that the table is
> bypassed when IR is off as well.

Sure, that's fine to add.

> >
> > Reported-by: Willi Junga <xenproject@ymy.be>
> > Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> > Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> > index e40d2f7dbd75..8856eb29d275 100644
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
> >  
> >  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
> >  
> > +/*
> > + * Store the EOI handle when using interrupt remapping.
> 
> That explains the when, but not the what. This is "a LUT from IOAPIC pin to its
> vector field", as far as I can see. 

Well, it's the vector field when not using the remapped format, it's
no longer a vector field when using IR on AMD-Vi.  Hence why I've
named it "EOI handle".

> The order in which it's meant to be indexed would be a good addition here as
> well. I had to scroll down to see how it was used to really see what this was.

It's [apic][pin] matrix.  It's quite common in the IO-APIC code, I didn't
want to make the comment to verbose, but can certainly add to it.

> > + *
> > + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> > + * format repurposes the vector field to store the offset into the Interrupt
> > + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
> > + * longer matches the contents of the RTE vector field.  Add a translation
> > + * table so that directed EOI uses the value in the RTE vector field when
> 
> nit: Might be worth mentioning that it's a merely cache and is populated
> on-demand from authoritative state in the IOAPIC.
> 
> > + * interrupt remapping is enabled.
> > + *
> > + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
> > + * when using the remapped format, but use the translation table uniformly in
> > + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> > + */
> > +static unsigned int **apic_pin_eoi;
> 
> This should be signed to allow IRQ_VECTOR_UNASSIGNED, I think. Possibly
> int16_t, matching arch_irq_desc->vector. This raises doubts about the existing
> vectors here typed as unsigned too.

It's -1 which will be ~0, certainly out of the scope of the vectors
range.

The coding style in Xen is to not use fixed width integers unless
strictly necessary (iow: when representing register values for
example).  I don't think it's strictly required here to use a
fixed-width type.

> 
> On naming, I'd rather see ioapic rather than apic, but that's a an existing sin
> in the whole file. Otherwise, while it's used for EOI ATM, isn't it really just
> an ioapic_pin_vector?

As said above - using 'vector' when using AMD-Vi RTE remapped format is
not accurate IMO.

> > +
> >  static void share_vector_maps(unsigned int src, unsigned int dst)
> >  {
> >      unsigned int pin;
> > @@ -273,6 +289,13 @@ void __ioapic_write_entry(
> >      {
> >          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> >          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> > +        /*
> > +         * Might be called before apic_pin_eoi is allocated.  Entry will be
> > +         * updated once the array is allocated and there's an EOI or write
> > +         * against the pin.
> > +         */
> > +        if ( apic_pin_eoi )
> > +            apic_pin_eoi[apic][pin] = e.vector;
> >      }
> >      else
> >          iommu_update_ire_from_apic(apic, pin, e.raw);
> > @@ -298,9 +321,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
> 
> Out of curiosity, how could this vector come to be unassigned as a parameter?
> The existing code seems to assume that may happen.

I think it's possible that some IO-APIC pins are configured before Xen
is started, in which case Xen would need to deal with them.  I didn't
want to break that assumption anyway, if we want to get rid of this
case it should be a separate change.

> >      /* Prefer the use of the EOI register if available */
> >      if ( ioapic_has_eoi_reg(apic) )
> >      {
> > +        if ( apic_pin_eoi )
> > +            vector = apic_pin_eoi[apic][pin];
> > +
> >          /* If vector is unknown, read it from the IO-APIC */
> >          if ( vector == IRQ_VECTOR_UNASSIGNED )
> > +        {
> >              vector = __ioapic_read_entry(apic, pin, true).vector;
> > +            if ( apic_pin_eoi )
> > +                /* Update cached value so further EOI don't need to fetch it. */
> > +                apic_pin_eoi[apic][pin] = vector;
> > +        }
> >  
> >          *(IO_APIC_BASE(apic)+16) = vector;
> >      }
> > @@ -1022,7 +1053,23 @@ static void __init setup_IO_APIC_irqs(void)
> >  
> >      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
> >  
> > +    if ( iommu_intremap )
> > +    {
> > +        apic_pin_eoi = xzalloc_array(typeof(*apic_pin_eoi), nr_ioapics);
> > +        BUG_ON(!apic_pin_eoi);
> > +    }
> > +
> >      for (apic = 0; apic < nr_ioapics; apic++) {
> 
> Was here before, but it might be a good time to reformat this line and the loop
> below.
> 
> > +        if ( iommu_intremap )
> > +        {
> > +            apic_pin_eoi[apic] = xmalloc_array(typeof(**apic_pin_eoi),
> > +                                               nr_ioapic_entries[apic]);
> > +            BUG_ON(!apic_pin_eoi[apic]);
> > +
> > +            for ( pin = 0; pin < nr_ioapic_entries[apic]; pin++ )
> > +                apic_pin_eoi[apic][pin] = IRQ_VECTOR_UNASSIGNED;
> > +        }
> > +
> 
> Rather than doing this, we could have a single allocation for everything, and
> store the different bases accounting for the number of pins of each IOAPIC.

Could do, overall it seems to make the logic more complicated than
strictly needed.  The allocation is done exclusively once at boot, and
hence doing a single one or possibly 4 or 5 different ones doesn't
seem worth it.  There are not that many IO-APICs on a system.

Thanks, Roger.

