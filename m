Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476662F199D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64968.114934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz5j-0004CF-Ot; Mon, 11 Jan 2021 15:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64968.114934; Mon, 11 Jan 2021 15:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz5j-0004Bq-Lb; Mon, 11 Jan 2021 15:26:47 +0000
Received: by outflank-mailman (input) for mailman id 64968;
 Mon, 11 Jan 2021 15:26:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kyz5h-0004Bl-W7
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:26:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8926d3ae-714d-4988-ac03-a0b80eed9bf5;
 Mon, 11 Jan 2021 15:26:44 +0000 (UTC)
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
X-Inumbo-ID: 8926d3ae-714d-4988-ac03-a0b80eed9bf5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610378804;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=6ppwAdSPIsj8lcmwpaaqZDhulVB7njcWo8us4WtLNJ4=;
  b=FcMAQJ+4XBjVro/0kRGlNPOlh3b1uO6w2Od+SnwvJ5ucXiV8wEswr+mQ
   SwBnPOJLH6ouzj/AeOvzs7T6gEEcMgQihwqLJXFgFCkfznBRgSw8OEW+c
   yRXwOLJKIRkRxdD3uF0SjRgeVO/J5lvInF/KIr9L2IQRQQWvyFIOhSADf
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yWsQaJ4wndvxwpUqaZYmZLg/GVQ5UgrL/+k9twNgzNZC/VLDFmoCYImTi310LCbvhCuSSJ/JhX
 Fu3fRjaNquV3xE7Dyuc5+DivglJLytrVgVtWRG0yKY4Ahb3jmWesDLV73xMZ6Fk4JurV8AvDC7
 eZbnZPds+nYkweTh+szBGem7avgkB8dINKeh0kCSEsAC/Hyzq022Hp1MOo4KtDhwOHV/VIfqin
 4PjKA9tT9USzTYblu9NWPgDKIHGeDDHf9ZArFJfLslx5ZXLCmQvYDf7CdC75kai+BIqA3TQxVh
 A68=
X-SBRS: 5.2
X-MesageID: 35202085
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="35202085"
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Jan Beulich <jbeulich@suse.com>, Laszlo Ersek <lersek@redhat.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
 <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
 <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ef643d22-c547-5ed0-1d2b-b3b1beeab359@citrix.com>
Date: Mon, 11 Jan 2021 15:26:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/01/2021 15:21, Jan Beulich wrote:
> On 11.01.2021 15:49, Laszlo Ersek wrote:
>> On 01/11/21 15:00, Igor Druzhinin wrote:
>>> On 11/01/2021 09:27, Jan Beulich wrote:
>>>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>>>> We faced a problem with passing through a PCI device with 64GB BAR to
>>>>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>>>>> 64G address which pushes physical address space to 37 bits. OVMF uses
>>>>> address width early in PEI phase to make DXE identity pages covering
>>>>> the whole addressable space so it needs to know the last address it needs
>>>>> to cover but at the same time not overdo the mappings.
>>>>>
>>>>> As there is seemingly no other way to pass or get this information in
>>>>> OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
>>>>> xenstore is not yet initialized) - extend the info structure with a new
>>>>> table. Since the structure was initially created to be extendable -
>>>>> the change is backward compatible.
>>>>
>>>> How does UEFI handle the same situation on baremetal? I'd guess it is
>>>> in even more trouble there, as it couldn't even read addresses from
>>>> BARs, but would first need to assign them (or at least calculate
>>>> their intended positions).
>>>
>>> Maybe Laszlo or Anthony could answer this question quickly while I'm investigating?
>>
>> On the bare metal, the phys address width of the processor is known.
> 
> From CPUID I suppose.
> 
>> OVMF does the whole calculation in reverse because there's no way for it
>> to know the physical address width of the physical (= host) CPU.
>> "Overdoing" the mappings doesn't only waste resources, it breaks hard
>> with EPT -- access to a GPA that is inexpressible with the phys address
>> width of the host CPU (= not mappable successfully with the nested page
>> tables) will behave super bad. I don't recall the exact symptoms, but it
>> prevents booting the guest OS.
>>
>> This is why the most conservative 36-bit width is assumed by default.
> 
> IOW you don't trust virtualized CPUID output?

I'm discussing this with Andrew and it appears we're certainly more lax in
wiring physical address width into the guest from hardware directly rather
than KVM.

Another problem that I faced while experimenting is that creating page
tables for 46-bits (that CPUID returned in my case) of address space takes
about a minute on a modern CPU.

Igor

