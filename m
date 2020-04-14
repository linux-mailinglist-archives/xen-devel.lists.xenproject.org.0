Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2D1A7F42
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 16:12:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOMIF-0005Qn-9A; Tue, 14 Apr 2020 14:12:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOMID-0005Qi-Dk
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 14:12:01 +0000
X-Inumbo-ID: e78b69c9-7e59-11ea-8941-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e78b69c9-7e59-11ea-8941-12813bfff9fa;
 Tue, 14 Apr 2020 14:12:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9D049AC75;
 Tue, 14 Apr 2020 14:11:58 +0000 (UTC)
Subject: Re: [XEN PATCH v3] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Harsha Shamsundara Havanur <havanur@amazon.com>
References: <758e3427f147ed82774edcbbe80b0b29c812e6e4.1586862721.git.havanur@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3926fb02-2058-6e3a-6dcd-3ac5c4b97de5@suse.com>
Date: Tue, 14 Apr 2020 16:12:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <758e3427f147ed82774edcbbe80b0b29c812e6e4.1586862721.git.havanur@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 13:12, Harsha Shamsundara Havanur wrote:
> It was observed that PCI MMIO and/or IO BARs were programmed with
> memory and I/O decodes (bits 0 and 1 of PCI COMMAND register) enabled,
> during PCI setup phase. This resulted in incorrect memory mapping as
> soon as the lower half of the 64 bit bar is programmed.
> This displaced any RAM mappings under 4G. After the
> upper half is programmed PCI memory mapping is restored to its
> intended high mem location, but the RAM displaced is not restored.
> The OS then continues to boot and function until it tries to access
> the displaced RAM at which point it suffers a page fault and crashes.
> 
> This patch address the issue by deferring enablement of memory and
> I/O decode in command register until all the resources, like interrupts
> I/O and/or MMIO BARs for all the PCI device functions are programmed,
> in the descending order of memory requested.
> 
> Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>
> Reviewed-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

You've fixed bugs, implying you need to drop tags covering the code
which was fixed. As said on v2, imo you should have dropped the tags
then already.

> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -84,6 +84,7 @@ void pci_setup(void)
>      uint32_t vga_devfn = 256;
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
> +    uint8_t pci_devfn_decode_type[256] = {};

I'm still waiting for a reply on my v1 comment on the stack
consumption of this, suggesting two 256-bit bitmaps instead.

> @@ -120,6 +121,9 @@ void pci_setup(void)
>       */
>      bool allow_memory_relocate = 1;
>  
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MEMORY != PCI_COMMAND_MEMORY);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO != PCI_COMMAND_IO);

These lines are too long.

> @@ -288,10 +292,21 @@ void pci_setup(void)
>              printf("pci dev %02x:%x INT%c->IRQ%u\n",
>                     devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
>          }
> -
>          /* Enable bus mastering. */

Please don't drop a blank line like this.

>          cmd = pci_readw(devfn, PCI_COMMAND);
>          cmd |= PCI_COMMAND_MASTER;
> +
> +        /*
> +         * Disable memory and I/O decode,
> +         * It is recommended that BAR programming be done whilst
> +         * decode bits are cleared to avoid incorrect mappings being created,
> +         * when 64-bit memory BAR is programmed first by writing the lower half
> +         * and then the upper half, which first maps to an address under 4G
> +         * replacing any RAM mapped in that address, which is not restored
> +         * back after the upper half is written and PCI memory is correctly
> +         * mapped to its intended high mem address.
> +         */
> +        cmd &= ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
>          pci_writew(devfn, PCI_COMMAND, cmd);
>      }

I'd like to note that the disabling of IO and MEMORY you do here comes too
late: It should happen before any of the BARs gets written with ~0. In
particular for 64-bit BARs these writes can again cause undue effects on
the intermediately resulting effective addresses.

> @@ -526,10 +537,16 @@ void pci_setup(void)
>           * has IO enabled, even if there is no I/O BAR on that
>           * particular device.
>           */
> -        cmd = pci_readw(vga_devfn, PCI_COMMAND);
> -        cmd |= PCI_COMMAND_IO;
> -        pci_writew(vga_devfn, PCI_COMMAND, cmd);
> +        pci_devfn_decode_type[vga_devfn] |= PCI_COMMAND_IO;
>      }
> +
> +    /* Enable memory and I/O decode. */
> +    for ( devfn = 0; devfn < 256; devfn++ )
> +        if ( pci_devfn_decode_type[devfn] ) {

Style: The brace belongs on its own line.

To save one set of writes to the command registers I would, btw,
be okay with you moving the MASTER enabling here.

Jan

