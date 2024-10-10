Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88389979ED
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815347.1229076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhWi-00026Z-7P; Thu, 10 Oct 2024 00:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815347.1229076; Thu, 10 Oct 2024 00:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhWi-00024R-4o; Thu, 10 Oct 2024 00:59:36 +0000
Received: by outflank-mailman (input) for mailman id 815347;
 Thu, 10 Oct 2024 00:59:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhWg-00022t-UC
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:59:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7ec7bf8-86a2-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 02:59:32 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728521963986940.3583225529694;
 Wed, 9 Oct 2024 17:59:23 -0700 (PDT)
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
X-Inumbo-ID: e7ec7bf8-86a2-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728521966; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hBoV0jP2yJXFvJEJPeBq59dmYTZ0dcniSGj5VTj9/PZ6O6LUHPXe9BLuKFx5mJa5J+PJtqIuEzCBmeKqjGHFtH4eEGD20SwZwCE2gm5fCcPSH0vbkFzvbpiyp0mo74dpgjAD9pg+qGHqxFwYjLodgqqhnCyQLrHTVnVJDo4Zu8A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728521966; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WerD3T26xORxZ1WANjFbaYCNzR7Qa1qL5Jp0Y7YENtg=; 
	b=SsHotlmd3HPRhw7qcrPLDAxSJ2IgYloC6TEBTZmoZwmblzTy8/hALKxmWej8R1vTitLdvbfbtesKv4p8QhPlLxoswtOnLI5Bgn/hSwzcYDcqqCAbwgvfJ78LzMX/Zngm8CRDaW/z1+tb5Y04/3wKESs9pzGx16wdYXejSWiCavs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728521966;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WerD3T26xORxZ1WANjFbaYCNzR7Qa1qL5Jp0Y7YENtg=;
	b=gW4RIW6thJX0vslqtAdiL4auvsvXolj8wOvyXefiuQPQpKOAQ9+mmkKX3PGGk/mA
	ZDCOXTAXPEl5ttMf3MS9fb+keZuc4ktoUp0SdWi07vQYFn2al1kc4PQmY+62YEiL5Pq
	jSj2DaGC99kz6rTwf5NKN6g3qyjJNtg4YJN7KoXw=
Message-ID: <3cec09e7-965f-48cf-8c7d-baff5ecd811a@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:59:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/44] x86/boot: move mmap info to boot info
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-5-dpsmith@apertussolutions.com>
 <07b7f29a-db11-4ac6-bd1f-c2d9eb657b88@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <07b7f29a-db11-4ac6-bd1f-c2d9eb657b88@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:13, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -296,6 +296,12 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>>       else
>>           bi->cmdline = "";
>>   
>> +    if ( mbi->flags & MBI_MEMMAP )
>> +    {
>> +        bi->memmap_addr = mbi->mmap_addr;
>> +        bi->memmap_length = mbi->mmap_length;
>> +    }
>> +
>>       return bi;
>>   }
>>   
>> @@ -1185,13 +1191,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>       {
>>           memmap_type = "Xen-e820";
>>       }
>> -    else if ( mbi->flags & MBI_MEMMAP )
>> +    else if ( bi->memmap_addr )
> 
> I'd like to note that this isn't an exact transformation, as with the flag
> set the memory map could theoretically also like at address 0. As long as
> the legacy BIOS layout of low memory is as it is, that won't happen. I'm
> less certain going forward, for legacy-free hardware/firmware. Imo at the
> very least this needs mentioning as intentional in the description, for
> archeologists to later be able to tell whether this was an oversight.
> 
> Or maybe it would be better to check ->memmap_length? That being zero
> clearly means there's effectively no map.

I think checking memmap_length is a better approach because as you say, 
the only time it will be zero is if no map was provided.

v/r,
dps

