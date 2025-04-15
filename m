Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E905CA89951
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952444.1347880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4d9N-0000Bn-Px; Tue, 15 Apr 2025 10:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952444.1347880; Tue, 15 Apr 2025 10:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4d9N-00009I-N7; Tue, 15 Apr 2025 10:04:17 +0000
Received: by outflank-mailman (input) for mailman id 952444;
 Tue, 15 Apr 2025 10:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4d9M-00009C-SS
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:04:16 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6defdea-19e0-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:04:05 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so893670266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:04:05 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acaa1ccc135sm1069658566b.157.2025.04.15.03.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 03:04:04 -0700 (PDT)
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
X-Inumbo-ID: f6defdea-19e0-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744711445; x=1745316245; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpPBqdbVg5LstLE2FO9qS/9lR3THiGzgfVosT1uJr7I=;
        b=nfiMPUuqwoae94N+iqHT62y84+Ld5dHbiEdEVotCznKF3RoVtK3YwEng3JIRv9tguS
         7VmMwvLEgCOIQE+iuDnLsAjQ0sAf3aSPPLVayKXwdv5MoV8e7YlZaoJMkewsMQo2nhs5
         r/zpYgoKoK3TXRNzzcfF/OMLM+lJIY8ur4EXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744711445; x=1745316245;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpPBqdbVg5LstLE2FO9qS/9lR3THiGzgfVosT1uJr7I=;
        b=L0wib2odx2T7v5nEhL8K0wdt5txNRoE1IUcYhcGlecgtGO3yc6AOTsdNxqRIwPk6bO
         Iw9yO3imTcnSGt0eNZSYGFEguGkUYm+DW+sLx1ynghTdeonosEZ3slQdfkWqyXgHm/BQ
         PH7Jd8VjeiyMfmISXhxFHDCg2PUA0SN8RLUHDFGZam7OCKObNfe/ohOXyTcnvyx80LTM
         /zJH0P1EZy73kHs+jEgmJgn4bin3YOopfkZ/vlGkDfM4Sr45QbdSt2KTjWWy7fqr4n3+
         vBeB6OkCFdkeiRN0ZPtjdqr73LDKyJMJuqOVwa2/QZictNlQ5wsdE3rXoz64zg9GMGmB
         7gtw==
X-Forwarded-Encrypted: i=1; AJvYcCVBMQkt9PUcL4DW1ouBRO75vyAYEzlbYlahx92lIglPU+0abuiHwNZ4HAWcKsiRtBtMD1Lh8Ubqa3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZMC8cqxaRReyOrSAhc5Rw79FmWxB6GWpcsuoUo9TRrhwnuOaT
	4ONRiw3bIqUDD4/yxWNXGquWshTB6UR+aoNVIvHvGZTAtLxRztKJI0QyLiGuXw0=
X-Gm-Gg: ASbGncvBfyqh6PdLugxDyAABHpbTVoB0UBRcanPxMGra0wrhX755s4MCHHg15JBnN+l
	OLtnRf6dTElDJohvtEedmsDWFCYrEA/fjvE39gxCajo79RlNUMNST7gfdbv/tm5PW4ILuPglXZX
	7tA0DQUMShmKebH3prYFQQdLbdhs5eTvNn6u4DDuPVJN2xSkuxOaHSUXZ6bG00VYyAVQslYxsO3
	0G4dlz6ROwVCZ8337xrxxat5wYxjEPOeti47ZWl2iJqvoAofPdTuyYZIGxJ/9ubyquytrglxytN
	3A0cMR0Hg3eg+LW/r2ttdEZ7/VNevIv+pwFdpl7prv/XiA==
X-Google-Smtp-Source: AGHT+IFUOYLmAHomVvTtFMO/m85cHIk0QOzpGzS+Gg+9RDAM9uU3gf6f/5d29+sSvR83i+d2g9hnDw==
X-Received: by 2002:a17:907:9715:b0:ac7:c79d:f8ce with SMTP id a640c23a62f3a-acad36d7acbmr1291226966b.57.1744711444779;
        Tue, 15 Apr 2025 03:04:04 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:04:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <Z_4vE1qHlvGliqXY@macbook.lan>
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
 <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
 <Z_4aBL7JhTv_oxWR@macbook.lan>
 <4dd5ada8-32e7-4b94-b2a4-51b20e09eb79@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dd5ada8-32e7-4b94-b2a4-51b20e09eb79@suse.com>

On Tue, Apr 15, 2025 at 11:41:27AM +0200, Jan Beulich wrote:
> On 15.04.2025 10:34, Roger Pau Monné wrote:
> > On Tue, Apr 15, 2025 at 09:32:37AM +0200, Jan Beulich wrote:
> >> On 14.04.2025 18:13, Roger Pau Monné wrote:
> >>> On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
> >>>> On 14.04.2025 15:53, Roger Pau Monné wrote:
> >>>>> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
> >>>>>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
> >>>>>> p2m_mmio_direct.
> >>>>>
> >>>>> But that won't go into hvm_hap_nested_page_fault() when using
> >>>>> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
> >>>>> mapped as p2m_mmio_direct)?
> >>>>>
> >>>>> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
> >>>>> differently?
> >>>>
> >>>> All true as long as things work as expected (potentially including the guest
> >>>> also behaving as expected). Also this was explicitly only an example I could
> >>>> readily think of. I'm simply wary of handle_mmio_with_translation() now
> >>>> getting things to handle it's not meant to ever see.
> >>>
> >>> How was access to MMIO r/o regions supposed to be handled before
> >>> 33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
> >>> added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
> >>> (~2010), yet I can't figure out how writes would be handled back then
> >>> that didn't result in a p2m fault and crashing of the domain.
> >>
> >> Was that handled at all before said change?
> > 
> > Not really AFAICT, hence me wondering how where write accesses to r/o
> > MMIO regions supposed to be handled by (non-priv) domains.  Was the
> > expectation that those writes trigger an p2m violation thus crashing
> > the domain?
> 
> I think so, yes. Devices with such special areas weren't (aren't?) supposed
> to be handed to DomU-s.

Oh, I see.  That makes stuff a bit clearer.  I think we would then
also want to add some checks to {ept_}p2m_type_to_flags()?

I wonder why handling of mmio_ro_ranges was added to the HVM p2m code
in ~2010 then.  If mmio_ro_ranges is only supposed to be relevant for
the hardware domain in ~2010 an HVM dom0 was not even in sight?

Sorry to ask so many questions, I'm a bit confused about how this
was/is supposed to work.

> >> mmio_ro_do_page_fault() was
> >> (and still is) invoked for the hardware domain only, and quite likely
> >> the need for handling (discarding) writes for PVHv1 had been overlooked
> >> until someone was hit by the lack thereof.
> > 
> > I see, I didn't realize r/o MMIO was only handled for PV hardware
> > domains only.  I could arguably do the same for HVM in
> > hvm_hap_nested_page_fault().
> > 
> > Not sure whether the subpage stuff is supposed to be functional for
> > domains different than the hardware domain?  It seems to be available
> > to the hanrdware domain only for PV guests, while for HVM is available
> > for both PV and HVM domains:
> 
> DYM Dom0 and DomU here?

Indeed, sorry.

> > is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, gla)
> > 
> > In hvm_hap_nested_page_fault().
> 
> See the three XHCI_SHARE_* modes. When it's XHCI_SHARE_ANY, even DomU-s
> would require this handling. It looks like a mistake that we permit the
> path to be taken for DomU-s even when the mode is XHCI_SHARE_HWDOM.

Arguable a domU will never get the device assigned in the first place
unless the share mode is set to XHCI_SHARE_ANY.  For the other modes
the device is hidden, and hence couldn't be assigned to a domU anyway.

> It
> also looks like a mistake that the PV path has remained Dom0-only, even
> in the XHCI_SHARE_ANY case. Cc-ing Marek once again ...
> 
> >>> I'm happy to look at other ways to handling this, but given there's
> >>> current logic for handling accesses to read-only regions in
> >>> hvm_hap_nested_page_fault() I think re-using that was the best way to
> >>> also handle accesses to MMIO read-only regions.
> >>>
> >>> Arguably it would already be the case that for other reasons Xen would
> >>> need to emulate an instruction that accesses a read-only MMIO region?
> >>
> >> Aiui hvm_translate_get_page() will yield HVMTRANS_bad_gfn_to_mfn for
> >> p2m_mmio_direct (after all, "direct" means we expect no emulation is
> >> needed; while arguably wrong for the introspection case, I'm not sure
> >> that and pass-through actually go together). Hence it's down to
> >> hvmemul_linear_mmio_access() -> hvmemul_phys_mmio_access() ->
> >> hvmemul_do_mmio_buffer() -> hvmemul_do_io_buffer() -> hvmemul_do_io(),
> >> which means that if hvm_io_intercept() can't handle it, the access
> >> will be forwarded to the responsible DM, or be "processed" by the
> >> internal null handler.
> >>
> >> Given this, perhaps what you do is actually fine. At the same time
> >> note how several functions in hvm/emulate.c simply fail upon
> >> encountering p2m_mmio_direct. These are all REP handlers though, so
> >> the main emulator would then try emulating the insn the non-REP way.
> > 
> > I'm open to alternative ways of handling such accesses, just used what
> > seemed more natural in the context of hvm_hap_nested_page_fault().
> > 
> > Emulation of r/o MMIO accesses failing wouldn't be an issue from Xen's
> > perspective, that would "just" result in the guest getting a #GP
> > injected.
> 
> That's not the part I'm worried about. What worries me is that we open up
> another (or better: we're widening a) way to hit the emulator in the first
> place. (Plus, as said, the issue with the not really tidy P2M type system.)

But the hit would be limited to domains having r/o p2m_mmio_direct
entries in the p2m, as otherwise the path would be unreachable?

> > Would you like me to add some of your reasoning above to the commit
> > message?
> 
> While I'd still be a little hesitant as to ack-ing of the result, I think
> that's all I'm really asking for, yes.

As said before - I'm happy to consider suggestions here, I don't want
to fix this with yet another bodge that will cause us further issues
down the road.  What I proposed seemed like the most natural way to
handle those accesses IMO, but I'm not an expert on the emulator.

Thanks, Roger.

