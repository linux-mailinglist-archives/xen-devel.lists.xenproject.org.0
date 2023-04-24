Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B116ECA45
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 12:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525275.816375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtLf-0004xB-5F; Mon, 24 Apr 2023 10:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525275.816375; Mon, 24 Apr 2023 10:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtLf-0004uB-1j; Mon, 24 Apr 2023 10:23:07 +0000
Received: by outflank-mailman (input) for mailman id 525275;
 Mon, 24 Apr 2023 10:23:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pqtLd-0004tm-KE
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 10:23:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqtLZ-0007zb-1W; Mon, 24 Apr 2023 10:23:01 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.3.150]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqtLY-0003pR-Re; Mon, 24 Apr 2023 10:23:00 +0000
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
	bh=UcwEkydxSvmzXPLWYGZR+632HvL01o8v2DFYmJKYHb4=; b=KJ/jHtEU9JwPbEIaaXo2ulsHd7
	U2nBwng0NlRURR1z0bL0QeRksnLgaMYqjkrkwIAikdPnZ5R8zYEqP3WdmPVJU2/vNs32recCylOnj
	kSNZHOxKohg05Nco1xFE8wohF+uBAIZZflWw5xLs3FOGcMDbM7k8RtieggJL+rATn5Mk=;
Message-ID: <db3a9b3b-63db-89d1-5386-57eb7044b317@xen.org>
Date: Mon, 24 Apr 2023 11:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
 <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/04/2023 10:33, Jan Beulich wrote:
> On 21.04.2023 16:41, Oleksii wrote:
>> On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
>>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>>> + *
>>>> ===================================================================
>>>> =========
>>>> + *    Start addr    |   End addr        |  Size  | VM area
>>>> description
>>>> + *
>>>> ===================================================================
>>>> =========
>>>> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | Xen
>>>> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | FDT
>>>> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | Fixmap
>>>
>>> These are all L2 slot 511 aiui, which may be worth mentioning
>>> especially since
>>> the top bits don't match the top bits further down in the table
>>> (because of the
>>> aliasing).
>>
>> Than I'll add one more column where I'll put slot number
>>
>>>
>>>> + *     .................. unused ..................
>>>
>>> This is covering slot 510, which again may be worth mentioning.
>>>
>>>> + * 0000003200000000 |  0000007f40000000 | 331 GB | Direct map(L2
>>>> slot: 200-509)
>>>> + * 0000003100000000 |  0000003140000000 |  1 GB  | Frametable(L2
>>>> slot: 196-197)
>>>
>>> 1Gb is, if I'm not mistaken, a single L2 slot.
>> Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
>> included. I'll update the table.
>>
>>>
>>> Also assuming a 32-byte struct page_info (I don't think you'll get
>>> away with
>>> less than that, when even Arm32 requires this much), there's a
>>> mismatch
>>> between direct map and frame table size: With 4k pages, the scaling
>>> factor
>>> would be 128 if I'm not mistaken. So perhaps you really mean 3Gb here
>>> to
>>> cover for (slightly more than) the 331Gb of memory you mean to be
>>> able to
>>> map?
>> For RV64 page_info size will be 56-byte and 32-byte for RV32 but you
>> are right it should 3 Gb in that case what will be enough ( taking into
>> account both available sizes of page_info structure ).
> 
> As to the plan to it being 56 bytes (i.e. like on Arm): Arm forever has
> had a 64-bit padding field at the end. My best guess is that the field
> was introduced to have a 32-byte struct on Arm32. 

I can't exactly remember. But I would like to rework the struct 
page_info on Arm64 because...

But then why
> artificially increase the struct from 48 to 56 bytes on Arm64? And hence
> why have the same oddity on RV64?


... with 56 bytes, some struct page_info may cross a cache boundary. For 
RISC-V, I would recommend to make sure the struct page_info will never 
cross a cache boundary.

Cheers,

-- 
Julien Grall

