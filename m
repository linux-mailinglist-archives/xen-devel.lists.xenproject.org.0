Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA39B630C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 13:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828190.1243052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67mC-0004AR-Re; Wed, 30 Oct 2024 12:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828190.1243052; Wed, 30 Oct 2024 12:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67mC-000471-OC; Wed, 30 Oct 2024 12:26:16 +0000
Received: by outflank-mailman (input) for mailman id 828190;
 Wed, 30 Oct 2024 12:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOPv=R2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t67mA-0003Lc-G5
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 12:26:14 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25ee46a6-96ba-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 13:26:11 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c9850ae22eso8428559a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 05:26:11 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6319711sm4706162a12.66.2024.10.30.05.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 05:26:10 -0700 (PDT)
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
X-Inumbo-ID: 25ee46a6-96ba-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI1ZWU0NmE2LTk2YmEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjkxMTcxLjc5ODI2NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730291171; x=1730895971; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XosC4ofsdj4ddM0SddepXGJRxAECeo3pbyXOha3wJFI=;
        b=bAxUGirf3ItKKDprTKigEP7YpzoaeLdJw1u+HNg3Tv7dFjguqXQdrfQCZ/3kdC1WQt
         zYH3tUo4hGreZgbt1L5VI/FM/nKixRnTpdZYs44SZZ5gCnDGR+0HvCCKVGQwd2Chy8n6
         liWXhGp9Okgo2t6evXAAHZEfNFrSzAMgyi+60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291171; x=1730895971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XosC4ofsdj4ddM0SddepXGJRxAECeo3pbyXOha3wJFI=;
        b=BVcNyI+VM3CQWgPQEIriQN5556er/iRU/ZHOXR3AeUyUt+CxZ28dIBeAQfXSqKd6h3
         wgCmbBVMLEDoPFnNmngr+DUsXPq5l8K24gH6tXaiyU7Fbav1wGqjshFxdZivPo4HNPT0
         u/kESDcqRHifuxZuuMOA9L1ZfEM+ZgQctWoVfDxOwAQcykbWw8i6onVCjpO8UBhPTlrj
         jXjL61HefBhWTIWtEtYp/Ncv9I8g4SioOB2Hmy1G6FtgO+zhgZUbHf2zj7iwd+6taTr9
         KLiWa//6ow9k+Gq4N/57zRkj9Sp/tmO4YZS3nfyJPpkESZf7i9UYDRsPo+aWv7fQuK19
         lpRA==
X-Forwarded-Encrypted: i=1; AJvYcCUVdnKD8CPkvR67fuhR01xPquM3NWCSwA5ncOy+iKXKVn8UkyvMEYjzvAqOUC2rX+7S/MHXJ1E5kbc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZ0h3XXGwuHxw2AULB5mae/QOwoZzzVGPnwIhIWLzn35gjTAjy
	So/SkaHxPzvHYG7PtsvdLjXc3GiUPk5NTDAtYQ/g5Ut1vhRvzfk81GGkJU4jR3k=
X-Google-Smtp-Source: AGHT+IG7dXCICaB+Ziyi32mg339SV2GDtROJulJvPJmXXHqpU4L3t4Jd0rqdpLd+FCsjP+3qj2fFzg==
X-Received: by 2002:a05:6402:2688:b0:5c9:8ab0:2975 with SMTP id 4fb4d7f45d1cf-5cbbf876a51mr12466175a12.6.1730291171045;
        Wed, 30 Oct 2024 05:26:11 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:26:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
Message-ID: <ZyIl4azXy3ySD2SS@macbook>
References: <20241029110351.40531-1-roger.pau@citrix.com>
 <53034f16-682e-4081-ab7e-81338c700f85@suse.com>
 <ZyEf8hK-XyGn6Kp8@macbook>
 <d03f58f0-5b93-4b23-85cb-dc2c18a4eb41@suse.com>
 <ZyIF5qYU8dC-yYNW@macbook>
 <62f917f4-ff63-46b3-9b7f-f8d467bfa2f3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62f917f4-ff63-46b3-9b7f-f8d467bfa2f3@suse.com>

On Wed, Oct 30, 2024 at 11:57:39AM +0100, Jan Beulich wrote:
> On 30.10.2024 11:09, Roger Pau Monné wrote:
> > On Wed, Oct 30, 2024 at 10:41:40AM +0100, Jan Beulich wrote:
> >> On 29.10.2024 18:48, Roger Pau Monné wrote:
> >>> On Tue, Oct 29, 2024 at 05:43:24PM +0100, Jan Beulich wrote:
> >>>> On 29.10.2024 12:03, Roger Pau Monne wrote:
> >>>>> @@ -273,6 +293,13 @@ void __ioapic_write_entry(
> >>>>>      {
> >>>>>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
> >>>>>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> >>>>> +        /*
> >>>>> +         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
> >>>>> +         * Entry will be updated once the array is allocated and there's a
> >>>>> +         * write against the pin.
> >>>>> +         */
> >>>>> +        if ( io_apic_pin_eoi )
> >>>>> +            io_apic_pin_eoi[apic][pin] = e.vector;
> >>>>
> >>>> The comment here looks a little misleading to me. clear_IO_APIC_pin() calls
> >>>> here to, in particular, set the mask bit. With the mask bit the vector isn't
> >>>> meaningful anyway (and indeed clear_IO_APIC_pin() sets it to zero, at which
> >>>> point recording IRQ_VECTOR_UNASSIGNED might be better than the bogus vector
> >>>> 0x00).
> >>>
> >>> Note that clear_IO_APIC_pin() performs the call to
> >>> __ioapic_write_entry() with raw == false, at which point
> >>> __ioapic_write_entry() will call iommu_update_ire_from_apic() if IOMMU
> >>> IR is enabled.  The cached 'vector' value will be the IOMMU entry
> >>> offset for the AMD-Vi case, as the IOMMU code will perform the call to
> >>> __ioapic_write_entry() with raw == true.
> >>>
> >>> What matters is that the cached value matches what's written in the
> >>> IO-APIC RTE, and the current logic ensures this.
> >>>
> >>> What's the benefit of using IRQ_VECTOR_UNASSIGNED if the result is
> >>> reading the RTE and finding that vector == 0?
> >>
> >> It's not specifically the vector == 0 case alone. Shouldn't we leave
> >> the latched vector alone when writing an RTE with the mask bit set?
> > 
> > I'm not sure what's the benefit of the extra logic to detect such
> > cases, just to avoid a write to the io_apic_pin_eoi matrix.
> 
> Perhaps the largely theoretical concern towards having stale data
> somewhere. Yet ...
> 
> >> Any still pending EOI (there should be none aiui) can't possibly
> >> target the meaningless vector / index in such an RTE. Perhaps it was
> >> wrong to suggest to overwrite (with IRQ_VECTOR_UNASSIGNED) what we
> >> have on record.
> >>
> >> Yet at the same time there ought to be a case where the recorded
> >> indeed moves back to IRQ_VECTOR_UNASSIGNED.
> > 
> > The only purpose of the io_apic_pin_eoi matrix is to cache what's
> > currently in the RTE entry 'vector' field.  I don't think we should
> > attempt to add extra logic as to whether the entry is valid, or
> > masked.  Higher level layers should already take care of that.  The
> > only purpose of the logic added in this patch is to ensure the EOI is
> > performed using what's in the RTE vector field for the requested pin.
> > Anything else is out of scope IMO.
> > 
> > Another option, which would allow to make the matrix store uint8_t
> > elements would be to initialize it at allocation with the RTE vector
> > fields currently present, IOW: do a raw read of every RTE and set the
> > fetched vector field in io_apic_pin_eoi.  Would that be better to you,
> > as also removing the need to ever store IRQ_VECTOR_UNASSIGNED?
> 
> ... yes, that may make sense (and eliminate my concern there).
> 
> I wonder whether the allocation of the array then wouldn't better be
> moved earlier, to enable_IO_APIC(), such that clear_IO_APIC_pin()
> already can suitably update it. In fact, since that function writes
> zero[1], no extra reads would then be needed at all, and the array could
> simply start out all zeroed.

I agree with the suggestion to allocate and setup the io_apic_pin_eoi
matrix in enable_IO_APIC().  However, I'm not sure I follow your
suggestion about the matrix starting as all zeroes being a sane state.

I think we need to do the raw RTE reads in enable_IO_APIC() before
calling clear_IO_APIC(), otherwise clear_IO_APIC_pin() can call
__io_apic_eoi() before any __ioapic_write_entry() has been performed,
and hence the state of the RTE.vector field could possibly be out of
sync with the initial value in io_apic_pin_eoi, and the EOI not take
effect.

Thanks, Roger.

