Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CB9875FE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 16:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805612.1216764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpqI-000648-VA; Thu, 26 Sep 2024 14:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805612.1216764; Thu, 26 Sep 2024 14:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpqI-000614-S3; Thu, 26 Sep 2024 14:51:42 +0000
Received: by outflank-mailman (input) for mailman id 805612;
 Thu, 26 Sep 2024 14:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1stpqH-00060y-6I
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 14:51:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ab3a30-7c16-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 16:51:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727362292590172.67430958537568;
 Thu, 26 Sep 2024 07:51:32 -0700 (PDT)
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
X-Inumbo-ID: d4ab3a30-7c16-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727362293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fiudTYLwOx1DN5zCG4z+gLE+KxR+cBSO/X5FeIFbtyw6U+TKDXX0B1m46DU+snZvChqT6PeEvgCznnymmAEyUFtP0yI3gw3TIL3AYSzPfjpRZuFaEF/HoKVosZncZ82ZTX79cqu3TUTe3iRxQ4+uXwLZF5Cf9Whi/Zcd+A1PPTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727362293; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y77w4rIqyuPyduzqzI4MnD1HMk0tL3nLkByeaBanpdw=; 
	b=ZmbtHV4kLXUUSeQ4XzlK5Bi25fB6syxQEm4Qw7z7PD65q9JsOiteAoR/ubpoOmhsvAb48DUk4ftW/3lTf1+35zt7T6KDw8xjyv3xAbTUa49lQzZXnB84Dh7Gwq0t8klYqeosFDo6mRCFHt4W4nyIAI0oKOoCN4IVxOl/9haveQk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727362293;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Y77w4rIqyuPyduzqzI4MnD1HMk0tL3nLkByeaBanpdw=;
	b=uMvBB3BFv2vfLxY6UYDTW8w1sHS8J5xMFHHxAZEReTHgPdxe4TNnvefHBdrnGOHz
	UJ7IbfwE8DP1/KqXpmRmj5DkYdGb4vXyZXDHonBXv98OHbYcjOu5QE9cNAKLRyYio5F
	Z2giXmvRoSvhOUY3A9lLcb/2jQ1caMAK5TL+pWQg=
Message-ID: <937c0741-c905-4f29-a813-60c0000f4064@apertussolutions.com>
Date: Thu, 26 Sep 2024 10:51:30 -0400
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
 <9a87ab05-b95a-4613-adb1-95b5f4a55c4b@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <9a87ab05-b95a-4613-adb1-95b5f4a55c4b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/3/24 18:35, Andrew Cooper wrote:
> On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index eee20bb1753c..dd94ee2e736b 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1034,9 +1044,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>           mod = __va(mbi->mods_addr);
>>       }
>>   
>> +    multiboot_to_bootinfo(mbi);
> 
> Actually, peeking ahead to the end of the series, we've got this:
> 
> void __start_xen(unsigned long mbi_p)
> {
>      ...
>      multiboot_info_t *mbi;
>      module_t *mod;
>      ...
> 
>      if ( pvh_boot )
>      {
>          ASSERT(mbi_p == 0);
>          pvh_init(&mbi, &mod);
>      }
>      else
>      {
>          mbi = __va(mbi_p);
>          mod = __va(mbi->mods_addr);
>      }
> 
>      multiboot_to_bootinfo(mbi, mod);
> 
> 
> which are the sum total of the mbi and mod pointers.  Worse, pvh_init()
> is transforming the PVH into into MB1 info, just to be transformed
> immediately to BI.
> 
> I expect this is work for the end of the series (I can't think of a nice
> way to disentangle it earlier), but could we end up with something more
> like:
> 
>      if ( pvh_boot )
>      {
>          ASSERT(mbi_p == 0);
>          pvh_fill_boot_info();
>      }
>      else
>      {
>          multiboot_info_t *mbi = __va(mbi_p);
> 
>          multiboot_fill_boot_info(mbi, __va(mbi->mods_addr));
>      }
> 
> ?
> 
> Or perhaps even just pass mbi_p in, and have multiboot_fill_boot_info()
> do the __va()'s itself.
> 
> If so, we probably want to make a naming and possibly prototype
> difference in this patch.

Let me combine this with some of Alejandro's comments. What if I were to 
reshape it to look like this,

/*
  * This level of indirection may not be desired, dropping it is not an
  * issue. I am proposing it because there is going to be a need to
  * access the instance from distant unit files.
  */
struct boot_info __init *get_boot_info(void)
{
     static struct boot_info __initdata info;

     return &info;
}

static struct boot_info __init *multiboot_fill_boot_info(
     unsigned long mbi_p)
{
     struct boot_info *bi = get_boot_info();
     multiboot_info_t *mbi = __va(mbi_p);
     module_t mods = __va(mbi->mods_addr);

     ...

     return bi;
}

, then in the PVH boot code

struct boot_info __init *pvh_fill_boot_info(void)
{
     struct boot_info *bi = get_boot_info();

     ...

     return bi;
}

, and then something similar for efi.

What does everyone think?

v/r,
dps

