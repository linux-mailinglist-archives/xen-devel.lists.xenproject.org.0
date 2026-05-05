Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGUcM8VV+mmNMgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:40:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E764D3BAE
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 22:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301098.1575439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKMYM-0005oo-VO; Tue, 05 May 2026 20:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301098.1575439; Tue, 05 May 2026 20:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKMYM-0005mO-Sn; Tue, 05 May 2026 20:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1301098;
 Tue, 05 May 2026 20:39:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wKMYL-0005mI-Np
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:39:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKMYL-006JzV-4k
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 22:39:37 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 69fa5589-2eae-0a2a0a5409dd-0a2a4507df40-0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 22:39:37 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 69fa5587-229c-0a2a45070019-888fbc3352be-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 22:39:36 +0200
Received: by mx.zohomail.com with SMTPS id 1778013565284692.9140756033918;
 Tue, 5 May 2026 13:39:25 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778013568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fdvo+7ThLN5jMZJStd9qYcScfM3HotMoTGfOsksKBK57IamhYTHwIU+JJB7od9l84jV1jIJdeDS+3LYoDiGgWQc3/UaIuSMVuwZLgX+pOpIcEImCcbOigakt87KCUqalnhlefeWiOR7rFOKp4WxukwivKkj73Rhecuq5ZjwOMFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778013568; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KOuaFhoFvTlT5kNzqoeorQp/xZ922AkKTe5UI5FSTls=; 
	b=Wp6VG+dGY5y7YDr8fs31QaSzxoxv0B7+8hcG7KhdG3yjiJXTxhDt4tSiUJs0WvlYhK7yrIkfW2PzKDOx8w+bVeQ1iJuYam3zywX2i087td8Ux8+ljrobpJeY0IniCbvgVRpbmPXlQTjs0FmNhge0VspnjiQEgYxRDMd+epnF9Rw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778013568;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KOuaFhoFvTlT5kNzqoeorQp/xZ922AkKTe5UI5FSTls=;
	b=PHdMvxcFd+qsfbCCh3I6+GKiwIt83u9XtP3cobgiEXahILK+YEo8xQ8IIm9wLTxH
	wAwo8RGnA3qR8LM7FijMMEC7xLanILOLkQr/m6LzaDPN8/Q08mpqFMJHigmVCuSyXZn
	FGQGeTSOmwItGMbGcBKU+bcZOisf5JF4EVMHecp8=
Message-ID: <2c747296-5f18-406f-9a78-4deabdc27ac1@apertussolutions.com>
Date: Tue, 5 May 2026 16:39:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH] EFI: adjust cfg file buffer freeing
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
 <d22d841f-a694-4527-bc50-235e2525a0d3@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <d22d841f-a694-4527-bc50-235e2525a0d3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ef75cf/1778013577-2B175C48-0E11125E/0/0
X-purgate-type: clean
X-purgate-size: 2843
X-Rspamd-Queue-Id: 38E764D3BAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:marmarek@invisiblethingslab.com,m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[10.42.69.7:server fail,192.237.175.120:server fail,136.143.188.51:server fail,195.190.135.10:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]

On 5/4/26 09:30, Jan Beulich wrote:
> On 22.04.2026 13:51, Jan Beulich wrote:
>> The boot services FreePages() needs passing the size. Since we allocated
>> one more byte to put a trailing nul there, we also need to bump the size
>> passed there. Make a small helper function to centralize this.
>>
>> Note that there's no permanent memory leak because of the oversight: The
>> allocation is done using EfiLoaderData, and all memory of that type is
>> later reclaimed anyway.
>>
>> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
>> Reported-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Marek, Daniel?
> 
> Thanks, Jan
> 
>> ---
>> This is an alternative proposal to
>> https://lists.xen.org/archives/html/xen-devel/2026-04/msg01044.html.
>>
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -778,6 +778,16 @@ static void __init efi_relocate_esrt(EFI
>>    */
>>   #include "efi-boot.h"
>>   
>> +static void __init free_cfg(void)
>> +{
>> +    if ( !cfg.need_to_free )
>> +        return;
>> +
>> +    /* One extra byte was allocated to put a nul character there. */
>> +    efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size + 1));
>> +    cfg.need_to_free = false;
>> +}
>> +
>>   void __init noreturn blexit(const CHAR16 *str)
>>   {
>>       if ( str )
>> @@ -787,8 +797,7 @@ void __init noreturn blexit(const CHAR16
>>       if ( !efi_bs )
>>           efi_arch_halt();
>>   
>> -    if ( cfg.need_to_free )
>> -        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>> +    free_cfg();
>>       if ( kernel.need_to_free )
>>           efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
>>       if ( ramdisk.need_to_free )
>> @@ -1557,11 +1566,7 @@ void EFIAPI __init noreturn efi_start(EF
>>               name.s = get_value(&cfg, "global", "chain");
>>               if ( !name.s )
>>                   break;
>> -            if ( cfg.need_to_free )
>> -            {
>> -                efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>> -                cfg.need_to_free = false;
>> -            }
>> +            free_cfg();
>>               if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
>>               {
>>                   PrintStr(L"Chained configuration file '");
>> @@ -1631,11 +1636,7 @@ void EFIAPI __init noreturn efi_start(EF
>>   
>>           efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
>>   
>> -        if ( cfg.need_to_free )
>> -        {
>> -            efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>> -            cfg.need_to_free = false;
>> -        }
>> +        free_cfg();
>>   
>>           if ( dir_handle )
>>               dir_handle->Close(dir_handle);
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

