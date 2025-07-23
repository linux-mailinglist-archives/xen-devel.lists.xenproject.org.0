Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104CB0FB22
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 21:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054669.1423369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uefUm-0004KL-Lx; Wed, 23 Jul 2025 19:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054669.1423369; Wed, 23 Jul 2025 19:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uefUm-0004HE-IL; Wed, 23 Jul 2025 19:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1054669;
 Wed, 23 Jul 2025 19:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CU+V=2E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uefUl-0004H8-2h
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 19:51:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d5ef9b-67fe-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 21:51:16 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-607434e1821so429666a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 12:51:16 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca30d2esm1089430866b.86.2025.07.23.12.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 12:51:14 -0700 (PDT)
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
X-Inumbo-ID: 64d5ef9b-67fe-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753300275; x=1753905075; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5Z8AsNsKI2KzMLW/CW5lC+/Peokd6B3eb7kx123ojQ=;
        b=GOOrgkHinLEfVtLUn6CGeXNUXvMMmG74XUfq+NLsUXjyKU5845CGj36t2RdTJth495
         KXh7KYarDCEqXhQ0kzzjzFc8U66GgABms/ifGum/hvV6sDaOI/qejwkA4QUwcCclEdBO
         NWfb7UmBSUAcqopgXu8s5y6Aps9anvX2alcRS3qh2LpbzsaV5RzZaXu0tyCmyLAwTjoc
         3X3T+xy/MqH/i9WPJVr96TcTAPZz7/ve7Tn2yfcmQE2bQqCnfs0uYfBEOTHbRB5J5fcR
         Fe06K2VtTuhNlP10Y7CbspnEskmIDDHJDSFlS8hSTNHK98/hEg6GOKfFuGhLnM2m6KHd
         nutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753300275; x=1753905075;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v5Z8AsNsKI2KzMLW/CW5lC+/Peokd6B3eb7kx123ojQ=;
        b=nQ948a6Zzz2XWaVY9KDPNufSEZMNUrmyUYmZobXbx75Ta3QJaOxSsmvBUmKgg0bZzm
         DcjlcRg6ropSQQfRFU6vLXaT0Kg2UpOF+2wQFO4qqlzwYhkX48H3E8Q5Ejk/+SMCf40E
         JJ6tnJ0P0n8zSqz0EclLnds4FWRNBr5qx1mfGumgsiOYnd6eIzlRw3aa3FDsfBRG8TSE
         IteGlIKyu9Ri90fK45vPGyyfHj+hoD6IdT5cwLfj8BQru9Y83lpjD7RbyCp+cClTcInF
         BQ5gxOjwcZIgm/oqlBd4BXClAe6MfIn4sGswiTCGDwE4Wg935nw5gt5fOEhJnnZQThk7
         vd8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8GolCgY59yhVTyYcg0UuxqiV8qA/0sNYAC+dHcdGFH4oSPPXT1mwNawRYUBbOTpzUEu3gR9Y3vmE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJyvfrEipbZ5J75TTBp0ohsFIiHWdpd45RWPdnEx+BdZTkmQ0k
	NnPYKPsL1109mPF5M1VqEYFoX1AZfNF5QeFnujXkoVP5B8OHkTADgaZZ
X-Gm-Gg: ASbGncuDTrr+9EPWmOGu/7h3z5FbHs9Dwspt8MLyjniBeS8iUJezZiTvUO6VzjHir9Q
	Ra3KV7HYngvkgh6sZBDWtUhZMpqXLj4sd2n4RF7rL4/tiG94WIBeadfMyvenCZ9j2guqr4xgWbs
	55FOMATpoN7PAzIbGeKj+pr9vToJqHNy6E6YRpDACBdzt3wwKDJIF52EXTKy1EOULm7KGZKhgZW
	hNJ5GYo5zauQmJLdb0Rv/J3FnsVsWhFObD53INO2sOxwFd14/PvTvRUemP+a+XsirzJSpZg71I/
	54x6YHNKNChOAboBvW6v+RYshRBM3xbGRtEGUKFmbNBHEDAXiwtp6wzb2mz7yj7REcqX3/1Dsvc
	VXE9mmHGo3giP2aL5DZ3M895EAx/xvfSOldfFJZBoAJT+LQUlo6L2KVew7yx7svBmZthV2V4=
X-Google-Smtp-Source: AGHT+IEKem1Ws0FgqGrGwanr968h/BUq7ff4jQiAzkrP3hTaMckzLxvTPWYKblsCA3nPlqyVZtMJzg==
X-Received: by 2002:a17:907:2d12:b0:ae0:bee7:ad7c with SMTP id a640c23a62f3a-af2f8d4fb14mr429319266b.46.1753300275077;
        Wed, 23 Jul 2025 12:51:15 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6w81Jq5EVBT4XgYW5xXveBKK"
Message-ID: <d24d32b2-a4a4-4284-8b94-297d8dd08a76@gmail.com>
Date: Wed, 23 Jul 2025 21:51:13 +0200
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
 <640d6862-4ea9-49ca-adb8-0fad5ceb1ff1@gmail.com>
 <6f88e20e-98dd-4d58-b459-5a67e2629f4c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6f88e20e-98dd-4d58-b459-5a67e2629f4c@suse.com>

This is a multi-part message in MIME format.
--------------6w81Jq5EVBT4XgYW5xXveBKK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/22/25 6:02 PM, Jan Beulich wrote:
> On 22.07.2025 16:57, Oleksii Kurochko wrote:
>> On 7/21/25 3:34 PM, Jan Beulich wrote:
>>> On 17.07.2025 18:37, Oleksii Kurochko wrote:
>>>> On 7/2/25 11:25 AM, Jan Beulich wrote:
>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>> Add support for down large memory mappings ("superpages") in the RISC-V
>>>>>> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
>>>>>> can be inserted into lower levels of the page table hierarchy.
>>>>>>
>>>>>> To implement that the following is done:
>>>>>> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>>>>>>      smaller page table entries down to the target level, preserving original
>>>>>>      permissions and attributes.
>>>>>> - __p2m_set_entry() updated to invoke superpage splitting when inserting
>>>>>>      entries at lower levels within a superpage-mapped region.
>>>>>>
>>>>>> This implementation is based on the ARM code, with modifications to the part
>>>>>> that follows the BBM (break-before-make) approach. Unlike ARM, RISC-V does
>>>>>> not require BBM, so there is no need to invalidate the PTE and flush the
>>>>>> TLB before updating it with the newly created, split page table.
>>>>> But some flushing is going to be necessary. As long as you only ever do
>>>>> global flushes, the one after the individual PTE modification (within the
>>>>> split table) will do (if BBM isn't required, see below), but once you move
>>>>> to more fine-grained flushing, that's not going to be enough anymore. Not
>>>>> sure it's a good idea to leave such a pitfall.
>>>> I think that I don't fully understand what is an issue.
>>> Whether a flush is necessary after solely breaking up a superpage is arch-
>>> defined. I don't know how much restrictions the spec on possible hardware
>>> behavior for RISC-V. However, the eventual change of (at least) one entry
>>> of fulfill the original request will surely require a flush. What I was
>>> trying to say is that this required flush would better not also cover for
>>> the flushes that may or may not be required by the spec. IOW if the spec
>>> leaves any room for flushes to possibly be needed, those flushes would
>>> better be explicit.
>> I think that I still don't understand why what I wrote above will work as long
>> as global flushes is working and will stop to work when more fine-grained flushing
>> is used.
>>
>> Inside p2m_split_superpage() we don't need any kind of TLB flush operation as
>> it is allocation a new page for a table and works with it, so no one could use
>> this page at the moment and cache it in TLB.
>>
>> The only question is that if it is needed BBM before staring using splitted entry:
>>           ....
>>           if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
>>           {
>>               /* Free the allocated sub-tree */
>>               p2m_free_subtree(p2m, split_pte, level);
>>
>>               rc = -ENOMEM;
>>               goto out;
>>           }
>>
>> ------> /* Should be BBM used here ? */
>>           p2m_write_pte(entry, split_pte, p2m->clean_pte);
>>
>> And I can't find anything in the spec what tells me to use BBM here like Arm
>> does:
> But what you need is a statement in the spec that you can get away without. Imo
> at least.

In the spec. it is mentioned that:
   It is permitted for multiple address-translation cache entries to co-exist for the same
   address. This represents the fact that in a conventional TLB hierarchy, it is possible for
   multiple entries to match a single address if, for example, a page is upgraded to a
   superpage without first clearing the original non-leaf PTE’s valid bit and executing an
   SFENCE.VMA with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
   hierarchy. In this case, just as if an SFENCE.VMA is not executed between a write to the
   memory-management tables and subsequent implicit read of the same address: it is
   unpredictable whether the old non-leaf PTE or the new leaf PTE is used, but the behavior is
   otherwise well defined.
The phrase*"but the behavior is otherwise well defined"* emphasizes that even if the TLB sees
two versions (the old and the new), the architecture guarantees stability, and the behavior
remains safe — though unpredictable in terms of which translation will be used.
And I think that this unpredictability is okay, at least, in the case if superpage splitting
and therefore TLB flushing can be deferred since the old pages (which are used for old mapping)
still exist and the permissions of the new entries match those of the original ones.
Also, it seems like there clearing PTE before TLB flushing isn't need too.

Does it make sense?

--------------6w81Jq5EVBT4XgYW5xXveBKK
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
    <div class="moz-cite-prefix">On 7/22/25 6:02 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6f88e20e-98dd-4d58-b459-5a67e2629f4c@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">On 22.07.2025 16:57, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 7/21/25 3:34 PM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 17.07.2025 18:37, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 7/2/25 11:25 AM, Jan Beulich wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">Add support for down large memory mappings ("superpages") in the RISC-V
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
</pre></blockquote><pre wrap="" class="moz-quote-pre">But some flushing is going to be necessary. As long as you only ever do
global flushes, the one after the individual PTE modification (within the
split table) will do (if BBM isn't required, see below), but once you move
to more fine-grained flushing, that's not going to be enough anymore. Not
sure it's a good idea to leave such a pitfall.
</pre></blockquote><pre wrap="" class="moz-quote-pre">I think that I don't fully understand what is an issue.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Whether a flush is necessary after solely breaking up a superpage is arch-
defined. I don't know how much restrictions the spec on possible hardware
behavior for RISC-V. However, the eventual change of (at least) one entry
of fulfill the original request will surely require a flush. What I was
trying to say is that this required flush would better not also cover for
the flushes that may or may not be required by the spec. IOW if the spec
leaves any room for flushes to possibly be needed, those flushes would
better be explicit.
</pre></blockquote><pre wrap="" class="moz-quote-pre">I think that I still don't understand why what I wrote above will work as long
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
</pre></blockquote><pre wrap="" class="moz-quote-pre">But what you need is a statement in the spec that you can get away without. Imo
at least.</pre></pre>
    </blockquote>
    <pre>In the spec. it is mentioned that:
  It is permitted for multiple address-translation cache entries to co-exist for the same
  address. This represents the fact that in a conventional TLB hierarchy, it is possible for
  multiple entries to match a single address if, for example, a page is upgraded to a
  superpage without first clearing the original non-leaf PTE’s valid bit and executing an
  SFENCE.VMA with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
  hierarchy. In this case, just as if an SFENCE.VMA is not executed between a write to the
  memory-management tables and subsequent implicit read of the same address: it is
  unpredictable whether the old non-leaf PTE or the new leaf PTE is used, but the behavior is
  otherwise well defined.
The phrase <strong data-start="11" data-end="59">"but the behavior is otherwise well defined"</strong> emphasizes that even if the TLB sees
two versions (the old and the new), the architecture guarantees stability, and the behavior
remains safe — though unpredictable in terms of which translation will be used.
And I think that this unpredictability is okay, at least, in the case if superpage splitting
and therefore TLB flushing can be deferred since the old pages (which are used for old mapping)
still exist and the permissions of the new entries match those of the original ones.
Also, it seems like there clearing PTE before TLB flushing isn't need too.

Does it make sense?
</pre>
  </body>
</html>

--------------6w81Jq5EVBT4XgYW5xXveBKK--

