Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF199978F9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 01:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815253.1228957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfua-0004Vr-W6; Wed, 09 Oct 2024 23:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815253.1228957; Wed, 09 Oct 2024 23:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfua-0004UW-T9; Wed, 09 Oct 2024 23:16:08 +0000
Received: by outflank-mailman (input) for mailman id 815253;
 Wed, 09 Oct 2024 23:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syfuZ-0004UQ-F7
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 23:16:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74880f7f-8694-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 01:16:05 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17285157592093.2429515659642902;
 Wed, 9 Oct 2024 16:15:59 -0700 (PDT)
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
X-Inumbo-ID: 74880f7f-8694-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728515760; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WGj+cu4FeL//7RPg/Lkv1zYSfn6pNwJ1cAM79YBT9FmSCPCFDUOHPcJe7Xhaf88YJHy3pXjixxvkJGeVkupfRzqTIJEEpapOZ5mCKBOmyQemYqcGZRyb4nTSHeSni3YlS7vBNX6Q6xEikrAuF/G2eRsXP08Q2oPgFQ9Whjpei8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728515760; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sFkSlqkzBqDOdveIXNPtblXiwMTRabpMWQoVqK0wUPo=; 
	b=lvk1u6uRvaPFIPM0yIa8QMCZkKNHY9FYaFlDkMEuuoD8FJ2r7JPPpavoffWGUFKj7QOXwQ+08AGKoNCd9gIUPHZGnExA9Vfa8m5N0ghLz7BbuzP6WJJwHRd2fv48/7rEZ32uDGyly8r8hFQIvCAGL8YVaEiIzE/MUVyesDambYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728515760;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sFkSlqkzBqDOdveIXNPtblXiwMTRabpMWQoVqK0wUPo=;
	b=WMjcerMmLfvJPBp/+1mXBZPwhpmNIj57KkHb3Oj4dWQqYOIAm8Q4rMmCafFL7BO3
	k7t6ixcs2WDUfzCBiEQGl5drAEtrh78gK8jb9hlDsHqJ2xpzcKJqILEiosIdzdVAkUI
	J4Ue8l227JyTPrXhzq6dgNg7EoNx5mbUcwGtoX80=
Message-ID: <70974a91-8c8c-49e2-91c0-cca7274e3579@apertussolutions.com>
Date: Wed, 9 Oct 2024 19:15:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 33/44] x86/boot: convert initial_images to struct
 boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-34-dpsmith@apertussolutions.com>
 <45f6d47b-0b17-4451-8956-c42260d9aaa5@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <45f6d47b-0b17-4451-8956-c42260d9aaa5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 14:52, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> The variable initial_images is used for tracking the boot modules 
>> passed in by
>> the boot loader. Convert to a struct boot_module and adjust the code 
>> that uses
>> it accordingly.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index d5916e85f68e..30a139074833 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> @@ -336,8 +336,9 @@ unsigned long __init 
>> initial_images_nrpages(nodeid_t node)
>>       for ( nr = i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        unsigned long start = initial_images[i].mod_start;
>> -        unsigned long end = start + PFN_UP(initial_images[i].mod_end);
>> +        unsigned long start = initial_images[i].mod->mod_start;
>> +        unsigned long end = start +
>> +                            PFN_UP(initial_images[i].mod->mod_end);
> 
> This can fit on a single line.

Ack.

>>           if ( end > node_start && node_end > start )
>>               nr += min(node_end, end) - max(node_start, start);
>> @@ -353,10 +354,12 @@ void __init discard_initial_images(void)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        uint64_t start = (uint64_t)initial_images[i].mod_start << 
>> PAGE_SHIFT;
>> +        uint64_t start =
>> +            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
>>           init_domheap_pages(start,
>> -                           start + 
>> PAGE_ALIGN(initial_images[i].mod_end));
>> +                           start +
>> +                           PAGE_ALIGN(initial_images[i].mod->mod_end));
> 
> This can fit on a single line.

Ack.

>>       }
>>       bi->nr_modules = 0;
> 
> With those fixed:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

