Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B1C52944
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 14:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159933.1488193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBMH-0005v0-5Q; Wed, 12 Nov 2025 13:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159933.1488193; Wed, 12 Nov 2025 13:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBMH-0005tY-2k; Wed, 12 Nov 2025 13:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1159933;
 Wed, 12 Nov 2025 13:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HsTr=5U=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vJBMG-0005tI-Ai
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 13:58:00 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d44a76-bfcf-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 14:57:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6148D60213;
 Wed, 12 Nov 2025 13:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29847C2BCB4;
 Wed, 12 Nov 2025 13:57:34 +0000 (UTC)
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
X-Inumbo-ID: 94d44a76-bfcf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762955871;
	bh=wyYh5JA+N7mRZY7BRonX9hRu7lWf6kG2xADXz4mWKHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uDdn5b0TMd79Lh5gGh2J4WjGYOU7mL3bVuBbQ/VXgzY4nMQRUASwOOOn1wPdm3Cym
	 W4XE28wEzp5MfEzdP2hqphehcMkmvAS/b8w6wcpUiLZxYE0rCMGLEp+rVCdW9qI4ba
	 ocobM87q4/c0/j7wdbVyzm/yrXe8KetWir7vwxyUiRXtVNS/+8DnZ7OaB4HqMTf7u6
	 36VSYtBbbyHuGEXAGGvXe/GFkuJFAWR+xBF55ycy4xXYzkSJweCr6O/7vY6qeuk4iJ
	 2JAYXvNk5KDLXblAvdwOWYLaBc3JfMXId6w7fnEaMQeOyF/yR5GPTl+Yi8z7SCHe3i
	 /nZPR2FUDupLg==
Message-ID: <ba3cf0c1-174e-4e86-b464-7c5c15a803d8@kernel.org>
Date: Wed, 12 Nov 2025 14:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <999feffa-5d1d-42e3-bd3a-d949f2a9de9d@arm.com>
 <cc9dc398-b9c5-4bb8-94ad-7e7f3ddd5b4f@arm.com>
 <824bf705-e9d6-4eeb-9532-9059fa56427f@arm.com>
 <58fd1a6e-f2c4-421c-9b95-dea4b244a515@arm.com>
 <8f70692c-25a9-4bd0-94ab-43ab435e4b1b@arm.com>
 <cdb4b97a-415b-4dba-877b-0cd570381a6d@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <cdb4b97a-415b-4dba-877b-0cd570381a6d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>
>>> I don't really mind either way, but I don't see an immediate use for [C]
>>> and [D] - the idea is that the paused section is short and controlled,
>>> not made up of arbitrary calls.
>> If my thinking above is correct, then I've already demonstrated that this is not
>> the case. So I'd be inclined to go with [D] on the basis that it is the most robust.
>>
>> Keeping 2 nesting counts (enable and pause) feels pretty elegant to me and gives
>> the fewest opportunities for surprises.
> 
> Agreed, if we're going to allow enable() within a paused section, then
> we might as well allow paused sections to nest too. The use-case is
> clear, so I'm happy to go ahead and make those changes.
> 
> David, any thoughts?

I don't mind allowing nesting of pause(), so works for me.

-- 
Cheers

David

