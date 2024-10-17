Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E19A30DE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 00:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821376.1235150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Z8I-0004NT-Ky; Thu, 17 Oct 2024 22:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821376.1235150; Thu, 17 Oct 2024 22:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Z8I-0004L1-IL; Thu, 17 Oct 2024 22:38:14 +0000
Received: by outflank-mailman (input) for mailman id 821376;
 Thu, 17 Oct 2024 22:38:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Z8G-0004Jc-Md
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 22:38:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c3e5f43-8cd8-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 00:38:11 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729204682437455.8210057968672;
 Thu, 17 Oct 2024 15:38:02 -0700 (PDT)
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
X-Inumbo-ID: 7c3e5f43-8cd8-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729204684; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OZk80wssMq4KfAeyNi6IgfW0nYUZfU/IhMPAzMD9Btt7mBnuIAP0JuI/FoBEGH7m5+qg3aJGzP8uZYcHkne+0k/K6ekZMGjaQLXvBVtJrJELSq6+WoYXiSApAZ9q+SjEW6KOiSV4OUqtl5GwfFkWN+voParK/FHXsHB978PQ7oA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729204684; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SsxxR4pG7Tb9BswiXQOBqaoRFK+ymUPoEw7YQ9yTCIk=; 
	b=hRtuKqlqqrAClKCI4PUgRP14kZgGjUV+5TvSqJtqQy7dINoAd1jfcF7oUNBF8pXoxaPNbjLmg8wgNMVTS9NcoCfz5zN40iLHrPHjnMPk76aU+TAqbM3bQRJS+zb4T3AmCeYoSSKVb3Nc/UkwiDltu6SBv6NW9xihY0B5r2ZhLHs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729204684;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SsxxR4pG7Tb9BswiXQOBqaoRFK+ymUPoEw7YQ9yTCIk=;
	b=Mtrd4hkV7y+1x3kB4nvH9VFDH9FG46L2/XUp0W0iA0+tmT9lZB9DJxBG4HWWivKd
	zTN2pAauYNxG5yYaFG6525lPcbw+HpkSIMRaXHJQBsvy/N7K5tAuG+SPrn5lzbMSYoz
	GS2hG3v3gIZLMyRzjdnIO4EcXNsseb6WOt2lrEzU=
Message-ID: <1237946a-68f2-4177-a410-1a75f535e8e5@apertussolutions.com>
Date: Thu, 17 Oct 2024 18:38:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/44] x86/boot: move cmdline to boot info
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-4-dpsmith@apertussolutions.com>
 <620ed038-f308-4abe-8529-9bb3f203f4c2@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <620ed038-f308-4abe-8529-9bb3f203f4c2@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/17/24 16:35, Andrew Cooper wrote:
> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index eac0954f42b8..037cdd17386c 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1035,11 +1043,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>   
>>       bi = multiboot_fill_boot_info(mbi_p);
>>   
>> -    /* Parse the command-line options. */
>> -    if ( mbi->flags & MBI_CMDLINE )
>> -        cmdline = cmdline_cook(__va(mbi->cmdline), bi->loader);
>> -
>> -    if ( (kextra = strstr(cmdline, " -- ")) != NULL )
>> +    if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )
> 
> The /* Parse the command-line options. */ comment refers mostly to ...
> 
>>       {
>>           /*
>>            * Options after ' -- ' separator belong to dom0.
>> @@ -1050,7 +1054,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           kextra += 3;
>>           while ( kextra[1] == ' ' ) kextra++;
>>       }
>> -    cmdline_parse(cmdline);
>> +    cmdline_parse(bi->cmdline);
> 
> ..., so should stay in place rather than moving into
> multiboot_fill_boot_info().

Ack.

v/r,
dps

