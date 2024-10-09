Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0606699793F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 01:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815269.1228976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sygIL-0005q4-1E; Wed, 09 Oct 2024 23:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815269.1228976; Wed, 09 Oct 2024 23:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sygIK-0005nV-Ud; Wed, 09 Oct 2024 23:40:40 +0000
Received: by outflank-mailman (input) for mailman id 815269;
 Wed, 09 Oct 2024 23:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sygIJ-0005nP-B1
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 23:40:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e17da568-8697-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 01:40:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728517229335309.92409351738786;
 Wed, 9 Oct 2024 16:40:29 -0700 (PDT)
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
X-Inumbo-ID: e17da568-8697-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728517230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lpd33y8lGMW0q4oA0MrEWTQiZX+za0w2Sh122zscYt+PjiTTe9Xim2DolmRjHeCXXESdzsjoixyX7vYs2cOoZ4qkMHKwkT1QnB67p2rGWoAWGR8CoihpuzAM7mRhrmCsumNihnHgGDSSnkMoa1VdVHmlxTvdmgDXIRYJwfJguE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728517230; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wEjUrgd2jp1hqRRrfbbzz70LLBIpzN+6eTdh8NGZVW0=; 
	b=cB3Ko2/vj0SqpucYlD964xEwJoimut26A9Kf4iEG6jHXRkb4bRBoHk35VOS29MQK88vekbdlPKQdef2/s2uhkNXv2opOCXGyoHS8wgqhIcNp6GxvMk3JfvIBvEGP8MDYW4WV6mE0qBc4V3/JVWSlJgUpx8ao7iZ7LKF99QHKrWg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728517230;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wEjUrgd2jp1hqRRrfbbzz70LLBIpzN+6eTdh8NGZVW0=;
	b=cEJqccTRA0jQu5euetp1dU5z9s3+CuCZKJGiwadYV9p0dMGohSBRc7jc93r6nNHo
	WDUuE7v01edtvbQTcggmW/19Ltl+jCyo73uF+v9y2E07drRtUHbLliNbgXxFfMXRiDm
	+fw3xGKE+M8nSZP04YwIyPqOSdx0vqh6roD8j5xo=
Message-ID: <a9f1ba12-4019-4961-a9b1-9d4a21ca5243@apertussolutions.com>
Date: Wed, 9 Oct 2024 19:40:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 36/44] x86/boot: remove remaining early_mod references
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-37-dpsmith@apertussolutions.com>
 <52ccddc1-762a-440d-bd27-8d9e9c507c7b@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <52ccddc1-762a-440d-bd27-8d9e9c507c7b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 15:15, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Any direct usages of struct mod have been transitioned, remove the 
>> remaining
>> references to early_mod fields.
> 
> This is unclear, please try to re-word.  "struct mod" and "early_mod" 
> don't exist.

Ack.

>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 31 +++++++++++--------------------
>>   1 file changed, 11 insertions(+), 20 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index e9e3da3204f1..0ffe8d3ff8dd 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> @@ -1404,16 +1401,12 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>            */
>>           bi->mods[xen].start = virt_to_mfn(_stext);
>>           bi->mods[xen].size = __2M_rwdata_end - _stext;
>> -
>> -        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
>> -        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
>>       }
>> -    bi->mods[0].headroom =
>> -        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
>> -                         bi->mods[0].mod->mod_end);
>> -
>> -    bootstrap_map(NULL);
>> +    bi->mods[0].headroom = bzimage_headroom(
>> +                        bootstrap_map_bm(&bi->mods[0]),
>> +                        bi->mods[0].size);
> 
> Thunderbird might corrupt this, bit the above can fit on two lines:
>      bi->mods[0].headroom = 
> bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
>                                              bi->mods[0].size);

I actually prefer the same formatting as Jan has suggested, will apply 
that one.

>> +    bootstrap_map_bm(NULL);
>>   #ifndef highmem_start
>>       /* Don't allow split below 4Gb. */
> 
>> @@ -1708,8 +1699,8 @@ void asmlinkage __init noreturn 
>> __start_xen(unsigned long mbi_p)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        set_pdx_range(paddr_to_pfn(bi->mods[i].mod->mod_start),
>> -                      paddr_to_pfn(bi->mods[i].mod->mod_start) +
>> +        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
>> +                      paddr_to_pfn(bi->mods[i].start) +
> 
> This belongs in patch 14 as mentioned there.

Ack.

v/r,
dps

