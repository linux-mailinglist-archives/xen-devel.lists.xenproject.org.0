Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82091265614
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 02:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGWzz-00025Y-V1; Fri, 11 Sep 2020 00:33:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMuY=CU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kGWzy-00025T-Si
 for xen-devel@lists.xen.org; Fri, 11 Sep 2020 00:33:07 +0000
X-Inumbo-ID: 197e7add-e1eb-4e21-9ddb-ee2a49840858
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 197e7add-e1eb-4e21-9ddb-ee2a49840858;
 Fri, 11 Sep 2020 00:33:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A237F208FE;
 Fri, 11 Sep 2020 00:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599784385;
 bh=pOom+B5I2E72/Z01rFwFdXMdIj3bOGjqy1POd1IkJJY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=f/l3ZWLyt0vyyUyUA7MmbS++4F7wLKFmDe1/Kk737RATi3R4QJt/ICN03X40Pkz6U
 G4DoQ7/O9S9ZH6buQGujpI5cvKqnJnyg68QJUmSvdIL+6ttOc9LrnTkkhPKq+mzuM0
 4mre9kHah1b7guowYxj33tJp8ZJGzmDzstm40gqk=
Date: Thu, 10 Sep 2020 17:33:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, 
 Julien Grall <julien@xen.org>, Stefano Stabellini <stefanos@xilinx.com>, 
 George Dunlap <George.Dunlap@citrix.com>, jgross@suse.com
Subject: Re: Runstate hypercall and Linux KPTI issues
In-Reply-To: <b7c7b1c5-c7c0-d7c9-b300-9a26e3b73746@suse.com>
Message-ID: <alpine.DEB.2.21.2009100914300.28991@sstabellini-ThinkPad-T480s>
References: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
 <8b9d8bc8-254e-01db-6ba3-ec41bc9cd2c7@suse.com>
 <2AD6A14F-AA25-464D-9E9E-6067F2F43F29@arm.com>
 <b7c7b1c5-c7c0-d7c9-b300-9a26e3b73746@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 10 Sep 2020, Jan Beulich wrote:
> >>> - should we backport the support for this hypercall in older kernel releases ?
> >>
> >> It's a bug fix to KPTI, and as such ought to be at least eligible for
> >> considering doing so?
> > 
> > That will mean also backport in Linux. What should be the scope ?
> 
> All longterm and stable trees which are affected, as I think is usual.

From a Linux perspective, we should fix this as soon as possible: we
should backport a patch to make the usage of the runstate hypercall
conditional on KPTI being disabled on ARM.

Then, when available in Xen, we should backport the usage of the new
hypercall with a check to detect if it is available -- do not assume it
is available, users might not update Xen, but might update Linux.

We have to do this in two stages for a couple of reasons. It is best not
to wait for Xen-side changes to fix Linux any longer. And also, a Linux
fix is best implemented independently anyway: Linux should benefit from
the Xen improvements when available but not rely on their presence to
work.

