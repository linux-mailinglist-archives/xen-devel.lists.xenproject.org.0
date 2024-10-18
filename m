Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDF9A31B8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 02:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821479.1235315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1b2d-0006d2-Ak; Fri, 18 Oct 2024 00:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821479.1235315; Fri, 18 Oct 2024 00:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1b2d-0006a5-7G; Fri, 18 Oct 2024 00:40:31 +0000
Received: by outflank-mailman (input) for mailman id 821479;
 Fri, 18 Oct 2024 00:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xu+L=RO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1b2b-0006Yk-5Z
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 00:40:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9074b2d4-8ce9-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 02:40:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729212021724179.02065458662037;
 Thu, 17 Oct 2024 17:40:21 -0700 (PDT)
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
X-Inumbo-ID: 9074b2d4-8ce9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729212022; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KEK6Wao0q94HOy1NT1EXpKqzgdd8AvU6hXIMCmdeoBN+0XuKiFeGZcltH5y9MdUNGjFQ8cP2bIetRX3VHeVp04V0nDn2sEgQdQkYYR2G/jl4qh9AJcjzX3ol2BX6vzCkB6zRf+eEtRW7bffhJGmUCU1XC17IANScpjIhjBhijjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729212022; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JMzJ5gcjp1O7Yu3mklstGVlkxt9Hd4Of0mW+e6bpH7g=; 
	b=bfI/dYJ+ttn6yAK0oBnYu5cuGladBSM3mvtF7zA/5KRGqOCM4duF1UxG6O8h2hF3dzgUq3ZyZcDIVE+W2hC/44joucK7umWUqQTzVqwnek9TX1Q0qiUFiDdeA+2GFNkYt4lQ/4doljeRZ+AxAIvz3kJa4hOgIA6PO0nmEhQ1TAA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729212022;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JMzJ5gcjp1O7Yu3mklstGVlkxt9Hd4Of0mW+e6bpH7g=;
	b=ZzPXmfnZOcOAke1KBArwmiqYbCtyyoJvD7iBZMaCP256n7iCSPTB8FFWAVTUWQho
	01h7TTf3uL+bZ/AviiKgUXTdVoShQAX+Z8BWdfXUKngL2w+w6bgj76QlL2jriXxocpg
	k/qGnqxjs+9J1Sv4+MjRbE2YU4tifWO3VVQBfl1s=
Message-ID: <9a5b8aab-1c36-43ed-8ad9-0fa739ebe6dc@apertussolutions.com>
Date: Thu, 17 Oct 2024 20:40:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/44] x86/boot: convert mod refs to boot_module mod
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-9-dpsmith@apertussolutions.com>
 <73783f6f-c041-4190-bed3-f2cebd2e57b2@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <73783f6f-c041-4190-bed3-f2cebd2e57b2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 19:02, Jason Andryuk wrote:
> On 2024-10-17 13:02, Daniel P. Smith wrote:
>> To allow a slow conversion of x86 over to struct boot_module, start with
>> replacing all references to module_t mod, only in setup.c, to the mod 
>> element
>> of struct boot_module. These serves twofold, first to allow the 
>> incremental
>> transition from module_t fields to struct boot_module fields. The 
>> second is to
>> allow the conversion of function definitions from taking module_t 
>> parameters to
>> accepting struct boot_module as needed when a transitioned field will be
>> accessed.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v5:
>> - rewrote commit message
>> - coding style changes
>> - added comment for initial_images assignment
>> ---
>>   xen/arch/x86/setup.c | 64 +++++++++++++++++++++++++-------------------
>>   1 file changed, 37 insertions(+), 27 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 11e1027d72dd..1b56eaf26efe 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> @@ -1460,9 +1465,9 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>                * move mod[0], we incorporate this as extra space at 
>> the start.
>>                */
>>               struct boot_module *bm = &bi->mods[j];
>> -            unsigned long size = PAGE_ALIGN(bm->headroom + 
>> mod[j].mod_end);
>> +            unsigned long size = PAGE_ALIGN(bm->headroom + 
>> bm->mod->mod_end);
>> -            if ( mod[j].reserved )
>> +            if ( bi->mods[j].mod->reserved )
> 
> Use bm->mod->reserved here?

Yah, that would be better.

>>                   continue;
>>               /* Don't overlap with other modules (or Xen itself). */
> 
>> @@ -1591,8 +1598,9 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>                   map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
>>                   for ( j = 0; j < bi->nr_modules; ++j )
>>                   {
>> -                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
>> -                                   mod[j].mod_end;
>> +                    uint64_t end = pfn_to_paddr(
>> +                                   bi->mods[j].mod->mod_start) +
> 
> pfn_to_paddr and mod_start can fit on one line

I will check but you have to also account for the '+' as generally it 
should stay with the LHS.

>> +                                   bi->mods[j].mod->mod_end;
>>                       if ( map_e < end )
>>                           map_e = end;
>> @@ -1666,11 +1674,12 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        set_pdx_range(mod[i].mod_start,
>> -                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
>> -        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
>> -                         _mfn(mod[i].mod_start),
>> -                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
>> +        set_pdx_range(bi->mods[i].mod->mod_start,
>> +                      bi->mods[i].mod->mod_start +
>> +                      PFN_UP(bi->mods[i].mod->mod_end));
> 
> Indent PFN_UP since it's a continuation of the previous argument?

Ack.


v/r,
dps

