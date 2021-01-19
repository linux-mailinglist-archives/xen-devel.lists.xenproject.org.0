Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F122FBD76
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 18:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70982.127036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1uit-0006PO-3K; Tue, 19 Jan 2021 17:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70982.127036; Tue, 19 Jan 2021 17:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1uit-0006Oz-08; Tue, 19 Jan 2021 17:23:19 +0000
Received: by outflank-mailman (input) for mailman id 70982;
 Tue, 19 Jan 2021 17:23:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNnx=GW=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1l1uir-0006Ou-2R
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 17:23:17 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 68f0e4cb-7b62-4c66-a5ef-e5100cad42f3;
 Tue, 19 Jan 2021 17:23:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-XKbPMslgMfWiL0sSQf3_nw-1; Tue, 19 Jan 2021 12:23:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB72801817;
 Tue, 19 Jan 2021 17:23:09 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01A6027C55;
 Tue, 19 Jan 2021 17:23:07 +0000 (UTC)
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
X-Inumbo-ID: 68f0e4cb-7b62-4c66-a5ef-e5100cad42f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611076994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4AgJaVSYbOzrYP4OWA69p+hsD1R3vUHkVCqHneAzhg=;
	b=GmkzSzpGPa/swdf0IbihTf3mx88w+GATs0S/AMMWHLeqwJq5hY+tf+kDWNJjMpBtTfScQm
	1tAWYi6OfZ4B1Lgp1F+WGibBG2TirETHAF3JpCB5uU0qAWeq+JkqvU3lm1XWlsuph6mBi4
	au7xqo5DetxjuarQMACmqbmCCCEy5aY=
X-MC-Unique: XKbPMslgMfWiL0sSQf3_nw-1
Subject: Re: [edk2-devel] [PATCH] OvmfPkg/XenPlatformPei: Use CPUID to get
 physical address width on Xen
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: julien@xen.org, Igor Druzhinin <igor.druzhinin@citrix.com>,
 xen-devel@lists.xenproject.org, jordan.l.justen@intel.com,
 ard.biesheuvel@arm.com
References: <1610509335-23314-1-git-send-email-igor.druzhinin@citrix.com>
 <2a806f26-04f7-a96b-522c-118ac94df8c0@xen.org>
 <0d7ad7aa-cfa9-5f2c-26e3-6b371737f6bc@redhat.com>
 <YAcARq/M7ouaD1c1@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <64eb1777-44cb-c360-2597-7e436cba1a74@redhat.com>
Date: Tue, 19 Jan 2021 18:23:06 +0100
MIME-Version: 1.0
In-Reply-To: <YAcARq/M7ouaD1c1@perard.uk.xensource.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/19/21 16:52, Anthony PERARD via groups.io wrote:
> On Tue, Jan 19, 2021 at 03:49:34PM +0100, Laszlo Ersek wrote:
>> On 01/19/21 10:37, Julien Grall wrote:
>>> Hi Igor,
>>>
>>> On 13/01/2021 03:42, Igor Druzhinin wrote:
>>>> We faced a problem with passing through a PCI device with 64GB BAR to
>>>> UEFI guest. The BAR is expectedly programmed into 64-bit PCI aperture at
>>>> 64G address which pushes physical address space to 37 bits. That is above
>>>> 36-bit width that OVMF exposes currently to a guest without tweaking
>>>> PcdPciMmio64Size knob.
>>>>
>>>> The reverse calculation using this knob was inhereted from QEMU-KVM
>>>> platform
>>>> code where it serves the purpose of finding max accessible physical
>>>> address without necessary trusting emulated CPUID physbits value (that
>>>> could
>>>> be different from host physbits). On Xen we expect to use CPUID policy
>>>> to level the data correctly to prevent situations with guest physbits >
>>>> host physbits e.g. across migrations.
>>>>
>>>> The next aspect raising concern - resource consumption for DXE IPL
>>>> page tables
>>>> and time required to map the whole address space in case of using CPUID
>>>> bits directly. That could be mitigated by enabling support for 1G pages
>>>> in DXE IPL configuration. 1G pages are available on most CPUs produced in
>>>> the last 10 years and those without don't have many phys bits.
>>>>
>>>> Remove all the redundant code now (including PcdPciMmio64.. handling
>>>> that's
>>>> not used on Xen anyway) and grab physbits directly from CPUID that should
>>>> be what baremetal UEFI systems do.
>>>>
>>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>
>>> Reviewed-by: Julien Grall <julien@xen.org>
>>
>> I'm going to hold this patch until Anthony responds in this thread as well:
> 
> This new patch is fine, I didn't notice that it was a replacement for
> the previous one.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

[lersek@redhat.com: fix up authorship from groups.io-mangled From line]
[lersek@redhat.com: wrap commit message at 74 characters]

Merged via <https://github.com/tianocore/edk2/pull/1369>, as commit
e68c2a22caae.

Thanks
Laszlo


