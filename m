Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4719C0E0F8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 14:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151608.1482123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDNLF-00055n-Vz; Mon, 27 Oct 2025 13:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151608.1482123; Mon, 27 Oct 2025 13:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDNLF-00053d-TN; Mon, 27 Oct 2025 13:32:57 +0000
Received: by outflank-mailman (input) for mailman id 1151608;
 Mon, 27 Oct 2025 13:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KmjG=5E=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vDNLE-00053X-8N
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 13:32:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 709152d2-b339-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 14:32:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A07175D;
 Mon, 27 Oct 2025 06:32:44 -0700 (PDT)
Received: from [10.57.68.196] (unknown [10.57.68.196])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5AF3F673;
 Mon, 27 Oct 2025 06:32:45 -0700 (PDT)
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
X-Inumbo-ID: 709152d2-b339-11f0-9d16-b5c5bf9af7f9
Message-ID: <2be0732d-d8fb-424d-bc4e-443cc49d0092@arm.com>
Date: Mon, 27 Oct 2025 14:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Hildenbrand <david@redhat.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <3ff4aaeb-61ce-4b72-ba90-1b66374b1b95@gmail.com>
 <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2025 13:29, David Hildenbrand wrote:
> On 25.10.25 00:52, Demi Marie Obenour wrote:
>> On 10/24/25 10:51, David Hildenbrand wrote:
>>> On 24.10.25 16:47, David Woodhouse wrote:
>>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>>> again.
>>>>>>
>>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>>> state when switching to the new task, instead of using a separate
>>>>>> TIF flag.
>>>>>>
>>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>>> folks.
>>>>
>>>>
>>>> I know tglx has shouted at me in the past for precisely this reminder,
>>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>>> to actually run Xen? Has this been boot tested?
>>>
>>> And after that, boot-testing sparc as well? :D
>>>
>>> If it's easy, why not. But other people should not suffer for all the
>>> XEN hacks we keep dragging along.
>>
>> Which hacks?  Serious question.  Is this just for Xen PV or is HVM
>> also affected?
>
> In the context of this series, XEN_LAZY_MMU.

FWIW in that particular case it's relatively easy to tell this is
specific to Xen PV (this is only used in mmu_pv.c and enlighten_pv.c).
Knowing what to test is certainly not obvious in general, though.

- Kevin

>
> Your question regarding PV/HVM emphasizes my point: how is a submitter
> supposed to know which XEN combinations to test (and how to test
> them), to not confidentially break something here.
>
> We really need guidance+help from the XEN folks here.

