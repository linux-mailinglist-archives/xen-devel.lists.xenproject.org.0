Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5488356818
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 11:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106556.203786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4Xi-0005NE-J6; Wed, 07 Apr 2021 09:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106556.203786; Wed, 07 Apr 2021 09:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4Xi-0005Mp-Fn; Wed, 07 Apr 2021 09:32:10 +0000
Received: by outflank-mailman (input) for mailman id 106556;
 Wed, 07 Apr 2021 09:32:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dICN=JE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lU4Xh-0005Mg-2U
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 09:32:09 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 37bbc8fd-9902-4255-95e6-8638e0cd23a5;
 Wed, 07 Apr 2021 09:32:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-KUh8AumMNCKWm_6fy27orw-1; Wed, 07 Apr 2021 05:32:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB711922963;
 Wed,  7 Apr 2021 09:32:03 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 316CE1C4;
 Wed,  7 Apr 2021 09:32:02 +0000 (UTC)
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
X-Inumbo-ID: 37bbc8fd-9902-4255-95e6-8638e0cd23a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617787927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5M66Ia+rkrQWgC1IGnVTn4Ksvf4Yr5bQtKaBdXnz9w=;
	b=gwxaw2wwcf7Tq6SAGqbm3r2ZWKRb6f6kEd8gJeh3XTgGOtmKR5H9fCfRRskD0ek3+3eMEr
	m8W/R9BDUS7uk/p+ZmECWjfXAewzX/hlmhjSmzMn/aXZGtrYgw2Em5rf38BB6tbHBU8TiS
	SPk0ZoqdEZyY1o2yc4x43qN+W8oMDNc=
X-MC-Unique: KUh8AumMNCKWm_6fy27orw-1
Subject: Re: [edk2-devel] [PATCH v2 0/7] OvmfXen: Set PcdFSBClock at runtime
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e7efbb51-f4af-83a4-5bb7-e9e983bc84ee@redhat.com>
Date: Wed, 7 Apr 2021 11:32:01 +0200
MIME-Version: 1.0
In-Reply-To: <20210325154713.670104-1-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/25/21 16:47, Anthony PERARD via groups.io wrote:
> Patch series available in this git branch:
> git://xenbits.xen.org/people/aperard/ovmf.git br.apic-timer-freq-v2
> 
> Changes in v2:
> - main change is to allow mapping of Xen pages outside of the RAM
>   see patch: "OvmfPkg/XenPlatformPei: Map extra physical address"
> - that new function allows to map the Xen shared info page (where we can find
>   information about tsc frequency) at the highest physical address allowed.

Before posting v3 (which I expect I'll merge), please submit a
github.com pull request as well, for your v3 topic branch. Such a PR
will never be merged, but it's good for kicking off CI (automated
builds) on your patches. If any one of the CI plugins fails on your
series, then you getting those results directly is better than me
encountering them first during an actual merge attempt.

For the above, I think you'll need to open a github.com account (in case
you don't have one yet). Running CI locally is possible, but it's so
much work (both setting up and executing) that I recommend just using a
github.com PR for CI's sake.

Thanks
Laszlo


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


