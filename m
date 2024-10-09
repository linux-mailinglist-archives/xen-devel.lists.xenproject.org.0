Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636149967BA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 12:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814315.1227856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUJ0-0006Pl-F9; Wed, 09 Oct 2024 10:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814315.1227856; Wed, 09 Oct 2024 10:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syUJ0-0006N6-CE; Wed, 09 Oct 2024 10:52:34 +0000
Received: by outflank-mailman (input) for mailman id 814315;
 Wed, 09 Oct 2024 10:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syUIy-0006N0-DB
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 10:52:32 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 950192cb-862c-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 12:52:31 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9951fba3b4so483493366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 03:52:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9950338d1fsm432244166b.47.2024.10.09.03.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 03:52:30 -0700 (PDT)
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
X-Inumbo-ID: 950192cb-862c-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728471150; x=1729075950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=02NjfAA6NyQni91j3WwMBU2oNcA4Yd84oZXocF6l4U4=;
        b=ZC7xBsLODegv5L38G+WFK+nxBaBABQQc1MFWpq9qtM29n6uJG8F0JdUqgchBCEydJQ
         /5MrDP6ygZvj/3ge/TxfvfF4PzY3kvKpuCAzoX1QqLx+KBSh1QN57W22P4JlE+DpdluL
         iIgh05Lcxue9rDFwH/JUXksIyEiUfpbMvUlq47F+W7EdDJFy7MMNMBaiIGyA/Mre+WyX
         AhX3yn7qOmLxS+TzR8GIAB/2ZPSpl5PEZE3UTZmviFfnpnQBfYctKRAgJgff50jLNU2g
         PU7MH3WoNB1jhC1HkEUwFy/riszTn7cDQNJGgjvwWk+O0VNXAuyodZuawLUJqn8z9ipV
         3/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728471150; x=1729075950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02NjfAA6NyQni91j3WwMBU2oNcA4Yd84oZXocF6l4U4=;
        b=KNquRfHVfUmehlpueHhStxREEvsxPGq80qjoGDR6LyZTMY3+JHfFuCTBN3tr2mTCjh
         4nFM6QZLpCEruLDjMlPU0frSFI5aDzsxdMhRkYRyUfzR8+jrkmRMWfZ4bhd5bTIByG5w
         +nJiERU9Njw+ySpgqvcLgSmPUWKQ2wV+cVDRLxtisXWtL3GAfZp2FRxy0ToqihKTGRUL
         ugq3jA1AQZdz3JCUnT1dVjbUiL6dv0sUJFVXCg+2DmTJj+pAKysQmzvu9FkQAdPKze5t
         MONS2GshZEqziSw701mCSwVsjZeo3J6lqykkNJ2yILfDWVeGBotfdVJWrlRSph0Hlf5P
         vL5A==
X-Forwarded-Encrypted: i=1; AJvYcCXHj3Er4IxapqTQRsibRBSKoaNRPzWgAaxJvJfYbNkc/fIeEXArBRF6g90zygSwtxxH8xSy9xVAR64=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk40xKk98Wx+JFLKijcLRNuTUHlEOQ7vy1KqrXQKq0J90Tuvpa
	uDV+gAq1wzOiFGwvYq2er87b7WwIKDhatW8aU2008g7Cs9rr7pJgE0dqTm+sCw==
X-Google-Smtp-Source: AGHT+IHuvgZbtVw5pkhzoOZgcQgOO045ouq3lW93YFE+2VxDJsOzYhPuCs0rQ40wIbs9Kf8Qixn7Rg==
X-Received: by 2002:a17:906:c107:b0:a99:58ab:ae0 with SMTP id a640c23a62f3a-a998d1fa067mr162609666b.30.1728471150328;
        Wed, 09 Oct 2024 03:52:30 -0700 (PDT)
Message-ID: <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>
Date: Wed, 9 Oct 2024 12:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, xen-devel@lists.xenproject.org
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
 <ZwY4ym2Gnlx4tytP@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZwY4ym2Gnlx4tytP@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 10:03, Roger Pau Monné wrote:
> On Tue, Oct 08, 2024 at 04:01:28PM +0200, Jan Beulich wrote:
>> On 08.10.2024 12:47, Roger Pau Monne wrote:
>>> IVMD table contains restrictions about memory which must be mandatory assigned
>>> to devices (and which permissions it should use), or memory that should be
>>> never accessible to devices.
>>>
>>> Some hardware however contains ranges in IVMD that reference devices outside of
>>> the IVHD tables (in other words, devices not behind any IOMMU).  Such mismatch
>>> will cause Xen to fail in register_range_for_device(), ultimately leading to
>>> the IOMMU being disabled, and Xen crashing as x2APIC support might be already
>>> enabled and relying on the IOMMU functionality.
>>
>> I find it hard to believe that on x86 systems with IOMMUs some devices would
>> be left uncovered by any IOMMU. Is it possible that IVHD is flawed there? In
>> which case we might rightfully refuse to boot? (Can you share e.g. that
>> "iommu=debug" output that results from parsing the tables on that system?)
> 
> I'm afraid I don't have any of such systems to test myself, however I
> have the contents of IVRS:
> 
>   ACPI Table Header
> ------------------------------------------------------------------
> Signature          : IVRS
> Length             : 0x000001F8
> Revision           : 0x02
> Checksum           : 0x06
> OEM ID             : AMD  
> OEM Table ID       : AmdTable
> OEM Revision       : 0x00000001
> Creator ID         : AMD 
> Creator Revision   : 0x00000001
> IVinfo             : 0x00203043
> 	  IVHD
> 	----------------------------------------------------------------
> 	Type                  : 0x10
> 	Flags                 : 0xB0
> 	Length                : 0x0044
> 	IOMMU Device ID       : 0x0002
> 	Capability Offset     : 0x0040
> 	IOMMU Base Address    : 0x00000000FD200000
> 	Segment Group         : 0x0000
> 	IOMMU Info            : 0x0000
> 	IOMMU Feature Info    : 0x80048F6E
> 		  Range
> 		--------------------------------------------------
> 		Type                  : 0x03
> 		Start of Range        : 0x0003
> 		End of Range          : 0xFFFE
> 		DTE Setting           : 0x00
> 		  Alias Range
> 		--------------------------------------------------
> 		Type                  : 0x43
> 		Start of Range        : 0xFF00
> 		End of Range          : 0xFFFF
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x00A5
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x00A0
> 		Handle                : 0x00
> 		Variety               : HPET
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0xD7
> 		Source Device ID      : 0x00A0
> 		Handle                : 0x21
> 		Variety               : IOAPIC
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x0001
> 		Handle                : 0x22
> 		Variety               : IOAPIC
> 	  IVHD
> 	----------------------------------------------------------------
> 	Type                  : 0x11
> 	Flags                 : 0x30
> 	Length                : 0x0054
> 	IOMMU Device ID       : 0x0002
> 	Capability Offset     : 0x0040
> 	IOMMU Base Address    : 0x00000000FD200000
> 	Segment Group         : 0x0000
> 	IOMMU Info            : 0x0000
> 	IOMMU Feature Info    : 0x00048000
> 		  Range
> 		--------------------------------------------------
> 		Type                  : 0x03
> 		Start of Range        : 0x0003
> 		End of Range          : 0xFFFE
> 		DTE Setting           : 0x00
> 		  Alias Range
> 		--------------------------------------------------
> 		Type                  : 0x43
> 		Start of Range        : 0xFF00
> 		End of Range          : 0xFFFF
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x00A5
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x00A0
> 		Handle                : 0x00
> 		Variety               : HPET
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0xD7
> 		Source Device ID      : 0x00A0
> 		Handle                : 0x21
> 		Variety               : IOAPIC
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x0001
> 		Handle                : 0x22
> 		Variety               : IOAPIC
> 	  IVMD
> 	----------------------------------------------------------------
> 	Type                                 : 0x22
> 	Flags                                : 0x08
> 	Length                               : 0x0020
> 	DeviceID                             : 0x0000
> 	AuxiliaryData                        : 0x0FFF
> 	Reserved                             : 0x0000000000000000
> 	IVMD Start Address                   : 0x0000000096191000
> 	IVMD Memory Block Length             : 0x0000000000000022
> 	  IVMD
> 	----------------------------------------------------------------
> 	Type                                 : 0x22
> 	Flags                                : 0x08
> 	Length                               : 0x0020
> 	DeviceID                             : 0x0000
> 	AuxiliaryData                        : 0x0FFF
> 	Reserved                             : 0x0000000000000000
> 	IVMD Start Address                   : 0x0000000097D9E000
> 	IVMD Memory Block Length             : 0x0000000000000022
> 	  IVMD
> 	----------------------------------------------------------------
> 	Type                                 : 0x22
> 	Flags                                : 0x08
> 	Length                               : 0x0020
> 	DeviceID                             : 0x0000
> 	AuxiliaryData                        : 0x0FFF
> 	Reserved                             : 0x0000000000000000
> 	IVMD Start Address                   : 0x0000000097D9D000
> 	IVMD Memory Block Length             : 0x0000000000000022
> 	  IVHD
> 	----------------------------------------------------------------
> 	Type                  : 0x40
> 	Flags                 : 0x30
> 	Length                : 0x00D0
> 	IOMMU Device ID       : 0x0002
> 	Capability Offset     : 0x0040
> 	IOMMU Base Address    : 0x00000000FD200000
> 	Segment Group         : 0x0000
> 	IOMMU Info            : 0x0000
> 	IOMMU Feature Info    : 0x00048000
> 		  Range
> 		--------------------------------------------------
> 		Type                  : 0x03
> 		Start of Range        : 0x0003
> 		End of Range          : 0xFFFE
> 		DTE Setting           : 0x00
> 		  Alias Range
> 		--------------------------------------------------
> 		Type                  : 0x43
> 		Start of Range        : 0xFF00
> 		End of Range          : 0xFFFF
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x00A5
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x00A0
> 		Handle                : 0x00
> 		Variety               : HPET
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0xD7
> 		Source Device ID      : 0x00A0
> 		Handle                : 0x21
> 		Variety               : IOAPIC
> 		  Special Device
> 		--------------------------------------------------
> 		Type                  : 0x48
> 		Device ID             : 0x0000
> 		DTE Setting           : 0x00
> 		Source Device ID      : 0x0001
> 		Handle                : 0x22
> 		Variety               : IOAPIC
> 		  Variable Length ACPI HID Device
> 		--------------------------------------------------
> 		Type                  : 0xF0
> 		Device ID             : 0x00A5
> 		DTE Setting           : 0x40
> 		Hardware ID           : AMDI0020
> 		Extended DTE Setting  : 
> 		Unique ID Format      : 2
> 		Unique ID Length      : 9
> 		Unique ID             : \_SB.FUR0
> 		  Variable Length ACPI HID Device
> 		--------------------------------------------------
> 		Type                  : 0xF0
> 		Device ID             : 0x00A5
> 		DTE Setting           : 0x40
> 		Hardware ID           : AMDI0020
> 		Extended DTE Setting  : 
> 		Unique ID Format      : 2
> 		Unique ID Length      : 9
> 		Unique ID             : \_SB.FUR1
> 		  Variable Length ACPI HID Device
> 		--------------------------------------------------
> 		Type                  : 0xF0
> 		Device ID             : 0x00A5
> 		DTE Setting           : 0x40
> 		Hardware ID           : AMDI0020
> 		Extended DTE Setting  : 
> 		Unique ID Format      : 2
> 		Unique ID Length      : 9
> 		Unique ID             : \_SB.FUR2
> 		  Variable Length ACPI HID Device
> 		--------------------------------------------------
> 		Type                  : 0xF0
> 		Device ID             : 0x00A5
> 		DTE Setting           : 0x40
> 		Hardware ID           : AMDI0020
> 		Extended DTE Setting  : 
> 		Unique ID Format      : 2
> 		Unique ID Length      : 9
> 		Unique ID             : \_SB.FUR3
> 
> FWIW, I've checked on one of the AMD server systems we have on the
> lab, and the IVHD entries are fairly similar to the ones here, as
> neither the PCI Host Bridge, nor the IOMMU are covered by any IVHD
> block.  That system however doesn't have any IVMD blocks.

Mine are a little different. The Dinar (Fam15) has an IVHD entry just
for the range 0-2 (host bridge, <nothing>, IOMMU). The Rome (Fam17)
has an IVHD entry just for 0 (host bridge), but not for the IOMMU. I
think it is entirely reasonable for host bridge(s) and IOMMU(s) to not
be covered by any IVHD. They aren't devices that would require
servicing by an IOMMU.

Looking at the code I think we want to do things a little differently
though: Pull find_iommu_for_device() out of register_range_for_device()
and have parse_ivmd_device_range() do the skipping when there's no
IOMMU for a device. Plus error when no device in the range is covered
by an IOMMU, or if any two devices are covered by different IOMMUs.

Jan

