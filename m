Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /kzpF1ESMWqnbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:07:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D168D5EF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ry2aSVEg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338854.1599922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPlP-0003Nb-Gj; Tue, 16 Jun 2026 09:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338854.1599922; Tue, 16 Jun 2026 09:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPlP-0003Kp-Dl; Tue, 16 Jun 2026 09:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1338854;
 Tue, 16 Jun 2026 09:07:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZPlO-0003Ki-Cy
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:07:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPlN-00AUh0-It
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:07:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a31123b-bab6-0a2a0a5309dd-0a2a450be47c-16
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:07:17 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a311245-212f-0a2a450b0019-d1558030ec04-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:07:17 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-491b390f9e9so35811615e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:07:17 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa47ce3sm70453485e9.6.2026.06.16.02.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:07:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781600837; x=1782205637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjnduMJFHS+xxz3cT4hM41FU48yKcZFCce1UDtuUHkw=;
        b=Ry2aSVEgtQ27DiqmjgE9kRhMprlZDjMq4TAEds80Ac4fJyjKDBG0nsDJ3zLqaTMjtc
         Sq6sPIJgyvsuSoIjagTdO1WVDKRmp/auddSGTsQAw67YISFxJnA7bqtQyRQXW1K/tfh3
         cyg5gBwLk7dPPPq1rttXeKs2SiQOPF4UQJLS76m+Q5SZRnXERI4cBWaI+LINiC6NJk1q
         ZpquThJ05jyEzSKt9UIqN0JN3f6o7fTWYS8tJq6Dk9dlfMNujZLo8vLjOg3OLIKHUdqp
         i/NRY8tM108T7V5iYM5yHBbs2zIN9m4hT6FyY1rIBNltcxErX2xAcu3J8gP4t3My/uvo
         Oc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600837; x=1782205637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjnduMJFHS+xxz3cT4hM41FU48yKcZFCce1UDtuUHkw=;
        b=lf+clIwT49/ZlZ/1PnG3SWJI9UHg1+LnzDFs4alZMbjrrWmNDAjikp0zI8vXF2roDF
         5lN9kGPW8ztGdTMN6ZxunQf0WXPGoUJvQNp1vPhOFX4JDuChl2hDcd+qiPQ5X0Gl2W7Y
         ieNDM+m734gimhM6pxmxAYWT2SOX1vaz8ALh7fD0B5+XL4REreWGaud4CpUXOLrhQIFa
         cQo1lh8MwI+ViMRHqTxBUbP9rQR8DnY7PEB0gQOQxFtrkH6bbrhXM2qJ10UmUstVVZ1+
         vWmQUuETvLmfaJHANCbR4bs4M0BX91g6a2mWlpmS14enDRNPHnm3Sm5WMp+k0maCTQTN
         ykig==
X-Forwarded-Encrypted: i=1; AFNElJ8eQwVBp2rSYpneJmO3NbpTx2RxP+bQjnP0ZR8WziCp4PBbha6Z7lfdorvva1BXUMhUTWGIjhFwrZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKRPJYMkaUh+pyvkHj8RtgVpC6+b/v8Vioft3ncsJnBpU3kEYQ
	bar/XsbnqbPMGrD4ezE1Y0wbogH8bc5amYmFt5MjIG2KJNvTEvHUyzff
X-Gm-Gg: Acq92OHJP2OXdcvQptYKe/PS0nhM8sPlx3DpkYE4WTqrzGSJftHM5erACuWfroZYDla
	Jp117y9BWyUBXysmBZXwf4hnPWoJndUFAqZWzoje8afszj/NWAHJbzaGZiZrnFdSahdVuOZvoJD
	lMxPPqkPreikZmy/OfSE4d6qwKGxZ5I65SIw1Z7e/wIlszkV/SduY/vfUeZNxkYu8zkzv9spIhk
	J9Qu//d0UTaFJSOrHi22egBxzHYKVbHpByoBhTc3oHeBt9LU+jTM/BMvG8PdraJ6VbDrgDcNuUd
	kmqHN8/TMPmrfw9FPPoZvOecxM2d0JoJ2QuZNwYALi8Jv+8KuAKCo9PK3PNdm87zjcMeSoZtrOZ
	ct9lNSwHlM+CYDB0MBQvwn/odSNo0EBn3CkJLby5MGwW9+I3v1Vwxh84njgEwwSbp5OqegjuuTK
	MSrPyA8OJgX5ZOsWI6yBb5WBG9qEOaUgIJWLhvbeku2SBAU9oDzhOZZUkajS1fOq4MUEntyiLdW
	3QgBQ==
X-Received: by 2002:a05:600c:8b16:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4922ff8ee70mr39556045e9.3.1781600836261;
        Tue, 16 Jun 2026 02:07:16 -0700 (PDT)
Message-ID: <68a7f2bc-91f5-4a19-afa7-4a9fd065f558@gmail.com>
Date: Tue, 16 Jun 2026 11:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/26] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <434e0be590bc0550e143836edff7e8e1e96b28c1.1778250616.git.oleksii.kurochko@gmail.com>
 <133430db-5605-4f3a-8ff7-77f9b57c91ad@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <133430db-5605-4f3a-8ff7-77f9b57c91ad@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781600837-1B175F3B-FECCBCE2/10/73395122804
X-purgate-type: spam
X-purgate-size: 18417
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,microchip.com:email];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D7D168D5EF



On 6/15/26 5:13 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> Guests running under Xen program interrupt routing by writing to APLIC
>> MMIO registers. Xen must intercept these accesses to enforce interrupt
>> isolation between domains and to translate guest routing intent into the
>> underlying physical MSI topology.
>>
>> Writes are gated by the domain's authorised interrupt bitmap so that a
>> guest cannot affect interrupts it does not own. TARGET register writes
>> additionally require translation of the hart and IMSIC guest-file
>> indices from virtual to physical, as the APLIC uses these fields
>> directly to compute the MSI delivery address.
>>
>> Delegation (APLIC_SOURCECFG_D) is not yet supported.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - Merge the following patches into one:
>>      xen/riscv: add vaplic access check:
>>        - Add check that address is properly aligned.
>>        - Check vaplic range intead of APLIC one.
>>        - Return bool from vaplic_is_access instead of int.
>>      xen/riscv: emulate guest writes to virtual APLIC MMIO
>>        - Drop CALC_REG_VALUE.
>>        - Use unsigned int instead of uin32_t for offset.
>>        - s/.../subtracting in the comment.
>>        - start one line comments from the upper case.
>>        - Check the value before being written to sourcecfg register.
>>        - 'unsigned int' for loop index.
>>        - Omit unneessary braces.
>>        - s/vaplic_update_target/aplic_msi_target_gen.
>>        - Use IMSIC_MMIO_PAGE_SHIFT instead of 12 in aplic_msi_target_gen().
>>        - Drop explicit usage of APLIC register in store function.
>>        - Drop APLIC_REG_{GET,SET} macros and introudce APLIC specific funtcions.
>>        - Ignore write to SOURCECFG_BASE when value is out-of-range.
>>        - Drop ASSERT(!target_vcpu) inside handler of targer register setting,
>>          just avoid such writings + debug message.
>>        - domain_crash() instead of panic() in the case of default case.
>>        - Drop ASSERT() in APLIC_SOURCE_CFG_BASE case and use domain_crash()
>>          instead.
>>      xen/riscv: emulate guest reads from virtual APLIC MMIO:
>>        - s/regval_to_irqn/regindx_to_irqn.
>>        - pass to to_vaplic() a domain instead of vintc.
>>        - add check that load access is aligned.
>>        - instead of panic() just crash a domain().
>>        - use 'unsigned int' for local variable offset.
>>        - Return 0 in the case APLIC_CLRIE_BASE ...APLIC_CLRIE_LAST reading to
>>          follow AIA spec.
>>        - Drop explicit usage of physical APLIC registers.
>> ---
>>   xen/arch/riscv/aplic.c              |  25 +++
>>   xen/arch/riscv/include/asm/aplic.h  |   9 +
>>   xen/arch/riscv/include/asm/intc.h   |  10 +-
>>   xen/arch/riscv/include/asm/vaplic.h |   3 +
>>   xen/arch/riscv/vaplic.c             | 289 +++++++++++++++++++++++++++-
>>   5 files changed, 333 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>> index 1c8fd0145eb2..1976733dfbaa 100644
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -40,6 +40,31 @@ static struct intc_info __ro_after_init aplic_info = {
>>       .hw_version = INTC_APLIC,
>>   };
>>   
>> +uint32_t aplic_hw_read_reg(unsigned int offset, uint32_t mask)
>> +{
>> +    unsigned long flags;
>> +    uint32_t val;
>> +
>> +    ASSERT(offset < aplic.size);
> 
> Further assert suitable alignment of "offset"?

Sure, I will update ASSERT(...) to:
   ASSERT((offset < aplic.size) && IS_ALIGNED(offset, sizeof(uint32_t)));

> 
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +    val = readl((void __iomem *)((uintptr_t)aplic.regs + offset)) & mask;
> 
> Easier as
> 
>      val = readl((volatile void __iomem *)aplic.regs + offset) & mask;
> 
> ? (Note that like const, volatile also shouldn't be cast away.)

Is arithmetic on void * pointers correct from the C standard's point of 
view?

It works with GCC (see 
https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html), but I can't find 
anything that guarantees the same behavior for other compilers.

I'm okay with the suggested change if it's acceptable for Xen to rely on 
GCC's void * pointer arithmetic extension.

> 
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -15,6 +15,8 @@
>>   
>>   #include <asm/imsic.h>
>>   
>> +#define APLIC_NUM_REGS 32
> 
> What's this? It isn't used afaics, and it also doesn't match up with ...

It is rudement and isn't used anymore. It should be just dropped.

> 
>> @@ -24,6 +26,8 @@
>>   #define APLIC_DOMAINCFG_IE      BIT(8, U)
>>   #define APLIC_DOMAINCFG_DM      BIT(2, U)
>>   
>> +#define APLIC_SOURCECFG_D       BIT(10, U)
>> +
>>   #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>>   #define APLIC_SOURCECFG_SM_DETACH       0x1
>>   #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
>> @@ -71,6 +75,8 @@
>>   #define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
>>                                    APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
>>   
>> +#define APLIC_SETCLR_OFFSET_MASK  ((32 * sizeof(uint32_t)) - 1)
>> +
>>   struct aplic_regs {
>>       uint32_t domaincfg;         /* 0x0000 */
>>       uint32_t sourcecfg[1023];   /* 0x0004 */
>> @@ -114,4 +120,7 @@ struct aplic_regs {
>>       uint32_t target[1023];      /* 0x3008 */
>>   };
> 
> ... this struct holding all the (far more than 32) registers.
> 
> As to APLIC_SETCLR_OFFSET_MASK: Any reason it has the low 2 bits set? 

Agree, with the current defintion of AIA spec. low 2 bits are always 0 
so APLIC_SETCLR_OFFSET_MASK should be updated correspondingly ...


The
> literal 32 in there also looks rather arbitrary. It would be helpful if
> there was a connection to those 32-s in struct aplic_regs that it actually
> matches up with.

t could be updated to make the relationship clearer:

#define APLIC_SETCLR_OFFSET_MASK  (sizeof_field(struct aplic_regs, 
setip) - 1)

Using setip is fine here, as all SET* and CLR* register groups consist 
of 32 registers and therefore have identical sizes. Adding a brief 
comment above APLIC_SETCLR_OFFSET_MASK to explain this could improve 
readability:

/*
  * Using setip is fine here, as all SET* and CLR* register groups 
consist of 32
  * registers and therefore have identical sizes.
  */
#define APLIC_SETCLR_OFFSET_MASK  (sizeof_field(struct aplic_regs, 
setip) - 1)

Also, BUILD_BUG_ON() could be added to aplic_preinit() to verify what is 
mentioned in the comment if it makes sense.

...:

#define APLIC_SETCLR_OFFSET_MASK
     (sizeof_field(struct aplic_regs, setip) - sizeof(uint32_t))

> 
>> --- a/xen/arch/riscv/include/asm/vaplic.h
>> +++ b/xen/arch/riscv/include/asm/vaplic.h
>> @@ -26,6 +26,9 @@ struct vaplic_regs {
>>   struct vaplic {
>>       struct vintc vintc;
>>       struct vaplic_regs regs;
>> +
>> +    paddr_t regs_start;
>> +    paddr_t regs_size;
> 
> Can regs_size really go beyond 4G?

Good question and it depends on an amount of vCPUs:

#define APLIC_MIN_SIZE          0x4000
#define APLIC_SIZE_ALIGN(x)     ROUNDUP(x, APLIC_MIN_SIZE)

#define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
                                  APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * 
(nr_cpus)))

paddr_t aplic_size = APLIC_SIZE(d->max_vcpus);

With the current limitation of 128 vCPUs max (IIRC) it won't beyond 4G.

> 
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -26,6 +26,283 @@
>>   
>>   #define FDT_VAPLIC_INT_CELLS 2
>>   
>> +#define AUTH_IRQ_BIT(d, irqn) ( \
>> +    ((irqn) <= (d)->arch.vintc->irq_nums) && \
>> +    test_bit(irqn, (d)->arch.vintc->allocated_irqs) )
>> +
>> +#define regindx_to_irqn(reg_val) ((reg_val) / sizeof(uint32_t))
>> +
>> +static inline uint32_t generate_auth_mask(const struct domain *d,
>> +                                          unsigned int irqsn)
>> +{
>> +    if ( irqsn >= DIV_ROUND_UP(d->arch.vintc->irq_nums,
>> +                               sizeof(uint32_t) * BITS_PER_BYTE) )
> 
> Why the rounding up? Isn't ->irqs_num the proper upper bound?

Probably irqsn isn't a correct name here as it looks like "IRQ source 
number" (an IRQ number), but regindx_to_irqn(offset & MASK) actually 
computes offset / 4 - a word index into the used_irqs bitmap. Word 0 
covers IRQs 0–31, word 1 covers IRQs 32–63, etc.
Given that, the bounds check:
   irqsn >= DIV_ROUND_UP(irq_nums, sizeof(uint32_t) * BITS_PER_BYTE)
is "word index >= number of 32-bit words in the bitmap" which is 
correct. The DIV_ROUND_UP converts the IRQ count into a word count to 
compare against the word index.

So the real issue is naming. There are two options to resolve it:
- rename to reflect reality; call it word_idx (not irqsn), and rename 
regindx_to_irqn to something like regoffset_to_word_idx. The 
DIV_ROUND_UP check then reads clearly.

- Change the API to take an actual IRQ number, pass irqsn * 32 (the 
first IRQ in the word) and check irqsn >= irq_nums directly, computing 
the word index inside generate_auth_mask. This aligns with how 
AUTH_IRQ_BIT works.

Which one option do you prefer?

> 
>> +    {
>> +        dprintk(XENLOG_DEBUG, "incorrect irqsn(%d) is passed\n", irqsn);
> 
> Once again: %u please with an unsigned int argument.
> 
>> +        return 0U;
>> +    }
>> +
>> +    return *((uint32_t *)d->arch.vintc->allocated_irqs + irqsn);
> 
> Such casts would better be avoided

It was just a convenient way to find necessary word.

Would it be better to have the following:
  return (uint32_t)(d->arch.vintc->used_irqs[(irqsn * 32) / 
BITS_PER_LONG] >> ((irqsn * 32) % BITS_PER_LONG));


> 
>> +static int vaplic_emulate_load(const struct vcpu *vcpu,
> 
> v please for struct vcpu * variables (in the common case, of course there can
> be exceptions).
> 
>> +                               const unsigned long addr, uint32_t *out)
>> +{
>> +    const struct domain *d = vcpu->domain;
>> +    const struct vaplic *vaplic = to_vaplic(d);
>> +    const unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
>> +    uint32_t auth_mask;
>> +    unsigned int i;
>> +
>> +    switch ( offset )
>> +    {
>> +    case APLIC_DOMAINCFG:
>> +        *out = vaplic->regs.domaincfg;
>> +
>> +        return 0;
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_SETIPNUM_LE:
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIENUM:
>> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
> 
> For ranges like this APLIC_REG_OFFSET_MASK having the low two bits clear
> (or there being some other mechanism to ensure only properly aligned
> offsets are handled) would help. Mis-aligned accesses shouldn't be
> handled ...
> 
>> +        /*
>> +         * Based on the RISC-V AIA spec a read of these registers
>> +         * always returns zero
>> +         */
>> +        *out = 0;
>> +
>> +        return 0;
> 
> ... like this.

There is such check in vaplic_is_access() below. I will add a comment 
above vaplic_emulate_load() that offset is properly aligned because of 
the check in vaplic_is_access(). The similar comment I'll add for 
vaplic_emulate_store().

> 
>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
>> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
>> +        i = regindx_to_irqn(offset & APLIC_SETCLR_OFFSET_MASK);
>> +        auth_mask = generate_auth_mask(d, i);
>> +
>> +        break;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +        /*
>> +         * As target registers start for 1:
> 
> s/for/from/ ?

I'll apply that.

> 
>> +         *  0x3000 genmsi
>> +         *  0x3004 target[1]
>> +         *  0x3008 target[2]
>> +         *   ...
>> +         *  0x3FFC target[1023]
>> +         * It is necessary to calculate an interrupt number by substracting
>> +         * of APLIC_GENMSI instead of APLIC_TARGET_BASE.
> 
> Stray "of"? Or did you mean "subtraction"? (Also check other similar comments.)

Agree, 'of' should be dropped here.

> 
>> +    default:
>> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
>> +                 offset);
>> +
>> +        domain_crash(vcpu->domain);
>> +
>> +        return -EINVAL;
>> +    }
>> +
>> +    *out = aplic_hw_read_reg(offset, auth_mask);
> 
> You blindly assume a 32-bit access here (and also in the write counterpart).
> How do you end up knowing?

he APLIC spec requires all register accesses to be 32-bit wide.

Also, I have the following at the caller side (yes, it can't be 
understand from the current patch):

     /* Fault address should be aligned to length of MMIO */
     if ( fault_addr & (len - 1) )
         return -EIO;

     if ( vintc->ops->is_access(vcpu, fault_addr) )
     {
         /* PLIC/APLIC access are always on 32bit */
         ASSERT( len == 4 );
         rc = vintc->ops->emulate_store(vcpu, fault_addr, data32);
         if ( rc < 0 )
             return rc;
     }

Probably it would be better addi a size parameter to both callbacks:

int (*emulate_load)(const struct vcpu *vcpu, unsigned long addr,
                     unsigned int size, uint32_t *out);
int (*emulate_store)(const struct vcpu *vcpu, unsigned long addr,
                      unsigned int size, uint32_t in);
Then vaplic_emulate_load can validate upfront:


if ( size != sizeof(uint32_t) )
{
     gdprintk(XENLOG_WARNING, "APLIC: unsupported access size %u\n", size);
     domain_crash(vcpu->domain);
     return -EINVAL;
}

or maybe it would be better instead of domain_crash() just ignore such 
loads:

if ( size != sizeof(uint32_t) )
{
     gdprintk(XENLOG_WARNING,
              "APLIC: unsupported %u-byte access at offset %#x, ignoring\n",
              size, offset);
     *out = 0;   /* for loads */
     return 0;
}

I want to add size argument as I think that I want to introduce common 
MMIO handling instead of is_access() to avoid growing of if/else in the 
snippet above

> 
>> +static int cf_check vaplic_emulate_store(const struct vcpu *vcpu,
>> +                                         unsigned long addr, uint32_t value)
> 
> Why cf_check here but not for vaplic_emulate_load()?

It should be added for both.

> 
>> +{
>> +    int rc = -EINVAL;
>> +    const struct domain *d = vcpu->domain;
>> +    unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
>> +
>> +    switch ( offset )
>> +    {
>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
>> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
>> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
>> +    {
>> +        unsigned int irqn = regindx_to_irqn(offset & APLIC_SETCLR_OFFSET_MASK);
>> +        value &= generate_auth_mask(d, irqn);
>> +
>> +        break;
>> +    }
>> +
>> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
>> +        if ( value & APLIC_SOURCECFG_D )
>> +        {
>> +            rc = -EOPNOTSUPP;
>> +
>> +            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
>> +
>> +            goto fail;
>> +        }
>> +
>> +        /*
>> +         * As sourcecfg register starts from 1:
>> +         *   0x0000 domaincfg
>> +         *   0x0004 sourcecfg[1]
>> +         *   0x0008 sourcecfg[2]
>> +         *    ...
>> +         *   0x0FFC sourcecfg[1023]
>> +         * It is necessary to calculate an interrupt number by subtracting
>> +         * of APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
>> +         */
>> +        if ( !AUTH_IRQ_BIT(d, regindx_to_irqn(offset - APLIC_DOMAINCFG)) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return 0;
>> +
>> +        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
>> +        {
>> +            gdprintk(XENLOG_ERR,
>> +                     "value(%u) is incorrect for sourcecfg register\n", value);
>> +
>> +            return 0;
>> +        }
>> +
>> +        break;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +    {
>> +        struct vcpu *target_vcpu = NULL;
>> +
>> +        /*
>> +         * Look at vaplic_emulate_load() for explanation why
>> +         * APLIC_GENMSI is subtracted.
>> +         */
>> +        if ( !AUTH_IRQ_BIT(d, regindx_to_irqn(offset - APLIC_GENMSI)) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return 0;
>> +
>> +        for ( unsigned int i = 0; i < vcpu->domain->max_vcpus; i++ )
>> +        {
>> +            struct vcpu *v = vcpu->domain->vcpu[i];
>> +
>> +            if ( v->vcpu_id == (value >> APLIC_TARGET_HART_IDX_SHIFT) )
>> +            {
>> +                target_vcpu = v;
>> +                break;
>> +            }
>> +        }
> 
> Why is a loop needed here? vCPU-s are numbered sequentially.

Agree, it isn't needed. The following will be enough:

         unsigned int hart_idx = value >> APLIC_TARGET_HART_IDX_SHIFT;

         if ( hart_idx < vcpu->domain->max_vcpus )
             target_vcpu = vcpu->domain->vcpu[hart_idx];

> 
>> +static bool cf_check vaplic_is_access(const struct vcpu *vcpu,
>> +                                      unsigned long addr)
>> +{
>> +    const struct vaplic *vaplic = to_vaplic(vcpu->domain);
>> +    paddr_t start = vaplic->regs_start;
>> +    paddr_t end = vaplic->regs_start + vaplic->regs_size;
>> +
>> +    if ( addr & 0x3 )
> 
> Nit: Does the 0x here add any value?

Agree, there is no any sense.

> 
>> +    {
>> +        dprintk(XENLOG_DEBUG,
>> +                "APLIC MMIO address should be properly aligned\n");
>> +
>> +        return false;
>> +    }
> 
> Ah, okay - here is the alignment check. Mind me asking for a (documenting)
> assertion then in the actual read and write handlers?

Sure, I will add the comment above or add a correspondent ASSERT().

> 
>> +    /* check if it is an APLIC access */
> 
> Nit: Style.

I will update that.

Thanks.

~ Oleksii

