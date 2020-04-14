Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A51A7518
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 09:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOGDN-00074c-2T; Tue, 14 Apr 2020 07:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOGDM-00074X-5T
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 07:42:36 +0000
X-Inumbo-ID: 810fdc50-7e23-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 810fdc50-7e23-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 07:42:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB051AE2D;
 Tue, 14 Apr 2020 07:42:32 +0000 (UTC)
Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Harsha Shamsundara Havanur <havanur@amazon.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
Date: Tue, 14 Apr 2020 09:42:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
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

On 13.04.2020 23:33, Harsha Shamsundara Havanur wrote:
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

There not being any description of what has changed in v2, I also
can't easily judge whether keeping the two tags above was
legitimate. In any event you don't seem to have taken care of all
review feedback (whether by making changes to the patch or by
replying verbally).

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

This looks like a copy-and-paste mistake - are you sure you've
build-tested this? (This alone likely invalidates the tags, as
per above.)

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

The disabling of MASTER was put under question in v1 already.

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

You effectively clear the upper 8 bits here, rather than retaining
them.

Jan

