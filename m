Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vZgkK3Y2t2k+OAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 15 Mar 2026 23:45:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B86292E49
	for <lists+xen-devel@lfdr.de>; Sun, 15 Mar 2026 23:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255413.1550384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1uBk-00035o-S9; Sun, 15 Mar 2026 22:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255413.1550384; Sun, 15 Mar 2026 22:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1uBk-00033J-NN; Sun, 15 Mar 2026 22:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1255413;
 Sun, 15 Mar 2026 22:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTDb=BP=gmail.com=x1917x@srs-se1.protection.inumbo.net>)
 id 1w1uBj-00033D-64
 for xen-devel@lists.xenproject.org; Sun, 15 Mar 2026 22:43:59 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7319f318-20c0-11f1-b164-2bf370ae4941;
 Sun, 15 Mar 2026 23:43:56 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48540d21f7dso46733735e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 15 Mar 2026 15:43:56 -0700 (PDT)
Received: from LinuxLaptop ([156.146.63.148]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485696a12d0sm9329865e9.13.2026.03.15.15.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 15:43:54 -0700 (PDT)
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
X-Inumbo-ID: 7319f318-20c0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773614636; x=1774219436; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R+oKftX9fWed4q1JFI6dnkZ5cVOEANix0J2Szgkj1kw=;
        b=Dd35wY4NsWP/uDxbPKxtLcemqgyEE6+K8ZGcYmnGHM486PGEjIigplwzWmY0e7xySJ
         2LicqrxEj6zNjNwK+sYscDGAZ5jv+6RAMp7YFCP+n6Psz+YtBJfGuKxUjZqR2PYadLDk
         QfNwtU+inPRbRDjWfqLNHRq17HUW6NvjWl37maTKr4dYsVgxflWoIP9PILE1V13yQRPh
         6KM1DnqV2/NHuK3J67G0k/vhRnIZzLS74+gmuqdrl5fgxaU2Fye4BaCc4s5f270Jfxgx
         4n0vrXG1hZyfHp8WulXG62WQPRzo7FqR2VBbZfyY7lHRgeKiYUqmNfFAuEa0verkbK+3
         mvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773614636; x=1774219436;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+oKftX9fWed4q1JFI6dnkZ5cVOEANix0J2Szgkj1kw=;
        b=jD7MRYOk/7m4lkpp1J/78jUJkb5DxBbhbBDWpUeQr6kk4fmj7R3tdRxrd9ZSV6eoM4
         zEsuahwL2kBnsMtAQj5t/BL6bEE1j0Bdf+vt1CrNsd5b9JObmdhMHCSgT69sEyCZFi2A
         5mC3gr28SPcmF74bhngNOWg8zF8R9HDCdDbGkgcXJTMpVXuS8y86szQJZbC7p7OY/4G1
         YdQhI+T3brPCGpJMfD36mdnpeyfftMaXnda6X9w/IrDb64sHujAZpLac6Gle57vtQDPq
         K9d4phtpS1oNqNpzzyDtipp4QQr5KcIWcT9zxlgodThc4RtNFUziCZgSpAGyiMXlI/8I
         y/7w==
X-Gm-Message-State: AOJu0YxrG+uQo6tFAEiUacPp09ku0RsC1MhgbH9VFkz34TQhdFz63jkQ
	gJ8ipO4+C3l14DUNXSKVlaljI2mfi1Q8jjQ20VX9YvBMsRyDsIQwUb1/
X-Gm-Gg: ATEYQzxlkdVnON5mIRLrLGDKQHwnwgWjCtNaWb4tLfuVgwZD045DLFMtU8cxZOhRDHz
	ajKrAAifNNN2a4/GIVwcA1Pdzi0ec497t+C1C+/Zv5Q2Rv2rniYA0SDcWCp+AoDTD2iGHQAGrEP
	mozkTfRB7VQEwr90xbocCd0Z73i3YOQKSW8pdiFo/j4ZZcKD+V/l5FUg/267rc8pGgT88L0bG64
	HMLxQZvLA9oJ6MKsNf6QaGmy5OC7kRN4u/HLjO/CR2gCDgJ/hk3D42Jz7kph0VYVH0kT/S40JNg
	WgjJp1gYiNa0IZcoecosm50buofXVbVMFW7QBkolqR2fJLSYR7YAhO3i2/XxUEXKwcKNMUBBwp5
	iWgdXPtEwGXHqaTuSL7dX2rYbzIRJhD8gixzWwUulikPgYSFRqvXtVm+c3HrdHXTXlMbQ1R0apK
	dedk18KamWjAG+F8VOGw==
X-Received: by 2002:a05:600c:a09:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-485566ddac0mr199693975e9.14.1773614635407;
        Sun, 15 Mar 2026 15:43:55 -0700 (PDT)
Date: Sun, 15 Mar 2026 23:43:49 +0100
From: Alexey G <x1917x@gmail.com>
To: "Thierry Escande" <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Roger Pau =?UTF-8?B?TW9u?=
 =?UTF-8?B?bsOp?=" <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Juergen Gross" <jgross@suse.com>
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
Message-ID: <20260315234349.36c0dd8b@LinuxLaptop>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
Organization: none
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[x1917x@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[x1917x@gmail.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F2B86292E49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I'm glad someone wants to commit these patches (and surprised that
they're still applicable after so many years), thank you for this
effort. Feel free to proceed, it would be good if you manage to upstream
them to Xen/QEMU code. But be prepared that it won't be an easy
task - the patches cross multiple areas of responsibility, so it will
require some effort to make all involved Xen/QEMU maintainers happy.
I don't work on virtualization/x86 anymore and I barely remember
anything after 8 years, so I probably won't be able to help much, but
I'll keep an eye on the email thread.


Some historical background for the Q35 patches:

The project I was working on was relying on Xen for PCIe device
passthrough (mostly GPUs, NICs and storage controllers) to HVM guests.
So PCIe passthrough and HVM were the top priority - it affected many
of my decisions.

IIRC, there were 2 major obstacles to successfully passthrough any PCIe device:

1. Even back then, there were **multiple PCIe devices whose drivers
were attempting to read/write registers from their device's PCIe
extended config space** (offsets above 100h). Supporting this feature
required to have MMCONFIG/ECAM working, which was something only
available for Q35 emulation at that time => hence Q35 support was
added, with mostly PCIe passthrough in mind. In the process I also
discovered that dreadful "PCIe topology check" issue which was bypassed
by presenting the passed through PCIe device to the OS as a chipset
built-in device. This solution was a bit hacky, but allowed to
successfully pass through PCIe devices to a Q35 HVM guest.

2. Some devices had mirrors of BAR registers' values _accessed through
a proprietary mechanism_, like reading them through device-specific
MMIO registers. As such, their drivers do not read a BAR value from
the PCI conf space but rather get it directly from eg. MMIO, whose
layout is completely unknown to us. This makes all BAR emulation in the
hypervisor useless for such device - the hypervisor returns one value
for BARs read via PCI conf space, but the driver sees the real values
as it bypasses the PCI conf space. Among such devices were Nvidia GPUs
BTW - but not including the "pro" models AFAIR, which were more
virtualization-friendly.

That "BAR desync" problem was tricky - I solved it by implementing an
option (in the domain config file) for a passed through device which,
when turned on, was basically enabling 1:1 matching between virtual and
physical BAR values for a given device, without affecting other devices
(be it PT or emulated). This way virtual physical addresses in BARs
match the real ones - hence the device driver sees the same values
either in the PCI conf space or proprietary registers.

But it wasn't that simple, unfortunately - having a specific "locked"
BAR value means we need to adjust the MMIO hole size for the guest
accordingly. A straightforward approach is to make the MMIO hole size
very big. This in turn brought another problems to solve:

2.1. when a recent (back then) Windows OS sees PCI BAR allocation which
is far from perfect - it can completely reallocate all BARs of all
devices to other, very different addresses. They were calling this
feature as PCIe "resource rebalancing" IIRC. This breaks 1:1 mirroring
of given device's virtual/physical BARs - it's ok to present BARs with
real physical addresses (the sneaky device driver knows them via MMIO
registers anyway), but allowing to modify values in BARs is a no go, of
course.

Luckily, this problem was solved by a specific PCI BAR allocation - the
idea was to keep the MMIO hole as small as possible while avoiding
large unused gaps inside it, not claimed by any BAR. It was implemented
inside hvmloader, which was populating the MMIO hole while taking into
account both fixed and freely modifiable BARs and then reported the new
RAM/MMIO hole layout back to Xen. This allowed to prevent the PCI BAR
reallocation from the OS - and hotplugging was still working thanks to
the high MMIO hole (above 4Gb).

2.2. after experimenting with dynamic resizing of the MMIO hole, I
realized that Xen and QEMU have their own vision of the system memory
layout which can get out of sync. And MMIO hole resize was creating
this bad situation in fact, giving some hard to debug/reproduce bugs
with unexpected guest memory corruption.

The way I fixed this memory mismatch was emulating the real Q35
facility for this - namely, chipset's REMAP register which was designed
precisely for this goal - to reconfigure the MMIO hole size/position
while relocating underlying RAM memory to another range (so no RAM is
wasted). As the chipset was emulated by QEMU and the whole idea of HVM
was to emulate real hardware as close as possible, this was the obvious
solution - we do it in the way like it's done in a real firmware and
then QEMU knows the RAM/MMIO hole layout, allowing to sync it with
Xen's. There were some other fixed issues relying on this feature -
AFAIR, I needed it also to make 'populate on demand' working with
(hotplugged?) PT devices.

I was planning to send patches for this feature too, after settling the
Q35 patches. I'll try to find the relevant code/notes, maybe they will
be helpful.

On Fri, 13 Mar 2026 16:35:01 +0000
"Thierry Escande" <thierry.escande@vates.tech> wrote:

>This series introduces initial Q35 chipset support for HVM guests, based on the
>patchset at [1] by Alexey Gerasimenko.
>
>Basic support means that this patchset allows to start an HVM guest that
>emulates a Q35 chipset via Qemu and implements access to PCIe extended
>configuration space for such devices emulated by Qemu.
>
>Support for PCIe device passthrough is not implemented yet. This is planned but
>implies modifications in the hypervisor and the firmwares, mainly for the
>support of multiple PCI buses.
>
>In order to create a Q35 guest, a new domain config option has been added,
>named 'device_model_machine'. Possible values are:
>- "i440" - i440 emulation (default)
>- "q35"  - emulate a Q35 machine
>
>If the option is omitted it defaults to "i440", not impacting existing domain
>configuration files.
>
>DSDT files for Q35 and i440 are largely similar so the existing file dsdt.asl
>has been split with i440 and q35 specific parts put in seperated files.
>
>The PCIe MMCONFIG area is configured by hvmloader and its base address and size
>are set in Xen using a new pair of hypercalls HVMOP_get|set_ecam_space. Access
>to the MMCONFIG area from a guest is trapped by Xen and transfered to the
>emulator as XEN_DMOP_IO_RANGE_PCI ioreq type.
>
>[1] https://lore.kernel.org/xen-devel/cover.1520867740.git.x1917x@gmail.com/
>
>Thierry Escande (17):
>  libacpi: Split dsdt.asl file and extract i440 specific parts
>  libacpi: new DSDT ACPI table for Q35
>  hvmloader: add function to set the emulated machine type (i440/Q35)
>  hvmloader: add ACPI enabling for Q35
>  hvmloader: add Q35 DSDT table loading
>  hvmloader: Move pci devices setup to a separate function
>  hvmloader: add basic Q35 support
>  hvmloader: Extend PCI BAR struct
>  xev/hvm: Add HVMOP_get|set_ecam_space hypercalls
>  hvmloader: Add support for HVMOP_set|get_ecam_space hypercalls
>  hvmloader: allocate MMCONFIG area in the MMIO hole
>  libxl: Q35 support (new option device_model_machine)
>  libxl: Add xen-platform device for Q35 machine
>  libacpi: build ACPI MCFG table if requested
>  hvmloader: Set MCFG in ACPI table
>  Handle PCIe ECAM space access from guests
>  docs: provide description for device_model_machine option


