Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489742F1AFD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 17:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65035.115081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz06w-0003cV-P6; Mon, 11 Jan 2021 16:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65035.115081; Mon, 11 Jan 2021 16:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz06w-0003c6-M3; Mon, 11 Jan 2021 16:32:06 +0000
Received: by outflank-mailman (input) for mailman id 65035;
 Mon, 11 Jan 2021 16:32:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kz06v-0003c1-05
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 16:32:05 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c14bf92-fb6b-4398-b944-f741287fdae7;
 Mon, 11 Jan 2021 16:32:03 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2c14bf92-fb6b-4398-b944-f741287fdae7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610382723;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Z3aj4X9IPH42MHxSuQ0uFD4gYi2A34wFwUWetqzUkzw=;
  b=AHl9mZatecXYgPmVJ90JCrAGTrECItavFbknmNUagl6OE2uDvImXljqQ
   2hLt0rqpIN6KrX3bD9YsZA+mqFmok1vaqofz9WSNGcsrhXkNUI5Jc5KA5
   G4OX6Z0UMbsHnR0fvY9KQBQLktYoJ9r7uultN94SF/ozmCgmFb8XK0gtU
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LChMDhNOb1/vo38fYOjvLl9hAt5lB65rMoDuYCmcVwaQ32VfprB8pXij1khCvNd3EkiydshwfC
 iR6McBPBPyvw0buHWDuZnzMpT4YDaeIyrkmFext35bpOaSwGHxiXhAVst2qArSMCErFgu1fzR0
 BU8Vu8c5QwrRuKHYB3jPld+r50VVuNwR7LI2IVuG+JlzjjflHhJ0WMSuvLDLMg5qQZ33cQZIGJ
 1rSyYiRBVpUlBN4ZK4hWtc1Mzj19mwW/X05DWSyFTRqgnCUi7R1AkGqIdN6EX0mcZ/eIm2ewHr
 +0o=
X-SBRS: 5.2
X-MesageID: 34831517
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34831517"
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Laszlo Ersek <lersek@redhat.com>, Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
 <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
 <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
 <ef643d22-c547-5ed0-1d2b-b3b1beeab359@citrix.com>
 <037dc60b-6fae-a50e-de37-b47718b21321@redhat.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <9993d339-7991-5bcc-6c2e-a699ed0d6330@citrix.com>
Date: Mon, 11 Jan 2021 16:31:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <037dc60b-6fae-a50e-de37-b47718b21321@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/01/2021 15:35, Laszlo Ersek wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 01/11/21 16:26, Igor Druzhinin wrote:
>> On 11/01/2021 15:21, Jan Beulich wrote:
>>> On 11.01.2021 15:49, Laszlo Ersek wrote:
>>>> On 01/11/21 15:00, Igor Druzhinin wrote:
>>>>> On 11/01/2021 09:27, Jan Beulich wrote:
>>>>>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>>>>>> We faced a problem with passing through a PCI device with 64GB BAR to
>>>>>>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>>>>>>> 64G address which pushes physical address space to 37 bits. OVMF uses
>>>>>>> address width early in PEI phase to make DXE identity pages covering
>>>>>>> the whole addressable space so it needs to know the last address it needs
>>>>>>> to cover but at the same time not overdo the mappings.
>>>>>>>
>>>>>>> As there is seemingly no other way to pass or get this information in
>>>>>>> OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
>>>>>>> xenstore is not yet initialized) - extend the info structure with a new
>>>>>>> table. Since the structure was initially created to be extendable -
>>>>>>> the change is backward compatible.
>>>>>>
>>>>>> How does UEFI handle the same situation on baremetal? I'd guess it is
>>>>>> in even more trouble there, as it couldn't even read addresses from
>>>>>> BARs, but would first need to assign them (or at least calculate
>>>>>> their intended positions).
>>>>>
>>>>> Maybe Laszlo or Anthony could answer this question quickly while I'm investigating?
>>>>
>>>> On the bare metal, the phys address width of the processor is known.
>>>
>>> From CPUID I suppose.
>>>
>>>> OVMF does the whole calculation in reverse because there's no way for it
>>>> to know the physical address width of the physical (= host) CPU.
>>>> "Overdoing" the mappings doesn't only waste resources, it breaks hard
>>>> with EPT -- access to a GPA that is inexpressible with the phys address
>>>> width of the host CPU (= not mappable successfully with the nested page
>>>> tables) will behave super bad. I don't recall the exact symptoms, but it
>>>> prevents booting the guest OS.
>>>>
>>>> This is why the most conservative 36-bit width is assumed by default.
>>>
>>> IOW you don't trust virtualized CPUID output?
>>
>> I'm discussing this with Andrew and it appears we're certainly more lax in
>> wiring physical address width into the guest from hardware directly rather
>> than KVM.
>>
>> Another problem that I faced while experimenting is that creating page
>> tables for 46-bits (that CPUID returned in my case) of address space takes
>> about a minute on a modern CPU.
> 
> Even if you enable 1GiB pages?
> 
> (In the libvirt domain XML, it's expressed as
> 
>     <feature policy='require' name='pdpe1gb'/>
> )
> 
> ... I'm not doubtful, just curious. I guess that, when the physical
> address width is so large, a physical UEFI platform firmware will limit
> itself to a lesser width -- it could even offer some knobs in the setup TUI.

So it wasn't the feature bit that we expose by default in Xen but the OVMF configuration
with 1G pages disabled for that use. I enabled it and got booting even with 46-bits
in reasonable time now.

Given we're not that sensitive in Xen to physical address being different and prefer to
control that on different level I'd like to abandon that ABI change approach (does anyone
have any objections?) and instead take physical address width directly from CPUID which
we do in hvmloader already. The change would be local to Xen platform.

Igor

