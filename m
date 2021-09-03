Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80423FF866
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 02:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177734.323379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLxEi-0006JM-7H; Fri, 03 Sep 2021 00:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177734.323379; Fri, 03 Sep 2021 00:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLxEi-0006HM-4E; Fri, 03 Sep 2021 00:39:16 +0000
Received: by outflank-mailman (input) for mailman id 177734;
 Fri, 03 Sep 2021 00:39:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLxEg-0006HG-FY
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 00:39:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fad1be8b-f4cb-46f7-9bd6-f67864842b01;
 Fri, 03 Sep 2021 00:39:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7856860FD7;
 Fri,  3 Sep 2021 00:39:12 +0000 (UTC)
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
X-Inumbo-ID: fad1be8b-f4cb-46f7-9bd6-f67864842b01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630629552;
	bh=y2icUBNg0/9LSlQTIW4ms/VZvVLzZCQ5l/Hx8gsPjFA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JbW+IilMz5RIKz2a4HoJk92KHJ3AgT2cFEVw5W2grEqIxPJeVUu7VDf7HXfEaPIu1
	 /kCNDi+CJnY0fsLdEzQIi8MGfqN2If96vHySwv8SVlkwnJXjaUW089cxAy2Qvwe6JM
	 41JNGPnCu2rSIaiw2bbiX9FLTPLz/IYqUBtA5NQY/wkz5nZxjtpaxXzQueLAWnMtZg
	 VnXqGdx6tKgcE+m8Kr+k4QMMy2cduN6Mvw9guj43uBGh8ktZzaWT+2PAudCUrjUNfi
	 0z6yxGkaH6R1YLlXeJ/AsgaWMq7fzicJFF9wjtbOZMDNFDZf0huEtS9QjHDIhzcy0p
	 foBGWbaOzib6A==
Date: Thu, 2 Sep 2021 17:39:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
Subject: Re: [PATCH v5 7/7] xen/arm: introduce allocate_static_memory
In-Reply-To: <ac3a9fbd-7598-e400-6c6c-1214df7acee7@xen.org>
Message-ID: <alpine.DEB.2.21.2109021527330.26072@sstabellini-ThinkPad-T480s>
References: <20210824095045.2281500-1-penny.zheng@arm.com> <20210824095045.2281500-8-penny.zheng@arm.com> <alpine.DEB.2.21.2109021352020.26072@sstabellini-ThinkPad-T480s> <ac3a9fbd-7598-e400-6c6c-1214df7acee7@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Sep 2021, Julien Grall wrote:
> > > +    kinfo->mem.nr_banks = ++gbank;
> > > +    kinfo->unassigned_mem -= tot_size;
> > > +    if ( kinfo->unassigned_mem )
> > > +    {
> > > +        printk(XENLOG_ERR
> > > +               "Size of \"memory\" property doesn't match up with the
> > > sum-up of \"xen,static-mem\".\n");
> > > +        goto fail;
> > 
> > Do we need to make this a fatal failure?
> > 
> > I am asking because unassigned_mem comes from the "memory" property of
> > the domain in device tree which is kind of redundant with the
> > introduction of xen,static-mem. In fact, I think it would be better to
> > clarify the role of "memory" when "xen,static-mem" is also present.
> > In that case, we could even make "memory" optional.
> 
> I requested to make it mandatory. Imagine you have a domU that has 1GB and now
> you want to switch to static memory. If we make the property optional, then
> there is a risk for the admin to not correctly pass the amount of memory. This
> may become unnoticed until late.
> 
> So I think making it mandatory is cheap for us and an easy way to confirm you
> properly sized the region. It also has the benefits to easily find out how
> much memory you gave to the guest (but that's just because I am lazy :)).
> 
> > In any case, even if we don't make "memory" optional, it might still be
> > good to turn this error into a warning and ignore the remaining
> > kinfo->unassigned_mem.
> 
> The behavior is matching the existing function and I think this is a good
> idea. If you ask 10MB of memory and we only give you 9MB, then at some point
> your guest is not going to be happy.
> 
> It is much better to know it in advance with a failure over discovering hours
> later when you see an OOM from your domain.

OK, I didn't realize this was discussed already. Let's not revisit this
then.

My preference is primarily to make the device tree easier to write, but
nowadays nobody I know is writing the device tree by hand anymore (they
all use ImageBuilder). So if the device tree is generated then we are
fine either way as long as the binding is clear. So I am OK to drop my
suggestion of making "memory" optional. Let's think of a way to make
"memory" and "xen,static-mem" coexist instead.


There are two sides of the issue:
- the Xen implementation
- the binding


The Xen implementation is fine to panic if memory != xen,static-mem. In
that regard, the current patch is OK.


From the binding perspective, I think it would be good to add a
statement to clarify. The binding doesn't necessarily need to match
exactly the implementation as the binding should be as future proof
and as flexible as possible.

From the binding perspective two properties should mean different
things: memory the total memory amount and xen,static-mem the static
memory. If one day we'll have more types of memory, memory will cover
the total amount while xen,static-mem will cover a subset. So memory
must be greater or equal to xen,static-mem (even if today Xen only
supports memory == xen,static-mem).

So I would add:

"""
As the memory property represents the total memory of the domain, hence
the amount of memory selected by the memory property must be greater or
equal to the total amount specified by xen,static-mem. Other
configurations (memory amount less than xen,static-mem amount) are
invalid.
"""

This sentence has the purpose of clarifying that "memory" still need to
be populated and have a valid value. Then, it is OK for Xen to error
out if memory doesn't match xen,static-mem because that's the only
configuration supported. The error message could be:

Size of "memory" property doesn't match up with the sum-up of
"xen,static-mem". Unsupported configuration.

