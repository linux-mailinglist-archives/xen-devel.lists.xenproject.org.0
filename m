Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D123F49D
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 23:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4AHD-0004yk-6R; Fri, 07 Aug 2020 21:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k4AHA-0004xs-VJ
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 21:51:44 +0000
X-Inumbo-ID: f0f5f576-1ed4-42f1-9e15-95ddc937d1f7
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0f5f576-1ed4-42f1-9e15-95ddc937d1f7;
 Fri, 07 Aug 2020 21:51:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85B952224D;
 Fri,  7 Aug 2020 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596837103;
 bh=KL5rEqFnEXUZReoD4jjORNAHEdWDvjcsM6jX9HnzfFw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=W80mn6hGXSPcT81WDJfdirbEwUpa+PUIwskFtCbuNBGi9DUyYCIZw9WCpdTMwW8DJ
 sLk4xsbdHaV38b7KN2LV/dZXB82w/bCuFLM5wHiupIKQTLR0EsjLEFizmi20sxh5/k
 r/D69RLHXX6KctPUGbfaAAS3zd2PpL21GMjj7n6I=
Date: Fri, 7 Aug 2020 14:51:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 06/14] kernel-doc: public/grant_table.h
In-Reply-To: <5a4d6a81-bc8f-3d00-f760-d39023711dbc@suse.com>
Message-ID: <alpine.DEB.2.21.2008071235320.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-6-sstabellini@kernel.org>
 <5a4d6a81-bc8f-3d00-f760-d39023711dbc@suse.com>
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
> > @@ -108,56 +107,66 @@
> >   *  Use SMP-safe bit-setting instruction.
> >   */
> >  
> > -/*
> > +/**
> > + * typedef
> >   * Reference to a grant entry in a specified domain's grant table.
> >   */
> >  typedef uint32_t grant_ref_t;
> 
> In the comment, did you mean grant_ref_t?

Yes, I'll fix it.


> > -/*
> > +/**
> > + * DOC: grant table
> > + *
> >   * A grant table comprises a packed array of grant entries in one or more
> >   * page frames shared between Xen and a guest.
> >   * [XEN]: This field is written by Xen and read by the sharing guest.
> >   * [GST]: This field is written by the guest and read by Xen.
> >   */
> >  
> > -/*
> > - * Version 1 of the grant table entry structure is maintained purely
> > - * for backwards compatibility.  New guests should use version 2.
> > - */
> >  #if __XEN_INTERFACE_VERSION__ < 0x0003020a
> >  #define grant_entry_v1 grant_entry
> >  #define grant_entry_v1_t grant_entry_t
> >  #endif
> > +/**
> > + * struct grant_entry_v1
> > + *
> > + * Version 1 of the grant table entry structure is maintained purely
> > + * for backwards compatibility.  New guests should use version 2.
> > + */
> 
> I realize content changes aren't intended, but here I can't resist
> recommending to drop the second sentence at this occasion.

OK


> > +/**
> > + * DOC: Values for error status returns. All errors are -ve.
> > + *
> > + *
> > + * - GNTST_okay: Normal return.
> 
> Nit: Why two blank comment lines above?

A small mistake, I'll fix it.

