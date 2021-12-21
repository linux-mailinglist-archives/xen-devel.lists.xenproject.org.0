Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6F47C5A2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 19:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250543.431551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjQ2-0002GG-55; Tue, 21 Dec 2021 17:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250543.431551; Tue, 21 Dec 2021 17:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzjQ2-0002Df-17; Tue, 21 Dec 2021 17:59:22 +0000
Received: by outflank-mailman (input) for mailman id 250543;
 Tue, 21 Dec 2021 17:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1Ud=RG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mzjQ1-0002DZ-1d
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 17:59:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b67d5bac-6287-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 18:59:18 +0100 (CET)
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
X-Inumbo-ID: b67d5bac-6287-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640109558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MWaXm4MaAdY1eC5fm5cMVLglGzsjnHHOwvVMIjmLtLM=;
  b=Iqac69plWh4rtkVvjjeDeKqeS559J9WQ715CmgYKqIetFEu51n9pWCF4
   IEoALoaWH/F/XZjMfBz2OGAgROAcn7ex3wY7FsuWiiy7Y7NxxAhp96h6K
   IZPFNlAqxdgTsAorwr4giMxnF769q8WTDLa4biSxC/IHgldewJOJ0dInu
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KxFlsOZ6bsiFzCavI6Zpe4RZh+At8PEn/TOfL3tW2vaEp7gCdB4pneAJRj26OszjC5TgqEThBB
 hY0bOaYlj/KZWLYDG1fmmaA3Du7wWuMATIFv20KmducIjE4HiWW0WM60N4mcDIqDxS2sD0ESU0
 RMIYqmpaARkxRt6jzuJmvhFE1Md23E1AjYrLBldMwF13nrvHeyxRBSkiWfScjMZS4XVmNFWA2m
 rVsgAEmjyOexlkza5GfakHXXK8mOQsFybAQgfVfW0zxT5fiu/GnBJqNe5fBYVuyti0JjSuPE2z
 Wh6XfwAAZjW0SprvZHy01aA+
X-SBRS: 5.1
X-MesageID: 60468344
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yH8Qg6PqQecBHSLvrR1UkMFynXyQoLVcMsEvi/4bfWQNrUoj1TFRx
 zQXUGGCPq7ZM2X0Ktlzb46/9EwHupXWnNUxHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400g6w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozOmxvBh0
 IUVjMyxYjsrMLXztdY4SgYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm9s2JAVQaq2i
 8wxdRBkVB/SRhdzNHhKCYgngru6gUbGWmgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKg4eHMySz3yC6H3ErubJgSP8XpNUDLCi/+RmqFKWz20XThYRUDOTo/ajjVWlc8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmLu6EFKN7ufMlGOzEhQXI3c9SB0hVBRQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r8tlshDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGGN6bKMN8N4n9hIx5JFVdoIiN2ZDB02WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMoIWOMUuKFXep3sGiausM4bFyhBEfUYXY
 8jzTCpRJSxCVfQPIMSeGo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9yr2Vo
 yrjAxAAkzISRxTvcG23V5yqU5u3Nb4XkJ7xFXZE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:8veenay6BtuMpjYloiI4KrPw3L1zdoMgy1knxilNoHxuH/BwWf
 rPoB19726StN9xYgBFpTnkAsO9qBznmqKdjbN+AV7AZniChILLFvAA0WKK+VSJdxEWntQ36U
 4KSdkdNDSfNzlHZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60468344"
Date: Tue, 21 Dec 2021 17:59:11 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH 41/57] libs: Remove need for *installlocal targets
Message-ID: <YcIV71oLtJQEvLSE@perard>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-42-anthony.perard@citrix.com>
 <bc5bc497-d1a0-007a-802f-e411159fb88e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bc5bc497-d1a0-007a-802f-e411159fb88e@suse.com>

On Tue, Dec 07, 2021 at 02:20:29PM +0100, Juergen Gross wrote:
> On 06.12.21 18:02, Anthony PERARD wrote:
> > There is no need for an extra "installlocal" target, we can use
> > double-colon rules instead.
> 
> Doesn't that mean that with the ultimate goal of including all
> Makefiles of the tree that all "install" and "uninstall" rules in the
> tree will have to be double-colon rules?

So, the install targets will be double-colon but for a different reason
(because of the framework been used). All the "install" target will
actually have different name, they will be prefixed by the name of the
directory where the Makefile is.

For example, "install" in "xl" will be named "xl/install", but there
will be something that will allow to run "make -C xl install" which will
call the rule "xl/install".

> With above remark I don't see how tools/libs/stat/Makefile can be left
> unmodified, as it includes libs.mk and it contains an "intall:" rule.

I've missed that one, just because ./configure doesn't allow to enable
the binding...

Thanks,

-- 
Anthony PERARD

