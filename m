Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24003996825
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814341.1227896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUdI-0006PY-Ux; Wed, 09 Oct 2024 11:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814341.1227896; Wed, 09 Oct 2024 11:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUdI-0006MI-RZ; Wed, 09 Oct 2024 11:13:32 +0000
Received: by outflank-mailman (input) for mailman id 814341;
 Wed, 09 Oct 2024 11:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQJB=RF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1syUdG-0006LR-T0
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:13:31 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 829baada-862f-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 13:13:28 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a994ecf79e7so70651466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 04:13:28 -0700 (PDT)
Received: from localhost ([213.195.123.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5d0a32sm655319866b.19.2024.10.09.04.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 04:13:27 -0700 (PDT)
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
X-Inumbo-ID: 829baada-862f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728472408; x=1729077208; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dzgx/Q6EirPir1M40hD0xQVTU7KZoyYYfMzoWVL6qVI=;
        b=Px8j8nOT5RLQyfQ7ZDho4RDQ1U/zOn1s8PWn3Rxej+SR/TRaED4NWla2WZlqKfP7hf
         SCPQ0NrYF6+m3obWDMNdTfHHqfLrLYQ0NZhPgHr442G+YF0+QvMy6A1pM4oSFt/u4v/f
         mVtIxtzBfsUxvxaCiQmlaGZBVbU7YM9ELx4Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472408; x=1729077208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzgx/Q6EirPir1M40hD0xQVTU7KZoyYYfMzoWVL6qVI=;
        b=TqkuhTbT6xOjIwGqzkPzWcujxFmzqK3aKUHp30fl5U9bez7GCWZT1Om8bB0QJ9+GKn
         QVM9MZXYk+t6PMfmWrm1LF8MFL1C+VhEC0H4H1JSuCJCSijX/e9/IUhXwdh402HZwdGv
         pOr4V2JyJFrWdQCyfvHOAPVUS80+MHvo94/gGuW3877ApjQFdCU4VNEYSG+KhelPgVL0
         z4y4SwWNTKM7LwIzlAPWsacnIPDzPdt9kyDEPsTVdraP++/b+R6YgEMwYFGaQDedjFEV
         5TYbwJlpCLtLSaSf+T6a07jBFDDxOX6G9q4pogHgZ3Sk2pWZmzaz1rXBF62Frsjc+i7Z
         My6A==
X-Forwarded-Encrypted: i=1; AJvYcCXxxe9m/+b/LsPaNQyItUcHilRU/pukInKe9Y+caDD/K74Prq6P7qoUnjAVY+UMT9YeeMV+gXofbHE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypdG1DkX4QbXg6JvZVS8gRwN2UiUMLewaC+w6YSqCb6gluKxjg
	QxrbT+PC1M5GfU/eN7/XBjnW9dNxJarZRMks4lQm3HAzouiS3Bm/fWXeKhD9D3A=
X-Google-Smtp-Source: AGHT+IGfNxRhoAWuLQ/mEEomRM4e0obWWOER6M9oAFTb1jSCm1+dyDldTn1dd1ink2AIGPM9CstfmQ==
X-Received: by 2002:a17:907:f1d3:b0:a99:4058:67d5 with SMTP id a640c23a62f3a-a998d20862cmr184009666b.34.1728472407965;
        Wed, 09 Oct 2024 04:13:27 -0700 (PDT)
Date: Wed, 9 Oct 2024 13:13:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
Message-ID: <ZwZlVlU2nHkBedyo@macbook.local>
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
 <ZwY4ym2Gnlx4tytP@macbook.local>
 <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>

On Wed, Oct 09, 2024 at 12:52:29PM +0200, Jan Beulich wrote:
> On 09.10.2024 10:03, Roger Pau Monné wrote:
> > On Tue, Oct 08, 2024 at 04:01:28PM +0200, Jan Beulich wrote:
> >> On 08.10.2024 12:47, Roger Pau Monne wrote:
> >>> IVMD table contains restrictions about memory which must be mandatory assigned
> >>> to devices (and which permissions it should use), or memory that should be
> >>> never accessible to devices.
> >>>
> >>> Some hardware however contains ranges in IVMD that reference devices outside of
> >>> the IVHD tables (in other words, devices not behind any IOMMU).  Such mismatch
> >>> will cause Xen to fail in register_range_for_device(), ultimately leading to
> >>> the IOMMU being disabled, and Xen crashing as x2APIC support might be already
> >>> enabled and relying on the IOMMU functionality.
> >>
> >> I find it hard to believe that on x86 systems with IOMMUs some devices would
> >> be left uncovered by any IOMMU. Is it possible that IVHD is flawed there? In
> >> which case we might rightfully refuse to boot? (Can you share e.g. that
> >> "iommu=debug" output that results from parsing the tables on that system?)
> > 
> > I'm afraid I don't have any of such systems to test myself, however I
> > have the contents of IVRS:
> > 
> >   ACPI Table Header
> > ------------------------------------------------------------------
> > Signature          : IVRS
> > Length             : 0x000001F8
> > Revision           : 0x02
> > Checksum           : 0x06
> > OEM ID             : AMD  
> > OEM Table ID       : AmdTable
> > OEM Revision       : 0x00000001
> > Creator ID         : AMD 
> > Creator Revision   : 0x00000001
> > IVinfo             : 0x00203043
> > 	  IVHD
> > 	----------------------------------------------------------------
> > 	Type                  : 0x10
> > 	Flags                 : 0xB0
> > 	Length                : 0x0044
> > 	IOMMU Device ID       : 0x0002
> > 	Capability Offset     : 0x0040
> > 	IOMMU Base Address    : 0x00000000FD200000
> > 	Segment Group         : 0x0000
> > 	IOMMU Info            : 0x0000
> > 	IOMMU Feature Info    : 0x80048F6E
> > 		  Range
> > 		--------------------------------------------------
> > 		Type                  : 0x03
> > 		Start of Range        : 0x0003
> > 		End of Range          : 0xFFFE
> > 		DTE Setting           : 0x00
> > 		  Alias Range
> > 		--------------------------------------------------
> > 		Type                  : 0x43
> > 		Start of Range        : 0xFF00
> > 		End of Range          : 0xFFFF
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x00A5
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x00A0
> > 		Handle                : 0x00
> > 		Variety               : HPET
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0xD7
> > 		Source Device ID      : 0x00A0
> > 		Handle                : 0x21
> > 		Variety               : IOAPIC
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x0001
> > 		Handle                : 0x22
> > 		Variety               : IOAPIC
> > 	  IVHD
> > 	----------------------------------------------------------------
> > 	Type                  : 0x11
> > 	Flags                 : 0x30
> > 	Length                : 0x0054
> > 	IOMMU Device ID       : 0x0002
> > 	Capability Offset     : 0x0040
> > 	IOMMU Base Address    : 0x00000000FD200000
> > 	Segment Group         : 0x0000
> > 	IOMMU Info            : 0x0000
> > 	IOMMU Feature Info    : 0x00048000
> > 		  Range
> > 		--------------------------------------------------
> > 		Type                  : 0x03
> > 		Start of Range        : 0x0003
> > 		End of Range          : 0xFFFE
> > 		DTE Setting           : 0x00
> > 		  Alias Range
> > 		--------------------------------------------------
> > 		Type                  : 0x43
> > 		Start of Range        : 0xFF00
> > 		End of Range          : 0xFFFF
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x00A5
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x00A0
> > 		Handle                : 0x00
> > 		Variety               : HPET
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0xD7
> > 		Source Device ID      : 0x00A0
> > 		Handle                : 0x21
> > 		Variety               : IOAPIC
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x0001
> > 		Handle                : 0x22
> > 		Variety               : IOAPIC
> > 	  IVMD
> > 	----------------------------------------------------------------
> > 	Type                                 : 0x22
> > 	Flags                                : 0x08
> > 	Length                               : 0x0020
> > 	DeviceID                             : 0x0000
> > 	AuxiliaryData                        : 0x0FFF
> > 	Reserved                             : 0x0000000000000000
> > 	IVMD Start Address                   : 0x0000000096191000
> > 	IVMD Memory Block Length             : 0x0000000000000022
> > 	  IVMD
> > 	----------------------------------------------------------------
> > 	Type                                 : 0x22
> > 	Flags                                : 0x08
> > 	Length                               : 0x0020
> > 	DeviceID                             : 0x0000
> > 	AuxiliaryData                        : 0x0FFF
> > 	Reserved                             : 0x0000000000000000
> > 	IVMD Start Address                   : 0x0000000097D9E000
> > 	IVMD Memory Block Length             : 0x0000000000000022
> > 	  IVMD
> > 	----------------------------------------------------------------
> > 	Type                                 : 0x22
> > 	Flags                                : 0x08
> > 	Length                               : 0x0020
> > 	DeviceID                             : 0x0000
> > 	AuxiliaryData                        : 0x0FFF
> > 	Reserved                             : 0x0000000000000000
> > 	IVMD Start Address                   : 0x0000000097D9D000
> > 	IVMD Memory Block Length             : 0x0000000000000022
> > 	  IVHD
> > 	----------------------------------------------------------------
> > 	Type                  : 0x40
> > 	Flags                 : 0x30
> > 	Length                : 0x00D0
> > 	IOMMU Device ID       : 0x0002
> > 	Capability Offset     : 0x0040
> > 	IOMMU Base Address    : 0x00000000FD200000
> > 	Segment Group         : 0x0000
> > 	IOMMU Info            : 0x0000
> > 	IOMMU Feature Info    : 0x00048000
> > 		  Range
> > 		--------------------------------------------------
> > 		Type                  : 0x03
> > 		Start of Range        : 0x0003
> > 		End of Range          : 0xFFFE
> > 		DTE Setting           : 0x00
> > 		  Alias Range
> > 		--------------------------------------------------
> > 		Type                  : 0x43
> > 		Start of Range        : 0xFF00
> > 		End of Range          : 0xFFFF
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x00A5
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x00A0
> > 		Handle                : 0x00
> > 		Variety               : HPET
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0xD7
> > 		Source Device ID      : 0x00A0
> > 		Handle                : 0x21
> > 		Variety               : IOAPIC
> > 		  Special Device
> > 		--------------------------------------------------
> > 		Type                  : 0x48
> > 		Device ID             : 0x0000
> > 		DTE Setting           : 0x00
> > 		Source Device ID      : 0x0001
> > 		Handle                : 0x22
> > 		Variety               : IOAPIC
> > 		  Variable Length ACPI HID Device
> > 		--------------------------------------------------
> > 		Type                  : 0xF0
> > 		Device ID             : 0x00A5
> > 		DTE Setting           : 0x40
> > 		Hardware ID           : AMDI0020
> > 		Extended DTE Setting  : 
> > 		Unique ID Format      : 2
> > 		Unique ID Length      : 9
> > 		Unique ID             : \_SB.FUR0
> > 		  Variable Length ACPI HID Device
> > 		--------------------------------------------------
> > 		Type                  : 0xF0
> > 		Device ID             : 0x00A5
> > 		DTE Setting           : 0x40
> > 		Hardware ID           : AMDI0020
> > 		Extended DTE Setting  : 
> > 		Unique ID Format      : 2
> > 		Unique ID Length      : 9
> > 		Unique ID             : \_SB.FUR1
> > 		  Variable Length ACPI HID Device
> > 		--------------------------------------------------
> > 		Type                  : 0xF0
> > 		Device ID             : 0x00A5
> > 		DTE Setting           : 0x40
> > 		Hardware ID           : AMDI0020
> > 		Extended DTE Setting  : 
> > 		Unique ID Format      : 2
> > 		Unique ID Length      : 9
> > 		Unique ID             : \_SB.FUR2
> > 		  Variable Length ACPI HID Device
> > 		--------------------------------------------------
> > 		Type                  : 0xF0
> > 		Device ID             : 0x00A5
> > 		DTE Setting           : 0x40
> > 		Hardware ID           : AMDI0020
> > 		Extended DTE Setting  : 
> > 		Unique ID Format      : 2
> > 		Unique ID Length      : 9
> > 		Unique ID             : \_SB.FUR3
> > 
> > FWIW, I've checked on one of the AMD server systems we have on the
> > lab, and the IVHD entries are fairly similar to the ones here, as
> > neither the PCI Host Bridge, nor the IOMMU are covered by any IVHD
> > block.  That system however doesn't have any IVMD blocks.
> 
> Mine are a little different. The Dinar (Fam15) has an IVHD entry just
> for the range 0-2 (host bridge, <nothing>, IOMMU). The Rome (Fam17)
> has an IVHD entry just for 0 (host bridge), but not for the IOMMU. I
> think it is entirely reasonable for host bridge(s) and IOMMU(s) to not
> be covered by any IVHD. They aren't devices that would require
> servicing by an IOMMU.
> 
> Looking at the code I think we want to do things a little differently
> though: Pull find_iommu_for_device() out of register_range_for_device()
> and have parse_ivmd_device_range() do the skipping when there's no
> IOMMU for a device.

What about parse_ivmd_device_select()?  The IOMMU check would also need
to be duplicated there, which is not ideal IMO.

> Plus error when no device in the range is covered
> by an IOMMU, or if any two devices are covered by different IOMMUs.

I'm not sure I understand you last comment: do you mean to return an
error if a IVMD block range covers devices assigned to different
IOMMUs?  If that's the case, I'm afraid I don't agree, I don't see
anywhere in the spec that notes a IVMD block range can apply to
devices assigned to different IOMMUs.

I also think returning an error when no device in the IVMD range is
covered by an IOMMU is dubious.  Xen will already print warning
messages about such firmware inconsistencies, but refusing to boot is
too strict.

Thanks, Roger.

