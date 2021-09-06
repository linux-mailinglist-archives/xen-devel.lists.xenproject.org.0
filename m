Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB71401A83
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 13:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179652.326040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCgg-0004EC-Sv; Mon, 06 Sep 2021 11:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179652.326040; Mon, 06 Sep 2021 11:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNCgg-0004Bs-Pa; Mon, 06 Sep 2021 11:21:18 +0000
Received: by outflank-mailman (input) for mailman id 179652;
 Mon, 06 Sep 2021 11:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Prhc=N4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNCgf-0004Bk-Er
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 11:21:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bbcb4be-55f2-430d-a5d9-8eb7ee204be3;
 Mon, 06 Sep 2021 11:21:16 +0000 (UTC)
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
X-Inumbo-ID: 0bbcb4be-55f2-430d-a5d9-8eb7ee204be3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630927276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ytoXKKZBgq2BBDO9li+7iEmPK3N6KZ6iFt5jVQxn6DQ=;
  b=HsWUEmMj5g5K5a0fpfwxhzJXRVOlbEDI6ahyamk9SAP515a4BX7KhCBy
   otlRaAnNHcekaN2/ORxXymUEgAn9Gc74517r4J+y1OjKPJzdUNMO+Ns70
   7EqEOoVFxzzpHUOQu02u2R4LAHW9nBPthonNWavsGGHDQZV9x8eerSVSn
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xeB6+cUldNGZTvDItGjVErmqjASTCsTVVfkPWK+6B2Rqqv5Hv4n6V7J9v6Tl/NsoMBR8fdwpuy
 auNR9FNlKJHExAJ6L3DIz5rfs/gdicgXRM71dDSYfZSu9WF1Nzw8llywlQ+QQ6Cuh2nEzOl/pV
 yPqQH1MTHF5Gb83QuCrgthhX0dk204VXcoZR8aMWhEw6CHS2x014BFOShN7ncfhqPwAnjr+YVZ
 Orm2iTV2v7dXFCY2Rr48afLqC40tLiL0bNjHZOjwGJf/rsTOi/EnbStdcnfngtzr9Y7MOaJx7+
 2wyRtrKAUQ4db7TVnTxuUO/F
X-SBRS: 5.1
X-MesageID: 52484249
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ith7NqFoh3gH0OgxpLqEP8eALOsnbusQ8zAXPhhKOH5om7+j5q
 WTdZUgpGXJYVkqNk3I9erqBEDEewK+yXcX2/htAV7BZmjbUQKTRelfBMnZowEIcBeSygcp78
 hdmt9FZOEYY2IRsS+w2njdLz9p+qjhzIm4werRi2xgQmhRGsddxhY8BwjeCUtsS2B9dOME/F
 nw3Ls9m9OPQwVuUviG
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52484249"
Date: Mon, 6 Sep 2021 12:21:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, "Tim
 Deegan" <tim@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 01/51] build: introduce cpp_flags macro
Message-ID: <YTX5oi25Ac3ANEiU@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-2-anthony.perard@citrix.com>
 <ba3cfb06-1d89-ff62-1012-6edc2a9c5259@suse.com>
 <YTXoCQ3SSvN4eU/C@perard>
 <280c5579-ee62-ed36-1f08-58fe5b9ca34f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <280c5579-ee62-ed36-1f08-58fe5b9ca34f@suse.com>

On Mon, Sep 06, 2021 at 12:30:07PM +0200, Jan Beulich wrote:
> On 06.09.2021 12:06, Anthony PERARD wrote:
> > On Thu, Sep 02, 2021 at 12:08:58PM +0200, Jan Beulich wrote:
> >> On 24.08.2021 12:49, Anthony PERARD wrote:
> >>> +# To be use with $(a_flags) or $(c_flags) to produce CPP flags
> >>> +cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
[..]
> Well, yes. This way one could also pass more than just the expansion of
> either of these two variables. The thing that made me think of the
> alternative is the comment: Would you mind if I inserted "e.g." in there,
> to make clear this isn't limited to these two variables?

Adding "e.g." is fine. Thanks.

-- 
Anthony PERARD

