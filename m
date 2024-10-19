Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A259A4D9A
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 14:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822489.1236461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t28AE-0004Ij-SL; Sat, 19 Oct 2024 12:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822489.1236461; Sat, 19 Oct 2024 12:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t28AE-0004H8-Pb; Sat, 19 Oct 2024 12:02:34 +0000
Received: by outflank-mailman (input) for mailman id 822489;
 Sat, 19 Oct 2024 12:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t28AE-0004Gh-7b
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 12:02:34 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04fbc5fe-8e12-11ef-a0be-8be0dac302b0;
 Sat, 19 Oct 2024 14:02:33 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729339344445472.78716576219813;
 Sat, 19 Oct 2024 05:02:24 -0700 (PDT)
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
X-Inumbo-ID: 04fbc5fe-8e12-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729339345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mgESEPhQeGKFaTKgVEZDHqRI4dbH7bB0TX05EcNLAYjbdEa/JtUg1uVmZpaY3AQ/vbkNYgD2ogoIKfaC8iH/w3lJXtN4QWOa1PnyLgJ6uFeG7bRzcXciLaJOy7+H7OhTmoHaJkWwTcT2EhaSamO3GVh36kX5cn9wgnvZSM8SdjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729339345; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iRk+UeqORKfqBassxklkpgtIy64S1iDTrldwYgFsmTM=; 
	b=ZtqKtO5xeH5rFd4DFT8LMjoZNPaWgX0HZXPP3I5eYUjgkog+oXHFYnOpFMrvEkJeA0QSbZnJ4HSRiUqd6IdNi/MDVpSKPnc/DqcrYu5PuGPAPmcegPrZ4cGUgPOJlqSQmQoc69C/MbA5663xg/aqkPXQyfHqDmJA06td/KnHl80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729339345;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iRk+UeqORKfqBassxklkpgtIy64S1iDTrldwYgFsmTM=;
	b=KPiUuvqTudu+UoSzmvgqE4+s3flq1gyEicnUveinpIRDw+tPncH68K7YHd4qX8ey
	l5EaFYqpFRkPIDT772OSi/j9vW/wwdCExB9jI23HZ4yzmMTmOTzBM6ihuMgy6DAkL9b
	PLEb6WYHElVi4xlssgU4JcL3cwm2pLyLlC+y3lvk=
Message-ID: <11ed10c8-3c6b-45cc-8d03-e8449ce9f7d0@apertussolutions.com>
Date: Sat, 19 Oct 2024 08:02:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/44] x86/boot: transition relocation calculations to
 struct boot_module
To: Jan Beulich <jbeulich@suse.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-14-dpsmith@apertussolutions.com>
 <a94f876a-5f9a-4f21-be28-f4192c991337@amd.com>
 <cd25c03d-456d-49a8-a832-e8ec02b69108@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <cd25c03d-456d-49a8-a832-e8ec02b69108@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/18/24 02:39, Jan Beulich wrote:
> On 18.10.2024 02:42, Jason Andryuk wrote:
>> On 2024-10-17 13:02, Daniel P. Smith wrote:
>>> @@ -1686,12 +1682,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>    
>>>        for ( i = 0; i < bi->nr_modules; ++i )
>>>        {
>>> -        set_pdx_range(bi->mods[i].mod->mod_start,
>>> -                      bi->mods[i].mod->mod_start +
>>> -                      PFN_UP(bi->mods[i].mod->mod_end));
>>> -        map_pages_to_xen((unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
>>> -            _mfn(bi->mods[i].mod->mod_start),
>>> -            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
>>> +        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
>>> +                      paddr_to_pfn(bi->mods[i].start) +
>>> +                      PFN_UP(bi->mods[i].size));
>>> +        map_pages_to_xen((unsigned long)maddr_to_virt(bi->mods[i].start),
>>> +            maddr_to_mfn(bi->mods[i].start),
>>> +            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);
>>
>> I would vertically align all the parameters inside the (.
> 
> At the very least the two successive calls want formatting the same way.
> Plus imo the presented formatting of map_pages_to_xen() isn't "legal"
> anyway, it ought to be
> 
>          map_pages_to_xen(
>              (unsigned long)maddr_to_virt(bi->mods[i].start),
>              maddr_to_mfn(bi->mods[i].start),
>              PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);

Agreed, will change to the above.

v/r,
dps

