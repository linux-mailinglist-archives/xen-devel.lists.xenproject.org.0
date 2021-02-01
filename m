Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48FC30AA4D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79929.145780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6abW-0001yi-92; Mon, 01 Feb 2021 14:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79929.145780; Mon, 01 Feb 2021 14:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6abW-0001yM-5v; Mon, 01 Feb 2021 14:55:02 +0000
Received: by outflank-mailman (input) for mailman id 79929;
 Mon, 01 Feb 2021 14:55:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6abU-0001yH-9P
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:55:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6abU-00040v-57
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:55:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6abU-00035Q-4I
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:55:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6abP-0007eV-Dq; Mon, 01 Feb 2021 14:54:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=dKfvyWOtU1ds8JEL7uFi5qrZvBqg/UGn1drgGsjXRHs=; b=Bnf8YRUn4HKi2MMzHs246C6RWk
	jD9F7VGIpKdrrwEzDay+KbqKQl0JstH/3bIHkWlrG84knM970cHfUNUXPLJ1HzjGvSQHysx7i6Dt0
	8PHNN6Rpwjg0Hh6oFw2LzTsWh5Y8h9SBjHe4zhepnwG2XfaDpKVKD/BRFQp4oDuXgt5w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.5695.143342.713995@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 14:54:55 +0000
To: Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y [and 1 more messages]
In-Reply-To: <20210130152210.17503-1-julien@xen.org>,
	<174a18ba-25d5-a94c-a85d-4a81b837a936@suse.com>
References: <20210130152210.17503-1-julien@xen.org>
	<174a18ba-25d5-a94c-a85d-4a81b837a936@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y"):
> Xen is heavily relying on the DCE stage to remove unused code so the
> linker doesn't throw an error because a function is not implemented
> yet we defined a prototype for it.

Thanks for the clear explanation.

> It is not entirely clear why the compiler DCE is not detecting the
> unused code. However, moving the permission check from do_memory_op()
> to xenmem_add_to_physmap_batch() does the trick.

How unfortunate.

> Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I have reviewed the diff, but not the code in context.

> The gitlab CI is used to provide basic testing on a per-series basis. So
> I would like to request this patch to be merged in Xen 4.15 in order to
> reduce the number of failure not related to the series tested.

Quite so.

Jan Beulich writes ("Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y"):
> On 30.01.2021 16:22, Julien Grall wrote:
> > @@ -1442,13 +1447,6 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >          if ( d == NULL )
> >              return -ESRCH;
> >  
> > -        rc = xatp_permission_check(d, xatpb.space);
> > -        if ( rc )
> > -        {
> > -            rcu_unlock_domain(d);
> > -            return rc;
> > -        }
> > -
> >          rc = xenmem_add_to_physmap_batch(d, &xatpb, start_extent);
> >  
> >          rcu_unlock_domain(d);
> 
> I'd be okay with the code movement if you did so consistently,
> i.e. also for the other invocation. I realize this would have
> an effect on the dm-op call of the function, but I wonder
> whether this wouldn't even be a good thing. If not, I think
> duplicating xenmem_add_to_physmap()'s early ASSERT() into
> xenmem_add_to_physmap_batch() would be the better course of
> action.

Jan, can you confirm whether in your opinion this patch as originally
posted by Julien is *correct* as is ?  In particular, Julien did not
intend a functional change.  Have you satisfied yourself that there is
no functional change here ?

I understand your objectiion above to relate to style or neatness,
rather than function.  Is that correct ?  And that your proposed
additional change would have some impact whilch would have to be
assessed.

In which case I think it would be better to defer the style
improvement until after the release.

IOW, the original patch

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

assuming a favourable functional code review from a relevant
maintainer.

Thanks,
Ian.

