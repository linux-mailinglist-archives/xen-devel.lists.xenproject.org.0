Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3464DA88836
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 18:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950851.1347039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MRE-00029V-07; Mon, 14 Apr 2025 16:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950851.1347039; Mon, 14 Apr 2025 16:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MRD-00027b-Tp; Mon, 14 Apr 2025 16:13:35 +0000
Received: by outflank-mailman (input) for mailman id 950851;
 Mon, 14 Apr 2025 16:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bgKV=XA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4MRC-00025t-AI
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 16:13:34 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68da9e30-194b-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 18:13:33 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-736b98acaadso4110690b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 09:13:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73bd21c3216sm6788856b3a.49.2025.04.14.09.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 09:13:30 -0700 (PDT)
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
X-Inumbo-ID: 68da9e30-194b-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744647211; x=1745252011; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJ0GSz50psXZ6Qkbtw+qeabZSAAWO1ieKNoZcck1NFQ=;
        b=WtnCVbt4+SniaSSO+MhQTQuG096CWVpMT5V0QV+FIPhPR/YYUuAVPHcVUhH+LPrIen
         SvNY7gUPd3CDFy2A6mjJ8MeTwdmiESPpT2j8zvOvVYcQeu0VNAF5iaiTgOOpegTEmEB4
         +He9doYQOXwnS2Rj7kZrSx+d/nH6ytgW9Nw6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744647211; x=1745252011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJ0GSz50psXZ6Qkbtw+qeabZSAAWO1ieKNoZcck1NFQ=;
        b=bu92hIyZvPovHmtfpsVgXO8eHnh4zXRoQBvYbdlRYx+G0XZBrX+xve2aq8uOUtCUdS
         OZQMz+p/ZIOIkEwr2XHJ4SsALO8W9X2Va9od7IHCno+youoUabnfI8R5BgoQwgOtqhqE
         lQi7gkE9WLVcY9onmzkIloU55g0ojnCl9JI3BMxBNcaea52ubPFs9wlbHerQALzp7cwc
         RB7YgmPH1xucMvgoRB7lEejdMm5BZB+7LuL/kDhMgUAFERm3MSIzZtSY8GDkHrI98cql
         fQbFyzaHR0w6SLuO/HRwlOi094OENY+/Bq4gF/el21SJPmSf+4jXpl//CCQUC0b1a/xo
         5fVA==
X-Forwarded-Encrypted: i=1; AJvYcCU+xgWFHYfIJjDcCmOz0Bckudgfy4NUJzc7w94tznKFl6xNSqPIrPKR16Aw/ulzOxANvI9jFXUODNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPUOF8j87ms4L56ZHI48+CGKpCmoDHpWt6HJTniPrAxGyQu7aR
	NQbdmoqCkqHcyrrqRmI9WPRNZy6V53fV4tbRY2e9ffpJztSNbk9nKbhWMWe+skc=
X-Gm-Gg: ASbGnct7qcVO/XcvKpPqCvcu4yE/xpx3m7fZ2W99byju02iV5xcmUh7JW3F+vdG9hqy
	82ICKWwsUT3QKoJ0jMHirZ6qTMHTIsm+VaktxDMDkRsTLxvwCX/73BaVMxcSVSVgBy863Lye/Q7
	K08217aheyGxaGO7ydddErUEh0FEK3JX7NTIsTMZ0x94wDdNPVaVB0bdlW1Vvp0BiO3buzGeuEM
	EU025cVteMTSJ1Ra1FFX8vlwSnO5XQeMB7TPkPjXNieLpVYNI/8r+dMDQdF/VlfPt8Ya5aDB0hq
	QKilF+RwdcSsV/S70H2ZATOxD1f6PtR2p2w8ASlONqGTZQ==
X-Google-Smtp-Source: AGHT+IE8csoloJildedsvpCu33UgrhoVpF6oddk3tOjJYU6F8D4R/R1Tx9Vin5zQTH3wPSVyoQhcjg==
X-Received: by 2002:a05:6a00:22cd:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-73bd119ea62mr17061285b3a.5.1744647211114;
        Mon, 14 Apr 2025 09:13:31 -0700 (PDT)
Date: Mon, 14 Apr 2025 18:13:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <Z_00JReo7Ji7RwkD@macbook.lan>
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-4-roger.pau@citrix.com>
 <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
 <Z_0TXKMe6tfrYR9T@macbook.lan>
 <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c92d5665-0940-40b5-8cbb-81889adf40c5@suse.com>

On Mon, Apr 14, 2025 at 05:24:32PM +0200, Jan Beulich wrote:
> On 14.04.2025 15:53, Roger Pau Monné wrote:
> > On Mon, Apr 14, 2025 at 08:33:44AM +0200, Jan Beulich wrote:
> >> On 11.04.2025 12:54, Roger Pau Monne wrote:
> >>> @@ -1981,7 +2056,9 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
> >>>       */
> >>>      if ( (p2mt == p2m_mmio_dm) ||
> >>>           (npfec.write_access &&
> >>> -          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
> >>> +          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
> >>> +           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
> >>> +           (p2mt == p2m_mmio_direct))) )
> >>>      {
> >>>          if ( !handle_mmio_with_translation(gla, gfn, npfec) )
> >>>              hvm_inject_hw_exception(X86_EXC_GP, 0);
> >>
> >> Aren't we handing too many things to handle_mmio_with_translation() this
> >> way? At the very least you're losing ...
> >>
> >>> @@ -2033,14 +2110,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
> >>>          goto out_put_gfn;
> >>>      }
> >>>  
> >>> -    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
> >>
> >> ... the .present check.
> > 
> > Isn't the p2mt == p2m_mmio_direct check already ensuring the entry is
> > present?  Otherwise it's type would be p2m_invalid or p2m_mmio_dm?
> 
> Yes (to the 1st question), it kind of is.
> 
> > It did seem to me the other checks in this function already assume
> > that by having a valid type the entry is present.
> 
> Except for the code above, where we decided to play safe. AT the very least
> if you drop such a check, please say a justifying word in the description.

I've added:

"As part of the fix r/o MMIO accesses are now handled by
handle_mmio_with_translation(), re-using the same logic that was used
for other read-only types part of p2m_is_discard_write().  The page
present check is dropped as type p2m_mmio_direct must have the
present bit set in the PTE."

Let me know if you think that's enough.

> >> I'm also concerned of e.g. VT-x'es APIC access MFN, which is
> >> p2m_mmio_direct.
> > 
> > But that won't go into hvm_hap_nested_page_fault() when using
> > cpu_has_vmx_virtualize_apic_accesses (and thus having an APIC page
> > mapped as p2m_mmio_direct)?
> > 
> > It would instead be an EXIT_REASON_APIC_ACCESS vmexit which is handled
> > differently?
> 
> All true as long as things work as expected (potentially including the guest
> also behaving as expected). Also this was explicitly only an example I could
> readily think of. I'm simply wary of handle_mmio_with_translation() now
> getting things to handle it's not meant to ever see.

How was access to MMIO r/o regions supposed to be handled before
33c19df9a5a0 (~2015)?  I see that setting r/o MMIO p2m entries was
added way before to p2m_type_to_flags() and ept_p2m_type_to_flags()
(~2010), yet I can't figure out how writes would be handled back then
that didn't result in a p2m fault and crashing of the domain.

I'm happy to look at other ways to handling this, but given there's
current logic for handling accesses to read-only regions in
hvm_hap_nested_page_fault() I think re-using that was the best way to
also handle accesses to MMIO read-only regions.

Arguably it would already be the case that for other reasons Xen would
need to emulate an instruction that accesses a read-only MMIO region?

Thanks, Roger.

