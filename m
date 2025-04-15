Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE72A89E89
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 14:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953802.1348219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fhU-0003xk-Di; Tue, 15 Apr 2025 12:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953802.1348219; Tue, 15 Apr 2025 12:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fhU-0003vw-99; Tue, 15 Apr 2025 12:47:40 +0000
Received: by outflank-mailman (input) for mailman id 953802;
 Tue, 15 Apr 2025 12:47:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4fhS-0003RD-Vy
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:47:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccf59e6d-19f7-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 14:47:33 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so45994205e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 05:47:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f37a78fe8sm159393475e9.40.2025.04.15.05.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:47:32 -0700 (PDT)
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
X-Inumbo-ID: ccf59e6d-19f7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744721253; x=1745326053; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qG3Y5oqjyXuqRRg3FXeK2kr+BB67j/TDORm84MNIPBI=;
        b=FZdGt/HIMfv5N3NvCB08xfm35nWf8wa1NIYcJFX5sTFCZ3IRvxJBwGudPxiFIR+rcZ
         Gi9G/RfB5wXQLUNMFMRedHkrXZtnpp/2Y9WFcZQzuGXslaGA8Wg/48x/ZE2fxDRnsRpb
         FpZ1ND3te8mV3aOjQfk0gMvryicOUPxS4xZGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721253; x=1745326053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qG3Y5oqjyXuqRRg3FXeK2kr+BB67j/TDORm84MNIPBI=;
        b=V9ecdY/YNKvSq9uuTWePPwOFbuUs9nB31XUv4481cbtNaShW8F6ntgYeKwGSJF1s/5
         0rg2O+Os7q66z0l2IQvVfYBaYfoh0dKp6B1wKH23PrJt9IpDxiPh9bbfDZ7gyCiNWy4u
         Wrn5iGV9dS1h9mYC5oBt+ksE5BdMXdOvl/BU4FRPuoQ4FQoyHhzZ8y1Zybk2YiqTUt+h
         g80JtjE6lSATBokkfL/rrv0+IZiF8NNIVup3wSGcIjUw1f7DTF41SbIhsbLN8XtD56K0
         pnkDEKmTw8Q6vY0Ea7+wdAqZ4AAC+jdGiefPm+Sr4CXLnTTkJ5zG2O9tccDFoNnT2WZT
         4Xzw==
X-Forwarded-Encrypted: i=1; AJvYcCW7X0ugGtlryIO+8HbYJ/ffgxEH5IzvnHJs8er1IGJ0GFgl9eSwvB9z31usWO0Mr0+3s8cJJ252klU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfjjJRa57JFg8rHAjGFkCp1KgFwp9ed3diJ44pRUDehABmYHzm
	ZRMzQ1tiS4b/Ftu5jrPVM1jGTJHXN3oSQ/LpK/dBvP0WxatjuUf4g1mIgdQUCrA=
X-Gm-Gg: ASbGncvSl8dDJ03PyJ2r79IKdylkNEOTNcSuMbUGnwpOIu7+kzKwhFbTJV8+IjUf8Pg
	WOBCOvcT+0YzXzj5e3h7XEJDnL2niwXvgcAPVYdPAK1p8fBKSCYizZ95HxkEVysBN14RKc8aAEd
	WPI1muLRIzYJ6Ulxi72QLjZq7u18poyaiIoOOmHJMIL5dd5bgMBq64rYAyVuycCI909q+qGX183
	rq2lkyhGmMnb5ITfhDf2e1gUGF1Qim7rEbxWprIGgCd0opQkd5aG6TWGiIeoEPCuqaZixTkg2iz
	Tue7ix4/kHAISiNxOWimG8/Tg8hrGXNWnogkHtE8fz/aHWY2nUrEoZBl
X-Google-Smtp-Source: AGHT+IHCWglDnDg3a1k+hQFVGeDk1PiV2LFUOj4gOrFjGGonKrNOpZn/jdB3fI5mRykxQ8X23tlu0g==
X-Received: by 2002:a05:600c:1f14:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43f3a93fa6bmr143272685e9.13.1744721253028;
        Tue, 15 Apr 2025 05:47:33 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:47:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <Z_5DKdVBG52mTN0U@macbook.lan>
References: <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
 <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
 <Z_4aBL7JhTv_oxWR@macbook.lan>
 <4dd5ada8-32e7-4b94-b2a4-51b20e09eb79@suse.com>
 <Z_4vE1qHlvGliqXY@macbook.lan>
 <0c74e9c9-c01d-4213-af01-cc287d1ef76b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c74e9c9-c01d-4213-af01-cc287d1ef76b@suse.com>

On Tue, Apr 15, 2025 at 12:18:04PM +0200, Jan Beulich wrote:
> On 15.04.2025 12:04, Roger Pau Monné wrote:
> > On Tue, Apr 15, 2025 at 11:41:27AM +0200, Jan Beulich wrote:
> >> On 15.04.2025 10:34, Roger Pau Monné wrote:
> >>> On Tue, Apr 15, 2025 at 09:32:37AM +0200, Jan Beulich wrote:
> >>>> On 14.04.2025 18:13, Roger Pau Monné wrote:
> >>>>> On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
> >>>>>> On 14.04.2025 15:53, Roger Pau Monné wrote:
> >>>>>>> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
> >>>>>>>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
> >>>>>>>> p2m_mmio_direct.
> >>>>>>>
> >>>>>>> But that won't go into hvm_hap_nested_page_fault() when using
> >>>>>>> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
> >>>>>>> mapped as p2m_mmio_direct)?
> >>>>>>>
> >>>>>>> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
> >>>>>>> differently?
> >>>>>>
> >>>>>> All true as long as things work as expected (potentially including the guest
> >>>>>> also behaving as expected). Also this was explicitly only an example I could
> >>>>>> readily think of. I'm simply wary of handle_mmio_with_translation() now
> >>>>>> getting things to handle it's not meant to ever see.
> >>>>>
> >>>>> How was access to MMIO r/o regions supposed to be handled before
> >>>>> 33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
> >>>>> added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
> >>>>> (~2010), yet I can't figure out how writes would be handled back then
> >>>>> that didn't result in a p2m fault and crashing of the domain.
> >>>>
> >>>> Was that handled at all before said change?
> >>>
> >>> Not really AFAICT, hence me wondering how where write accesses to r/o
> >>> MMIO regions supposed to be handled by (non-priv) domains.  Was the
> >>> expectation that those writes trigger an p2m violation thus crashing
> >>> the domain?
> >>
> >> I think so, yes. Devices with such special areas weren't (aren't?) supposed
> >> to be handed to DomU-s.
> > 
> > Oh, I see.  That makes stuff a bit clearer.  I think we would then
> > also want to add some checks to {ept_}p2m_type_to_flags()?
> > 
> > I wonder why handling of mmio_ro_ranges was added to the HVM p2m code
> > in ~2010 then.  If mmio_ro_ranges is only supposed to be relevant for
> > the hardware domain in ~2010 an HVM dom0 was not even in sight?
> 
> I fear because I was wrong with what I said in the earlier reply: There's
> one exception - the MSI-X tables of devices. DomU-s (and even Dom0) aren't
> supposed to access them directly, but we'd permit reads (which, at least
> back at the time, were also required to keep qemu working).

Hm, but reads to the MSI-X table for HVM domains will go through QEMU,
and hence not hit the r/o MMIO path, because the MSI-X table will
never be mapped to an HVM guest p2m?

Reads from QEMU are indeed different, but those where always made from
a PV domain.  As said above - HVM guests never got to see the native
MSI-X table at all.

> >>>>> I'm happy to look at other ways to handling this, but given there's
> >>>>> current logic for handling accesses to read-only regions in
> >>>>> hvm_hap_nested_page_fault() I think re-using that was the best way to
> >>>>> also handle accesses to MMIO read-only regions.
> >>>>>
> >>>>> Arguably it would already be the case that for other reasons Xen would
> >>>>> need to emulate an instruction that accesses a read-only MMIO region?
> >>>>
> >>>> Aiui hvm_translate_get_page() will yield HVMTRANS_bad_gfn_to_mfn for
> >>>> p2m_mmio_direct (after all, "direct" means we expect no emulation is
> >>>> needed; while arguably wrong for the introspection case, I'm not sure
> >>>> that and pass-through actually go together). Hence it's down to
> >>>> hvmemul_linear_mmio_access() -> hvmemul_phys_mmio_access() ->
> >>>> hvmemul_do_mmio_buffer() -> hvmemul_do_io_buffer() -> hvmemul_do_io(),
> >>>> which means that if hvm_io_intercept() can't handle it, the access
> >>>> will be forwarded to the responsible DM, or be "processed" by the
> >>>> internal null handler.
> >>>>
> >>>> Given this, perhaps what you do is actually fine. At the same time
> >>>> note how several functions in hvm/emulate.c simply fail upon
> >>>> encountering p2m_mmio_direct. These are all REP handlers though, so
> >>>> the main emulator would then try emulating the insn the non-REP way.
> >>>
> >>> I'm open to alternative ways of handling such accesses, just used what
> >>> seemed more natural in the context of hvm_hap_nested_page_fault().
> >>>
> >>> Emulation of r/o MMIO accesses failing wouldn't be an issue from Xen's
> >>> perspective, that would "just" result in the guest getting a #GP
> >>> injected.
> >>
> >> That's not the part I'm worried about. What worries me is that we open up
> >> another (or better: we're widening a) way to hit the emulator in the first
> >> place. (Plus, as said, the issue with the not really tidy P2M type system.)
> > 
> > But the hit would be limited to domains having r/o p2m_mmio_direct
> > entries in the p2m, as otherwise the path would be unreachable?
> 
> I fear I don't follow - all you look for in the newly extended conditional
> is the type being p2m_mmio_direct. There's no r/o-ness being checked for
> until we'd make it through the emulator and into subpage_mmio_accept().

Well, it's a write page-fault of a type with p2m_mmio_direct.  What
about limiting the path even further by checking for mmio_ro_ranges:

    if ( (p2mt == p2m_mmio_dm) ||
         (npfec.write_access &&
          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
           (p2mt == p2m_mmio_direct &&
            rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn))))) )
    {

Thanks, Roger.

