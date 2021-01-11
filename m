Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D22F1B05
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 17:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65039.115093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0AX-0003mL-AB; Mon, 11 Jan 2021 16:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65039.115093; Mon, 11 Jan 2021 16:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0AX-0003lw-6R; Mon, 11 Jan 2021 16:35:49 +0000
Received: by outflank-mailman (input) for mailman id 65039;
 Mon, 11 Jan 2021 16:35:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BX5B=GO=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1kz0AV-0003lq-Qv
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 16:35:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1459fcab-f2b6-4bfa-a184-d36d55d61395;
 Mon, 11 Jan 2021 16:35:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-TuqOl9_fMz-v0b3pJm5j0Q-1; Mon, 11 Jan 2021 11:35:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 077C391139;
 Mon, 11 Jan 2021 16:35:27 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-114.ams2.redhat.com
 [10.36.112.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E95C660854;
 Mon, 11 Jan 2021 16:35:24 +0000 (UTC)
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
X-Inumbo-ID: 1459fcab-f2b6-4bfa-a184-d36d55d61395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610382945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXiK9qUFAUOUFIkjmxPhDhpQvNSAVciXf5iV2+fd/4g=;
	b=jEFcXUTd56zaWl5FrzLhdNLO1mFTmFj/yjNPZw5L4t6gLSPad88r2YbrzPQkgoMs2kkvfn
	J9mdyJZH5qym+r0Pd7KYWAnw8HcEaKS/dPUTB+Ym00JhVcbi2y6hdQnUhkPy2QDBElIvVh
	cq2bCdMrkMMqn6CV+CTMkbtmTOZts7E=
X-MC-Unique: TuqOl9_fMz-v0b3pJm5j0Q-1
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
 <037dc60b-6fae-a50e-de37-b47718b21321@redhat.com>
 <9993d339-7991-5bcc-6c2e-a699ed0d6330@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <683f8f38-5926-2860-30a9-074e4d5ed271@redhat.com>
Date: Mon, 11 Jan 2021 17:35:23 +0100
MIME-Version: 1.0
In-Reply-To: <9993d339-7991-5bcc-6c2e-a699ed0d6330@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/21 17:31, Igor Druzhinin wrote:
> On 11/01/2021 15:35, Laszlo Ersek wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 01/11/21 16:26, Igor Druzhinin wrote:
>>> On 11/01/2021 15:21, Jan Beulich wrote:
>>>> On 11.01.2021 15:49, Laszlo Ersek wrote:
>>>>> On 01/11/21 15:00, Igor Druzhinin wrote:
>>>>>> On 11/01/2021 09:27, Jan Beulich wrote:
>>>>>>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>>>>>>> We faced a problem with passing through a PCI device with 64GB BAR to
>>>>>>>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>>>>>>>> 64G address which pushes physical address space to 37 bits. OVMF uses
>>>>>>>> address width early in PEI phase to make DXE identity pages covering
>>>>>>>> the whole addressable space so it needs to know the last address it needs
>>>>>>>> to cover but at the same time not overdo the mappings.
>>>>>>>>
>>>>>>>> As there is seemingly no other way to pass or get this information in
>>>>>>>> OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
>>>>>>>> xenstore is not yet initialized) - extend the info structure with a new
>>>>>>>> table. Since the structure was initially created to be extendable -
>>>>>>>> the change is backward compatible.
>>>>>>>
>>>>>>> How does UEFI handle the same situation on baremetal? I'd guess it is
>>>>>>> in even more trouble there, as it couldn't even read addresses from
>>>>>>> BARs, but would first need to assign them (or at least calculate
>>>>>>> their intended positions).
>>>>>>
>>>>>> Maybe Laszlo or Anthony could answer this question quickly while I'm investigating?
>>>>>
>>>>> On the bare metal, the phys address width of the processor is known.
>>>>
>>>> From CPUID I suppose.
>>>>
>>>>> OVMF does the whole calculation in reverse because there's no way for it
>>>>> to know the physical address width of the physical (= host) CPU.
>>>>> "Overdoing" the mappings doesn't only waste resources, it breaks hard
>>>>> with EPT -- access to a GPA that is inexpressible with the phys address
>>>>> width of the host CPU (= not mappable successfully with the nested page
>>>>> tables) will behave super bad. I don't recall the exact symptoms, but it
>>>>> prevents booting the guest OS.
>>>>>
>>>>> This is why the most conservative 36-bit width is assumed by default.
>>>>
>>>> IOW you don't trust virtualized CPUID output?
>>>
>>> I'm discussing this with Andrew and it appears we're certainly more lax in
>>> wiring physical address width into the guest from hardware directly rather
>>> than KVM.
>>>
>>> Another problem that I faced while experimenting is that creating page
>>> tables for 46-bits (that CPUID returned in my case) of address space takes
>>> about a minute on a modern CPU.
>>
>> Even if you enable 1GiB pages?
>>
>> (In the libvirt domain XML, it's expressed as
>>
>>     <feature policy='require' name='pdpe1gb'/>
>> )
>>
>> ... I'm not doubtful, just curious. I guess that, when the physical
>> address width is so large, a physical UEFI platform firmware will limit
>> itself to a lesser width -- it could even offer some knobs in the setup TUI.
> 
> So it wasn't the feature bit that we expose by default in Xen but the OVMF configuration
> with 1G pages disabled for that use. I enabled it and got booting even with 46-bits
> in reasonable time now.
> 
> Given we're not that sensitive in Xen to physical address being different and prefer to
> control that on different level I'd like to abandon that ABI change approach (does anyone
> have any objections?) and instead take physical address width directly from CPUID which
> we do in hvmloader already. The change would be local to Xen platform.

Yes, as long as you limit the approach to "OvmfPkg/XenPlatformPei" (or,
more generally, to the "OvmfPkg/OvmfXen.dsc" platform), it makes perfect
sense.

Thanks!
Laszlo


