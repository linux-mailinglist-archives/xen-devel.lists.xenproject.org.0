Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C851098775A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805701.1216877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1str5D-0007oB-AW; Thu, 26 Sep 2024 16:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805701.1216877; Thu, 26 Sep 2024 16:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1str5D-0007mP-6n; Thu, 26 Sep 2024 16:11:11 +0000
Received: by outflank-mailman (input) for mailman id 805701;
 Thu, 26 Sep 2024 16:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1str5B-0007mD-SS
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:11:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eda476a8-7c21-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 18:11:05 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727367057720666.52120740873;
 Thu, 26 Sep 2024 09:10:57 -0700 (PDT)
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
X-Inumbo-ID: eda476a8-7c21-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727367060; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JRFr+w2qlJ/b8sB1NmtsGKoIgZnCmiowQ3EBpkzGTGDbxTjl/SWLqlBgrIoZo+x4/hNtqsjdJU216kQB4j8zsG9xOqapTui3F2gnHhmSbd/YnDTfe3aqutTXy+N0aQcDZO6Wggn3fXVkYmGYrfXCVTfPx3SDJl0KeiiBGXMuENc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727367060; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I9Y82SmeXNCqrNv7YD0ewwD1pXbo1mm/SWP2Sabpygo=; 
	b=HD5RAVhV8zRBtqj6os7uOJeMlv4WBQuLezfRtq0TJwuga7Hh3zdK1tIma/THYDNsyoltq9ZLT2AwhH531beG+6hO7yYftk9M8tqp6S6+ekBfOfQ2J72PpovOtcslbburzdgnB5fsvljH118xr7PQ4dNoD+a/IO6NTgBwV9GOmjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727367060;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=I9Y82SmeXNCqrNv7YD0ewwD1pXbo1mm/SWP2Sabpygo=;
	b=Gh3iZhQc5bYSyzlCH6+wLAChIrFd/uQKHvSwo1C0TQQ8Wqk9j8Tx7gBQtjg+levE
	951tYTv/JX2FEeeNublzFmEmanX52Nry3n5uuiGgqJ71WQXK0nwpWBS6m4ikvHiMjyR
	ATxTesWfztLQpljHila+KogHFucxgBEd53N/XdHQ=
Message-ID: <1094155e-e03f-4a25-8285-43eea8dc31d6@apertussolutions.com>
Date: Thu, 26 Sep 2024 12:10:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/44] x86/boot: convert consider_modules to struct
 boot_module
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-7-dpsmith@apertussolutions.com>
 <f6c938b4-3c28-4dc8-bc3a-3becb3a0c2cd@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <f6c938b4-3c28-4dc8-bc3a-3becb3a0c2cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/4/24 02:40, Jan Beulich wrote:
> On 30.08.2024 23:46, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -632,7 +632,7 @@ static void __init noinline move_xen(void)
>>   #undef BOOTSTRAP_MAP_LIMIT
>>   
>>   static uint64_t __init consider_modules(
>> -    uint64_t s, uint64_t e, uint32_t size, const module_t *mod,
>> +    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
> 
> As an array is meant, may I ask to switch to mods[] at this occasion?

Sure.

>> @@ -642,20 +642,20 @@ static uint64_t __init consider_modules(
>>   
>>       for ( i = 0; i < nr_mods ; ++i )
>>       {
>> -        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
>> -        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
>> +        uint64_t start = (uint64_t)mods[i].early_mod->mod_start << PAGE_SHIFT;
> 
> Similarly, may I ask to stop open-coding {,__}pfn_to_paddr() while
> transforming this?

Yep, I can convert it. I was trying to be conscious of this, and you 
should see it in other places.

>> @@ -1447,7 +1447,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           {
>>               /* Don't overlap with modules. */
>>               end = consider_modules(s, e, reloc_size + mask,
>> -                                   mod, boot_info->nr_mods, -1);
>> +                                   boot_info->mods, boot_info->nr_mods, -1);
>>               end &= ~mask;
>>           }
>>           else
>> @@ -1482,7 +1482,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>                   continue;
>>   
>>               /* Don't overlap with other modules (or Xen itself). */
>> -            end = consider_modules(s, e, size, mod,
>> +            end = consider_modules(s, e, size, boot_info->mods,
>>                                      boot_info->nr_mods + relocated, j);
>>   
>>               if ( highmem_start && end > highmem_start )
>> @@ -1509,7 +1509,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           while ( !kexec_crash_area.start )
>>           {
>>               /* Don't overlap with modules (or Xen itself). */
>> -            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
>> +            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), boot_info->mods,
>>                                    boot_info->nr_mods + relocated, -1);
> 
> All of these show a meaningful increase of line lengths, up to the point of
> ending up with too long a line here. I really wonder if the variable name
> "boot_info" isn't too long for something that's going to be used quite
> frequently. Just "bi" maybe?

Yes, in fact, my apologies as this appears to be a comment you made from 
a previous review. The suggestion from Alejandro will make this easier 
since it will become a local variable to __start_xen().

v/r,
dps

