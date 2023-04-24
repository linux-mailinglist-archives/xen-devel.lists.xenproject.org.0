Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E16ECAFF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 13:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525305.816416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqu3C-0002uM-AW; Mon, 24 Apr 2023 11:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525305.816416; Mon, 24 Apr 2023 11:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqu3C-0002rD-7U; Mon, 24 Apr 2023 11:08:06 +0000
Received: by outflank-mailman (input) for mailman id 525305;
 Mon, 24 Apr 2023 11:08:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pqu3A-0002r7-UQ
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 11:08:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqu38-0000rf-De; Mon, 24 Apr 2023 11:08:02 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.3.150]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqu38-0005oM-6h; Mon, 24 Apr 2023 11:08:02 +0000
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
	bh=thDmyMjK9TuOKkvy1oSR0fJNU3F8rRvSYOHyO8k4/XA=; b=xUIzGhbPHC2jhPmAdmR3Oefk8j
	i95LNJbOM5fhzjqfXKyAjab4dCr6CGvHEhlps8qP8XXmlubuykMcvvNCNkBJkfY5H830BBn5AaFFU
	c1ed+NTJe9mEpMty6q42pUwnFdY8L52DAiEen13d1/JCF3lQNrYajNdLdmg6+hNdbwAs=;
Message-ID: <5176b0bc-3727-e939-9776-ee4bfd732e32@xen.org>
Date: Mon, 24 Apr 2023 12:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
 <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
 <db3a9b3b-63db-89d1-5386-57eb7044b317@xen.org>
 <d157b1e2-cfc5-f7b7-9443-16d1db9a4311@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d157b1e2-cfc5-f7b7-9443-16d1db9a4311@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 24/04/2023 11:45, Jan Beulich wrote:
> On 24.04.2023 12:22, Julien Grall wrote:
>> Hi,
>>
>> On 24/04/2023 10:33, Jan Beulich wrote:
>>> On 21.04.2023 16:41, Oleksii wrote:
>>>> On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
>>>>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>>>>> + *
>>>>>> ===================================================================
>>>>>> =========
>>>>>> + *    Start addr    |   End addr        |  Size  | VM area
>>>>>> description
>>>>>> + *
>>>>>> ===================================================================
>>>>>> =========
>>>>>> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | Xen
>>>>>> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | FDT
>>>>>> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | Fixmap
>>>>>
>>>>> These are all L2 slot 511 aiui, which may be worth mentioning
>>>>> especially since
>>>>> the top bits don't match the top bits further down in the table
>>>>> (because of the
>>>>> aliasing).
>>>>
>>>> Than I'll add one more column where I'll put slot number
>>>>
>>>>>
>>>>>> + *     .................. unused ..................
>>>>>
>>>>> This is covering slot 510, which again may be worth mentioning.
>>>>>
>>>>>> + * 0000003200000000 |  0000007f40000000 | 331 GB | Direct map(L2
>>>>>> slot: 200-509)
>>>>>> + * 0000003100000000 |  0000003140000000 |  1 GB  | Frametable(L2
>>>>>> slot: 196-197)
>>>>>
>>>>> 1Gb is, if I'm not mistaken, a single L2 slot.
>>>> Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
>>>> included. I'll update the table.
>>>>
>>>>>
>>>>> Also assuming a 32-byte struct page_info (I don't think you'll get
>>>>> away with
>>>>> less than that, when even Arm32 requires this much), there's a
>>>>> mismatch
>>>>> between direct map and frame table size: With 4k pages, the scaling
>>>>> factor
>>>>> would be 128 if I'm not mistaken. So perhaps you really mean 3Gb here
>>>>> to
>>>>> cover for (slightly more than) the 331Gb of memory you mean to be
>>>>> able to
>>>>> map?
>>>> For RV64 page_info size will be 56-byte and 32-byte for RV32 but you
>>>> are right it should 3 Gb in that case what will be enough ( taking into
>>>> account both available sizes of page_info structure ).
>>>
>>> As to the plan to it being 56 bytes (i.e. like on Arm): Arm forever has
>>> had a 64-bit padding field at the end. My best guess is that the field
>>> was introduced to have a 32-byte struct on Arm32.
>>
>> I can't exactly remember. But I would like to rework the struct
>> page_info on Arm64 because...
>>
>> But then why
>>> artificially increase the struct from 48 to 56 bytes on Arm64? And hence
>>> why have the same oddity on RV64?
>>
>>
>> ... with 56 bytes, some struct page_info may cross a cache boundary.
> 
> I guess that's going to be challenging, unless you mean to go further up
> to 64 bytes?

Yes.

> 
>> For
>> RISC-V, I would recommend to make sure the struct page_info will never
>> cross a cache boundary.
> 
> Since going up to 64 bytes is wasteful, 

Well yes. But this is a trade-off between performance and memory usage. 
With the current situation, you may have to pull two cache lines for 
struct page_info.

I suspect you might see some slow down when using the grant. But I don't 
have any concrete numbers.

> and going down to 32 bytes likely
> isn't going to be easy, sticking to 48 bytes for now would seem reasonable
> to me.

It may be more difficult to argue for an increase (if we notice any 
performance degradation) in the future because this would reduce the 
memory usable for every users.

Anyway, I haven't fully explore the problem on Arm yet and it is 
possible we could deal with any performance degradation differently 
(e.g. re-order the field and/or slightly increasing/decreasing the size).

I thought I would point it out just in case the RISC-V folks care about it.

Cheers,

-- 
Julien Grall

