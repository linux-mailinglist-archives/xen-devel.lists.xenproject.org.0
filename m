Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C1B09200
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 18:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047113.1417479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucRcG-0004EY-0p; Thu, 17 Jul 2025 16:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047113.1417479; Thu, 17 Jul 2025 16:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucRcF-0004D7-UC; Thu, 17 Jul 2025 16:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1047113;
 Thu, 17 Jul 2025 16:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83TL=Z6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ucRcE-0004D1-6r
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 16:37:50 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f50c4d6-632c-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 18:37:47 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ae35f36da9dso230136866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 09:37:47 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82dede9sm1375552066b.167.2025.07.17.09.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 09:37:46 -0700 (PDT)
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
X-Inumbo-ID: 5f50c4d6-632c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752770267; x=1753375067; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6mfpfm2ieN7hPkSwCRk7jV7e/f3IxRs4I1MpXQhYTI=;
        b=MoxOGr6uJQNjLQKbV1o/Z29CN3Y9n1vwfav5fj4rIu/kOLfVlowErcL+wt1fNCnpYe
         nAqZ24DQ0T9fe7eJPWeA7r0MOlJLV1KDHO1nm84t3NlbIXh40tScNSAL7WUwFwkBThkN
         iOzS5DHy4F3IAk/AkN+/Ew6mNebAwAsMk7ZYvxtIRuG1fSvhCjBXj+SYx+ltFzFjT70i
         CBPhhOz1RYBoazbi+D/0q+0hSGoq4PO0JPfCvm/WiBQOlgFCK3cZ8MK9lV/+QyTxvVt3
         pq3xebtk0IpOwAThy5sR2SnFjUF+irSWFRR40zq1UiRvKz0itPxwR9tX1GoAvPeJpnSX
         LR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770267; x=1753375067;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z6mfpfm2ieN7hPkSwCRk7jV7e/f3IxRs4I1MpXQhYTI=;
        b=cCCbD07zjciWnmU4LuxNXuYJirxLinWRdpFF6sH+7qLoX25WBhFPTPu3+6NoMkF+p+
         GjL2g3ztVvyeNbheJXcq8UdXY2g2QM/wJtG/liOptxwnD03r4iW4UR8Vj444x7oKh3wf
         2oL8iF0TqKQchG2OSiu2/zl3ckn2heAAL2PPEpLarFWdEC2TiuMliA2uH4MbrUSNukLo
         DxLDgPRiCIc62dLkKWefRHrHYEi2DcjkveZztLXLih6JZWk8CuNqDuQuPZfI8KoySPp/
         iHEmInBHZXOBrJIHARxesp35vbbpU9TyHJ4WJQKNhRZssI0UdtQaIS1ZbnOj4Uj5LPyd
         cgaA==
X-Forwarded-Encrypted: i=1; AJvYcCUI9XXs0XVgBkRefT7qTGGU30iS/LkfCxMSoKfiHEOdBI5FuzyYFZQGplkvwSkoMbKiyhzFFWLKh34=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxoo43gbN8HIwKNu/UgR19FNjd/1CxyFcv5rxBObuK36Z0vx3MX
	fapT/JonXT1pgKVSobfrMIK2PaCfe4R3ti3rtd7EWhBR4x5dqQyNkPp5
X-Gm-Gg: ASbGncsum3G5QBj5QrOXesjUG9wRKsg3q39lj0xvQ8DgDcCVUVKWp8oivB+AGcZQAh8
	lZc2q8B9mlP1dKXmtrUtxKtwaXuY/xQle4auI/Tf+0Dbu2NNNgr2t+a2/TOrFaHWX/AC6FRW0bq
	l9gYGgyMG9CT2+7oAFdpBJ6VusaDbO195QQOAGIYpgy/OQmWHM4Rz2p4X1HVeAwugf15IiM9Lf4
	8X89e8zKKt760M7qvHEGGdhoPHSi9mb9EfjZXeU61EduwWoWTSwmyKOojoSWHi1PWWQLtGaWX5a
	xCiG+/AWWwkGg3GD/aRsbgeZkkxnwB9lSWx4jWgqBB5PI0zEVZRaODMF+DFP3sXfaPDwgbxMwpz
	tzTxgP10VryOLSWGJBMZ38V1EmOVzvogb6a8vUw2xC/F0P+KM2k9WMHd6QzShjuuJ5lrSOFuZ
X-Google-Smtp-Source: AGHT+IGnqkGOCLuqGB1oRCdrVvPyfgz2CGMlUqax2ifgxQvLogIbsgL2P6GaYc2x9VXEfpZRAe2fPQ==
X-Received: by 2002:a17:907:d2e7:b0:ae3:67c7:54a6 with SMTP id a640c23a62f3a-ae9ce07df63mr637655466b.34.1752770266938;
        Thu, 17 Jul 2025 09:37:46 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------D3xmnBoha0xIcG8sS2m3p9Gg"
Message-ID: <e2227002-e38c-41e1-8bea-7585138ec5ba@gmail.com>
Date: Thu, 17 Jul 2025 18:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/17] xen/riscv: Implement superpage splitting for p2m
 mappings
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <7cdd3272f2eba32dfa00be4fd72da6921eac243d.1749555949.git.oleksii.kurochko@gmail.com>
 <9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com>

This is a multi-part message in MIME format.
--------------D3xmnBoha0xIcG8sS2m3p9Gg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/25 11:25 AM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Add support for down large memory mappings ("superpages") in the RISC-V
>> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
>> can be inserted into lower levels of the page table hierarchy.
>>
>> To implement that the following is done:
>> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>>    smaller page table entries down to the target level, preserving original
>>    permissions and attributes.
>> - __p2m_set_entry() updated to invoke superpage splitting when inserting
>>    entries at lower levels within a superpage-mapped region.
>>
>> This implementation is based on the ARM code, with modifications to the part
>> that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
>> not require BBM, so there is no need to invalidate the PTE and flush the
>> TLB before updating it with the newly created, split page table.
> But some flushing is going to be necessary. As long as you only ever do
> global flushes, the one after the individual PTE modification (within the
> split table) will do (if BBM isn't required, see below), but once you move
> to more fine-grained flushing, that's not going to be enough anymore. Not
> sure it's a good idea to leave such a pitfall.

I think that I don't fully understand what is an issue.

>
> As to (no need for) BBM: I couldn't find anything to that effect in the
> privileged spec. Can you provide some pointer? What I found instead is e.g.
> this sentence: "To ensure that implicit reads observe writes to the same
> memory locations, an SFENCE.VMA instruction must be executed after the
> writes to flush the relevant cached translations." And this: "Accessing the
> same location using different cacheability attributes may cause loss of
> coherence." (This may not only occur when the same physical address is
> mapped twice at different VAs, but also after the shattering of a superpage
> when the new entry differs in cacheability.)

I also couldn't find that RISC-V spec mandates BBM explicitly as Arm does it.

What I meant that on RISC-V can do:
- Write new PTE
- Flush TLB

While on Arm it is almost always needed to do:
- Write zero to PTE
- Flush TLB
- Write new PTE

For example, the common CoW code path where you copy from a read only page to
a new page, then map that new page as writable just works on RISC-V without
extra considerations and on Arm it requires BBM.

It seems to me that BBM is mandated for Arm only because that TLB is shared
among cores, so there is no any guarantee that no prior entry for same VA
remains in TLB. In case of RISC-V's TLB isn't shared and after a flush it is
guaranteed that no prior entry for the same VA remains in the TLB.

But in the same time it could be cases, I guess, where BBM will be needed for
RISC-V too. Even the case of CoW mentioned above will need some kind of BBM,
but nothing that'll the CPU misbehave by doing CoW without BBM on RISC-V.

>
>> Additionally, the page table walk logic has been adjusted, as ARM uses the
>> opposite walk order compared to RISC-V.
> I think you used some similar wording already in an earlier patch. I find
> this confusing: Walk order is, aiui, the same. It's merely the numbering
> of levels that is the opposite way round, isn't it?

Yes, the numbering of levels is different and I counted that as a different
walk order. If it is too confusing, I will reword it and use numbering of levels.

>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V2:
>>   - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
>>     functionality" which was splitted to smaller.
>>   - Update the commit above the cycle which creates new page table as
>>     RISC-V travserse page tables in an opposite to ARM order.
>>   - RISC-V doesn't require BBM so there is no needed for invalidating
>>     and TLB flushing before updating PTE.
>> ---
>>   xen/arch/riscv/p2m.c | 102 ++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 101 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>> index 87dd636b80..79c4473f1f 100644
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -743,6 +743,77 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>>       p2m_free_page(p2m->domain, pg);
>>   }
>>   
>> +static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>> +                                unsigned int level, unsigned int target,
>> +                                const unsigned int *offsets)
>> +{
>> +    struct page_info *page;
>> +    unsigned int i;
>> +    pte_t pte, *table;
>> +    bool rv = true;
>> +
>> +    /* Convenience aliases */
>> +    mfn_t mfn = pte_get_mfn(*entry);
>> +    unsigned int next_level = level - 1;
>> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
>> +
>> +    /*
>> +     * This should only be called with target != level and the entry is
>> +     * a superpage.
>> +     */
>> +    ASSERT(level > target);
>> +    ASSERT(p2me_is_superpage(p2m, *entry, level));
>> +
>> +    page = p2m_alloc_page(p2m->domain);
>> +    if ( !page )
>> +        return false;
>> +
>> +    page_list_add(page, &p2m->pages);
> Is there a reason this list maintenance isn't done in p2m_alloc_page()?

No there is no any reason, I will move that inside p2m_alloc_page().

>
>> +    table = __map_domain_page(page);
>> +
>> +    /*
>> +     * We are either splitting a second level 1G page into 512 first level
>> +     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
>> +     */
>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
>> +    {
>> +        pte_t *new_entry = table + i;
>> +
>> +        /*
>> +         * Use the content of the superpage entry and override
>> +         * the necessary fields. So the correct permission are kept.
>> +         */
>> +        pte = *entry;
>> +        pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
> While okay as long as you only permit superpages up to 1G, this is another
> trap for someone to fall into: Imo i would better be unsigned long right
> away, considering that RISC-V permits large pages at all levels.
>
>> +        write_pte(new_entry, pte);
>> +    }
>> +
>> +    /*
>> +     * Shatter superpage in the page to the level we want to make the
>> +     * changes.
>> +     * This is done outside the loop to avoid checking the offset to
>> +     * know whether the entry should be shattered for every entry.
>> +     */
>> +    if ( next_level != target )
>> +        rv = p2m_split_superpage(p2m, table + offsets[next_level],
>> +                                 level - 1, target, offsets);
> I don't understand the comment: Under what conditions would every entry
> need (further) shattering? And where's that happening? Or is this merely
> a word ordering issue in the sentence, and "for every entry" wants
> moving ahead? (In that case I'm unconvinced this is in need of commenting
> upon.)

It is wording question. It should be something like:
+    /*
+     * Shatter superpage in the page to the level we want to make the
+     * changes.
+     * This is done outside the loop to avoid checking the offset for every
+     * entry (of new page table) to know whether the entry should be shattered.
+     */


>
>> +    /* TODO: why it is necessary to have clean here? Not somewhere in the caller */
>> +    if ( p2m->clean_pte )
>> +        clean_dcache_va_range(table, PAGE_SIZE);
>> +
>> +    unmap_domain_page(table);
> Again likely not something that wants taking care of right away, but there
> again is an inefficiency here: The caller almost certainly wants to map
> the same page again, to update the one entry that caused the request to
> shatter the page.

I'll add TODO.

>
>> +    /*
>> +     * Even if we failed, we should install the newly allocated PTE
>> +     * entry. The caller will be in charge to free the sub-tree.
>> +     */
>> +    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);
> Why would it be wrong to free the page right here, vacating the entry at
> the same time (or leaving just that to the caller)? (IOW - if this is an
> implementation decision of yours, I think the word "should" would want
> dropping.) After all, the caller invoking p2m_free_entry() on the thus
> split PTE is less efficient (needs to iterate over all entries) than on
> the original one (where it's just a single superpage).

I think that I didn't get your idea.

>
>> @@ -806,7 +877,36 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>>        */
>>       if ( level > target )
> This condition is likely too strong, unless you actually mean to also
> split a superpage if it really wouldn't need splitting (new entry written
> still fitting with the superpage mapping, i.e. suitable MFN and same
> attributes).

I am not really sure that I fully understand.
My understanding is if level != target then the splitting is needed, I am
not really get the part "split a superpage if it really wouldn't need splitting".

>
>>       {
>> -        panic("Shattering isn't implemented\n");
>> +        /* We need to split the original page. */
>> +        pte_t split_pte = *entry;
>> +
>> +        ASSERT(p2me_is_superpage(p2m, *entry, level));
>> +
>> +        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
>> +        {
>> +            /* Free the allocated sub-tree */
>> +            p2m_free_entry(p2m, split_pte, level);
>> +
>> +            rc = -ENOMEM;
>> +            goto out;
>> +        }
>> +
>> +        p2m_write_pte(entry, split_pte, p2m->clean_pte);
>> +
>> +        /* Then move to the level we want to make real changes */
>> +        for ( ; level < target; level++ )
> Don't you mean to move downwards here? At which point I wonder: Did you test
> this code?

No as the test for this case was missed. I will add one.

>
>> +        {
>> +            rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
>> +
>> +            /*
>> +             * The entry should be found and either be a table
>> +             * or a superpage if level 0 is not targeted
>> +             */
>> +            ASSERT(rc == GUEST_TABLE_NORMAL ||
>> +                   (rc == GUEST_TABLE_SUPER_PAGE && target > 0));
>> +        }
> This, too, is inefficient (but likely good enough as a starting point): You walk
> tables twice - first when splitting, and then again when finding the target level.
>
> Considering the enclosing if(), this also again is a do/while() candidate.

I will add TODO to make that part more efficient. And based on your reply regarding
statement inside if(), I'll likely to use do/while().

Thanks.

~ Oleksii


--------------D3xmnBoha0xIcG8sS2m3p9Gg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/25 11:25 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add support for down large memory mappings ("superpages") in the RISC-V
p2m mapping so that smaller, more precise mappings ("finer-grained entries")
can be inserted into lower levels of the page table hierarchy.

To implement that the following is done:
- Introduce p2m_split_superpage(): Recursively shatters a superpage into
  smaller page table entries down to the target level, preserving original
  permissions and attributes.
- __p2m_set_entry() updated to invoke superpage splitting when inserting
  entries at lower levels within a superpage-mapped region.

This implementation is based on the ARM code, with modifications to the part
that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
not require BBM, so there is no need to invalidate the PTE and flush the
TLB before updating it with the newly created, split page table.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But some flushing is going to be necessary. As long as you only ever do
global flushes, the one after the individual PTE modification (within the
split table) will do (if BBM isn't required, see below), but once you move
to more fine-grained flushing, that's not going to be enough anymore. Not
sure it's a good idea to leave such a pitfall.</pre>
    </blockquote>
    <pre>I think that I don't fully understand what is an issue.
</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

As to (no need for) BBM: I couldn't find anything to that effect in the
privileged spec. Can you provide some pointer? What I found instead is e.g.
this sentence: "To ensure that implicit reads observe writes to the same
memory locations, an SFENCE.VMA instruction must be executed after the
writes to flush the relevant cached translations." And this: "Accessing the
same location using different cacheability attributes may cause loss of
coherence." (This may not only occur when the same physical address is
mapped twice at different VAs, but also after the shattering of a superpage
when the new entry differs in cacheability.)</pre>
    </blockquote>
    <pre>I also couldn't find that RISC-V spec mandates BBM explicitly as Arm does it.

What I meant that on RISC-V can do:
- Write new PTE
- Flush TLB

While on Arm it is almost always needed to do:
- Write zero to PTE
- Flush TLB
- Write new PTE

For example, the common CoW code path where you copy from a read only page to
a new page, then map that new page as writable just works on RISC-V without
extra considerations and on Arm it requires BBM.

It seems to me that BBM is mandated for Arm only because that TLB is shared
among cores, so there is no any guarantee that no prior entry for same VA
remains in TLB. In case of RISC-V's TLB isn't shared and after a flush it is
guaranteed that no prior entry for the same VA remains in the TLB.

But in the same time it could be cases, I guess, where BBM will be needed for
RISC-V too. Even the case of CoW mentioned above will need some kind of BBM,
but nothing that'll the CPU misbehave by doing CoW without BBM on RISC-V.

</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Additionally, the page table walk logic has been adjusted, as ARM uses the
opposite walk order compared to RISC-V.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think you used some similar wording already in an earlier patch. I find
this confusing: Walk order is, aiui, the same. It's merely the numbering
of levels that is the opposite way round, isn't it?</pre>
    </blockquote>
    <pre>Yes, the numbering of levels is different and I counted that as a different
walk order. If it is too confusing, I will reword it and use numbering of levels.

</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - Update the commit above the cycle which creates new page table as
   RISC-V travserse page tables in an opposite to ARM order.
 - RISC-V doesn't require BBM so there is no needed for invalidating
   and TLB flushing before updating PTE.
---
 xen/arch/riscv/p2m.c | 102 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 87dd636b80..79c4473f1f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -743,6 +743,77 @@ static void p2m_free_entry(struct p2m_domain *p2m,
     p2m_free_page(p2m-&gt;domain, pg);
 }
 
+static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
+                                unsigned int level, unsigned int target,
+                                const unsigned int *offsets)
+{
+    struct page_info *page;
+    unsigned int i;
+    pte_t pte, *table;
+    bool rv = true;
+
+    /* Convenience aliases */
+    mfn_t mfn = pte_get_mfn(*entry);
+    unsigned int next_level = level - 1;
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
+
+    /*
+     * This should only be called with target != level and the entry is
+     * a superpage.
+     */
+    ASSERT(level &gt; target);
+    ASSERT(p2me_is_superpage(p2m, *entry, level));
+
+    page = p2m_alloc_page(p2m-&gt;domain);
+    if ( !page )
+        return false;
+
+    page_list_add(page, &amp;p2m-&gt;pages);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is there a reason this list maintenance isn't done in p2m_alloc_page()?</pre>
    </blockquote>
    <pre>No there is no any reason, I will move that inside p2m_alloc_page().
</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    table = __map_domain_page(page);
+
+    /*
+     * We are either splitting a second level 1G page into 512 first level
+     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
+     */
+    for ( i = 0; i &lt; XEN_PT_ENTRIES; i++ )
+    {
+        pte_t *new_entry = table + i;
+
+        /*
+         * Use the content of the superpage entry and override
+         * the necessary fields. So the correct permission are kept.
+         */
+        pte = *entry;
+        pte_set_mfn(&amp;pte, mfn_add(mfn, i &lt;&lt; level_order));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While okay as long as you only permit superpages up to 1G, this is another
trap for someone to fall into: Imo i would better be unsigned long right
away, considering that RISC-V permits large pages at all levels.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        write_pte(new_entry, pte);
+    }
+
+    /*
+     * Shatter superpage in the page to the level we want to make the
+     * changes.
+     * This is done outside the loop to avoid checking the offset to
+     * know whether the entry should be shattered for every entry.
+     */
+    if ( next_level != target )
+        rv = p2m_split_superpage(p2m, table + offsets[next_level],
+                                 level - 1, target, offsets);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't understand the comment: Under what conditions would every entry
need (further) shattering? And where's that happening? Or is this merely
a word ordering issue in the sentence, and "for every entry" wants
moving ahead? (In that case I'm unconvinced this is in need of commenting
upon.)</pre>
    </blockquote>
    <pre>It is wording question. It should be something like:
+    /*
+     * Shatter superpage in the page to the level we want to make the
+     * changes.
+     * This is done outside the loop to avoid checking the offset for every
+     * entry (of new page table) to know whether the entry should be shattered.
+     */</pre>
    <pre>
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* TODO: why it is necessary to have clean here? Not somewhere in the caller */
+    if ( p2m-&gt;clean_pte )
+        clean_dcache_va_range(table, PAGE_SIZE);
+
+    unmap_domain_page(table);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Again likely not something that wants taking care of right away, but there
again is an inefficiency here: The caller almost certainly wants to map
the same page again, to update the one entry that caused the request to
shatter the page.</pre>
    </blockquote>
    <pre>I'll add TODO.

</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /*
+     * Even if we failed, we should install the newly allocated PTE
+     * entry. The caller will be in charge to free the sub-tree.
+     */
+    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m-&gt;clean_pte);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why would it be wrong to free the page right here, vacating the entry at
the same time (or leaving just that to the caller)? (IOW - if this is an
implementation decision of yours, I think the word "should" would want
dropping.) After all, the caller invoking p2m_free_entry() on the thus
split PTE is less efficient (needs to iterate over all entries) than on
the original one (where it's just a single superpage).</pre>
    </blockquote>
    <pre>I think that I didn't get your idea.

</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -806,7 +877,36 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
      */
     if ( level &gt; target )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This condition is likely too strong, unless you actually mean to also
split a superpage if it really wouldn't need splitting (new entry written
still fitting with the superpage mapping, i.e. suitable MFN and same
attributes).</pre>
    </blockquote>
    <pre>I am not really sure that I fully understand.
My understanding is if level != target then the splitting is needed, I am
not really get the part "split a superpage if it really wouldn't need splitting".

</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">     {
-        panic("Shattering isn't implemented\n");
+        /* We need to split the original page. */
+        pte_t split_pte = *entry;
+
+        ASSERT(p2me_is_superpage(p2m, *entry, level));
+
+        if ( !p2m_split_superpage(p2m, &amp;split_pte, level, target, offsets) )
+        {
+            /* Free the allocated sub-tree */
+            p2m_free_entry(p2m, split_pte, level);
+
+            rc = -ENOMEM;
+            goto out;
+        }
+
+        p2m_write_pte(entry, split_pte, p2m-&gt;clean_pte);
+
+        /* Then move to the level we want to make real changes */
+        for ( ; level &lt; target; level++ )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Don't you mean to move downwards here? At which point I wonder: Did you test
this code?</pre>
    </blockquote>
    <pre>No as the test for this case was missed. I will add one.

</pre>
    <blockquote type="cite"
      cite="mid:9be8eeb4-281e-4b9b-9ea7-04ff738dc4db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        {
+            rc = p2m_next_level(p2m, true, level, &amp;table, offsets[level]);
+
+            /*
+             * The entry should be found and either be a table
+             * or a superpage if level 0 is not targeted
+             */
+            ASSERT(rc == GUEST_TABLE_NORMAL ||
+                   (rc == GUEST_TABLE_SUPER_PAGE &amp;&amp; target &gt; 0));
+        }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This, too, is inefficient (but likely good enough as a starting point): You walk
tables twice - first when splitting, and then again when finding the target level.

Considering the enclosing if(), this also again is a do/while() candidate.
</pre>
    </blockquote>
    <pre>I will add TODO to make that part more efficient. And based on your reply regarding
statement inside if(), I'll likely to use do/while().

Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------D3xmnBoha0xIcG8sS2m3p9Gg--

