Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9F5CA37E6
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 12:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177590.1501838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR7tv-0000f0-2s; Thu, 04 Dec 2025 11:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177590.1501838; Thu, 04 Dec 2025 11:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR7tv-0000cu-0A; Thu, 04 Dec 2025 11:53:35 +0000
Received: by outflank-mailman (input) for mailman id 1177590;
 Thu, 04 Dec 2025 11:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8NnK=6K=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vR7tt-0000cV-Ol
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 11:53:33 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db18c376-d107-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 12:53:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35ECD601E6;
 Thu,  4 Dec 2025 11:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8423DC4CEFB;
 Thu,  4 Dec 2025 11:53:20 +0000 (UTC)
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
X-Inumbo-ID: db18c376-d107-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764849210;
	bh=Zpl414Y6vefFz+0mGA9CipSOvbTehPYA0WM0ZAZ5yEc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8F43iGu2V8NDUl3DIh/2+X2bfiJU3z4ZM3VULx8KpRVQtoH+xW7CH2tkww5ZTCxo
	 Z732odFWqfzHNQy5SzNM5XixZWclVhNfUhvGgJiGbPutM3AwRHmsLfNCAboCSPDTP/
	 mQ1qAy91zph5RvCXiIten7mneAop/GvZWqVrT+sRJH1n488UuXQMywvv0E8xZPYpO8
	 hem4mPeZ8WDhirZ3INCR8Hs8TJNiMUf1+2/EkXzuyFkWiHk2/yA/ki9bTau+qinvtl
	 uLvGed0JMtDUZ3H/ydu3YrDfOdvy/uR+aG5ySHHt6+QmCrIk7eopnc2uqCD/LCtR4b
	 NGvDZU/gQZlqA==
Message-ID: <0f08e893-6097-4ab1-8231-ac3304c51ee9@kernel.org>
Date: Thu, 4 Dec 2025 12:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <23dcf752-0b75-45a7-84f8-25bddf97af08-agordeev@linux.ibm.com>
 <703cbee6-a813-4970-9232-34ee91ed8961@arm.com>
 <2c2b3382-7bdb-41a9-b48e-4fa9a44312ba@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <2c2b3382-7bdb-41a9-b48e-4fa9a44312ba@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/25 06:25, Anshuman Khandual wrote:
> 
> 
> On 03/12/25 1:50 PM, Kevin Brodsky wrote:
>> On 28/11/2025 14:55, Alexander Gordeev wrote:
>>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>>> + * currently enabled.
>>> The in_lazy_mmu_mode() name looks ambiguous to me. When the lazy MMU mode
>>> is paused are we still in lazy MMU mode? The __task_lazy_mmu_mode_active()
>>> implementation suggests we are not, while one could still assume we are,
>>> just paused.
>>>
>>> Should in_lazy_mmu_mode() be named e.g. as in_active_lazy_mmu_mode() such
>>> a confusion would not occur in the first place.
>>
>> I see your point, how about is_lazy_mmu_mode_active()?
> 
> Agreed - is_lazy_mmu_mode_active() seems better.

+1, I was scratching my head over this in previous revisions as well.

-- 
Cheers

David

