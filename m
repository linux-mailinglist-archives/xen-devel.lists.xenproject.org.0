Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9220B3078F2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 16:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77159.139589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58nE-0002T3-3B; Thu, 28 Jan 2021 15:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77159.139589; Thu, 28 Jan 2021 15:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58nD-0002Se-Vx; Thu, 28 Jan 2021 15:01:07 +0000
Received: by outflank-mailman (input) for mailman id 77159;
 Thu, 28 Jan 2021 15:01:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l58nC-0002SZ-Lv
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 15:01:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l58n9-000838-Vd; Thu, 28 Jan 2021 15:01:03 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l58n9-0001l9-PT; Thu, 28 Jan 2021 15:01:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=r2sKZ+AtB2Ys5rraL56S/ydavXu3N0cFv23nQTlnnjI=; b=IC73JJ97ybkiWzu/ocTZzLh5Uw
	kwrAY5AbqMP8mG+XCBXqImzoEa9CjEK9ClilGVOkaLkzuAAxMNP7irvGH7Z63fIuW5DuQrVsegxnW
	b8u9nqhOPYfxt/EhhE20/0LN7kL5Q8cbXq6iaAX4lZCWM7ye0jwhVTJmZYzIK4iQNuD8=;
Subject: Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-11-git-send-email-olekstysh@gmail.com>
 <2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
 <f4a4cbe6-89a1-3f80-2d03-fd62c5d7eda6@suse.com>
 <61c10e68-d3fe-af16-b22f-bac804a0a70a@xen.org>
 <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <44cabe06-ef31-8f27-0917-720b871924db@xen.org>
Date: Thu, 28 Jan 2021 15:01:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/01/2021 14:36, Jan Beulich wrote:
> On 28.01.2021 15:21, Julien Grall wrote:
>> On 28/01/2021 13:53, Jan Beulich wrote:
>>> On 28.01.2021 14:41, Julien Grall wrote:
>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> The IOREQ is a common feature now and these fields will be used
>>>>> on Arm as is. Move them to common struct vcpu as a part of new
>>>>> struct vcpu_io and drop duplicating "io" prefixes. Also move
>>>>> enum hvm_io_completion to xen/sched.h and remove "hvm" prefixes.
>>>>>
>>>>> This patch completely removes layering violation in the common code.
>>>>>
>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>> CC: Julien Grall <julien.grall@arm.com>
>>>>> [On Arm only]
>>>>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>>>
>>>> I seem to have trouble running Xen on x86 platform after this patch is
>>>> applied (see trace below).
>>>>
>>>> The bisector pointed out to this patch but I can't quite figure out why
>>>> this is breaking.
>>>>
>>>> Does this ring any bell to someone?
>>>
>>> Memory overwriting / corruption? This ...
>>>
>>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
>>>> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=n gcov=y  Tainted:   C   ]----
>>>> (XEN) CPU:    1
>>>> (XEN) RIP:    e008:[<ffff82d04041c1c7>]
>>>> x86_64/entry.S#restore_all_guest+0x7/0x145
>>>> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor (d0v0)
>>>> (XEN) rax: 00000000000000ff   rbx: ffff83027c806000   rcx: ffff82d0406c9a80
>>>> (XEN) rdx: 0000000000000000   rsi: fffffffffffffed9   rdi: 0000000000000001
>>>> (XEN) rbp: ffff83027c887df0   rsp: ffff83027c887ef8   r8:  00000000aaa8946e
>>>> (XEN) r9:  0000000000000002   r10: ffff83027c806040   r11: ffff83027c8cc020
>>>> (XEN) r12: ffff83027c80f000   r13: ffff83027c895000   r14: 0000000000000000
>>>> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003426e0
>>>> (XEN) cr3: 0000000273a2d000   cr2: 0000000000000000
>>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>>> (XEN) Xen code around <ffff82d04041c1c7>
>>>> (x86_64/entry.S#restore_all_guest+0x7/0x145):
>>>> (XEN)  00 48 8b 93 98 0d 00 00 <44> 8b 3a 4c 8b 8b 68 0b 00 00 ba ff 7f
>>>
>>> ... is
>>>
>>> restore_all_guest:
>>>           ASSERT_INTERRUPTS_DISABLED
>>>
>>>           /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>>>           mov VCPU_arch_msrs(%rbx), %rdx
>>>           mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
>>>
>>> i.e. Dom0/vCPU0's v->arch.msrs got zeroed in an unintended way,
>>> hence %rdx is zero here (%rbx looks at least plausible).
>>>
>>> I take it that you double check this isn't an incremental build
>>> issue, i.e. entry.o for some reason not having got rebuilt
>>> despite struct vcpu's layout having changed?
>>
>> I was going to reply back on my e-mail with more debugging information.
>> It seems that this is a build issue as if I clean the repo the error
>> disappear.
>>
>> The error happens when I move from staging to a batch with this series
>> applied without a cleaning the tree. It also happens the other way
>> around as well.
>>
>> Removing entry.o or asm-offsets.h before building doesn't help. Any
>> other idea?
> 
> No, I'd need to know how exactly to repro and then try to debug.

I have tried to remove all the *.o and still the same issues. So it may 
be something related to the generation of the headers.

This is not related to this series, so I am not going to spend more time 
on this bug today. The way I reproduced it was to use [1] as .config (it 
is a random config from gitlab) and then switched between
staging (2b4b33ffe7d6 "libs/foreignmemory: Implement on NetBSD" at the 
time of the writing) and the branch ioreq/ioreq_4.14_ml6 from [2].

Just in case it matters this on Ubuntu 18.04.5 with GCC 7.5.0.

Cheers,

[1] https://pastebin.com/S6ELa493
[2] https://github.com/otyshchenko1/xen.git

-- 
Julien Grall

