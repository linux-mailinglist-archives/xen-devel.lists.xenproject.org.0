Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Q9VLttEJGrI4gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 06 Jun 2026 18:03:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B264DE41
	for <lists+xen-devel@lfdr.de>; Sat, 06 Jun 2026 18:03:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XaLu5LOZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1330718.1593930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVtTi-00073m-E7; Sat, 06 Jun 2026 16:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1330718.1593930; Sat, 06 Jun 2026 16:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVtTi-000712-8J; Sat, 06 Jun 2026 16:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1330718;
 Sat, 06 Jun 2026 16:02:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wVtTg-00070w-UN
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 16:02:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVtTg-00D2LK-BK
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2026 18:02:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a244469-2eae-0a2a0a5409dd-0a2a450cbb3c-30
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 18:02:28 +0200
Received: from [209.85.128.179] (helo=mail-yw1-f179.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a244493-62f1-0a2a450c0019-d15580b3c1a1-3
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 18:02:28 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-7e8833c99fcso33522007b3.3
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jun 2026 09:02:27 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780761747; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUwxPIR1wcE7PN6cteWYFt2Qrx3FvJ92lfVUuxe78TJJFakoNeUoKUoE/9g8LJIm39
         CKx+TNf1ih3wM2Jhj3zRwcUHBzIvbTNYrrxdCWlJWkxuqm1RRSFsQHkrlOEKF91Jfs/W
         4HN0c82tK0K9fEPRuFU4/4ZdSFaTogrYzaWJS+Lrb5FP5Gsy43MC78i9c5cgEL3K7IPX
         RWEd076cQUGYDbedXClSRKsj/yndMsUDLBznSbbuJ/C6VHfcwnClffX+uoGz8NDvoebo
         Cia1dvk6lxxGz5e1R2YHKez805nWthOjg7bCN3Mp2gTC1FmE9I0AaP9lugxXiIgWKeWT
         kqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yV120SJkaXOhDJ3ht7+zQUfjiEG91MP1CShsdkCq8DE=;
        fh=xSXpILpZGcC0b6sYdroUP2Mv8Ud1opSGb2BtbE0ZumE=;
        b=RTMlEsfLDS/AYJIMSfN9YsxPzufndqQRVcUse5Ds12JvkgDO8LWarBF379i8ai3EJW
         ps9qh6jbAzoW2swQAYo5K4Jgg0rWNnpd/oUYwKJ+uBXm6zenHJEJV7N3Jx0LRsYMtYvw
         iNnLhztVQcd9WYmvoKodHifHfiO76UqgJcoiL/jE0tlOk3KdfIDSMHdPcNTK3O2CVuth
         Vw8b+LIOUjOOULb4oHNqTCSaPTWl5mp/cJfGr+thb1snwN0jY7lTOWQcAf5NpgLq0v1E
         aghZOMiJmMM5I2KTZdLuIJ+Dupav6j9PPyJLn4GRxXQKL6+IybAjOrVgNtibxR0KNuRS
         8wLg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780761747; x=1781366547; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yV120SJkaXOhDJ3ht7+zQUfjiEG91MP1CShsdkCq8DE=;
        b=XaLu5LOZ3XsUjXn37GLWRZ+4L5BzQsrhqfhMV/Twhu207cXqTjb7LwN0e0v/LghiRb
         v+a51OJkLV4mH6XKdNHvtOEDGNq56RsVDiiYjYHUejHWTthHiLFeV5v9Kh0NT0uG2GHZ
         +f1P1TsgR6tI5xSJP33ndRr5Oee0zU/+VLD0n087+lVWZBs8Bnwq9AiWVt/51OKZewpD
         4Gq5o1yyPrhWt34aUpTEeO/qTOT/O3a744/NZIv5xApicdiWfuxH9tn3YxRL4oOukbMi
         HD3N9F6NLhx2ttI8r6npf7M1zqIrWulTrkaF+RSAfxMmpSLtofnE4UgKk/J7dUzE/3u7
         msJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780761747; x=1781366547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV120SJkaXOhDJ3ht7+zQUfjiEG91MP1CShsdkCq8DE=;
        b=oCB4gtfftyhvcX3PVJymKu8XB8TjZISm5oIjprI2rWa1AOaXz8qevmLSIINYduSXG8
         DkTQKeb90BNhlrPwYH4UUE5TD+eNsR03qK7aVrsqiQDyEmhpOsA9wl1hicWBDObjk8/Q
         ByfDuynVJBOsZbLRGlyrdPoMf5fhhDVBnBttXflqS53HoZ7YLlcQfdjglAHjCDLPmU3g
         +G0gegWNg+K+1pa7pY+aGe6DX997d1iZxBe9Uru7K7JD0jr/3kqlfcxdP8Rf3YkdQ/54
         /4Wzro4QxKhtIEHii4T5wtR0lgF15wbQXydLTrrhHhmI/XSAfdM/o3YWaXIr57GRrSSy
         jxvA==
X-Forwarded-Encrypted: i=1; AFNElJ8UqQMogEO8ZGVTXGiWv3GdoBTZD4DF2UXf7fXTRnOYET7sU/XHm41otyMMm2LvK+JjhCHa66/l/90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdXrpdJRfZn3DQZDvqqi3okuXcaoVajX4dtRp6N+6D2o06kRIC
	gK4a5yk7j68MKTHhh0dSpcndI3JbD+miAGV2Mslj+q+2fZfHvo7R+lnRGbNAMnpbp/NLNIGxAsK
	lah+XLH6gsKjf3Aqi6XvgwrFpPLu4lkE=
X-Gm-Gg: Acq92OHc+ByENO3N0PWBYlbbyKC4ivCrrkU1r3Wh3za3oGL1RSfHhS1d9L5b4+OgNTt
	wYXOZt6R5WoS9BnX1/GUtp0mT+XEO8Vvxqw+3jmHUtv3L7g2WBoofdPGrUEbKO07++R92Jmd4XL
	I+qoVGP5P0gpwowxlHLig/niGtWBoDhuYp36+LzpgXDp4J3U6dC1LnXsGGRKYakG0fK+JWtzX1d
	T/WdBpxEs0cWI+oLwpj3XNIR8XWd+aiIHWu6GgprEf1sA9zbb3rqZtc8khr6qRYikye4KWQS8Sc
	/UkqsaJyGt+oxq7x/aJCnszKRJISilZiy9uIFuT8FBFDMvc3
X-Received: by 2002:a05:690e:418d:b0:660:7865:9bc6 with SMTP id
 956f58d0204a3-661070738aamr6408065d50.51.1780761746573; Sat, 06 Jun 2026
 09:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com> <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
 <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com> <75e86d74-9fa1-4090-bea7-332ec31ffb90@suse.com>
In-Reply-To: <75e86d74-9fa1-4090-bea7-332ec31ffb90@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 6 Jun 2026 17:02:13 +0100
X-Gm-Features: AVVi8Ccw4XyblFSYD4YDnmecfREs8BzexydNVrB5Y2iAMkBnfUWvDPlEEH5EAmE
Message-ID: <CAHt6W4dfXdyw4dOkqoQzo0x4XRmLsHXkhhznov+KvanKBi9bWw@mail.gmail.com>
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1780761748-E2776CF5-82B8FF14/0/0
X-purgate-type: clean
X-purgate-size: 4466
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F1B264DE41

Frediano

On Fri, 5 Jun 2026 at 08:45, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 04.06.2026 12:16, Frediano Ziglio wrote:
> > On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 29.05.2026 17:35, Frediano Ziglio wrote:
> >>> --- a/xen/arch/x86/xen.lds.S
> >>> +++ b/xen/arch/x86/xen.lds.S
> >>> @@ -162,8 +162,8 @@ SECTIONS
> >>>         __note_gnu_build_id_end = .;
> >>>    } PHDR(note) PHDR(text)
> >>>  #elif defined(BUILD_ID_EFI)
> >>> -  /* Workaround bug in binutils < 2.36 */
> >>> -  . = ALIGN(32);
> >>> +  /* align to satisfy UEFI CA memory mitigation */
> >>> +  . = ALIGN(PAGE_SIZE);
> >>>    DECL_SECTION(.buildid) {
> >>>         __note_gnu_build_id_start = .;
> >>>         *(.buildid)
> >>> @@ -330,6 +330,7 @@ SECTIONS
> >>>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
> >>>
> >>>  #ifdef EFI
> >>> +  . = ALIGN(PAGE_SIZE);
> >>>    .reloc ALIGN(4) : {
> >>>      __base_relocs_start = .;
> >>>      *(.reloc)
> >>> @@ -355,6 +356,7 @@ SECTIONS
> >>>    VIRT_START &= 0;
> >>>    ALT_START &= 0;
> >>>
> >>> +  . = ALIGN(PAGE_SIZE);
> >>>    .sbat (NOLOAD) : { *(.sbat) }
> >>>  #elif defined(XEN_BUILD_EFI)
> >>>    /*
> >>
> >> You say "all sections" in the title, yet this is not covering e.g. debug
> >> info.
> >
> > I will change to "all loadable sections". debug sections are not
> > loadable so they don't cause an issue.
>
> Please try to be precise there, as some aspects are subtle. As per my
> understanding, like .reloc all .debug_* are loadable (and may be loaded).
> The IMAGE_SCN_MEM_DISCARDABLE flag merely means they can be discarded at
> a certain point after image loading (for .reloc in particular: after
> relocations were processed).
>
> Jan

No, debug sections are not loadable, for instance, in a random
executable I found:

Sections:
Idx Name          Size      VMA               LMA               File off  Algn
  0 .text         0000c7f8  0000000140001000  0000000140001000  00000600  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE, DATA
  1 .data         00000250  000000014000e000  000000014000e000  0000ce00  2**4
                  CONTENTS, ALLOC, LOAD, DATA
  2 .rdata        00002c70  000000014000f000  000000014000f000  0000d200  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .pdata        00000654  0000000140012000  0000000140012000  00010000  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 .xdata        00000630  0000000140013000  0000000140013000  00010800  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  5 .bss          00001ec0  0000000140014000  0000000140014000  00000000  2**4
                  ALLOC
  6 .idata        00000c88  0000000140016000  0000000140016000  00011000  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  7 .CRT          00000060  0000000140017000  0000000140017000  00011e00  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  8 .tls          00000010  0000000140018000  0000000140018000  00012000  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  9 .reloc        0000009c  0000000140019000  0000000140019000  00012200  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
 10 .debug_aranges 00000150  000000014001a000  000000014001a000  00012400  2**0
                  CONTENTS, READONLY, DEBUGGING
 11 .debug_info   0000d5e4  000000014001b000  000000014001b000  00012600  2**0
                  CONTENTS, READONLY, DEBUGGING
 12 .debug_abbrev 000014de  0000000140029000  0000000140029000  0001fc00  2**0
                  CONTENTS, READONLY, DEBUGGING
 13 .debug_line   00001a36  000000014002b000  000000014002b000  00021200  2**0
                  CONTENTS, READONLY, DEBUGGING
 14 .debug_frame  00000f40  000000014002d000  000000014002d000  00022e00  2**0
                  CONTENTS, READONLY, DEBUGGING
 15 .debug_str    000003a0  000000014002e000  000000014002e000  00023e00  2**0
                  CONTENTS, READONLY, DEBUGGING
 16 .debug_line_str 00000a76  000000014002f000  000000014002f000  00024200  2**0
                  CONTENTS, READONLY, DEBUGGING
 17 .debug_loclists 0000174a  0000000140030000  0000000140030000  00024e00  2**0
                  CONTENTS, READONLY, DEBUGGING
 18 .debug_rnglists 0000039c  0000000140032000  0000000140032000  00026600  2**0
                  CONTENTS, READONLY, DEBUGGING

Maybe "loaded" instead of "loadable" ?

Frediano

