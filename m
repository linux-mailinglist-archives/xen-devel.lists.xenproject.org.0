Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765762F1983
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64956.114922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz0L-0003uD-4t; Mon, 11 Jan 2021 15:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64956.114922; Mon, 11 Jan 2021 15:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyz0L-0003tn-1Y; Mon, 11 Jan 2021 15:21:13 +0000
Received: by outflank-mailman (input) for mailman id 64956;
 Mon, 11 Jan 2021 15:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyz0J-0003tS-Iu
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:21:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f0683d8-72de-4646-9df8-79ff426438e7;
 Mon, 11 Jan 2021 15:21:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E76FAB7A;
 Mon, 11 Jan 2021 15:21:09 +0000 (UTC)
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
X-Inumbo-ID: 9f0683d8-72de-4646-9df8-79ff426438e7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610378469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiTouGOI4Hcfhh1Fi5gzm+6cCWiXp5e/O9CJgyTYhh8=;
	b=HVqtEl1vjgynM8DQteT5s8WjenVwutBQUjEooxKOfhLR7bNBTmcryW6s7R94pLMKwhjdX9
	G9ZtDnmA5PHRKgiBVBjXb4eE7bDRCBa2bRgKq16pW6btu27n2r1Xf90pqnOX9v7xUOWfA9
	c7rK1cdWbvSRO9voFFerq2ml/CIzC78=
Subject: Re: [PATCH] hvmloader: pass PCI MMIO layout to OVMF as an info table
To: Laszlo Ersek <lersek@redhat.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1610340812-24397-1-git-send-email-igor.druzhinin@citrix.com>
 <b2ac8d2c-2c63-67e1-6b2b-14afefb2090a@suse.com>
 <dd7c459e-43ff-7601-956f-180a1f7c31ff@citrix.com>
 <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aacd5a3b-228d-c93f-31ca-34f29f1ec6e8@suse.com>
Date: Mon, 11 Jan 2021 16:21:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20b1fe43-370b-9afc-6938-379480908578@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 15:49, Laszlo Ersek wrote:
> On 01/11/21 15:00, Igor Druzhinin wrote:
>> On 11/01/2021 09:27, Jan Beulich wrote:
>>> On 11.01.2021 05:53, Igor Druzhinin wrote:
>>>> We faced a problem with passing through a PCI device with 64GB BAR to
>>>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>>>> 64G address which pushes physical address space to 37 bits. OVMF uses
>>>> address width early in PEI phase to make DXE identity pages covering
>>>> the whole addressable space so it needs to know the last address it needs
>>>> to cover but at the same time not overdo the mappings.
>>>>
>>>> As there is seemingly no other way to pass or get this information in
>>>> OVMF at this early phase (ACPI is not yet available, PCI is not yet enumerated,
>>>> xenstore is not yet initialized) - extend the info structure with a new
>>>> table. Since the structure was initially created to be extendable -
>>>> the change is backward compatible.
>>>
>>> How does UEFI handle the same situation on baremetal? I'd guess it is
>>> in even more trouble there, as it couldn't even read addresses from
>>> BARs, but would first need to assign them (or at least calculate
>>> their intended positions).
>>
>> Maybe Laszlo or Anthony could answer this question quickly while I'm investigating?
> 
> On the bare metal, the phys address width of the processor is known.

From CPUID I suppose.

> OVMF does the whole calculation in reverse because there's no way for it
> to know the physical address width of the physical (= host) CPU.
> "Overdoing" the mappings doesn't only waste resources, it breaks hard
> with EPT -- access to a GPA that is inexpressible with the phys address
> width of the host CPU (= not mappable successfully with the nested page
> tables) will behave super bad. I don't recall the exact symptoms, but it
> prevents booting the guest OS.
> 
> This is why the most conservative 36-bit width is assumed by default.

IOW you don't trust virtualized CPUID output?

Jan

