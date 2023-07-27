Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA47652D4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571043.893922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzSF-0003TP-7I; Thu, 27 Jul 2023 11:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571043.893922; Thu, 27 Jul 2023 11:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzSF-0003Qr-49; Thu, 27 Jul 2023 11:46:51 +0000
Received: by outflank-mailman (input) for mailman id 571043;
 Thu, 27 Jul 2023 11:46:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfsC=DN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qOzSD-0003Ql-VY
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:46:49 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c8eb69-2c73-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 13:46:46 +0200 (CEST)
Received: from [10.10.1.94] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690458398151729.4027551687199;
 Thu, 27 Jul 2023 04:46:38 -0700 (PDT)
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
X-Inumbo-ID: 42c8eb69-2c73-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1690458400; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HV2Ipr99h8fCj2oOFcH1axBbseGE8bQBWvG+j6+XdplFSqcR+O21KMHPw6Qsj/PzHob7swtHuN008q/iI0/tP6WVrBHoMVFHDHpHCPQDh6fSDSzLeZn3DO2wevjUylmi98yKjEfN5xKEtmW7f7jbOFOVfmAYssby3/cnxnAYzAM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690458400; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=K0GLp8MK3QdMiirM3gElxDw+KxMOPbQPaby+TbtZNRY=; 
	b=Q1YUUbyb8R6tH+pfmthYzJzfVp+aUaeG20dypIoVUY2bpNBV4sbmMfTrZp4MiyMNx0CKK/NiMB1t1JWH2dgUkZPdnytWiTOqmuEHzTe+jW17pcXPDEzdEoLqxZNKxdc+4xipKfBjJdf5DTtBIEOuAFE5YBh+ndH7n078EVfXd/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690458400;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=K0GLp8MK3QdMiirM3gElxDw+KxMOPbQPaby+TbtZNRY=;
	b=bdPIGQ6NNnchOV+E5XFvmZd2qcf/XP1mn3WiZwwPVeqIQl7QsvFERIy2LuDAsOgQ
	Nb7u5/xkEf/elVgwPdu1BC5sB2fJNdu46vuHAFrY7sLdm34Ul2uzlmXirTnRFvjXA2n
	wGwv0I+E/brLRV0QjkyGeiW7YQ5d8o1nlNGy+xAw=
Message-ID: <2994c9b8-c803-1fd9-20df-0d25d2b66c49@apertussolutions.com>
Date: Thu, 27 Jul 2023 07:46:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
 <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
 <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
 <CACMJ4Gb_ZwKSjP7qzfQj98YQjSpBdFuWzeGQJUNNqst0GdXCOw@mail.gmail.com>
 <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4e0a0fc9-0c1b-4725-5692-de67ee68a980@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 7/21/23 02:14, Jan Beulich wrote:
> On 21.07.2023 00:12, Christopher Clark wrote:
>> On Thu, Jul 13, 2023 at 11:51 PM Christopher Clark <
>> christopher.w.clark@gmail.com> wrote:
>>
>>>
>>>
>>> On Sat, Jul 8, 2023 at 11:47 AM Stefano Stabellini <sstabellini@kernel.org>
>>> wrote:
>>>
>>>> On Sat, 1 Jul 2023, Christopher Clark wrote:
>>>>> To convert the x86 boot logic from multiboot to boot module structures,
>>>>> change the bootstrap map function to accept a boot module parameter.
>>>>>
>>>>> To allow incremental change from multiboot to boot modules across all
>>>>> x86 setup logic, provide a temporary inline wrapper that still accepts a
>>>>> multiboot module parameter and use it where necessary. The wrapper is
>>>>> placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
>>>>> inline function into an existing header that has no such functions
>>>>> already. This new header will be expanded with additional functions in
>>>>> subsequent patches in this series.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>>
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
>>>>> index b72ae31a66..eb93cc3439 100644
>>>>> --- a/xen/include/xen/bootinfo.h
>>>>> +++ b/xen/include/xen/bootinfo.h
>>>>> @@ -10,6 +10,9 @@
>>>>>   #endif
>>>>>
>>>>>   struct boot_module {
>>>>> +    paddr_t start;
>>>>> +    size_t size;
>>>>
>>>> I think size should be paddr_t (instead of size_t) to make sure it is
>>>> the right size on both 64-bit and 32-bit architectures that support
>>>> 64-bit addresses.
>>>>
>>>
>>> Thanks, that explanation does make sense - ack.
>>>
>>
>> I've come back to reconsider this as it doesn't seem right to me to store a
>> non-address value (which this will always be) in a type explicitly defined
>> to hold an address: addresses may have architectural alignment requirements
>> whereas a size value is just a number of bytes so will not. The point of a
>> size_t value is that size_t is defined to be large enough to hold the size
>> of any valid object in memory, so I think this was right as-is.
> 
> "Any object in memory" implies virtual addresses (or more generally addresses
> which can be used for accessing objects). This isn't the case when considering
> physical addresses - there may be far more memory in a system than can be made
> accessible all in one go.

That is not my understanding of it, but I could be wrong. My 
understanding based on all the debates I have read online around this 
topic is that the intent in the spec is that size_t has to be able to 
hold a value that represents the largest object the CPU can manipulate 
with general purpose operations. From which I understand to mean as 
large as the largest register a CPU instruction may use for a size 
argument to a general purpose instruction. On x86_64, that is a 64bit 
register, as I don't believe the SSE/AVX registers are counted even 
though the are used by compiler/libc implementations to optimize some 
memory operations.

 From what I have seen for Xen, this is currently reflected in the x86 
code base, as size_t is 32bits for the early 32bit code and 64bits for 
Xen proper.

That aside, another objection I have to the use of paddr_t is that it is 
type abuse. Types are meant to convey context to the intended use of the 
variable and enable the ability to enforce proper usage of the variable, 
otherwise we might as well just use u64/uint64_t and be done. The 
field's purpose is to convey a size of an object, and labeling it a type 
that is intended for physical address objects violates both intents 
behind declaring a type, it asserts an invalid context and enables 
violations of type checking.

V/r,
Daniel P. Smith

