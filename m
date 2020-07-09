Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE194219BE9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jul 2020 11:18:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtSge-0008Lb-MP; Thu, 09 Jul 2020 09:17:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehwI=AU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jtSgd-0008LW-EG
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2020 09:17:47 +0000
X-Inumbo-ID: 0d07c256-c1c5-11ea-8eaf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d07c256-c1c5-11ea-8eaf-12813bfff9fa;
 Thu, 09 Jul 2020 09:17:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 411ABADE5;
 Thu,  9 Jul 2020 09:17:45 +0000 (UTC)
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
Message-ID: <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
Date: Thu, 9 Jul 2020 11:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Peter Jones <pjones@redhat.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.06.20 10:50, Jürgen Groß wrote:
> Ping?
> 
> On 10.06.20 16:10, Juergen Gross wrote:
>> efifb_probe() will issue an error message in case the kernel is booted
>> as Xen dom0 from UEFI as EFI_MEMMAP won't be set in this case. Avoid
>> that message by calling efi_mem_desc_lookup() only if EFI_PARAVIRT
>> isn't set.
>>
>> Fixes: 38ac0287b7f4 ("fbdev/efifb: Honour UEFI memory map attributes 
>> when mapping the FB")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   drivers/video/fbdev/efifb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
>> index 65491ae74808..f5eccd1373e9 100644
>> --- a/drivers/video/fbdev/efifb.c
>> +++ b/drivers/video/fbdev/efifb.c
>> @@ -453,7 +453,7 @@ static int efifb_probe(struct platform_device *dev)
>>       info->apertures->ranges[0].base = efifb_fix.smem_start;
>>       info->apertures->ranges[0].size = size_remap;
>> -    if (efi_enabled(EFI_BOOT) &&
>> +    if (efi_enabled(EFI_BOOT) && !efi_enabled(EFI_PARAVIRT) &&
>>           !efi_mem_desc_lookup(efifb_fix.smem_start, &md)) {
>>           if ((efifb_fix.smem_start + efifb_fix.smem_len) >
>>               (md.phys_addr + (md.num_pages << EFI_PAGE_SHIFT))) {
>>
> 

In case I see no reaction from the maintainer for another week I'll take
this patch through the Xen tree.


Juergen

