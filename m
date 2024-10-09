Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBEE99692A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814421.1227987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVA3-000760-HR; Wed, 09 Oct 2024 11:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814421.1227987; Wed, 09 Oct 2024 11:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVA3-000745-EU; Wed, 09 Oct 2024 11:47:23 +0000
Received: by outflank-mailman (input) for mailman id 814421;
 Wed, 09 Oct 2024 11:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQJB=RF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1syVA2-0006hU-65
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:47:22 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e0b60e5-8634-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 13:47:21 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a994cd82a3bso510374266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 04:47:21 -0700 (PDT)
Received: from localhost ([213.195.123.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993fa1b94csm572572466b.53.2024.10.09.04.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 04:47:19 -0700 (PDT)
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
X-Inumbo-ID: 3e0b60e5-8634-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728474440; x=1729079240; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vNj+EoD5ZU0beT7yuQbSff10GWe3bm/uH5DRpKdWX3k=;
        b=W07jDnVWQ+B7SKaMjL6GPx2mLr4Q1TNZ4Mmt6P7A4QyJYeEHb12sgzuFXXN1h3AEmg
         WjfABd/FakuVsquhBb65lU02JUME7R30WKsggQh3zIYYZBjqFFB/I0qSYMs4UKzJbCy3
         pl6eyhYBKIbAzF5FgSfSfFGXN4c/lw6V9J/B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728474440; x=1729079240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNj+EoD5ZU0beT7yuQbSff10GWe3bm/uH5DRpKdWX3k=;
        b=F7uqbrGwXQ9nhmfqWZP5nCN91cDcZujuR2RmccN7SVIrqPEC/sJhikNZ9ZPUcd27UI
         UfAXaIzePOC9oriBkFnkfdL9Bl4bX+c1VEk5IizbbDSJwyBcoyxCA9qV261Jauy2fHnd
         o2/8gYg2MgduNr50qHslGkmQUpiVVP6AJG/IQenVfErXjov2njS99jFgpR1qchG37uLM
         fxp64BsQIsXlH98NNDLl9NxVqnaIcrMRTjCK41Jtk1pSyfhWSqbuqHKJEyEla1ePkys+
         PExGNrBalOYAe51Ds2FxnqYndV8rj7qoqJP+49PCZus4mMgQ3I6EGZbbuekcsufZ/cgO
         4WOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrFyoYRhv5crn1aywzFg2Ls9W0Ungk62SmKiyK9RzZ4/wYv6ZI8KECwtTOy7CtA5Ou5EzfvTJKmxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxr7ip25p82NZmH1UUhuXqwYWc3ezNvWR0alpFy6uFDy70M88Fp
	sZjiWAkBZ+qGeNeoPTB9HWmfn3csXWodwpMOEsKl5tqJaqbRDXBuG6EHvvrNi3E=
X-Google-Smtp-Source: AGHT+IGII9b0SdhhcdcjZnMfcYuuwMnSVEaseFM96Aw/kPCmUIUzLI3A3lQi9ftjzwZ7XzsLDI4/yA==
X-Received: by 2002:a17:907:7291:b0:a99:40fc:adb0 with SMTP id a640c23a62f3a-a998d37619dmr175549266b.65.1728474440241;
        Wed, 09 Oct 2024 04:47:20 -0700 (PDT)
Date: Wed, 9 Oct 2024 13:47:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
Message-ID: <ZwZtR6ZTl2gUWN2T@macbook.local>
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
 <ZwY4ym2Gnlx4tytP@macbook.local>
 <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>
 <ZwZlVlU2nHkBedyo@macbook.local>
 <703fa416-c7d5-4862-a871-5831125c2e25@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <703fa416-c7d5-4862-a871-5831125c2e25@suse.com>

On Wed, Oct 09, 2024 at 01:28:19PM +0200, Jan Beulich wrote:
> On 09.10.2024 13:13, Roger Pau Monné wrote:
> > On Wed, Oct 09, 2024 at 12:52:29PM +0200, Jan Beulich wrote:
> >> On 09.10.2024 10:03, Roger Pau Monné wrote:
> >>> On Tue, Oct 08, 2024 at 04:01:28PM +0200, Jan Beulich wrote:
> >>>> On 08.10.2024 12:47, Roger Pau Monne wrote:
> >>>>> IVMD table contains restrictions about memory which must be mandatory assigned
> >>>>> to devices (and which permissions it should use), or memory that should be
> >>>>> never accessible to devices.
> >>>>>
> >>>>> Some hardware however contains ranges in IVMD that reference devices outside of
> >>>>> the IVHD tables (in other words, devices not behind any IOMMU).  Such mismatch
> >>>>> will cause Xen to fail in register_range_for_device(), ultimately leading to
> >>>>> the IOMMU being disabled, and Xen crashing as x2APIC support might be already
> >>>>> enabled and relying on the IOMMU functionality.
> >>>>
> >>>> I find it hard to believe that on x86 systems with IOMMUs some devices would
> >>>> be left uncovered by any IOMMU. Is it possible that IVHD is flawed there? In
> >>>> which case we might rightfully refuse to boot? (Can you share e.g. that
> >>>> "iommu=debug" output that results from parsing the tables on that system?)
> >>>
> >>> I'm afraid I don't have any of such systems to test myself, however I
> >>> have the contents of IVRS:
> >>>
> >>>   ACPI Table Header
> >>> ------------------------------------------------------------------
> >>> Signature          : IVRS
> >>> Length             : 0x000001F8
> >>> Revision           : 0x02
> >>> Checksum           : 0x06
> >>> OEM ID             : AMD  
> >>> OEM Table ID       : AmdTable
> >>> OEM Revision       : 0x00000001
> >>> Creator ID         : AMD 
> >>> Creator Revision   : 0x00000001
> >>> IVinfo             : 0x00203043
> >>> 	  IVHD
> >>> 	----------------------------------------------------------------
> >>> 	Type                  : 0x10
> >>> 	Flags                 : 0xB0
> >>> 	Length                : 0x0044
> >>> 	IOMMU Device ID       : 0x0002
> >>> 	Capability Offset     : 0x0040
> >>> 	IOMMU Base Address    : 0x00000000FD200000
> >>> 	Segment Group         : 0x0000
> >>> 	IOMMU Info            : 0x0000
> >>> 	IOMMU Feature Info    : 0x80048F6E
> >>> 		  Range
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x03
> >>> 		Start of Range        : 0x0003
> >>> 		End of Range          : 0xFFFE
> >>> 		DTE Setting           : 0x00
> >>> 		  Alias Range
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x43
> >>> 		Start of Range        : 0xFF00
> >>> 		End of Range          : 0xFFFF
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x00A5
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x00A0
> >>> 		Handle                : 0x00
> >>> 		Variety               : HPET
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0xD7
> >>> 		Source Device ID      : 0x00A0
> >>> 		Handle                : 0x21
> >>> 		Variety               : IOAPIC
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x0001
> >>> 		Handle                : 0x22
> >>> 		Variety               : IOAPIC
> >>> 	  IVHD
> >>> 	----------------------------------------------------------------
> >>> 	Type                  : 0x11
> >>> 	Flags                 : 0x30
> >>> 	Length                : 0x0054
> >>> 	IOMMU Device ID       : 0x0002
> >>> 	Capability Offset     : 0x0040
> >>> 	IOMMU Base Address    : 0x00000000FD200000
> >>> 	Segment Group         : 0x0000
> >>> 	IOMMU Info            : 0x0000
> >>> 	IOMMU Feature Info    : 0x00048000
> >>> 		  Range
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x03
> >>> 		Start of Range        : 0x0003
> >>> 		End of Range          : 0xFFFE
> >>> 		DTE Setting           : 0x00
> >>> 		  Alias Range
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x43
> >>> 		Start of Range        : 0xFF00
> >>> 		End of Range          : 0xFFFF
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x00A5
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x00A0
> >>> 		Handle                : 0x00
> >>> 		Variety               : HPET
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0xD7
> >>> 		Source Device ID      : 0x00A0
> >>> 		Handle                : 0x21
> >>> 		Variety               : IOAPIC
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x0001
> >>> 		Handle                : 0x22
> >>> 		Variety               : IOAPIC
> >>> 	  IVMD
> >>> 	----------------------------------------------------------------
> >>> 	Type                                 : 0x22
> >>> 	Flags                                : 0x08
> >>> 	Length                               : 0x0020
> >>> 	DeviceID                             : 0x0000
> >>> 	AuxiliaryData                        : 0x0FFF
> >>> 	Reserved                             : 0x0000000000000000
> >>> 	IVMD Start Address                   : 0x0000000096191000
> >>> 	IVMD Memory Block Length             : 0x0000000000000022
> >>> 	  IVMD
> >>> 	----------------------------------------------------------------
> >>> 	Type                                 : 0x22
> >>> 	Flags                                : 0x08
> >>> 	Length                               : 0x0020
> >>> 	DeviceID                             : 0x0000
> >>> 	AuxiliaryData                        : 0x0FFF
> >>> 	Reserved                             : 0x0000000000000000
> >>> 	IVMD Start Address                   : 0x0000000097D9E000
> >>> 	IVMD Memory Block Length             : 0x0000000000000022
> >>> 	  IVMD
> >>> 	----------------------------------------------------------------
> >>> 	Type                                 : 0x22
> >>> 	Flags                                : 0x08
> >>> 	Length                               : 0x0020
> >>> 	DeviceID                             : 0x0000
> >>> 	AuxiliaryData                        : 0x0FFF
> >>> 	Reserved                             : 0x0000000000000000
> >>> 	IVMD Start Address                   : 0x0000000097D9D000
> >>> 	IVMD Memory Block Length             : 0x0000000000000022
> >>> 	  IVHD
> >>> 	----------------------------------------------------------------
> >>> 	Type                  : 0x40
> >>> 	Flags                 : 0x30
> >>> 	Length                : 0x00D0
> >>> 	IOMMU Device ID       : 0x0002
> >>> 	Capability Offset     : 0x0040
> >>> 	IOMMU Base Address    : 0x00000000FD200000
> >>> 	Segment Group         : 0x0000
> >>> 	IOMMU Info            : 0x0000
> >>> 	IOMMU Feature Info    : 0x00048000
> >>> 		  Range
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x03
> >>> 		Start of Range        : 0x0003
> >>> 		End of Range          : 0xFFFE
> >>> 		DTE Setting           : 0x00
> >>> 		  Alias Range
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x43
> >>> 		Start of Range        : 0xFF00
> >>> 		End of Range          : 0xFFFF
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x00A5
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x00A0
> >>> 		Handle                : 0x00
> >>> 		Variety               : HPET
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0xD7
> >>> 		Source Device ID      : 0x00A0
> >>> 		Handle                : 0x21
> >>> 		Variety               : IOAPIC
> >>> 		  Special Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0x48
> >>> 		Device ID             : 0x0000
> >>> 		DTE Setting           : 0x00
> >>> 		Source Device ID      : 0x0001
> >>> 		Handle                : 0x22
> >>> 		Variety               : IOAPIC
> >>> 		  Variable Length ACPI HID Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0xF0
> >>> 		Device ID             : 0x00A5
> >>> 		DTE Setting           : 0x40
> >>> 		Hardware ID           : AMDI0020
> >>> 		Extended DTE Setting  : 
> >>> 		Unique ID Format      : 2
> >>> 		Unique ID Length      : 9
> >>> 		Unique ID             : \_SB.FUR0
> >>> 		  Variable Length ACPI HID Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0xF0
> >>> 		Device ID             : 0x00A5
> >>> 		DTE Setting           : 0x40
> >>> 		Hardware ID           : AMDI0020
> >>> 		Extended DTE Setting  : 
> >>> 		Unique ID Format      : 2
> >>> 		Unique ID Length      : 9
> >>> 		Unique ID             : \_SB.FUR1
> >>> 		  Variable Length ACPI HID Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0xF0
> >>> 		Device ID             : 0x00A5
> >>> 		DTE Setting           : 0x40
> >>> 		Hardware ID           : AMDI0020
> >>> 		Extended DTE Setting  : 
> >>> 		Unique ID Format      : 2
> >>> 		Unique ID Length      : 9
> >>> 		Unique ID             : \_SB.FUR2
> >>> 		  Variable Length ACPI HID Device
> >>> 		--------------------------------------------------
> >>> 		Type                  : 0xF0
> >>> 		Device ID             : 0x00A5
> >>> 		DTE Setting           : 0x40
> >>> 		Hardware ID           : AMDI0020
> >>> 		Extended DTE Setting  : 
> >>> 		Unique ID Format      : 2
> >>> 		Unique ID Length      : 9
> >>> 		Unique ID             : \_SB.FUR3
> >>>
> >>> FWIW, I've checked on one of the AMD server systems we have on the
> >>> lab, and the IVHD entries are fairly similar to the ones here, as
> >>> neither the PCI Host Bridge, nor the IOMMU are covered by any IVHD
> >>> block.  That system however doesn't have any IVMD blocks.
> >>
> >> Mine are a little different. The Dinar (Fam15) has an IVHD entry just
> >> for the range 0-2 (host bridge, <nothing>, IOMMU). The Rome (Fam17)
> >> has an IVHD entry just for 0 (host bridge), but not for the IOMMU. I
> >> think it is entirely reasonable for host bridge(s) and IOMMU(s) to not
> >> be covered by any IVHD. They aren't devices that would require
> >> servicing by an IOMMU.
> >>
> >> Looking at the code I think we want to do things a little differently
> >> though: Pull find_iommu_for_device() out of register_range_for_device()
> >> and have parse_ivmd_device_range() do the skipping when there's no
> >> IOMMU for a device.
> > 
> > What about parse_ivmd_device_select()?  The IOMMU check would also need
> > to be duplicated there, which is not ideal IMO.
> 
> That's not ideal, but a reasonably small price to pay.

Pulling the check out is only helpful if we plan to return an error if
a IVMD block has all references to devices not assigned to an IOMMU,
which I'm not convinced we should do.

> >> Plus error when no device in the range is covered
> >> by an IOMMU, or if any two devices are covered by different IOMMUs.
> > 
> > I'm not sure I understand you last comment: do you mean to return an
> > error if a IVMD block range covers devices assigned to different
> > IOMMUs?  If that's the case, I'm afraid I don't agree, I don't see
> > anywhere in the spec that notes a IVMD block range can apply to
> > devices assigned to different IOMMUs.
> 
> Hmm, right, I take back that part.
> 
> > I also think returning an error when no device in the IVMD range is
> > covered by an IOMMU is dubious.  Xen will already print warning
> > messages about such firmware inconsistencies, but refusing to boot is
> > too strict.
> 
> I disagree. We shouldn't enable DMA remapping in such an event. Whereas

I'm not sure I understand why you would go as far as refusing to
enable DMA remapping.  How is a IVMD block having references to some
devices not assigned to any IOMMU different to all devices referenced
not assigned to any IOMMU?  We should deal with both in the same
way.

If all devices in the IVMD block are not covered by an IOMMU, the
IVMD block is useless.  But there's nothing for Xen to action, due to
the devices not having an IOMMU assigned.  IOW: it would be the same
as booting natively without parsing the IVRS in the first place.

> the "refusing to boot" is interrupt remapping related iirc, if x2APIC
> is already enabled. We need to properly separate the two (and the
> discussion there was started quite a long time ago, but it got stuck at
> some point); until such time it is simply an undesirable side effect of
> the inappropriate implementation that in certain case we fail boot when
> we shouldn't.

Yes, but that's a different topic, and not something I plan to fix as
the scope of this patch :).

Thanks, Roger.

