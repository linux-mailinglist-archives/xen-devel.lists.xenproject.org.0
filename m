Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835393565F1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106457.203569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU380-0003qK-7e; Wed, 07 Apr 2021 08:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106457.203569; Wed, 07 Apr 2021 08:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU380-0003pv-4T; Wed, 07 Apr 2021 08:01:32 +0000
Received: by outflank-mailman (input) for mailman id 106457;
 Wed, 07 Apr 2021 08:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dICN=JE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lU37z-0003pq-By
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:01:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 437b472c-6800-4fed-a64e-c7c27dc18db2;
 Wed, 07 Apr 2021 08:01:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-5ZccmnLQO5CYOnHN6o16WQ-1; Wed, 07 Apr 2021 04:01:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7782C18BA280;
 Wed,  7 Apr 2021 08:01:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 158AF5D741;
 Wed,  7 Apr 2021 08:01:21 +0000 (UTC)
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
X-Inumbo-ID: 437b472c-6800-4fed-a64e-c7c27dc18db2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617782490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gANcOduiS5qwqHjaF+KRPhsM0SyVb9ZQmC/3XolK80E=;
	b=DnEw01bNNMzBQmVk5pSzDraODW4nKzbQOY/6x6oTejBg8JxaMkoi9Paj3vJ+PBNLhWoyQW
	dqm2CcFEHyVLEzo/FEle/eVAHN4z2gHEGPJDqHcwbnJWa8TAd8z30f7/oDQ+k9H3X7MXVd
	dcRMY4ZyxatXitfh2VIsp3+5T6NvXYs=
X-MC-Unique: 5ZccmnLQO5CYOnHN6o16WQ-1
Subject: Re: [edk2-devel] [PATCH v2 4/7] OvmfPkg/IndustryStandard: Introduce
 PageTable.h
To: devel@edk2.groups.io, thomas.lendacky@amd.com,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>, Brijesh Singh <brijesh.singh@amd.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
 <20210325154713.670104-5-anthony.perard@citrix.com>
 <90eb3caa-2116-e665-7dde-3fc7198409f2@amd.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fe267622-7c98-c1dd-6c37-49d17b4b0433@redhat.com>
Date: Wed, 7 Apr 2021 10:01:21 +0200
MIME-Version: 1.0
In-Reply-To: <90eb3caa-2116-e665-7dde-3fc7198409f2@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/26/21 15:16, Lendacky, Thomas wrote:
> On 3/25/21 10:47 AM, Anthony PERARD wrote:
>> We are going to use the page table structure in yet another place,
>> collect the types and macro that can be used from another module
>> rather that making yet another copy.
>>
>> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> This begs the question of whether there should be only one version of this
> header file, now. There are still copies in other places, but maybe that
> can be a future cleanup? I'll leave that decision to Laszlo.

Optimally the header file (a single header file) would exist solely in
MdePkg, but I'm OK with this patch too.

> 
> With one minor comment below, otherwise:
> 
> Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
> 
>> ---
>> CC: Tom Lendacky <thomas.lendacky@amd.com>
>> CC: Brijesh Singh <brijesh.singh@amd.com>
>> ---
>>
>> Notes:
>>     v2:
>>     - new patch
>>
>>  .../IndustryStandard/PageTable.h}             | 117 +-------------
>>  .../BaseMemEncryptSevLib/X64/VirtualMemory.h  | 143 +-----------------
>>  2 files changed, 5 insertions(+), 255 deletions(-)
>>  copy OvmfPkg/{Library/BaseMemEncryptSevLib/X64/VirtualMemory.h => Include/IndustryStandard/PageTable.h} (60%)
>>
> 
> ...
> 
>> diff --git a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h b/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
>> index 996f94f07ebb..b621d811ca6f 100644
>> --- a/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
>> +++ b/OvmfPkg/Library/BaseMemEncryptSevLib/X64/VirtualMemory.h
>> @@ -20,151 +20,10 @@
>>  #include <Library/DebugLib.h>
>>  #include <Library/MemoryAllocationLib.h>
>>  #include <Uefi.h>
>> +#include <IndustryStandard/PageTable.h>
> 
> Typically, these are preferred to be in sorted order.

Exactly, thanks.

Laszlo

> 
> Thanks,
> Tom
> 
>>  
>>  #define SYS_CODE64_SEL 0x38
>>  
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#73391): https://edk2.groups.io/g/devel/message/73391
> Mute This Topic: https://groups.io/mt/81605804/1721875
> Group Owner: devel+owner@edk2.groups.io
> Unsubscribe: https://edk2.groups.io/g/devel/unsub [lersek@redhat.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


