Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431DB9B442D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827103.1241602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hYY-0004Bs-9o; Tue, 29 Oct 2024 08:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827103.1241602; Tue, 29 Oct 2024 08:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hYY-00049d-60; Tue, 29 Oct 2024 08:26:26 +0000
Received: by outflank-mailman (input) for mailman id 827103;
 Tue, 29 Oct 2024 08:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzX=RZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5hYW-0003rl-IM
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:26:24 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad5a196-95cf-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 09:26:22 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so3474365f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:26:22 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b1333bsm11741948f8f.14.2024.10.29.01.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 01:26:21 -0700 (PDT)
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
X-Inumbo-ID: 7ad5a196-95cf-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730190382; x=1730795182; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M53joM6a+vZJrowQ1EN43faC45OotYxJB992c9BKnlE=;
        b=cEbv8P1RWl1q72aLZO5ONdoHJXZ3ZmkTqV/LzDbbDS2cOe2FP2DiQOHlDkFQalrXeX
         IT1k5XWQm77BEBHJokuRxkoO2c3oUhYpIR2wNCoIKWKYmX+S8Y5JMhoCYU7MMXWaOZUK
         k89eu7WZWpcTylmVKGsT9Xv612aBra4/gow/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190382; x=1730795182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M53joM6a+vZJrowQ1EN43faC45OotYxJB992c9BKnlE=;
        b=uSm/KA6iszSlVUYuKUXmlESQahxMXCHT9FdV7b7IKCFI+5k7vd9CY/wWJm1UAP1bWx
         Fv+50OnlIIAKXqmYfbylQyrX4SJvhlwNt+tJoBheL53hNY6HhW5/tsQMvsEc3NSEAnbu
         Jd8pZU2H3cjiOuKyZtp4ncwUixXaw22LHxJUNH4ZrQm2j7rNnoXmOkgIjdWbJuCJOcIT
         BvgCXaurFxV7gKux39F5hDLKEaYFhWB1MhODkcXvkXbU71e+ClvNey2Btdr2SfP1er8M
         4AN9G6tcxfa9dpsW7W9EaLeD+Z4oaxOZhcQNBrgOk+PHd9qF3OWW6LaRDEIJ2c6ZiOzq
         LGCA==
X-Forwarded-Encrypted: i=1; AJvYcCVTtsPEGsT8RtjY/+awF99IxQzw4eQMygbUlF94nkJitd2M04WTANOyVeDIwta9tDmkU6Il45Gs9NU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHt6VwR/OJZqspG+iGlLhmjbAOGr4Ec6GwJw9SgnFc5JvK786D
	p+eTpbVS4ZVgiu1bSHEOiCEO6xKW+wxAx2MpADZtDVcnMbb20PHcob9afdboano=
X-Google-Smtp-Source: AGHT+IHVJrvUjHm436X6GJnHStEcWv4e6aqm5H5Qk0+maKDOo05/3m+bCrXhwIUsDG4jxQjqUg/vMg==
X-Received: by 2002:adf:edc2:0:b0:37d:4ebe:164b with SMTP id ffacd0b85a97d-380611e1252mr7913261f8f.44.1730190381798;
        Tue, 29 Oct 2024 01:26:21 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:26:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
Message-ID: <ZyCcLPkiQOeSIAHu@macbook>
References: <20241024154844.8652-1-roger.pau@citrix.com>
 <abadac24-0392-4051-b6a2-08967272f1a1@suse.com>
 <Zx_IZUyNL-Iw-nrL@macbook>
 <51cce7e9-97c5-4c7d-957b-bc17b616fba1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51cce7e9-97c5-4c7d-957b-bc17b616fba1@suse.com>

On Tue, Oct 29, 2024 at 08:40:26AM +0100, Jan Beulich wrote:
> On 28.10.2024 18:22, Roger Pau Monné wrote:
> > On Mon, Oct 28, 2024 at 12:33:42PM +0100, Jan Beulich wrote:
> >> On 24.10.2024 17:48, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/io_apic.c
> >>> +++ b/xen/arch/x86/io_apic.c
> >>> @@ -71,6 +71,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
> >>>  
> >>>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
> >>>  
> >>> +/*
> >>> + * Store the EOI handle when using interrupt remapping.
> >>> + *
> >>> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> >>> + * format repurposes the vector field to store the offset into the Interrupt
> >>> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
> >>> + * longer matches the contents of the RTE vector field.  Add a translation
> >>> + * table so that directed EOI uses the value in the RTE vector field when
> >>> + * interrupt remapping is enabled.
> >>> + *
> >>> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
> >>> + * when using the remapped format, but use the translation table uniformly in
> >>> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> >>> + *
> >>> + * The matrix is accessed as [#io-apic][#pin].
> >>> + */
> >>> +static uint8_t **io_apic_pin_eoi;
> >>
> >> Wasn't the conclusion from the v1 discussion that this needs to be a signed
> >> type wider than 8 bits?
> >>
> >>> @@ -298,6 +323,9 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
> >>>      /* Prefer the use of the EOI register if available */
> >>>      if ( ioapic_has_eoi_reg(apic) )
> >>>      {
> >>> +        if ( io_apic_pin_eoi )
> >>> +            vector = io_apic_pin_eoi[apic][pin];
> >>> +
> >>>          /* If vector is unknown, read it from the IO-APIC */
> >>>          if ( vector == IRQ_VECTOR_UNASSIGNED )
> >>>              vector = __ioapic_read_entry(apic, pin, true).vector;
> >>
> >> In addition to what Andrew said here, for this comparison the make sense
> >> ...
> >>
> >>> @@ -1022,7 +1050,20 @@ static void __init setup_IO_APIC_irqs(void)
> >>>  
> >>>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
> >>>  
> >>> +    if ( iommu_intremap )
> >>> +    {
> >>> +        io_apic_pin_eoi = xzalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
> >>> +        BUG_ON(!io_apic_pin_eoi);
> >>> +    }
> >>> +
> >>>      for (apic = 0; apic < nr_ioapics; apic++) {
> >>> +        if ( iommu_intremap )
> >>> +        {
> >>> +            io_apic_pin_eoi[apic] = xzalloc_array(typeof(**io_apic_pin_eoi),
> >>> +                                                  nr_ioapic_entries[apic]);
> >>> +            BUG_ON(!io_apic_pin_eoi[apic]);
> >>> +        }
> >>
> >> ... doesn't the array also need -1 (== IRQ_VECTOR_UNASSIGNED) filling,
> >> rather than zero-filling?
> > 
> > Replying here to both you and Andrews question.  My analysis is that
> > a sentinel is not needed.  clear_IO_APIC_pin() is the only function
> > that calls the EOI routine outside of the irq_desc handlers logic.
> > 
> > It's used either by clear_IO_APIC(), which gets called before
> > io_apic_pin_eoi is allocated,
> 
> Or long after, from disable_IO_APIC().
> 
> > or by check_timer() and/or
> > unlock_ExtINT_logic() both of which will perform an
> > ioapic_write_entry() before the clear_IO_APIC_pin() call.
> 
> In unlock_ExtINT_logic() I see a call to ioapic_read_entry(), whereas the
> call to ioapic_write_entry() happens only later. In check_timer() I'm also
> uncertain a write would occur in _all_ cases. It certainly should occur,
> or else chances are low that the timer interrupt would actually work. Yet
> we surely want to avoid making hard to debug corner cases yet more subtle.

Didn't mention it here, but setup_IO_APIC_irqs() will also perform an
__ioapic_write_entry() call for almost all pins.

> > I've done some XenRT testing with a modified patch that kept the
> > io_apic_pin_eoi as unsigned int, used the sentinel as init value and
> > added an assert in __io_apic_eoi() that the value in the array was
> > never IRQ_VECTOR_UNASSIGNED when the io_apic_pin_eoi was allocated.
> > This never triggered on any hardware XenRT tested on.
> > 
> > Maybe this seems to fragile, and you both prefer to keep the sentinel
> > just in case?
> 
> Well, how certain are you that this testing in particular covered e.g. all
> the quirk cases that check_timer() tries to deal with?

That indeed I cannot guarantee, as I don't have coverage figures for
the XenRT runs.

Seeing as there's too much uncertainty about whether the array will be
initialized, I will go back to the approach of having a sentinel.
Andrew suggested to use a 16bit types, would you agree to that or do
you prefer to use unsigned int as originally proposed?

Thanks, Roger.

