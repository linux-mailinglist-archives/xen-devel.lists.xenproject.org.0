Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945CD26DA7C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 13:40:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIsGf-0005Ku-AW; Thu, 17 Sep 2020 11:40:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIsGd-0005Kp-KT
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 11:39:59 +0000
X-Inumbo-ID: fd2dbf9e-5b96-4f2e-8a16-b2379b8dae01
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd2dbf9e-5b96-4f2e-8a16-b2379b8dae01;
 Thu, 17 Sep 2020 11:39:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600342797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8m9m2H3gUk7qBXvtwK5/A2aoCFgrHegURWG8ZvjJJMw=;
 b=pboKoTcAtKgvQ5p7DiA8HmZ7STc+gp91jIrfirc+CGvJ5x7XL+gpjt8gsdopI57n1lrhf1
 ZQH5I3YgToY9XVBAZ6WsUR3pbrBpnaKHzvSHhbyBfksEu1+i3ErKaajSmC72MbLAcI9EC7
 LuKVWQSGdYHXeLOk21pTHXYMXcn4kBah+pZOvUlrJuQ7PcpS+ug8H3g9TzIyik7p+fzIcb
 qmngoOCvB4oLVzc0Z7mzoyWsg93XxI7FDkPirmvcRAPgXIqIO1S0Xmc/soG2wxs3hDdkZI
 vQjGGjykMwKQ/uw4S3HCZqsn4s71SU/2/f97iRl5cs/Aew0SFKpK01SO9kMwIQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89F89AE0C;
 Thu, 17 Sep 2020 11:40:31 +0000 (UTC)
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
 <37547ef8-7381-7a8e-b735-1633eab978a2@suse.com>
 <20200917111712.GC19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3532eb05-cab6-2b0a-f8c5-70275439fb02@suse.com>
Date: Thu, 17 Sep 2020 13:39:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917111712.GC19254@Air-de-Roger>
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

On 17.09.2020 13:17, Roger Pau Monné wrote:
> On Thu, Sep 17, 2020 at 12:56:41PM +0200, Jan Beulich wrote:
>> On 17.09.2020 12:45, Roger Pau Monné wrote:
>>> On Wed, Sep 16, 2020 at 02:20:54PM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/efi/stub.c
>>>> +++ b/xen/arch/x86/efi/stub.c
>>>> @@ -52,6 +52,13 @@ bool efi_enabled(unsigned int feature)
>>>>  
>>>>  void __init efi_init_memory(void) { }
>>>>  
>>>> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
>>>> +{
>>>> +    if ( start || end )
>>>
>>> Shouldn't this be start && end?
>>
>> This is consistent with "if ( !start && !end )" in the non-stub
>> function, which was there in v3 already.
> 
> Right, I certainly didn't catch that passing one as NULL would cause a
> deref there also.
> 
> I would be more comfortable with adding an ASSERT, but I'm not going
> to insist. IIRC there was a time when Xen running as a PVH guest (like
> in shim mode) would cause it to have a valid mapping at 0.

Well, apparently not anymore, or else v3 wouldn't have needed prompt
reverting. With ...

>>>> @@ -1417,8 +1419,18 @@ void __init noreturn __start_xen(unsigne
>>>>      if ( !xen_phys_start )
>>>>          panic("Not enough memory to relocate Xen\n");
>>>>  
>>>> +    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
>>>> +    if ( using_2M_mapping() )
>>>> +        efi_boot_mem_unused(NULL, NULL);
>>>
>>> This seems really weird IMO...
>>
>> What I didn't like about earlier versions was the exposure of
>> using_2M_mapping() outside of this CU. The way it works is
>> somewhat fragile, and hence I think limiting its exposure is a
>> win. This way there's also no x86-specific code in ebmalloc.c
>> anymore.
>>
>> I'm also slightly puzzled that you ask now when you had acked
>> this same construct in v3. It's really just the stub function
>> which has changed in v4.
> 
> Would you mind also adding a FIXME comment in efi_boot_mem_unused that
> setting ebmalloc_allocated to sizeof(ebmalloc_mem) will be removed
> once we can properly free the region regardless of whether 2M are
> being used?

... the two FIXMEs added, it is sufficiently clear that the goal
is for this to be transient only anyway. As said - I have a plan,
I just need to find the time to see if it works out.

> Seems like an abuse of that the function should be doing by passing
> NULL pointers to it, or maybe I'm just being dense.

In a way it is an abuse, I agree, with - as said - the goal of
avoiding to expose using_2M_mapping().

> With that:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks much.

Jan

