Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B61F5649
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 15:56:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj1D4-0002nc-72; Wed, 10 Jun 2020 13:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h/9h=7X=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jj1D2-0002nO-Ua
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 13:56:04 +0000
X-Inumbo-ID: 1ef3cee2-ab22-11ea-b449-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ef3cee2-ab22-11ea-b449-12813bfff9fa;
 Wed, 10 Jun 2020 13:56:03 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 0C91D122804;
 Wed, 10 Jun 2020 15:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1591797362;
 bh=dQM1v/InNxn2/aJ4PouUn9hXkCZr2u+Zl52zCY32cuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pOuQUOvlnw+gpAgMWeGC/cj0tznQq9o3pPrIxd3B4J7/JX2aWxbL0AZqiB1ZdSJt9
 3RVDVR0TDb4w9urLfnKqXfdg+aXnRdxJtw4XGtwmDWymfBWzDcqs7udJUK3h+KTgiK
 tDSHbpddSAffTw6mnd6/rUc/+bWrD3JYCTSVG8xXH/n7Biuz/WAfBuH/U8Jw5mSY/s
 niJ1uTvx69XmjqzxM0jpAuEGSmVXDeVLZRPzTN3N6rlUSBDOJoguHNs7I1nnONmSfK
 X22uPtqLB+ko3j9zG9yWXixpih7FSIlOLo3hhSlA/qCzXss9CuxbBND8Wcmj1uUvcz
 dDlr5ajmoPeLw==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id E448D265E722; Wed, 10 Jun 2020 15:56:01 +0200 (CEST)
Date: Wed, 10 Jun 2020 15:56:01 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
Message-ID: <20200610135601.GB16839@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
References: <20200609094425.GB9734@nodbug.lucina.net>
 <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
 <20200610132225.GA16839@nodbug.lucina.net>
 <46e87834-bf47-4003-1f32-89a47255155d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46e87834-bf47-4003-1f32-89a47255155d@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wednesday, 10.06.2020 at 14:40, Andrew Cooper wrote:
> > So, going with the grant v2 ABI, is there a modern equivalent of
> > GNTTABOP_get_status_frames? Reading memory.h I'm guessing that it might be
> > XENMEM_add_to_physmap with space=XENMAPSPACE_grant_table and
> > idx=(XENMAPIDX_grant_table_status + N) where N is the frame I want, but
> > this is not explicitly mentioned anywhere and Linux uses the GNTTABOP
> > mechanism.
> >
> > Further to that, what is the format of the grant status frames?
> > grant_table.h doesn't have much to say about it.
> >
> > And lastly, given that I want the v2 grant ABI exclusively, I presume it's
> > sufficient to call GNTTABOP_set_version (version=2) first thing and abort
> > if it failed? Presumably the default is always v1 at start of day?
> 
> What kind of guests are you trying to target here?

PVHv2 only. x86_64 only for now, though the code should remain easily
portable to at least ARM64, should someone decide they need that.

> Since my reply, I tried to experiment, and I think you're forced to use
> GNTTABOP_setup_table/GNTTABOP_get_status_frames for x86 PV guests, and
> XENMEM_add_to_physmap for x86 HVM/PVH guests.
> 
> You can't depend on version 2 being available.  Its not available for
> ARM at all, and may be disabled for security reasons on x86 (there was
> some extended fun with transitive grants in the past, and we offered
> "totally disable grant v2" as one mitigation).

I don't need v2 at all, I was just going by the comments in grant_table.h,
which read: "Version 1 of the grant table entry structure is maintained
purely for backwards compatibility.  New guests should use version 2."

Grant status frames are a v2-only thing, right? Or can I use v1 and ask for
grant status frames?

-mato

