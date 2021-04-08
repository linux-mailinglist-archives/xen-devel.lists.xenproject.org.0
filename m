Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3E358676
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 16:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107364.205254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVOs-0008KX-7j; Thu, 08 Apr 2021 14:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107364.205254; Thu, 08 Apr 2021 14:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVOs-0008K8-4Q; Thu, 08 Apr 2021 14:12:50 +0000
Received: by outflank-mailman (input) for mailman id 107364;
 Thu, 08 Apr 2021 14:12:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUVOr-0008K3-MI
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 14:12:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dab48eb7-7b5b-4b6b-a8fa-11f133a1b708;
 Thu, 08 Apr 2021 14:12:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A38BCB032;
 Thu,  8 Apr 2021 14:12:47 +0000 (UTC)
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
X-Inumbo-ID: dab48eb7-7b5b-4b6b-a8fa-11f133a1b708
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617891167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7aY8XBU2I/xhPL/+cky9pI9nmJtbbXW1juxdmt5fDgQ=;
	b=dD7jJEJBH6S/5bCD6T4vfcSQLxqil7WO5gG8vrGBdkciiAAjLhzNiDyty1nc+/dhfrvBp5
	qeoUqfa5dWj9qBw3fYjfmcU5OKzurd8XDlCSbLt9qfws30+d9DWyijtTs0drKX2Zhp5AhQ
	9ZSR8Pl3fXF6eEJy8PXjEwbHBWCAJAE=
Subject: Re: [PATCH 00/11] assorted replacement of x[mz]alloc_bytes()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <bdb17131-2184-d8b8-a1a2-37525af02807@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c9177fa-9909-b693-e4ee-efdfcfa51273@suse.com>
Date: Thu, 8 Apr 2021 16:12:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bdb17131-2184-d8b8-a1a2-37525af02807@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.04.2021 14:57, Andrew Cooper wrote:
> On 08/04/2021 13:13, Jan Beulich wrote:
>> In the long run I think we want to do away with these type-unsafe
>> interfaces, the more that they also request (typically) excess
>> alignment. This series of entirely independent patches is
>> eliminating the instances where it's relatively clear that they're
>> not just "blob" allocations.
>>
>>
>> 03: x86/MCE: avoid effectively open-coding xmalloc_array()
>> 04: x86/HVM: avoid effectively open-coding xmalloc_array()
>> 05: x86/oprofile: avoid effectively open-coding xmalloc_array()
>> 06: x86/IRQ: avoid over-alignment in alloc_pirq_struct()
>> 07: EFI/runtime: avoid effectively open-coding xmalloc_array()
>> 08: hypfs: avoid effectively open-coding xzalloc_array()
>> 10: video/lfb: avoid effectively open-coding xzalloc_array()
> 
> The flex conversions are fine, but I am unconvinced by argument for
> interchanging array() and bytes().
> 
> The cacheline size is 64 bytes, and the minimum allocation size is 16,
> plus a bhdr overhead of 32 bytes, so you're already at most of a
> cacheline for a nominally-zero sized allocation.

But you're aware that the alignment x[mz]alloc_bytes() forces is
128 bytes? Plus, while sizeof(struct bhdr) is indeed 32, the
overhead on allocated blocks is

#define BHDR_OVERHEAD   (sizeof(struct bhdr) - MIN_BLOCK_SIZE)

i.e. 16 (i.e. the other half of the 32 is already the minimum
block size of 16 that you also mention). IOW a cacheline sized
block would yield 48 bytes of usable space. Specifically a
meaningful change in the PV case from what patch 06 does, where
we only need 40 bytes.

> There can however be a severe penalty from cacheline sharing, which is
> why the bytes() form does have a minimum alignment.  There is one
> xmalloc heap shared across the entire system, so you've got no idea what
> might be sharing the same cache line for sub-line allocations.

This would call for distinguishing short-lived allocations (and
ones to be used mainly from a single CPU) from long-lived ones
having system wide use. I.e. a request to gain further allocation
function flavors, when already the introduction of the one new
xv[mz]alloc() has caused long-winded discussions with (so far) no
real outcome.

> We should not support sub-line allocations IMO.  The savings is a
> handful of bytes at best, and some horrible performance cliffs to
> avoid.  People running virtualisation are not going to be ram
> constrained to the order of a few bytes.
> 
> For small allocations which don't require specific alignment, then
> putting bhdr and the allocation in the same line is fine (if we don't do
> this already), but we shouldn't be in the position of having two bhdr's
> in the same cache line, even if there are plenty of single-byte
> allocations in the theoretical worst case.

That's a request to tweak allocator internals then, not an argument
against the conversions done here.

Jan

