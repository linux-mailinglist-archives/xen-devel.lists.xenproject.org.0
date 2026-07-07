Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vhSMJvS2TGpZogEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:21:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADCA71903A
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CmJm9yWC;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356021.1610672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh12B-0006Rb-KU; Tue, 07 Jul 2026 08:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356021.1610672; Tue, 07 Jul 2026 08:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh12B-0006Om-He; Tue, 07 Jul 2026 08:20:03 +0000
Received: by outflank-mailman (input) for mailman id 1356021;
 Tue, 07 Jul 2026 08:20:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wh12A-0006FO-Vo
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:20:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh12A-00CwVv-5g
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:20:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4cb6ae-2eae-0a2a0a5409dd-0a2a450a83f0-22
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:20:01 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4cb6b1-e40e-0a2a450a0019-d155a72abddc-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:20:01 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5aeb5e85378so4386579e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 01:20:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aed13c8c3asm3498227e87.82.2026.07.07.01.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 01:20:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783412401; x=1784017201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDHW20h20Zg6KDUMq92qcS2XQLqNXHumydYe4vRGDsU=;
        b=CmJm9yWCRrtZ5RLBQCO7s40YcZ2U+VciRQmWjV4UliBpJmUXWPuQ/5NqW4a9FWDxlP
         uYcxE4yJfiFbNBdPG3gg4IuOFSyRp5Gxr1tcQkA3dRNPdcs5WB4Z8+dCPLkzx4HICo2V
         p3r8Epw1ICyZrOWmxaHPGEbOQmW4v6lDuE2FDJ6iOHn6kak+35j9T815yTFlru1C5xuE
         SYTMZe18FJgGMageyInb4koKU7yQSrb7+u27tCF6meye8UFG43z65EoFa5ye1Eqj5jYA
         3zQ3JqGPhD9w3UYKFDlbDb0qtIQRAAFK3i/UgbpsYB1IPUvcwBFtEyrJBrPMlylrW+qm
         sZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412401; x=1784017201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDHW20h20Zg6KDUMq92qcS2XQLqNXHumydYe4vRGDsU=;
        b=rDTXiSAtOZZGqkcOmo46r6crbDAkvNHiaf9tDeCc9oaleUbk+/k6klyCdUSnUn7anJ
         bHOaPgh+pz70z0Y1LUo7z+jvjAM+vhubC+gcYQ8i5x8kk+dhbTVAt1UCoo0RVLPXsZv+
         e+qNBpRItuX7y+pmCJR62x1UxbUj6NucJFWL1GPQiTPz2q7O6yJ4jxg0yXIwF+9tSKLR
         vIIDuRi/G85nU1mWgVqyYP7qD/UdA+pKmxBOMCyqKP+CxDVP+KIkGqpjzljXPAQCYJKN
         f+2sM3Ic5X9lSSs4fX84LEJxw5SyzRt7H4ohSNBqCPzfl3uHeDXDK319K705SNBXGFfR
         TpBg==
X-Forwarded-Encrypted: i=1; AHgh+RpXMFk6dgLp2ZtbGUiy/lBoIu9eQK5ce42mqXsFsIF+KcjSXxM/JszKuClpzX2URSZD9nJ/T6MUi7I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYynCVkEVF+Jb/ZQrJ0HNr8D2alpe+myel66nhcxgyXagUzSnN
	2i0BGgo8NtVx7uoJo6C/bxYnRQmTgxuJOvc120kqMerlglrGwjvaoPvs
X-Gm-Gg: AfdE7cks13OcCURWiBoq2VvnNf8dvu80bPSkgc7xO1hn72e2+haRdue/S2Me02WOlWe
	z6A1vF4sTxyhjwMx2zEjCy+I5iL0j9ZzcBR9Qdly222LUwE4zzEIArkbuj3HQCK/oxS73XLsyqN
	1EbDOBEf5V8/IRk/FNnj/pMUeXfexuMApXKUyRJ0DWoAmnNSYoimWrnVYp9o/1kpYmQAyY8quhJ
	YrAAFVG9fUR0w7Ya/pPiqdHo1SjgwPOH92pGGVnH+7nuTPi+1etRzGQueOvaUcLlKjj+NloEVaj
	z8VFxArdTvmvO08ob8GuhPRhyIKwuF2lZ6cpKShYWBT2p/TeCWrWsXt4c3kQBpyh8/tSfCQ5cCu
	di04jHaXRXYE0vjOfTaXR/Ce8uN1coeJ7808kg8MftZAh62OeI6xC5kKWuJZuvqV/Ew9S7XebR6
	Bc3s7Q+t/yWjQEGJWEFg7BOWy4rmNRfY1t74k7OsRMSQoHUMoFTUYxZFGPIidut7z/IY0=
X-Received: by 2002:a05:6512:61a:b0:5ae:c21b:1cb6 with SMTP id 2adb3069b0e04-5b007c09eefmr774963e87.28.1783412401085;
        Tue, 07 Jul 2026 01:20:01 -0700 (PDT)
Message-ID: <66b5f31f-8ef6-4555-9c04-f5314512b598@gmail.com>
Date: Tue, 7 Jul 2026 10:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/26] xen/riscv: do a 4th linking pass if necessary
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <ba3b7e3197ae90c9f0e5190ba34de174b86090ac.1783331040.git.oleksii.kurochko@gmail.com>
 <3835ed9c-4c9a-49e4-90fd-37644262a942@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3835ed9c-4c9a-49e4-90fd-37644262a942@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1783412401-CED3BDDE-53ABCCD7/10/73395122804
X-purgate-type: spam
X-purgate-size: 7504
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DADCA71903A



On 7/6/26 6:13 PM, Jan Beulich wrote:
> On 06.07.2026 17:58, Oleksii Kurochko wrote:
>> Embedding the symbol table can shift sections and flip relaxation
>> decisions, changing code size and thus the set of emitted symbols
>> (e.g. gap end markers).
> 
> What difference in symbols is there? (And: Do you mean the ELF symbol
> table or what tools/symbols emits?) On ...

The ELF symbol tables of .xen-syms.0 and .xen-syms.1 are identical
(same names, types, and count; only addresses past a certain point
differ). The difference is in what tools/symbols emits: the
address-only "end of symbol" entry produced when want_symbol_end()
is true, i.e. when a sized text symbol's end doesn't reach the next
symbol's address:

     static bool want_symbol_end(unsigned int idx)
     {
         return table[idx].size &&
                (idx + 1 == table_cnt ||
                 table[idx].addr + table[idx].size < table[idx + 1].addr);
     }

In pass 1 (generated from .xen-syms.0): simple_strtoull is at
0xffffffffc00c0444 with size 0x16c, ending at 0xffffffffc00c05b0,
while turn_on_mmu (alignment-pinned) starts at 0xffffffffc00c05c0.
16-byte gap -> the end marker at ...c05b0 is emitted.

In pass 2 (generated from .xen-syms.1): simple_strtoull moved to
0xffffffffc00c0454 (same size), ending at exactly 0xffffffffc00c05c0
== turn_on_mmu. No gap -> no end marker. Hence symbols_addresses
shrinks by 8 and symbols_names by 1 (the marker's empty name).

> 
>>   Re-link with a regenerated table when its
>> size differs from the previous pass.
>>
>> This mirrors commit 35de7285d508 ("Arm: do a 4th linking pass if
>> necessary"), which riscv didn't receive when the underlying
>> pass-2-vs-pass-3 check was extended to it in commit aa786d6e3467
>> ("non-x86/symbols: check table sizes don't change between linking
>> passes 2 and 3").
> 
> ... Arm the problem was with a symbol (dis)appearing from/in the ELF
> symbol table. The situation looks to be different here. Sadly ...

I will rephrase then this paragraph to:

This takes the same remedy as commit 35de7285d508 ("Arm: do a 4th
linking pass if necessary"), though the underlying cause differs:
here no symbol (dis)appears from the ELF symbol table; instead the
set of end markers emitted by tools/symbols legitimately changes,
because want_symbol_end() depends on code layout, and layout differs
between passes due to linker relaxation.

Or it could be just dropped.

> 
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> I faced this issue again in downstream:
>>    https://gitlab.com/xen-project/people/olkur/xen/-/jobs/15171254706
>>
>> It was found that the difference between .xen-syms.0 and .xen-syms.1 is in
>> alignment(?) gap between turn_on_mmu() and the end of simple_strtoull.
>> Specifically 0xffffffffc00c05b0 is present in pass 1 but not present in
>> pass 2 (where end of simple_strtoull() is just equal to ffffffffc00c05c0)
>> because code was shifted:
>>
>> ```
>> .xen-syms.0:     file format elf64-littleriscv
>>
>> ...
>>
>> ffffffffc00c0534:       f2e794e3                bne     a5,a4,ffffffffc00c045c <simple_strtoull+0x18>
>> ffffffffc00c0538:       00280813                addi    a6,a6,2
>> ffffffffc00c053c:       f21ff06f                j       ffffffffc00c045c <simple_strtoull+0x18>
>> ffffffffc00c0540:       00068813                mv      a6,a3
>> ffffffffc00c0544:       00800613                li      a2,8
>> ffffffffc00c0548:       f15ff06f                j       ffffffffc00c045c <simple_strtoull+0x18>
>> ffffffffc00c054c:       00277713                andi    a4,a4,2
>> ffffffffc00c0550:       04070463                beqz    a4,ffffffffc00c0598 <simple_strtoull+0x154>
>> ffffffffc00c0554:       fe06869b                addiw   a3,a3,-32
>> ffffffffc00c0558:       0ff6f693                zext.b  a3,a3
>> ffffffffc00c055c:       fc96879b                addiw   a5,a3,-55
>> ffffffffc00c0560:       04c7f263                bgeu    a5,a2,ffffffffc00c05a4 <simple_strtoull+0x160>
>> ffffffffc00c0564:       02a60533                mul     a0,a2,a0
>> ffffffffc00c0568:       00f50533                add     a0,a0,a5
>> ffffffffc00c056c:       00180813                addi    a6,a6,1
>> ffffffffc00c0570:       00084683                lbu     a3,0(a6)
>> ffffffffc00c0574:       0006879b                sext.w  a5,a3
>> ffffffffc00c0578:       00d30733                add     a4,t1,a3
>> ffffffffc00c057c:       00074703                lbu     a4,0(a4)
>> ffffffffc00c0580:       04477893                andi    a7,a4,68
>> ffffffffc00c0584:       02088063                beqz    a7,ffffffffc00c05a4 <simple_strtoull+0x160>
>> ffffffffc00c0588:       00477893                andi    a7,a4,4
>> ffffffffc00c058c:       fc0880e3                beqz    a7,ffffffffc00c054c <simple_strtoull+0x108>
>> ffffffffc00c0590:       fd07879b                addiw   a5,a5,-48
>> ffffffffc00c0594:       fcdff06f                j       ffffffffc00c0560 <simple_strtoull+0x11c>
>> ffffffffc00c0598:       fc97879b                addiw   a5,a5,-55
>> ffffffffc00c059c:       fc5ff06f                j       ffffffffc00c0560 <simple_strtoull+0x11c>
>> ffffffffc00c05a0:       00000513                li      a0,0
>> ffffffffc00c05a4:       00058463                beqz    a1,ffffffffc00c05ac <simple_strtoull+0x168>
>> ffffffffc00c05a8:       0105b023                sd      a6,0(a1)
>> ffffffffc00c05ac:       00008067                ret
>>          ...
>>
>> ffffffffc00c05c0 <turn_on_mmu>:
>> ffffffffc00c05c0:       12000073                sfence.vma
>> ffffffffc00c05c4:       00800293                li      t0,8
>> ffffffffc00c05c8:       03c29293                slli    t0,t0,0x3c
>> ffffffffc00c05cc:       000fc317                auipc   t1,0xfc
>> ffffffffc00c05d0:       a3430313                addi    t1,t1,-1484 # ffffffffc01bc000 <stage1_pgtbl_root>
>> ffffffffc00c05d4:       00c35313                srli    t1,t1,0xc
>> ffffffffc00c05d8:       00536333                or      t1,t1,t0
>> ffffffffc00c05dc:       18031073                csrw    satp,t1
>> ffffffffc00c05e0:       00050067                jr      a0
>>
>> ffffffffc00c05e4 <_ident_end>:
>> ffffffffc00c05e4:       0000                    .insn   2, 0x0000
>>          ...
>> ```
> 
> ... with all of this disassembly provided it still doesn't become clear what
> changed from .xen-syms.0 to .xen-syms.1.

The disassembly was meant to show the 16-byte padding gap between the
end of simple_strtoull() and (aligned) turn_on_mmu() in .xen-syms.0.
In .xen-syms.1 that gap is gone, which is what removes the end marker
and shrinks symbols_addresses by 8 and symbols_names by 1, as
explained above.

The actual code change is earlier in .text. Inserting the symbol
table (~24k of .rodata) pushes .init.text from 0xffffffffc0148000
to 0xffffffffc014e000. Several calls from .text into .init.text
(e.g. to alloc_boot_pages()/init_boot_pages()) thereby cross JAL's
±1MB reach, so the linker can no longer relax them:

.xen-syms.0:
     <caller>: jal   ffffffffc0152000 <alloc_boot_pages>

.xen-syms.1:
     <caller>: auipc ra,0xfc
               jalr  1044(ra) # ffffffffc015800c <alloc_boot_pages>

Four such call sites grow .text by 16 bytes in total, which is what
shifts simple_strtoull by +0x10 and closes the padding gap before
the (aligned) turn_on_mmu.

~ Oleksii



