Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D46321A4A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88117.165572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECAd-0001no-3t; Mon, 22 Feb 2021 14:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88117.165572; Mon, 22 Feb 2021 14:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lECAd-0001nP-0x; Mon, 22 Feb 2021 14:26:43 +0000
Received: by outflank-mailman (input) for mailman id 88117;
 Mon, 22 Feb 2021 14:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lECAb-0001nK-Tp
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:26:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b337e91c-c9f5-4eef-b7aa-41368687a4fd;
 Mon, 22 Feb 2021 14:26:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35528ADD6;
 Mon, 22 Feb 2021 14:26:40 +0000 (UTC)
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
X-Inumbo-ID: b337e91c-c9f5-4eef-b7aa-41368687a4fd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614004000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRGBB4KGzgS4JNFjfofwW8YfWFRgIdjPGdABGwpvCpo=;
	b=WdXP63MUu+D82OBrObimk3fbF0Lrln71mD1WP2arojFg06Bj+MvxQScwA/hf73q41hXFLs
	tj55nFCd9SVbC1yfkSqMzu2N9KUjEOoRsgsgoUL40S0ickz7VFlbaxZ6E1VPOyyttLE7SE
	1LOcahD7r7FVG/p4BrQ3Jz0b8oMR4p8=
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in
 vcpu_block()
To: Julien Grall <julien@xen.org>
Cc: iwj@xenproject.org, sstabellini@kernel.org, ash.j.wilding@gmail.com,
 Julien Grall <jgrall@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20210220194701.24202-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <744ca7e5-328d-0c5f-bc52-e4c0e78dad97@suse.com>
Date: Mon, 22 Feb 2021 15:26:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210220194701.24202-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.02.2021 20:47, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The comment in vcpu_block() states that the events should be checked
> /after/ blocking to avoids wakeup waiting race. However, from a generic
> perspective, set_bit() doesn't prevent re-ordering. So the following
> could happen:
> 
> CPU0  (blocking vCPU A)         |   CPU1 ( unblock vCPU A)
>                                 |
> A <- read local events          |
>                                 |   set local events
>                                 |   test_and_clear_bit(_VPF_blocked)
>                                 |       -> Bail out as the bit if not set
>                                 |
> set_bit(_VFP_blocked)           |
>                                 |
> check A                         |
> 
> The variable A will be 0 and therefore the vCPU will be blocked when it
> should continue running.
> 
> vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the CPU
> to read any information about local events before the flag _VPF_blocked
> is set.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> 
> This is a follow-up of the discussion that started in 2019 (see [1])
> regarding a possible race between do_poll()/vcpu_unblock() and the wake
> up path.
> 
> I haven't yet fully thought about the potential race in do_poll(). If
> there is, then this would likely want to be fixed in a separate patch.
> 
> On x86, the current code is safe because set_bit() is fully ordered. SO
> the problem is Arm (and potentially any new architectures).
> 
> I couldn't convince myself whether the Arm implementation of
> local_events_need_delivery() contains enough barrier to prevent the
> re-ordering. However, I don't think we want to play with devil here as
> the function may be optimized in the future.

In fact I think this ...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1418,6 +1418,8 @@ void vcpu_block(void)
>  
>      set_bit(_VPF_blocked, &v->pause_flags);
>  
> +    smp_mb__after_atomic();
> +

... pattern should be looked for throughout the codebase, and barriers
be added unless it can be proven none is needed.

Jan

