Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A79A6741
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823444.1237443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2r2N-0007mR-5i; Mon, 21 Oct 2024 11:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823444.1237443; Mon, 21 Oct 2024 11:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2r2N-0007kr-0m; Mon, 21 Oct 2024 11:57:27 +0000
Received: by outflank-mailman (input) for mailman id 823444;
 Mon, 21 Oct 2024 11:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2r2L-0007gr-Nu
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:57:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a226c939-8fa3-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 13:57:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso635990866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 04:57:23 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913078cfsm195874166b.96.2024.10.21.04.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 04:57:22 -0700 (PDT)
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
X-Inumbo-ID: a226c939-8fa3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729511843; x=1730116643; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dOXsZFe9/SdziGOPCF+rutiT1SVsLkqyo0qn+OkwR5U=;
        b=CT0E/JnId+h8VAi3uJgMDrbGeE+4LKnFf8NHUbDMoZlqEFjfQjaWODuSegPscJeixF
         emN7G8ATACyhVn10r5bgSUhlVZ9fEqWAD1Bbbcrs5dsV4ZaCAXLyCvAKsN5++0Ztvo72
         YOOJ4rWk1qR+3DWqY5Sj2Rkiihq4ZEwhDa6A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511843; x=1730116643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOXsZFe9/SdziGOPCF+rutiT1SVsLkqyo0qn+OkwR5U=;
        b=Hin58COcpMuYc53+Yo4HI894wB5XivfhokXQ2cQp1236fnQeQDcOLHQghAl1WKxoQX
         j18voY8orTGGgpH9ABF3MoQ7lXSZMU7srOMhluRBZA6j526S2F4do6HHmXCJ7EeErCXI
         GSE5pDnr+8w3ZzruEZ20DeizqJcgbVkiNbgEok6uipGFyWqfrqGLn5+O5fmbyEbCjWI7
         imn4FPXATcReYm3ddNZ+mRca7+ohyVtWzGaFcgLYrgN2wIt2V7/HckdNmt99SI07Jhd0
         pEuqcD8phs+zfjwSutXv3NaVpZBKFyQkBc3tPvG/3Fc/JWtacC7nvWQSrFZWegqlcfbz
         wgSg==
X-Gm-Message-State: AOJu0YwM2hpCbW6JP5v0wgb9M1cVXH7mzSafZVvrbkEeqbp0o9f5bI2+
	+CJ1go1rtB2ffy8YkWah+uOWv99pJ3h7wgsuFnL0xmNNJsrpe8TgfcApd1Nv7NDP5zckdi4riZO
	6
X-Google-Smtp-Source: AGHT+IGjYpjEo3D8JeTxVaVOa98N1NNulTEGysKL5Yt5E2uOkaBSkXrWkDsByfgwaeVTqD94kUEATg==
X-Received: by 2002:a17:907:9623:b0:a9a:230b:fb5e with SMTP id a640c23a62f3a-a9a69868cb2mr1210661666b.4.1729511842881;
        Mon, 21 Oct 2024 04:57:22 -0700 (PDT)
Date: Mon, 21 Oct 2024 13:57:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZxZBocLV7eJUxK50@macbook.local>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>

On Mon, Oct 21, 2024 at 12:10:14PM +0100, Andrew Cooper wrote:
> On 18/10/2024 9:08 am, Roger Pau Monne wrote:
> > When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
> > repurposed to contain part of the offset into the remapping table.  Previous to
> > 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> > table would match the vector.  Such logic was mandatory for end of interrupt to
> > work, since the vector field (even when not containing a vector) is used by the
> > IO-APIC to find for which pin the EOI must be performed.
> >
> > Introduce a table to store the EOI handlers when using interrupt remapping, so
> > that the IO-APIC driver can translate pins into EOI handlers without having to
> > read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> > unconditionally when interrupt remapping is enabled, even if strictly it would
> > only be required for AMD-Vi.
> >
> > Reported-by: Willi Junga <xenproject@ymy.be>
> > Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> > Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Yet more fallout from the multi-MSI work.  That really has been a giant
> source of bugs.
> 
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
> > + *
> > + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> > + * format repurposes the vector field to store the offset into the Interrupt
> > + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
> > + * longer matches the contents of the RTE vector field.  Add a translation
> > + * table so that directed EOI uses the value in the RTE vector field when
> > + * interrupt remapping is enabled.
> > + *
> > + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
> > + * when using the remapped format, but use the translation table uniformly in
> > + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> > + */
> > +static unsigned int **apic_pin_eoi;
> 
> I think we can get away with this being uint8_t rather than unsigned
> int, especially as we're allocating memory when not strictly necessary.
> 
> The only sentinel value we use is IRQ_VECTOR_UNASSIGNED which is -1.
> 
> Vector 0xff is strictly SPIV and not allocated for anything else, so can
> be reused as a suitable sentinel here.

The coding style explicitly discourages using fixed width types unless
it's strictly necessary, I assume the usage here would be covered by
Xen caching a value of a hardware register field that has a
fixed-width size.

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
> 
> Is this for the xAPIC path where we turn on interrupts before the IOMMU ?

It's for iommu_setup() -> iommu_hardware_setup() saving and restoring
the IO-APIC entries around enabling of interrupt remapping.  This is
done just ahead of smp_prepare_cpus() which is where
setup_IO_APIC_irqs() gets called.

> > +        if ( apic_pin_eoi )
> > +            apic_pin_eoi[apic][pin] = e.vector;
> >      }
> >      else
> >          iommu_update_ire_from_apic(apic, pin, e.raw);
> > @@ -298,9 +321,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
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
> 
> MISRA requires this to be iommu_intremap != iommu_intremap_off.
> 
> But, if this safe on older hardware?  iommu_intremap defaults to on
> (full), and is then turned off later on boot for various reasons.

I think it's fine because setup_IO_APIC_irqs() is strictly called
after iommu_setup(), so the value of iommu_intremap by that point
should reflect whether IR is enabled.

> We do all memory allocations in setup_IO_APIC_irqs() so at least we get
> to see a consistent view of iommu_intremap.
> 
> I suppose there's nothing wrong with having an extra cache of the vector
> in the way when not using interrupt remapping, so maybe it's fine?
> 
> > +    {
> > +        apic_pin_eoi = xzalloc_array(typeof(*apic_pin_eoi), nr_ioapics);
> > +        BUG_ON(!apic_pin_eoi);
> > +    }
> > +
> >      for (apic = 0; apic < nr_ioapics; apic++) {
> > +        if ( iommu_intremap )
> > +        {
> > +            apic_pin_eoi[apic] = xmalloc_array(typeof(**apic_pin_eoi),
> > +                                               nr_ioapic_entries[apic]);
> > +            BUG_ON(!apic_pin_eoi[apic]);
> > +
> > +            for ( pin = 0; pin < nr_ioapic_entries[apic]; pin++ )
> > +                apic_pin_eoi[apic][pin] = IRQ_VECTOR_UNASSIGNED;
> > +        }
> 
> This logic will be better if you pull nr_ioapic_entries[apic] out into a
> loop-local variable.
> 
> It should also allow the optimiser to turn the for loop into a memset(),
> which it can't now because of possible pointer aliasing with the
> induction variable.

Oh, OK, can send v2 with that adjusted.

> But overall, the patch looks broadly ok to me.

Thanks, Roger.

