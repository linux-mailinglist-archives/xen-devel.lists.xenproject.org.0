Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65F23CC62
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3MUK-0000eU-Rs; Wed, 05 Aug 2020 16:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCcZ=BP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3MUJ-0000eL-9E
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:41:59 +0000
X-Inumbo-ID: e4ffa99b-04ae-4d85-9e99-3dae58643633
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4ffa99b-04ae-4d85-9e99-3dae58643633;
 Wed, 05 Aug 2020 16:41:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55BC82067D;
 Wed,  5 Aug 2020 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596645717;
 bh=kQSllmn6YanvKxFLx6/+6zwojR89djKhoceBz2aAjyY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=y22tqEcv4kHr3qJFIZ3SklKLXa5g2UJ1OKBUk8ZkdLgyuyQdtIssWTYW+fDgpCj7R
 rF0mUHH+XnET6R7YrJqJZMvrknYQsyUPl4thfD2Lc59ZVE6FoeR+Thz2a/fL6X4yWg
 IO1LujMZLdl3HM5nWD5+qyYJ1VVOlIhNrYzeejJo=
Date: Wed, 5 Aug 2020 09:41:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <cb48c78c-60fc-7dad-58d0-7a0a095ab4d4@suse.com>
Message-ID: <alpine.DEB.2.21.2008050938450.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <cb48c78c-60fc-7dad-58d0-7a0a095ab4d4@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 5 Aug 2020, Jan Beulich wrote:
> On 05.08.2020 01:22, Stefano Stabellini wrote:
> > On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> >> --- a/xen/include/asm-arm/p2m.h
> >> +++ b/xen/include/asm-arm/p2m.h
> >> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
> >>                                          mfn_t mfn)
> >>  {
> >>      /*
> >> -     * NOTE: If this is implemented then proper reference counting of
> >> -     *       foreign entries will need to be implemented.
> >> +     * XXX: handle properly reference. It looks like the page may not always
> >> +     * belong to d.
> > 
> > Just as a reference, and without taking away anything from the comment,
> > I think that QEMU is doing its own internal reference counting for these
> > mappings.
> 
> Which of course in no way replaces the need to do proper ref counting
> in Xen. (Just FAOD, as I'm not sure why you've said what you've said.)

Given the state of the series, which is a RFC, I only meant to say that
the lack of refcounting shouldn't prevent things from working when using
QEMU. In the sense that if somebody wants to give it a try for an early
demo, they should be able to see it running without crashes.

Of course, refcounting needs to be implemented.

