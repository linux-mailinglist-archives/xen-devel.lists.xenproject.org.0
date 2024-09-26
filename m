Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C19875A0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 16:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805591.1216733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpWX-0001It-Pr; Thu, 26 Sep 2024 14:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805591.1216733; Thu, 26 Sep 2024 14:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpWX-0001Ga-NC; Thu, 26 Sep 2024 14:31:17 +0000
Received: by outflank-mailman (input) for mailman id 805591;
 Thu, 26 Sep 2024 14:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1stpWW-0001GU-NF
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 14:31:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb05386a-7c13-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 16:31:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727361064185575.8716421376969;
 Thu, 26 Sep 2024 07:31:04 -0700 (PDT)
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
X-Inumbo-ID: fb05386a-7c13-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1727361067; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KxiQl+2R/QR1I7WHXEf6f9NnCIa42z9BexoPom/hWp3jvxgD+V3dfXDild3ba4Ste1tze7zBwrsshWV7E+jQO4V3LJ9zh6maxOJX9+EGD4jjl850dO19jrAahYvTQoaLL/wTEC21+AXy639+Us/JKfh+BZdsY2KyS7C5TwmKYAQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727361067; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jKyFwwo/g47npl1oKITy5SWJhIGvTQvFZ84D2gjNkek=; 
	b=Wb3/UHMCjVwVIXh1Kxed9SvmMZbM5fCJzvJaFUNgqWfJ38odOMc17Dywo+VAWZBAnKl0EWkYvF3P3A+vyH7l8mfwFuBANWT8y/DhTj2k0VbsGkhF8F9X1sDAN5OJuMjGHI1PSCTKb6aVqc/x8VV+aSJrkupCqYBxNPr/zc1nDmI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727361067;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jKyFwwo/g47npl1oKITy5SWJhIGvTQvFZ84D2gjNkek=;
	b=YWWyMR3HXY1zxKniSk1/3X7enzgfW2/0nF90QSOsDbx0y7OOWUGs7OBID5huoWom
	Fc9C3yJz0ZZ933LDLNay/Pa1pfDipfu/QfprRRDWpw8bsAYOFWFtUUjCzpF+q/LuY17
	09frhYm38ZEsWvl7yxuqNQb4gFAMsSQYgpvQIrOc=
Message-ID: <fe750dde-49ec-4c65-8bad-cd8eb5b4583c@apertussolutions.com>
Date: Thu, 26 Sep 2024 10:31:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>, jason.andryuk@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-2-dpsmith@apertussolutions.com>
 <794ffa84-3c94-4cd7-98de-24a2210b72bc@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <794ffa84-3c94-4cd7-98de-24a2210b72bc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/3/24 18:24, Andrew Cooper wrote:
> On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
>> From: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> An initial step towards a non-multiboot internal representation of boot
>> modules for common code, starting with x86 setup and converting the fields
>> that are accessed for the startup calculations.
>>
>> Introduce a new header, <xen/asm/bootinfo.h>, and populate it with a new
> 
> Just <asm/bootinfo.h>, which matches the code.

Ack.

>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> new file mode 100644
>> index 000000000000..e850f80d26a7
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>> + * Copyright (c) 2024 Apertus Solutions, LLC
>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>> + */
>> +
>> +#ifndef __XEN_X86_BOOTINFO_H__
>> +#define __XEN_X86_BOOTINFO_H__
>> +
> 
> There ought to be a short description of what boot_info is, even if it's
> only "Xen's local representation of information provided by the
> bootloader/environment."

Yes, will be adding a description.

>> +struct boot_info {
>> +    unsigned int nr_mods;
> 
> For the sake of 3 letters, please can this be nr_modules.  I've run sed
> over the top of the v5 branch and it doesn't change line wrapping
> anywhere, but it is a legibility improvement IMO.

I'm okay with that.

>> +};
>> +
>> +#endif
> 
> #endif /* __XEN_X86_BOOTINFO_H__ */
> 
> It very quickly get to not being in the same few lines as the #ifndef.

Ack.

>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index eee20bb1753c..dd94ee2e736b 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -276,7 +277,16 @@ static int __init cf_check parse_acpi_param(const char *s)
>>   custom_param("acpi", parse_acpi_param);
>>   
>>   static const module_t *__initdata initial_images;
>> -static unsigned int __initdata nr_initial_images;
>> +static struct boot_info __initdata *boot_info;
>> +
>> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
>> +{
>> +    static struct boot_info __initdata info;
>> +
>> +    info.nr_mods = mbi->mods_count;
>> +
>> +    boot_info = &info;
>> +}
> 
> Having a global pointer set only to this private structure is weird.
> Even this:
> 
>      static struct boot_info __initdata boot_info[1];
> 
> lets you keep -> notation, but removes one level of indirection.

Further work has pushed this into being a global, at least in the 
yet-to-be public work. The question is whether the allocation should 
just move out to the unit level or use a level of in direction with an
accessor function.

>> @@ -1034,9 +1044,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           mod = __va(mbi->mods_addr);
>>       }
>>   
>> +    multiboot_to_bootinfo(mbi);
>> +
>>       loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
>>                                              : "unknown";
>> -
> 
> Stray line removal.  (should be in patch 2 to minimise churn.)

Ack.

> ~Andrew

Thanks!

v/r,
dps

