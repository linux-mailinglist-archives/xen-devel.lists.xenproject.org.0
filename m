Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKhrHqV8xmnwKgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:48:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D823448B1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265567.1556404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66bW-0000In-Cw; Fri, 27 Mar 2026 12:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265567.1556404; Fri, 27 Mar 2026 12:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66bW-0000Gj-AF; Fri, 27 Mar 2026 12:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1265567;
 Fri, 27 Mar 2026 12:47:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w66bU-0000Gd-Mt
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:47:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w66bU-008Gwh-2b
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:47:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c67c7a-e002-0a2a0a5209dd-0a2a4505dc78-10
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:47:56 +0100
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c67c7b-5aeb-0a2a45050019-d155da34a96a-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:47:55 +0100
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b980b35534eso479465266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 05:47:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66ad6a4c4b3sm2225062a12.22.2026.03.27.05.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 05:47:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774615675; x=1775220475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G1JZ7x4TFZ9YUUsRHNL827EegWnaHOoVxvnjo4qZ/vc=;
        b=KG3jd4XriBqlzXsU0KdFgG7nOHd9/rXBCtef1NKYTAZLJl2bfvml8tRtTi9BjEEyLY
         ZjCaf9Pd/EMl8DOt/vuzQBe4vyoyKr7+psQGG0zL0PLNTLw/e/XymA+ceazuX9ID3rU3
         AFgQ3oAYygF2pLYlAKkhrn3GAtDP6bYGUJdHHfiSa1AhPwdnf+3J+Id1Ps7EzrGUasBu
         aZn0YowdjB8Ym87vfjUyuUkjebQTdbMdYbruRM7xzUrueGrufcf031hhI3rqiL1VyE8g
         IaYV0BPKjo7jwvPSwfAQWYIzkgJLohY9VyrT9CtNvTt56UUPSmqHNaAuZEV5AiHDY0uB
         Z3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615675; x=1775220475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1JZ7x4TFZ9YUUsRHNL827EegWnaHOoVxvnjo4qZ/vc=;
        b=QzKIPACzJII+OsJEVS9iH3fKx7G/Xq0GRTpJ7bc7ZSxGoK2JcOJlcLPHTyMXmg55CB
         KS/DBuOJgn8toUwYULFQXlf74DHsbyZpMRPw582FGi96b/dTVwyb2Jk9gXJB6D8CZ4+J
         60O+CQ4RrYLM9Sbc4+anMlFwHppEzOBvfhlC+P4Z85Fdj9UBiUPsdUtqFLck58JomWFP
         yP+0G/iSI5yA+UGvumBKAv76kwQ5HLzaoDDVsIF+ZPPOGuvFz6lD8Zu8K6YHqr4xzIv0
         ihKeJ0uO+w7nwQHuQd4ckEor+uzp5znsfIgn4OX7QflTe/+6Bref5ZholOk6HphVQwUt
         y+OA==
X-Forwarded-Encrypted: i=1; AJvYcCXWSyMF2u+O6f29dWbD4sivDEEWE+6LXx5AIVgj4EUnTmzPlUGBkBlmJdK9JScylLDGbnMoB8nmWgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHZi6myfaGZ2gym6qa6es+sR0PIJ7DKoqapuXtQSO8c8RqEKEt
	A/WmDeMcCK/biOJ5++wuQu74qzS/8uPfyvD326K7LnLQlfpAVZdS/zfz
X-Gm-Gg: ATEYQzyvjRjjeVf7dgLQeGdXV6kPkcgxJ6nDG1ox1s/UM5FdkH9EFQFBZOqLZJNtSR1
	+I0wtQdrIC1gPo5cXEPN+StOITtvqGEs4S+o4JK18TY2PN0fu7WHYH8qi5xl/0jQUkS+bLdQSEM
	rgZkZ1jEi3OKFa+inKLQq/V6qNB+4Bf5n1kB0fbIodd+qZCwSj2PDVdjcMy5r6cLUQXBAM3wtI8
	Mm+ZkMzzAlq1P4NHHq+1QtdLuZM4U5tP/WdUhN+4CbgS+yqWGlO2cS25dSxz/I2gN4VRvH0Xl1q
	iB1OkRYVcA3ympIf+1QPaAiG1TGld2tcczvM8Vts/8J2sme1oMChfo3XCenv6DU8DpGCJCFB5JJ
	R912ThTG+pN4hUduB1PZGSlCOqy+yykNaOsLVBG0/B3utVRRGlVCzv2H7oV9eL8fWH+08E74D6F
	5Ee50+6sYczbh5A0Hce/GZM49xaOW3y0NRtuLngHDgcr47zMRfcaNzMjXm/43QnCf0Ro8H3d4UF
	50=
X-Received: by 2002:a17:907:2d8a:b0:b98:f1d:6a63 with SMTP id a640c23a62f3a-b9b2e5921bbmr345986566b.9.1774615674917;
        Fri, 27 Mar 2026 05:47:54 -0700 (PDT)
Message-ID: <09c5badb-f58b-4331-8138-cba99eba17b0@gmail.com>
Date: Fri, 27 Mar 2026 13:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: add exception table support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <c6d30625371d56bb8345c987ac6d8095cc7301d2.1773419622.git.oleksii.kurochko@gmail.com>
 <db8fd1fa-2db4-4df4-8e21-1412783786b2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <db8fd1fa-2db4-4df4-8e21-1412783786b2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1774615675-81D5C488-6C13E4F5/0/0
X-purgate-type: clean
X-purgate-size: 10888
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: D8D823448B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 3:04 PM, Jan Beulich wrote:
> On 13.03.2026 17:44, Oleksii Kurochko wrote:
>> Introduce exception table handling for RISC-V so faults from selected
>> instructions can be recovered via fixup handlers instead of being
>> treated as fatal.
>>
>> Add the RISC-V exception table format, sorting at boot to allow binary
>> search used furthuer, and lookup from the trap handler. Update the
>> linker script to emit the .ex_table section using introduced common
>> EX_TABLE macro shared with other architectures.
>>
>> Also, the __start___ext_table is aligned now by POINTER_ALIGN instead
>> of just using hard-coded 8 as there is no too much sense to align
>> __start___ext_table by 8 for 32-bit systems.
> 
> Nit: The identifier named here twice isn't correct (extra 't').
> 
>> This implementation is based on Linux 6.16.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Open question:
>>
>> With some renaming the following could be generic, at least, between
>> x86 and RISC-V:
>>   - ASM_EXTABLE() definition
>>   - All what is conencted with sort_extable().
>>   - With some change of how x86 searchs an extension this cmp_ex_search()
>>     could also go to common file.
>>
>> Does it make sense to introduce xen/extable.h and common/extable.c?
> 
> Maybe, but not right here. Already the introduction of EX_TABLE for
> linker script use might better have been broken out.
> 
> Seeing the names you suggest here, ...
> 
>> ---
>>   xen/arch/riscv/Kconfig                |  1 +
>>   xen/arch/riscv/Makefile               |  1 +
>>   xen/arch/riscv/extables.c             | 85 +++++++++++++++++++++++++++
>>   xen/arch/riscv/include/asm/extables.h | 72 +++++++++++++++++++++++
>>   xen/arch/riscv/setup.c                |  3 +
>>   xen/arch/riscv/traps.c                |  3 +
>>   xen/arch/riscv/xen.lds.S              |  3 +
>>   xen/arch/x86/xen.lds.S                |  6 +-
>>   xen/include/xen/xen.lds.h             | 10 ++++
>>   9 files changed, 179 insertions(+), 5 deletions(-)
>>   create mode 100644 xen/arch/riscv/extables.c
>>   create mode 100644 xen/arch/riscv/include/asm/extables.h
> 
> ... is there a reason you use plural in the name here?

No, I'll use singular form.

I called it tables as potentially I will need a different types of 
exception table, so I counted different types as different exception tables.

> 
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -3,6 +3,7 @@ obj-y += cpufeature.o
>>   obj-y += domain.o
>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>   obj-y += entry.o
>> +obj-$(CONFIG_HAS_EX_TABLE) += extables.o
> 
> Simply obj-y please as long as the select is unconditional.

I see your point and at the moment there is no also other options how
to handle case(s) for which exception table is introduced now. But if 
potentially another mechanism will be introduced what will be the point 
to have extable.o code in the final binary?

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/extables.c
>> @@ -0,0 +1,85 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <xen/bsearch.h>
>> +#include <xen/lib.h>
>> +#include <xen/sort.h>
>> +#include <xen/virtual_region.h>
>> +
>> +#include <asm/extables.h>
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
>> +    int delta = b - a;
> 
> Better play safe and use "long" (as we have it for x86)?

It makes sense. Lets switch to "long".

> 
>> +    tmp = *x;
>> +    x->insn = y->insn + delta;
>> +    y->insn = tmp.insn - delta;
>> +
>> +    x->fixup = y->fixup + delta;
>> +    y->fixup = tmp.fixup - delta;
>> +}
>> +
>> +static int __init cf_check cmp_ex_sort(const void *a, const void *b)
>> +{
>> +    const unsigned long l = ex_insn(a);
>> +    const unsigned long r = ex_insn(b);
>> +
>> +    /* avoid overflow */
>> +    return (l > r) - (l < r);
>> +}
>> +
>> +void __init sort_extable(void)
> 
> Better account for live-patching right away (see corresponding x86 code)?

I will introduce then void init_or_livepatch sort_exception_table(...) 
and re-use it inside sort_extable() with renaming it to 
sort_exception_tables() to take into account live-patching which 
requires sort_exception_table().

> 
>> +{
>> +    sort(__start___ex_table,  __stop___ex_table - __start___ex_table,
>> +         sizeof(struct exception_table_entry), cmp_ex_sort, swap_ex);
>> +}
>> +
>> +static int cf_check cmp_ex_search(const void *key, const void *elt)
>> +{
>> +    const unsigned long k = *(const unsigned long *)key;
> 
> The deref here looks to be needed solely because you pass &pc into bsearch().
> Generally I'd expect both search functions to be pretty similar (if already
> distinct ones are needed, which indeed looks to make things easier here).

The stuff is easier with such implementation.

We could really drop cmp_ex_search() if to pass struct 
exception_table_entry instead of (unsigned long *) so the following will 
allow to drop cmp_ex_search():

@@ -78,12 +78,15 @@ bool fixup_exception(struct cpu_user_regs *regs)
      unsigned long pc = regs->sepc;
      const struct virtual_region *region = find_text_region(pc);
      const struct exception_table_entry *ex;
+    struct exception_table_entry key;

      if ( !region || !region->ex )
          return false;

-    ex = bsearch(&pc, region->ex, region->ex_end - region->ex,
-                 sizeof(struct exception_table_entry), cmp_ex_search);
+    key.insn = pc - (unsigned long)&key.insn;
+
+    ex = bsearch(&key, region->ex, region->ex_end - region->ex,
+                 sizeof(struct exception_table_entry), cmp_ex_sort 
/*cmp_ex_search*/);

Also, then I will rename l and r variable inside cmp_ex_sort() to
insn_a and insn_b.

> 
>> +    const unsigned long insn = ex_insn(elt);
>> +
>> +    /* avoid overflow */
>> +    return (k > insn) - (k < insn);
>> +}
>> +
>> +static bool ex_handler_fixup(const struct exception_table_entry *ex,
>> +			                 struct cpu_user_regs *regs)
> 
> Nit: Bad indentation.
> 
>> +{
>> +	regs->sepc = ex_fixup(ex);
>> +
>> +	return true;
> 
> Nit: Bad use of hard tabs.
> 
> And then - why the boolean return type, when this can't fail anyway?

As potentially we could have other handlers which might return not only 
true, so it will be easier to handle return type inside fixup_exception().

But if you think there is no any sense to have for handlers the same 
signature then I am also return void instead of bool for 
ex_handler_fixup().

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/extables.h
>> @@ -0,0 +1,72 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef ASM__RISCV__ASM_EXTABLES_H
>> +#define ASM__RISCV__ASM_EXTABLES_H
>> +
>> +#ifdef __ASSEMBLER__
>> +
>> +#define ASM_EXTABLE(insn, fixup)    \
>> +    .pushsection .ex_table, "a";    \
>> +    .balign     4;                  \
>> +    .long		((insn) - .);       \
>> +    .long		((fixup) - .);      \
> 
> Nit: More uses of hard tabs. Maybe that alone is the reason for the mis-aligned
> trailing backslashes.
> 
>> +    .popsection;
>> +.endm
> 
> I can't spot the corresponding .macro. What's going on here?

Good question... It was:

.macro asm_extable, insn, fixup
     ASM_EXTABLE(\insn, \fixup)
.endm

>> +
>> +/*
>> + * The exception table consists of pairs of relative offsets: the first
>> + * is the relative offset to an instruction that is allowed to fault,
>> + * and the second is the relative offset at which the program should
>> + * continue. No registers are modified, so it is entirely up to the
>> + * continuation code to figure out what to do.
> 
> And the program counter is not a register?
It is. "No register" meant no general purpose register. I will reprase 
this part to:

No general-purpose registers are modified by the exception handling 
mechanism itself, so it is up to the fixup code to handle any necessary 
state cleanup.

Or it could be just dropped.

> 
>> + * All the routines below use bits of fixup code that are out of line
>> + * with the main instruction path.  This means when everything is well,
>> + * we don't even have to jump over them.  Further, they do not intrude
>> + * on our cache or tlb entries.
> 
> What is this paragraph about? There's nothing "below" which I can
> associate this with.

It is orphaned from Linux (generally it is about that some functions 
from uaccess.h are using ASM_EXTABLE, the similar for Xen has in 
x86/uaccess.h). I'll rephrase it to:
  * The exception table and fixup code live out of line with the main
  * instruction path. This means when everything is well, we don't even
  * have to jump over them. Further, they do not intrude on our cache or
  * tlb entries.

> 
>> + */
>> +struct exception_table_entry {
>> +	int32_t insn, fixup;
>> +};
>> +
>> +extern struct exception_table_entry __start___ex_table[];
>> +extern struct exception_table_entry __stop___ex_table[];
>> +
>> +#ifdef CONFIG_HAS_EX_TABLE
> 
> Why, when this is a RISC-V specific header and HAS_EX_TABLE is selected
> unconditionally?

To handle the potential in future case that CONFIG_HAS_EX_TABLE will 
become conditional.
I thought that it makes sense to be in sync with common/virtual_region.c 
also uses ifdef around exception table related information.

> 
>> --- a/xen/include/xen/xen.lds.h
>> +++ b/xen/include/xen/xen.lds.h
>> @@ -219,4 +219,14 @@
>>   #define VPCI_ARRAY
>>   #endif
>>   
>> +#ifdef CONFIG_HAS_EX_TABLE
> 
> No real need for this?

Here I can agree that there is not reason as if CONFIG_HAS_EX_TABLE is n
then no one is expected to use exception table so the section is empty 
and don't occupy any extra space in binary (except potentially some 
space because of alignment).


> 
>> +#define EX_TABLE                  \
>> +        . = ALIGN(POINTER_ALIGN); \
> 
> Strictly speaking the original 8 (in x86 code) as much as this is more
> than we need - each element is a struct of 2 4-byte entities, after all.

For the  current struct - yes, we can do . = ALIGN(4) but if the 
architecture will add uint64_t inside (or unsigned long) shouldn't we 
then have ALIGN(POINTER_ALIGN)?

Thanks.

~ Oleksii


