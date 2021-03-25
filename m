Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE6349970
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 19:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101515.194270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPUdd-0001oe-GY; Thu, 25 Mar 2021 18:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101515.194270; Thu, 25 Mar 2021 18:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPUdd-0001oF-DN; Thu, 25 Mar 2021 18:23:21 +0000
Received: by outflank-mailman (input) for mailman id 101515;
 Thu, 25 Mar 2021 18:23:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tqer=IX=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lPUdc-0001oA-2Z
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 18:23:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 723b6338-6627-45a1-9498-3eb9d2ea3e19;
 Thu, 25 Mar 2021 18:23:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-HqhYvH7cNryB9nYeNtIcww-1; Thu, 25 Mar 2021 14:23:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4638030DD;
 Thu, 25 Mar 2021 18:22:09 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53DFC1000358;
 Thu, 25 Mar 2021 18:22:08 +0000 (UTC)
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
X-Inumbo-ID: 723b6338-6627-45a1-9498-3eb9d2ea3e19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616696598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIcoE/aP9OWTquxuzaRGcRIdXcSeCOahwq33fGzKmI4=;
	b=JFaOU4IrTRQGEc4vcWJNkToA8ZcojViADHYruvX/sMF70sbUdfHgTvI/JjVEcBp3045ack
	QUOjh2drzi+HWicrgSFHGYlzVxFqSb84RUm8TpwYAu/uVjVPFUB6fsDJ9xepbiItK8mxLm
	KHXeIHbcjZbF6MQ7uVS2T0yCmrumoLU=
X-MC-Unique: HqhYvH7cNryB9nYeNtIcww-1
Subject: Re: [PATCH v2 0/7] OvmfXen: Set PcdFSBClock at runtime
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <21719b4f-0da5-f5f1-bafa-9d2a399bc87d@redhat.com>
Date: Thu, 25 Mar 2021 19:22:07 +0100
MIME-Version: 1.0
In-Reply-To: <20210325154713.670104-1-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/25/21 16:47, Anthony PERARD wrote:
> Patch series available in this git branch:
> git://xenbits.xen.org/people/aperard/ovmf.git br.apic-timer-freq-v2

I'll get to this sometime in April, possibly after the SEV-SNP series.
That shouldn't discourage others from reviewing sooner, of course.

Thanks
Laszlo

> 
> Changes in v2:
> - main change is to allow mapping of Xen pages outside of the RAM
>   see patch: "OvmfPkg/XenPlatformPei: Map extra physical address"
> - that new function allows to map the Xen shared info page (where we can find
>   information about tsc frequency) at the highest physical address allowed.
> 
> Hi,
> 
> OvmfXen uses the APIC timer, but with an hard-coded frequency that may change
> as pointed out here:
>   https://edk2.groups.io/g/devel/message/45185
>   <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
> 
> This series changes that so the frequency is calculated at runtime.
> 
> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
> 
> There is also one cleanup patch that has nothing to do with the rest.
> 
> Cheers,
> 
> Anthony PERARD (7):
>   OvmfPkg/XenResetVector: Silent a warning from nasm
>   MdePkg: Allow PcdFSBClock to by Dynamic
>   OvmfPkg/IndustryStandard/Xen: Apply EDK2 coding style to
>     XEN_VCPU_TIME_INFO
>   OvmfPkg/IndustryStandard: Introduce PageTable.h
>   OvmfPkg/XenPlatformPei: Map extra physical address
>   OvmfPkg/XenPlatformPei: Calibrate APIC timer frequency
>   OvmfPkg/OvmfXen: Set PcdFSBClock
> 
>  MdePkg/MdePkg.dec                             |   8 +-
>  OvmfPkg/OvmfXen.dsc                           |   4 +-
>  OvmfPkg/XenPlatformPei/XenPlatformPei.inf     |   4 +
>  .../IndustryStandard/PageTable.h}             | 117 +-------
>  OvmfPkg/Include/IndustryStandard/Xen/xen.h    |  17 +-
>  .../BaseMemEncryptSevLib/X64/VirtualMemory.h  | 143 +---------
>  OvmfPkg/XenPlatformPei/Platform.h             |  10 +
>  OvmfPkg/XenPlatformPei/Platform.c             |   1 +
>  OvmfPkg/XenPlatformPei/Xen.c                  | 252 ++++++++++++++++++
>  OvmfPkg/XenResetVector/Ia32/XenPVHMain.asm    |   2 +-
>  10 files changed, 287 insertions(+), 271 deletions(-)
>  copy OvmfPkg/{Library/BaseMemEncryptSevLib/X64/VirtualMemory.h => Include/IndustryStandard/PageTable.h} (60%)
> 


