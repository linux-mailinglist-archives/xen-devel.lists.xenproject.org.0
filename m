Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FEB1A094C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 10:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLjZf-0003Sr-24; Tue, 07 Apr 2020 08:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLjZd-0003Sl-N5
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 08:27:09 +0000
X-Inumbo-ID: 9196f5a6-78a9-11ea-8084-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9196f5a6-78a9-11ea-8084-12813bfff9fa;
 Tue, 07 Apr 2020 08:27:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4CCFFAC77;
 Tue,  7 Apr 2020 08:27:06 +0000 (UTC)
Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: paul@xen.org
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
 <001501d60cb0$f60e0660$e22a1320$@xen.org>
 <20200407080651.GZ28601@Air-de-Roger>
 <001801d60cb4$9ed4c880$dc7e5980$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d37faf63-b8bf-17bf-006e-26a32d8f5e62@suse.com>
Date: Tue, 7 Apr 2020 10:27:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <001801d60cb4$9ed4c880$dc7e5980$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Harsha Shamsundara Havanur' <havanur@amazon.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 10:14, Paul Durrant wrote:
>> -----Original Message-----
>> From: Roger Pau Monné <roger.pau@citrix.com>
>> Sent: 07 April 2020 09:07
>> To: paul@xen.org
>> Cc: 'Harsha Shamsundara Havanur' <havanur@amazon.com>; xen-devel@lists.xenproject.org; 'Wei Liu'
>> <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>;
>> 'Jan Beulich' <jbeulich@suse.com>
>> Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all resource allocation
>>
>> On Tue, Apr 07, 2020 at 08:48:42AM +0100, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Harsha Shamsundara Havanur
>>>> Sent: 06 April 2020 18:47
>>>> To: xen-devel@lists.xenproject.org
>>>> Cc: Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
>>>> <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Harsha Shamsundara Havanur
>>>> <havanur@amazon.com>; Roger Pau Monné <roger.pau@citrix.com>
>>>> Subject: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all resource allocation
>>>>
>>>> It was observed that PCI MMIO and/or IO BARs were programmed with
>>>> BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
>>>> register) enabled, during PCI setup phase. This resulted in
>>>> spurious and premature bus transactions as soon as the lower bar of
>>>> the 64 bit bar is programmed. It is highly recommended that BARs be
>>>> programmed whilst decode bits are cleared to avoid spurious bus
>>>> transactions.
>>>>
>>>
>>> It's not so much spurious transactions that are the issue. I think "spurious and premature bus
>> transactions" should be replaced with "incorrect mappings being created".
>>>
>>> I believe the PCI spec says all three bits should be clear after reset anyway, and BAR programming
>> whilst decodes are enabled causes problems for emulators such as QEMU which need to create and destroy
>> mappings between the gaddr being programming into the virtual BAR and the maddr programmed into the
>> physical BAR.
>>> Specifically the case we see is that a 64-bit memory BAR is programmed by writing the lower half and
>> then the upper half. After the first write the BAR is mapped to an address under 4G that happens to
>> contain RAM, which is displaced by the mapping. After the second write the BAR is re-mapped to the
>> intended location but the RAM displaced by the other mapping is not restored. The OS then continues to
>> boot and function until at some point it happens to try to use that RAM at which point it suffers a
>> page fault and crashes. It was only by noticing that the faulting address lay within the transient BAR
>> mapping that we figured out what was happening.
>>
>> In order to fix this isn't it enough to just disable memory and IO
>> decodes, leaving bus mastering as it is?
>>
>> I assume there is (or was) some reason why bus master is enabled by
>> hvmloader in the first place?
>>
> 
> I admit it is a while since I went mining for the reason BME
> was being set but IIRC the commit that added the original code
> did not state why it was done.

I can second this observation, but this is not a reason to drop
the enabling again without suitable justification. If there are
babbling devices, perhaps they should be quirked rather than,
as you did suggest in reply to Andrew, ones which require it
enabled? (If such a requirement indeed exists, I assume they
would get handed to hvmloader with the bit already set, in
which case a middle ground may be to simply leave the bit
alone rather than force-enabling or force-disabling it. But
again the commit adding the enabling would stand against this,
because it likely was done for a reason even if that reason is
not stated in the commit.)

Jan

