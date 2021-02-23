Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD8323234
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 21:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89091.167568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEeTv-0000dT-AG; Tue, 23 Feb 2021 20:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89091.167568; Tue, 23 Feb 2021 20:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEeTv-0000d4-6X; Tue, 23 Feb 2021 20:40:31 +0000
Received: by outflank-mailman (input) for mailman id 89091;
 Tue, 23 Feb 2021 20:40:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEeTt-0000cz-VK
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 20:40:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 878ec573-2ba2-4b0c-8bf7-c2d49312d6dd;
 Tue, 23 Feb 2021 20:40:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DFDC601FF;
 Tue, 23 Feb 2021 20:40:28 +0000 (UTC)
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
X-Inumbo-ID: 878ec573-2ba2-4b0c-8bf7-c2d49312d6dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614112828;
	bh=GQUobiaItm0t2cmOOoyfX4zeMrB5aEvhU2hMF0b1duk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B0+Yysz1Lm1d2Kf1NfePaJhMx2Qej0kYt9qYL/HM9h1Ek9hOb1MlvnkusGMog7D/6
	 q63eCxlsRHCcHsIfMVyd3Heh8Q/jEmx9ZyTZyUeLb9H/4V9mh5avZVLvpVzPAil61S
	 tNPv+iRfPVCwV8OOIj6IPBzju33q9meL+e3RhHGpyYnCrrriA5wg8P4X3mOnP5xaZ+
	 UsJBgZhl4c8nsc3SVoB0HoM9qYrneeOGtyb3M5HCBhFtjsXBPlqvcxluh0n9DC4J8/
	 dQg5FGE6m+SkIFdXb4AU2925HCvV6O26VJ+sRcTg0OlAFgxVr+e5o9s15cQOx4f2bt
	 JUmgZSqYwHAsA==
Date: Tue, 23 Feb 2021 12:40:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, dfaggioli@suse.com, 
    George.Dunlap@citrix.com
Subject: Re: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2,
 3}
In-Reply-To: <767e2028-ca86-bd0f-e936-c386066c11c8@xen.org>
Message-ID: <alpine.DEB.2.21.2102231237410.3234@sstabellini-ThinkPad-T480s>
References: <20210220140412.31610-1-julien@xen.org> <F86904EB-91E9-475C-B60B-E08C5C9E76C3@arm.com> <alpine.DEB.2.21.2102221253390.3234@sstabellini-ThinkPad-T480s> <767e2028-ca86-bd0f-e936-c386066c11c8@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Feb 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/02/2021 01:24, Stefano Stabellini wrote:
> > On Mon, 22 Feb 2021, Bertrand Marquis wrote:
> > > > On 20 Feb 2021, at 14:04, Julien Grall <julien@xen.org> wrote:
> > The consequence of this patch is that a guest can cause vcpu_unblock(v),
> > hence vcpu_wake(v), to be called for its own vcpu, which basically
> > always changes v to RUNSTATE_runnable. However, that alone shouldn't
> > allow v to always come up ahead of any other vcpus in the queue, right?
> > It should be safe. I just wanted a second opinion on this :-)
> 
> vcpu_wake() only tells the scheduler that the vCPU can be run, it is then up
> to the scheduler to decide what to do. AFAIU, for credit{1, 2}, each vCPU will
> have some credit. If you run out of credit, then you vCPU will not be
> descheduled if there is work do it.

OK, great, it matches my understanding. Thanks for checking.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

