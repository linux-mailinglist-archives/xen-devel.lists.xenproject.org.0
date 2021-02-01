Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDC30AAC6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79961.145905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6av3-00054A-Ec; Mon, 01 Feb 2021 15:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79961.145905; Mon, 01 Feb 2021 15:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6av3-00053l-BG; Mon, 01 Feb 2021 15:15:13 +0000
Received: by outflank-mailman (input) for mailman id 79961;
 Mon, 01 Feb 2021 15:15:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6av2-00053g-CM
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:15:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6av2-0004Q8-8V
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:15:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6av2-0004zz-5U
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:15:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6aux-0007mB-HN; Mon, 01 Feb 2021 15:15:07 +0000
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
	bh=ujP6Rh16nsukNtKjM63EsqjzhjYIB57ZeV6enttUqVs=; b=j+74toKT0lZ8ohL0kTUQlTikGS
	0bFsnL1uWPwIVZzHR9r7IsuhiebGV4rX9IJRH7IwjTWOeG5vBANBlu4tJyPu1LSCjBPwpTe3pxqnm
	/q3qKkAY7b+QmcOGQqixTpIoj+ZG0nQewtxeDASLKOLEi4oLjJOhAa+ueeLautQDLFew=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.6907.258459.936054@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:15:07 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and
 CONFIG_COVERAGE=y [and 1 more messages]
In-Reply-To: <321c06d3-106a-cfab-5ac8-df629e600dfe@suse.com>
References: <20210130152210.17503-1-julien@xen.org>
	<174a18ba-25d5-a94c-a85d-4a81b837a936@suse.com>
	<24600.5695.143342.713995@mariner.uk.xensource.com>
	<321c06d3-106a-cfab-5ac8-df629e600dfe@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y [and 1 more messages]"):
> On 01.02.2021 15:54, Ian Jackson wrote:
> > Julien Grall writes ("[PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y"):
...
> > Jan, can you confirm whether in your opinion this patch as originally
> > posted by Julien is *correct* as is ?  In particular, Julien did not
> > intend a functional change.  Have you satisfied yourself that there is
> > no functional change here ?
> 
> Yes and yes.
> 
> > I understand your objectiion above to relate to style or neatness,
> > rather than function.  Is that correct ?
> 
> Yes.

Right, thanks.

> >  And that your proposed
> > additional change would have some impact whilch would have to be
> > assessed.
> 
> The first of the proposed alternatives may need further
> investigation, yes. The second of the alternatives would
> shrink this patch to a 2-line one, i.e. far less code
> churn, and is not in need of any assessment afaia. In
> fact I believe this latter alternative was discussed as
> the approach to take here, before the patch was submitted.

Sorry I missed that part.  I would be happy with that other approach
too, so for that approach (adding a duplicated ASSERT) is also

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I'm not a huge fan of code duplication, in general.  I suggest that if
the ASSERT is duplicated it might be worth leaving comment(s) by each
one pointing to the other.

Ian.

