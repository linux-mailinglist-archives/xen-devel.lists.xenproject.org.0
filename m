Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DD1B2EF7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 20:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQxXo-0002bJ-KP; Tue, 21 Apr 2020 18:22:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO9m=6F=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jQxXn-0002bE-GS
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 18:22:51 +0000
X-Inumbo-ID: 1bf97206-83fd-11ea-9180-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bf97206-83fd-11ea-9180-12813bfff9fa;
 Tue, 21 Apr 2020 18:22:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2162F20724;
 Tue, 21 Apr 2020 18:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493370;
 bh=gFnveSCvSzdifyHd5GqGr2RENVOime36TyKZ9gRmTJM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jsYO6bUt27HdFXkvew/c74MjxnGnGwXH7noy+6LHtpcLUesv8ohCM09sO73/n3yVz
 75wZyz+m/x1V/t/gaS6H60fcXHkxQ74x04zLSTnk3Ovb2d47Gwih9YeLBBiv4dtvz+
 MWayd0Ju1uFGJz4S51affS4iPVbX4oNHXiYYZQx4=
Date: Tue, 21 Apr 2020 11:22:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
In-Reply-To: <5d33d469-9aba-5285-766a-193d7109712d@suse.com>
Message-ID: <alpine.DEB.2.21.2004211117460.24585@sstabellini-ThinkPad-T480s>
References: <20200417222430.20480-1-sstabellini@kernel.org>
 <5d33d469-9aba-5285-766a-193d7109712d@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org, Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 george.dunlap@citrix.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 20 Apr 2020, Jan Beulich wrote:
> On 18.04.2020 00:24, Stefano Stabellini wrote:
> > +Backport Tag
> > +------------
> > +
> > +A backport tag is an optional tag in the commit message to request a
> > +given commit to be backported to the stable trees:
> > +
> > +    Backport: 4.9+
> > +
> > +It marks a commit for being a candidate for backports to all stable
> > +trees from 4.9 onward.
> 
> Using the wording "stable trees" may, to some, imply ones still
> under maintenance. How about omitting "stable", or replacing it
> by "released"?

OK


> > +The backport requester is expected to specify which currently supported
> > +releases need the backport; but encouraged to specify a release as far
> > +back as possible which applies. If the requester doesn't know the oldest
> > +affected tree, they are encouraged to append a comment like the
> > +following:
> > +
> > +    Backport: 4.9+ # maybe older
> > +
> > +Maintainers request the Backport tag to be added on commit. Contributors
> > +are welcome to mark their patches with the Backport tag when they deem
> > +appropriate. Maintainers will request for it to be removed when that is
> > +not the case.
> > +
> > +Please note that the Backport tag is a **request** for backport, which
> > +will still need to be evaluated by the stable tree maintainers.
> > +Maintainers might ask the requester to help with the backporting work if
> > +it is not trivial.
> > +
> > +When possible, please use the Fixes tag instead.
> 
> Maybe amend with "(or in addition)"? I'm thinking in particular
> about a case where a buggy change was already backported, but
> didn't show up yet in a release from the respective branch(es).

Sure


> Previously I did suggest to add an indication that people requesting
> backports should also be prepare to actually help with backporting.
> I don't recall a verbal reply, and I also don't see any respective
> update here. (I'm not fully trusting our mail system, i.e. it may
> very well be that I did miss a reply.)


I didn't reply, but I added two lines in that regards, see also above:

> > +Maintainers might ask the requester to help with the backporting work if
> > +it is not trivial.

