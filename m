Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12CA996927
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814415.1227977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syV9R-0005ub-8q; Wed, 09 Oct 2024 11:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814415.1227977; Wed, 09 Oct 2024 11:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syV9R-0005s4-5z; Wed, 09 Oct 2024 11:46:45 +0000
Received: by outflank-mailman (input) for mailman id 814415;
 Wed, 09 Oct 2024 11:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syV9P-0005ry-Hd
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:46:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2579497a-8634-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 13:46:41 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728474393609905.6968962697754;
 Wed, 9 Oct 2024 04:46:33 -0700 (PDT)
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
X-Inumbo-ID: 2579497a-8634-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728474395; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ey5wCdw5oIgZSdbEFRmpgF7QvgNLhn4WeHc1Hm4x8AxpGOauYr/YM1MA37maYWaocoPnDe2eZ+jZ/RU7PUBLsQ/L8vWiHFWhZfXNS2sNzwcXjbGaZ9bAXNAbF5OgZQPpbonh+CUalGyZPkQ240X72qMyqIq2hjuSpcUIFvhQ8WY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728474395; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bV6tpWlJ2Ojq+ybJWQdqpQ0QeU2F/LXY+2Nc3G8IRBQ=; 
	b=esByCf2pgRVsk0waYucCe/aT3dkXieacb8Pae01BEeAfOLy/SmhuzeYEcrGnY/IzlUaTO+7q3/vJLtvH2mPu3EbATkbK6S6vU7ZsKDRsq0woiYBwoD76a/NdgCK4e9+hBv3TPwM4xtUY2IWgTdhK08xkxbUROwhHdk65OqXtzOw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728474395;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bV6tpWlJ2Ojq+ybJWQdqpQ0QeU2F/LXY+2Nc3G8IRBQ=;
	b=spacrm+a/w8JKW61V46yowWFzPtmESriBb3lbCrRLhJ6GY6dQrd8U9u5DYqs9/Z/
	nm16DBOK9ypmsmonFwyi4R13jWciiS5AGVpCp19trTIMW/D9dKv+UgERJyOAQXTs32w
	LmxwevaDEAJzZriyPzu9q3DF0dscD2gzaYNR+nIA=
Message-ID: <612dda05-f316-49a4-a23c-d30dd4e761cf@apertussolutions.com>
Date: Wed, 9 Oct 2024 07:46:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/44] x86/boot: move headroom to boot modules
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-8-dpsmith@apertussolutions.com>
 <af3c6fae-ac24-4629-b295-2dedb5824819@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <af3c6fae-ac24-4629-b295-2dedb5824819@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 14:55, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> The purpose of struct boot_module is to encapsulate the state of boot 
>> module as
>> it is processed by Xen. Locating boot module state struct boot_module 
>> reduces
>> the number of global variables as well as the number of state 
>> variables that
>> must be passed around. It also lays the groundwork for hyperlaunch 
>> mult-domain
>> construction, where multiple instances of state variables like 
>> headroom will be
>> needed.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h |  5 +++++
>>   xen/arch/x86/setup.c                | 23 ++++++++++++++---------
>>   2 files changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h 
>> b/xen/arch/x86/include/asm/bootinfo.h
>> index d19473d8941e..c7e6b4ebf0da 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -17,6 +17,11 @@
>>   struct boot_module {
>>       /* Transitionary only */
>>       module_t *mod;
>> +    /*
>> +     * A boot module may contain a compressed kernel that Xen will 
>> need space
>> +     * reserved, into which it will be decompressed.
> 
> Maybe "Extra space, before the module data, for compressed kernel 
> modules to be decompressed into."

I will rework it with your suggestions.

> And some ascii art could help:
> 
> [ headroom ][ compressed data ]
>   <decompression>
> [ decompressed data ]
> 
> (Not sure how to create a down arrow...)

Yes, in fact I would just show the three states like this:

At boot:
   [ compressed kernel ]
After boot module relocation:
   [ estimated headroom + PAGE_SIZE rounding ][ compressed kernel ]
After kernel decompression:
   [ decompressed kernel ][ unused rounding ]

>> +     */
>> +    unsigned long headroom;
>>   };
>>   /*
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index ba9f110d98c6..dd82ca3d43e2 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1012,7 +1012,7 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       struct boot_info *bi;
>>       multiboot_info_t *mbi;
>>       module_t *mod;
>> -    unsigned long nr_pages, raw_max_page, modules_headroom, 
>> module_map[1];
>> +    unsigned long nr_pages, raw_max_page, module_map[1];
>>       int i, j, e820_warn = 0, bytes = 0;
>>       unsigned long eb_start, eb_end;
>>       bool acpi_boot_table_init_done = false, relocated = false;
>> @@ -1371,7 +1371,10 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>           mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
>>       }
>> -    modules_headroom = bzimage_headroom(bootstrap_map(mod), 
>> mod->mod_end);
>> +    bi->mods[0].headroom =
>> +        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
>> +                         bi->mods[0].mod->mod_end);
>> +
>>       bootstrap_map(NULL);
>>   #ifndef highmem_start
>> @@ -1456,8 +1459,10 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>                * decompressor overheads of mod[0] (the dom0 kernel).  
>> When we
>>                * move mod[0], we incorporate this as extra space at 
>> the start.
>>                */
>> -            unsigned long headroom = j ? 0 : modules_headroom;
>> -            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
>> +            struct boot_module *bm = &bi->mods[j];
>> +            unsigned long size;
>> +
>> +            size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
> 
> Just do
>              unsigned long size = PAGE_ALIGN(bm->headroom + 
> mod[j].mod_end);
> ?

yep, not sure why I even split it.

v/r,
dps

