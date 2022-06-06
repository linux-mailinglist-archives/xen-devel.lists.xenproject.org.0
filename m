Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0DF53E4D9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342573.567619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyD4q-0003FX-IF; Mon, 06 Jun 2022 13:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342573.567619; Mon, 06 Jun 2022 13:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyD4q-0003D0-FX; Mon, 06 Jun 2022 13:47:28 +0000
Received: by outflank-mailman (input) for mailman id 342573;
 Mon, 06 Jun 2022 13:47:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Jy1=WN=citrix.com=prvs=14988d3bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nyD4o-0003Cu-Tg
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:47:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31ee5460-e59f-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 15:47:25 +0200 (CEST)
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
X-Inumbo-ID: 31ee5460-e59f-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654523245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M7xMWiHZ0GdGm1TDPXD0V79kCqdCPGQN/V3VFFtCoIQ=;
  b=TeJWzCzPKh3zTlBhmmWbgBCFJhk0trevg9UYW2NQ80ODMVW+kxdEmEi0
   AcTYc0JiCGSIFcR+FxUiWghxj67ZnsXrkqkzszvMDM6AzHQTCCmZcW/Qz
   6Fqf1jpwEiZstH9fZUzKoYZ+Ns3N0noT72BTmKt7Ph1Pw2DY1ItYlsZWG
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72295056
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3FpayqjKZUI/GXdFftucM2UjX161GxAKZh0ujC45NGQN5FlHY01je
 htvDD3QbqyMZzf2f90lOo+x9E1SvsXTzNBlSgRrqitjQywb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSkIFa7Xibk/aBQCNhglN7Nl2+fLLnfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmA1PUmYPkMn1lE/LdVio/q2iWnGLzxV9W2HgaEI6DTiw1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fUCgvfCzh0q6WtReA
 08Z4Cwjqe417kPDZtv3UgC8oXWElgUBQNcWGOo/gCmP167V7gCxFmUCCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8gxKZOjMEcE05aHUhdFAP/frA+I08gUeaJjp8K5JZnuEZCBmpn
 W3W9nJm2+9M5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSf2MPMvO9/vU5RCIU3c+TPND6m8UzazSsIpKF/vEN9GOSZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8Qdas9w1iOdxrghnnDu7bcmik3yPjOvFDFbIGOhtDbd7Rr1ghE9yiF6No
 4g32grj40g3bdASlQGOqN5PfQ5XdiFrbX00wuQOHtO+zsNdMDlJI5fsLXkJItENc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:6WiQw66y5JWsKtwwtAPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.91,280,1647316800"; 
   d="scan'208";a="72295056"
Date: Mon, 6 Jun 2022 14:47:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 2/4] build: set PERL
Message-ID: <Yp4FZsVKjQcy6Ly6@perard.uk.xensource.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-3-anthony.perard@citrix.com>
 <092852c0-d833-0c7c-1bc4-5d2e86610a4d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <092852c0-d833-0c7c-1bc4-5d2e86610a4d@suse.com>

On Thu, Jun 02, 2022 at 11:01:30AM +0200, Jan Beulich wrote:
> On 01.06.2022 18:59, Anthony PERARD wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -22,6 +22,7 @@ PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null)
> >  export PYTHON		?= $(PYTHON_INTERPRETER)
> >  
> >  export CHECKPOLICY	?= checkpolicy
> > +export PERL		?= perl
> 
> For the intended use, is there a minimum version requirement? If so,
> it needs documenting in ./README (and it preferably wouldn't be any
> newer than from around the times our other dependencies are). And
> even when the uses are fully backwards compatible, I think the need
> for the tool wants mentioning there.

I don't think there's a minimum version. The script works in our
Gitlab CI, or at least the builds don't break.

Yes, it would be better to document the tool, I'll add it to the README.
(We already use it in the toolstack, at least for libxl, so it was at
least partially needed before.)

Thanks,

-- 
Anthony PERARD

