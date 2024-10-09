Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1173997942
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 01:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815279.1228987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sygKg-0006SP-H9; Wed, 09 Oct 2024 23:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815279.1228987; Wed, 09 Oct 2024 23:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sygKg-0006PN-EU; Wed, 09 Oct 2024 23:43:06 +0000
Received: by outflank-mailman (input) for mailman id 815279;
 Wed, 09 Oct 2024 23:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sygKe-0006PF-NS
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 23:43:04 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c6f7c2-8698-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 01:43:03 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728517376969820.0426571379464;
 Wed, 9 Oct 2024 16:42:56 -0700 (PDT)
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
X-Inumbo-ID: 38c6f7c2-8698-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728517378; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BTpm3aCLzfSJL/phcwNY+GLhBEwxOAO4MBH68OXg7nrG4FWC9ahH6RzIxLRpf5gCICKpF/6RyMu61Lj3XjzB/OM3ySCoz3iVvplSriUGFuRzEAPYOQtvQpqZcxGMX5qng18434BH8rbsWjCByAayPyDBc5AQ6B3JIH+E1wgoOxY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728517378; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qyC08CdODhZj8RVx6TF3gtfgjUytTLbNVkzSL5HWZzE=; 
	b=A+1Ij08ekBJns9hoZP4kR61hUYgAxaUjQ/Ge3cQAXNO1Fuwwadga1mMH8HANLKalbuJ/HdXXuNE9rFAHAYht034Bw13mjPoIslJnca4vu9q+lvErNQ3edMy3JdZqzqo0nex4yTULR2vvNq8H1yYLDf+5yEbTFU0q/a8N32HpW9Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728517378;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qyC08CdODhZj8RVx6TF3gtfgjUytTLbNVkzSL5HWZzE=;
	b=qZpOtcpHya3Kc8PKqRU9ZrzzfBEAHC+IbrUQUt7sJnj+stuFqUrFpVXIkrBSZRrV
	7FW80nzkd04x3cqigUx7D9tJ0qq3OwXXKiMIg9vAuNt6viaSf404H971M7u44+tLj/A
	Al/3+wgnEPBYb4Ny/ytWu87LlSrRo0kxYWimz6K0=
Message-ID: <8089b4b4-ac1c-4eec-9ee6-8fe5806d32ba@apertussolutions.com>
Date: Wed, 9 Oct 2024 19:42:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 36/44] x86/boot: remove remaining early_mod references
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-37-dpsmith@apertussolutions.com>
 <52ccddc1-762a-440d-bd27-8d9e9c507c7b@amd.com>
 <c2914ba3-0f6a-49fc-aae3-d7e5f465860c@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c2914ba3-0f6a-49fc-aae3-d7e5f465860c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 02:53, Jan Beulich wrote:
> On 08.10.2024 21:15, Jason Andryuk wrote:
>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>> Any direct usages of struct mod have been transitioned, remove the remaining
>>> references to early_mod fields.
>>
>> This is unclear, please try to re-word.  "struct mod" and "early_mod"
>> don't exist.
>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>>    xen/arch/x86/setup.c | 31 +++++++++++--------------------
>>>    1 file changed, 11 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index e9e3da3204f1..0ffe8d3ff8dd 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>
>>> @@ -1404,16 +1401,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>             */
>>>            bi->mods[xen].start = virt_to_mfn(_stext);
>>>            bi->mods[xen].size = __2M_rwdata_end - _stext;
>>> -
>>> -        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
>>> -        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
>>>        }
>>>    
>>> -    bi->mods[0].headroom =
>>> -        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
>>> -                         bi->mods[0].mod->mod_end);
>>> -
>>> -    bootstrap_map(NULL);
>>> +    bi->mods[0].headroom = bzimage_headroom(
>>> +                        bootstrap_map_bm(&bi->mods[0]),
>>> +                        bi->mods[0].size);
>>
>> Thunderbird might corrupt this, bit the above can fit on two lines:
>>       bi->mods[0].headroom = bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
>>                                               bi->mods[0].size);
> 
> Or else at least indentation wants to change, to one of the two possible
> forms:
> 
>      bi->mods[0].headroom = bzimage_headroom(
>          bootstrap_map_bm(&bi->mods[0]),
>          bi->mods[0].size);
> 
> (indentation increased by a level from the start of the statement) or
> 
>      bi->mods[0].headroom = bzimage_headroom(
>                                 bootstrap_map_bm(&bi->mods[0]),
>                                 bi->mods[0].size);
> 
> (indentation by one level biased from the start of the function call).
> Personally, if already wrapping like this, I'd prefer the former.

I agree with you, the former is more pleasing, though wouldn't line 3 
fit on line 2?

v/r,
dps

