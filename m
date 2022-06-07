Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBB53FFD3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 15:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343256.568553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZ4A-0000kt-DQ; Tue, 07 Jun 2022 13:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343256.568553; Tue, 07 Jun 2022 13:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZ4A-0000iI-A1; Tue, 07 Jun 2022 13:16:14 +0000
Received: by outflank-mailman (input) for mailman id 343256;
 Tue, 07 Jun 2022 13:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyZ48-0000iC-Hw
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 13:16:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbde11b7-e663-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 15:16:09 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654607754456498.10169702409087;
 Tue, 7 Jun 2022 06:15:54 -0700 (PDT)
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
X-Inumbo-ID: fbde11b7-e663-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; t=1654607759; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MMu85ma6SasvrDBt1w8Bx9KnKmR0DbGrJz2QIHYitIgB8ZNnhkZjZpp3CEeOX5kRRbwD9mjJW2uKiscVARr6cDX/s3tFDo9fx3GlugswaxNsFMH5mwbVDoApaDXuiPjUS3gYlXqTLHxMcw3G7A03w/UqKenfpbyBFNmro3jnIFs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654607759; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=caIyPaIFAl+kjEWmMLkymdTyCOuK766Y5p0fopuRovg=; 
	b=V3P0VwCAr54C6vYiv2cfoLtckWxvTdO7m9G6W7UzpKvVsGMjd3S2KXknURhxKnSxF62ip6+CUn0NjXLrk69VhCmXQ6eFy19W539+GUouH/SfJsjXI4X8z5/3Wg6Nc7L9ZOWUL2FwNObsPwMeRkHjLaLNJghdacq8g7z5/Oy2Uow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654607759;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=caIyPaIFAl+kjEWmMLkymdTyCOuK766Y5p0fopuRovg=;
	b=VgYuvbSVcQMO1Pq7SeqcUwYqIBNOpd1yLcQnM9Qi/FVvN4/uB5ykUEHMs8aGPvnN
	sgLIYFGPhGX4ezZDjYgkSya3JEi4gSJnBbcRez1SEPtD/3yrNxCEqpCCsHaWr+8Bd22
	dQBH++c+IzW0halCPSBr+Q6hc24ju/IAz4OwHIlM=
Message-ID: <6d6b14ad-2a0d-c7aa-d835-3131f83e0f68@apertussolutions.com>
Date: Tue, 7 Jun 2022 09:14:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
 <6f177e81-9c97-0f7f-2f79-88cc4db83e02@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
In-Reply-To: <6f177e81-9c97-0f7f-2f79-88cc4db83e02@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/31/22 15:07, Andrew Cooper wrote:
> On 31/05/2022 19:20, Daniel P. Smith wrote:
>> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
>> index 8dafbc9381..690fd23e9f 100644
>> --- a/xen/xsm/xsm_policy.c
>> +++ b/xen/xsm/xsm_policy.c
>> @@ -8,7 +8,7 @@
>>   *  Contributors:
>>   *  Michael LeMay, <mdlemay@epoch.ncsc.mil>
>>   *  George Coker, <gscoker@alpha.ncsc.mil>
>> - *  
>> + *
>>   *  This program is free software; you can redistribute it and/or modify
>>   *  it under the terms of the GNU General Public License version 2,
>>   *  as published by the Free Software Foundation.
>> @@ -32,14 +32,21 @@
>>  #ifdef CONFIG_MULTIBOOT
>>  int __init xsm_multiboot_policy_init(
>>      unsigned long *module_map, const multiboot_info_t *mbi,
>> -    void **policy_buffer, size_t *policy_size)
>> +    const unsigned char **policy_buffer, size_t *policy_size)
>>  {
>>      int i;
>>      module_t *mod = (module_t *)__va(mbi->mods_addr);
>> -    int rc = 0;
>> +    int rc = -ENOENT;
>>      u32 *_policy_start;
>>      unsigned long _policy_len;
>>  
>> +#ifdef CONFIG_XSM_FLASK_POLICY
>> +    /* Initially set to builtin policy, overriden if boot module is found. */
>> +    *policy_buffer = xsm_flask_init_policy;
>> +    *policy_size = xsm_flask_init_policy_size;
>> +    rc = 0;
>> +#endif
> 
> Does
> 
> if ( IS_ENABLED(CONFIG_XSM_FLASK_POLICY) )
> {
>     ...
> }
> 
> compile properly?  You'll need to drop the ifdefary in xsm.h, but this
> would be a better approach (more compiler coverage in normal builds).
> 
> Same for the related hunk on the DT side.

Yes, I know this pattern is used elsewhere, so it should work here fine.

>> +
>>      /*
>>       * Try all modules and see whichever could be the binary policy.
>>       * Adjust module_map for the module that is the binary policy.
>> @@ -54,13 +61,14 @@ int __init xsm_multiboot_policy_init(
>>  
>>          if ( (xsm_magic_t)(*_policy_start) == XSM_MAGIC )
>>          {
>> -            *policy_buffer = _policy_start;
>> +            *policy_buffer = (unsigned char *)_policy_start;
> 
> The existing logic is horrible.  To start with, there's a buffer overrun
> for a module of fewer than 4 bytes.  (Same on the DT side.)
> 
> It would be slightly less horrible as
> 
> for ( ... )
> {
>     void *ptr;
> 
>     if ( !test_bit(i, module_map) || mod[i].mod_end < sizeof(xsm_header) )
>         continue;
> 
>     ptr = bootstrap_map(...);
> 
>     if ( memcmp(ptr, XSM_MAGIC, sizeof(XSM_MAGIC)) == 0 )
>     {
>         *policy_buffer = ptr;
>         *policy_len = mod[i].mod_end;
> 
>         ...
>         break;
>     }
> 
>     bootstrap_map(NULL);
> }
> 
> because at least this gets rid of the intermediate variables, the buffer
> overrun, and the awkward casting to find XSM_MAGIC.

Since you were kind enough to take the time to write out the fix, I can
incorporate.

> That said, it's still unclear what's going on, because has_xsm_magic()
> says the header is 16 bytes long, rather than 4 (assuming that it means
> uint32_t.  policydb_read() uses uint32_t).
> 
> Also, policydb_read() uses le32_to_cpu() so the multiboot/dt checks are
> wrong on big-endian systems.
> 
> Also also, policydb_read() really doesn't need to make a temporary
> memory allocation to check a fixed string of fixed length.  This is
> horrible.
> 
> I suspect we're getting into "in a subsequent patch" territory here.

Unfortunately the scope of what this series started out to solve, not to
walk all the boot modules when no policy file is needed, and what the
reviewers have been requesting be addressed is continually diverging.
Granted, with the technical debt currently present in XSM, I understand
why this is occurring. Unfortunately, subsequent patch here means, going
on to my list of things I would like to fix/work on in XSM.

v/r,
dps


