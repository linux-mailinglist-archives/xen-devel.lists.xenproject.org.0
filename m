Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA823F49E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 23:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4AHV-000559-G3; Fri, 07 Aug 2020 21:52:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k4AHU-00054h-AP
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 21:52:04 +0000
X-Inumbo-ID: 05c2fdcc-573e-4e6d-88de-06190720877f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05c2fdcc-573e-4e6d-88de-06190720877f;
 Fri, 07 Aug 2020 21:52:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 100F52177B;
 Fri,  7 Aug 2020 21:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596837121;
 bh=2o2xY2k+5MnqEGwKfJYGxIBlc1BP9NxLYYu/963VmbQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pC91Jx16bOLDNj5f3WTHyJP/698eodVxY3fk7/B8+vNH5WPD1m0vScDSo6pe7LgQ8
 vzrdJGt89OnDM28NFwLA+qf/Niyg1pEq1QhlJ5YFcv6UuCXSNLi55Qj6C0KdUXZbvG
 zo+6oMr5xmbwz1AehTa5LLCj5h1wH8HUolguIVCA=
Date: Fri, 7 Aug 2020 14:52:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 05/14] kernel-doc: public/features.h
In-Reply-To: <ab1a0562-6fe0-9613-b6c9-a09714af02cf@suse.com>
Message-ID: <alpine.DEB.2.21.2008071239130.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-5-sstabellini@kernel.org>
 <ab1a0562-6fe0-9613-b6c9-a09714af02cf@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 7 Aug 2020, Jan Beulich wrote:
> On 07.08.2020 01:49, Stefano Stabellini wrote:
> > @@ -41,19 +41,25 @@
> >   * XENFEAT_dom0 MUST be set if the guest is to be booted as dom0,
> >   */
> >  
> > -/*
> > - * If set, the guest does not need to write-protect its pagetables, and can
> > - * update them via direct writes.
> > +/**
> > + * DOC: XENFEAT_writable_page_tables
> > + *
> > + * If set, the guest does not need to write-protect its pagetables, and
> > + * can update them via direct writes.
> >   */
> >  #define XENFEAT_writable_page_tables       0
> 
> I dislike such redundancy (and it's more noticable here than with
> the struct-s). Is there really no way for the tool to find the
> right item, the more that in the cover letter you say that you
> even need to get the placement right, i.e. there can't be e.g.
> intervening #define-s?

Let me clarify that the right placement (nothing between the comment and
the following structure) is important for structs, typedefs, etc., but
not for "DOC". DOC is freeform and doesn't have to be followed by
anything specifically.


In regards to the redundancy, there is only another option, that I
didn't choose because it leads to worse documents being generated.
However, they are still readable, so if the agreement is to use the
other format, I would be OK with it.


The other format is the keyword "macro" (this one would have to have the
right placement, straight on top of the #define):

/**
 * macro XENFEAT_writable_page_tables
 *
 * If set, the guest does not need to write-protect its pagetables, and
 * can update them via direct writes.
 */


Which could be further simplified to:

/**
 * macro
 *
 * If set, the guest does not need to write-protect its pagetables, and
 * can update them via direct writes.
 */


In terms of redundancy, that's the best we can do.

The reason why I say it is not optimal is that with DOC the pleudo-html
generated via sphinx is:

---
* XENFEAT_writable_page_tables *

If set, the guest does not need to write-protect its pagetables, and
can update them via direct writes.
---

While with macro, two () parenthesis gets added to the title, and also an
empty "Parameters" section gets added, like this:

---
* XENFEAT_writable_page_tables() *

** Parameters **

** Description **

If set, the guest does not need to write-protect its pagetables, and
can update them via direct writes.
---


I think it could be confusing to the user: it looks like a macro with
parameters, which is not what we want.

For that reason, I think we should stick with "DOC" for now.

