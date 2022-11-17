Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B9262DDD3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 15:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445251.700348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfl7-0003RU-Iu; Thu, 17 Nov 2022 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445251.700348; Thu, 17 Nov 2022 14:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfl7-0003PN-F5; Thu, 17 Nov 2022 14:20:53 +0000
Received: by outflank-mailman (input) for mailman id 445251;
 Thu, 17 Nov 2022 14:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rqd=3R=citrix.com=prvs=313e1da35=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ovfl6-0003PH-Cl
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 14:20:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0870d475-6683-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 15:20:50 +0100 (CET)
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
X-Inumbo-ID: 0870d475-6683-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668694850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FnX4fENahDu3/FW9ByIAJzGevrB1DCRjbffI84bZ13g=;
  b=EhCGVeFj/td7S2uOXIT8z+hmYEScgztYK1YacwliOof7C8lVrgxCHWYb
   8Qj4rOF9no/mUjAkXb9GBLImkBJ1560avR/iGk4eyslOiuOQUdX02OTeN
   YlWa/qSwh3J1ZzBfxXkyOjFUys0xjhCCZsIQvLXkkJ/yL9aSQO85bCUha
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85458562
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q86T663DieaoKe5iTfbD5SRxkn2cJEfYwER7XKvMYLTBsI5bp2ADz
 DZOUGnUM/ffazOnf4x/bYvg8E4CsJSGz4Q1QVE6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDXsX0
 eMeDRE0RFOyt8an0ay3S9djv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TaGJkIzhvG/
 Aoq+UzIXQNHBe2YzQaB0SiIqsTMuX6iZqgNQejQGvlC3wTImz175ActfWW8pf61m0uvQeV1I
 kYf+jcthaUq/UntRd74NzW6vXqFsxg0S9dWVeog52ml6qfS+RffOWECQRZIctlgv8gzLRQg2
 0WVhdrvCXpquaeMVHOG3r6OqHW5Pi19BU0oaDIATAAFy8L+u4x1hRXKJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjoPSUgc/6wHTX2SkxgB0foioY8qv81ezxelEBJaUSB+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqVJ1Rr0+8RGMwlTgTLB08SBgKEZXPf9RLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquKN4QTO/CdYCfCpXgzPhDIgwgBhWB2yckC1
 YGnndFA5JrwIYBu13KISugUytfHLQhulDqIFfgXI/lKuIdyhUJ5q59fbjNijchjtstoRTk5F
 P4BX/ZmMz0FDIXDjtD/qOb+7TkidBDX/6zepc1NbfKkKQF7AmwnAPK56ep/Jdw7xf8Jyb2Wo
 SvVtqpkJLzX3iSvxeKiMy4LVV8Sdcwn8SJT0dIEYD5EJETPka7wtfxCJvPbjJEs9fB5zO4cc
 hX2U5zoPxmOIxyZkwkggW7V9t0+Kkv22FnWZUJIolEXJvZdeuAAwfe8FiOHycXEJnPfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:eFIadqHGF+qYrM3GpLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.96,171,1665460800"; 
   d="scan'208";a="85458562"
Date: Thu, 17 Nov 2022 14:20:37 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 2/4] tools/tests: Unit test for paging mempool size
Message-ID: <Y3ZDNT/1wzst367d@perard.uk.xensource.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
 <20221117010804.9384-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221117010804.9384-3-andrew.cooper3@citrix.com>

On Thu, Nov 17, 2022 at 01:08:02AM +0000, Andrew Cooper wrote:
> Exercise some basic functionality of the new
> xc_{get,set}_paging_mempool_size() hypercalls.
> 
> This passes on x86, but fails currently on ARM.  ARM will be fixed up in
> future patches.
> 
> This is part of XSA-409 / CVE-2022-33747.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

