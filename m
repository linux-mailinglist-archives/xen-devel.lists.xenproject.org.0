Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0134529B20F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 15:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12938.33412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXQ6H-0007UQ-TF; Tue, 27 Oct 2020 14:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12938.33412; Tue, 27 Oct 2020 14:37:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXQ6H-0007U1-PZ; Tue, 27 Oct 2020 14:37:25 +0000
Received: by outflank-mailman (input) for mailman id 12938;
 Tue, 27 Oct 2020 14:37:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXQ6G-0007Tw-KI
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:37:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 554116c3-c0a9-4381-b52a-0701f32b06b0;
 Tue, 27 Oct 2020 14:37:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB272AC1F;
 Tue, 27 Oct 2020 14:37:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXQ6G-0007Tw-KI
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:37:24 +0000
X-Inumbo-ID: 554116c3-c0a9-4381-b52a-0701f32b06b0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 554116c3-c0a9-4381-b52a-0701f32b06b0;
	Tue, 27 Oct 2020 14:37:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603809442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+HPVp15S5DBifX1LYbjZZIZkMe4aOpuXoimUh/hw5U=;
	b=Wqf/uOzHGVLsxVxZ6eiYeC7xhGGT3VzxCTb6rYNxtXpIQsKCssCGk2oLUYr/n07yBRuM+f
	JFid8LVutUaLcJvVO+HT7Bml89gvC7xczhNsJRQIc3vrqeW4jBep0MBdLilsMAJHbhDRz0
	/sIOjUj5g6m6NnDbnE695P/hmZwqJn8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AB272AC1F;
	Tue, 27 Oct 2020 14:37:22 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86/pv: Drop FLUSH_TLB_GLOBAL in do_mmu_update()
 for XPTI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201027141037.27357-1-andrew.cooper3@citrix.com>
 <20201027141037.27357-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <589e9ed8-3b54-4225-1740-c5b0e3e667c7@suse.com>
Date: Tue, 27 Oct 2020 15:37:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027141037.27357-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.10.2020 15:10, Andrew Cooper wrote:
> c/s 9d1d31ad9498 "x86: slightly reduce Meltdown band-aid overhead" removed the
> use of Global TLB flushes on the Xen entry path, but added a FLUSH_TLB_GLOBAL
> to the L4 path in do_mmu_update().
> 
> However, this was unnecessary.
> 
> The L4 resync will pick up any new mappings created by the L4 change.  Any
> changes to existing mappings are the guests responsibility to flush, and if
> one is needed, an MMUEXT_OP hypercall will follow.
> 
> This is (not really) XSA-286 (but necessary to simplify the logic).
> 
> Fixes: 9d1d31ad9498 ("x86: slightly reduce Meltdown band-aid overhead")

While - with yet another round of consideration - I agree, I
would have thought justifying the correctness of the change
by d543fa409358 ("xen/x86: disable global pages for domains with
XPTI active") would have been easier. Perhaps at least worth
mentioning?

I agree that this reasoning is necessary to warrant the Fixes:
tag, and hence to indicate backporting of this change is going
to be fine all the way through to (the backports of) this
commit.

The primary complication with the justification you use is with
the commit you refer to saying "so that inside Xen we'll also
pick up such changes" in its description. I assume your reasoning
wrt this is that any hypercall started on another vCPU before
the mmu-update here completes can't rely on Xen observing the
new entries, which is what I believe I viewed differently at the
time. Whereas any one started after the sync/flush will obviously
observe the new entries (because of the very sync). My main
problem with this reasoning has been that it "feels" as if there
might be a way by which a guest could arrange a hypercall which
ought to observe the new entries but, because of the sync
happening only on the exit paths, doesn't. Quite likely such
"arranging", if possible at all, would need to be called "out of
spec".

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

