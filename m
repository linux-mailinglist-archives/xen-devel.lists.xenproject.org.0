Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07CC26D9D7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIrk2-0002Mu-Eo; Thu, 17 Sep 2020 11:06:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIrk0-0002Mp-Sd
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:06:16 +0000
X-Inumbo-ID: 00440e26-337b-45d2-b906-13ae763498a8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00440e26-337b-45d2-b906-13ae763498a8;
 Thu, 17 Sep 2020 11:06:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600340775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+8V7CiNUz2z+S+ylz0EbWL9LbZryLWiq7P9z+eE5/4=;
 b=B0Cf1hk0CP0aY64vzO6vXjUZBOlJPwuX/92I+2ubm1s/rO7NYNcOWbuxnZK2VLpxchvdDc
 1Uv7a7P/AVWJuOcEsa5+b7kiP/DuBKTxoww6Or9OVqDzs97mzsurymz/mfqW902Gl4y71B
 eskFpPEmYiS0Hj5kbN7PaK8tIoogqji+pTVIGUs6F45hC+pMyowRJe9VNYT4tj0T5YkoTc
 WDub5tnvosvvTm64KoqJx5ItHoXeyW/Pq9iR9bcMC3DzuQlcC+7Cfapotc7efWm3pjBMpy
 JUtIOEKgFxEImiHRwsHlu8OlxPgYdXkO3EjAvNTvRVJ9BRTenZUy50VOS3Tc4A==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8C02B0BE;
 Thu, 17 Sep 2020 11:06:48 +0000 (UTC)
Subject: Re: [PATCH v4 1/4] efi/boot.c: add file.need_to_free
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wl@xen.org
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-2-hudson@trmm.net> <20200916064358.GP753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ccff37e4-652c-c7bc-4642-928d28b7ca89@suse.com>
Date: Thu, 17 Sep 2020 13:06:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916064358.GP753@Air-de-Roger>
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

On 16.09.2020 08:43, Roger Pau Monné wrote:
> On Mon, Sep 14, 2020 at 07:50:10AM -0400, Trammell Hudson wrote:
>> @@ -279,13 +280,13 @@ void __init noreturn blexit(const CHAR16 *str)
>>      if ( !efi_bs )
>>          efi_arch_halt();
>>  
>> -    if ( cfg.addr )
>> +    if ( cfg.addr && cfg.need_to_free )
>>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>> -    if ( kernel.addr )
>> +    if ( kernel.addr && kernel.need_to_free )
>>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
>> -    if ( ramdisk.addr )
>> +    if ( ramdisk.addr && ramdisk.need_to_free )
>>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
>> -    if ( xsm.addr )
>> +    if ( xsm.addr && xsm.need_to_free )
>>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));

All these look to be able to become just "if ( xyz.need_to_free )"
if ...

>> @@ -572,6 +573,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>                           HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>>          ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>                                      PFN_UP(size), &file->addr);
>> +        file->need_to_free = true;
> 
> Strictly speaking, don't you need to set need_to_free only if
> AllocatePages has succeed?

... this was followed, so I think the adjustment wants making.

> I guess it doesn't matter much because addr
> would be zapped to 0 if allocation fails.

Perhaps this zapping then also becomes unnecessary, albeit I
didn't look very closely yet.

Jan

