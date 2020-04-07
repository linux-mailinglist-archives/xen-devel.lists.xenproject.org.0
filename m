Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954001A08A1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 09:49:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLiyV-0007Pr-Bl; Tue, 07 Apr 2020 07:48:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xamf=5X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLiyU-0007Pm-F3
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 07:48:46 +0000
X-Inumbo-ID: 350825e4-78a4-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 350825e4-78a4-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 07:48:45 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id bd14so2810156edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2020 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BpJsjoxc5HkdNx9gaBUk+4EZId6vwzHIBI/AbHwIbLk=;
 b=kEiSYJLJqpcbbK9n+iz6x+NLCjvysKGZRJRdLLp5+xTMk+YOieP8NHpQi/VJH48s/N
 AD0wqvzRs301XWSeDmuvArWwKGXLgX8uREYqcV7Jggh7U8h+ruLbzHlSan4VSC4XC7ZG
 o9cmJTEOCNk835LOTrWz7fB9vUlbqJf2R5I5gh/5jXA/ul2PkNrRNxu/zlhHUXtliy7T
 dfqU4Xa/NCmy86wt70u6N2QsfRPo+h5fx/PlxQUlrmNDS5HyTlqBaguor5aszAPsZlDQ
 dDCGDobohRx8ZmT0GCaW6yrvF+VEhvgct6NjfMfgig5o+TG/mU7V80G1Ac4Vnt1CzHMr
 rnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BpJsjoxc5HkdNx9gaBUk+4EZId6vwzHIBI/AbHwIbLk=;
 b=DQx3vMn4ex/TIrp6gGq1r7z2yppEB4FvDdliM46vXYDlgVERnFPjJazO3uVAZuZYRY
 u3rH9sRSWkkw1fL40K4DhDl/DjwhafhyJQI8Y+gmOSw8ksVFOWarTqVHBsjlvZSPRXSV
 xN4pBMwDbO39WlZqCCCMBNLjRf/AgAU0vsje82zUxOGLAjEPu3F7ZUxsKqAGtaTvoBTg
 ZfZZ42NnlLcH3yLqT0tCy/mtno+7CFsDUoEBbJEfHunRgOEAU57B/dJH9kTym11sxnC1
 zgGGUh2sKOz6gxWxtL5zXM0I2kCpnLQc7aEb+1xDbegUpOrtT4BUwItFvQ3XInJJLKcv
 Cr6A==
X-Gm-Message-State: AGi0PuZWBl3QQ3ZNu/SeeMRo8Dd8HNwz+hhE+FF6Jn/rcc4YzN9IqGn5
 oTXmcXZmBmnEVP2im+Npp6g=
X-Google-Smtp-Source: APiQypIqfX/9YqiiJF/sDHt9Z88sBfwWCDnWEIFfW6fopp1e2HaUFKMR9PVGHtuB1wC4jUsUZABzig==
X-Received: by 2002:a50:9d06:: with SMTP id v6mr833681ede.189.1586245724241;
 Tue, 07 Apr 2020 00:48:44 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id o27sm1772775ejc.23.2020.04.07.00.48.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 00:48:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Harsha Shamsundara Havanur'" <havanur@amazon.com>,
 <xen-devel@lists.xenproject.org>
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
In-Reply-To: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
Subject: RE: [XEN PATCH] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Tue, 7 Apr 2020 08:48:42 +0100
Message-ID: <001501d60cb0$f60e0660$e22a1320$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLv5qvTmuvbc0jpqBdZKffFHl7s5qY5kH1Q
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Harsha Shamsundara Havanur
> Sent: 06 April 2020 18:47
> To: xen-devel@lists.xenproject.org
> Cc: Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; =
Ian Jackson
> <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Harsha =
Shamsundara Havanur
> <havanur@amazon.com>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all =
resource allocation
>=20
> It was observed that PCI MMIO and/or IO BARs were programmed with
> BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
> register) enabled, during PCI setup phase. This resulted in
> spurious and premature bus transactions as soon as the lower bar of
> the 64 bit bar is programmed. It is highly recommended that BARs be
> programmed whilst decode bits are cleared to avoid spurious bus
> transactions.
>=20

It's not so much spurious transactions that are the issue. I think =
"spurious and premature bus transactions" should be replaced with =
"incorrect mappings being created".

I believe the PCI spec says all three bits should be clear after reset =
anyway, and BAR programming whilst decodes are enabled causes problems =
for emulators such as QEMU which need to create and destroy mappings =
between the gaddr being programming into the virtual BAR and the maddr =
programmed into the physical BAR.
Specifically the case we see is that a 64-bit memory BAR is programmed =
by writing the lower half and then the upper half. After the first write =
the BAR is mapped to an address under 4G that happens to contain RAM, =
which is displaced by the mapping. After the second write the BAR is =
re-mapped to the intended location but the RAM displaced by the other =
mapping is not restored. The OS then continues to boot and function =
until at some point it happens to try to use that RAM at which point it =
suffers a page fault and crashes. It was only by noticing that the =
faulting address lay within the transient BAR mapping that we figured =
out what was happening.

> This patch address the issue by deferring enablement of memory and
> I/O decode in command register until all the resources, like =
interrupts
> I/O and/or MMIO BARs for all the PCI device functions are programmed.
> PCI bus memory and I/O space is enabled in command register after
> all the resources like interrupts, I/O and/or MMIO BARs are
> programmed for all valid device functions. PCI BUS MASTER is kept
> disabled in the bootloader as this needs to be enabled by the guest
> OS driver once it initializes and takes control of the device.
>=20
> Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
> Ack-by: Paul Durrant <pdurrant@amazon.com>

With the comment fixed as I suggest, you can replace this with:

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  tools/firmware/hvmloader/pci.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>=20
> diff --git a/tools/firmware/hvmloader/pci.c =
b/tools/firmware/hvmloader/pci.c
> index 0b708bf578..0f31866453 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -84,6 +84,7 @@ void pci_setup(void)
>      uint32_t vga_devfn =3D 256;
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
> +    uint8_t pci_devfn_decode_type[256] =3D {};
>=20
>      /* Resources assignable to PCI devices via BARs. */
>      struct resource {
> @@ -289,9 +290,14 @@ void pci_setup(void)
>                     devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
>          }
>=20
> -        /* Enable bus mastering. */
> +        /*
> +         * Disable bus mastering, memory and I/O space, which is =
typical device
> +         * reset state. It is recommended that BAR programming be =
done whilst
> +         * decode bits are cleared to avoid spurious DMAs and bus =
transactions.
> +         * Bus master should be enabled by guest driver when it deems =
fit.
> +         */
>          cmd =3D pci_readw(devfn, PCI_COMMAND);
> -        cmd |=3D PCI_COMMAND_MASTER;
> +        cmd &=3D ~(PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY | =
PCI_COMMAND_IO);
>          pci_writew(devfn, PCI_COMMAND, cmd);
>      }
>=20
> @@ -503,10 +509,9 @@ void pci_setup(void)
>          if ( (bar_reg =3D=3D PCI_ROM_ADDRESS) ||
>               ((bar_data & PCI_BASE_ADDRESS_SPACE) =3D=3D
>                PCI_BASE_ADDRESS_SPACE_MEMORY) )
> -            cmd |=3D PCI_COMMAND_MEMORY;
> +            pci_devfn_decode_type[devfn] |=3D PCI_COMMAND_MEMORY;
>          else
> -            cmd |=3D PCI_COMMAND_IO;
> -        pci_writew(devfn, PCI_COMMAND, cmd);
> +            pci_devfn_decode_type[devfn] |=3D PCI_COMMAND_IO;
>      }
>=20
>      if ( pci_hi_mem_start )
> @@ -530,6 +535,15 @@ void pci_setup(void)
>          cmd |=3D PCI_COMMAND_IO;
>          pci_writew(vga_devfn, PCI_COMMAND, cmd);
>      }
> +
> +    /* Enable memory and I/O space. */
> +    for ( devfn =3D 0; devfn < 256; devfn++ )
> +        if ( pci_devfn_decode_type[devfn] )
> +        {
> +            cmd =3D pci_readw(devfn, PCI_COMMAND);
> +            cmd |=3D pci_devfn_decode_type[devfn];
> +            pci_writew(devfn, PCI_COMMAND, cmd);
> +        }
>  }
>=20
>  /*
> --
> 2.16.6
>=20



