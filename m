Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WKLaMurRKmoKxgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:19:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DC673021
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:19:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aoi3ogXF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335760.1597937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhB8-0001c6-5B; Thu, 11 Jun 2026 15:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335760.1597937; Thu, 11 Jun 2026 15:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhB8-0001ZR-26; Thu, 11 Jun 2026 15:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1335760;
 Thu, 11 Jun 2026 15:18:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXhB6-0001ZL-Gq
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:18:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhB5-00DHiS-LR
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:18:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ad1c7-e002-0a2a0a5209dd-0a2a4501c880-28
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:18:43 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ad1d3-c1f2-0a2a45010019-d1558034ad85-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:18:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso68352115e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:18:43 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm89007371f8f.36.2026.06.11.08.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:18:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1781191123; x=1781795923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GhN36oGihZlcN5HMIpc98+EDACPfjSLV4HCZg+RvzRg=;
        b=aoi3ogXFoH9f50jifzpAq59HORzSx02watAswwK1+f6EClOy6Z3FNSS4uTrESJmJLa
         ng8Uc2e2C/NJDGr25inJV2SD61DrEXOnVcXHETSyO1AWFJqI4FJQjnNZBW8aG4bQWV56
         Y0EGQ8lS9ma2DDqq/bfUogBXWHRU0gBBBXCl7J8dq2jfC0fq6Pv9H72siVxOn2H3vELF
         79g5/amZ0psZ6qHucuXKY2Z/S0HqQPHB+ZhzpD6RwXVnWioJYvrFaXMOHQnnCEz/Fz/v
         auGmxlQqKNWiggsk5DB0OB4Gmw88AFXy3yhBMUYPoRahvPRUU6DjwDI7cCFq170iQOjD
         6qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191123; x=1781795923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhN36oGihZlcN5HMIpc98+EDACPfjSLV4HCZg+RvzRg=;
        b=UdmrWmqomOrJvGNP48OF4zQ16HKaz3yV2RkinihMp/miMBJVzX+8Foq7kupSz7M7/m
         U8jbaibMITpgRoeyNOhSIl/RxxRrkSI3hkSMlg8CTk02SGzclWCoSK2Vt5mKLvRlUilQ
         rg7gGAzJ66OAoVTsmSaIEYsHFa0P8NQKXNGx2Olw/iWl6SCytyKuqcjRYR4OYLQJ7yv0
         BUbrTvp80m/dG8gRjTAcbcjkiVLJxJFf/wn6xWVpC606Wrx5Lh5KZtiK+38vgttLZTKl
         G0ofkikCsHwkcy6aVIP1RqOtVfcBE1aBtlaK6an84TfdFHca8m8KrQjIgJzA5MDjLBbf
         cHPA==
X-Forwarded-Encrypted: i=1; AFNElJ/jLXmki/YSLPESGSCl342aV3jJuEk5w6vgsnWxoJzm41qotubFkbQaEbLsjhXgGn9ove8wDO4dp6g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6LxDetiTINbkWbo5o7k349zbBJDzh0qImpCl7MlcpjUSCam1G
	OMUlaqzpIpkA7TtTaX5iL2LSxi1Goh8CkjsYFpbdcaw3RShuRwrzDI84b4OCvLUjDw==
X-Gm-Gg: Acq92OEtulQyUljwY4JBx3uPnGpO9X9tCPLUcBx19Gfa180PWq2xAsps3qpF9amukth
	KiWhIXBfT0PYLjPFfGFqA3C82cphLQ2mXcvVojkzYEciAXzuqVcskhASUy8a0Ug4T8TT3TOwiVm
	5GSTiQTK7+oyn4cnnHx3CaT4J5vYERZq1SHj5CHMh7YDAakJHQTKxjoi88ieoMC6w+7R+P436aE
	+5G50M3HKtgNlTmGFBmMx/pw1DsYoz/f2A+ugAkFHsz0Q0/vumNGFJLYGlHd/TNmRoMg0rGCV1r
	cRECQP7QuthOU9SdOzpRfA+DbZAtosjtbEioF4ZS3sj/ssi7ueX3iCVx2BwYo4rwewJd+1fmka+
	OPUG8wGingvzaEeILls4HzQKJAX/VRn05psE/5PkGz7pVIx6LNiDLx0akvvfqxejzUgZCCqdz89
	FtP2NO9NwQ0pfePmQ3v+Cn5YZaH92HPI7HTrX6gwsOrZbsm/2XJw8BhhCj2ELivZPSI6xXDFUeS
	is6+b9bHR0us06T/q6jZnpJckziRtKcyT89h4VnCmmykCdLcbtHUVA51oP3YeFEHsmERyA=
X-Received: by 2002:a05:600c:400f:b0:490:b8c0:d471 with SMTP id 5b1f17b1804b1-490e56177e6mr30588675e9.23.1781191122840;
        Thu, 11 Jun 2026 08:18:42 -0700 (PDT)
Message-ID: <f83df0b1-9177-4b89-a854-e19a22e181a7@suse.com>
Date: Thu, 11 Jun 2026 17:18:40 +0200
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
 <5bee4f94-b2d0-4802-a990-b2a378d2f838@suse.com>
 <CAHt6W4cb4R7i79s9wYRpPfOdmkKS+XsaO=VphZ+jvmLKiRw-ZA@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAHt6W4cb4R7i79s9wYRpPfOdmkKS+XsaO=VphZ+jvmLKiRw-ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781191123-B6342FF4-3ABA4354/0/0
X-purgate-type: clean
X-purgate-size: 8234
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
X-Rspamd-Queue-Id: 0D3DC673021

On 11.06.2026 16:49, Frediano Ziglio wrote:
> On Wed, 10 Jun 2026 at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.06.2026 18:02, Frediano Ziglio wrote:
>>> Frediano
>>>
>>> On Fri, 5 Jun 2026 at 08:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 04.06.2026 12:16, Frediano Ziglio wrote:
>>>>> On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 29.05.2026 17:35, Frediano Ziglio wrote:
>>>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>>>> @@ -162,8 +162,8 @@ SECTIONS
>>>>>>>         __note_gnu_build_id_end = .;
>>>>>>>    } PHDR(note) PHDR(text)
>>>>>>>  #elif defined(BUILD_ID_EFI)
>>>>>>> -  /* Workaround bug in binutils < 2.36 */
>>>>>>> -  . = ALIGN(32);
>>>>>>> +  /* align to satisfy UEFI CA memory mitigation */
>>>>>>> +  . = ALIGN(PAGE_SIZE);
>>>>>>>    DECL_SECTION(.buildid) {
>>>>>>>         __note_gnu_build_id_start = .;
>>>>>>>         *(.buildid)
>>>>>>> @@ -330,6 +330,7 @@ SECTIONS
>>>>>>>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
>>>>>>>
>>>>>>>  #ifdef EFI
>>>>>>> +  . = ALIGN(PAGE_SIZE);
>>>>>>>    .reloc ALIGN(4) : {
>>>>>>>      __base_relocs_start = .;
>>>>>>>      *(.reloc)
>>>>>>> @@ -355,6 +356,7 @@ SECTIONS
>>>>>>>    VIRT_START &= 0;
>>>>>>>    ALT_START &= 0;
>>>>>>>
>>>>>>> +  . = ALIGN(PAGE_SIZE);
>>>>>>>    .sbat (NOLOAD) : { *(.sbat) }
>>>>>>>  #elif defined(XEN_BUILD_EFI)
>>>>>>>    /*
>>>>>>
>>>>>> You say "all sections" in the title, yet this is not covering e.g. debug
>>>>>> info.
>>>>>
>>>>> I will change to "all loadable sections". debug sections are not
>>>>> loadable so they don't cause an issue.
>>>>
>>>> Please try to be precise there, as some aspects are subtle. As per my
>>>> understanding, like .reloc all .debug_* are loadable (and may be loaded).
>>>> The IMAGE_SCN_MEM_DISCARDABLE flag merely means they can be discarded at
>>>> a certain point after image loading (for .reloc in particular: after
>>>> relocations were processed).
>>>
>>> No, debug sections are not loadable, for instance, in a random
>>> executable I found:
>>>
>>> Sections:
>>> Idx Name          Size      VMA               LMA               File off  Algn
>>>   0 .text         0000c7f8  0000000140001000  0000000140001000  00000600  2**4
>>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE, DATA
>>>   1 .data         00000250  000000014000e000  000000014000e000  0000ce00  2**4
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   2 .rdata        00002c70  000000014000f000  000000014000f000  0000d200  2**4
>>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>>   3 .pdata        00000654  0000000140012000  0000000140012000  00010000  2**2
>>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>>   4 .xdata        00000630  0000000140013000  0000000140013000  00010800  2**2
>>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>>   5 .bss          00001ec0  0000000140014000  0000000140014000  00000000  2**4
>>>                   ALLOC
>>>   6 .idata        00000c88  0000000140016000  0000000140016000  00011000  2**2
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   7 .CRT          00000060  0000000140017000  0000000140017000  00011e00  2**2
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   8 .tls          00000010  0000000140018000  0000000140018000  00012000  2**2
>>>                   CONTENTS, ALLOC, LOAD, DATA
>>>   9 .reloc        0000009c  0000000140019000  0000000140019000  00012200  2**2
>>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>>  10 .debug_aranges 00000150  000000014001a000  000000014001a000  00012400  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  11 .debug_info   0000d5e4  000000014001b000  000000014001b000  00012600  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  12 .debug_abbrev 000014de  0000000140029000  0000000140029000  0001fc00  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  13 .debug_line   00001a36  000000014002b000  000000014002b000  00021200  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  14 .debug_frame  00000f40  000000014002d000  000000014002d000  00022e00  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  15 .debug_str    000003a0  000000014002e000  000000014002e000  00023e00  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  16 .debug_line_str 00000a76  000000014002f000  000000014002f000  00024200  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  17 .debug_loclists 0000174a  0000000140030000  0000000140030000  00024e00  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>>  18 .debug_rnglists 0000039c  0000000140032000  0000000140032000  00026600  2**0
>>>                   CONTENTS, READONLY, DEBUGGING
>>
>> That's derived from libfd's internal representation, which means nothing at
>> all to the loader processing the image. If your objdump is suitably enabled,
>> try using its -P option.
>>
>> Jan
> 
> You are right, I got
> 
> Section headers (at offset 0x00000188):
>  # Name     paddr    vaddr    size     scnptr   relptr   lnnoptr   nrel nlnno
>  1 .text    0000c7f8 00001000 0000c800 00000600 00000000 00000000     0     0
>             Flags: 60000060: EXECUTE,READ,CODE,INITIALIZED DATA
>  2 .data    00000250 0000e000 00000400 0000ce00 00000000 00000000     0     0
>             Flags: c0000040: READ,WRITE,INITIALIZED DATA
>  3 .rdata   00002c70 0000f000 00002e00 0000d200 00000000 00000000     0     0
>             Flags: 40000040: READ,INITIALIZED DATA
>  4 .pdata   00000654 00012000 00000800 00010000 00000000 00000000     0     0
>             Flags: 40000040: READ,INITIALIZED DATA
>  5 .xdata   00000630 00013000 00000800 00010800 00000000 00000000     0     0
>             Flags: 40000040: READ,INITIALIZED DATA
>  6 .bss     00001ec0 00014000 00000000 00000000 00000000 00000000     0     0
>             Flags: c0000080: READ,WRITE,UNINITIALIZED DATA
>  7 .idata   00000c88 00016000 00000e00 00011000 00000000 00000000     0     0
>             Flags: c0000040: READ,WRITE,INITIALIZED DATA
>  8 .CRT     00000060 00017000 00000200 00011e00 00000000 00000000     0     0
>             Flags: c0000040: READ,WRITE,INITIALIZED DATA
>  9 .tls     00000010 00018000 00000200 00012000 00000000 00000000     0     0
>             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> 10 .reloc   0000009c 00019000 00000200 00012200 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 11 /4       00000150 0001a000 00000200 00012400 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 12 /19      0000d5e4 0001b000 0000d600 00012600 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 13 /31      000014de 00029000 00001600 0001fc00 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 14 /45      00001a36 0002b000 00001c00 00021200 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 15 /57      00000f40 0002d000 00001000 00022e00 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 16 /70      000003a0 0002e000 00000400 00023e00 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 17 /81      00000a76 0002f000 00000c00 00024200 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 18 /97      0000174a 00030000 00001800 00024e00 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 19 /113     0000039c 00032000 00000400 00026600 00000000 00000000     0     0
>             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> 
> I suppose I will change to simply "Align some sections to 4KB"

"Some" is imo going to be too imprecise. Please qualify which sections you
intend to align. If new sections need adding in the future, this then can
guide people as to whether those may also need aligning.

Jan

