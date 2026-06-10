Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DvOfH84xKWrOSAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:43:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6A4667F2A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 11:43:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fW21IiPf;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1334089.1597193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFSu-000879-8m; Wed, 10 Jun 2026 09:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334089.1597193; Wed, 10 Jun 2026 09:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFSu-00084d-4H; Wed, 10 Jun 2026 09:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1334089;
 Wed, 10 Jun 2026 09:43:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXFSs-00084X-MK
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:43:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXFSq-008h1W-Tb
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:43:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2931a3-e002-0a2a0a5209dd-0a2a4507d054-30
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:43:12 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2931b0-229c-0a2a45070019-d155d031d981-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:43:12 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-68852b58d87so12059912a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 02:43:12 -0700 (PDT)
Received: from [192.168.178.22]
 (dslb-002-205-069-250.002.205.pools.vodafone-ip.de. [2.205.69.250])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055308063sm1162843766b.48.2026.06.10.02.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 02:43:11 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781084592; x=1781689392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2n+Di/Xd5l9GTr0XiN4Ix0zlTO1tRT+Y3xoH/ywzVw=;
        b=fW21IiPf3whB+zn8SX0Lro6qstuU/TVhuvKrh5Gl9hG4JapxR6BIVeymfHnrLW3N3Y
         oKXitWWDFZxHIk2W/06ochQSzEISapWdwz68G00YUasQSQxtPajsEP6IfbFZ4zjTEF75
         7QmTiWlcGy20ySiWm1YtNbEYCRlut5mVrSHLDG+NcM/DG9ly8EPS9DdiikyGcxNQm8YQ
         sonoL2omzGdUN8zNoDN5hatn0Y2V/aMZ9mnoI5U/Lls6W7Dyx6qogKWwoFs3j3Y9ljb8
         P3zSkgXNFUBUYoVlRmA3cQGNQToEOA2wCUjZgiPMN6pwqG1b0AH09lVCNFCUUyjrmw52
         6epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781084592; x=1781689392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2n+Di/Xd5l9GTr0XiN4Ix0zlTO1tRT+Y3xoH/ywzVw=;
        b=dRxzIGSnnY0+cN88x+fvlYcMsx14nC7pNM4TICkHEfOaj7kyL29UBrC+kBu0cP0LC3
         5MB23JnHil6EQphqYcA9HkzaDGX+JTEXSwdGDxW/IdqvK+dINSl8f02fATGXbmY7/J8t
         T/3eRgDB3dCsMpjFh0R8SwOJ76U/hG6M2s2RLridD4oxFdVIgriXE3XN6md0pPVYYNj3
         OC0GRQDa6fpmUm1bN1hIBdIO59FIOF5qSdWI0HqLTbw1iJ95T8cM2av/7lZerk6KRieH
         T86+G64q343k6+GVeEetZ+2mlpOmSHMwhU6M3+SW5xGpfIazPvLGTVt6Rn1qfLIIDoJj
         mZDg==
X-Forwarded-Encrypted: i=1; AFNElJ/gJPNSxXwFsOmPilsK1+x6jhSudqOImvxSWhvoualPZ9kGR+oiOZgumBi/2UdqkEUam8dRlawm4VY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqiLuRkMLgFKlFgHwbEaCQ9U65pT4r5io3IJrXx28WLdgEDmmJ
	oC0IA5SRn8NXHr0vmpVu/qkzhxfxyIwswyZJQhIaKl8GW0NjHLXpd1LNsFTiU37clQ==
X-Gm-Gg: Acq92OHrzAjrrO4X3Ox651+tweFBIBfxSr3TsRVgMpK+fPuhZRa8TqZsDHbVqmZdUDl
	sJiW4PsivkWubIofj4m8Ycaer7Y6ZPY67/R97QX1C9GpnGuz2qzdpxlcK1aEMJwy1cv411C9T85
	ty1Zfz953cbR+ymqKKxv0RG4uknOppzawE34l2j8WLmjBVlaa4wm8Kh3CqXDJqzZf+P0SKAcRnZ
	u3UjN2n2HTVbJHobOZUs5+FbfJKllZW5T+jo94dnJuMkMXx1FPuAYsT2knzTo2UBU7acd30zWvU
	Y1xaAyg0d9IOkaRYJ99345+p4PDlqVBiSZ3s3oZD7eH6p6sdDkbQ5W8IgeY/Tj4a2w0neUFXZOn
	lVbKT1OeGSw47n0fX8ABaxP8NXzFmLrAZDcncwoUVhV9kXCURrlDkQDB6DO/P0YpcuHsR+I3Oty
	nyrhojSbxeBl5JioDQklF8j2Z4ityEgrohAQ1VM53r6jL9iNlzdrI3qgty9+82uy/cBZksm9e62
	EB2ND2ynpmBa9Y5pqgkUr2Xn50g
X-Received: by 2002:a17:907:c518:b0:bed:eb8b:d404 with SMTP id a640c23a62f3a-bf370866e4cmr1263043266b.16.1781084592250;
        Wed, 10 Jun 2026 02:43:12 -0700 (PDT)
Message-ID: <5bee4f94-b2d0-4802-a990-b2a378d2f838@suse.com>
Date: Wed, 10 Jun 2026 11:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com>
 <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
 <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com>
 <75e86d74-9fa1-4090-bea7-332ec31ffb90@suse.com>
 <CAHt6W4dfXdyw4dOkqoQzo0x4XRmLsHXkhhznov+KvanKBi9bWw@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAHt6W4dfXdyw4dOkqoQzo0x4XRmLsHXkhhznov+KvanKBi9bWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1781084592-0BF7EC48-F89BD14E/0/0
X-purgate-type: clean
X-purgate-size: 4739
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC6A4667F2A

On 06.06.2026 18:02, Frediano Ziglio wrote:
> Frediano
> 
> On Fri, 5 Jun 2026 at 08:45, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.06.2026 12:16, Frediano Ziglio wrote:
>>> On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 29.05.2026 17:35, Frediano Ziglio wrote:
>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>> @@ -162,8 +162,8 @@ SECTIONS
>>>>>         __note_gnu_build_id_end = .;
>>>>>    } PHDR(note) PHDR(text)
>>>>>  #elif defined(BUILD_ID_EFI)
>>>>> -  /* Workaround bug in binutils < 2.36 */
>>>>> -  . = ALIGN(32);
>>>>> +  /* align to satisfy UEFI CA memory mitigation */
>>>>> +  . = ALIGN(PAGE_SIZE);
>>>>>    DECL_SECTION(.buildid) {
>>>>>         __note_gnu_build_id_start = .;
>>>>>         *(.buildid)
>>>>> @@ -330,6 +330,7 @@ SECTIONS
>>>>>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
>>>>>
>>>>>  #ifdef EFI
>>>>> +  . = ALIGN(PAGE_SIZE);
>>>>>    .reloc ALIGN(4) : {
>>>>>      __base_relocs_start = .;
>>>>>      *(.reloc)
>>>>> @@ -355,6 +356,7 @@ SECTIONS
>>>>>    VIRT_START &= 0;
>>>>>    ALT_START &= 0;
>>>>>
>>>>> +  . = ALIGN(PAGE_SIZE);
>>>>>    .sbat (NOLOAD) : { *(.sbat) }
>>>>>  #elif defined(XEN_BUILD_EFI)
>>>>>    /*
>>>>
>>>> You say "all sections" in the title, yet this is not covering e.g. debug
>>>> info.
>>>
>>> I will change to "all loadable sections". debug sections are not
>>> loadable so they don't cause an issue.
>>
>> Please try to be precise there, as some aspects are subtle. As per my
>> understanding, like .reloc all .debug_* are loadable (and may be loaded).
>> The IMAGE_SCN_MEM_DISCARDABLE flag merely means they can be discarded at
>> a certain point after image loading (for .reloc in particular: after
>> relocations were processed).
> 
> No, debug sections are not loadable, for instance, in a random
> executable I found:
> 
> Sections:
> Idx Name          Size      VMA               LMA               File off  Algn
>   0 .text         0000c7f8  0000000140001000  0000000140001000  00000600  2**4
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE, DATA
>   1 .data         00000250  000000014000e000  000000014000e000  0000ce00  2**4
>                   CONTENTS, ALLOC, LOAD, DATA
>   2 .rdata        00002c70  000000014000f000  000000014000f000  0000d200  2**4
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   3 .pdata        00000654  0000000140012000  0000000140012000  00010000  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   4 .xdata        00000630  0000000140013000  0000000140013000  00010800  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   5 .bss          00001ec0  0000000140014000  0000000140014000  00000000  2**4
>                   ALLOC
>   6 .idata        00000c88  0000000140016000  0000000140016000  00011000  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
>   7 .CRT          00000060  0000000140017000  0000000140017000  00011e00  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
>   8 .tls          00000010  0000000140018000  0000000140018000  00012000  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
>   9 .reloc        0000009c  0000000140019000  0000000140019000  00012200  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>  10 .debug_aranges 00000150  000000014001a000  000000014001a000  00012400  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  11 .debug_info   0000d5e4  000000014001b000  000000014001b000  00012600  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  12 .debug_abbrev 000014de  0000000140029000  0000000140029000  0001fc00  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  13 .debug_line   00001a36  000000014002b000  000000014002b000  00021200  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  14 .debug_frame  00000f40  000000014002d000  000000014002d000  00022e00  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  15 .debug_str    000003a0  000000014002e000  000000014002e000  00023e00  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  16 .debug_line_str 00000a76  000000014002f000  000000014002f000  00024200  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  17 .debug_loclists 0000174a  0000000140030000  0000000140030000  00024e00  2**0
>                   CONTENTS, READONLY, DEBUGGING
>  18 .debug_rnglists 0000039c  0000000140032000  0000000140032000  00026600  2**0
>                   CONTENTS, READONLY, DEBUGGING

That's derived from libfd's internal representation, which means nothing at
all to the loader processing the image. If your objdump is suitably enabled,
try using its -P option.

Jan

