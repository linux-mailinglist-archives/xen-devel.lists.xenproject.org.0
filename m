Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B11A758B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 10:10:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOGeA-0001sp-Jw; Tue, 14 Apr 2020 08:10:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=18iO=56=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOGe9-0001sk-KC
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 08:10:17 +0000
X-Inumbo-ID: 5fb1ea7c-7e27-11ea-88fe-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fb1ea7c-7e27-11ea-88fe-12813bfff9fa;
 Tue, 14 Apr 2020 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586851816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Dmkv7ANemtWkRfszIgcvzoiAzRjJkLWxduuhPLm4LpY=;
 b=hOMbzYUPqS+dYnCA1sy/eZCnR5qLQZGrloU/BCGmc60B+gsN57NVA3j2
 TIAj4oAp+5+opwHIEpcGOr9A7jT7UDTJqZtwWbl+1KaAKGJOaQVVtSbDQ
 3uCcVvrmTME2Dd295qINhSA/8IbHL/gAFbPWdjCITUcRfIFgvj3bixzLO E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Xm+bSiccrd9b5XFiUoZiFx1I5UUy0o50k8INvA9nC0nSfwmWfcm4yAsq+KfRadmck/wi9850Lr
 Jp4pRh1AP0RDusPK/QPXfRVuppvqXdwi5+q8HKL9tgNjTYaeeXKqEUVNuEPzqQH8ZbZZ5YlLlz
 m3g47ShJ94nTv//35u00Ao6NhXnsKHzjZ6Byf5utVeZAtqyWaATy2pgo6UAQQPQXT9l0W5W+Uc
 qJtUtBgkZy9ZxhGbU84t+yTDTBSt/8+4TUwt39Edp0JVeWigZZkJn1aBAnR9UyiduCKM15IP0D
 vhg=
X-SBRS: 2.7
X-MesageID: 16297269
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="16297269"
Date: Tue, 14 Apr 2020 10:10:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Harsha Shamsundara Havanur <havanur@amazon.com>
Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
Message-ID: <20200414081009.GE28601@Air-de-Roger>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 13, 2020 at 09:33:42PM +0000, Harsha Shamsundara Havanur wrote:
> It was observed that PCI MMIO and/or IO BARs were programmed with
> BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
> register) enabled, during PCI setup phase. This resulted in
> incorrect memory mapping as soon as the lower half of the 64 bit bar
> is programmed, which displaced any RAM mappings under 4G. After the
> upper half is programmed PCI memory mapping is restored to its
> intended mapping but the RAM displaced is not restored. The OS then
> continues to boot and function until it tries to access the displaced
> RAM at which point it suffers a page fault and crashes.
> 
> This patch address the issue by deferring enablement of memory and
> I/O decode in command register until all the resources, like interrupts
> I/O and/or MMIO BARs for all the PCI device functions are programmed.
> 
> Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
> Reviewed-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  tools/firmware/hvmloader/pci.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index 0b708bf578..f74471b255 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -84,6 +84,7 @@ void pci_setup(void)
>      uint32_t vga_devfn = 256;
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
> +    uint8_t pci_devfn_decode_type[256] = {};
>  
>      /* Resources assignable to PCI devices via BARs. */
>      struct resource {
> @@ -120,6 +121,9 @@ void pci_setup(void)
>       */
>      bool allow_memory_relocate = 1;
>  
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MEMORY != PCI_COMMAND_MEMORY);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO != PCI_COMMAND_IO);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO != PCI_COMMAND_MASTER);
>      s = xenstore_read(HVM_XS_ALLOW_MEMORY_RELOCATE, NULL);
>      if ( s )
>          allow_memory_relocate = strtoll(s, NULL, 0);
> @@ -289,9 +293,22 @@ void pci_setup(void)
>                     devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
>          }
>  
> -        /* Enable bus mastering. */
> +        /*
> +         * Disable bus mastering, memory and I/O space, which is typical device
> +         * reset state. It is recommended that BAR programming be done whilst
> +         * decode bits are cleared to avoid incorrect mappings being created,
> +         * when 64-bit memory BAR is programmed first by writing the lower half
> +         * and then the upper half, which first maps to an address under 4G
> +         * replacing any RAM mapped in that address, which is not restored
> +         * back after the upper half is written and PCI memory is correctly
> +         * mapped to its intended high mem address.
> +         *
> +         * Capture the state of bus master to restore it back once BAR
> +         * programming is completed.
> +         */
>          cmd = pci_readw(devfn, PCI_COMMAND);
> -        cmd |= PCI_COMMAND_MASTER;
> +        pci_devfn_decode_type[devfn] = cmd & ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
> +        cmd &= ~(PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
>          pci_writew(devfn, PCI_COMMAND, cmd);
>      }
>  
> @@ -503,10 +520,9 @@ void pci_setup(void)
>          if ( (bar_reg == PCI_ROM_ADDRESS) ||
>               ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
>                PCI_BASE_ADDRESS_SPACE_MEMORY) )
> -            cmd |= PCI_COMMAND_MEMORY;
> +            pci_devfn_decode_type[devfn] |= PCI_COMMAND_MEMORY;
>          else
> -            cmd |= PCI_COMMAND_IO;
> -        pci_writew(devfn, PCI_COMMAND, cmd);
> +            pci_devfn_decode_type[devfn] |= PCI_COMMAND_IO;
>      }
>  
>      if ( pci_hi_mem_start )
> @@ -526,10 +542,13 @@ void pci_setup(void)
>           * has IO enabled, even if there is no I/O BAR on that
>           * particular device.
>           */
> -        cmd = pci_readw(vga_devfn, PCI_COMMAND);
> -        cmd |= PCI_COMMAND_IO;
> -        pci_writew(vga_devfn, PCI_COMMAND, cmd);
> +        pci_devfn_decode_type[vga_devfn] |= PCI_COMMAND_IO;
>      }
> +
> +    /* Enable memory and I/O space. Restore saved BUS MASTER state */
> +    for ( devfn = 0; devfn < 256; devfn++ )
> +        if ( pci_devfn_decode_type[devfn] )
> +            pci_writew(devfn, PCI_COMMAND, pci_devfn_decode_type[devfn]);

Why don't you enable the decoding after done with programming all the
BARs on the device in the loop above? Is there any reason to defer
this until all devices have been programmed?

If so, I think you would also need to introduce a pre-loop that
disables all of this for all devices before programming the BARs, or
else you are still programming BARs while some devices might have the
bus mastering or decoding bits enabled.

Thanks, Roger.

