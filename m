Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9561A93E5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 09:14:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOcEo-0008Pp-4T; Wed, 15 Apr 2020 07:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOcEm-0008Pk-4H
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 07:13:32 +0000
X-Inumbo-ID: 9c19d1ac-7ee8-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c19d1ac-7ee8-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 07:13:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26A1AAC77;
 Wed, 15 Apr 2020 07:13:29 +0000 (UTC)
Subject: Re: [XEN PATCH v4] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Harsha Shamsundara Havanur <havanur@amazon.com>
References: <4b6c017245698c18b063d156be645b8b633c0a99.1586884502.git.havanur@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81c7ca01-c272-9114-a5d0-12ca94090eb2@suse.com>
Date: Wed, 15 Apr 2020 09:13:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4b6c017245698c18b063d156be645b8b633c0a99.1586884502.git.havanur@amazon.com>
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

On 14.04.2020 19:15, Harsha Shamsundara Havanur wrote:
> @@ -120,6 +121,11 @@ void pci_setup(void)
>       */
>      bool allow_memory_relocate = 1;
>  
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MEMORY
> +            != PCI_COMMAND_MEMORY);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO
> +            != PCI_COMMAND_IO);

This still isn't in line with our default style, you will want eg:

    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MEMORY !=
                 PCI_COMMAND_MEMORY);
    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=
                 PCI_COMMAND_IO);

> @@ -208,6 +214,20 @@ void pci_setup(void)
>              break;
>          }
>  
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

Please can you bring this comment into shape? The comma on the first
line doesn't fit with the capital letter the second line starts with.
Plus, if you really mean what is now on the second line to start on a
new one, then please also insert a line consisting of just * at the
properly indented position between the two. Additionally there's at
least one line exceeding the 80-chars-per-line limit.

> @@ -289,10 +309,6 @@ void pci_setup(void)
>                     devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
>          }
>  
> -        /* Enable bus mastering. */
> -        cmd = pci_readw(devfn, PCI_COMMAND);
> -        cmd |= PCI_COMMAND_MASTER;
> -        pci_writew(devfn, PCI_COMMAND, cmd);

The movement of this wants mentioning in the description.

> @@ -526,10 +538,17 @@ void pci_setup(void)
>           * has IO enabled, even if there is no I/O BAR on that
>           * particular device.
>           */
> -        cmd = pci_readw(vga_devfn, PCI_COMMAND);
> -        cmd |= PCI_COMMAND_IO;
> -        pci_writew(vga_devfn, PCI_COMMAND, cmd);
> +        pci_devfn_decode_type[vga_devfn] |= PCI_COMMAND_IO;
>      }
> +
> +    /* Enable bus master, memory and I/O decode. */
> +    for ( devfn = 0; devfn < 256; devfn++ )
> +        if ( pci_devfn_decode_type[devfn] )
> +        {
> +            cmd = pci_readw(devfn, PCI_COMMAND);
> +            cmd |= (PCI_COMMAND_MASTER | pci_devfn_decode_type[devfn]);
> +            pci_writew(devfn, PCI_COMMAND, cmd);
> +        }

This still regresses the setting of MASTER afaict: You only set
that bit now if either IO or MEMORY would also get set. But be
sure to honor the original code not doing the write when vendor/
device IDs are all ones.

Jan

