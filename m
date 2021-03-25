Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CD348A8E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 08:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101274.193575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKll-0005tK-Sg; Thu, 25 Mar 2021 07:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101274.193575; Thu, 25 Mar 2021 07:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKll-0005sv-PY; Thu, 25 Mar 2021 07:51:05 +0000
Received: by outflank-mailman (input) for mailman id 101274;
 Thu, 25 Mar 2021 07:51:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPKlj-0005sq-Ik
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 07:51:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d09c0c32-380b-44a5-baaa-0671901446f7;
 Thu, 25 Mar 2021 07:51:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0222EAC16;
 Thu, 25 Mar 2021 07:51:02 +0000 (UTC)
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
X-Inumbo-ID: d09c0c32-380b-44a5-baaa-0671901446f7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616658662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3ccTgEi4762s9akChpgpLLqdglpoV9FLFLxDEtzaTY=;
	b=lfIbGZwLkVJX/qtLmJIXhDfflrVQZ47j7adwSa/OgM32Y5I3k0eZ11Z4lB+jlGELlvI5t/
	yT6vn9D+pE809fx5NHJLLy46jnvthOh+w/R4nIPyxGl72APCRpG3ZqcP0F9+mVa1QczA2X
	VUIFLkrm1XntloPbSz7oAMNJfye2n9c=
Subject: Re: [PATCH][4.15] Performance regression due to XSA-336
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 stephen.s.brennan@oracle.com, xen-devel@lists.xenproject.org
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3657f74-5b62-fe59-3bbf-41df5fbe4593@suse.com>
Date: Thu, 25 Mar 2021 08:51:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 22:05, Boris Ostrovsky wrote:
> 
> (Re-sending with Stephen added)
> 
> 
> While running performance tests with recent XSAs backports to our product we've
> discovered significant regression in TPCC performance. With a particular guest
> kernel the numbers dropped by as much as 40%.

While the change is more intrusive than one would like at this point, an
up-to-40% regression imo makes this at least a change to be considered
for 4.15. I will admit though that before next week I won't get around
to look at this in any more detail than just having read through this
cover letter. But perhaps someone else might find time earlier.

> We've narrowed that down to XSA-336 patch, specifically to the pt_migrate rwlock,
> and even more specifically to this lock being taken in pt_update_irq().
> 
> We have quite a large guest (92 VCPUs) doing lots of VMEXITs and the theory is
> that lock's cnts atomic is starting to cause lots of coherence traffic. As a
> quick test of this replacing pt_vcpu_lock() in pt_update_irq() with just
> spin_lock(&v->arch.hvm_vcpu.tm_lock) gets us almost all performance back.
> 
> Stephen Brennan came up with new locking algorithm, I just coded it up.
> 
> A couple of notes:
> 
> * We have only observed the problem and tested this patch for performance on
>   a fairly old Xen version. However, vpt code is almost identical and I expect
>   upstream to suffer from the same issue.
> 
> * Stephen provided the following (slightly edited by me) writeup explaining the
>   locking algorithm. I would like to include it somewhere but not sure what the
>   right place would be. Commit message perhaps?

If nowhere else, then definitely in the commit message. But perhaps it
could (also) sit in some form right ahead of pt_lock() / pt_unlock()?

Jan

