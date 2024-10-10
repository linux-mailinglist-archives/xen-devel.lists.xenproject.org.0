Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9B998408
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 12:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815992.1230171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqbs-00039l-7e; Thu, 10 Oct 2024 10:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815992.1230171; Thu, 10 Oct 2024 10:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqbs-00038G-4I; Thu, 10 Oct 2024 10:41:32 +0000
Received: by outflank-mailman (input) for mailman id 815992;
 Thu, 10 Oct 2024 10:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syqbq-000385-4d
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 10:41:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 331f2d59-86f4-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 12:41:27 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728556878166713.366960414581;
 Thu, 10 Oct 2024 03:41:18 -0700 (PDT)
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
X-Inumbo-ID: 331f2d59-86f4-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728556880; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fHL6xernUjRsjSX4fzyGa/XqYy+89zhT7v0uZFu/iKpbVSeHQg0jChMkzMTejT6/x1AhTVDejjj1JxoKQvo+zFf9avm2V0lV3nA+ygoxLZ03hIi5lpSXrPmCqifAFN9qPI64GMN2jIaY95U6KXIgVhvyKzbZLaHkUgx1gwcXHu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728556880; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vk4Y92tpto3xRUB9BVwerBFdaFraJtDzLS6DK9vaRQ0=; 
	b=J8g/JWmo6g1z5raRWJUNE78xNzubvJTERA8EYoEnIz/l8YsJMtn7gBV8ZlieLp1qCvbJcC3L7YfkkFa5kHlbKrIiHknx6bSs3Pc1TvxMtLuJ/UTCMp15NxXzBUw6hRs81ro/arbOC7higXs39q9xfa756YpAhjs4M9TIlTm3ZZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728556880;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Vk4Y92tpto3xRUB9BVwerBFdaFraJtDzLS6DK9vaRQ0=;
	b=bmvhejVbyO6HarPEL3+YlaY8J2eFXBusjDYY453Z3Uf8gmJWiirO4kF6Xn7qDdg8
	HblkmHuJ0Mnpm8w3YGqOXf/TFb+MEz7T9eUVbgHJ4d+9LYNhXFw66t+3rsBM0YBF44N
	cBbJp3si/bzdwiZAmKRugiiGurd4HWtsrvq74DxE=
Message-ID: <eb9319d3-aa71-4b98-b32f-2fcbec474579@apertussolutions.com>
Date: Thu, 10 Oct 2024 06:41:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/44] x86/boot: convert create_dom0 to use boot info
To: Jan Beulich <jbeulich@suse.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-26-dpsmith@apertussolutions.com>
 <1bc18234-2e50-467d-875a-3968165f5570@amd.com>
 <70d98462-8006-4ae2-9774-f21152be2362@apertussolutions.com>
 <e68ea3c0-f454-4773-89b1-affbc0d347a3@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e68ea3c0-f454-4773-89b1-affbc0d347a3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/10/24 04:03, Jan Beulich wrote:
> On 10.10.2024 01:02, Daniel P. Smith wrote:
>> On 10/8/24 12:52, Jason Andryuk wrote:
>>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>>> This commit changes create_dom0 to no longer take the individual
>>>> components and
>>>> take struct boot_info instead. Internally, it is changed to locate the
>>>> kernel
>>>> and ramdisk details from struct boot_info.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>    xen/arch/x86/setup.c | 25 ++++++++++++++++---------
>>>>    1 file changed, 16 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>> index 0d2ee19998aa..c2bcddc50990 100644
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -946,10 +946,8 @@ static unsigned int __init copy_bios_e820(struct
>>>> e820entry *map, unsigned int li
>>>>        return n;
>>>>    }
>>>> -static struct domain *__init create_dom0(const module_t *image,
>>>> -                                         unsigned long headroom,
>>>> -                                         module_t *initrd, const char
>>>> *kextra,
>>>> -                                         const char *loader)
>>>> +static struct domain *__init create_dom0(const struct boot_info *bi,
>>>> +                                         const char *kextra)
>>>>    {
>>>>        static char __initdata cmdline[MAX_GUEST_CMDLINE];
>>>> @@ -964,9 +962,21 @@ static struct domain *__init create_dom0(const
>>>> module_t *image,
>>>>                .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED
>>>> : 0,
>>>>            },
>>>>        };
>>>> +    int headroom, mod_idx = first_boot_module_index(bi,
>>>> BOOTMOD_RAMDISK);
>>>
>>> I think headroom should stay unsigned long, which matches struct
>>> boot_module.
>>
>> Yes, that was not intentional. Will preserve the size.
> 
> And just to mention, with what was said on another patch mod_idx also
> shouldn't be plain int.

Correct, and I would like to think that the compiler would flag a type 
mismatch if I missed it.

v/r,
dps

