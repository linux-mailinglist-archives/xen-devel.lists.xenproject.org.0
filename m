Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2AB997911
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 01:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815260.1228966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syg0e-0007uq-KY; Wed, 09 Oct 2024 23:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815260.1228966; Wed, 09 Oct 2024 23:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syg0e-0007st-HC; Wed, 09 Oct 2024 23:22:24 +0000
Received: by outflank-mailman (input) for mailman id 815260;
 Wed, 09 Oct 2024 23:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syg0d-0007sn-37
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 23:22:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d2daf0-8695-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 01:22:21 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728516135732613.2294753033423;
 Wed, 9 Oct 2024 16:22:15 -0700 (PDT)
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
X-Inumbo-ID: 54d2daf0-8695-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728516137; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B0VGJsUVT40OKRL+6yoToUqFbQ/LQZIICVAvI2TKD3J8BtrwQzsab/w0//yKksztni73UyqG0J4Qjof1csLm0DTaSxUOFxTomFMNAE7jspPVPp1xWYF4+4s9MCllM7m9dovRFB95v1UEU3pd0IeioyuFA+mgUvFZ7wbMlIv2Mwk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728516137; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=75QBYXpr54qYnjDXsUy82zF9HVXkAAuduwH9MO58fEQ=; 
	b=L93VBVFGfaS2+cao1cFkG6YJnyQsrbO33L6GVmKuJD6mnAm5Z0kceMgPL6fZOSE2Eyq/hy2y1maaLYfHjueCx4HH+isVqWJt4HsF3vLiKuFeiuCnHR7Avo+wZOcnwpf+h8q/AYQbfbA2mEo6kPKVretYvGWn7Kq5Y7keP4+vw5U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728516137;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=75QBYXpr54qYnjDXsUy82zF9HVXkAAuduwH9MO58fEQ=;
	b=PAskeEJDO1lHUCzUW26Jzxtc43qej3rHpI6+z/W9NQijj4bEhSQ9pWpc+oqfh3Ty
	qzHTftX2QGZqNquUwivEInok58NdqrAyjfpz2y0rSCdw5FIbrzGW/BEKAMAvDvvSkJr
	CqI5w+hLN4naEaFA5fBC7S3jMzktfOHcWeni/u2g=
Message-ID: <1f1ce581-c59b-4df8-854f-05cfc2cd5b62@apertussolutions.com>
Date: Wed, 9 Oct 2024 19:22:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 34/44] x86/boot: drop the use of initial_images unit
 global
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-35-dpsmith@apertussolutions.com>
 <bdec9cdf-08f8-4fbd-a626-703f58fa0938@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <bdec9cdf-08f8-4fbd-a626-703f58fa0938@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 15:04, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 13 ++++---------
>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 30a139074833..b3b6e6f38622 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -276,8 +276,6 @@ custom_param("acpi", parse_acpi_param);
>>   static const char *cmdline_cook(const char *p, const char 
>> *loader_name);
>> -static const struct boot_module *__initdata initial_images;
>> -
>>   struct boot_info __initdata xen_boot_info;
>>   static struct boot_info __init *multiboot_fill_boot_info(unsigned 
>> long mbi_p)
>> @@ -336,9 +334,9 @@ unsigned long __init 
>> initial_images_nrpages(nodeid_t node)
>>       for ( nr = i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        unsigned long start = initial_images[i].mod->mod_start;
>> +        unsigned long start = bi->mods[i].mod->mod_start;
>>           unsigned long end = start +
>> -                            PFN_UP(initial_images[i].mod->mod_end);
>> +                            PFN_UP(bi->mods[i].mod->mod_end);
> 
> Fits on a single line.

Ack.

>>           if ( end > node_start && node_end > start )
>>               nr += min(node_end, end) - max(node_start, start);
>> @@ -355,15 +353,14 @@ void __init discard_initial_images(void)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>>           uint64_t start =
>> -            (uint64_t)initial_images[i].mod->mod_start << PAGE_SHIFT;
>> +            (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;
> 
> Fits on one line.  Can also be pfn_to_paddr(), which applies to earlier 
> patches.  Having said that, maybe it's okay to skip pfn_to_paddr as at 
> the end of the series mods[i].start is used without a shift.  i.e. fewer 
> transformations in these "mechanical" changes make review easier. Unless 
> someone else wants pfn_to_addr(), I am okay without that conversion.

After I did a few based on a comment from Jan on v4, I realized I am 
making changes that just go away or shift to a different conversion 
macro. I would prefer to just leave them to the end and make sure that 
when arriving at the final form, none of them are using any open coded 
forms.

I will move it up to a single line.

>>           init_domheap_pages(start,
>>                              start +
>> -                           PAGE_ALIGN(initial_images[i].mod->mod_end));
>> +                           PAGE_ALIGN(bi->mods[i].mod->mod_end));
> 
> One line.

Ack.

>>       }
>>       bi->nr_modules = 0;
>> -    initial_images = NULL;
>>   }
>>   static void __init init_idle_domain(void)
> 
> With the line fixups:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

