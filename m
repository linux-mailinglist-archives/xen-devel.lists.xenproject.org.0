Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586A4E4FA8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 10:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293831.499296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWxYc-0003Vm-67; Wed, 23 Mar 2022 09:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293831.499296; Wed, 23 Mar 2022 09:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWxYc-0003To-31; Wed, 23 Mar 2022 09:45:34 +0000
Received: by outflank-mailman (input) for mailman id 293831;
 Wed, 23 Mar 2022 09:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AzRF=UC=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1nWxYa-0003Ti-C9
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 09:45:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f90aaa13-aa8d-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 10:45:28 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E7097210E9;
 Wed, 23 Mar 2022 09:45:30 +0000 (UTC)
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B07EEA3B87;
 Wed, 23 Mar 2022 09:45:30 +0000 (UTC)
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
X-Inumbo-ID: f90aaa13-aa8d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648028730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ti9JhYfeam/u5xAhSegF8ekFHob7Y2T4kBftHw/UI6E=;
	b=ZutDmkZ9jygSsfyoj9ryiYIFOO5vuws/tB9rZTEzQXN6q6jF//zFiuk5pg29dYNBhpZ05E
	4BFp85b6z4ne3eA0k3ftibKWvgD6k3Z9U8B08m9vDKD9J3Un2oWzIPwGW8RtVgqhd1cey/
	6UjWkFDk/APunOgEG7BzHnIiHXT47Nc=
Date: Wed, 23 Mar 2022 10:45:30 +0100
From: Michal Hocko <mhocko@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-mm@kvack.org, lkml <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: blocking vs. non-blocking mmu notifiers
Message-ID: <YjrsOnxaPYc3rbdj@dhcp22.suse.cz>
References: <8e8ec786-74db-157b-a290-b1537941e91d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e8ec786-74db-157b-a290-b1537941e91d@suse.com>

[Let me add more people to the CC list - I am not really sure who is the
 most familiar with all the tricks that mmu notifiers might do]

On Wed 23-03-22 09:43:59, Juergen Gross wrote:
> Hi,
> 
> during analysis of a customer's problem on a 4.12 based kernel
> (deadlock due to a blocking mmu notifier in a Xen driver) I came
> across upstream patches 93065ac753e4 ("mm, oom: distinguish
> blockable mode for mmu notifiers") et al.
> 
> The backtrace of the blocked tasks was typically something like:
> 
>  #0 [ffffc9004222f228] __schedule at ffffffff817223e2
>  #1 [ffffc9004222f2b8] schedule at ffffffff81722a02
>  #2 [ffffc9004222f2c8] schedule_preempt_disabled at ffffffff81722d0a
>  #3 [ffffc9004222f2d0] __mutex_lock at ffffffff81724104
>  #4 [ffffc9004222f360] mn_invl_range_start at ffffffffc01fd398 [xen_gntdev]
>  #5 [ffffc9004222f398] __mmu_notifier_invalidate_page at ffffffff8123375a
>  #6 [ffffc9004222f3c0] try_to_unmap_one at ffffffff812112cb
>  #7 [ffffc9004222f478] rmap_walk_file at ffffffff812105cd
>  #8 [ffffc9004222f4d0] try_to_unmap at ffffffff81212450
>  #9 [ffffc9004222f508] shrink_page_list at ffffffff811e0755
> #10 [ffffc9004222f5c8] shrink_inactive_list at ffffffff811e13cf
> #11 [ffffc9004222f6a8] shrink_node_memcg at ffffffff811e241f
> #12 [ffffc9004222f790] shrink_node at ffffffff811e29c5
> #13 [ffffc9004222f808] do_try_to_free_pages at ffffffff811e2ee1
> #14 [ffffc9004222f868] try_to_free_pages at ffffffff811e3248
> #15 [ffffc9004222f8e8] __alloc_pages_slowpath at ffffffff81262c37
> #16 [ffffc9004222f9f0] __alloc_pages_nodemask at ffffffff8121afc1
> #17 [ffffc9004222fa48] alloc_pages_current at ffffffff8122f350
> #18 [ffffc9004222fa78] __get_free_pages at ffffffff8121685a
> #19 [ffffc9004222fa80] __pollwait at ffffffff8127e795
> #20 [ffffc9004222faa8] evtchn_poll at ffffffffc00e802b [xen_evtchn]
> #21 [ffffc9004222fab8] do_sys_poll at ffffffff8127f953
> #22 [ffffc9004222fec8] sys_ppoll at ffffffff81280478
> #23 [ffffc9004222ff30] do_syscall_64 at ffffffff81004954
> #24 [ffffc9004222ff50] entry_SYSCALL_64_after_hwframe at ffffffff818000b6
> 
> It was found that the notifier of the Xen gntdev driver was using a
> mutex resulting in the deadlock.
> 
> Michal Hocko suggested that backporting above mentioned patch might
> help, as the mmu notifier call is happening in atomic context.
> 
> Looking into that I was wondering whether try_to_unmap_one() shouldn't
> call mmu_notifier_invalidate_range_start_nonblock() instead of
> mmu_notifier_invalidate_range_start() if this is true. Otherwise I
> can't see how this deadlock could be avoided.

Just to be more explicit. The current upstream code calls
mmu_notifier_invalidate_range while the page table locks are held.
Are there any notifiers which could sleep in those? In other words
should we use the nonblock start/stop in try_to_unmap?

> Any thoughts?
> 
> 
> Juergen






-- 
Michal Hocko
SUSE Labs

