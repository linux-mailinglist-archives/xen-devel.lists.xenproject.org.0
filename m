Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AB709C38
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 18:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537185.836084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02kU-0001gq-H0; Fri, 19 May 2023 16:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537185.836084; Fri, 19 May 2023 16:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02kU-0001e1-Cx; Fri, 19 May 2023 16:14:34 +0000
Received: by outflank-mailman (input) for mailman id 537185;
 Fri, 19 May 2023 16:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1HX=BI=citrix.com=prvs=496750f7c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q02kS-0001dp-Rf
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 16:14:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aff3cfb-f660-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 18:14:29 +0200 (CEST)
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
X-Inumbo-ID: 3aff3cfb-f660-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684512869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8o8MPTru8/h22iKlQ9DAEThyK8DJTq1+pdxNIMWl4cs=;
  b=XV12eS/CwRQotC7IL5wXrWc+BnMZfqIlq4P/Gakfz2SMKyT0LCHNCRY5
   ow/L9IgY1zijOKyzqruCzRg7t4purK9Pyi82LFAvutXsWMgpvUlFCSLKn
   o5twulJkrXrBoYuQzJQtVw7GKYInj6nzKvcL8UtcTBneJtZQuGUrPAnD5
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112149145
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:KXvFTK03K+ZCO7JZCvbD5Rhxkn2cJEfYwER7XKvMYLTBsI5bpzMDn
 GUXDGiAPf6JZmqmeNxxa4uyoxwOsJ6GzYdqGwVopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFnNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfUX9q9
 PZBFSk0XzuKvLqv+52XZrhGr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwPxxrJ/
 z6bl4j/KixKFdKb2WCYyyiDgN+IpyDpfIM8OrLto5aGh3XMnzdOWXX6T2CTq/SjllS3Xd4ZL
 kUO4zcvtoA77kntRd74NzWnpFaUsxhaXMBfe8Uz8AyXw7DYyxqYDGMDCDVGbbQOjMIqSCZs9
 liYksjBDCZq9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIaqg9yzEjH9x
 RiDti14jLIW5fPnzI3iowqB2Wj14MGUEEhsvF6/sn+ZAh1RNJCBZobx1EHi3N1JF96AdXatk
 Ckusp3LhAwRNq2lmCuISeQLObim4feZLTHR6WJS84kdGyeFoCD6I90JiN1qDAIwa5tfJ2e1C
 KPGkVkJjKK/KkdGekOej2iZL80xhZbtGt3+Phw/RoofO8MhHONrEcwHWKJx44wPuBJ0+U3cE
 c3BGSpJMZr9IfoP8dZOb71BuYLHPwhnrY8pebj1zg68zZ2Vb2OPRLEOPTOmN75psP/f/FWJq
 IgBZqNmLimzt8WnOEHqHXM7dwhWfRDX+7itwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoqws8x
 VnkAhUw4AOm1RX6xfCiNigLhEXHAcwu8hrW/EUEYT6V5pTUSdr2tP9GKsVpJ9HKNoVLlJZJc
 hXMQO3Yatwnd9gN0211gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:saJ6wa8SnLrrsDucaohuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3AJMGVhWv/quISiKaLB49YFA5k6It1bFncxi7tOna?=
 =?us-ascii?q?JIm9SEKSuZnO8qYlNxp8=3D?=
X-Talos-MUID: 9a23:AjuNpAXCJNR51A/q/AK8pT9mJJ112v6BDnBKq5YUn8iqGyMlbg==
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="112149145"
Date: Fri, 19 May 2023 17:14:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>
CC: <xen-devel@lists.xenproject.org>, <wei.chen@arm.com>,
	<bertrand.marquis@arm.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xendomains: Only save/restore/migrate if supported
 by xenlight
Message-ID: <d52c31c7-57b1-41c1-af35-a9b847683c0a@perard>
References: <20230322135800.3869458-1-peter.hoyes@arm.com>
 <fa320fd7-31fa-4e96-a804-172e70ef1c80@perard>
 <6b98b95d-d737-5495-9c03-7857886cb1ce@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6b98b95d-d737-5495-9c03-7857886cb1ce@arm.com>

On Thu, Apr 06, 2023 at 03:57:12PM +0100, Peter Hoyes wrote:
> On 04/04/2023 17:28, Anthony PERARD wrote:
> > On Wed, Mar 22, 2023 at 01:58:00PM +0000, Peter Hoyes wrote:
> > > From: Peter Hoyes <Peter.Hoyes@arm.com>
> > > 
> > > Saving, restoring and migrating domains are not currently supported on
> > > arm and arm64 platforms, so xendomains prints the warning:
> > > 
> > >    An error occurred while saving domain:
> > >    command not implemented
> > > 
> > > when attempting to run `xendomains stop`. It otherwise continues to shut
> > > down the domains cleanly, with the unsupported steps skipped.
> > The patch looks kind of ok, but shouldn't $XENDOMAINS_SAVE be set to an
> > empty string in the config by the admin instead?
> > 
> > Or is the issue that $XENDOMAINS_SAVE is set by default, even on arm* ?
> Yea the default is the issue. We are building for embedded, using Yocto, so
> there isn't really an admin.
> > 
> > Maybe it's easier to check that the command is implemented at run time
> > rather than trying to have a good default value for XENDOMAINS_SAVE at
> > install/package time.
> 
> It would be cleaner to do this at build time for sure, but I'm not sure the
> autotools config file approach for sysconfig.xendomains.in can handle the
> logic for this?

I think that possible, we can already change config in ./configure based
on the CPU.

I'm preparing a patch.

Thanks,

-- 
Anthony PERARD

