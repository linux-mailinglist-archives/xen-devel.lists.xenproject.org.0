Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EC926D9B2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 12:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIral-0001Dx-AV; Thu, 17 Sep 2020 10:56:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIraj-00017G-Mz
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 10:56:41 +0000
X-Inumbo-ID: 0f290a99-5f60-4f79-9b56-7ce9e98d92df
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f290a99-5f60-4f79-9b56-7ce9e98d92df;
 Thu, 17 Sep 2020 10:56:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600340200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smp+HZtLIFaJW2x0AdTVyW6m78N9DDk6a7gTgJktnw8=;
 b=foGGPAcCQMF5cdcOpQrk5T8HcexR4vhgUIDqXic/obTOgAog3dKn8/TlbBsIhsUfXusGY2
 irTCmYn3p+KiUMmFxRUsZ0cvsOy17U79Kn/Uob16S596rWAM7vSsJY+t00zA6uL3F2EE73
 Y4PzWps4rYo9BMhsNZ+IsdXZbYPv9SkarK+bkTi/TaOJABDgqIKQsIR8uCQTBZPyIuXHwe
 sBgvO1dHKUN+zGyyMHCKJRgo42e8cLt4yNRpkeszmGDCDg15E8fVAM7/CDaZYxKKDUoWg1
 laq62BOvzmKTgxPhgOMcnLPPp8CRZeHHJBuA8Z8/E80LpZEM2bUhglY6TSw5Hg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9277AF2A;
 Thu, 17 Sep 2020 10:57:13 +0000 (UTC)
Subject: Re: [PATCH v4] EFI: free unused boot mem in at least some cases
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
 <d8b1bcc8-ffcc-f7fe-b4ad-ce7dcdaed491@suse.com>
 <20200917104516.GB19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37547ef8-7381-7a8e-b735-1633eab978a2@suse.com>
Date: Thu, 17 Sep 2020 12:56:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917104516.GB19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.2020 12:45, Roger Pau Monné wrote:
> On Wed, Sep 16, 2020 at 02:20:54PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/efi/stub.c
>> +++ b/xen/arch/x86/efi/stub.c
>> @@ -52,6 +52,13 @@ bool efi_enabled(unsigned int feature)
>>  
>>  void __init efi_init_memory(void) { }
>>  
>> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
>> +{
>> +    if ( start || end )
> 
> Shouldn't this be start && end?

This is consistent with "if ( !start && !end )" in the non-stub
function, which was there in v3 already.

> Or else you might be de-referencing a NULL pointer?

Intentionally so: I'd view it as worse if we didn't fill *start
or *end if just one gets passed as NULL. The way it's done now
it'll be a reliable crash, as the v3 issue with the shim has
shown (where the if() here was missing).

>> @@ -1417,8 +1419,18 @@ void __init noreturn __start_xen(unsigne
>>      if ( !xen_phys_start )
>>          panic("Not enough memory to relocate Xen\n");
>>  
>> +    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
>> +    if ( using_2M_mapping() )
>> +        efi_boot_mem_unused(NULL, NULL);
> 
> This seems really weird IMO...

What I didn't like about earlier versions was the exposure of
using_2M_mapping() outside of this CU. The way it works is
somewhat fragile, and hence I think limiting its exposure is a
win. This way there's also no x86-specific code in ebmalloc.c
anymore.

I'm also slightly puzzled that you ask now when you had acked
this same construct in v3. It's really just the stub function
which has changed in v4.

>> @@ -36,17 +37,37 @@ void __init *ebmalloc(size_t size)
>>      return ptr;
>>  }
>>  
>> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
>> +{
>> +    if ( !start && !end )
>> +    {
>> +        ebmalloc_allocated = sizeof(ebmalloc_mem);
>> +        return false;
>> +    }
> 
> ... I would instead place the using_2M_mapping check here

As per above, this would mean x86-specific code here again.

> and return start = end in that case.

I don't think I understand this part, possibly starting with me
wondering whether you mean *start == *end (and implying they'd
be set to valid values first).

Jan

