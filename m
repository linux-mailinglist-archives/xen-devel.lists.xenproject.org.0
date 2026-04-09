Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFeXLUO212lURwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:22:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286343CBF37
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277577.1562737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqGz-0004MN-9G; Thu, 09 Apr 2026 14:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277577.1562737; Thu, 09 Apr 2026 14:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqGz-0004JN-6R; Thu, 09 Apr 2026 14:22:21 +0000
Received: by outflank-mailman (input) for mailman id 1277577;
 Thu, 09 Apr 2026 14:22:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wAqGx-0004JH-GO
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:22:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqGw-00227Y-SQ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:22:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 69d7b60d-5cb7-0a2a0a5109dd-0a2a4502abf2-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:22:18 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 69d7b619-42fa-0a2a45020019-888fbc33526d-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:22:18 +0200
Received: by mx.zohomail.com with SMTPS id 177574452402699.36308080543574;
 Thu, 9 Apr 2026 07:22:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1775744526; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BfBSWefW1BhNediGuKRcHVfzOjDXKP7RxuS3imV/ZdAoUttTXSm+MwLL97bnDvBXC44cNyzlSuqEMJpGM8Hzbos2F8tsDe1BQUlGerPaq+qrSKD+FHlUlqZSLaoKcEGzVsDkmh2lJT9MITx05kuwbKvyeHVO3G4AXv8xe6rPN3Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775744526; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=imeMNDLn99b+xNdVIDfzn74PuiUbdT5o5oCsPuPIrz4=; 
	b=EzJka3odHO0oCAm+WHEhXLhP1h++cHUJxUQ13beB1Ymq0uu4AFeZWQ3qvNMRj1k5CnWSkap/+zsGqEsvhgTFHuOEw5P42ZXU8Fotxt7FdCAdgzqSLBF3tcdAJDF15kcqGGIGIwLoviBYqCccmObHsYRVZ0pFISc31WYACYkMF3Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775744526;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=imeMNDLn99b+xNdVIDfzn74PuiUbdT5o5oCsPuPIrz4=;
	b=Zlo119EeLYAZ9n/6kS+Auk28WE8X9OCjU+iz6sDCJp5Ar+UWC8L9CDwM9mN//F64
	3rNtmMxh3KJ3PLOvCEFVmC81cvelrOieFDa/59jdDhZMmjIHfka6SNYHe1RZmdEhiEq
	0LZjdnsE1b5+6Nvc/w0FEfRcAm95EIgnhsNmvq3M=
Message-ID: <2df92603-ab5e-4990-8a6a-e7a56d952243@apertussolutions.com>
Date: Thu, 9 Apr 2026 10:22:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Reduce ifdefary in efi_exit_boot()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20260409103805.176240-1-andrew.cooper3@citrix.com>
 <65b04675-abbf-413e-abe7-6cd463913fdd@suse.com>
 <04b9c465-4940-4a16-8abc-9c3440ab7337@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <04b9c465-4940-4a16-8abc-9c3440ab7337@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-720697/1775744538-AF52CCD1-5D14FBB5/0/0
X-purgate-type: clean
X-purgate-size: 3956
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 286343CBF37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 07:11, Andrew Cooper wrote:
> On 09/04/2026 12:01 pm, Jan Beulich wrote:
>> On 09.04.2026 12:38, Andrew Cooper wrote:
>>> Use IS_ENABLED() rather than #ifdef to give the compiler visibility into the
>>> block, which in turn removes the #ifdef from the varaible block.
>> Just to mention, if it was just / mainly ...
>>
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -1335,9 +1335,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>>>       EFI_STATUS status;
>>>       UINTN info_size = 0, map_key;
>>>       bool retry;
>>> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>>>       unsigned int i;
>>> -#endif
>> ... this to be got rid of, we could as well use ...
>>
>>> @@ -1371,31 +1369,32 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>>>       if ( EFI_ERROR(status) )
>>>           PrintErrMesg(L"Cannot exit boot services", status);
>>>   
>>> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>>> -    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>>      for ( unsigned int i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>>
>> now. But yes, the typo aspect you mention can be avoided altogether by what
>> you change things to.
> 
> I originally had this change in the patch, but it interferes with diff
> showing (just) an indentation change.
> 
> I'm not fussed either way.
> 
>>
>>> +    if ( IS_ENABLED(CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP) )
>>>       {
>>> -        EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>>> +        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>>> +        {
>>> +            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>>>   
>>> -        /*
>>> -         * Runtime services regions are always mapped here.
>>> -         * Attributes may be adjusted in efi_init_memory().
>>> -         */
>>> -        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
>>> -             desc->Type == EfiRuntimeServicesCode ||
>>> -             desc->Type == EfiRuntimeServicesData )
>>> -            desc->VirtualStart = desc->PhysicalStart;
>>> -        else
>>> -            desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
>>> -    }
>>> -    status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
>>> -                                          mdesc_ver, efi_memmap);
>>> -    if ( status != EFI_SUCCESS )
>>> -    {
>>> -        printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
>>> -               status);
>>> -        __clear_bit(EFI_RS, &efi_flags);
>>> +            /*
>>> +             * Runtime services regions are always mapped here.
>>> +             * Attributes may be adjusted in efi_init_memory().
>>> +             */
>>> +            if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
>>> +                 desc->Type == EfiRuntimeServicesCode ||
>>> +                 desc->Type == EfiRuntimeServicesData )
>>> +                desc->VirtualStart = desc->PhysicalStart;
>>> +            else
>>> +                desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
>>> +        }
>>> +        status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
>>> +                                              mdesc_ver, efi_memmap);
>>> +        if ( status != EFI_SUCCESS )
>>> +        {
>>> +            printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
>>> +                   status);
>> Could I talk you into switching to
>>
>>              printk(XENLOG_ERR
>>                     "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
>>                     status);
>>
>> to make the line at least a little less long?
> 
> Ok, but I'm not going to resend just for that.
> 
> ~Andrew

I'm good with fix up on commit.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

