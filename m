Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38B25F3BE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:16:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBO2-0000S5-GZ; Mon, 07 Sep 2020 07:16:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFBO1-0000Rz-8c
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:16:21 +0000
X-Inumbo-ID: df8e16e0-6821-4cad-8f4a-198faab7c115
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df8e16e0-6821-4cad-8f4a-198faab7c115;
 Mon, 07 Sep 2020 07:16:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE9C3AD49;
 Mon,  7 Sep 2020 07:16:20 +0000 (UTC)
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Trammell Hudson <hudson@trmm.net>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <20200904130225.GQ753@Air-de-Roger>
 <2ilj0fgrgiQ2mlSeil5uuMfPGIOOw-IQCrVdB_BWde2paShrWOdD7GM3_2bLkLB_4k48zorwaYBcmQgoMc4D6T4ZgA3MZFiLH7E0q9-OZ3w=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e40f7edd-d4a1-beda-788d-c40526b87841@suse.com>
Date: Mon, 7 Sep 2020 09:16:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2ilj0fgrgiQ2mlSeil5uuMfPGIOOw-IQCrVdB_BWde2paShrWOdD7GM3_2bLkLB_4k48zorwaYBcmQgoMc4D6T4ZgA3MZFiLH7E0q9-OZ3w=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.09.2020 18:48, Trammell Hudson wrote:
> On Friday, September 4, 2020 9:02 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Fri, Aug 28, 2020 at 11:51:35AM +0000, Trammell Hudson wrote:
>>> -   return secboot == 1 && setupmode == 0;
>>
>> Does this need to be strictly 1, or any value != 0?
> 
> We discussed this briefly here on xen-devel without any real conclusion;
> the UEFI spec says that all other values are reserved. I'm not sure in practice
> if any others ever show up.

I think considering how critical it is that we get things right (as
in "secure"), we should fail booting by default (with a way to
override this) if the value found is reserved (as far as we can
tell).

>> [...]
>> I have to admit I know very little, but don't you need to verify the
>> ramdisk also, like you verify the kernel? Or is the kernel the one
>> that's supposed to verify it's ramdisk before using it?
> 
> With the unified image there is no need to do so; the xen.efi, config,
> kernel, initrd, flash, and ucode are all signed as one file and the
> shim protocol is not necessary.
> 
> For the non-unified case, well, that's what started me on this patch.
> I was quite surprised that all of the Secure Boot support in Linux
> distrbutions and Xen did not sign the initrd or command lines,
> only the kernel image.  So, yes, it seems like it should be signed,
> but that's not what the wider community decided to do.

But no matter how they do it, in principle it is the kernel's
responsibility aiui. I.e. they could sign the entire initrd, or
they could sign all the relevant pieces inside it.

Jan

