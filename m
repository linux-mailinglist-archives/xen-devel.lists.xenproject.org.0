Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD6D331C44
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 02:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95185.179587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJR3h-0008Qf-Es; Tue, 09 Mar 2021 01:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95185.179587; Tue, 09 Mar 2021 01:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJR3h-0008QG-BT; Tue, 09 Mar 2021 01:21:13 +0000
Received: by outflank-mailman (input) for mailman id 95185;
 Tue, 09 Mar 2021 01:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vHL=IH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lJR3g-0008QB-1Q
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 01:21:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f114150b-0914-47e0-9837-aed15c5b879c;
 Tue, 09 Mar 2021 01:21:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFA5965092;
 Tue,  9 Mar 2021 01:21:10 +0000 (UTC)
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
X-Inumbo-ID: f114150b-0914-47e0-9837-aed15c5b879c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615252870;
	bh=2uGdIw6ct73aEUsMcahqyCLcwXR5i5yNTFjVicjOwwg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hgY2YtNZ6q7kN5VjIXX+2rQlMroj0lhNZRcHG3lRN4hPsWu0Wk2b8vcSkorhU54RN
	 6IcYecI42FQgVVFcX8GGRdkCiEQUpJMdawvu4koCWrJvk0aSjVIAkmraMJVE1Tes8m
	 7bo2PklGafHD/YIZE51Qv0Ar/AcMBwPIR4xVHgCp+fI7ZOyr+H8DEOoIxHv5QtE1pk
	 asP5qSQ+Vp575uviAS3E9n7rjhYyj3M0/0xKMALC7896i8nLAl83s9goPRK8HqYJBq
	 Q2ITmJZEcZnUbIo2zF7uv1owSnlUSpfyVzxAaCbn0pSzEYueoO/NDTq3JKdX4ZJVcP
	 rzPpUCFOgcDjg==
Date: Mon, 8 Mar 2021 17:21:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
In-Reply-To: <24f4462d-cf3e-73a1-0515-de94d7576f34@suse.com>
Message-ID: <alpine.DEB.2.21.2103081720540.16374@sstabellini-ThinkPad-T480s>
References: <20210308115610.48203-1-luca.fancellu@arm.com> <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org> <24f4462d-cf3e-73a1-0515-de94d7576f34@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Mar 2021, Jan Beulich wrote:
> On 08.03.2021 15:12, Julien Grall wrote:
> > On 08/03/2021 11:56, Luca Fancellu wrote:
> >> This patch prevents the dom0 to be loaded skipping its
> >> building and going forward to build domUs when the dom0
> >> kernel is not found and at least one domU is present.
> > 
> > As you are skipping dom0, the domid 0 will not be usable for another 
> > domain. I can see a few issues:
> >     1) The first domU created will now be considered as the hardware 
> > domain (see domain_create()).
> >     2)  There are still a few hardcoded use of d->domain_id == 0 in the 
> > codebase (I could spot at least on in the RTDS code).
> >     3) Not all the code seems to be able to cope with hardware_domain is 
> > NULL (although most of it looks to be only reachable by x86)?
> >     4) is_hardware_domain() will return true when passing NULL. It is 
> > not clear whether one may pass NULL here.
> > 
> > For 2), ideally this needs to be fixed. But we may also want to reserve 
> > domid 0 just for sanity.
> 
> +1 to reserving ID zero in such a case.

I agree too

