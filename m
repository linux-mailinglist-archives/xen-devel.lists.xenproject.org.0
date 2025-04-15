Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7AA896D2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 10:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952303.1347794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4bkT-0001du-Sg; Tue, 15 Apr 2025 08:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952303.1347794; Tue, 15 Apr 2025 08:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4bkT-0001ba-Pb; Tue, 15 Apr 2025 08:34:29 +0000
Received: by outflank-mailman (input) for mailman id 952303;
 Tue, 15 Apr 2025 08:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4bkS-0001bU-0q
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 08:34:28 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c4081fe-19d4-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 10:34:19 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22438c356c8so58385135ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 01:34:19 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22ac7ccb32esm111471335ad.232.2025.04.15.01.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:34:17 -0700 (PDT)
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
X-Inumbo-ID: 6c4081fe-19d4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744706058; x=1745310858; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4hiuMvneI3AqnaIuOADhkB1rAJc9G6yK7WStBQlLMKA=;
        b=CtVlNp8q6YOBrBwAG+rfiFgb2q7V63H+MlKv8dH/V5vbGzzOfB0OlAOdfpwEr5Jfte
         FanNywYIrc8v1RHp6RapXFBSnmMJ891wYsNkWFG/4puvEvYNgZJdWMpof7BDlEcw/u7Z
         Uqgj93zmILzNavzu+WtEK7ypJoE4t+YVAWLbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706058; x=1745310858;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hiuMvneI3AqnaIuOADhkB1rAJc9G6yK7WStBQlLMKA=;
        b=gQDaT/zgoGXw321mpkRuZs2ffqya+0J/gHcFf7zuSVQa5MDbD6PWuj12rEGWdcYfwe
         fgcdhjJs4+/hbDd/d3FDD6Yz8nb5hfNbUVck0uyhKi3Ov5AwNTqNBJWvr1/941K1suia
         Vm1YxhTuZjA+lqZ+v6bF4ZtOjA2Ee7x4iYXZcfa07ea1bE+IMr9l/A+/zcHBZkD7igi9
         EAg8TlPDzbDHrqPol1g516GRhDhFeEsObrXO08cr4CrfMlGrh0P42a82cdMBOAsVjJH8
         1qy5Gaj/D/oayFjMUsilM1i8ZEz8yNlx1ZRd+zx2KjSAEqxXC4wQnhE9UTmXEPcKAtR6
         r0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2mm04KjALUIw6j1dg24JQB0e6sP8nvduDiry5LB8nL8LzalU/HTwfEsXAJMGiHD2nPsc9vQE3/Jc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1BOo7iCuvYcSu+8oYLc/GzpHI+KVXzIPjCjikc6uCokxZ+Nr3
	AeANAAl6LQtkVBRd7ETJsNnbRhAOJXFdJD2PL7E5N4/1VI6sexeXd1g6C61Ky/Q=
X-Gm-Gg: ASbGncuxOEsDUdJrK/tFcxim8A1Ep3yK51vycpCIJzkYz+4Z7H1aofEhEK1ziucLtuJ
	qd0XU1gySVkB0KgE+t51BGQ6yEwIRSDqcFX5e5XiAgMoHSRDmufvQml+YHcHpaZaw0NIFNKOu0K
	z7YvCmHQjypyFSL9BYYqi0Q45QluaWbcAFE3AMxB7G5dywHbrLW4ClwqyvA4bI9Y+bXyEZoJcNn
	VTcprkhjCzfdQ8OwrAPeEO+nYwf7W02eHbNA6khmddbGA3zAQQ7J7NcmbkZCjgERyPsiSeQXihv
	gdAyjUR+lpkL7k/WkiJWIAWtLdWeDAcwR3SIK+coUfSlkumXrg4ATZh0
X-Google-Smtp-Source: AGHT+IE/giGOf8zs636Gr2XujZhxTroOKRFMMFk3ZvqmNZ0GX2BWMdfv14Ab5hg9W8U4efJotXd0MA==
X-Received: by 2002:a17:902:e883:b0:224:1005:7280 with SMTP id d9443c01a7336-22bea500191mr239640385ad.38.1744706058130;
        Tue, 15 Apr 2025 01:34:18 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:34:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <Z_4aBL7JhTv_oxWR@macbook.lan>
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
 <Z_00JReo7Ji7RwkD@macbook.lan>
 <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c3c91d9-4de8-4910-b26e-8782a0f0d364@suse.com>

On Tue, Apr 15, 2025 at 09:32:37AM +0200, Jan Beulich wrote:
> On 14.04.2025 18:13, Roger Pau Monné wrote:
> > On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
> >> On 14.04.2025 15:53, Roger Pau Monné wrote:
> >>> On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
> >>>> On 11.04.2025 12:54, Roger Pau Monne wrote:
> Independently (i.e. not for this patch) we may want to actually assert
> that npfec.present is set for P2M types where we demand that to always
> be the case. (I wouldn't be too surprised if we actually found such an
> assertion to trigger.)
> 
> >>>> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
> >>>> p2m_mmio_direct.
> >>>
> >>> But that won't go into hvm_hap_nested_page_fault() when using
> >>> cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
> >>> mapped as p2m_mmio_direct)?
> >>>
> >>> It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
> >>> differently?
> >>
> >> All true as long as things work as expected (potentially including the guest
> >> also behaving as expected). Also this was explicitly only an example I could
> >> readily think of. I'm simply wary of handle_mmio_with_translation() now
> >> getting things to handle it's not meant to ever see.
> > 
> > How was access to MMIO r/o regions supposed to be handled before
> > 33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
> > added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
> > (~2010), yet I can't figure out how writes would be handled back then
> > that didn't result in a p2m fault and crashing of the domain.
> 
> Was that handled at all before said change?

Not really AFAICT, hence me wondering how where write accesses to r/o
MMIO regions supposed to be handled by (non-priv) domains.  Was the
expectation that those writes trigger an p2m violation thus crashing
the domain?

> mmio_ro_do_page_fault() was
> (and still is) invoked for the hardware domain only, and quite likely
> the need for handling (discarding) writes for PVHv1 had been overlooked
> until someone was hit by the lack thereof.

I see, I didn't realize r/o MMIO was only handled for PV hardware
domains only.  I could arguably do the same for HVM in
hvm_hap_nested_page_fault().

Not sure whether the subpage stuff is supposed to be functional for
domains different than the hardware domain?  It seems to be available
to the hanrdware domain only for PV guests, while for HVM is available
for both PV and HVM domains:

is_hardware_domain(currd) || subpage_mmio_write_accept(mfn, gla)

In hvm_hap_nested_page_fault().

> > I'm happy to look at other ways to handling this, but given there's
> > current logic for handling accesses to read-only regions in
> > hvm_hap_nested_page_fault() I think re-using that was the best way to
> > also handle accesses to MMIO read-only regions.
> > 
> > Arguably it would already be the case that for other reasons Xen would
> > need to emulate an instruction that accesses a read-only MMIO region?
> 
> Aiui hvm_translate_get_page() will yield HVMTRANS_bad_gfn_to_mfn for
> p2m_mmio_direct (after all, "direct" means we expect no emulation is
> needed; while arguably wrong for the introspection case, I'm not sure
> that and pass-through actually go together). Hence it's down to
> hvmemul_linear_mmio_access() -> hvmemul_phys_mmio_access() ->
> hvmemul_do_mmio_buffer() -> hvmemul_do_io_buffer() -> hvmemul_do_io(),
> which means that if hvm_io_intercept() can't handle it, the access
> will be forwarded to the responsible DM, or be "processed" by the
> internal null handler.
> 
> Given this, perhaps what you do is actually fine. At the same time
> note how several functions in hvm/emulate.c simply fail upon
> encountering p2m_mmio_direct. These are all REP handlers though, so
> the main emulator would then try emulating the insn the non-REP way.

I'm open to alternative ways of handling such accesses, just used what
seemed more natural in the context of hvm_hap_nested_page_fault().

Emulation of r/o MMIO accesses failing wouldn't be an issue from Xen's
perspective, that would "just" result in the guest getting a #GP
injected.

Would you like me to add some of your reasoning above to the commit
message?

Thanks, Roger.

