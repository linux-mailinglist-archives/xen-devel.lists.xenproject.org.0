Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6D987783
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805729.1216916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strKK-0003Tv-5s; Thu, 26 Sep 2024 16:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805729.1216916; Thu, 26 Sep 2024 16:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strKK-0003RH-36; Thu, 26 Sep 2024 16:26:48 +0000
Received: by outflank-mailman (input) for mailman id 805729;
 Thu, 26 Sep 2024 16:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1strKI-0003PT-CZ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:26:46 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1df1d79e-7c24-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:26:45 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727367998644255.7763143240444;
 Thu, 26 Sep 2024 09:26:38 -0700 (PDT)
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
X-Inumbo-ID: 1df1d79e-7c24-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1727367999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kPpJhuJcVEUf4LMLfeufL5tj6h0nj43lKAtggdIgOoF5pFmpyu4VsLLQHqfLMhx+SggwIbp9mHN5X0F2QORRiCB1yyu8pGZJqRu5IcTneBciT4x0kAG5BeDEgjWYP49KoLe5phL9rrlXpy3r7n/WJV71hxddZW+N5BpDukBR3Qw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727367999; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iyHYaAAW+udJjzX8hQZK/Gl2M6ySYGD4C6sl+q9woOk=; 
	b=MSs4/ygDjLmTdj7sEMA6qQZi3O9iGHWnwzgp7tW+YylWai8iL7FMNAhhELD1c4C6gkcVu5VKexhev3MwNCVCBoK3OmX7CY5FgLlacE8lBpLLoTTQRJwrnVyPsWKMQ41b3Zd9Z0pjJX1tqQzUbVYmIyLPKmyT1yElraqQo+fH8Os=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727367999;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iyHYaAAW+udJjzX8hQZK/Gl2M6ySYGD4C6sl+q9woOk=;
	b=fc5sDTSUTCdZZtDPwAKWCVKdvxcSDde+lpfpue7mTg9/A0fC4FJYTqxv7SqXRrbf
	PZrPAQFR2UcQQYI4l/eE05yBkNZ4lIu2L5UWxRO9G47qbfjxXycy4ADMysAr6P8eZvv
	mUxwu1tHsNk/LgzyXJx7Ly/lKZ84vsMe7pUMaiM4=
Message-ID: <cd7c0a71-f5c4-47cf-8985-e3c977a5343f@apertussolutions.com>
Date: Thu, 26 Sep 2024 12:26:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/44] x86/boot: move headroom to boot modules
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-8-dpsmith@apertussolutions.com>
 <564c11d1-4e06-4af0-bbdb-c4cbcf3df26a@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <564c11d1-4e06-4af0-bbdb-c4cbcf3df26a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/4/24 02:45, Jan Beulich wrote:
> On 30.08.2024 23:46, Daniel P. Smith wrote:
>> The purpose of struct boot_module is to encapsulate the state of boot modules.
>> Doing locates boot module state with its respective boot module, reduces
> 
> I'm struggling with the start of this sentence.

Yep, grammar check failed to catch. Will fix.

>> @@ -1390,7 +1390,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
>>       }
>>   
>> -    modules_headroom = bzimage_headroom(bootstrap_map(mod), mod->mod_end);
>> +    boot_info->mods[0].headroom = bzimage_headroom(
>> +                        bootstrap_map(boot_info->mods[0].early_mod),
>> +                        boot_info->mods[0].early_mod->mod_end);
> 
> Nit: This is badly indented. Either
> 
>      boot_info->mods[0].headroom = bzimage_headroom(
>          bootstrap_map(boot_info->mods[0].early_mod),
>          boot_info->mods[0].early_mod->mod_end);
> 
> or
> 
>      boot_info->mods[0].headroom =
>          bzimage_headroom(
>              bootstrap_map(boot_info->mods[0].early_mod),
>              boot_info->mods[0].early_mod->mod_end);
> 
> or
> 
>      boot_info->mods[0].headroom =
>          bzimage_headroom(bootstrap_map(boot_info->mods[0].early_mod),
>                           boot_info->mods[0].early_mod->mod_end);
> 
> Even shortening "boot_info" will not avoid some line wrapping here, as it
> looks.

I would lean towards the latter, as I find it the most clear. With the 
shortening of "boot_info" and dropping "early_" per Andy, It might bring 
it up one line. Will see when I do it.

v/r,
dps

