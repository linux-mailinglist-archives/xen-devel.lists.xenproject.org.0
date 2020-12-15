Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300A2DB47E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 20:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54789.95356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpG2g-0002Qz-6U; Tue, 15 Dec 2020 19:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54789.95356; Tue, 15 Dec 2020 19:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpG2g-0002Qa-2x; Tue, 15 Dec 2020 19:31:26 +0000
Received: by outflank-mailman (input) for mailman id 54789;
 Tue, 15 Dec 2020 19:31:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpG2e-0002QV-NC
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 19:31:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpG2d-00066z-J6; Tue, 15 Dec 2020 19:31:23 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpG2d-0006Hh-B8; Tue, 15 Dec 2020 19:31:23 +0000
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
	bh=sW1I+YEDrMePCyLq/HFc207N4WzhJW7c49godHdP1UE=; b=CLGNByGtonUId8vtf+wG7PqSe1
	kMjq1yDpk8r+UvmOwEuO1lCDvrhXmpDRYgdfzNxtQC34aYbzNG7bCmoZv+/59hTfMC7bTsnYBA6Tk
	Us59p2QLqO2NvApBQ9YRVCJrGVNNQbg9nvQw5mTvxJDmoNwjW1nMy066qBHt3gVJvFco=;
Subject: Re: [RFC PATCH v2 00/15] xen/arm: port Linux LL/SC and LSE atomics
 helpers to Xen.
To: Ash Wilding <ash.j.wilding@gmail.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, rahul.singh@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cb0f7055-6d9a-5c39-6198-109593fd3424@xen.org>
Date: Tue, 15 Dec 2020 19:31:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/11/2020 21:51, Ash Wilding wrote:
> From: Ash Wilding <ash.j.wilding@gmail.com>
> 
> 
> Hey,

Hi Ash,

> 
> I've found some time to improve this series a bit:
> 
> 
> Changes since RFC v1
> ====================
> 
>   - Broken up patches into smaller chunks to aid in readability.
> 
>   - As per Julien's feedback I've also introduced intermediary patches
>     that first remove Xen's existing headers, then pull in the current
>     Linux versions as-is. This means we only need to review the changes
>     made while porting to Xen, rather than reviewing the existing Linux
>     code.
> 
>   - Pull in Linux's <asm-generic/rwonce.h> as <xen/rwonce.h> for
>     __READ_ONCE()/__WRITE_ONCE() instead of putting these in Xen's
>     <xen/compiler.h>. While doing this, provide justification for
>     dropping Linux's <linux/compiler_types.h> and relaxing the
>     __READ_ONCE() usage of __unqual_scalar_typeof() to just typeof()
>     (see patches #5 and #6).
> 
> 
> 
> Keeping the rest of the cover-letter unchanged as it would still be
> good to discuss these things:
> 
> 
> Arguments in favour of doing this
> =================================
> 
>      - Lets SMMUv3 driver switch to using <asm/atomic.h> rather than
>        maintaining its own implementation of the helpers.
> 
>      - Provides mitigation against XSA-295 [2], which affects both arm32
>        and arm64, across all versions of Xen, and may allow a domU to
>        maliciously or erroneously DoS the hypervisor.
> 
>      - All Armv8-A core implementations since ~2017 implement LSE so
>        there is an argument to be made we are long overdue support in
>        Xen. This is compounded by LSE atomics being more performant than
>        LL/SC atomics in most real-world applications, especially at high
>        core counts.
> 
>      - We may be able to get improved performance when using LL/SC too
>        as Linux provides helpers with relaxed ordering requirements which
>        are currently not available in Xen, though for this we would need
>        to go back through existing code to see where the more relaxed
>        versions can be safely used.
> 
>      - Anything else?
> 
> 
> Arguments against doing this
> ============================
> 
>      - Limited testing infrastructure in place to ensure use of new
>        atomics helpers does not introduce new bugs and regressions. This
>        is a particularly strong argument given how difficult it can be to
>        identify and debug malfunctioning atomics. The old adage applies,
>        "If it ain't broke, don't fix it."

I am not too concerned about the Linux atomics implementation. They are 
well tested and your changes doesn't seem to touch the implementation 
itself.

However, I vaguely remember that some of the atomics helper in Xen are 
somewhat much stronger than the Linux counterpart.

Would you be able to look at all the existing helpers and see whether 
the memory ordering diverge?

Once we have a list we could decide whether we want to make them 
stronger again or check the callers.

Cheers,

-- 
Julien Grall

