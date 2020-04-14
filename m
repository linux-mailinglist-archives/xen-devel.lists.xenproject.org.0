Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBDE1A775B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:29:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOHsU-0008Lq-PY; Tue, 14 Apr 2020 09:29:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOHsT-0008Ll-AP
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:29:09 +0000
X-Inumbo-ID: 63cbfa84-7e32-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63cbfa84-7e32-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 09:29:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4EC51AEFD;
 Tue, 14 Apr 2020 09:29:06 +0000 (UTC)
Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
 <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
 <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
 <a102ec836a00714678fb3aa46787f597c9044f29.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfe18a03-854d-8b91-b333-ae2cefe3e1c8@suse.com>
Date: Tue, 14 Apr 2020 11:29:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a102ec836a00714678fb3aa46787f597c9044f29.camel@amazon.com>
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

On 14.04.2020 11:22, Shamsundara Havanur, Harsha wrote:
> On Tue, 2020-04-14 at 11:14 +0200, Jan Beulich wrote:
>> CAUTION: This email originated from outside of the organization. Do
>> not click links or open attachments unless you can confirm the sender
>> and know the content is safe.
>>
>>
>>
>> On 14.04.2020 11:00, Shamsundara Havanur, Harsha wrote:
>>> On Tue, 2020-04-14 at 09:42 +0200, Jan Beulich wrote:
>>>> On 13.04.2020 23:33, Harsha Shamsundara Havanur wrote:
>>>>> @@ -289,9 +293,22 @@ void pci_setup(void)
>>>>>                     devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
>>>>>          }
>>>>>
>>>>> -        /* Enable bus mastering. */
>>>>> +        /*
>>>>> +         * Disable bus mastering, memory and I/O space, which
>>>>> is
>>>>> typical device
>>>>> +         * reset state. It is recommended that BAR programming
>>>>> be
>>>>> done whilst
>>>>> +         * decode bits are cleared to avoid incorrect mappings
>>>>> being created,
>>>>> +         * when 64-bit memory BAR is programmed first by
>>>>> writing
>>>>> the lower half
>>>>> +         * and then the upper half, which first maps to an
>>>>> address
>>>>> under 4G
>>>>> +         * replacing any RAM mapped in that address, which is
>>>>> not
>>>>> restored
>>>>> +         * back after the upper half is written and PCI memory
>>>>> is
>>>>> correctly
>>>>> +         * mapped to its intended high mem address.
>>>>> +         *
>>>>> +         * Capture the state of bus master to restore it back
>>>>> once
>>>>> BAR
>>>>> +         * programming is completed.
>>>>> +         */
>>>>>          cmd = pci_readw(devfn, PCI_COMMAND);
>>>>> -        cmd |= PCI_COMMAND_MASTER;
>>>>> +        pci_devfn_decode_type[devfn] = cmd &
>>>>> ~(PCI_COMMAND_MEMORY
>>>>>> PCI_COMMAND_IO);
>>>>>
>>>>> +        cmd &= ~(PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY |
>>>>> PCI_COMMAND_IO);
>>>>
>>>> The disabling of MASTER was put under question in v1 already.
>>>
>>> Disabling of MASTER is done whilst programming BARs and it is
>>> restored
>>> back to its previous value in the loop at the end of pci_setup
>>> function.
>>
>> Yet didn't Andrew indicate he knows of devices which get upset if
>> MASTER _ever_ gets cleared?
> 
> Previous commit enabled MASTER for all functions. I am bit confused
> here on the consensus on enabling/disabling/retaining BME.
> Should we even care about MASTER?

With the commit introducing its universal setting, I'm afraid to
avoid regressions we can't sensibly alter the behavior unless it
can be explained clearly why the original change must have been
outright wrong.

Jan

