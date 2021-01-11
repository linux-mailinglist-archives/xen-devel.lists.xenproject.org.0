Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8BD2F19D1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64993.114994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzEA-0005dB-PY; Mon, 11 Jan 2021 15:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64993.114994; Mon, 11 Jan 2021 15:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzEA-0005cm-MC; Mon, 11 Jan 2021 15:35:30 +0000
Received: by outflank-mailman (input) for mailman id 64993;
 Mon, 11 Jan 2021 15:35:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BX5B=GO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1kyzE9-0005ch-4B
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:35:29 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3f82ba42-1646-422b-aa4e-ddcc37ad5ed1;
 Mon, 11 Jan 2021 15:35:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-LxbPFNv1NquFf58faDfsbQ-1; Mon, 11 Jan 2021 10:35:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46371804860;
 Mon, 11 Jan 2021 15:35:20 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-114.ams2.redhat.com
 [10.36.112.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2731C50DDE;
 Mon, 11 Jan 2021 15:35:18 +0000 (UTC)
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
X-Inumbo-ID: 3f82ba42-1646-422b-aa4e-ddcc37ad5ed1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610379328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nFpsqHEoUayCaobTC5ddDXERh/Iau/4maUKJji8ZdaI=;
	b=CaZPtRqQcJ9Y8agNSccFJQpXAZJqd0InHM0HHnUz05W3JyLQI/iqC3zglDFsEyZlxWAGRm
	D23vdmjsId6zEvIwX7qCKVV5ixx3y01Hj7VcMYMiCurv7nNN0avs3Zhxj5DaoIoqZXzbzB
	mnm6P03NX8tmv+9QXW8N8ko4O7JTyI0=
X-MC-Unique: LxbPFNv1NquFf58faDfsbQ-1
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
 <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
 <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
 <ef643d22-c547-5ed0-1d2b-b3b1beeab359@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <037dc60b-6fae-a50e-de37-b47718b21321@redhat.com>
Date: Mon, 11 Jan 2021 16:35:18 +0100
MIME-Version: 1.0
In-Reply-To: <ef643d22-c547-5ed0-1d2b-b3b1beeab359@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/21 16:26, Igor Druzhinin wrote:
> On 11/01/2021 15:21, Jan Beulich wrote:
>> On 11.01.2021 15:49, Laszlo Ersek wrote:
>>> On 01/11/21 15:00, Igor Druzhinin wrote:
>>>> On 11/01/2021 09:27, Jan Beulich wrote:
>>>>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>>>>> We faced a problem with passing through a PCI device with 64GB BAR to
>>>>>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>>>>>> 64G address which pushes physical address space to 37 bits. OVMF uses
>>>>>> address width early in PEI phase to make DXE identity pages covering
>>>>>> the whole addressable space so it needs to know the last address it needs
>>>>>> to cover but at the same time not overdo the mappings.
>>>>>>
>>>>>> As there is seemingly no other way to pass or get this information in
>>>>>> OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
>>>>>> xenstore is not yet initialized) - extend the info structure with a new
>>>>>> table. Since the structure was initially created to be extendable -
>>>>>> the change is backward compatible.
>>>>>
>>>>> How does UEFI handle the same situation on baremetal? I'd guess it is
>>>>> in even more trouble there, as it couldn't even read addresses from
>>>>> BARs, but would first need to assign them (or at least calculate
>>>>> their intended positions).
>>>>
>>>> Maybe Laszlo or Anthony could answer this question quickly while I'm investigating?
>>>
>>> On the bare metal, the phys address width of the processor is known.
>>
>> From CPUID I suppose.
>>
>>> OVMF does the whole calculation in reverse because there's no way for it
>>> to know the physical address width of the physical (= host) CPU.
>>> "Overdoing" the mappings doesn't only waste resources, it breaks hard
>>> with EPT -- access to a GPA that is inexpressible with the phys address
>>> width of the host CPU (= not mappable successfully with the nested page
>>> tables) will behave super bad. I don't recall the exact symptoms, but it
>>> prevents booting the guest OS.
>>>
>>> This is why the most conservative 36-bit width is assumed by default.
>>
>> IOW you don't trust virtualized CPUID output?
> 
> I'm discussing this with Andrew and it appears we're certainly more lax in
> wiring physical address width into the guest from hardware directly rather
> than KVM.
> 
> Another problem that I faced while experimenting is that creating page
> tables for 46-bits (that CPUID returned in my case) of address space takes
> about a minute on a modern CPU.

Even if you enable 1GiB pages?

(In the libvirt domain XML, it's expressed as

    <feature policy='require' name='pdpe1gb'/>
)

... I'm not doubtful, just curious. I guess that, when the physical
address width is so large, a physical UEFI platform firmware will limit
itself to a lesser width -- it could even offer some knobs in the setup TUI.

Thanks,
Laszlo

Laszlo


