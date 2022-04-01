Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471654EF37C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 17:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297502.506831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naJ5s-0008Gc-AB; Fri, 01 Apr 2022 15:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297502.506831; Fri, 01 Apr 2022 15:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naJ5s-0008Dt-6E; Fri, 01 Apr 2022 15:21:44 +0000
Received: by outflank-mailman (input) for mailman id 297502;
 Fri, 01 Apr 2022 15:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDTg=UL=citrix.com=prvs=083321efb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1naJ5r-0008Dn-1g
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 15:21:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd8df26-b1cf-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 17:21:41 +0200 (CEST)
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
X-Inumbo-ID: 6dd8df26-b1cf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648826501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4GWclumcHhI4jgI+hP2WW5OXUqt9VzxoV9aUpHEXJYo=;
  b=Hm1ByJE8MaukWzShFRAWuulg7bIjeR+Jz7Ki7z7DScwiHg1CU1I1Jkis
   B4O6+f3R9au7fOeeITZPY3DgSLYd/F3LZYwRZ8/AtCVIYfLqrsfHSbHu5
   xJDELlLhc9act/WPV493k+LehDwp0E+5oyw0SdV1WcQuHot9TX5BjHuUr
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67678090
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:r+kkkai79ZZCMjgikXUoh724X161CBAKZh0ujC45NGQN5FlHY01je
 htvXWCHPfaKYmP1Ltpwao6x9xsH6p+AzdZmHQs/rX1mRHsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vU4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQc5O/aUwe8faURVDXtQPKtv8e/7AWfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xN2UxM0SYMkUn1lE/LJU4rcykpSXFUAJq9VnMv44t6Ffz5VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+aLegiaDn0AjkAYsZc
 hFKvHp1xUQvyKC1ZtntWkbg+XWGhEMRRYB+EusT4VGx6rWBtm51GVM4ZjJGbdUnsuo/Sjory
 kKFkrvVONB/jFGGYSnDr+nJ9FteLQBQdDZfPnFcEWPp9vG5+OkOYgTzosGP+UJfpvn8AnnOz
 j+Dt0DSbJ1D3JdQh81XEb0q6g9AR6QlrCZovm07vUr/t2uVgbJJgaTytjA3Ct4acO6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcVxqGn3oSbyLN0NiN2bGKuPGpxbEdMOS
 BWO0T69GbcJZCf6BUOJS9zZ5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziF6Lq
 4wGbZvblk03vS+XSnC/zLP/5GsidRATba0aYeQOHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:uzpfXq1pXznMzD6MBM8MmAqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.90,228,1643691600"; 
   d="scan'208";a="67678090"
Date: Fri, 1 Apr 2022 16:21:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Message-ID: <YkcYf8fJTl+X0JRv@perard.uk.xensource.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
 <YkcRGIy7l48BkZQz@perard.uk.xensource.com>
 <7b129a01-07c7-e856-fb5b-0c7b44a8dac5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7b129a01-07c7-e856-fb5b-0c7b44a8dac5@citrix.com>

On Fri, Apr 01, 2022 at 03:04:44PM +0000, Andrew Cooper wrote:
> On 01/04/2022 15:50, Anthony PERARD wrote:
> > On Fri, Apr 01, 2022 at 04:37:18PM +0200, Roger Pau Monne wrote:
> >> +EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
> >> +
> > I think making modification to $(EMBEDDED_EXTRA_CFLAGS) outside of
> > "Config.mk" is confusing and would be better be avoided.
> 
> EMBEDDED_EXTRA_CFLAGS in the root Config.mk is conceptually broken and
> needs deleting.

I'm asking to remove "-fcf-protection=none" from the broken variable
EMBEDDED_EXTRA_CFLAGS, and instead only modify the CFLAGS variable of
"tools/firmware/".

As this patch show, making modification to EMBEDDED_EXTRA_CFLAGS outside
of Config.mk doesn't work because changes doesn't propagate.

So the modification I've ask for the patch goes toward deleting
EMBEDDED_EXTRA_CFLAGS, like you want.

Cheers,

-- 
Anthony PERARD

