Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2CF1A9AD8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 12:38:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfRE-0003XK-04; Wed, 15 Apr 2020 10:38:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOfRD-0003XF-4t
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 10:38:35 +0000
X-Inumbo-ID: 41ab44ae-7f05-11ea-8a2c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41ab44ae-7f05-11ea-8a2c-12813bfff9fa;
 Wed, 15 Apr 2020 10:38:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DBC5BAC8F;
 Wed, 15 Apr 2020 10:38:32 +0000 (UTC)
Subject: Re: [XEN PATCH v4] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
References: <4b6c017245698c18b063d156be645b8b633c0a99.1586884502.git.havanur@amazon.com>
 <81c7ca01-c272-9114-a5d0-12ca94090eb2@suse.com>
 <538d839fda5fc78c7519200e990d1888e56a6e06.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c21951c0-4e2f-6268-c17e-99beecd9deb7@suse.com>
Date: Wed, 15 Apr 2020 12:38:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <538d839fda5fc78c7519200e990d1888e56a6e06.camel@amazon.com>
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

On 15.04.2020 11:32, Shamsundara Havanur, Harsha wrote:
> On Wed, 2020-04-15 at 09:13 +0200, Jan Beulich wrote:
>> On 14.04.2020 19:15, Harsha Shamsundara Havanur wrote:
>>> @@ -526,10 +538,17 @@ void pci_setup(void)
>>>           * has IO enabled, even if there is no I/O BAR on that
>>>           * particular device.
>>>           */
>>> -        cmd = pci_readw(vga_devfn, PCI_COMMAND);
>>> -        cmd |= PCI_COMMAND_IO;
>>> -        pci_writew(vga_devfn, PCI_COMMAND, cmd);
>>> +        pci_devfn_decode_type[vga_devfn] |= PCI_COMMAND_IO;
>>>      }
>>> +
>>> +    /* Enable bus master, memory and I/O decode. */
>>> +    for ( devfn = 0; devfn < 256; devfn++ )
>>> +        if ( pci_devfn_decode_type[devfn] )
>>> +        {
>>> +            cmd = pci_readw(devfn, PCI_COMMAND);
>>> +            cmd |= (PCI_COMMAND_MASTER |
>>> pci_devfn_decode_type[devfn]);
>>> +            pci_writew(devfn, PCI_COMMAND, cmd);
>>> +        }
>>
>> This still regresses the setting of MASTER afaict: You only set
>> that bit now if either IO or MEMORY would also get set. But be
>> sure to honor the original code not doing the write when vendor/
>> device IDs are all ones.
>>
> If condition ensures that for devices with vendor/device IDs all ones
> are skipped as it would evaluate to false. But this would also skip
> enabling Bus master for devices whose vendor/device IDs are not all
> ones but IO or memory BARs are not programmed for them. Is there a
> possibility of this happening?

I think so, yes - programming of DMA requests can in principle also
be done via custom config space fields.

Jan

