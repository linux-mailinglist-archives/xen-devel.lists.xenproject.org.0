Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F21A771E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:14:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOHdy-0007I9-OJ; Tue, 14 Apr 2020 09:14:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOHdx-0007I4-Im
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:14:09 +0000
X-Inumbo-ID: 4bed208e-7e30-11ea-890b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bed208e-7e30-11ea-890b-12813bfff9fa;
 Tue, 14 Apr 2020 09:14:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A616AF2C;
 Tue, 14 Apr 2020 09:14:07 +0000 (UTC)
Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
 <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
Date: Tue, 14 Apr 2020 11:14:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 11:00, Shamsundara Havanur, Harsha wrote:
> On Tue, 2020-04-14 at 09:42 +0200, Jan Beulich wrote:
>> On 13.04.2020 23:33, Harsha Shamsundara Havanur wrote:
>>> @@ -289,9 +293,22 @@ void pci_setup(void)
>>>                     devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
>>>          }
>>>
>>> -        /* Enable bus mastering. */
>>> +        /*
>>> +         * Disable bus mastering, memory and I/O space, which is
>>> typical device
>>> +         * reset state. It is recommended that BAR programming be
>>> done whilst
>>> +         * decode bits are cleared to avoid incorrect mappings
>>> being created,
>>> +         * when 64-bit memory BAR is programmed first by writing
>>> the lower half
>>> +         * and then the upper half, which first maps to an address
>>> under 4G
>>> +         * replacing any RAM mapped in that address, which is not
>>> restored
>>> +         * back after the upper half is written and PCI memory is
>>> correctly
>>> +         * mapped to its intended high mem address.
>>> +         *
>>> +         * Capture the state of bus master to restore it back once
>>> BAR
>>> +         * programming is completed.
>>> +         */
>>>          cmd = pci_readw(devfn, PCI_COMMAND);
>>> -        cmd |= PCI_COMMAND_MASTER;
>>> +        pci_devfn_decode_type[devfn] = cmd & ~(PCI_COMMAND_MEMORY
>>> | PCI_COMMAND_IO);
>>> +        cmd &= ~(PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY |
>>> PCI_COMMAND_IO);
>>
>> The disabling of MASTER was put under question in v1 already.
> 
> Disabling of MASTER is done whilst programming BARs and it is restored
> back to its previous value in the loop at the end of pci_setup
> function.

Yet didn't Andrew indicate he knows of devices which get upset if
MASTER _ever_ gets cleared?

>>> @@ -526,10 +542,13 @@ void pci_setup(void)
>>>           * has IO enabled, even if there is no I/O BAR on that
>>>           * particular device.
>>>           */
>>> -        cmd = pci_readw(vga_devfn, PCI_COMMAND);
>>> -        cmd |= PCI_COMMAND_IO;
>>> -        pci_writew(vga_devfn, PCI_COMMAND, cmd);
>>> +        pci_devfn_decode_type[vga_devfn] |= PCI_COMMAND_IO;
>>>      }
>>> +
>>> +    /* Enable memory and I/O space. Restore saved BUS MASTER state
>>> */
>>> +    for ( devfn = 0; devfn < 256; devfn++ )
>>> +        if ( pci_devfn_decode_type[devfn] )
>>> +            pci_writew(devfn, PCI_COMMAND,
>>> pci_devfn_decode_type[devfn]);
>>
>> You effectively clear the upper 8 bits here, rather than retaining
>> them.
>>
> In fact cmd is a 32 bit value and I am retaining only lower 8 bits of
> it. This will be corrected in v3.

PCI_COMMAND is a 16-bit field. The adjacent 16 bits in the same 32 bit
word are PCI_STATUS.

Jan

