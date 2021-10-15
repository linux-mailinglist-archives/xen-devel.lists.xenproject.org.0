Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613DC42F84F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 18:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210898.367923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQAj-0001Tf-AN; Fri, 15 Oct 2021 16:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210898.367923; Fri, 15 Oct 2021 16:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbQAj-0001RD-6U; Fri, 15 Oct 2021 16:35:05 +0000
Received: by outflank-mailman (input) for mailman id 210898;
 Fri, 15 Oct 2021 16:35:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHjW=PD=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mbQAh-0001R7-0W
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 16:35:03 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e50782c0-ca76-4f93-a9cc-c373648bc745;
 Fri, 15 Oct 2021 16:35:02 +0000 (UTC)
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
X-Inumbo-ID: e50782c0-ca76-4f93-a9cc-c373648bc745
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634315702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IZiw5vPjhEM2fua8cVYdPOJhCw6NFmvBcfSCThV3mtE=;
  b=beqyZoVNsYl+jDkoTmMfey7wqd4VbsjA7iMH/cIiC7mAfpAZ08oDIv0N
   9dR7YuvnRYZ1PoubX8QBhnYHWE7LNvIimCBWa9dMimPlI5sWPDj1X1hXU
   AVb/iVLncPTB46xyaFOwYN/oZizUvW3g4lvgQz7aCkvMX84q0VZ3tJg/T
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tcQGgFACdWKt2FUBOCxs0CLU0oKHmJjlAddCkbrzh9kocRfAIVPFVwjkplxYeLTvYn57E48I3R
 Katd0vEdV6DnLxUfr+CVhR/Kv94w46zgVnH4Z0zRkUwJ6lYfy+OVynmjHvQ+7IsI5JVHl8sc64
 C53Ibz7gPTqq5e29cbmBfAt1IQEIoE/37RsHR0K+CCwpeSzp9juWWCqN+u2RbHz4z1bOZE2dXe
 g88JHGbjIRziLx0EMnIc+4k+T1O1LZ93tnJnZLwnmcgr1aeLjSrMj2fCa8G2SdvLCt6448IBwk
 nje9F8y0Nz70xkHdQESy9Z5a
X-SBRS: 5.1
X-MesageID: 54868458
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BnPcy69rH+yR/xb//q56DrUDFHmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 jQaXmmGbv6OZzP0f9l2bIu/oBxSv5eAzdRiSApsq3w8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh81
 Mhj6rupETskZLKdh/Y3cygHLQZxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0STaiOO
 5dJAdZpRBviOhliM3ATMpY3k/2twX76I2JqjWvA8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKg4eHMySz3yC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdwajvHeOsxoYWtxRO+438geAzuzT+QnxLmkbTBZRZdo+rsg0SDc2k
 FiTkLvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsQBcYzYbEudkPg0jQH8lxOo6E0ePSFmSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BT39sFsoDGKxT8nxswKDtKcfRGqMZgDZ5
 CBspiSI0AwZ4XhhfgS2S+IRAKrh2f+BNDDN6bKEN8h8r2rzk5JPkIY53d2fGKuLGppbEdMKS
 BWK0e+02HO1FCD3BUOQS9jgY/nGNYC6SbzYugroRtRPeINtUwSM4TtjY0Wdt0i0zhNwy/plY
 srCIZzyZZr/NUiB5GHrLwv6+eRzrh3SOEuJHcyrp/hZ+ev2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09vv3W5
 Uu0RkIw4AO53RUr3y3RMSs9AF4uNL4ixU8G0dsEZgj1hSJ6Otjytc/ytfIfJNEayQCq9tYsJ
 9FtRilKKqknpu3v92tPYJ/jgpZlcRj31wuCMzD8OGo0foJ6RhyP8djhJ1O9+C4LByuxlM0/v
 7z/iV+LHctdH1xvXJTMdfai71KtpnxByuh8aFTFf4tIc0L2/Yk0dyGo1q0rI9sBIAnozyeB0
 1rEGg8RoOTA+tdn8NTAia2egZ2uFu9yQhhTE2XBtO7kPijG5Guzh4RHVb/QLzzaUWr1/oSkZ
 PlUkK6gYKFWwg4SvtMlQbhxzK8469/+nJNgz1xpTCfRclCmKrJ8OX3aj8NBgbJAm+1CsgysV
 0PRptQDYeeVONnoGUI6LRY+arjRzukdnzTf4KhnIEj+4yMrrrOLXV8LYkuJgS1ZarB0LJkk0
 aEqv8tPs16zjR8jM9CniCFI9jvTcixcAvt/7pxKUpX2jgcLy01ZZc2OAyD715iDdtFQPxR4O
 TSTnqfD2+xRy0eqn6DfzpQRMT6xXagzhS0=
IronPort-HdrOrdr: A9a23:4YnJn61BrOuiN9i4ofIDbAqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.85,376,1624334400"; 
   d="scan'208";a="54868458"
Date: Fri, 15 Oct 2021 17:34:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 45/51] build: rework cloc recipe
Message-ID: <YWmtnUmxHYqlmm43@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-46-anthony.perard@citrix.com>
 <be6b4b2d-2b18-820b-43ba-e8e800d97517@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <be6b4b2d-2b18-820b-43ba-e8e800d97517@suse.com>

On Thu, Oct 14, 2021 at 11:33:16AM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > After folowing patches, the recipe doesn't work anymore.
> >     - build: build everything from the root dir, use obj=$subdir
> >     - build: introduce if_changed_deps
> 
> That was some 20 patches ago - shouldn't all make goals continue to
> work at every step?

That would be better yes, I'll look at bringing this patch earlier,
which would probably mean making changes to the rule several more time.

> > First patch mean that $(names) already have $(path), and the second
> > one, the .*.d files are replaced by .*.cmd files which are much
> > simpler to parse here.
> > 
> > Also replace the makefile programming by a much simpler shell command.
> > 
> > This doesn't check anymore if the source file exist, but that can be
> > fixed by running `make clean`, and probably doesn't impact the
> > calculation. `cloc` just complain that some files don't exist.
> 
> Not sure whether that's acceptable - Stefano, iirc it was you who
> introduced this goal.
> 
> Jan
> 

-- 
Anthony PERARD

