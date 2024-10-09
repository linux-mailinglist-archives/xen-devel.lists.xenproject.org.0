Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B7997179
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814941.1228651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZYq-0000Xq-NG; Wed, 09 Oct 2024 16:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814941.1228651; Wed, 09 Oct 2024 16:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZYq-0000WL-Kb; Wed, 09 Oct 2024 16:29:16 +0000
Received: by outflank-mailman (input) for mailman id 814941;
 Wed, 09 Oct 2024 16:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syZYo-0000WF-Nt
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:29:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d54490e-865b-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 18:29:12 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728491345789410.4241872235532;
 Wed, 9 Oct 2024 09:29:05 -0700 (PDT)
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
X-Inumbo-ID: 9d54490e-865b-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728491348; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gE7n3yYYkp6jbMJorJ7rq/JMAaCIrQ1pPEu9O9z0W+h5t9MdkFd16c+yufisVHsaBQ7k30AX4Dz87iVd8ZdeSHjdAkhY+6Zz5jtQmmF6x5vZRW19CO9o+A2pAZ7U+Mwry3Y7ykUMTEwpHopG1xfooMs+Wv0gIObUib/GADqRDiQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728491348; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+2gPMiHS+vA4QE7GFs3r3BlXAMXgDCVwZrO265d0nZc=; 
	b=gyDZLQT3cVc9MW9dv0Qbn2b9e+ebFTYCuCCEEgo7HfUGYylbZ2X1fZ9F5RFMTNL4u69hzR5pZ2DVP7PgBySW+sxywfo3cVh1W/FpfCxPDci6HxEyB+d4r2qsz8GwIxkCF0Njo8eUFSEbul+rW2pm6morgMb0wsLRnFbRO+41fV8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728491347;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+2gPMiHS+vA4QE7GFs3r3BlXAMXgDCVwZrO265d0nZc=;
	b=NLgs+MxZKvc7XLUHsHmAMSGJrJbu7Md2zHWwBNNHeehp/AxCUj5i4sHp1vLS//bU
	eb4fnbzUvzsSReA0IeyLOaxXnUr7LNBjmt12b8IZ78p5CAJQp6UbhCCPeTKklMWZ4qU
	yyHPIEnSNkBdvUhC6Pk0TDLExelFvmjgRIP7bhqQ=
Message-ID: <c5cf3f96-c2fb-44da-be7c-cdd9f7e3bf44@apertussolutions.com>
Date: Wed, 9 Oct 2024 12:29:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/44] x86/boot: use consumed boot module flag for
 microcode
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-20-dpsmith@apertussolutions.com>
 <f2711741-5e05-4ad4-af33-6df18b09fb1e@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f2711741-5e05-4ad4-af33-6df18b09fb1e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 11:56, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> To track if the microcode boot module was loaded, a copy of the boot 
>> module is
>> kept. The size element of this copy is set to zero as the indicator 
>> that the
>> microcode was loaded. A side effect is that the modules have to be 
>> rescanned to
>> find the boot module post-relocation, so the cache copy can be created.
>>
>> Use the consumed boot module flag to track the loading of the 
>> microcode boot
>> module. This removes the need to manipulate the boot module size 
>> element, no
>> longer requiring the copy, thus allowing it to be replaced by a 
>> reference. As a
>> result it is no longer necessary to rescan the boot modules after 
>> relocation
>> has occurred.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/cpu/microcode/core.c | 28 ++++++++++++++--------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/core.c 
>> b/xen/arch/x86/cpu/microcode/core.c
>> index 7bcc17e0ab2f..5b42aad2fdd0 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
> 
>> @@ -826,14 +826,14 @@ int __init microcode_init_cache(
>>       if ( !ucode_ops.apply_microcode )
>>           return -ENODEV;
>> -    if ( ucode_scan )
>> -        /* Need to rescan the modules because they might have been 
>> relocated */
>> +    /* Scan if microcode was not detected earlier */
>> +    if ( !ucode_mod )
> 
> ucode_scan is a user-controlled variable (ucode=scan=$bool), so I think 
> it still needs to be respected.

The ucode_scan was introduced due to the complex situation attempting to 
be addressed. The microcode needs to be loaded earlier before it is 
possible to safely store a cached copy. Multiboot's module_t had no 
method of state tracking, identification and consumption. To address 
this short coming, the early loading made a copy of the module so it 
could use the mod_end field as a flag without breaking the relocation
logic later. And now because it made a copy instead of holding a 
reference, when the relocation occurs, the mod_start is no longer valid. 
I am not sure why the scan was a user exposed flag, but with boot_module
having identification and state, it is no longer necessary to hold a 
copy and a reference can now be used. Since it is now a reference, when 
the relocation occurs, there is no longer a need to rescan because of a 
relocation. I did leave a rescan if there wasn't microcode detected 
during the early load. Though, honestly that probably should go since it 
should be the exact same modules that were scanned during early load.

>>           microcode_scan_module(module_map, bi);
>> -    if ( ucode_mod.size )
>> -        rc = early_update_cache(bootstrap_map_bm(&ucode_mod),
>> -                                ucode_mod.size);
>> -    else if ( ucode_blob.size )
>> +    if ( ucode_mod && !(ucode_mod->flags & BOOTMOD_FLAG_X86_CONSUMED) )
>> +        rc = early_update_cache(bootstrap_map_bm(ucode_mod),
>> +                                ucode_mod->size);
>> +    else if ( ucode_mod && ucode_blob.size )
> 
> ucode_blob seems independent of ucode_mod, so I don't see why this 
> didn't stay `else if ( ucode_blob.size )`
 From my inspection, looks like that should have been an '||" and not a 
'&&'. The reason being is that the function will fall back to ucode_mod 
if ucode_blob is not set.

v/r,
dps


