Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 979hM2s9LWrweAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 13:22:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243B67E739
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 13:22:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bCoRjwS4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1337244.1598776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYMQG-00027C-Vj; Sat, 13 Jun 2026 11:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337244.1598776; Sat, 13 Jun 2026 11:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYMQG-00024T-Qq; Sat, 13 Jun 2026 11:21:08 +0000
Received: by outflank-mailman (input) for mailman id 1337244;
 Sat, 13 Jun 2026 11:21:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYMQF-00024N-Bg
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 11:21:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYMQE-00BEEH-Om
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 13:21:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2d3ce5-5cb7-0a2a0a5109dd-0a2a450180d8-44
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 13:21:06 +0200
Received: from [74.125.224.51] (helo=mail-yx1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2d3d21-c1f2-0a2a45010019-4a7de033a5e8-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 13:21:06 +0200
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-660512d80b4so1849627d50.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 04:21:06 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781349665; cv=none;
        d=google.com; s=arc-20240605;
        b=ivNEnXO8pkDec+zTPSwNrgdWqn9eiqkqdEmIiW3hmhMZSf4t4KUvXR+DWiUcyIVDyh
         ThVrwtQkPw9C1fU2nzbzhPfCbMVRHyEugbXBBZ35m5FmUqMccMB02DTgfFz8v+Yik542
         Jjl6pELDKziyUrrPLsxIN3KPnE+glBzCF+r54ZnN6M5QT4rrq+qwkZZoT8fHzhUjnVtb
         bpAPCLOHthF3WQOH6mh7zrbCQzstVyPMBCukwYOaB1NMPW+FlzycqdU7gCq5YIdz6n6A
         GJcHLhXEQmXN2E8lhQm4pYroq2M1le1nqd+wfhRIiP8joD/tKbVhXs8m4vSqjKHYsbUN
         XzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3IniDQcAaeOzy6guSBj5CzJJWJ98I6bNY7wzkg/qiTw=;
        fh=5lbqxgCMxf3Y4mAOLO68qUerdJDxNKup8DPHRZ7w9dY=;
        b=EutPzm3kNwD5C3gfz8zeojYX5U1FjYFAV81WFvmGQThBHhjwus6+TmtEGtdnXyjQyx
         4YT04ANg/SAokKGUZ2x71P+GmXzmAP9fqQwYWFDd0nWdQw5Lcy09/K6sNpzmkuZQu1Wi
         1ozpx45qmByAdiuwxWizT+mdmqYtCbGfmpBQcYc5fC+if3w46gHgTtrt2C0dexH+VquK
         1QhPpwub4zhtefyXcogD5AQJ7kk/d1OMRcNKLdkvsZVecUD7sMrUg6Ba7Z4e5ZmFyiFH
         5jwNGacwPyGnjVOSOHnO2IuEADmbbNiXyIuAT817s2fvpsPLWkq6Y3+0qVE0w4JxXtdG
         omPw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781349665; x=1781954465; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3IniDQcAaeOzy6guSBj5CzJJWJ98I6bNY7wzkg/qiTw=;
        b=bCoRjwS4/2C0KHdIR79QR+RCPfig8qtooPUPEsD/LRma4LXn0e8pTB8PXunpX53AJf
         CSkEkHccwY3/iGq7eAV0VYkhwrb/atrj/WPjjJgEBBimiec2X/KCJNCws/i/8x++/rhv
         27cAX26axyk8MZ/Bk63RytM25MnMGrE8K0LgHq4yE7mAOyazALbGHTZXOyIPQJb0lX2n
         dfcjCVuJLn1+AbaEBsZMGH1pwZojkfoye8OdDfuNe0lgw/dbU0+rk9uev3D9D6ezt1d8
         ZPb1QKUR0/zlEnXKrx9PAafJ04hOrgtvxru75k/zSiSEygES0mAz+Xly4KjFLZ9lJWi3
         FQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781349665; x=1781954465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IniDQcAaeOzy6guSBj5CzJJWJ98I6bNY7wzkg/qiTw=;
        b=at5zuwk5JhUsZ5mQ7uHbmewbrAZaHMryoM97JKABgm9xOmv4LdATSwLkTCuXxGLbTz
         a8wrBRA+bHtJKCOjEYBgPDOCP/50Z8ozPYh8B706j5BZOXdQzzuyb8NRAjxzh3mQLkCB
         8+nmuQE6Iq+5mce4Z6UW6DcdaW2XjH7+DyzI2z2t5CHYJN99X0uNApvdWDQQRQTH/oz+
         1S7WZY84EeimhcCKneL2OsCq0A/sf38PQzQ+lyH4IMTJme9TIioM7jKPXfcnXtpSRdly
         Q2GUAxDIquY4kBY4CdP0nOo4srSKUqgz7wZu8j78nMXsj8b9T78C7O/VnbfkWh5abJFa
         7jcQ==
X-Forwarded-Encrypted: i=1; AFNElJ86sCojW2YkJcBmncypHNgXilZBstFbCGeXU4uuopgC8+EsNJipIcCLLBpGGXBM/as4www3ybl08g8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaMgRthnrnCoGm6A+DsF46kbT92e1Nx2MzJiP/7xFRCnECAc4r
	l4ByATH2dXeqDkVOf8/K6vrmtf7tfSHwX3KXec0JjkA7o/Rl6Ohul4k4S6k1nrwk9j+uMt4tIaJ
	s1yQSpje5iodGHB8MXyDtsJZvTMbIXJ0=
X-Gm-Gg: Acq92OFph5mGsCvbs0WtpyhQRO2NCodbGdlyhHgCmyPZ3g0fsCcbdv3sePoAS1bvc4X
	iyS5Lm0X1W3oK0tRrmEf3Sy6zALWohk3g6oUpvDC7oXb5dgjCKmdZSM/FBlAOvHOSiKSaEkERup
	miOs7ZLDk6hE5mxnHuzZNyuo4ggxSQ7qR6AjKJcV5Vd3Nqj4wTxJN4AxP/bBrMLG+BuEapMb6zk
	hIIOk1b3Nrqy5/BPLhpyR7wMNLWsb01u9+UausWbIJ/RqON8C/YwQLVqivGSZS3hyb46hEiihBq
	U88lsjcTvmBoilp6tFWHzFEIiwyPETEDSE7u0Sp5
X-Received: by 2002:a05:690e:4801:b0:660:67da:446 with SMTP id
 956f58d0204a3-6627697903cmr3718819d50.18.1781349664983; Sat, 13 Jun 2026
 04:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com> <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
 <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com>
 <75e86d74-9fa1-4090-bea7-332ec31ffb90@suse.com> <CAHt6W4dfXdyw4dOkqoQzo0x4XRmLsHXkhhznov+KvanKBi9bWw@mail.gmail.com>
 <5bee4f94-b2d0-4802-a990-b2a378d2f838@suse.com> <CAHt6W4cb4R7i79s9wYRpPfOdmkKS+XsaO=VphZ+jvmLKiRw-ZA@mail.gmail.com>
 <f83df0b1-9177-4b89-a854-e19a22e181a7@suse.com>
In-Reply-To: <f83df0b1-9177-4b89-a854-e19a22e181a7@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 13 Jun 2026 12:20:53 +0100
X-Gm-Features: AVVi8CfizA9xbp-qB2j4vby_ZKvYpsoHduawbFP7mFcQmfNe9cQar-eGka3XVgM
Message-ID: <CAHt6W4efwGwdiTvKnG4n=A6PL_FogynsV23rDDi8rj_smZVoNw@mail.gmail.com>
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1781349666-B6B5EFF4-879A87EF/0/0
X-purgate-type: clean
X-purgate-size: 8897
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email];
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
X-Rspamd-Queue-Id: 2243B67E739

On Thu, 11 Jun 2026 at 16:18, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 11.06.2026 16:49, Frediano Ziglio wrote:
> > On Wed, 10 Jun 2026 at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 06.06.2026 18:02, Frediano Ziglio wrote:
> >>> Frediano
> >>>
> >>> On Fri, 5 Jun 2026 at 08:45, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 04.06.2026 12:16, Frediano Ziglio wrote:
> >>>>> On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>> On 29.05.2026 17:35, Frediano Ziglio wrote:
> >>>>>>> --- a/xen/arch/x86/xen.lds.S
> >>>>>>> +++ b/xen/arch/x86/xen.lds.S
> >>>>>>> @@ -162,8 +162,8 @@ SECTIONS
> >>>>>>>         __note_gnu_build_id_end = .;
> >>>>>>>    } PHDR(note) PHDR(text)
> >>>>>>>  #elif defined(BUILD_ID_EFI)
> >>>>>>> -  /* Workaround bug in binutils < 2.36 */
> >>>>>>> -  . = ALIGN(32);
> >>>>>>> +  /* align to satisfy UEFI CA memory mitigation */
> >>>>>>> +  . = ALIGN(PAGE_SIZE);
> >>>>>>>    DECL_SECTION(.buildid) {
> >>>>>>>         __note_gnu_build_id_start = .;
> >>>>>>>         *(.buildid)
> >>>>>>> @@ -330,6 +330,7 @@ SECTIONS
> >>>>>>>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
> >>>>>>>
> >>>>>>>  #ifdef EFI
> >>>>>>> +  . = ALIGN(PAGE_SIZE);
> >>>>>>>    .reloc ALIGN(4) : {
> >>>>>>>      __base_relocs_start = .;
> >>>>>>>      *(.reloc)
> >>>>>>> @@ -355,6 +356,7 @@ SECTIONS
> >>>>>>>    VIRT_START &= 0;
> >>>>>>>    ALT_START &= 0;
> >>>>>>>
> >>>>>>> +  . = ALIGN(PAGE_SIZE);
> >>>>>>>    .sbat (NOLOAD) : { *(.sbat) }
> >>>>>>>  #elif defined(XEN_BUILD_EFI)
> >>>>>>>    /*
> >>>>>>
> >>>>>> You say "all sections" in the title, yet this is not covering e.g. debug
> >>>>>> info.
> >>>>>
> >>>>> I will change to "all loadable sections". debug sections are not
> >>>>> loadable so they don't cause an issue.
> >>>>
> >>>> Please try to be precise there, as some aspects are subtle. As per my
> >>>> understanding, like .reloc all .debug_* are loadable (and may be loaded).
> >>>> The IMAGE_SCN_MEM_DISCARDABLE flag merely means they can be discarded at
> >>>> a certain point after image loading (for .reloc in particular: after
> >>>> relocations were processed).
> >>>
> >>> No, debug sections are not loadable, for instance, in a random
> >>> executable I found:
> >>>
> >>> Sections:
> >>> Idx Name          Size      VMA               LMA               File off  Algn
> >>>   0 .text         0000c7f8  0000000140001000  0000000140001000  00000600  2**4
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE, DATA
> >>>   1 .data         00000250  000000014000e000  000000014000e000  0000ce00  2**4
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   2 .rdata        00002c70  000000014000f000  000000014000f000  0000d200  2**4
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >>>   3 .pdata        00000654  0000000140012000  0000000140012000  00010000  2**2
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >>>   4 .xdata        00000630  0000000140013000  0000000140013000  00010800  2**2
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >>>   5 .bss          00001ec0  0000000140014000  0000000140014000  00000000  2**4
> >>>                   ALLOC
> >>>   6 .idata        00000c88  0000000140016000  0000000140016000  00011000  2**2
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   7 .CRT          00000060  0000000140017000  0000000140017000  00011e00  2**2
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   8 .tls          00000010  0000000140018000  0000000140018000  00012000  2**2
> >>>                   CONTENTS, ALLOC, LOAD, DATA
> >>>   9 .reloc        0000009c  0000000140019000  0000000140019000  00012200  2**2
> >>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >>>  10 .debug_aranges 00000150  000000014001a000  000000014001a000  00012400  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  11 .debug_info   0000d5e4  000000014001b000  000000014001b000  00012600  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  12 .debug_abbrev 000014de  0000000140029000  0000000140029000  0001fc00  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  13 .debug_line   00001a36  000000014002b000  000000014002b000  00021200  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  14 .debug_frame  00000f40  000000014002d000  000000014002d000  00022e00  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  15 .debug_str    000003a0  000000014002e000  000000014002e000  00023e00  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  16 .debug_line_str 00000a76  000000014002f000  000000014002f000  00024200  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  17 .debug_loclists 0000174a  0000000140030000  0000000140030000  00024e00  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>>  18 .debug_rnglists 0000039c  0000000140032000  0000000140032000  00026600  2**0
> >>>                   CONTENTS, READONLY, DEBUGGING
> >>
> >> That's derived from libfd's internal representation, which means nothing at
> >> all to the loader processing the image. If your objdump is suitably enabled,
> >> try using its -P option.
> >>
> >> Jan
> >
> > You are right, I got
> >
> > Section headers (at offset 0x00000188):
> >  # Name     paddr    vaddr    size     scnptr   relptr   lnnoptr   nrel nlnno
> >  1 .text    0000c7f8 00001000 0000c800 00000600 00000000 00000000     0     0
> >             Flags: 60000060: EXECUTE,READ,CODE,INITIALIZED DATA
> >  2 .data    00000250 0000e000 00000400 0000ce00 00000000 00000000     0     0
> >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> >  3 .rdata   00002c70 0000f000 00002e00 0000d200 00000000 00000000     0     0
> >             Flags: 40000040: READ,INITIALIZED DATA
> >  4 .pdata   00000654 00012000 00000800 00010000 00000000 00000000     0     0
> >             Flags: 40000040: READ,INITIALIZED DATA
> >  5 .xdata   00000630 00013000 00000800 00010800 00000000 00000000     0     0
> >             Flags: 40000040: READ,INITIALIZED DATA
> >  6 .bss     00001ec0 00014000 00000000 00000000 00000000 00000000     0     0
> >             Flags: c0000080: READ,WRITE,UNINITIALIZED DATA
> >  7 .idata   00000c88 00016000 00000e00 00011000 00000000 00000000     0     0
> >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> >  8 .CRT     00000060 00017000 00000200 00011e00 00000000 00000000     0     0
> >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> >  9 .tls     00000010 00018000 00000200 00012000 00000000 00000000     0     0
> >             Flags: c0000040: READ,WRITE,INITIALIZED DATA
> > 10 .reloc   0000009c 00019000 00000200 00012200 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 11 /4       00000150 0001a000 00000200 00012400 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 12 /19      0000d5e4 0001b000 0000d600 00012600 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 13 /31      000014de 00029000 00001600 0001fc00 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 14 /45      00001a36 0002b000 00001c00 00021200 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 15 /57      00000f40 0002d000 00001000 00022e00 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 16 /70      000003a0 0002e000 00000400 00023e00 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 17 /81      00000a76 0002f000 00000c00 00024200 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 18 /97      0000174a 00030000 00001800 00024e00 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> > 19 /113     0000039c 00032000 00000400 00026600 00000000 00000000     0     0
> >             Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
> >
> > I suppose I will change to simply "Align some sections to 4KB"
>
> "Some" is imo going to be too imprecise. Please qualify which sections you
> intend to align. If new sections need adding in the future, this then can
> guide people as to whether those may also need aligning.
>
> Jan

The main issue is that sections with different permissions must be in
separate sections.
In the case of debug sections they are contiguous and have the same
permissions so it's not an issue (although better to strip them off).

Any suggestions on how to describe this?

Frediano

