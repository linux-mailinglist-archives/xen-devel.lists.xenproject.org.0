Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA1498782A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 19:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805828.1217066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strz3-0002hx-5U; Thu, 26 Sep 2024 17:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805828.1217066; Thu, 26 Sep 2024 17:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strz3-0002f9-2n; Thu, 26 Sep 2024 17:08:53 +0000
Received: by outflank-mailman (input) for mailman id 805828;
 Thu, 26 Sep 2024 17:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1strz1-0002dm-LJ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 17:08:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fea9a254-7c29-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 19:08:49 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727370511156139.12785590247825;
 Thu, 26 Sep 2024 10:08:31 -0700 (PDT)
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
X-Inumbo-ID: fea9a254-7c29-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727370513; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KXFZscra8PfEItn3jI/KDkBrT2dcwHq0ZKKoIcSopu7xoF5hqumOaf35wAwYC0Q8ajy8Cqm+gQY3mqM9V+ReD07JCP7IMY8NIRH6aH+fLzkNMyvHNLfZO/nsjlz0WR8goT8R/DL2qHhJKkHDccN+e7pCDDMI93oX1K0sGys09SQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727370513; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w48LFyEb8d2m1NrEbm3POZmrm+zZSKvatsXhy1kVtwA=; 
	b=Uv2+upA7+iq86yaPiQNoLuFEHHgV78SWE9qf1NTdm33dXNkiBVTkhDWDGz5PXWeCX9aOmde9jJ+hcLknsjqvu0UAuNqrXsf4lq2FegQ687fmQIav1twIlmRSZv8tXgy6x4ORkBB97COcvJlA/oSr1tFaaxahdiFQXgUewfem5VU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727370513;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w48LFyEb8d2m1NrEbm3POZmrm+zZSKvatsXhy1kVtwA=;
	b=sYcKVTmx1mhonWBwunyzk2eRLhvHfSwsWLLsk4DdnMWsEJ/DR3QB7dgrjeRr62nR
	cnDF77xfgVlN3t7XUsD/nX4wgiEmL7z9Ze7LzTgNEzAIzxuZT9FI43oQiwavcJ4ztH+
	oGdLUveuPIdNvYKWb+8CDx16BwmXorw38dKZV8YU=
Message-ID: <a913ea8d-0c08-44f0-845f-cb9402b93dc9@apertussolutions.com>
Date: Thu, 26 Sep 2024 13:08:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/44] x86/boot: update struct boot_module on module
 relocation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-14-dpsmith@apertussolutions.com>
 <c5a44f74-9aa8-468b-9125-3c9f903e4dea@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <c5a44f74-9aa8-468b-9125-3c9f903e4dea@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/3/24 19:48, Andrew Cooper wrote:
> On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 021c5699f86c..27517d24b2ea 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1408,8 +1408,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>            * respective reserve_e820_ram() invocation below. No need to
>>            * query efi_boot_mem_unused() here, though.
>>            */
>> -        boot_info->mods[idx].early_mod->mod_start = virt_to_mfn(_stext);
>> -        boot_info->mods[idx].early_mod->mod_end = __2M_rwdata_end - _stext;
>> +        boot_info->mods[idx].start = boot_info->mods[idx].early_mod->mod_start
>> +                                   = virt_to_mfn(_stext);
>> +        boot_info->mods[idx].size = boot_info->mods[idx].early_mod->mod_end
>> +                                  = __2M_rwdata_end - _stext;
> 
> MISRA objects to using a = b = c; syntax, and we're being asked to take
> it out elsewhere.
> 
> It would be best to make local start/size variables, and the resulting
> code will have less churn through the rest of the series.

I will drop the "a = b =c;" syntax and update appropriately.

v/r,
dps

