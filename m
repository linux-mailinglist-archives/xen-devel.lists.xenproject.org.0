Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF8A4C0FA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 13:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900239.1308158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp5Ee-0002Ko-CQ; Mon, 03 Mar 2025 12:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900239.1308158; Mon, 03 Mar 2025 12:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp5Ee-0002JJ-9r; Mon, 03 Mar 2025 12:49:28 +0000
Received: by outflank-mailman (input) for mailman id 900239;
 Mon, 03 Mar 2025 12:49:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnrA=VW=gaisler.com=andreas@srs-se1.protection.inumbo.net>)
 id 1tp5Ed-0002JD-4E
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 12:49:27 +0000
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efdd03ba-f82d-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 13:49:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4Z5zCn0L6Nz1FbbL;
 Mon,  3 Mar 2025 13:49:25 +0100 (CET)
Received: from [10.10.15.10] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4Z5zCm2wxFz1FbZs;
 Mon,  3 Mar 2025 13:49:24 +0100 (CET)
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
X-Inumbo-ID: efdd03ba-f82d-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1741006164;
	bh=uVrbTI227oB4DG3Xp0tOkuWBdxLi0PVMRa8nC6AqCqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nP9dd9JW/wd7xfGVmIclsUAW7Lk6Vl6kAIG/wni38v7deAa6waS1Ayjqwmql3o84n
	 DZdS63CtpqFoNU3dj2tHF2SuUw3KIn/WTjJVIXHYffz8D4NJUG2Hd1Uk8YLjjoYulN
	 RX9/cvuf0Gb2o/aPBXh4plpcFNu8CtVnLb9vpzg4=
Message-ID: <8367749d-8dd7-40f5-881e-8f45e432a91d@gaisler.com>
Date: Mon, 3 Mar 2025 13:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix lazy mmu docs and usage
To: David Hildenbrand <david@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Juergen Gross <jgross@suse.com>,
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
 <1ff509c7-187b-4e43-b266-db8ada33b9a2@arm.com>
 <34388e5d-f9d1-4d29-a0e0-202a9fad345f@redhat.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <34388e5d-f9d1-4d29-a0e0-202a9fad345f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-03-03 11:30, David Hildenbrand wrote:
> On 03.03.25 11:22, Ryan Roberts wrote:[snip]
>>
>> I didn't actually cc stable on these, I'm wondering if I should do that? Perhaps
>> for all patches except the pagemap change?
> 
> That would make sense to me. CC stable likely doesn't hurt here. (although I wonder if anybody cares about stable on sparc :))

Yes, stable is important for sparc just as well as for other architectures.

Cheers,
Andreas

