Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHCqM+8f1mklBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:29:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2B3B9E54
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275528.1561314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPDe-0005qH-V5; Wed, 08 Apr 2026 09:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275528.1561314; Wed, 08 Apr 2026 09:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPDe-0005nW-S3; Wed, 08 Apr 2026 09:29:06 +0000
Received: by outflank-mailman (input) for mailman id 1275528;
 Wed, 08 Apr 2026 09:29:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAPDd-0005nQ-Ad
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 09:29:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAPDc-00EvzP-Fm
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:29:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d61fde-bab6-0a2a0a5309dd-0a2a450ad1c0-10
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:29:04 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d61fe0-ee98-0a2a450a0019-d1558032e826-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:29:04 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488c21c636dso8135795e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 02:29:04 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488b6ff70bcsm336689285e9.14.2026.04.08.02.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 02:29:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775640544; x=1776245344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wAYwA8i6HQR6+x7nQ9JtS/eat0beW9e+Xk3Z/UyFlM=;
        b=FLRhV13SC8hi4mCf5T+XDAehtln7C9ayUl64PAl9EyhalAsdFE4B3NDl57NZWLfsDt
         7D6oxfFZkCgK2pvXkmlo5fQJy5bQOyWPD5kNio+FccWsr1WTZPxffuh8umBKGzKbjkT/
         wv8dZlqEj//Zt9KrztC47+XGBOMRrzt/GE4XMVJSnh2K+z9/7nQ/hgk4Sl7oRaxWwIM1
         YLmixnDCXdef51t5XHOjij1W/rSQPl62LgFWZG3aIXD8Ct8Be2LwvyKT0e+UavzVYflJ
         KPqBfJjku2KExyPJ48TliqYLNEPnHs7VZxwYIxzNaIy/MaV4R3Qi0seiftA93uS+e79o
         r8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640544; x=1776245344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wAYwA8i6HQR6+x7nQ9JtS/eat0beW9e+Xk3Z/UyFlM=;
        b=AXqfV5Yg/OcMUA2ea9Rx7KV0iVz849/Bc/wuQjfpEbYCBiXSpQE+5+8iB45w0KnQVt
         Xwu++ubSwRaVFKcCarhLY2pmWXPC1aT05RVBwnDVueUMzV4An3BbZ0oNFXk4G6dNy3al
         XeTgHgSTpF/unc4KWInK5Lfb2B8B8qLggpIE8PYsbLkjLjUGLOFIen2UIVzkvW5QY+lh
         IelWuaqNFqDBAigDM4Hd1VS2aSK63IOhF/CW5axccxg8v9mXMJ92k8n0NXkIaRiPkL2F
         nLZlFnYywlCaRwnJk4KCyuADGx4WMbGIjzGZxDN+nJhKt1OdYqShOiI4wmJDqXNSqm/h
         dzCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz4WTxLIs9Z+bfEgeRNwFc2id1L5Ap4MYjGprVyZIYklMsTmPlqhGQzql1dBRX90KOBdptRrg2Zf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPJvbiWiNcxmAvkiG8ijXfvuEX0EVcQN+TMqB8xqLYsXxM7KFV
	1dJMvrNd3s/vG2iqn/LRyXTzDG4bwMCYPvBwyuyROEEw1N/kfrRoIChv
X-Gm-Gg: AeBDietWOjw0ciKvD9f+hQKqFS0Cgl/b1DuIlzCEL1A1lvWGkwNqtzSDL7LiiRU52UB
	100qFaxG626DiUc+EX2oXuKPddLrS/Ih3w9QSTqYjpYSc0+vi7BLSWao2zmBP+lmCimhwvU8+zQ
	5kwux2KOHMcmGmbUJ8YEk1mFNi1EXaAT0uqPmTcS8drYSd6K58l44PYjs2ya8f0Xvne1CVEBUoO
	ZZuCbyIwP97gJ3tl3VybyBDBoxIL63YL7xl5JhAybiLdX3YLL6EJeM0rdhBx0Jot/GoZjLWxNer
	8jhtLT+YtSuWt27EBSRS7sCRPSjl+aZ+ce+npBZPigQtB/wbfQimCMVq1t0uhSv/guJwGcUn4qN
	QXt9ggVakdKI1heWJj73QaxrnHgHDL+FVUUXiD2kn2NssNFPWJnshMaf8TMDwHXX2K9ZZOaiAkS
	lSlO4pW81EWdtwbfU1lQX5xfYUdfJBZ3duvjfTQX3tnH+YMGK6gjwsWaXgFC98YMZpkTx/7NG3c
	E0=
X-Received: by 2002:a05:600c:6986:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-488996ecbf3mr258854265e9.8.1775640543674;
        Wed, 08 Apr 2026 02:29:03 -0700 (PDT)
Message-ID: <4ebcb77b-7666-4087-b7c4-07e64260e5de@gmail.com>
Date: Wed, 8 Apr 2026 11:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/riscv: add exception table support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <dcf5786b4ec99edcec6554a338904c52f0c3b03f.1774863161.git.oleksii.kurochko@gmail.com>
 <a6c95e44-e324-493d-8e55-532223e56b17@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a6c95e44-e324-493d-8e55-532223e56b17@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775640544-BE54E0B1-E9372992/10/73395122804
X-purgate-type: spam
X-purgate-size: 3559
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 46C2B3B9E54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 8:24 AM, Jan Beulich wrote:
> On 31.03.2026 21:04, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/extable.c
>> @@ -0,0 +1,85 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <xen/bsearch.h>
>> +#include <xen/lib.h>
>> +#include <xen/livepatch.h>
>> +#include <xen/sort.h>
>> +#include <xen/virtual_region.h>
>> +
>> +#include <asm/extable.h>
>> +#include <asm/processor.h>
>> +
>> +#define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
>> +
>> +static inline unsigned long ex_insn(const struct exception_table_entry *ex)
>> +{
>> +    return EX_FIELD(ex, insn);
>> +}
>> +
>> +static inline unsigned long ex_fixup(const struct exception_table_entry *ex)
>> +{
>> +    return EX_FIELD(ex, fixup);
>> +}
>> +
>> +static void __init cf_check swap_ex(void *a, void *b)
>> +{
>> +    struct exception_table_entry *x = a, *y = b, tmp;
>> +    long delta = b - a;
>> +
>> +    tmp = *x;
>> +    x->insn = y->insn + delta;
>> +    y->insn = tmp.insn - delta;
>> +
>> +    x->fixup = y->fixup + delta;
>> +    y->fixup = tmp.fixup - delta;
>> +}
>> +
>> +static int cf_check cmp_ex(const void *a, const void *b)
>> +{
>> +    const unsigned long insn_a = ex_insn(a);
>> +    const unsigned long insn_b = ex_insn(b);
>> +
>> +    /* avoid overflow */
>> +    return (insn_a > insn_b) - (insn_a < insn_b);
> 
> What is the (slightly malformed) comment about? I don't see anything close
> to possibly causing overflow here.

Originally, I thought to imeplement this function something like:
   return insn_a - insn_b;

It'd get integer overflow when insn_a is a very small number and insn_b 
is very large.

It could drop the comment to avoid confusion.


> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/extable.h
>> @@ -0,0 +1,58 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef ASM__RISCV__ASM_EXTABLE_H
>> +#define ASM__RISCV__ASM_EXTABLE_H
>> +
>> +#ifdef __ASSEMBLER__
>> +
>> +#define ASM_EXTABLE(insn, fixup)    \
>> +    .pushsection .ex_table, "a";    \
>> +    .balign     4;                  \
>> +    .long       ((insn) - .);       \
>> +    .long       ((fixup) - .);      \
> 
> For readability's sake I'm generally advocating for having enough, but
> not more parentheses than necessary. What's the purpose of the outer pair
> here and ...
> 
>> +    .popsection;
>> +
>> +.macro asm_extable, insn, fixup
>> +    ASM_EXTABLE(\insn, \fixup)
>> +.endm
>> +
>> +#else /* __ASSEMBLER__ */
>> +
>> +#include <xen/stringify.h>
>> +#include <xen/types.h>
>> +
>> +struct cpu_user_regs;
>> +
>> +#define ASM_EXTABLE(insn, fixup)        \
>> +    ".pushsection .ex_table, \"a\"\n"   \
>> +    ".balign    4\n"                    \
>> +    ".long      ((" #insn ") - .)\n"    \
>> +    ".long      ((" #fixup ") - .)\n"   \
> 
> ... here?

It looked visually better to me but I am okay to drop them.

> 
> I'm also uncertain about the use of .long (generally in RISC-V code, and
> really also in some other architectures). Imo, considering suffixes used
> in the instruction set (e.g. load/store insns or OP-32 ones in RV64) .word
> may be the more expressive directive.

Agree, we could use .word instead of .long.

> 
> Preferably with the adjustments:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks a lot.

> Happy to carry out while committing, provided you agree.

I would be happy with that.

~ Oleksii

