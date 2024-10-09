Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6179996E33
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:36:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814646.1228254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXnk-0002Uq-RS; Wed, 09 Oct 2024 14:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814646.1228254; Wed, 09 Oct 2024 14:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXnk-0002TO-Nk; Wed, 09 Oct 2024 14:36:32 +0000
Received: by outflank-mailman (input) for mailman id 814646;
 Wed, 09 Oct 2024 14:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syXnj-0002TI-77
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:36:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddac0804-864b-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:36:28 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728484580897303.3837773804188;
 Wed, 9 Oct 2024 07:36:20 -0700 (PDT)
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
X-Inumbo-ID: ddac0804-864b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728484584; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eDDi6d56+f4O1H86Z+8XvTNS0x8JoCQveOY0zmpXiyZf5ykaHnJg+gPWblHalBZ0a3+nGMA/esjrCrjcHY+fHc3JLtoeLguL4m5BV2BqQEd1XuY8FzoKSjSztCUjYYQrPURJkUSALaEKFFTogvJBzmc/vqsbcKh/GufK95PytTo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728484584; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SLIPpUZ70l5GUI38EgchFjbId7y/WR0TYtmCWwB+glY=; 
	b=EbTntArkS/6vge964VyIkq5ou1xqCRyJ8vDXT1BVP/nfDo1o3GYoWUR2cP9YMVzFkdXNYcX0skl1h61bHat0Z1HCc1rdSXWW7RTS4mhiBey9RlOPIxea9cSEbmiVrz6ZKz/QkrGzJrvy0qrfWPL5TMZfWgX+5mDodasN83bFP+I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728484584;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SLIPpUZ70l5GUI38EgchFjbId7y/WR0TYtmCWwB+glY=;
	b=djK0wUGbYKvUZGFKso1fFpyizg6mHOwEMQTSyf//2nkjmTPB4hqq/E9iSja4pTD2
	C6m7YA/e0S7FKT3Fa61fTlQZJ45i3BL+fpIpC+bki/LrO3/nuKChcob4rJcaaFyuSIG
	DCg+vcI8kUkhqUgjI48wYdyYfzxWf/wZszDj+o60=
Message-ID: <f301b94a-c054-410d-8927-bea8abe506fd@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:36:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/44] x86/boot: update struct boot_module on module
 relocation
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-14-dpsmith@apertussolutions.com>
 <87771eef-050a-4d2f-845f-cbb053be4f72@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <87771eef-050a-4d2f-845f-cbb053be4f72@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 16:31, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> When a boot module is relocated, ensure struct boot_module start and size
>> fields are updated along with early_mod.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 093a4f5380d1..f968758048ed 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1392,8 +1392,11 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>            * respective reserve_e820_ram() invocation below. No need to
>>            * query efi_boot_mem_unused() here, though.
>>            */
>> -        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
>> -        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
>> +        bi->mods[xen].start = virt_to_mfn(_stext);
>> +        bi->mods[xen].size = __2M_rwdata_end - _stext;
> 
> The last patch did:
> bi->mods[i].start = (paddr_t)mods[i].mod_start;
> 
> and start is a paddr_t.
> 
> Is virt_to_mfn() wrong?

Yah, that is seriously wrong. Will fix.

v/r,
dps

