Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150129B3791
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826904.1241351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TS6-000421-01; Mon, 28 Oct 2024 17:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826904.1241351; Mon, 28 Oct 2024 17:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TS5-00040C-Tf; Mon, 28 Oct 2024 17:22:49 +0000
Received: by outflank-mailman (input) for mailman id 826904;
 Mon, 28 Oct 2024 17:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owpo=RY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5TS4-000406-JH
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:22:48 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 405d4270-9551-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 18:22:47 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso7104538a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 10:22:47 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6297a09sm3307762a12.21.2024.10.28.10.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 10:22:46 -0700 (PDT)
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
X-Inumbo-ID: 405d4270-9551-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730136167; x=1730740967; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MH1uUG7QfAsepR6+0GiN2ChsMwlmg3yMjFFkBYIymlM=;
        b=qdZqW1wMe1eRJtPFXncs/k5HPpteCchyZySxpcBaMmV6VxyhEHqWzftaknUfyns245
         KIri9SjyQSiJFsjjjmGB2Acv3RBSbyKnkm7xRwDfXo9qjZWUP8Vj9vpSmANmSZQtlClI
         bz+x+3iDTyMSjaTOwa2CKn9mpmgWd2wiCnXOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730136167; x=1730740967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH1uUG7QfAsepR6+0GiN2ChsMwlmg3yMjFFkBYIymlM=;
        b=VVIzZlSYzqC74sFB7NidJ2d31G2NuBB2dgN7dwgH33DIukgF0UUYAxQxAMW9tlQpt8
         ceuJCm0jkQeD2lPikkmQDCXxKYQeajgmkLxFN/9UgrjJGsB7gc+hIscBkFlhs1wjOa8E
         DgV9OJJH4VwOiWrNImfeu24aeyzDwPsomO1efbbdyAbqg4XavQ24O4lM5kk9nvy6NA0I
         omfrbh1nMtrUtv4IrvX7HlbK1nRmrTvUwxIcJ3f4lNymM7XevWf4rtarfDpE0pMLZYBC
         PrQgTlHBWBCJK8VCmQqxHqEGOhKHuWqYlAnLT3JdFoW/x/LmbxTcdUgsgArQNqoGW9sW
         NOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx1dbByCmfw3LNLLriBd5EgCf2uJ8WLK6EzKFgwyqFEX1G23CjCH5/thtud6WtKqe3hLKLTywba2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgXs0QBwnmaKEVZmGa/wgU/EaG+eLpGu6HCH11gJCjKx4INkVN
	4qhR80zL/DOVMC/3bvO9g5FLkZQm5wquFrq4ZIP64b9PyDXL5tWzikz5yY4+TVA=
X-Google-Smtp-Source: AGHT+IEGcRoRB6zTD3ip6gT3LsFaAI7MfcR8RoKZ+7ERj0z5d7SPDizn5gajT2Ty9NYcJv+O+kcCow==
X-Received: by 2002:a05:6402:1953:b0:5c4:aea:5833 with SMTP id 4fb4d7f45d1cf-5cc196c3a8amr325707a12.18.1730136167060;
        Mon, 28 Oct 2024 10:22:47 -0700 (PDT)
Date: Mon, 28 Oct 2024 18:22:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
Message-ID: <Zx_IZUyNL-Iw-nrL@macbook>
References: <20241024154844.8652-1-roger.pau@citrix.com>
 <abadac24-0392-4051-b6a2-08967272f1a1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abadac24-0392-4051-b6a2-08967272f1a1@suse.com>

On Mon, Oct 28, 2024 at 12:33:42PM +0100, Jan Beulich wrote:
> On 24.10.2024 17:48, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/io_apic.c
> > +++ b/xen/arch/x86/io_apic.c
> > @@ -71,6 +71,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
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
> > + *
> > + * The matrix is accessed as [#io-apic][#pin].
> > + */
> > +static uint8_t **io_apic_pin_eoi;
> 
> Wasn't the conclusion from the v1 discussion that this needs to be a signed
> type wider than 8 bits?
> 
> > @@ -298,6 +323,9 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
> >      /* Prefer the use of the EOI register if available */
> >      if ( ioapic_has_eoi_reg(apic) )
> >      {
> > +        if ( io_apic_pin_eoi )
> > +            vector = io_apic_pin_eoi[apic][pin];
> > +
> >          /* If vector is unknown, read it from the IO-APIC */
> >          if ( vector == IRQ_VECTOR_UNASSIGNED )
> >              vector = __ioapic_read_entry(apic, pin, true).vector;
> 
> In addition to what Andrew said here, for this comparison the make sense
> ...
> 
> > @@ -1022,7 +1050,20 @@ static void __init setup_IO_APIC_irqs(void)
> >  
> >      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
> >  
> > +    if ( iommu_intremap )
> > +    {
> > +        io_apic_pin_eoi = xzalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
> > +        BUG_ON(!io_apic_pin_eoi);
> > +    }
> > +
> >      for (apic = 0; apic < nr_ioapics; apic++) {
> > +        if ( iommu_intremap )
> > +        {
> > +            io_apic_pin_eoi[apic] = xzalloc_array(typeof(**io_apic_pin_eoi),
> > +                                                  nr_ioapic_entries[apic]);
> > +            BUG_ON(!io_apic_pin_eoi[apic]);
> > +        }
> 
> ... doesn't the array also need -1 (== IRQ_VECTOR_UNASSIGNED) filling,
> rather than zero-filling?

Replying here to both you and Andrews question.  My analysis is that
a sentinel is not needed.  clear_IO_APIC_pin() is the only function
that calls the EOI routine outside of the irq_desc handlers logic.

It's used either by clear_IO_APIC(), which gets called before
io_apic_pin_eoi is allocated, or by check_timer() and/or
unlock_ExtINT_logic() both of which will perform an
ioapic_write_entry() before the clear_IO_APIC_pin() call.

I've done some XenRT testing with a modified patch that kept the
io_apic_pin_eoi as unsigned int, used the sentinel as init value and
added an assert in __io_apic_eoi() that the value in the array was
never IRQ_VECTOR_UNASSIGNED when the io_apic_pin_eoi was allocated.
This never triggered on any hardware XenRT tested on.

Maybe this seems to fragile, and you both prefer to keep the sentinel
just in case?

Thanks, Roger.

