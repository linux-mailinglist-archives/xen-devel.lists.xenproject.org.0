Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AB29961C1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813807.1226848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRfL-0003ds-E8; Wed, 09 Oct 2024 08:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813807.1226848; Wed, 09 Oct 2024 08:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRfL-0003c1-Aq; Wed, 09 Oct 2024 08:03:27 +0000
Received: by outflank-mailman (input) for mailman id 813807;
 Wed, 09 Oct 2024 08:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQJB=RF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1syRfJ-0003ax-CN
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:03:25 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f538e2f3-8614-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 10:03:24 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c91a7141b8so1042129a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:03:24 -0700 (PDT)
Received: from localhost ([213.195.123.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9188e7c23sm987499a12.38.2024.10.09.01.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:03:23 -0700 (PDT)
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
X-Inumbo-ID: f538e2f3-8614-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728461004; x=1729065804; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K8mSc880nixF50C1oiDuYJ8Xd1iNj3rpaAObWGjBv9Y=;
        b=gWfCe65USHDgMXaItW4TD4BgiLbx3R0T8WZEZdRhn+LfvWFGeXtfBeEBCht021f/43
         1fMWtuntSot3xgOf968nIJmVR6maKmWvwHTmq0XOFAQz0eLEzpgocrsZPC7edUbiOUTU
         5aZNbQrV4jhnjpZ040X5m20OEfGd/TbLC+qrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728461004; x=1729065804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8mSc880nixF50C1oiDuYJ8Xd1iNj3rpaAObWGjBv9Y=;
        b=MtJ0lYQ8qphufE/Nejo+IDtFNyHlMV4+FaNRUbIuGN19bvWQNGFwyx3PHqPGxcGlLu
         qYFqyRkkKkttu8wUy++HKyIfeRZg7p/e8k7KtiQ1f+KdeK7OOSJYCDoS++pfO97dx5EO
         60u4vdwMoWfYxdIE+aTqbnvgLmcr6sQVQGuanwi5ErJWLJOhNtsVE6mib9eKjF7QxXF+
         JdLTdFbRKPdC7GrheN9NFB2zsBOYjAOH+VoP/B377Onj3H2tqMbd5EWW0A4x6C0zY2C7
         eI5tG/rJXjP2hZhbtRlbA01Hde6v+IF41MMrB48D0IlXPio8wlNVMtnmg0JiTSLAZp4m
         hFjA==
X-Forwarded-Encrypted: i=1; AJvYcCWWkzwCQX1oyiR8gl66Qhki2EscTLK0slyBBU5GGOdf/v02qRfehQyWMqdUq0LZAMMTyi2J6d9aR9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4SC1feOunSAJHkfZwnp4RXfUqlmceGpJM7yBkxO+IaR+b7Gop
	XCXyMYpPVf0FCDqyuZZLdA3Z1LNs+ZIbeUBk6Mf5+ZWUdP/8BVanb0/PnUJvxok=
X-Google-Smtp-Source: AGHT+IGa0fsFCZ1CdCeobzFcTN2lrPn1jrz+2AaEl6F9DyXytrG5VPPluu6fLsfRlCC9fhO7GecYTA==
X-Received: by 2002:a50:cc0c:0:b0:5c8:9861:a2aa with SMTP id 4fb4d7f45d1cf-5c91d5bdc5amr755970a12.21.1728461003707;
        Wed, 09 Oct 2024 01:03:23 -0700 (PDT)
Date: Wed, 9 Oct 2024 10:03:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
Message-ID: <ZwY4ym2Gnlx4tytP@macbook.local>
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>

On Tue, Oct 08, 2024 at 04:01:28PM +0200, Jan Beulich wrote:
> On 08.10.2024 12:47, Roger Pau Monne wrote:
> > IVMD table contains restrictions about memory which must be mandatory assigned
> > to devices (and which permissions it should use), or memory that should be
> > never accessible to devices.
> > 
> > Some hardware however contains ranges in IVMD that reference devices outside of
> > the IVHD tables (in other words, devices not behind any IOMMU).  Such mismatch
> > will cause Xen to fail in register_range_for_device(), ultimately leading to
> > the IOMMU being disabled, and Xen crashing as x2APIC support might be already
> > enabled and relying on the IOMMU functionality.
> 
> I find it hard to believe that on x86 systems with IOMMUs some devices would
> be left uncovered by any IOMMU. Is it possible that IVHD is flawed there? In
> which case we might rightfully refuse to boot? (Can you share e.g. that
> "iommu=debug" output that results from parsing the tables on that system?)

I'm afraid I don't have any of such systems to test myself, however I
have the contents of IVRS:

  ACPI Table Header
------------------------------------------------------------------
Signature          : IVRS
Length             : 0x000001F8
Revision           : 0x02
Checksum           : 0x06
OEM ID             : AMD  
OEM Table ID       : AmdTable
OEM Revision       : 0x00000001
Creator ID         : AMD 
Creator Revision   : 0x00000001
IVinfo             : 0x00203043
	  IVHD
	----------------------------------------------------------------
	Type                  : 0x10
	Flags                 : 0xB0
	Length                : 0x0044
	IOMMU Device ID       : 0x0002
	Capability Offset     : 0x0040
	IOMMU Base Address    : 0x00000000FD200000
	Segment Group         : 0x0000
	IOMMU Info            : 0x0000
	IOMMU Feature Info    : 0x80048F6E
		  Range
		--------------------------------------------------
		Type                  : 0x03
		Start of Range        : 0x0003
		End of Range          : 0xFFFE
		DTE Setting           : 0x00
		  Alias Range
		--------------------------------------------------
		Type                  : 0x43
		Start of Range        : 0xFF00
		End of Range          : 0xFFFF
		DTE Setting           : 0x00
		Source Device ID      : 0x00A5
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0x00
		Source Device ID      : 0x00A0
		Handle                : 0x00
		Variety               : HPET
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0xD7
		Source Device ID      : 0x00A0
		Handle                : 0x21
		Variety               : IOAPIC
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0x00
		Source Device ID      : 0x0001
		Handle                : 0x22
		Variety               : IOAPIC
	  IVHD
	----------------------------------------------------------------
	Type                  : 0x11
	Flags                 : 0x30
	Length                : 0x0054
	IOMMU Device ID       : 0x0002
	Capability Offset     : 0x0040
	IOMMU Base Address    : 0x00000000FD200000
	Segment Group         : 0x0000
	IOMMU Info            : 0x0000
	IOMMU Feature Info    : 0x00048000
		  Range
		--------------------------------------------------
		Type                  : 0x03
		Start of Range        : 0x0003
		End of Range          : 0xFFFE
		DTE Setting           : 0x00
		  Alias Range
		--------------------------------------------------
		Type                  : 0x43
		Start of Range        : 0xFF00
		End of Range          : 0xFFFF
		DTE Setting           : 0x00
		Source Device ID      : 0x00A5
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0x00
		Source Device ID      : 0x00A0
		Handle                : 0x00
		Variety               : HPET
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0xD7
		Source Device ID      : 0x00A0
		Handle                : 0x21
		Variety               : IOAPIC
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0x00
		Source Device ID      : 0x0001
		Handle                : 0x22
		Variety               : IOAPIC
	  IVMD
	----------------------------------------------------------------
	Type                                 : 0x22
	Flags                                : 0x08
	Length                               : 0x0020
	DeviceID                             : 0x0000
	AuxiliaryData                        : 0x0FFF
	Reserved                             : 0x0000000000000000
	IVMD Start Address                   : 0x0000000096191000
	IVMD Memory Block Length             : 0x0000000000000022
	  IVMD
	----------------------------------------------------------------
	Type                                 : 0x22
	Flags                                : 0x08
	Length                               : 0x0020
	DeviceID                             : 0x0000
	AuxiliaryData                        : 0x0FFF
	Reserved                             : 0x0000000000000000
	IVMD Start Address                   : 0x0000000097D9E000
	IVMD Memory Block Length             : 0x0000000000000022
	  IVMD
	----------------------------------------------------------------
	Type                                 : 0x22
	Flags                                : 0x08
	Length                               : 0x0020
	DeviceID                             : 0x0000
	AuxiliaryData                        : 0x0FFF
	Reserved                             : 0x0000000000000000
	IVMD Start Address                   : 0x0000000097D9D000
	IVMD Memory Block Length             : 0x0000000000000022
	  IVHD
	----------------------------------------------------------------
	Type                  : 0x40
	Flags                 : 0x30
	Length                : 0x00D0
	IOMMU Device ID       : 0x0002
	Capability Offset     : 0x0040
	IOMMU Base Address    : 0x00000000FD200000
	Segment Group         : 0x0000
	IOMMU Info            : 0x0000
	IOMMU Feature Info    : 0x00048000
		  Range
		--------------------------------------------------
		Type                  : 0x03
		Start of Range        : 0x0003
		End of Range          : 0xFFFE
		DTE Setting           : 0x00
		  Alias Range
		--------------------------------------------------
		Type                  : 0x43
		Start of Range        : 0xFF00
		End of Range          : 0xFFFF
		DTE Setting           : 0x00
		Source Device ID      : 0x00A5
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0x00
		Source Device ID      : 0x00A0
		Handle                : 0x00
		Variety               : HPET
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0xD7
		Source Device ID      : 0x00A0
		Handle                : 0x21
		Variety               : IOAPIC
		  Special Device
		--------------------------------------------------
		Type                  : 0x48
		Device ID             : 0x0000
		DTE Setting           : 0x00
		Source Device ID      : 0x0001
		Handle                : 0x22
		Variety               : IOAPIC
		  Variable Length ACPI HID Device
		--------------------------------------------------
		Type                  : 0xF0
		Device ID             : 0x00A5
		DTE Setting           : 0x40
		Hardware ID           : AMDI0020
		Extended DTE Setting  : 
		Unique ID Format      : 2
		Unique ID Length      : 9
		Unique ID             : \_SB.FUR0
		  Variable Length ACPI HID Device
		--------------------------------------------------
		Type                  : 0xF0
		Device ID             : 0x00A5
		DTE Setting           : 0x40
		Hardware ID           : AMDI0020
		Extended DTE Setting  : 
		Unique ID Format      : 2
		Unique ID Length      : 9
		Unique ID             : \_SB.FUR1
		  Variable Length ACPI HID Device
		--------------------------------------------------
		Type                  : 0xF0
		Device ID             : 0x00A5
		DTE Setting           : 0x40
		Hardware ID           : AMDI0020
		Extended DTE Setting  : 
		Unique ID Format      : 2
		Unique ID Length      : 9
		Unique ID             : \_SB.FUR2
		  Variable Length ACPI HID Device
		--------------------------------------------------
		Type                  : 0xF0
		Device ID             : 0x00A5
		DTE Setting           : 0x40
		Hardware ID           : AMDI0020
		Extended DTE Setting  : 
		Unique ID Format      : 2
		Unique ID Length      : 9
		Unique ID             : \_SB.FUR3

FWIW, I've checked on one of the AMD server systems we have on the
lab, and the IVHD entries are fairly similar to the ones here, as
neither the PCI Host Bridge, nor the IOMMU are covered by any IVHD
block.  That system however doesn't have any IVMD blocks.

> > Relax IVMD parsing: allow IVMD blocks to reference devices not assigned to any
> > IOMMU.  It's impossible for Xen to fulfill the requirement in the IVMD block if
> > the device is not behind any IOMMU, but it's no worse than booting without
> > IOMMU support, and thus not parsing ACPI IVRS in the first place.
> > 
> > Reported-by: Willi Junga <xenproject@ymy.be>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/drivers/passthrough/amd/iommu_acpi.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
> > index 3f5508eba049..c416120326c9 100644
> > --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> > +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> > @@ -248,8 +248,9 @@ static int __init register_range_for_device(
> >      iommu = find_iommu_for_device(seg, bdf);
> >      if ( !iommu )
> >      {
> > -        AMD_IOMMU_ERROR("IVMD: no IOMMU for Dev_Id %#x\n", bdf);
> > -        return -ENODEV;
> > +        AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",
> 
> I'm not a native speaker, but "constrain" to me can only be a verb (with
> "constraint" being the noun). IOW as worded I'm afraid I can't make sense
> of the message.

Indeed, sorry for the typo.

> > +                       &PCI_SBDF(seg, bdf));
> > +        return 0;
> >      }
> >      req = ivrs_mappings[bdf].dte_requestor_id;
> >  
> 
> Down from here in parse_ivmd_device_iommu() is somewhat similar code.
> Wouldn't that need adjusting similarly then? Or else shouldn't the
> adjustment above be accompanied by a comment clarifying that the
> behavior is just because of observations on certain hardware?

Hm, I think that one is bogus and should be removed, according to my
copy of the AMD-Vi spec (48882—Rev 3.08-PUB—Oct 2023), the IVMD type
can only be:

20h=all peripherals
21h=specified peripheral
22h=peripheral range

So type 23h (ACPI_IVRS_TYPE_MEMORY_IOMMU) is not a valid type for the
IVMD blocks.

Thanks, Roger.

