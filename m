Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9693A3FE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 17:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763360.1173634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHln-0006Rp-73; Tue, 23 Jul 2024 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763360.1173634; Tue, 23 Jul 2024 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHln-0006Oe-3k; Tue, 23 Jul 2024 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 763360;
 Tue, 23 Jul 2024 15:49:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sWHll-0006OV-Px
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 15:49:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWHlj-0001LW-NN; Tue, 23 Jul 2024 15:49:39 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWHlj-0006YQ-FU; Tue, 23 Jul 2024 15:49:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wUzWCTlUGrLKR24h9GKvZ3wynnbCjONG2LGEBDsu52c=; b=xkhMwE9YcMNqkoMSCp0BgjO0gv
	D7J7bZQyCU+sl0X/8jtGzqRrTD1DpIYhOyc9w7JC5a6izSuM61f+RRJlG2/vsfrUGtWYpXAw7D2Hl
	hF/jeuxc3wJ/n4FImEKZailPyBYYTwnO8daDPMuRortMNfSyMfd70+iCu0sfkNFSBgyc=;
Message-ID: <9baa3203-b8d0-4774-a2a5-7ba61b213f1c@xen.org>
Date: Tue, 23 Jul 2024 16:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
Content-Language: en-GB
To: oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
 <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
 <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
 <CAMacjJwWLjGcFbYEhCPyNEW_+sfb51+XtKqyBcc2JGm=D5bf0w@mail.gmail.com>
 <97c82aca-0b8a-4b78-980b-0857dbdae80a@suse.com>
 <4c9eb7a79c33c7cd2f6bde05b1fbc7770e662026.camel@gmail.com>
 <14ffb00d-d6ba-4c18-88c1-2601a2df8a8b@suse.com>
 <b7e248ae79aaded532d86453520fcb4cb7a7fb3b.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b7e248ae79aaded532d86453520fcb4cb7a7fb3b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 23/07/2024 16:36, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-23 at 12:02 +0200, Jan Beulich wrote:
>> On 23.07.2024 10:55, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-07-23 at 10:36 +0200, Jan Beulich wrote:
>>>> On 23.07.2024 10:02, Oleksii Kurochko wrote:
>>>>> On Mon, Jul 22, 2024 at 7:27 PM Julien Grall <julien@xen.org>
>>>>> wrote:
>>>>>>>> On 22/07/2024 15:44, Oleksii Kurochko wrote:
>>>>>>>      /* Map a 4k page in a fixmap entry */
>>>>>>>      void set_fixmap(unsigned map, mfn_t mfn, unsigned int
>>>>>>> flags)
>>>>>>>      {
>>>>>>>          pte_t pte;
>>>>>>>
>>>>>>>          pte = mfn_to_xen_entry(mfn, flags);
>>>>>>>          pte.pte |= PTE_LEAF_DEFAULT;
>>>>>>>          write_pte(&xen_fixmap[pt_index(0,
>>>>>>> FIXMAP_ADDR(map))],
>>>>>>> pte);
>>>>>>
>>>>>> It would be saner to check if you are not overwriting any
>>>>>> existing
>>>>>> mapping as otherwise you will probably need a TLB flush.
>>>>>>
>>>>>>>      }
>>>>>>>
>>>>>>>      /* Remove a mapping from a fixmap entry */
>>>>>>>      void clear_fixmap(unsigned map)
>>>>>>>      {
>>>>>>>          pte_t pte = {0};
>>>>>>>          write_pte(&xen_fixmap[pt_index(0,
>>>>>>> FIXMAP_ADDR(map))],
>>>>>>> pte);
>>>>>>
>>>>>> Don't you need a TLB flush?
>>>>>>
>>>>> Inside write_pte() there is "sfence.vma".
>>>>
>>>> That's just a fence though, not a TLB flush.
>>>  From the privileged doc:
>>>     ```
>>>     SFENCE.VMA is also used to invalidate entries in the
>>>     address-translation cache associated with a hart (see Section
>>> 4.3.2).
>>>     ...
>>>     The SFENCE.VMA is used to flush any local hardware caches
>>> related to
>>>     address translation.
>>>     It is specified as a fence rather than a TLB flush to provide
>>> cleaner
>>>     semantics with respect to
>>>     which instructions are affected by the flush operation and to
>>> support a
>>>     wider variety of dynamic
>>>     caching structures and memory-management schemes. SFENCE.VMA is
>>> also
>>>     used by higher
>>>     privilege levels to synchronize page table writes and the
>>> address
>>>     translation hardware.
>>>     ...
>>>     ```
>>> I read this as SFENCE.VMA is used not only for ordering of
>>> load/stores,
>>> but also to flush TLB ( which is a type of more general term as
>>> address-translation cache, IIUIC ).
I have to admit, I am a little because concerned with calling sfence.vma 
in write_pte() (this may only be because I am not very familiar with 
RISC-V).

We have cases where multiple entry will be written in a single 
map_pages_to_xen() call. So wouldn't this means that the local TLBs 
would be nuked for every write rather than once?


>>
>> Oh, I see. Kind of unexpected for an instruction of that name. Yet
>> note
>> how they talk about the local hart only. You need a wider scope TLB
>> flush here.
> Could you please clarify why it is needed wider?
> 
> Arm Xen flushed only local TLB.

Which code are you looking at? set_fixmap() will propagate the TLB flush 
to all innershareable CPUs.

The PMAP interface will do a local TLB flush because the interface can 
only be used during early boot where there is a single CPU running.

> RISC-V Linux kernel for fixmap also uses: local_flush_tlb_page().

I don't know how Linux is using set_fixmap(). But what matters is how 
Xen is using set_fixmap(). We have a couple of places in Xen where the 
fixmap needs to be accessed by all the CPUs.

Given this is a common interface in Xen, I think it makes sense to 
follow the same approach to avoid any confusion.

Cheers,

-- 
Julien Grall

