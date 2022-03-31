Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB24EDB9F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 16:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297008.505784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvh1-0006uV-So; Thu, 31 Mar 2022 14:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297008.505784; Thu, 31 Mar 2022 14:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZvh1-0006sg-Ov; Thu, 31 Mar 2022 14:22:31 +0000
Received: by outflank-mailman (input) for mailman id 297008;
 Thu, 31 Mar 2022 14:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCIW=UK=citrix.com=prvs=082fe6e5b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nZvh0-0006sY-Gg
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 14:22:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd800a4-b0fd-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 16:22:29 +0200 (CEST)
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
X-Inumbo-ID: fdd800a4-b0fd-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648736549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DxBidS46ZaAUMJQiyfYz3anhmK0oiE1u429KTk3QzfE=;
  b=L1nfoQaBtqo8gyTwD0rQ4d/TTm+6eqbwTBbarvWqqUBJj8MAXEWluUEU
   6LZ//niAo49uVmkMD7CJCIP6hrej56XXGebbT7CIkiVAVwPJFTY0DtsrE
   etO1LK5N7O3e5t22i2fU1ZC/yW/vcypfuQ+RPyB4ndDr4LDod3fE+PECv
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70053304
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:s61phajQri2RpI5UR04JmWvpX161ZBAKZh0ujC45NGQN5FlHY01je
 htvX2nUPPqJYmb1eIhwadzlpBwP6MeBzoNnT1Y+ryoxFi8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFjU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTsSPJHSybwBaTR7PnpMEaxc1pnIM3fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmI3MU+bO0En1lE/I64Cn/v2uCbDUxJ4qHiUpqgepEfWw1kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmyp/Wjm1O9c91aI
 k0QvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l9pHW3xjIXnQ+Yx1sM+4KtdUYYzM42
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2rSxBXSkYn/miLiO0+T2VncywyhqZHSJuLezlWGBzn1hu+ViWPMWmBJ1bQ5xasYRGp6ZgPY1
 JThpyR4xLpUZX1qvHbRKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aJW+3P
 hKM51kMu8I70J6WgUlfOdjZ5yMCl/WIKDgYfqqMMoomjmZZKmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dg5SdyFhVcGr86S6tIere2JbJY3oMNeJqZtJRmCvt/o9ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:3FLT1alN8eJuDHhFwe0Nkgt3QmPpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="70053304"
Date: Thu, 31 Mar 2022 15:22:24 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xl: Fix global pci options
Message-ID: <YkW5IEbAyumopQsG@perard.uk.xensource.com>
References: <20220330181741.30334-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220330181741.30334-1-jandryuk@gmail.com>

On Wed, Mar 30, 2022 at 02:17:41PM -0400, Jason Andryuk wrote:
> commit babde47a3fed "introduce a 'passthrough' configuration option to
> xl.cfg..." moved the pci list parsing ahead of the global pci option
> parsing.  This broke the global pci configuration options since they
> need to be set first so that looping over the pci devices assigns their
> values.
> 
> Move the global pci options ahead of the pci list to restore their
> function.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

