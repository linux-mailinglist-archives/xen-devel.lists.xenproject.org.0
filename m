Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA86BDC80
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 00:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510836.789276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcwZW-0004DU-H1; Thu, 16 Mar 2023 22:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510836.789276; Thu, 16 Mar 2023 22:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcwZW-0004AL-Dx; Thu, 16 Mar 2023 22:59:46 +0000
Received: by outflank-mailman (input) for mailman id 510836;
 Thu, 16 Mar 2023 22:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCnM=7I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pcwZV-0004AF-6Q
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 22:59:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b9da5a3-c44e-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 23:59:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8B65CCE1EB3;
 Thu, 16 Mar 2023 22:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E019EC433EF;
 Thu, 16 Mar 2023 22:59:36 +0000 (UTC)
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
X-Inumbo-ID: 3b9da5a3-c44e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679007578;
	bh=JyqaVOJoBQLZqRQvW8V5F5j9HdWRvMZcmtT7HGa2igU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q4In6wDl9HwGvsr19AJL+F23rKFh4iTEakxOoD6JLjjfjcWJ8FRR3iDRcksMZwvdg
	 sOK1SxhQiE2vuURbxw88dCopdpI01KBIOfrRjptmgHRTueLiBxqwjVTf3Dvrcs/yXy
	 pQuS3CjRU8PvCkbp6VXsM98rTcNu7rvUkuMjbtyx5ck8+wvDG5J1DZ54qdRpZH0cv+
	 hc8iicA2wZDFsydwyqViDAb/iB+yUqgmPlgIJj9l2JSUA6wGuTzKLvwCSNpsUGMAJz
	 ho/NYEn2JI9QUpRzDpVKdKHucShmc1frR+aTbPTMufxVeGC2uovUlrJgZo5YtjQwBn
	 EFzz5bBp9dqsQ==
Date: Thu, 16 Mar 2023 15:59:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
In-Reply-To: <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
Message-ID: <alpine.DEB.2.22.394.2303161559250.3359@ubuntu-linux-20-04-desktop>
References: <20230316102635.6497-1-michal.orzel@amd.com> <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Mar 2023, Jan Beulich wrote:
> On 16.03.2023 11:26, Michal Orzel wrote:
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -490,7 +490,24 @@ static void switch_serial_input(void)
> >      }
> >      else
> >      {
> > -        console_rx++;
> > +        unsigned int next_rx = console_rx + 1;
> > +
> > +        /* Skip switching serial input to non existing domains */
> > +        while ( next_rx < max_init_domid + 1 )
> > +        {
> > +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
> > +
> > +            if ( d )
> > +            {
> > +                rcu_unlock_domain(d);
> > +                break;
> > +            }
> > +
> > +            next_rx++;
> > +        }
> > +
> > +        console_rx = next_rx;
> > +
> >          printk("*** Serial input to DOM%d", console_rx - 1);
> >      }
> 
> While at the first glance (when you sent it in reply to v1) it looked okay,
> I'm afraid it really isn't: Please consider what happens when the last of
> the DomU-s doesn't exist anymore. (You don't really check whether it still
> exists, because the range check comes ahead of the existence one.) In that
> case you want to move from second-to-last to Xen. I expect the entire
> if/else construct wants to be inside the loop.

I don't think we need another loop, just a check if we found a domain or
not. E.g.:


    unsigned int next_rx = console_rx + 1;

    /* Skip switching serial input to non existing domains */
    while ( next_rx < max_init_domid + 1 )
    {
        struct domain *d = rcu_lock_domain_by_id(next_rx - 1);

        if ( d )
        {
            rcu_unlock_domain(d);
            console_rx = next_rx;
            printk("*** Serial input to DOM%d", console_rx - 1);
            break;
        }

        next_rx++;
    }

    /* no domain found */
    console_rx = 0;
    printk("*** Serial input to Xen");

