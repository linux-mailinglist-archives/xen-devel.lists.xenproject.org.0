Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2A2F19A8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64981.114968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz9M-0005Ht-U3; Mon, 11 Jan 2021 15:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64981.114968; Mon, 11 Jan 2021 15:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz9M-0005HU-R0; Mon, 11 Jan 2021 15:30:32 +0000
Received: by outflank-mailman (input) for mailman id 64981;
 Mon, 11 Jan 2021 15:30:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BX5B=GO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1kyz9L-0005HJ-UH
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:30:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 51d378b6-c9eb-43f1-904d-f3d14478c401;
 Mon, 11 Jan 2021 15:30:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-rKuPxOR8OTWhPxZvh-4K4Q-1; Mon, 11 Jan 2021 10:30:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2CF0107ACF8;
 Mon, 11 Jan 2021 15:30:25 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-114.ams2.redhat.com
 [10.36.112.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B476E5C1BB;
 Mon, 11 Jan 2021 15:30:23 +0000 (UTC)
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
X-Inumbo-ID: 51d378b6-c9eb-43f1-904d-f3d14478c401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610379031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kv834PrhhD0okv0b+tQcDOD1Tlxp1VLNMhbsgSxeJiY=;
	b=PHWRPEtz/tG6OFox50Yy7IKKjo1H7bwzyN5tviIoVlWFZUvSIWjeL5gM79mLgmG+9V2UBH
	/fJtR05mdd1bx/MFI9HZIYac5p1WiHb1aPnn78DDFYSE/cdrOBA1So1UKbDsZNFBYnW7X1
	Ta+uhXdvHy4NSoG8j73VtNS3WZIn6KA=
X-MC-Unique: rKuPxOR8OTWhPxZvh-4K4Q-1
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
 <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
 <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <398ae5fe-577c-4c91-2515-89fd5ab0bf99@redhat.com>
Date: Mon, 11 Jan 2021 16:30:22 +0100
MIME-Version: 1.0
In-Reply-To: <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/21 16:21, Jan Beulich wrote:
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

That's correct; it's not trustworthy / reliable.

One of the discussions (of the many) is here:

https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg04716.html

Thanks
Laszlo


