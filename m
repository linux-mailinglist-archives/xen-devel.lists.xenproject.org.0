Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5041DE7A2
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:07:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7O1-0002qi-BI; Fri, 22 May 2020 13:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fqI=7E=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jc7Nz-0002qd-Q6
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:06:51 +0000
X-Inumbo-ID: 194ada16-9c2d-11ea-9887-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 194ada16-9c2d-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 13:06:50 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qZk4mYrVsw+c4Gdzpq6OaABIxRPgsXvG+P+jAtdV+8GmocgIrcBu6PXoETdAGjv6yKRWX3R5kL
 QI3sz9mOtBxwg3YwonKtFdFT1qRKJMfsYlBb9uEStjSVhOaq4cuMI+up5Vxs2Dp1FhEFgdH8p/
 r+HM+kcaBAOp2+8zxUjtsCCfOg1Bl6qaMlHnzN7R8e4JpuhT2jAAOKqNtRigqdaiNk521BKtHW
 8gJ0/CVbtCCE4uRl2CIkr+32hMkqipmchih8csZ7ByJsC+nCbUXqWYUh0ynIjenZRKkkOFe6cu
 CXg=
X-SBRS: 2.7
X-MesageID: 18205861
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18205861"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24263.52837.360685.406105@mariner.uk.xensource.com>
Date: Fri, 22 May 2020 14:06:45 +0100
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH] m4: use test instead of []
In-Reply-To: <20200522112457.6640-1-wl@xen.org>
References: <20200522112457.6640-1-wl@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Wei Liu writes ("[PATCH] m4: use test instead of []"):
> It is reported that [] was removed by autoconf, which caused the
> following error:
> 
>   ./configure: line 4681: -z: command not found
> 
> Switch to test. That's what is used throughout our configure scripts.

The reason for [ ] being removed is that configure.ac et al are
processed by m4 with quote characters set to [ ].

>      APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
>  done
> -if [ ! -z $EXTRA_PREFIX ]; then
> +if test ! -z $EXTRA_PREFIX ; then
>      CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"

If $EXTRA_PREFIX contains nothing (or just whitespace) this expands to
  test ! -z
which only works by accident.  It is parsed ax
  if not (string_is_nonempty("-z"))

Variable expansions in test expressions should generally be in " ".

Ian.

