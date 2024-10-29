Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D99B5149
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 18:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827768.1242469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qKe-0000zV-Oc; Tue, 29 Oct 2024 17:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827768.1242469; Tue, 29 Oct 2024 17:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qKe-0000xq-M0; Tue, 29 Oct 2024 17:48:40 +0000
Received: by outflank-mailman (input) for mailman id 827768;
 Tue, 29 Oct 2024 17:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzX=RZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5qKd-0000xi-TI
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 17:48:39 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05cd747c-961e-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 18:48:36 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso79713421fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 10:48:36 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f029890sm492684566b.56.2024.10.29.10.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 10:48:35 -0700 (PDT)
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
X-Inumbo-ID: 05cd747c-961e-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmQiLCJoZWxvIjoibWFpbC1sajEteDIyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA1Y2Q3NDdjLTk2MWUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI0MTE2LjM4MTc1OSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730224116; x=1730828916; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/9EEMmuM7jmIzvSl6mBVAvVIEw6XiW1XI1NLq8ReTo=;
        b=pNbyI0qkve0DMFIXta2tbdAz13uTVYAyhRNKDD6TlhJ/A9FTGLtXhn1HjjQHuZlanO
         L6wl70ahqJAmhN01w5s1L9zy9ybRRdq069ENdRWXPI5qPGpQ5MiObUFjWLis3KQgL5Yu
         cKH9VrpOEOuW4ZYF8wtsoEtIVrn+7fCuUF5AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730224116; x=1730828916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/9EEMmuM7jmIzvSl6mBVAvVIEw6XiW1XI1NLq8ReTo=;
        b=eMyvkn0aOROICkpJYrmDwTi2BnhiPfnQ/b/QNa7oRStdLHSwr6dqab02/ATRf7nLjA
         3lH7xJuJgKsWc3/dvv9pXcWa4Suob6s7+PGVrtTAMaXEXVYOavC8sIBFjTUleDO+98xY
         ycAM0L4Y/FiTSXkBEZeeiBmTu9YZoPgprBzSt9Y1eZ7hehCTU5ZLaK3jqA8nWnN75Xob
         Rw/pJTPsXkyfN/1sfH0WJ25UcE/Gpy2mIMnVqhmMZRAc5FpQa5mLZOeOBpRN5k67aT0x
         clPm3OA7VtKPxQ2k0jQ4KYvXrUsvCtsKzy0aaPdzQCsRC4Mdkmh2keEuthxTCWei0ebc
         u8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX1608eiPqyr9jgQdaFSeT5/CQzZytF5l+gZElzfNjjEltnKG73RiPc1hRWISX0hmMdMDnz84nD9T4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1FqcRVCKaXnbVii42lVEUSlTkXR1tCYIgo7xfN3gsgjZ9b73v
	cMeRTZNLcE4t/+GLEq62llD+TeBVhd+PVH+xqYxrfFVcSbhDVi8XqSx7QDNUZa4=
X-Google-Smtp-Source: AGHT+IHVWoJXNQUlezkyEYR4zMAOpvDDKxRetsSlRQjhzIPYOrTo4MIRJhSEPNcIMKmN37GKcdNdrQ==
X-Received: by 2002:a05:651c:507:b0:2f7:6653:8053 with SMTP id 38308e7fff4ca-2fcbdfc5394mr96712041fa.18.1730224115664;
        Tue, 29 Oct 2024 10:48:35 -0700 (PDT)
Date: Tue, 29 Oct 2024 18:48:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
Message-ID: <ZyEf8hK-XyGn6Kp8@macbook>
References: <20241029110351.40531-1-roger.pau@citrix.com>
 <53034f16-682e-4081-ab7e-81338c700f85@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53034f16-682e-4081-ab7e-81338c700f85@suse.com>

On Tue, Oct 29, 2024 at 05:43:24PM +0100, Jan Beulich wrote:
> On 29.10.2024 12:03, Roger Pau Monne wrote:
> > When using AMD-Vi interrupt remapping the vector field in the IO-APIC RTE is
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
> 
> In here I think you mean "handle" when you use "handler"?

Indeed.

> Plus with what you said
> earlier about vector vs EOI handle, and with the code using "vector" all over the
> place, their (non-)relationship could also do with clarifying (perhaps better in
> a code comment in __io_apic_eoi()).

I've attempted to clarify the relation between vector vs EOI handle in
the first paragraph, and how that applies to AMD-Vi.  I can move
(part?) of that into the comment in __ioapic_write_entry(), maybe:

/*
 * Might be called before io_apic_pin_eoi is allocated.  Entry will be
 * updated once the array is allocated and there's a write against the
 * pin.
 *
 * Note that the vector field is only cached for raw RTE writes when
 * using IR.  In that case the vector field might have been repurposed
 * to store something different than the target vector, and hence need
 * to be cached for performing EOI.
 */

> > @@ -273,6 +293,13 @@ void __ioapic_write_entry(
> >      {
> >          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> >          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> > +        /*
> > +         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
> > +         * Entry will be updated once the array is allocated and there's a
> > +         * write against the pin.
> > +         */
> > +        if ( io_apic_pin_eoi )
> > +            io_apic_pin_eoi[apic][pin] = e.vector;
> 
> The comment here looks a little misleading to me. clear_IO_APIC_pin() calls
> here to, in particular, set the mask bit. With the mask bit the vector isn't
> meaningful anyway (and indeed clear_IO_APIC_pin() sets it to zero, at which
> point recording IRQ_VECTOR_UNASSIGNED might be better than the bogus vector
> 0x00).

Note that clear_IO_APIC_pin() performs the call to
__ioapic_write_entry() with raw == false, at which point
__ioapic_write_entry() will call iommu_update_ire_from_apic() if IOMMU
IR is enabled.  The cached 'vector' value will be the IOMMU entry
offset for the AMD-Vi case, as the IOMMU code will perform the call to
__ioapic_write_entry() with raw == true.

What matters is that the cached value matches what's written in the
IO-APIC RTE, and the current logic ensures this.

What's the benefit of using IRQ_VECTOR_UNASSIGNED if the result is
reading the RTE and finding that vector == 0?

Looking at clear_IO_APIC_pin() - I think the function is slightly
bogus.  If entry.trigger is not set, the logic to switch the entry to
level triggered  will fetch the entry contents without requesting a
raw RTE, at which point the entry.vector field can not be used as
the EOI handle since it will contain the vector, not the IR table
offset.  I will need to make a further patch to fix this corner
case.

> > @@ -298,9 +325,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
> >      /* Prefer the use of the EOI register if available */
> >      if ( ioapic_has_eoi_reg(apic) )
> >      {
> > +        if ( io_apic_pin_eoi )
> > +            vector = io_apic_pin_eoi[apic][pin];
> > +
> >          /* If vector is unknown, read it from the IO-APIC */
> >          if ( vector == IRQ_VECTOR_UNASSIGNED )
> > +        {
> >              vector = __ioapic_read_entry(apic, pin, true).vector;
> 
> Related to my comment higher up regarding vector vs EOI handle: Here we're
> doing a raw read, i.e. we don't really fetch the vector but the EOI handle
> in the AMD case. Why is it that this isn't sufficient for directed EOI to
> work (perhaps with the conditional adjusted)?

It is enough, but we don't want to be doing such read for each EOI,
hence why we cache it in io_apic_pin_eoi.

> Then again - are we ever taking this path? Certainly not when coming from
> clear_IO_APIC_pin(), hence ...
> 
> > +            if ( io_apic_pin_eoi )
> 
> ... I'm unconvinced this conditional is needed.

Hm, maybe.  I can adjust but seems more fragile to trigger a
dereference for the extra cost of a conditional in what should be a
non-common path anyway.

> > +                /* Update cached value so further EOI don't need to fetch it. */
> > +                io_apic_pin_eoi[apic][pin] = vector;
> > +        }
> >  
> >          *(IO_APIC_BASE(apic)+16) = vector;
> >      }
> > @@ -1022,8 +1057,27 @@ static void __init setup_IO_APIC_irqs(void)
> >  
> >      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
> >  
> > +    if ( iommu_intremap )
> > +    {
> > +        io_apic_pin_eoi = xmalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
> 
> Nit: Strictly speaking this and ...
> 
> > +        BUG_ON(!io_apic_pin_eoi);
> > +    }
> > +
> >      for (apic = 0; apic < nr_ioapics; apic++) {
> > -        for (pin = 0; pin < nr_ioapic_entries[apic]; pin++) {
> > +        const unsigned int nr_entries = nr_ioapic_entries[apic];
> > +
> > +        if ( iommu_intremap )
> > +        {
> > +            io_apic_pin_eoi[apic] = xmalloc_array(typeof(**io_apic_pin_eoi),
> > +                                                  nr_entries);
> 
> ... and this should be xvmalloc_array() in new code.

Sorry, didn't notice we have that now.

> Also this 2nd conditional may better use io_apic_pin_eoi, such that the two
> conditionals don't need keeping in sync. Note also how Andrew previously
> pointed out that both conditionals aren't Misra-compliant right now.

Oh, yes, completely forgot to adjust the MISRA comment from Andrew,
sorry.

Thanks, Roger.

