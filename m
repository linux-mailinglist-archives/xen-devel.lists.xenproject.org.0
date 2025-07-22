Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2DB0DFB6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052814.1421598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueER4-0004oH-7i; Tue, 22 Jul 2025 14:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052814.1421598; Tue, 22 Jul 2025 14:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueER4-0004mj-30; Tue, 22 Jul 2025 14:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1052814;
 Tue, 22 Jul 2025 14:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNGt=2D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ueER2-0004aP-EV
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:57:40 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3587915f-670c-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 16:57:38 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo8716302a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 07:57:38 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca7d4f5sm878483266b.132.2025.07.22.07.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:57:37 -0700 (PDT)
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
X-Inumbo-ID: 3587915f-670c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753196258; x=1753801058; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN1zFpeRLMlNONCcozRRKxHxVrdpSRWTP4LfTWY6xuM=;
        b=KUeNTd4GEgpZOO3o531PQxn2ZQZ6236nDJsgN4vQoFkmZMoAKWUaVKzkdKKRMpk+UG
         IEa2BLmoccn8/DD3yALnTy9aP4ZLeyWg42Lb9xCZB2mUQs7vLM51ych/Q84FelGZGMoR
         uherQn4rzpYdeHfwHBPR1e31PsCx12SkjyPrESBHSDqPfJbV/1N/DWCIdrfFKjZJMclX
         NUy8emriQ9TmqaX6UgKxsOWGMe32XWRKL8NaymODcV0taiXhk8bJ86MSIcc2amQMAFMT
         /eIBOjJ7AeG0k9UD7fxCBiDbJB/SfHwmwzALKhFWItIZZ4Lw+VQpjQx8jlLAbCOw7ao1
         Dihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196258; x=1753801058;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PN1zFpeRLMlNONCcozRRKxHxVrdpSRWTP4LfTWY6xuM=;
        b=eitWcYCM8qZbxHa2+HQz0D5ZcxYcTZrKg3K9+Zl1B0TjKXKPV1bbarcgX6m2ugI+Hf
         E6lOQZrgFAexmqSVFB67ZeiikMy55GRq2n/ioxb64nH7zcTcaYJm8iDQ/Q3Zbgmdm7AZ
         K/8LS02eL4Q3ZUIgluLyXa1QjSBPOBwLXDaLBwseSOdCE1mHlSbMSDRXxcUW7DS/itgn
         LwE7p/pBnHlZeXvmyGxgFyFQZniIoq/FZ8WJCZJ5meLuKyh+cBeoLu0+aQfE1KiyhaWu
         NLqlKKQyKvmrRZBiJfOCjoyQeEs+jf+A2ca21+fJwT6OOci8LCdhWP1UX+16YdQ/4D1n
         vQRA==
X-Forwarded-Encrypted: i=1; AJvYcCWOY2RyvxA3WohzNgaOG8rQ898zXbsDMaTrWGv8tiBl8bRFat1/RTGCwTBGPvOL/zOkXfi8+aHBlvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGV1qOJ53ukhGYfq6J5TworlBMCE+RtGxx6gE7iOgM0denUgv3
	8KvCU2c/vwtm1HMG0GmWLatk+pkZf9/cJKcqdRRi17gvdHH3px+GKeAd
X-Gm-Gg: ASbGncu81bS7X1OSEUWbUiQdSyFm4YG1NkbtJP545wqynIlbSgT/3tzRuTaZguCXoqY
	sYvgsq0XHdRvbf1AxWWja3l4J3gq95CHDLjkgOxu+B7IRmGjpKyGNdDYNZPp9aUpvRtpVYAL9A9
	CE5WgdXZ5TsBCeq4cclK1CX7bDubFobaJHeHcDuNJumdNK9jJctmnlR7NAksK8sqQUnC+IL89kM
	qCMTb5Zh7uuwsngX9RadGd+4fzjz+EtllEsAod9DIPxZ/VKEYo3B4DC1xsFAMvzgxhYsNUWUcix
	rVWMSw9IEuViPh05rM53YgMH6v+FL0tLRiOEL1+0FIRQ6ZeECJFsP9S8HamJc6m3N35izz0Ejv0
	dn5inrsFY+HICv237uHwxILYlFwIrz+F9p++2hjBF1Orx9qf6M6EhhLO90hcr06cl2FQ/81s=
X-Google-Smtp-Source: AGHT+IEc/rOZuyWccGauymPCSy79tCOZ1AD9lMTxgOhwXaQ8RKU/JyxwsWHpWMbIYYjDAxtzhPhaQQ==
X-Received: by 2002:a17:907:6095:b0:af1:428f:dcb2 with SMTP id a640c23a62f3a-af1428ffd70mr343382966b.35.1753196257415;
        Tue, 22 Jul 2025 07:57:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------8n3xDtdu0n0liBEdVpgXicnB"
Message-ID: <640d6862-4ea9-49ca-adb8-0fad5ceb1ff1@gmail.com>
Date: Tue, 22 Jul 2025 16:57:35 +0200
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
 <e2227002-e38c-41e1-8bea-7585138ec5ba@gmail.com>
 <0c1701ff-efe3-434f-97e0-4896707411b7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0c1701ff-efe3-434f-97e0-4896707411b7@suse.com>

This is a multi-part message in MIME format.
--------------8n3xDtdu0n0liBEdVpgXicnB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/21/25 3:34 PM, Jan Beulich wrote:
> On 17.07.2025 18:37, Oleksii Kurochko wrote:
>> On 7/2/25 11:25 AM, Jan Beulich wrote:
>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>> Add support for down large memory mappings ("superpages") in the RISC-V
>>>> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
>>>> can be inserted into lower levels of the page table hierarchy.
>>>>
>>>> To implement that the following is done:
>>>> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>>>>     smaller page table entries down to the target level, preserving original
>>>>     permissions and attributes.
>>>> - __p2m_set_entry() updated to invoke superpage splitting when inserting
>>>>     entries at lower levels within a superpage-mapped region.
>>>>
>>>> This implementation is based on the ARM code, with modifications to the part
>>>> that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
>>>> not require BBM, so there is no need to invalidate the PTE and flush the
>>>> TLB before updating it with the newly created, split page table.
>>> But some flushing is going to be necessary. As long as you only ever do
>>> global flushes, the one after the individual PTE modification (within the
>>> split table) will do (if BBM isn't required, see below), but once you move
>>> to more fine-grained flushing, that's not going to be enough anymore. Not
>>> sure it's a good idea to leave such a pitfall.
>> I think that I don't fully understand what is an issue.
> Whether a flush is necessary after solely breaking up a superpage is arch-
> defined. I don't know how much restrictions the spec on possible hardware
> behavior for RISC-V. However, the eventual change of (at least) one entry
> of fulfill the original request will surely require a flush. What I was
> trying to say is that this required flush would better not also cover for
> the flushes that may or may not be required by the spec. IOW if the spec
> leaves any room for flushes to possibly be needed, those flushes would
> better be explicit.

I think that I still don't understand why what I wrote above will work as long
as global flushes is working and will stop to work when more fine-grained flushing
is used.

Inside p2m_split_superpage() we don't need any kind of TLB flush operation as
it is allocation a new page for a table and works with it, so no one could use
this page at the moment and cache it in TLB.

The only question is that if it is needed BBM before staring using splitted entry:
         ....
         if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
         {
             /* Free the allocated sub-tree */
             p2m_free_subtree(p2m, split_pte, level);

             rc = -ENOMEM;
             goto out;
         }

------> /* Should be BBM used here ? */
         p2m_write_pte(entry, split_pte, p2m->clean_pte);

And I can't find anything in the spec what tells me to use BBM here like Arm
does:
         /*
          * Follow the break-before-sequence to update the entry.
          * For more details see (D4.7.1 in ARM DDI 0487A.j).
          */
         p2m_remove_pte(entry, p2m->clean_pte);
         p2m_force_tlb_flush_sync(p2m);

         p2m_write_pte(entry, split_pte, p2m->clean_pte);

I agree that even BBM isn't mandated explicitly sometime it could be useful, but
here I am not really sure what is the point to do TLB flush before p2m_write_pte()
as nothing serious will happen if and old mapping will be used for a some time
as we are keeping the same rights for smaller (splited) mapping.
The reason why Arm does p2m_remove_pte() & p2m_force_tlb_flush() before updating
an entry here as it is doesn't guarantee that everything will be okay and they
explicitly tells:
  This situation can possibly break coherency and ordering guarantees, leading to
  inconsistent unwanted behavior in our Processing Element (PE).


>>> As to (no need for) BBM: I couldn't find anything to that effect in the
>>> privileged spec. Can you provide some pointer? What I found instead is e.g.
>>> this sentence: "To ensure that implicit reads observe writes to the same
>>> memory locations, an SFENCE.VMA instruction must be executed after the
>>> writes to flush the relevant cached translations." And this: "Accessing the
>>> same location using different cacheability attributes may cause loss of
>>> coherence." (This may not only occur when the same physical address is
>>> mapped twice at different VAs, but also after the shattering of a superpage
>>> when the new entry differs in cacheability.)
>> I also couldn't find that RISC-V spec mandates BBM explicitly as Arm does it.
>>
>> What I meant that on RISC-V can do:
>> - Write new PTE
>> - Flush TLB
>>
>> While on Arm it is almost always needed to do:
>> - Write zero to PTE
>> - Flush TLB
>> - Write new PTE
>>
>> For example, the common CoW code path where you copy from a read only page to
>> a new page, then map that new page as writable just works on RISC-V without
>> extra considerations and on Arm it requires BBM.
> CoW is a specific sub-case with increasing privilege.

Could you please explain why it matters increasing of privilege in terms of TLB
flushing and PTE clearing before writing a new PTE?

>
>> It seems to me that BBM is mandated for Arm only because that TLB is shared
>> among cores, so there is no any guarantee that no prior entry for same VA
>> remains in TLB. In case of RISC-V's TLB isn't shared and after a flush it is
>> guaranteed that no prior entry for the same VA remains in the TLB.
> Not sure that's the sole reason. But again the question is: Is this written
> down explicitly anywhere? Generally there can be multiple levels of TLBs, and
> while some of them may be per-core, others may be shared.

Spec. mentions that:
   If a hart employs an address-translation cache, that cache must appear to be
   private to that hart.

>
>>>> +    /*
>>>> +     * Even if we failed, we should install the newly allocated PTE
>>>> +     * entry. The caller will be in charge to free the sub-tree.
>>>> +     */
>>>> +    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m->clean_pte);
>>> Why would it be wrong to free the page right here, vacating the entry at
>>> the same time (or leaving just that to the caller)? (IOW - if this is an
>>> implementation decision of yours, I think the word "should" would want
>>> dropping.) After all, the caller invoking p2m_free_entry() on the thus
>>> split PTE is less efficient (needs to iterate over all entries) than on
>>> the original one (where it's just a single superpage).
>> I think that I didn't get your idea.
> Well, first and foremost this was a question to you, as it's not clear to
> me whether "should" is the correct word to use here. It would be
> appropriate if the spec mandated this behavior. It would seem less
> appropriate if this arrangement was an implementation choice of yours.
> And it looks to me as if the latter was the case here.

No, the spec doesn't mandate such behavior, it is just implementation specific.
I can mention that in the comment.

>
>>>> @@ -806,7 +877,36 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
>>>>         */
>>>>        if ( level > target )
>>> This condition is likely too strong, unless you actually mean to also
>>> split a superpage if it really wouldn't need splitting (new entry written
>>> still fitting with the superpage mapping, i.e. suitable MFN and same
>>> attributes).
>> I am not really sure that I fully understand.
>> My understanding is if level != target then the splitting is needed, I am
>> not really get the part "split a superpage if it really wouldn't need splitting".
> Hmm, maybe I was wrong here. The caller determines at what level the
> actual change needs to occur? In which case what you have may be right.

Yes, the caller determines expected level and then asks __p2m_set_entry() to map on
this level.

~ Oleksii


--------------8n3xDtdu0n0liBEdVpgXicnB
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
    <div class="moz-cite-prefix">On 7/21/25 3:34 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0c1701ff-efe3-434f-97e0-4896707411b7@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.07.2025 18:37, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 7/2/25 11:25 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
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
          <pre wrap="" class="moz-quote-pre">But some flushing is going to be necessary. As long as you only ever do
global flushes, the one after the individual PTE modification (within the
split table) will do (if BBM isn't required, see below), but once you move
to more fine-grained flushing, that's not going to be enough anymore. Not
sure it's a good idea to leave such a pitfall.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that I don't fully understand what is an issue.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Whether a flush is necessary after solely breaking up a superpage is arch-
defined. I don't know how much restrictions the spec on possible hardware
behavior for RISC-V. However, the eventual change of (at least) one entry
of fulfill the original request will surely require a flush. What I was
trying to say is that this required flush would better not also cover for
the flushes that may or may not be required by the spec. IOW if the spec
leaves any room for flushes to possibly be needed, those flushes would
better be explicit.
</pre>
    </blockquote>
    <pre>I think that I still don't understand why what I wrote above will work as long
as global flushes is working and will stop to work when more fine-grained flushing
is used.

Inside p2m_split_superpage() we don't need any kind of TLB flush operation as
it is allocation a new page for a table and works with it, so no one could use
this page at the moment and cache it in TLB.

The only question is that if it is needed BBM before staring using splitted entry:
        ....
        if ( !p2m_split_superpage(p2m, &amp;split_pte, level, target, offsets) )
        {
            /* Free the allocated sub-tree */
            p2m_free_subtree(p2m, split_pte, level);

            rc = -ENOMEM;
            goto out;
        }

------&gt; /* Should be BBM used here ? */
        p2m_write_pte(entry, split_pte, p2m-&gt;clean_pte);

And I can't find anything in the spec what tells me to use BBM here like Arm
does:
        /*
         * Follow the break-before-sequence to update the entry.
         * For more details see (D4.7.1 in ARM DDI 0487A.j).
         */
        p2m_remove_pte(entry, p2m-&gt;clean_pte);
        p2m_force_tlb_flush_sync(p2m);

        p2m_write_pte(entry, split_pte, p2m-&gt;clean_pte);

I agree that even BBM isn't mandated explicitly sometime it could be useful, but
here I am not really sure what is the point to do TLB flush before p2m_write_pte()
as nothing serious will happen if and old mapping will be used for a some time
as we are keeping the same rights for smaller (splited) mapping.
The reason why Arm does p2m_remove_pte() &amp; p2m_force_tlb_flush() before updating
an entry here as it is doesn't guarantee that everything will be okay and they
explicitly tells:
 This situation can possibly break coherency and ordering guarantees, leading to
 inconsistent unwanted behavior in our Processing Element (PE).


</pre>
    <blockquote type="cite"
      cite="mid:0c1701ff-efe3-434f-97e0-4896707411b7@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">As to (no need for) BBM: I couldn't find anything to that effect in the
privileged spec. Can you provide some pointer? What I found instead is e.g.
this sentence: "To ensure that implicit reads observe writes to the same
memory locations, an SFENCE.VMA instruction must be executed after the
writes to flush the relevant cached translations." And this: "Accessing the
same location using different cacheability attributes may cause loss of
coherence." (This may not only occur when the same physical address is
mapped twice at different VAs, but also after the shattering of a superpage
when the new entry differs in cacheability.)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
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
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
CoW is a specific sub-case with increasing privilege.</pre>
    </blockquote>
    <pre>Could you please explain why it matters increasing of privilege in terms of TLB
flushing and PTE clearing before writing a new PTE?

</pre>
    <blockquote type="cite"
      cite="mid:0c1701ff-efe3-434f-97e0-4896707411b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">It seems to me that BBM is mandated for Arm only because that TLB is shared
among cores, so there is no any guarantee that no prior entry for same VA
remains in TLB. In case of RISC-V's TLB isn't shared and after a flush it is
guaranteed that no prior entry for the same VA remains in the TLB.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not sure that's the sole reason. But again the question is: Is this written
down explicitly anywhere? Generally there can be multiple levels of TLBs, and
while some of them may be per-core, others may be shared.</pre>
    </blockquote>
    <pre>Spec. mentions that:
  If a hart employs an address-translation cache, that cache must appear to be
  private to that hart.

</pre>
    <blockquote type="cite"
      cite="mid:0c1701ff-efe3-434f-97e0-4896707411b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /*
+     * Even if we failed, we should install the newly allocated PTE
+     * entry. The caller will be in charge to free the sub-tree.
+     */
+    p2m_write_pte(entry, page_to_p2m_table(p2m, page), p2m-&gt;clean_pte);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why would it be wrong to free the page right here, vacating the entry at
the same time (or leaving just that to the caller)? (IOW - if this is an
implementation decision of yours, I think the word "should" would want
dropping.) After all, the caller invoking p2m_free_entry() on the thus
split PTE is less efficient (needs to iterate over all entries) than on
the original one (where it's just a single superpage).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that I didn't get your idea.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, first and foremost this was a question to you, as it's not clear to
me whether "should" is the correct word to use here. It would be
appropriate if the spec mandated this behavior. It would seem less
appropriate if this arrangement was an implementation choice of yours.
And it looks to me as if the latter was the case here.</pre>
    </blockquote>
    <pre>No, the spec doesn't mandate such behavior, it is just implementation specific.
I can mention that in the comment.

</pre>
    <blockquote type="cite"
      cite="mid:0c1701ff-efe3-434f-97e0-4896707411b7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -806,7 +877,36 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
       */
      if ( level &gt; target )
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This condition is likely too strong, unless you actually mean to also
split a superpage if it really wouldn't need splitting (new entry written
still fitting with the superpage mapping, i.e. suitable MFN and same
attributes).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I am not really sure that I fully understand.
My understanding is if level != target then the splitting is needed, I am
not really get the part "split a superpage if it really wouldn't need splitting".
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, maybe I was wrong here. The caller determines at what level the
actual change needs to occur? In which case what you have may be right.</pre>
    </blockquote>
    <pre>Yes, the caller determines expected level and then asks __p2m_set_entry() to map on
this level.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------8n3xDtdu0n0liBEdVpgXicnB--

