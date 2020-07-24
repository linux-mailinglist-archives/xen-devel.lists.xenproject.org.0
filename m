Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2022CC8E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 19:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz1nA-0000Xo-Nu; Fri, 24 Jul 2020 17:47:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fOER=BD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jz1n9-0000Xj-7k
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 17:47:31 +0000
X-Inumbo-ID: bed969e6-cdd5-11ea-a443-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bed969e6-cdd5-11ea-a443-12813bfff9fa;
 Fri, 24 Jul 2020 17:47:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CB46206F6;
 Fri, 24 Jul 2020 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595612849;
 bh=jMib/9zVPmUdrJblnmrrcAKQU0Co/1a5agUte3mYzr4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZU61QnxTtbUlxju21WGlAZw7YhogjZQnib8+b7ewWM85Ae6t4KCDd7Ur9pVXhTTe2
 c39nOvsNGukM4CK8q9CuqnQ9thAVhat3qZdliDiSeMPzwJkQWqJqZ8t3zwkdwSpN+q
 8d19Qf4sDO6M1588NSLoH/JQI6ob7FOy6C6nrCxM=
Date: Fri, 24 Jul 2020 10:47:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
In-Reply-To: <276d6b48-8cd7-7fb1-1d76-15cb6a95cad9@xen.org>
Message-ID: <alpine.DEB.2.21.2007241045340.17562@sstabellini-ThinkPad-T480s>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <3ee41590-e8ca-84d6-3010-6e5dffe91df0@epam.com>
 <276d6b48-8cd7-7fb1-1d76-15cb6a95cad9@xen.org>
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
Cc: "nd@arm.com" <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 24 Jul 2020, Julien Grall wrote:
> > > > +    list_add_tail(&bridge->node, &pci_host_bridges);
> > > It looks like &pci_host_bridges should be an ordered list, ordered by
> > > segment number?
> > 
> > Why? Do you expect bridge access in some specific order so ordered
> > 
> > list will make it faster?
> 
> Access to the configure space will be pretty random. So I don't think ordering
> the list will make anything better.
> 
> However, looking up for the bridge for every config spec access is pretty
> slow. When I was working on the PCI passthrough, I wanted to look whether it
> would be possible to have a pointer to the PCI host bridge passed in argument
> to the helpers (rather than the segment).

I was suggesting ordering the list because it is a rather cheap
optimization: it is easy to implement and it typically leads to decent
improvements (although it varies on a case by case basis). Something
more sophisticated as you mention here would be even better.

