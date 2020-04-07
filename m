Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5261A08C1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 09:57:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLj78-0008HR-HG; Tue, 07 Apr 2020 07:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLj77-0008HE-3B
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 07:57:41 +0000
X-Inumbo-ID: 73df50e8-78a5-11ea-807b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73df50e8-78a5-11ea-807b-12813bfff9fa;
 Tue, 07 Apr 2020 07:57:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 85E02AC37;
 Tue,  7 Apr 2020 07:57:38 +0000 (UTC)
Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Harsha Shamsundara Havanur <havanur@amazon.com>
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7aa78875-a69d-08bd-a3c6-8df58de75bb8@suse.com>
Date: Tue, 7 Apr 2020 09:57:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
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

On 06.04.2020 19:46, Harsha Shamsundara Havanur wrote:
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -84,6 +84,7 @@ void pci_setup(void)
>      uint32_t vga_devfn = 256;
>      uint16_t class, vendor_id, device_id;
>      unsigned int bar, pin, link, isa_irq;
> +    uint8_t pci_devfn_decode_type[256] = {};

256 bytes of new stack space consumption looks quite a lot to me.
Did you consider using two 256-bit bitmaps instead, totaling to
an extra 64 bytes of stack space needed?

> It was observed that PCI MMIO and/or IO BARs were programmed with
> BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
> register) enabled, during PCI setup phase. This resulted in
> spurious and premature bus transactions as soon as the lower bar of
> the 64 bit bar is programmed. It is highly recommended that BARs be
> programmed whilst decode bits are cleared to avoid spurious bus
> transactions.
> 
> This patch address the issue by deferring enablement of memory and
> I/O decode in command register until all the resources, like interrupts
> I/O and/or MMIO BARs for all the PCI device functions are programmed.
> PCI bus memory and I/O space is enabled in command register after
> all the resources like interrupts, I/O and/or MMIO BARs are
> programmed for all valid device functions. PCI BUS MASTER is kept
> disabled in the bootloader as this needs to be enabled by the guest
> OS driver once it initializes and takes control of the device.

Identifying the commit that introduced the issue, even if very old,
would be nice (bbfa22f8c9ca). From looking at current code I first
got the impression that it might have been a result of splitting a
loop, as the main issue is that the bits get set after a first
BAR got programmed, without considering that there might be more.
However, the original commit looks to have assumed that there's
at most one BAR or each type per device (which may have been true
back then for just the few emulated devices there were).

> @@ -289,9 +290,14 @@ void pci_setup(void)
>                     devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
>          }
>  
> -        /* Enable bus mastering. */
> +        /*
> +         * Disable bus mastering, memory and I/O space, which is typical device
> +         * reset state. It is recommended that BAR programming be done whilst
> +         * decode bits are cleared to avoid spurious DMAs and bus transactions.
> +         * Bus master should be enabled by guest driver when it deems fit.
> +         */
>          cmd = pci_readw(devfn, PCI_COMMAND);
> -        cmd |= PCI_COMMAND_MASTER;
> +        cmd &= ~(PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
>          pci_writew(devfn, PCI_COMMAND, cmd);
>      }

I agree with Andrew that there doesn't look to be a reason to
fiddle with bus mastering here. This is the more that you don't
re-enable it later.

I'm also curious whether there are actually devices getting
handed to the domain (and hence hvmloader) with the memory
and/or I/O decode bits set. This would look to be wrong to me,
and would perhaps want fixing wherever they get set prematurely.
(This isn't to say that, to be on the safe side, we couldn't
also re-clear them here. Maybe there should be a warning issued
if either bit is set?)

Jan

