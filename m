Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A09A4E39E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 16:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901247.1309222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpUJi-0007Lj-Ow; Tue, 04 Mar 2025 15:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901247.1309222; Tue, 04 Mar 2025 15:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpUJi-0007JK-Ln; Tue, 04 Mar 2025 15:36:22 +0000
Received: by outflank-mailman (input) for mailman id 901247;
 Tue, 04 Mar 2025 15:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvO=VX=cc.itu.edu.tr=root@srs-se1.protection.inumbo.net>)
 id 1tpUJh-0007DG-3m
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 15:36:21 +0000
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a85bd8e-f90e-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 16:36:19 +0100 (CET)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 59E7040D5713
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 18:36:17 +0300 (+03)
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fr86bJ9zG0jb
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 18:34:48 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 6C4CF42745; Tue,  4 Mar 2025 18:34:39 +0300 (+03)
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id 7EEDD42FF3
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:23:09 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw1.itu.edu.tr (Postfix) with SMTP id 161E03064C0B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:23:08 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id C126C3A6421
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1941F1931;
 Mon,  3 Mar 2025 10:22:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB7E1EDA04;
 Mon,  3 Mar 2025 10:22:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F08EC12FC;
 Mon,  3 Mar 2025 02:22:23 -0800 (PST)
Received: from [10.1.26.155] (XHFQ2J9959.cambridge.arm.com [10.1.26.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EC963F66E;
 Mon,  3 Mar 2025 02:22:07 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6a85bd8e-f90e-11ef-9ab4-95dc52dad729
X-Envelope-From: <root@cc.itu.edu.tr>
X-Envelope-From: <linux-kernel+bounces-541357-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997332; cv=none; b=K5b2jorN+bj5hFZjPHV5rThRYSqjvKWh/fq6NFbhu2M5KUG3stpALASTx6gBNpSNFENWtQireD+DcionEemvb2afRNdQhLb1/6GT+PWsr8sj7wGJpWqYFzXIqlOhypEou9oVt2+4Fg6xeTT9upERWnyxdruW6A6BIwO/s/Dww3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997332; c=relaxed/simple;
	bh=7be/Msm+H+RtUT38wFcu4DC963JAinemIQkyzCmXDwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HD7eenxiEj1fvokvELJRnZgKKTrdjTC4V7eIm41p29AQC5ytivKjaSmK+EOWRaH24pqwyYxnuY5djU6bdMzMWMJ+3mHtxlLODC0x9Cuv0tbU6laTQETcP5LFG/adBHFHECkRYZPd2SDbo3OivYegV1V7GfKAHjtCXVr8RwWG4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Message-ID: <1ff509c7-187b-4e43-b266-db8ada33b9a2@arm.com>
Date: Mon, 3 Mar 2025 10:22:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix lazy mmu docs and usage
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250302145555.3236789-1-ryan.roberts@arm.com>
 <20250302145555.3236789-2-ryan.roberts@arm.com>
 <5418a661-dbd0-46e9-8ef7-b1c5a34acce3@redhat.com>
 <a9e21c14-d390-4119-ad93-b23e6ccbac15@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a9e21c14-d390-4119-ad93-b23e6ccbac15@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fr86bJ9zG0jb
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741707298.43111@H6OMrom8IxAEYKsJnCs2hw
X-ITU-MailScanner-SpamCheck: not spam

On 03/03/2025 08:52, David Hildenbrand wrote:
> On 03.03.25 09:49, David Hildenbrand wrote:
>> On 02.03.25 15:55, Ryan Roberts wrote:
>>> The docs, implementations and use of arch_[enter|leave]_lazy_mmu_mode()
>>> is a bit of a mess (to put it politely). There are a number of issues
>>> related to nesting of lazy mmu regions and confusion over whether the
>>> task, when in a lazy mmu region, is preemptible or not. Fix all the
>>> issues relating to the core-mm. Follow up commits will fix the
>>> arch-specific implementations. 3 arches implement lazy mmu; powerpc,
>>> sparc and x86.
>>>
>>> When arch_[enter|leave]_lazy_mmu_mode() was first introduced by commit
>>> 6606c3e0da53 ("[PATCH] paravirt: lazy mmu mode hooks.patch"), it was
>>> expected that lazy mmu regions would never nest and that the appropriate
>>> page table lock(s) would be held while in the region, thus ensuring the
>>> region is non-preemptible. Additionally lazy mmu regions were only used
>>> during manipulation of user mappings.
>>>
>>> Commit 38e0edb15bd0 ("mm/apply_to_range: call pte function with lazy
>>> updates") started invoking the lazy mmu mode in apply_to_pte_range(),
>>> which is used for both user and kernel mappings. For kernel mappings the
>>> region is no longer protected by any lock so there is no longer any
>>> guarantee about non-preemptibility. Additionally, for RT configs, the
>>> holding the PTL only implies no CPU migration, it doesn't prevent
>>> preemption.
>>>
>>> Commit bcc6cc832573 ("mm: add default definition of set_ptes()") added
>>> arch_[enter|leave]_lazy_mmu_mode() to the default implementation of
>>> set_ptes(), used by x86. So after this commit, lazy mmu regions can be
>>> nested. Additionally commit 1a10a44dfc1d ("sparc64: implement the new
>>> page table range API") and commit 9fee28baa601 ("powerpc: implement the
>>> new page table range API") did the same for the sparc and powerpc
>>> set_ptes() overrides.
>>>
>>> powerpc couldn't deal with preemption so avoids it in commit
>>> b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu mode"),
>>> which explicitly disables preemption for the whole region in its
>>> implementation. x86 can support preemption (or at least it could until
>>> it tried to add support nesting; more on this below). Sparc looks to be
>>> totally broken in the face of preemption, as far as I can tell.
>>>
>>> powewrpc can't deal with nesting, so avoids it in commit 47b8def9358c
>>> ("powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes"),
>>> which removes the lazy mmu calls from its implementation of set_ptes().
>>> x86 attempted to support nesting in commit 49147beb0ccb ("x86/xen: allow
>>> nesting of same lazy mode") but as far as I can tell, this breaks its
>>> support for preemption.
>>>
>>> In short, it's all a mess; the semantics for
>>> arch_[enter|leave]_lazy_mmu_mode() are not clearly defined and as a
>>> result the implementations all have different expectations, sticking
>>> plasters and bugs.
>>>
>>> arm64 is aiming to start using these hooks, so let's clean everything up
>>> before adding an arm64 implementation. Update the documentation to state
>>> that lazy mmu regions can never be nested, must not be called in
>>> interrupt context and preemption may or may not be enabled for the
>>> duration of the region.
>>>
>>> Additionally, update the way arch_[enter|leave]_lazy_mmu_mode() is
>>> called in pagemap_scan_pmd_entry() to follow the normal pattern of
>>> holding the ptl for user space mappings. As a result the scope is
>>> reduced to only the pte table, but that's where most of the performance
>>> win is. While I believe there wasn't technically a bug here, the
>>> original scope made it easier to accidentally nest or, worse,
>>> accidentally call something like kmap() which would expect an immediate
>>> mode pte modification but it would end up deferred.
>>>
>>> arch-specific fixes to conform to the new spec will proceed this one.
>>>
>>> These issues were spotted by code review and I have no evidence of
>>> issues being reported in the wild.
>>>
>>
>> All looking good to me!
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>>
> 
> ... but I do wonder if the set_ptes change should be split from the pagemap change.

So set_ptes + docs changes in one patch, and pagemap change in another? I can do
that.

I didn't actually cc stable on these, I'm wondering if I should do that? Perhaps
for all patches except the pagemap change?

Thanks for the quick review!


