Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573F786D89
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 13:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589977.922062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8JU-0000cE-EE; Thu, 24 Aug 2023 11:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589977.922062; Thu, 24 Aug 2023 11:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8JU-0000Zz-B1; Thu, 24 Aug 2023 11:15:44 +0000
Received: by outflank-mailman (input) for mailman id 589977;
 Thu, 24 Aug 2023 11:15:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZ8JS-0000Zd-HY
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 11:15:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ8JR-0002qG-Ki; Thu, 24 Aug 2023 11:15:41 +0000
Received: from [15.248.3.1] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ8JR-0004Y0-AS; Thu, 24 Aug 2023 11:15:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Bz+bfruszbSXQ1d3p/6aFVq5/DvSJRjqtkEZzPltiKM=; b=FAj5d2d81Jos4pCj/wHYPnDFnQ
	gWRyAz9P8Z18q5VS5lqLSS1/5SOLPRu+7e1j4JohnapXykeaR/iQM4+tE9y5lvWf6E9BinAJSQOEy
	QXeiT6jpqZTGSBKZik2GSZ28fMzyDKDhNxbtkxpt0kanuioT9880XDO+8NT5pWxDS+Jo=;
Message-ID: <438b2e6d-004c-42d6-8238-1d8e77e274e6@xen.org>
Date: Thu, 24 Aug 2023 12:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach for
 HVM domain
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-3-julien@xen.org>
 <48113eee-e047-47ad-b7a7-29feb8464ce9@perard>
From: Julien Grall <julien@xen.org>
In-Reply-To: <48113eee-e047-47ad-b7a7-29feb8464ce9@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 18/08/2023 18:04, Anthony PERARD wrote:
> On Wed, Aug 09, 2023 at 11:33:05AM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
>> a PCI is attached (see pci_add_dm_done()) for all domain types. However,
>> the permissions are only revoked for non-HVM domain (see do_pci_remove()).
>>
>> This means that HVM domains will be left with extra permissions. While
>> this look bad on the paper, the IRQ permissions should be revoked
>> when the Device Model call xc_physdev_unmap_pirq() and such domain
>> cannot directly mapped I/O port and IOMEM regions. Instead, this has to
>> be done by a Device Model.
>>
>> The Device Model can only run in dom0 or PV stubdomain (upstream libxl
>> doesn't have support for HVM/PVH stubdomain).
>>
>> For PV/PVH stubdomain, the permission are properly revoked, so there is
>> no security concern.
>>
>> This leaves dom0. There are two cases:
>>    1) Privileged: Anyone gaining access to the Device Model would already
>>       have large control on the host.
>>    2) Deprivileged: PCI passthrough require PHYSDEV operations which
>>       are not accessible when the Device Model is restricted.
>>
>> So overall, it is believed that the extra permissions cannot be exploited.
>>
>> Rework the code so the permissions are all removed for HVM domains.
>> This needs to happen after the QEMU has detached the device. So
>> the revocation is now moved in a separate function which is called
>> from pci_remove_detached().
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> TODO: I am getting a bit confused with the async work in libxl. I am
>> not entirely sure whether pci_remove_detached() is the correct place
>> to revoke.
> 
> Whenever an async task in libxl takes more than one function to
> complete, the next function (or callback) that is going to be executed
> is further down in the current source file (usually). This is to try to
> avoid too much confusion when reading through a set of async calls. So
> pci_remove_detached() is after all the DM stuff are done, and it's
> before we deal with stubdom case which will go through these step again,
> so it seems appropriate.

Ah I didn't realize there was a logic in the ordering. This will help to 
understand the code in the future.

> 
> So, this new pci_revoke_permissions() function been place before
> do_pci_remove() will make it harder to follow what do_pci_remove() does.
> Does it need to be a separate function? Can't you inline it in
> pci_remove_detached() ?

I decided to go with an inline function to avoid increasing the size of 
pci_remove_detached() and also separate the logic from cleaning-up QMP 
an resetting the PCI device.

> 
> If it does needs to be a separate function, a better way to lay it down
> would be to replace calls to pci_remove_detached() by
> pci_revoke_permissions() as appropriate, and rename it with the prefixed
> "pci_remove_", that is pci_remove_revoke_permissions().

I don't understand this suggestion. pci_revoke_permissions() is called 
right in the middle of pci_remove_detached(). So it is not clear how it 
can be called ahead.

Also, if I replace pci_remove_detached() with pci_revoke_permissions(), 
does this mean you are expecting the latter to call the former?

> 
>> TODO: For HVM, we are now getting the following error on detach:
>> libxl: error: libxl_pci.c:2009:pci_revoke_permissions: Domain 3:xc_physdev_unmap_pirq irq=23: Invalid argument
>>
>> This is because the IRQ was unmapped by QEMU. It doesn't feel
>> right to skip the call. So maybe we can ignore the error?
> 
> The error is already ignore. But I guess you just want to skip writing
> an error message. But I think we should still write something, at least
> a DEBUG message. Also add a comment that QEMU also unmap it, so errors
> are expected.
> 
>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
>> index 7f5f170e6eb0..f5a4b88eb2c0 100644
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -1980,75 +2052,19 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>>               prs->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
>>               prs->xswait.callback = pci_remove_qemu_trad_watch_state_cb;
>>               rc = libxl__xswait_start(gc, &prs->xswait);
>> -            if (rc) goto out_fail;
>> -            return;
>> +            if (!rc) return;
> 
> This is confusing, we usually check for error condition in libxl, not
> success condition. So the currently written code is better.
> 
>> +            break;
>>           case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
>>               pci_remove_qmp_device_del(egc, prs); /* must be last */
>>               return;
>>           default:
>>               rc = ERROR_INVAL;
>> -            goto out_fail;
>> +            break;
> 
> You can keep the goto here, this is the usual way to deal with error. > (except a label named "out" would be more appropriate, but out_fail is
> fine).
> 
>>           }
>>       } else {
>> +        rc = 0;
> 
> You don't need to set rc in the else block and just set it after the if.

This was done this way because the code after could be called from an 
error path. So setting 'rc = 0' would be wrong.

Anyway, above, you said 'goto' is the way to deal with error in libxl. 
So it would be possible to use 'rc = 0' below.

Cheers,

-- 
Julien Grall

