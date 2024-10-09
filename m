Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF2B9978CE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 01:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815230.1228927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfhW-0008MZ-BV; Wed, 09 Oct 2024 23:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815230.1228927; Wed, 09 Oct 2024 23:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfhW-0008LE-8H; Wed, 09 Oct 2024 23:02:38 +0000
Received: by outflank-mailman (input) for mailman id 815230;
 Wed, 09 Oct 2024 23:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syfhU-0008L8-K2
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 23:02:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91070c84-8692-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 01:02:34 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728514947553573.4279269426861;
 Wed, 9 Oct 2024 16:02:27 -0700 (PDT)
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
X-Inumbo-ID: 91070c84-8692-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728514949; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c3pjqgtkatVl1PNwa8FUY7slTUJKjTfKcBthAaC0qNPoBRgLvG7mR2cLDyDk+oHQlBjlWOChoC19ccxBUcdDej0BGP7RJ6sVrDiXu0PyxJYBeVDQzHWOgL/LPlNDvO7fz/8ofPdLuLX+tlqPaYjvgWpMUxr0Qty5B0qNU+KecI4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728514949; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SAnC+XuwE2vPUA4p76OfETaHdgWQbbG1uggtB0/wKFY=; 
	b=VJFWRKj+REOsLg02QAt5pQ3RQsTdto46hiBgh+keYnlbE2aZ/9C+iIIq6/j7Q6UZjvVYpzIAVxPdfubkSNWChU+Pz4Q9kOOWXlYyLWUseVNt37OorAgZT18XXMp3/DQHwnlez0eTEqIVqhI6CWUHnt92KHIp148Kde1qnBrVa28=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728514949;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SAnC+XuwE2vPUA4p76OfETaHdgWQbbG1uggtB0/wKFY=;
	b=gvCMIlw0oNorpJ8VQPudslQwenlth4yjWdrqCZIL3hg0SqQ/P+90AYwcm5jxIyfP
	M5ujK9nCSQGCKeGL3fk4BjbQrLSkyCHJ7+ty1EKGnvSsA+narJQ0NWKQ/Q2cakk/e2z
	DVBVST8b+20y26eVUdP+qR2m8mZXQPPP3+MDy24I=
Message-ID: <70d98462-8006-4ae2-9774-f21152be2362@apertussolutions.com>
Date: Wed, 9 Oct 2024 19:02:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/44] x86/boot: convert create_dom0 to use boot info
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-26-dpsmith@apertussolutions.com>
 <1bc18234-2e50-467d-875a-3968165f5570@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <1bc18234-2e50-467d-875a-3968165f5570@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 12:52, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> This commit changes create_dom0 to no longer take the individual 
>> components and
>> take struct boot_info instead. Internally, it is changed to locate the 
>> kernel
>> and ramdisk details from struct boot_info.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 0d2ee19998aa..c2bcddc50990 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -946,10 +946,8 @@ static unsigned int __init copy_bios_e820(struct 
>> e820entry *map, unsigned int li
>>       return n;
>>   }
>> -static struct domain *__init create_dom0(const module_t *image,
>> -                                         unsigned long headroom,
>> -                                         module_t *initrd, const char 
>> *kextra,
>> -                                         const char *loader)
>> +static struct domain *__init create_dom0(const struct boot_info *bi,
>> +                                         const char *kextra)
>>   {
>>       static char __initdata cmdline[MAX_GUEST_CMDLINE];
>> @@ -964,9 +962,21 @@ static struct domain *__init create_dom0(const 
>> module_t *image,
>>               .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED 
>> : 0,
>>           },
>>       };
>> +    int headroom, mod_idx = first_boot_module_index(bi, 
>> BOOTMOD_RAMDISK);
> 
> I think headroom should stay unsigned long, which matches struct 
> boot_module.

Yes, that was not intentional. Will preserve the size.

> With that
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

