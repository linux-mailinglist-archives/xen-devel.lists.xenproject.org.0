Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7DFC5E6CD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 18:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162801.1490317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJxDc-0002PZ-4t; Fri, 14 Nov 2025 17:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162801.1490317; Fri, 14 Nov 2025 17:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJxDc-0002NJ-0w; Fri, 14 Nov 2025 17:04:16 +0000
Received: by outflank-mailman (input) for mailman id 1162801;
 Fri, 14 Nov 2025 17:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jk/=5W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vJxDa-0002ND-IL
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 17:04:14 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1af2d98-c17b-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 18:04:13 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so3432346a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 09:04:12 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fedb91bsm421284266b.70.2025.11.14.09.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 09:04:11 -0800 (PST)
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
X-Inumbo-ID: f1af2d98-c17b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763139852; x=1763744652; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xaxRGVd51zbr8z+5hwXTma7PMkYBPKA8ZE0YBvceC0=;
        b=b4FekbvOAUD55OvLLpHPTREN+KEi7cswbRTlhJX4PbaYq2Xi/lB3gEP5jU0AFHXyyh
         QJVM83uKxOiRIWENdMGI8aAokv/51YJjzdWNfA8983eBT2rxKOUyMV6Z79T+trqin4yX
         hp7hSi8Ms+rt4KToOvGUxa+JjuiqNDaIfPYTVUOrCDUmswp9lCpomyVIdPxwyyRJ8C2W
         oo3drid4UeZz9HS63EdJA+fm1RfL7dkMree9NbrMtG3+kaqUUrZw4Fisc3KD1xDhBWq6
         ZztauUzjK7VxaslStwy772RYsbd+j8cbDxE32NpgoetCzuW0Mjs97Lrco04ngwf6XQW5
         aN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763139852; x=1763744652;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xaxRGVd51zbr8z+5hwXTma7PMkYBPKA8ZE0YBvceC0=;
        b=qKjgIzio8HTow2hvD3h4UU2jou7Ud498hUjFIMYG44WOeiHrHLJ853Pk91zUtTuCNG
         oK88Zn/r9h4BVBG0aw19mkB2b98egFshiPIR0GsNuBATg1mlGXBHiUw5kVzk0R5cGBSp
         xm0mZJQymrPOrrHrrlF50/q9cZtEZ8F2yYQbJzH9BZnCLkLD6zxlj0hv/sjcBP2mIIF8
         2Dk5q72+44HfnIyb6dpSz7JKH47HEJB1SDI/tCPcDbhTRL/LiG5VguTH+n0pfPrd1crC
         c9Df33IxPT2DBNhgmPRh56VB+l+kumpmaAdUarWXXh2pTi62KZm6LHegMUWfBcrPYZW8
         mXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyNtOgAmCWPqxQ84qpkyRTmpmQgsmfrEvaqrUGccVzxNMwvhgDnbTbh3Wp3LYjNtY61H3XPXMrrTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLFi+Bey/7jbHajJ1QLDjG4Ioidxf0QelVfGihsvFSUp1bQDec
	t7CuS+cSiw1wyFnWCZc1vsbPdndiJxp3BTeRT5GY5sWR9q5FVgc1TP36
X-Gm-Gg: ASbGncuvxSzD3pZl0EgpSVe3rtnmG0/yJFgZDPDm2oF7ZY0tXEgXiojHa1zKV65BjRM
	V5WsYPzD9Gt5p0e7caeHYRXHTyfIByTynNDo4B/aG9xVHaE2qgj509bR4pk9Z6RDEq6ov+yOUpn
	Qr2fzcMbn4iJuMOKFcJ1H1Z5lBog6XVEWj2iiqeyXDjb+yhrgCT2fnN4vJ0oRya78cYAp9qLQzz
	WtmQtCsvk6XUIoBj2qGMp3EWuxcxe53cUetClDsNTxLUOQESuWGiND/6c8WFt5EeGtedG5Yg9Fa
	JFiTpY0bfES+iTbTYf5K/aFzrdYZ+toRLPbEM2vkCk6QJhLEoJdrQIRCHFP5idBOb7MS21h2U+y
	02DL9uMl82nA/Vup+lHzVPUlWA7nDHjzXDUXC1CSFLirgIsbEg4XiFlkcBkNwHyZ60DnshyJppP
	fwtbSwDHnzt7k6OAIKXq/ZzTXapL8so2p7w+XJ+c+oxCXNQCcgG4M0jpD+t2fF
X-Google-Smtp-Source: AGHT+IEACu0Mqu+36Ut6dFJtgad9ke7KsBHr9+3Tu+VKlWtZ3w9PqhvJy5aJswzneeY3XGexssIImA==
X-Received: by 2002:a17:907:a41:b0:b71:1164:6a8b with SMTP id a640c23a62f3a-b7367869c44mr385634366b.7.1763139851800;
        Fri, 14 Nov 2025 09:04:11 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Pq48CNIJ8D8qOdyUGPQOyyLN"
Message-ID: <3fc28006-4a03-4d95-8db3-71a7b3131f82@gmail.com>
Date: Fri, 14 Nov 2025 18:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 10/18] xen/riscv: implement p2m_set_range()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d689c48582505b0dab6896b414d01d844d834bd5.1760974017.git.oleksii.kurochko@gmail.com>
 <cfe9da20-5680-4f42-92f6-f46350811380@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cfe9da20-5680-4f42-92f6-f46350811380@suse.com>

This is a multi-part message in MIME format.
--------------Pq48CNIJ8D8qOdyUGPQOyyLN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/10/25 3:53 PM, Jan Beulich wrote:
> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -8,12 +8,45 @@
>>   #include <xen/rwlock.h>
>>   #include <xen/types.h>
>>   
>> +#include <asm/page.h>
>>   #include <asm/page-bits.h>
>>   
>>   extern unsigned char gstage_mode;
>> +extern unsigned int gstage_root_level;
>>   
>>   #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
>>   #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
>> +#define P2M_ROOT_LEVEL  gstage_root_level
>> +
>> +/*
>> + * According to the RISC-V spec:
>> + *   When hgatp.MODE specifies a translation scheme of Sv32x4, Sv39x4, Sv48x4,
>> + *   or Sv57x4, G-stage address translation is a variation on the usual
>> + *   page-based virtual address translation scheme of Sv32, Sv39, Sv48, or
>> + *   Sv57, respectively. In each case, the size of the incoming address is
>> + *   widened by 2 bits (to 34, 41, 50, or 59 bits).
>> + *
>> + * P2M_LEVEL_ORDER(lvl) defines the bit position in the GFN from which
>> + * the index for this level of the P2M page table starts. The extra 2
>> + * bits added by the "x4" schemes only affect the root page table width.
>> + *
>> + * Therefore, this macro can safely reuse XEN_PT_LEVEL_ORDER() for all
>> + * levels: the extra 2 bits do not change the indices of lower levels.
>> + *
>> + * The extra 2 bits are only relevant if one tried to address beyond the
>> + * root level (i.e., P2M_LEVEL_ORDER(P2M_ROOT_LEVEL + 1)), which is
>> + * invalid.
>> + */
>> +#define P2M_LEVEL_ORDER(lvl) XEN_PT_LEVEL_ORDER(lvl)
> Is the last paragraph of the comment really needed? It talks about something
> absurd / impossible only.

Agree, it isn't really needed, lets drop it.

>
>> +#define P2M_ROOT_EXTRA_BITS(lvl) (2 * ((lvl) == P2M_ROOT_LEVEL))
>> +
>> +#define P2M_PAGETABLE_ENTRIES(lvl) \
>> +    (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(lvl), UL))
>> +
>> +#define GFN_MASK(lvl) (P2M_PAGETABLE_ENTRIES(lvl) - 1UL)
> If I'm not mistaken, this is a mask with the low 10 or 12 bits set.

I'm not sure I fully understand you here. With the current implementation,
it returns a bitmask that corresponds to the number of index bits used
at each level. So, if|P2M_ROOT_LEVEL = 2|, then:
   |G||FN_MASK(0) = 0x1ff| (9-bit GFN for the level 0)
   |GFN_MASK(1) = 0x1ff| (9-bit GFN width for level 1)
   |GFN_MASK(2) = 0x7ff| (11-bit GFN width for level 2)

Or do you mean that GFN_MASK(lvl) should return something like this:
   |G||FN_MASK_(0) = 0x1FF000 (0x1ff << 0xc) GFN_MASK_(1) = 0x3FE00000 
(GFN_MASK_(0)<<9) GFN_MASK_(2) = 0x1FFC0000000 (GFN_MASK_(1)<<9 + extra 
2 bits) And then here ...|

> That's not really something you can apply to a GFN, unlike the name
> suggests.

That is why virtual address should be properly shifted before, something
like it is done in calc_offset():
   (va >> P2M_LEVEL_SHIFT(lvl)) & GFN_MASK(lvl);

...
  (va & GFN_MASK_(lvl)) >> P2M_LEVEL_SHIFT(lvl) ?
In this option more shifts will be needed.

Would it be better to just rename GFN_MASK() to P2M_PT_INDEX_MASK()? Or,
maybe, even just P2M_INDEX_MASK().

>
>> +#define P2M_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)
> Whereas here the macro name doesn't make clear what is shifted: An
> address or a GFN. (It's the former, aiui.)

Yes, it is expected to be used to shift gfn.

The similar as with above would it be better to rename P2M_LEVEL_SHIFT to
P2M_GFN_LEVEL_SHIFT()?

>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -9,6 +9,7 @@
>>   #include <xen/rwlock.h>
>>   #include <xen/sched.h>
>>   #include <xen/sections.h>
>> +#include <xen/xvmalloc.h>
>>   
>>   #include <asm/csr.h>
>>   #include <asm/flushtlb.h>
>> @@ -17,6 +18,43 @@
>>   #include <asm/vmid.h>
>>   
>>   unsigned char __ro_after_init gstage_mode;
>> +unsigned int __ro_after_init gstage_root_level;
> Like for mode, I'm unconvinced of this being a global (and not per-P2M /
> per-domain).

The question is then if we really will (or want to) have cases when gstage
mode will be different per-domain/per-p2m?

>
>> +/*
>> + * The P2M root page table is extended by 2 bits, making its size 16KB
>> + * (instead of 4KB for non-root page tables). Therefore, P2M root page
>> + * is allocated as four consecutive 4KB pages (since alloc_domheap_pages()
>> + * only allocates 4KB pages).
>> + */
>> +#define ENTRIES_PER_ROOT_PAGE \
>> +    (P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL) / P2M_ROOT_ORDER)
>> +
>> +static inline unsigned int calc_offset(unsigned int lvl, vaddr_t va)
> Where would a vaddr_t come from here? Your input are guest-physical addresses,
> if I'm not mistaken.

You are right. Would it be right to 'paddr_t gpa' here? Or paddr_t is supposed to use
only with machine physical address?


>
>> +{
>> +    unsigned int offset = (va >> P2M_LEVEL_SHIFT(lvl)) & GFN_MASK(lvl);
>> +
>> +    /*
>> +     * For P2M_ROOT_LEVEL, `offset` ranges from 0 to 2047, since the root
>> +     * page table spans 4 consecutive 4KB pages.
>> +     * We want to return an index within one of these 4 pages.
>> +     * The specific page to use is determined by `p2m_get_root_pointer()`.
>> +     *
>> +     * Example: if `offset == 512`:
>> +     *  - A single 4KB page holds 512 entries.
>> +     *  - Therefore, entry 512 corresponds to index 0 of the second page.
>> +     *
>> +     * At all other levels, only one page is allocated, and `offset` is
>> +     * always in the range 0 to 511, since the VPN is 9 bits long.
>> +     */
>> +    return offset % ENTRIES_PER_ROOT_PAGE;
> Seeing something "root" used here (when this is for all levels) is pretty odd,
> despite all the commentary. Given all the commentary, why not simply
>
>      return offset & ((1U << PAGETABLE_ORDER) - 1);
>
> ?

It works for all levels where|lvl < P2M_ROOT_LEVEL|, because in those cases the GFN
bit length is equal to|PAGETABLE_ORDER|. However, at the root level the GFN bit length
is 2 bits larger. So something like the following is needed:
   offset & ((1U << (PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(lvl))) - 1);
This still returns an offset within a single 16 KB page, but in the case of the P2M
root we actually have four consecutive 4 KB pages, so the intention was to return
an offset inside one of those four 4 KB pages.

While writing the above, I started thinking whether|calc_offset()| could be implemented
much more simply. Since the root page table consists of four/consecutive/ pages, it seems
acceptable to have the offset in the range|[0, 2^11)| instead of doing all the extra
manipulation to determine which of the four pages is used and the offset within that
specific page:

   static inline unsigned int calc_offset(unsigned int lvl, paddr_t gpa)
   {
      return (gpa >> P2M_LEVEL_SHIFT(lvl)) & GFN_MASK(lvl);
   }

   static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
   {
     return __map_domain_page(p2m->root);
   }

It probably still makes sense for|p2m_get_root_pointer()| to check that the root GFN
index is not larger than|2^11|.

Am I missing something?

>
>> +}
>> +
>> +#define P2M_MAX_ROOT_LEVEL 4
>> +
>> +#define P2M_DECLARE_OFFSETS(var, addr) \
>> +    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
>> +    for ( unsigned int i = 0; i <= gstage_root_level; i++ ) \
>> +        var[i] = calc_offset(i, addr);
> This surely is more than just "declare", and it's dealing with all levels no
> matter whether you actually will use all offsets.

I will rename|P2M_DECLARE_OFFSETS| to|P2M_BUILD_LEVEL_OFFSETS()|.

But how can I know which offset I will actually need to use?
If we take the following loop as an example:
   |for( level = P2M_ROOT_LEVEL; level > target; level-- ) { ||/* ||* Don't try to allocate intermediate page tables if the mapping ||* is about to be removed. ||*/ ||rc = p2m_next_level(p2m, !removing_mapping, ||level, &table, offsets[level]); ||... ||} |It walks from|P2M_ROOT_LEVEL| down to|target|, where|target| is determined at runtime.

If you mean that, for example, when the G-stage mode is Sv39, there is no need to allocate
an array with 4 entries (or 5 entries if we consider Sv57, so P2M_MAX_ROOT_LEVEL should be
updated), because Sv39 only uses 3 page table levels — then yes, in theory it could be
smaller. But I don't think it is a real issue if the|offsets[]| array on the stack has a
few extra unused entries.

If preferred, Icould allocate the array dynamically based on|gstage_root_level|.
Would that be better?

>
>> @@ -259,13 +308,293 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>       return rc;
>>   }
>>   
>> +/*
>> + * Map one of the four root pages of the P2M root page table.
>> + *
>> + * The P2M root page table is larger than normal (16KB instead of 4KB),
>> + * so it is allocated as four consecutive 4KB pages. This function selects
>> + * the appropriate 4KB page based on the given GFN and returns a mapping
>> + * to it.
>> + *
>> + * The caller is responsible for unmapping the page after use.
>> + *
>> + * Returns NULL if the calculated offset into the root table is invalid.
>> + */
>> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>> +{
>> +    unsigned long root_table_indx;
>> +
>> +    root_table_indx = gfn_x(gfn) >> P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
> With the variable name shortened (to e.g. idx) this could be its initializer
> without ending up with too long a line. The root_table_ prefix isn't really
> adding much value in the context of this function.
>
>> +    if ( root_table_indx >= P2M_ROOT_PAGES )
>> +        return NULL;
>> +
>> +    /*
>> +     * The P2M root page table is extended by 2 bits, making its size 16KB
>> +     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
>> +     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
>> +     * only allocates 4KB pages).
>> +     *
>> +     * Initially, `root_table_indx` is derived directly from `va`.
> There's no 'va' here.

Should be gfn.

>
>> +static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
> "clean_pte" as a parameter name of a function of this name is, well, odd.

clean_cache should be better:
   p2m_clean_pte(pte_t *p, bool clean_cache)

I suppose it would be nice to rename everywhere clean_pte to clean_cache.

Thanks.

~ Oleksii

--------------Pq48CNIJ8D8qOdyUGPQOyyLN
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
    <div class="moz-cite-prefix">On 11/10/25 3:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -8,12 +8,45 @@
 #include &lt;xen/rwlock.h&gt;
 #include &lt;xen/types.h&gt;
 
+#include &lt;asm/page.h&gt;
 #include &lt;asm/page-bits.h&gt;
 
 extern unsigned char gstage_mode;
+extern unsigned int gstage_root_level;
 
 #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
 #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
+#define P2M_ROOT_LEVEL  gstage_root_level
+
+/*
+ * According to the RISC-V spec:
+ *   When hgatp.MODE specifies a translation scheme of Sv32x4, Sv39x4, Sv48x4,
+ *   or Sv57x4, G-stage address translation is a variation on the usual
+ *   page-based virtual address translation scheme of Sv32, Sv39, Sv48, or
+ *   Sv57, respectively. In each case, the size of the incoming address is
+ *   widened by 2 bits (to 34, 41, 50, or 59 bits).
+ *
+ * P2M_LEVEL_ORDER(lvl) defines the bit position in the GFN from which
+ * the index for this level of the P2M page table starts. The extra 2
+ * bits added by the "x4" schemes only affect the root page table width.
+ *
+ * Therefore, this macro can safely reuse XEN_PT_LEVEL_ORDER() for all
+ * levels: the extra 2 bits do not change the indices of lower levels.
+ *
+ * The extra 2 bits are only relevant if one tried to address beyond the
+ * root level (i.e., P2M_LEVEL_ORDER(P2M_ROOT_LEVEL + 1)), which is
+ * invalid.
+ */
+#define P2M_LEVEL_ORDER(lvl) XEN_PT_LEVEL_ORDER(lvl)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is the last paragraph of the comment really needed? It talks about something
absurd / impossible only.</pre>
    </blockquote>
    <pre>Agree, it isn't really needed, lets drop it.

</pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define P2M_ROOT_EXTRA_BITS(lvl) (2 * ((lvl) == P2M_ROOT_LEVEL))
+
+#define P2M_PAGETABLE_ENTRIES(lvl) \
+    (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(lvl), UL))
+
+#define GFN_MASK(lvl) (P2M_PAGETABLE_ENTRIES(lvl) - 1UL)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If I'm not mistaken, this is a mask with the low 10 or 12 bits set.</pre>
    </blockquote>
    <pre data-start="59" data-end="254">I'm not sure I fully understand you here. With the current implementation,
it returns a bitmask that corresponds to the number of index bits used
at each level. So, if <code data-start="227" data-end="247">P2M_ROOT_LEVEL = 2</code>, then:
  <code>G</code><code data-start="258" data-end="279">FN_MASK(0) = 0x1ff</code> (9-bit GFN for the level 0)
  <code data-start="313" data-end="334">GFN_MASK(1) = 0x1ff</code> (9-bit GFN width for level 1)
  <code data-start="369" data-end="390">GFN_MASK(2) = 0x7ff</code> (11-bit GFN width for level 2)

Or do you mean that GFN_MASK(lvl) should return something like this:
  <code>G</code><code data-start="258" data-end="279">FN_MASK_(0) = 0x1FF000 (0x1ff &lt;&lt; 0xc)
  GFN_MASK_(1) = 0x3FE00000 (GFN_MASK_(0)&lt;&lt;9)
  GFN_MASK_(2) = 0x1FFC0000000 (GFN_MASK_(1)&lt;&lt;9 + extra 2 bits)
And then here ...</code></pre>
    <pre></pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">
That's not really something you can apply to a GFN, unlike the name
suggests.</pre>
    </blockquote>
    <pre>That is why virtual address should be properly shifted before, something
like it is done in calc_offset():
  (va &gt;&gt; P2M_LEVEL_SHIFT(lvl)) &amp; GFN_MASK(lvl);

...
 (va &amp; GFN_MASK_(lvl)) &gt;&gt; P2M_LEVEL_SHIFT(lvl) ?
In this option more shifts will be needed.

Would it be better to just rename GFN_MASK() to P2M_PT_INDEX_MASK()? Or,
maybe, even just P2M_INDEX_MASK().

</pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define P2M_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Whereas here the macro name doesn't make clear what is shifted: An
address or a GFN. (It's the former, aiui.)</pre>
    </blockquote>
    <pre>Yes, it is expected to be used to shift gfn.

The similar as with above would it be better to rename P2M_LEVEL_SHIFT to
P2M_GFN_LEVEL_SHIFT()?

</pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -9,6 +9,7 @@
 #include &lt;xen/rwlock.h&gt;
 #include &lt;xen/sched.h&gt;
 #include &lt;xen/sections.h&gt;
+#include &lt;xen/xvmalloc.h&gt;
 
 #include &lt;asm/csr.h&gt;
 #include &lt;asm/flushtlb.h&gt;
@@ -17,6 +18,43 @@
 #include &lt;asm/vmid.h&gt;
 
 unsigned char __ro_after_init gstage_mode;
+unsigned int __ro_after_init gstage_root_level;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Like for mode, I'm unconvinced of this being a global (and not per-P2M /
per-domain).</pre>
    </blockquote>
    <pre>The question is then if we really will (or want to) have cases when gstage
mode will be different per-domain/per-p2m? 

</pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * The P2M root page table is extended by 2 bits, making its size 16KB
+ * (instead of 4KB for non-root page tables). Therefore, P2M root page
+ * is allocated as four consecutive 4KB pages (since alloc_domheap_pages()
+ * only allocates 4KB pages).
+ */
+#define ENTRIES_PER_ROOT_PAGE \
+    (P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL) / P2M_ROOT_ORDER)
+
+static inline unsigned int calc_offset(unsigned int lvl, vaddr_t va)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Where would a vaddr_t come from here? Your input are guest-physical addresses,
if I'm not mistaken.</pre>
    </blockquote>
    <pre>You are right. Would it be right to 'paddr_t gpa' here? Or paddr_t is supposed to use
only with machine physical address?</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    unsigned int offset = (va &gt;&gt; P2M_LEVEL_SHIFT(lvl)) &amp; GFN_MASK(lvl);
+
+    /*
+     * For P2M_ROOT_LEVEL, `offset` ranges from 0 to 2047, since the root
+     * page table spans 4 consecutive 4KB pages.
+     * We want to return an index within one of these 4 pages.
+     * The specific page to use is determined by `p2m_get_root_pointer()`.
+     *
+     * Example: if `offset == 512`:
+     *  - A single 4KB page holds 512 entries.
+     *  - Therefore, entry 512 corresponds to index 0 of the second page.
+     *
+     * At all other levels, only one page is allocated, and `offset` is
+     * always in the range 0 to 511, since the VPN is 9 bits long.
+     */
+    return offset % ENTRIES_PER_ROOT_PAGE;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Seeing something "root" used here (when this is for all levels) is pretty odd,
despite all the commentary. Given all the commentary, why not simply

    return offset &amp; ((1U &lt;&lt; PAGETABLE_ORDER) - 1);

?</pre>
    </blockquote>
    <pre data-start="59" data-end="249">It works for all levels where <code
    data-start="105" data-end="127">lvl &lt; P2M_ROOT_LEVEL</code>, because in those cases the GFN
bit length is equal to <code data-start="183" data-end="200">PAGETABLE_ORDER</code>. However, at the root level the GFN bit length
is 2 bits larger. So something like the following is needed:
  offset &amp; ((1U &lt;&lt; (PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(lvl))) - 1);
This still returns an offset within a single 16 KB page, but in the case of the P2M
root we actually have four consecutive 4 KB pages, so the intention was to return
an offset inside one of those four 4 KB pages.

While writing the above, I started thinking whether <code
    data-start="654" data-end="669">calc_offset()</code> could be implemented
much more simply. Since the root page table consists of four <em
    data-start="752" data-end="765">consecutive</em> pages, it seems
acceptable to have the offset in the range <code data-start="825"
    data-end="836">[0, 2^11)</code> instead of doing all the extra
manipulation to determine which of the four pages is used and the offset within that
specific page:

  static inline unsigned int calc_offset(unsigned int lvl, paddr_t gpa)
  {
     return (gpa &gt;&gt; P2M_LEVEL_SHIFT(lvl)) &amp; GFN_MASK(lvl);
  }

  static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
  {
    return __map_domain_page(p2m-&gt;root);
  }
</pre>
    <pre data-start="1227" data-end="1345">It probably still makes sense for <code
    data-start="1261" data-end="1285">p2m_get_root_pointer()</code> to check that the root GFN
index is not larger than <code data-start="1338" data-end="1344">2^11</code>.</pre>
    <pre data-start="1347" data-end="1370" data-is-last-node=""
    data-is-only-node="">Am I missing something?</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+#define P2M_MAX_ROOT_LEVEL 4
+
+#define P2M_DECLARE_OFFSETS(var, addr) \
+    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
+    for ( unsigned int i = 0; i &lt;= gstage_root_level; i++ ) \
+        var[i] = calc_offset(i, addr);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This surely is more than just "declare", and it's dealing with all levels no
matter whether you actually will use all offsets.</pre>
    </blockquote>
    <pre data-start="61" data-end="128">I will rename <code
    data-start="75" data-end="96">P2M_DECLARE_OFFSETS</code> to <code
    data-start="100" data-end="127">P2M_BUILD_LEVEL_OFFSETS()</code>.

But how can I know which offset I will actually need to use?
If we take the following loop as an example:
  <code class="whitespace-pre! language-c"><span><span><span
    class="hljs-keyword">for</span></span><span> ( level = P2M_ROOT_LEVEL; level &gt; target; level-- )
  {
    </span></span></code><code class="whitespace-pre! language-c"><span><span><span
    class="hljs-comment">/*
     </span></span></span></code><code
    class="whitespace-pre! language-c"><span><span><span
    class="hljs-comment">* Don't try to allocate intermediate page tables if the mapping
     </span></span></span></code><code
    class="whitespace-pre! language-c"><span><span><span
    class="hljs-comment">* is about to be removed.
     </span></span></span></code><code
    class="whitespace-pre! language-c"><span><span><span
    class="hljs-comment">*/
     </span></span></span></code><code
    class="whitespace-pre! language-c"><span><span>rc = p2m_next_level(p2m, !removing_mapping,
                         </span></span></code><code
    class="whitespace-pre! language-c"><span><span>level, &amp;table, offsets[level]);
     </span></span></code><code class="whitespace-pre! language-c"><span><span>...
  </span></span></code><code class="whitespace-pre! language-c"><span><span>}
</span></span></code>It walks from <code data-start="549" data-end="565">P2M_ROOT_LEVEL</code> down to <code
    data-start="574" data-end="582">target</code>, where <code
    data-start="590" data-end="598">target</code> is determined at runtime.

If you mean that, for example, when the G-stage mode is Sv39, there is no need to allocate
an array with 4 entries (or 5 entries if we consider Sv57, so P2M_MAX_ROOT_LEVEL should be
updated), because Sv39 only uses 3 page table levels — then yes, in theory it could be
smaller. But I don't think it is a real issue if the <code
    data-start="911" data-end="922">offsets[]</code> array on the stack has a
few extra unused entries.

If preferred, I <span data-start="991" data-end="998">could</span> allocate the array dynamically based on <code
    data-start="1039" data-end="1058">gstage_root_level</code>.
Would that be better?

</pre>
    <pre></pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -259,13 +308,293 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
 }
 
+/*
+ * Map one of the four root pages of the P2M root page table.
+ *
+ * The P2M root page table is larger than normal (16KB instead of 4KB),
+ * so it is allocated as four consecutive 4KB pages. This function selects
+ * the appropriate 4KB page based on the given GFN and returns a mapping
+ * to it.
+ *
+ * The caller is responsible for unmapping the page after use.
+ *
+ * Returns NULL if the calculated offset into the root table is invalid.
+ */
+static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
+{
+    unsigned long root_table_indx;
+
+    root_table_indx = gfn_x(gfn) &gt;&gt; P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With the variable name shortened (to e.g. idx) this could be its initializer
without ending up with too long a line. The root_table_ prefix isn't really
adding much value in the context of this function.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( root_table_indx &gt;= P2M_ROOT_PAGES )
+        return NULL;
+
+    /*
+     * The P2M root page table is extended by 2 bits, making its size 16KB
+     * (instead of 4KB for non-root page tables). Therefore, p2m-&gt;root is
+     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
+     * only allocates 4KB pages).
+     *
+     * Initially, `root_table_indx` is derived directly from `va`.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There's no 'va' here.</pre>
    </blockquote>
    <pre>Should be gfn.

</pre>
    <blockquote type="cite"
      cite="mid:cfe9da20-5680-4f42-92f6-f46350811380@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"clean_pte" as a parameter name of a function of this name is, well, odd.</pre>
    </blockquote>
    <pre>clean_cache should be better:
  p2m_clean_pte(pte_t *p, bool clean_cache)

I suppose it would be nice to rename everywhere clean_pte to clean_cache.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------Pq48CNIJ8D8qOdyUGPQOyyLN--

