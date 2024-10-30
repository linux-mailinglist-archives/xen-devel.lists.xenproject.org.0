Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02979B5FBB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827988.1242772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65e9-0000Xi-KS; Wed, 30 Oct 2024 10:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827988.1242772; Wed, 30 Oct 2024 10:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65e9-0000WL-Fj; Wed, 30 Oct 2024 10:09:49 +0000
Received: by outflank-mailman (input) for mailman id 827988;
 Wed, 30 Oct 2024 10:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t65e7-0000V6-FE
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:09:47 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15ab031b-96a7-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:09:44 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cb6704ff6bso8300793a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:09:44 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e214152adsm176141066b.92.2024.10.30.03.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 03:09:43 -0700 (PDT)
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
X-Inumbo-ID: 15ab031b-96a7-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE1YWIwMzFiLTk2YTctMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjgyOTg0LjA3Nzk3Miwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730282984; x=1730887784; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/TaqhDrJgkG90fMakbtwmrVdt8qJmsd4pUICkuBKk8=;
        b=BvA4V3M6hXoBkc73hBbtSN2HnRggAxkUfunc0FSUI8bakTzLrrL9M/c0XHOXg1d8eP
         8klxd/eKPdORuvxGwFb44RC+4y6+kp40luBWZLcQxHCaY+Dm3Fhix4CE6QaFHuDuOKwd
         QVCzH2W9QNi4+hCP4lbB12o7Q69jifwufPHS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282984; x=1730887784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/TaqhDrJgkG90fMakbtwmrVdt8qJmsd4pUICkuBKk8=;
        b=uTW/LqKAe2y9LAS7DC6Wi88g9VM0YkN5G57kP8hHoZR4W7Rqjr3hJP+ZNyBGneZ6Ig
         aLu7cMYP1e0KL8W2QLAfBxur0Lgl0trQfplBhtWC3H0sgSVAI4J7B1B8NyxVdFd4dAW8
         xtgqEu+YmxyehbPC1n8xFcYK8JaeFy5zD2HkJngDDpRNsAWJKQAxw56NkaB7N2jKDJGq
         P9usgwwmF0aUVPFSexwHQsc3TW8XFufGMmDAyR9oVTGw1mNyTCs12xiAVItSPyZ5P3LH
         O0Fa1YYK6NJufwMvSMJe6+2Hn296yhguZuQTC+q+JH3epjN1HTWO3qQxYrquToJW+jV3
         iwOA==
X-Forwarded-Encrypted: i=1; AJvYcCUEysYbeRdKlHCPEjqZP3VkrytXq4FlpVYeklQI+dLyIaQ1UGa1GNbDGS13XMAxg0nPh6q6EJwFggk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMfWn8eqOFx351GdmOJkMOHgP/0G/WUaT9yvPC7OdHVD1M6fQg
	woHukAdhoLhc0+uYiYiemkC6E+3pcIllhSeBLnCimZ/CPlYl35wu6oZL00I8bNI=
X-Google-Smtp-Source: AGHT+IGYrkxUQtxZx104qgkPVWtZc2tb1JvTGOf0UVsxgLEouGWyXnLInwUGc+//JIlzjKsJAKKVMQ==
X-Received: by 2002:a17:907:9446:b0:a9a:1165:1bb with SMTP id a640c23a62f3a-a9de619a3d1mr1297200966b.65.1730282983407;
        Wed, 30 Oct 2024 03:09:43 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:09:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
Message-ID: <ZyIF5qYU8dC-yYNW@macbook>
References: <20241029110351.40531-1-roger.pau@citrix.com>
 <53034f16-682e-4081-ab7e-81338c700f85@suse.com>
 <ZyEf8hK-XyGn6Kp8@macbook>
 <d03f58f0-5b93-4b23-85cb-dc2c18a4eb41@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d03f58f0-5b93-4b23-85cb-dc2c18a4eb41@suse.com>

On Wed, Oct 30, 2024 at 10:41:40AM +0100, Jan Beulich wrote:
> On 29.10.2024 18:48, Roger Pau Monné wrote:
> > On Tue, Oct 29, 2024 at 05:43:24PM +0100, Jan Beulich wrote:
> >> On 29.10.2024 12:03, Roger Pau Monne wrote:
> >> Plus with what you said
> >> earlier about vector vs EOI handle, and with the code using "vector" all over the
> >> place, their (non-)relationship could also do with clarifying (perhaps better in
> >> a code comment in __io_apic_eoi()).
> > 
> > I've attempted to clarify the relation between vector vs EOI handle in
> > the first paragraph, and how that applies to AMD-Vi.  I can move
> > (part?) of that into the comment in __ioapic_write_entry(), maybe:
> > 
> > /*
> >  * Might be called before io_apic_pin_eoi is allocated.  Entry will be
> >  * updated once the array is allocated and there's a write against the
> >  * pin.
> >  *
> >  * Note that the vector field is only cached for raw RTE writes when
> >  * using IR.  In that case the vector field might have been repurposed
> >  * to store something different than the target vector, and hence need
> >  * to be cached for performing EOI.
> >  */
> 
> Sounds okay to me, yet I'd prefer a comment in __io_apic_eoi(), where it
> may want wording a little differently.

OK, let me try to add another comment for __io_apic_eoi() in v4 then.

> >>> @@ -273,6 +293,13 @@ void __ioapic_write_entry(
> >>>      {
> >>>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> >>>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> >>> +        /*
> >>> +         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
> >>> +         * Entry will be updated once the array is allocated and there's a
> >>> +         * write against the pin.
> >>> +         */
> >>> +        if ( io_apic_pin_eoi )
> >>> +            io_apic_pin_eoi[apic][pin] = e.vector;
> >>
> >> The comment here looks a little misleading to me. clear_IO_APIC_pin() calls
> >> here to, in particular, set the mask bit. With the mask bit the vector isn't
> >> meaningful anyway (and indeed clear_IO_APIC_pin() sets it to zero, at which
> >> point recording IRQ_VECTOR_UNASSIGNED might be better than the bogus vector
> >> 0x00).
> > 
> > Note that clear_IO_APIC_pin() performs the call to
> > __ioapic_write_entry() with raw == false, at which point
> > __ioapic_write_entry() will call iommu_update_ire_from_apic() if IOMMU
> > IR is enabled.  The cached 'vector' value will be the IOMMU entry
> > offset for the AMD-Vi case, as the IOMMU code will perform the call to
> > __ioapic_write_entry() with raw == true.
> > 
> > What matters is that the cached value matches what's written in the
> > IO-APIC RTE, and the current logic ensures this.
> > 
> > What's the benefit of using IRQ_VECTOR_UNASSIGNED if the result is
> > reading the RTE and finding that vector == 0?
> 
> It's not specifically the vector == 0 case alone. Shouldn't we leave
> the latched vector alone when writing an RTE with the mask bit set?

I'm not sure what's the benefit of the extra logic to detect such
cases, just to avoid a write to the io_apic_pin_eoi matrix.

> Any still pending EOI (there should be none aiui) can't possibly
> target the meaningless vector / index in such an RTE. Perhaps it was
> wrong to suggest to overwrite (with IRQ_VECTOR_UNASSIGNED) what we
> have on record.
> 
> Yet at the same time there ought to be a case where the recorded
> indeed moves back to IRQ_VECTOR_UNASSIGNED.

The only purpose of the io_apic_pin_eoi matrix is to cache what's
currently in the RTE entry 'vector' field.  I don't think we should
attempt to add extra logic as to whether the entry is valid, or
masked.  Higher level layers should already take care of that.  The
only purpose of the logic added in this patch is to ensure the EOI is
performed using what's in the RTE vector field for the requested pin.
Anything else is out of scope IMO.

Another option, which would allow to make the matrix store uint8_t
elements would be to initialize it at allocation with the RTE vector
fields currently present, IOW: do a raw read of every RTE and set the
fetched vector field in io_apic_pin_eoi.  Would that be better to you,
as also removing the need to ever store IRQ_VECTOR_UNASSIGNED?

> > Looking at clear_IO_APIC_pin() - I think the function is slightly
> > bogus.  If entry.trigger is not set, the logic to switch the entry to
> > level triggered  will fetch the entry contents without requesting a
> > raw RTE, at which point the entry.vector field can not be used as
> > the EOI handle since it will contain the vector, not the IR table
> > offset.  I will need to make a further patch to fix this corner
> > case.
> 
> Is there actually a reason not to pass IRQ_VECTOR_UNASSIGNED there,
> to have __io_apic_eoi() determine the vector? (But of course we can
> also latch entry.vector from the earlier raw read.)

Yes, it should pass IRQ_VECTOR_UNASSIGNED IMO.  The extra cost of
doing the RTE read is not an issue on that init-only path.

> >>> @@ -298,9 +325,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
> >>>      /* Prefer the use of the EOI register if available */
> >>>      if ( ioapic_has_eoi_reg(apic) )
> >>>      {
> >>> +        if ( io_apic_pin_eoi )
> >>> +            vector = io_apic_pin_eoi[apic][pin];
> >>> +
> >>>          /* If vector is unknown, read it from the IO-APIC */
> >>>          if ( vector == IRQ_VECTOR_UNASSIGNED )
> >>> +        {
> >>>              vector = __ioapic_read_entry(apic, pin, true).vector;
> >>
> >> Related to my comment higher up regarding vector vs EOI handle: Here we're
> >> doing a raw read, i.e. we don't really fetch the vector but the EOI handle
> >> in the AMD case. Why is it that this isn't sufficient for directed EOI to
> >> work (perhaps with the conditional adjusted)?
> > 
> > It is enough, but we don't want to be doing such read for each EOI,
> > hence why we cache it in io_apic_pin_eoi.
> 
> Yet then the patch is to a fair part about improving performance, when the
> functionality issue could be addressed with a far less intrusive change.

More than improving performance the patch is about not degrading it by
forcing an RTE read for each EOI.

I expect there's no such read ATM, since the vector should be provided
by irq_desc.  Adding an unconditional RTE read for each EOI would be
an unjustified performance penalty for this fix to introduce.

> Which may in particular make a difference with backporting in mind. Plus
> that may want at least mentioning in the description.
> 
> >> Then again - are we ever taking this path? Certainly not when coming from
> >> clear_IO_APIC_pin(), hence ...
> >>
> >>> +            if ( io_apic_pin_eoi )
> >>
> >> ... I'm unconvinced this conditional is needed.
> > 
> > Hm, maybe.  I can adjust but seems more fragile to trigger a
> > dereference for the extra cost of a conditional in what should be a
> > non-common path anyway.
> 
> Well, I was thinking of transforming the if() into ASSERT().

See my suggestion above about getting rid of IRQ_VECTOR_UNASSIGNED in
io_apic_pin_eoi altogether.

Thanks, Roger.

