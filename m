Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013309978E8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 01:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815239.1228937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfoW-0002Tl-5w; Wed, 09 Oct 2024 23:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815239.1228937; Wed, 09 Oct 2024 23:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfoW-0002SG-36; Wed, 09 Oct 2024 23:09:52 +0000
Received: by outflank-mailman (input) for mailman id 815239;
 Wed, 09 Oct 2024 23:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syfoU-0002SA-3v
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 23:09:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93ee0122-8693-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 01:09:48 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728515382604174.57877637899185;
 Wed, 9 Oct 2024 16:09:42 -0700 (PDT)
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
X-Inumbo-ID: 93ee0122-8693-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728515384; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=adTPCsHosLUM/hNkU1lgMVhHjuWE8yyG121TG8TjJl+P07M1N5MEcPIBFwLTfApgVE5HVfdU6NDNiyFZ0VdYVYMQN32rnQXNKrrOYbufzBng1yRGZwpTP3mDxuC7akE3cmib4jH5HOlOEIsm9RW3ul8V5pBoC9FbeoxXpXhfyBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728515384; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=40e/4V0FbjfFzC7HxpH/GJ6pMhmoWsInYs9/8mL35J0=; 
	b=NLpdpVPdU2Vefu37uKbs9MMEJhDKtgWLU35hItpTgeHmpURZThh27dqQ4MOBeFBvNnVXCWUktbNRC91K5S+2e1P/uFthcHkiZS2m/eBb3g7j3VkM7yHzkJin3wHZlQrVkrUKOfrKxBWfXlTr+MeGoezbQP4n3PI+cAaCl/ZJIvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728515384;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=40e/4V0FbjfFzC7HxpH/GJ6pMhmoWsInYs9/8mL35J0=;
	b=bRyVNhYilDkIe7pD/1/rqJRjCIZVdd31XG9GMoom6ZhayP71uTBkJJxMJCpvCRnL
	ACNrHfSW1X5S2fn2zZewureJPda4JOh8Oo3OUDU5k1d8tBE4UiC9s/RN0nXzMoh58S9
	+PZO4/jMZkH3A6NC2RYL7F9BsVxI2MhMgvcQMfts=
Message-ID: <7294149b-4b02-4f1b-a62a-d750d6f3b65c@apertussolutions.com>
Date: Wed, 9 Oct 2024 19:09:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 28/44] x86/boot: add cmdline to struct boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-29-dpsmith@apertussolutions.com>
 <cc11ab03-d518-444b-bc0c-24d656ea1e8d@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <cc11ab03-d518-444b-bc0c-24d656ea1e8d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 13:08, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Add a char pointer field, cmdline, to struct boot_module to hold the 
>> address
>> pointed to by the string field of struct mod. This removes the need to 
>> use the
>> early_mod field to get to the dom0 kernel command line.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 2 ++
>>   xen/arch/x86/setup.c                | 9 ++++++---
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h 
>> b/xen/arch/x86/include/asm/bootinfo.h
>> index 9ed260629012..3b6bfbe88770 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -38,6 +38,8 @@ struct boot_module {
>>   #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
>>   #define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
>> +    const char *cmdline;
>> +
>>       paddr_t start;
>>       size_t size;
>>   };
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index aed0837902c4..d5916e85f68e 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -312,6 +312,8 @@ static struct boot_info __init 
>> *multiboot_fill_boot_info(unsigned long mbi_p)
>>       {
>>           bi->mods[i].mod = &mods[i];
>> +        bi->mods[i].cmdline = (char *)(paddr_t)mods[i].string;
>> +
>>           bi->mods[i].start = (paddr_t)mods[i].mod_start;
>>           bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
>>       }
>> @@ -1000,10 +1002,11 @@ static struct domain *__init 
>> create_dom0(struct boot_info *bi)
>>           panic("Error creating d%uv0\n", domid);
>>       /* Grab the DOM0 command line. */
>> -    if ( image->mod->string || bi->kextra )
>> +    if ( image->cmdline || bi->kextra )
>>       {
>> -        if ( image->mod->string )
>> -            safe_strcpy(cmdline, cmdline_cook(__va(image->mod->string),
>> +        if ( image->cmdline )
>> +            safe_strcpy(cmdline,
>> +                        cmdline_cook(__va((unsigned 
>> long)image->cmdline),
> 
> char * seems inappropriate if cmdline isn't usable as a string.  Maybe 
> have cmdline as a paddr_t, or can __va() be used at assignment time?
> 

Yah, char * was not the correct choice, paddr_t is more appropriate.

v/r,
dps

