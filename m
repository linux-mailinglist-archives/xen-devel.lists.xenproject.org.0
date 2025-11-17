Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC8C6401E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163641.1490725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKy6P-0000E6-Ck; Mon, 17 Nov 2025 12:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163641.1490725; Mon, 17 Nov 2025 12:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKy6P-0000BW-99; Mon, 17 Nov 2025 12:13:01 +0000
Received: by outflank-mailman (input) for mailman id 1163641;
 Mon, 17 Nov 2025 12:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lv5t=5Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vKy6N-0000BK-MQ
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:12:59 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c07d1a50-c3ae-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:12:57 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so7095267a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:12:57 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad45afsm1077729866b.24.2025.11.17.04.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:12:55 -0800 (PST)
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
X-Inumbo-ID: c07d1a50-c3ae-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763381576; x=1763986376; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az9gHNL8qQ7mPprXh8UhiU8If7r0NCz3Ctyr94ienqw=;
        b=EQgr5Kvu0ozFkZycbXN+ngb2LZTsUGpP/2FWVkPUGhFJ/GkCA2jEz6u6EhZDixwuRN
         QgOcCbLHotu94ncR8gKJMEJUsfBFnA0XVnnKZhQqNrJU6duTFbWxL9bl6NFbdKCPu2YN
         heYH1P0k1aJL/WNLBkMSWvzfuXyEeDyvEAtHrH5V38uSXKTv/F19dOH3Id9bOQId1JbX
         0owQLG9ixJEz48TOjcbLrxDqpWVQKY/4YPI281HacyLYnXO88rqeWBF2HF6KQs5k2pLu
         0TCdrlNAKI09lWG0sv03E5hicnQSQ2mx6TtSW7u+fW30fQuj3uHoeoXbW/QQI4nxQMYt
         rNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763381576; x=1763986376;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=az9gHNL8qQ7mPprXh8UhiU8If7r0NCz3Ctyr94ienqw=;
        b=J6YHS7DIKUYPYD4ZXpEIghyf7PU3xGTvTYeUaA5gnR2RCEiKwrFE/fU/oPutaEicdN
         QS3ntfOjiidb28halIDVIjElsA/aLd5zTT6aWmf5m1UcnPYc3Z/fU76198MtQeBdgo6w
         GKpUBa33kGm7es7YIdsF8cBK0Zj2dpBIu1Ol8+XBXo7YbsUSMa8veO9m5IsJhIH4QD0f
         VH/Ht5jBmV6RJMA6zKJGUeBIXzNqWsw+CeXuO2Flcu9BYfxjxXJCwif6NCTtk/aYNJDU
         t2XFrpkcyEwgRnzcctUUGdDkc1byu1Ep2PMblatdGwoWNsg0NEgl/VngSqP3AGqJAekf
         uctg==
X-Forwarded-Encrypted: i=1; AJvYcCWP19AIkQP1foq3q2ctlWSLlrbgys3T8yYlDUVDWv4Mm9daIjwVy8ytNJpQ3Rzcg1/SIzt1pl5ONBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzroPu8j6AHhJAxRgdMtWFhCufk/O4njOO53sn2Il1BXIAkLZJ
	rVg/zQKwnstj95skMMm6IIjjgaZe9EHaN26KHfIclmhIHqrykEIN2hC0
X-Gm-Gg: ASbGncuMv7AzFXyoZBkZY72GjJwLwziFTRq/IqWudEtqOgrQADzgmTNMm3FtbVFjEi/
	H9lqIuAecZTI8o2k3owgBkzyEfAOOQQaC4MJZglod8Uwfv6aIhCT+DVxJF1zSB4Zh0QGFvLC7Eg
	U9/mUWpnJO7NPIKMGFMjywrIWiaamxUj080ZkK3igNM24kq/r8JaLN4Hi1kcr0xfQkbKTwmZpIZ
	QlZUGlKCYrx44T4YEp/tHV5fDh94JxjaqD04GLP/kUb8HxQNXLs7E0QD+agqRqtgQ8vzZAHtunm
	oRkQYfK0j6oCsHG5bQKpQIRZW1A1PPlJu5laEe5PtjAY2clvE8ZvIDR2dHEzxnLPlhW0zj4h6Ke
	nea3fqw3PIdcH4jYZWpy0E1/UVCo+UrcTY7EtePws3k38uZKbtw+3Tc06g79UM2IawAZtwtyP/+
	/gqczc0RxXxLZR5yzsqetMMNu80YmO5rcdIHUKipJPxn+C3MhUgg==
X-Google-Smtp-Source: AGHT+IF0ch6YEXuno3TEA7RWQgYZyozTJuCc7D5BtxvUbn39DGGUyyTdBHsosbzp1ZJxfZsjMXYWiQ==
X-Received: by 2002:a17:907:60d0:b0:b72:a5bd:c585 with SMTP id a640c23a62f3a-b7367bc68fbmr1075736666b.46.1763381576147;
        Mon, 17 Nov 2025 04:12:56 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------hBrUH0xIX0VKVjdil9R6jiHA"
Message-ID: <f4630bd8-1684-4888-8c2a-58c23dfaa9f9@gmail.com>
Date: Mon, 17 Nov 2025 13:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 12/18] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <ff69e96dbb17e38e10468454d534061388201680.1760974017.git.oleksii.kurochko@gmail.com>
 <c77881bf-98aa-483f-8767-0be566f3dc34@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c77881bf-98aa-483f-8767-0be566f3dc34@suse.com>

This is a multi-part message in MIME format.
--------------hBrUH0xIX0VKVjdil9R6jiHA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/10/25 5:22 PM, Jan Beulich wrote:
> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>> This patch adds the initial logic for constructing PTEs from MFNs in the RISC-V
>> p2m subsystem. It includes:
>> - Implementation of p2m_pte_from_mfn(): Generates a valid PTE using the
>>    given MFN, p2m_type_t, including permission encoding and PBMT attribute
>>    setup.
>> - New helper p2m_set_permission(): Encodes access rights (r, w, x) into the
>>    PTE based on both p2m type and access permissions.
>> - p2m_set_type(): Stores the p2m type in PTE's bits. The storage of types,
>>    which don't fit PTE bits, will be implemented separately later.
>> - Add detection of Svade extension to properly handle a possible page-fault
>>    if A and D bits aren't set.
>>
>> PBMT type encoding support:
>> - Introduces an enum pbmt_type_t to represent the PBMT field values.
>> - Maps types like p2m_mmio_direct_dev to p2m_mmio_direct_io, others default
>>    to pbmt_pma.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V5:
>>   - Moved setting of p2m_mmio_direct_io inside (!is_table) case in p2m_pte_from_mfn().
>>   - Extend comment about the place of setting A/D bits with explanation
>>     why it is done in this way for now.
>> ---
>> Changes in V4:
>>   - p2m_set_permission() updates:
>>     - Update permissions for p2m_ram_rw case, make it also executable.
>>     - Add pernissions setting for p2m_map_foreign_* types.
>>     - Drop setting peromissions for p2m_ext_storage.
>>     - Only turn off PTE_VALID bit for p2m_invalid, don't touch other bits.
>>   - p2m_pte_from_mfn() updates:
>>     - Update ASSERT(), add a check that mfn isn't INVALID_MFN (1)
>>       explicitly to avoid the case when PADDR_MASK isn't narrow enough to
>>       catch the case (1).
>>     - Drop unnessary check around call of p2m_set_type() as this check
>>       is already included inside p2m_set_type().
>>   - Introduce new p2m type p2m_first_external to detect that passed type
>>     is stored in external storage.
>>   - Add handling of PTE's A and D bits in pm2_set_permission. Also, set
>>     PTE_USER bit. For this cpufeatures.{h and c} were updated to be able
>>     to detect availability of Svade extension.
>>   - Drop grant table related code as it isn't going to be used at the moment.
>> ---
>> Changes in V3:
>>   - s/p2m_entry_from_mfn/p2m_pte_from_mfn.
>>   - s/pbmt_type_t/pbmt_type.
>>   - s/pbmt_max/pbmt_count.
>>   - s/p2m_type_radix_set/p2m_set_type.
>>   - Rework p2m_set_type() to handle only types which are fited into PTEs bits.
>>     Other types will be covered separately.
>>     Update arguments of p2m_set_type(): there is no any reason for p2m anymore.
>>   - p2m_set_permissions() updates:
>>     - Update the code in p2m_set_permission() for cases p2m_raw_rw and
>>       p2m_mmio_direct_io to set proper type permissions.
>>     - Add cases for p2m_grant_map_rw and p2m_grant_map_ro.
>>     - Use ASSERT_UNEACHABLE() instead of BUG() in switch cases of
>>       p2m_set_permissions.
>>     - Add blank lines non-fall-through case blocks in switch cases.
>>   - Set MFN before permissions are set in p2m_pte_from_mfn().
>>   - Update prototype of p2m_entry_from_mfn().
>> ---
>> Changes in V2:
>>   - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
>>     functionality" which was splitted to smaller.
>> ---
>>   xen/arch/riscv/cpufeature.c             |   1 +
>>   xen/arch/riscv/include/asm/cpufeature.h |   1 +
>>   xen/arch/riscv/include/asm/page.h       |   8 ++
>>   xen/arch/riscv/p2m.c                    | 112 +++++++++++++++++++++++-
>>   4 files changed, 118 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
>> index b846a106a3..02b68aeaa4 100644
>> --- a/xen/arch/riscv/cpufeature.c
>> +++ b/xen/arch/riscv/cpufeature.c
>> @@ -138,6 +138,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
>>       RISCV_ISA_EXT_DATA(zbs),
>>       RISCV_ISA_EXT_DATA(smaia),
>>       RISCV_ISA_EXT_DATA(ssaia),
>> +    RISCV_ISA_EXT_DATA(svade),
>>       RISCV_ISA_EXT_DATA(svpbmt),
>>   };
>>   
>> diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
>> index 768b84b769..5f756c76db 100644
>> --- a/xen/arch/riscv/include/asm/cpufeature.h
>> +++ b/xen/arch/riscv/include/asm/cpufeature.h
>> @@ -37,6 +37,7 @@ enum riscv_isa_ext_id {
>>       RISCV_ISA_EXT_zbs,
>>       RISCV_ISA_EXT_smaia,
>>       RISCV_ISA_EXT_ssaia,
>> +    RISCV_ISA_EXT_svade,
>>       RISCV_ISA_EXT_svpbmt,
>>       RISCV_ISA_EXT_MAX
>>   };
>> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
>> index 78e53981ac..4b6baeaaf2 100644
>> --- a/xen/arch/riscv/include/asm/page.h
>> +++ b/xen/arch/riscv/include/asm/page.h
>> @@ -73,6 +73,14 @@
>>   #define PTE_SMALL       BIT(10, UL)
>>   #define PTE_POPULATE    BIT(11, UL)
>>   
>> +enum pbmt_type {
>> +    pbmt_pma,
>> +    pbmt_nc,
>> +    pbmt_io,
>> +    pbmt_rsvd,
>> +    pbmt_count,
>> +};
>> +
>>   #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
>>   
>>   #define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>> index 71b211410b..f4658e2560 100644
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -11,6 +11,7 @@
>>   #include <xen/sections.h>
>>   #include <xen/xvmalloc.h>
>>   
>> +#include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/flushtlb.h>
>>   #include <asm/paging.h>
>> @@ -349,6 +350,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>       return __map_domain_page(p2m->root + root_table_indx);
>>   }
>>   
>> +static int p2m_set_type(pte_t *pte, p2m_type_t t)
>> +{
>> +    int rc = 0;
>> +
>> +    if ( t > p2m_first_external )
>> +        panic("unimplemeted\n");
>> +    else
>> +        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>> +
>> +    return rc;
>> +}
>> +
>>   static p2m_type_t p2m_get_type(const pte_t pte)
>>   {
>>       p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
>> @@ -379,11 +392,102 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>>       p2m_write_pte(p, pte, clean_pte);
>>   }
>>   
>> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
>> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>>   {
>> -    panic("%s: hasn't been implemented yet\n", __func__);
>> +    e->pte &= ~PTE_ACCESS_MASK;
>> +
>> +    e->pte |= PTE_USER;
>> +
>> +    /*
>> +     * Two schemes to manage the A and D bits are defined:
>> +     *   • The Svade extension: when a virtual page is accessed and the A bit
>> +     *     is clear, or is written and the D bit is clear, a page-fault
>> +     *     exception is raised.
>> +     *   • When the Svade extension is not implemented, the following scheme
>> +     *     applies.
>> +     *     When a virtual page is accessed and the A bit is clear, the PTE is
>> +     *     updated to set the A bit. When the virtual page is written and the
>> +     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
>> +     *     address translation is in use and is not Bare, the G-stage virtual
>> +     *     pages may be accessed or written by implicit accesses to VS-level
>> +     *     memory management data structures, such as page tables.
> Can you point me at the part of the spec where this behavior is described?

Sure, it is mentioned here:
  https://github.com/riscv/riscv-isa-manual/blob/98ea4b5a409456ee28749748e1eafa8533c463bd/src/supervisor.adoc?plain=1#L1453

>   If
> things indeed work like this, ...
>
>> +     * Thereby to avoid a page-fault in case of Svade is available, it is
>> +     * necesssary to set A and D bits.
> ... I'd then agree with the "necessary" here. (Nit: note the extra 's' in your
> spelling.)

Oh, right.

Thanks.

~ Oleksii

--------------hBrUH0xIX0VKVjdil9R6jiHA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/25 5:22 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c77881bf-98aa-483f-8767-0be566f3dc34@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This patch adds the initial logic for constructing PTEs from MFNs in the RISC-V
p2m subsystem. It includes:
- Implementation of p2m_pte_from_mfn(): Generates a valid PTE using the
  given MFN, p2m_type_t, including permission encoding and PBMT attribute
  setup.
- New helper p2m_set_permission(): Encodes access rights (r, w, x) into the
  PTE based on both p2m type and access permissions.
- p2m_set_type(): Stores the p2m type in PTE's bits. The storage of types,
  which don't fit PTE bits, will be implemented separately later.
- Add detection of Svade extension to properly handle a possible page-fault
  if A and D bits aren't set.

PBMT type encoding support:
- Introduces an enum pbmt_type_t to represent the PBMT field values.
- Maps types like p2m_mmio_direct_dev to p2m_mmio_direct_io, others default
  to pbmt_pma.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V5:
 - Moved setting of p2m_mmio_direct_io inside (!is_table) case in p2m_pte_from_mfn().
 - Extend comment about the place of setting A/D bits with explanation
   why it is done in this way for now.
---
Changes in V4:
 - p2m_set_permission() updates:
   - Update permissions for p2m_ram_rw case, make it also executable.
   - Add pernissions setting for p2m_map_foreign_* types.
   - Drop setting peromissions for p2m_ext_storage.
   - Only turn off PTE_VALID bit for p2m_invalid, don't touch other bits.
 - p2m_pte_from_mfn() updates:
   - Update ASSERT(), add a check that mfn isn't INVALID_MFN (1)
     explicitly to avoid the case when PADDR_MASK isn't narrow enough to
     catch the case (1).
   - Drop unnessary check around call of p2m_set_type() as this check
     is already included inside p2m_set_type().
 - Introduce new p2m type p2m_first_external to detect that passed type
   is stored in external storage.
 - Add handling of PTE's A and D bits in pm2_set_permission. Also, set
   PTE_USER bit. For this cpufeatures.{h and c} were updated to be able
   to detect availability of Svade extension.
 - Drop grant table related code as it isn't going to be used at the moment.
---
Changes in V3:
 - s/p2m_entry_from_mfn/p2m_pte_from_mfn.
 - s/pbmt_type_t/pbmt_type.
 - s/pbmt_max/pbmt_count.
 - s/p2m_type_radix_set/p2m_set_type.
 - Rework p2m_set_type() to handle only types which are fited into PTEs bits.
   Other types will be covered separately.
   Update arguments of p2m_set_type(): there is no any reason for p2m anymore.
 - p2m_set_permissions() updates:
   - Update the code in p2m_set_permission() for cases p2m_raw_rw and
     p2m_mmio_direct_io to set proper type permissions.
   - Add cases for p2m_grant_map_rw and p2m_grant_map_ro.
   - Use ASSERT_UNEACHABLE() instead of BUG() in switch cases of
     p2m_set_permissions.
   - Add blank lines non-fall-through case blocks in switch cases.
 - Set MFN before permissions are set in p2m_pte_from_mfn().
 - Update prototype of p2m_entry_from_mfn().
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
---
 xen/arch/riscv/cpufeature.c             |   1 +
 xen/arch/riscv/include/asm/cpufeature.h |   1 +
 xen/arch/riscv/include/asm/page.h       |   8 ++
 xen/arch/riscv/p2m.c                    | 112 +++++++++++++++++++++++-
 4 files changed, 118 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index b846a106a3..02b68aeaa4 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -138,6 +138,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(zbs),
     RISCV_ISA_EXT_DATA(smaia),
     RISCV_ISA_EXT_DATA(ssaia),
+    RISCV_ISA_EXT_DATA(svade),
     RISCV_ISA_EXT_DATA(svpbmt),
 };
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 768b84b769..5f756c76db 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -37,6 +37,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zbs,
     RISCV_ISA_EXT_smaia,
     RISCV_ISA_EXT_ssaia,
+    RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
     RISCV_ISA_EXT_MAX
 };
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 78e53981ac..4b6baeaaf2 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -73,6 +73,14 @@
 #define PTE_SMALL       BIT(10, UL)
 #define PTE_POPULATE    BIT(11, UL)
 
+enum pbmt_type {
+    pbmt_pma,
+    pbmt_nc,
+    pbmt_io,
+    pbmt_rsvd,
+    pbmt_count,
+};
+
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
 #define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 71b211410b..f4658e2560 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -11,6 +11,7 @@
 #include &lt;xen/sections.h&gt;
 #include &lt;xen/xvmalloc.h&gt;
 
+#include &lt;asm/cpufeature.h&gt;
 #include &lt;asm/csr.h&gt;
 #include &lt;asm/flushtlb.h&gt;
 #include &lt;asm/paging.h&gt;
@@ -349,6 +350,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m-&gt;root + root_table_indx);
 }
 
+static int p2m_set_type(pte_t *pte, p2m_type_t t)
+{
+    int rc = 0;
+
+    if ( t &gt; p2m_first_external )
+        panic("unimplemeted\n");
+    else
+        pte-&gt;pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
+
+    return rc;
+}
+
 static p2m_type_t p2m_get_type(const pte_t pte)
 {
     p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
@@ -379,11 +392,102 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
     p2m_write_pte(p, pte, clean_pte);
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+static void p2m_set_permission(pte_t *e, p2m_type_t t)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    e-&gt;pte &amp;= ~PTE_ACCESS_MASK;
+
+    e-&gt;pte |= PTE_USER;
+
+    /*
+     * Two schemes to manage the A and D bits are defined:
+     *   • The Svade extension: when a virtual page is accessed and the A bit
+     *     is clear, or is written and the D bit is clear, a page-fault
+     *     exception is raised.
+     *   • When the Svade extension is not implemented, the following scheme
+     *     applies.
+     *     When a virtual page is accessed and the A bit is clear, the PTE is
+     *     updated to set the A bit. When the virtual page is written and the
+     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
+     *     address translation is in use and is not Bare, the G-stage virtual
+     *     pages may be accessed or written by implicit accesses to VS-level
+     *     memory management data structures, such as page tables.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can you point me at the part of the spec where this behavior is described?</pre>
    </blockquote>
    <pre>Sure, it is mentioned here:
 <a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-isa-manual/blob/98ea4b5a409456ee28749748e1eafa8533c463bd/src/supervisor.adoc?plain=1#L1453">https://github.com/riscv/riscv-isa-manual/blob/98ea4b5a409456ee28749748e1eafa8533c463bd/src/supervisor.adoc?plain=1#L1453</a>

</pre>
    <blockquote type="cite"
      cite="mid:c77881bf-98aa-483f-8767-0be566f3dc34@suse.com">
      <pre wrap="" class="moz-quote-pre"> If
things indeed work like this, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+     * Thereby to avoid a page-fault in case of Svade is available, it is
+     * necesssary to set A and D bits.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... I'd then agree with the "necessary" here. (Nit: note the extra 's' in your
spelling.)</pre>
    </blockquote>
    <pre>Oh, right.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------hBrUH0xIX0VKVjdil9R6jiHA--

