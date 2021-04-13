Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0D35DE4C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 14:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109724.209437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWHsN-0003Al-3v; Tue, 13 Apr 2021 12:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109724.209437; Tue, 13 Apr 2021 12:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWHsN-0003AM-0Y; Tue, 13 Apr 2021 12:10:39 +0000
Received: by outflank-mailman (input) for mailman id 109724;
 Tue, 13 Apr 2021 12:10:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBYq=JK=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lWHsL-0003AH-2p
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 12:10:37 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c17f714b-f563-4446-b349-34b10293e6b8;
 Tue, 13 Apr 2021 12:10:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-gktbzRgxOYa8En4hLtKCwg-1; Tue, 13 Apr 2021 08:10:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 947666D4F0;
 Tue, 13 Apr 2021 12:10:28 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-199.ams2.redhat.com
 [10.36.115.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC8232BFE1;
 Tue, 13 Apr 2021 12:10:26 +0000 (UTC)
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
X-Inumbo-ID: c17f714b-f563-4446-b349-34b10293e6b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618315835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TR1x+oyL5xq0zAQdG3dkRiMJil3sPR8Z4Vx4UGDPOJw=;
	b=IQitdEj1X0mGKXSPjdMWVRMaxmMd1myHTGtgGD1Sx4znFIK15pgJmin9qCb5N9ALKye5+y
	2wJkz2qoir2ByfwJh1p3cIuvCxA+rr3+I/y6XCx1ExG1aCIT9Az4nsHKu/jjsgyu45J6Zb
	AvbYdTe6uTElZszzQZlnrBNVzqGpPFM=
X-MC-Unique: gktbzRgxOYa8En4hLtKCwg-1
Subject: Re: [edk2-devel] [PATCH v3 0/7] OvmfXen: Set PcdFSBClock at runtime
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20210412133003.146438-1-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <36175704-977a-ddf5-24ac-fe51be39a51c@redhat.com>
Date: Tue, 13 Apr 2021 14:10:25 +0200
MIME-Version: 1.0
In-Reply-To: <20210412133003.146438-1-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/12/21 15:29, Anthony PERARD via groups.io wrote:
> Patch series available in this git branch:
> git://xenbits.xen.org/people/aperard/ovmf.git br.apic-timer-freq-v3
> 
> Changes in v3:
> - typos and codying style

Merged in commit range 16136f218d54..71cdb91f3133, via <https://github.com/tianocore/edk2/pull/1560>, with the following updates:

1:  cc0477d6a5d6 = 1:  29280c7084ee OvmfPkg/XenResetVector: Silent a warning from nasm
2:  4459ca235222 ! 2:  44ad51d6b19a MdePkg: Allow PcdFSBClock to by Dynamic
    @@ -8,8 +8,8 @@
         Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
         Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
         Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    -    Reviewed-by: Liming Gao <liming.gao@intel.com>
         Message-Id: <20210412133003.146438-3-anthony.perard@citrix.com>
    +    Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
     
     diff --git a/MdePkg/MdePkg.dec b/MdePkg/MdePkg.dec
     --- a/MdePkg/MdePkg.dec
3:  d2b81d656c53 = 3:  896e68984118 OvmfPkg/IndustryStandard/Xen: Apply EDK2 coding style to XEN_VCPU_TIME_INFO
4:  e2bbc17dc92b ! 4:  9d6861494aaa OvmfPkg/IndustryStandard: Introduce PageTable.h
    @@ -10,6 +10,7 @@
         Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
         Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
         Message-Id: <20210412133003.146438-5-anthony.perard@citrix.com>
    +    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
     
     diff --git a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h b/OvmfPkg/Include/IndustryStandard/PageTable.h
     similarity index 60%
5:  158053f2ea02 = 5:  51e0bd28bba9 OvmfPkg/XenPlatformPei: Map extra physical address
6:  a37eba1a4ef4 = 6:  c75c6405128e OvmfPkg/XenPlatformPei: Calibrate APIC timer frequency
7:  7dfd174c2dc6 ! 7:  71cdb91f3133 OvmfPkg/OvmfXen: Set PcdFSBClock
    @@ -31,6 +31,7 @@
         Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
         Reviewed-by: Laszlo Ersek <lersek@redhat.com>
         Message-Id: <20210412133003.146438-8-anthony.perard@citrix.com>
    +    [lersek@redhat.com: cast Freq to UINT32 for PcdSet32S(), not for ASSERT()]
     
     diff --git a/OvmfPkg/OvmfXen.dsc b/OvmfPkg/OvmfXen.dsc
     --- a/OvmfPkg/OvmfXen.dsc
    @@ -73,8 +74,8 @@
        Freq = DivU64x64Remainder (Dividend, TscTick2 - TscTick, NULL);
        DEBUG ((DEBUG_INFO, "APIC Freq % 8lu Hz\n", Freq));
      
    -+  ASSERT ((UINT32)Freq <= MAX_UINT32);
    -+  Status = PcdSet32S (PcdFSBClock, Freq);
    ++  ASSERT (Freq <= MAX_UINT32);
    ++  Status = PcdSet32S (PcdFSBClock, (UINT32)Freq);
     +  ASSERT_EFI_ERROR (Status);
     +
        UnmapXenPage (SharedInfo);

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


