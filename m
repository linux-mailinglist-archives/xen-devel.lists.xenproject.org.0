Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E41F7BBA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 18:41:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjmjN-0003Qi-Sw; Fri, 12 Jun 2020 16:40:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjmjM-0003Qd-MA
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 16:40:36 +0000
X-Inumbo-ID: 6b56c6b8-accb-11ea-b5f2-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b56c6b8-accb-11ea-b5f2-12813bfff9fa;
 Fri, 12 Jun 2020 16:40:27 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gZoIN09Vz+IXXufYqWHQtjrhp2XgWt0qAXqDketWTyqVHlzRn/VDiO5yqmD6rcGabUIEZmg0WY
 Nq8wycBuRA9bmGo5ovFp0yrjXfucQ4W6Se/LJCFfAQVN1X8bL/X2DaTChhbVDEBk8O7MOPPtMm
 TwpTEa5z6IthnvZJd4Jx1aPrRtEy7xWZjRroFzbFW4vU7OVYWy4ZWOs5pXUdxTLxAn/hV20BnU
 Tnzu1990lxZNYHn3j5bT2MSIs+a/JQxl4f3putSTH+dbe1BdGpqED1/I5NYka9OpLsP/T+NlU5
 PWc=
X-SBRS: 2.7
X-MesageID: 19922826
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,504,1583211600"; d="scan'208";a="19922826"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24291.45045.185355.587474@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 17:40:21 +0100
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH for-4.14] tools: check go compiler version if present
In-Reply-To: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Nick Rosbrook writes ("[PATCH for-4.14] tools: check go compiler version if present"):
> Currently, no minimum go compiler version is required by the configure
> scripts. However, the go bindings actually will not build with some
> older versions of go. Add a check for a minimum go version of 1.11.1 in
> accordance with tools/golang/xenlight/go.mod.

> diff --git a/tools/configure.ac b/tools/configure.ac
> index a9af0a21c6..9d126b7a14 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -338,6 +338,13 @@ AS_IF([test "x$golang" = "xy"], [
>              AC_MSG_ERROR([Go tools enabled, but missing go compiler])
>          ])
>          golang="n"
> +    ], [
> +        AX_COMPARE_VERSION([$GOVERSION], [lt], [1.11.1], [
> +            AS_IF([test "x$enable_golang" = "xyes"], [
> +                AC_MSG_ERROR(["Your version of go: $GOVERSION is not supported"])
> +            ])
> +            golang="n"
> +        ])
>      ])
>  ])

I don't understand this code.  Why are you checking $enable_golang in
your new code whereas the old code checks $golang ?  I actually read
the generated code trying to see where $golang is set and AFAICT it is
only ever set to n ?

This is all very weird.  Surely golang should be enabled by default
when the proper compiler is present, and disabled by default
otherwise.  I think this effect will be quite hard to achieve with
AX_ARG_DEFAULT_ENABLE.  Probably you should be using AC_ARG_ENABLE
and doing the defaulting yourself so that you can use a computed
default etc.

The docs are not clear but reading the code, AC_ARG_ENABLE sets the
variable enable_foo to "no" if --disable-foo is given, to "" if
--enable-foo is given, or to the value given to
--enable-foo=VALUE.

Ian.

