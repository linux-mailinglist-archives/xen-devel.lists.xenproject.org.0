Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB6035F18D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110473.210863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcuf-0001TV-MH; Wed, 14 Apr 2021 10:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110473.210863; Wed, 14 Apr 2021 10:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcuf-0001T6-J2; Wed, 14 Apr 2021 10:38:25 +0000
Received: by outflank-mailman (input) for mailman id 110473;
 Wed, 14 Apr 2021 10:38:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWcud-0001T1-UY
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:38:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8609fa15-f795-4dd0-a19b-f4c8549d3359;
 Wed, 14 Apr 2021 10:38:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62319AF75;
 Wed, 14 Apr 2021 10:38:21 +0000 (UTC)
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
X-Inumbo-ID: 8609fa15-f795-4dd0-a19b-f4c8549d3359
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618396701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mA4cvtp3ufmPQahQmwh9ZIHo4AajDsdr42Vr+LMZkVo=;
	b=b2GMgxpJbVgAni2cwCfkVuY6Tpe6Vl0DEjaAfQ8QaslttOdDCctoN23RQ+Lh1gluGL3m1d
	cWheOj1JeDU/jb14kV+1vlSlGkciivd7t+G3FnSx7ZaTVFYPgu+8vLSJCVJMlaizKamGSP
	o0Xj4FcB6zzB36g1SqnRCFzdaABgmBs=
Subject: Re: [PATCH v3 10/11] x86/vpt: remove vPT timers per-vCPU lists
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-11-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d80d406-6275-3de4-8734-a0204151a34c@suse.com>
Date: Wed, 14 Apr 2021 12:38:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-11-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 12:33, Roger Pau Monne wrote:
> No longer add vPT timers to lists on specific vCPUs, since there's no
> need anymore to check if timer interrupts have been injected on return
> to HVM guest.
> 
> Such change allows to get rid of virtual timers vCPU migration, and
> also cleanup some of the virtual timers fields that are no longer
> required.
> 
> The model is also slightly different now in that timers are not
> stopped when a vCPU is de-scheduled. Such timers will continue
> running, and when triggered the function will try to inject the
> corresponding interrupt to the guest (which might be different than
> the currently running one). Note that the timer triggering when the
> guest is no longer running can only happen once, as the timer callback
> will not reset the interrupt to fire again. Such resetting if required
> will be done by the EOI callback.
> 
> Since virtual timers are no longer added to per-VCPU lists when active
> a new 'masked' field is added to the structure, to signal whether a
> timer has it's interrupt source currently masked.

I guess this paragraph has become stale with ...

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Remove pt_{save/restore}_timer and instead use
>    pt_{freeze/thaw}_time.
>  - Remove the introduction of the 'masked' field, it's not needed.

... this change?

Other than this
Reviewed-by: Jan Beulich <jbeulich@suse.com>

>  - Rework pt_active to use timer_is_active.
> 
> Changes since v1:
>  - New in this version.
> ---
>  xen/arch/x86/domain.c          |   4 +-
>  xen/arch/x86/hvm/hvm.c         |   4 +-
>  xen/arch/x86/hvm/vlapic.c      |   1 -
>  xen/arch/x86/hvm/vpt.c         | 174 ++++-----------------------------
>  xen/include/asm-x86/hvm/vcpu.h |   3 +-
>  xen/include/asm-x86/hvm/vpt.h  |  12 +--
>  6 files changed, 27 insertions(+), 171 deletions(-)

Yet nicer than the previous one!

Jan

