Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE06C6E78
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 18:13:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513991.795838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOUI-0005KK-6J; Thu, 23 Mar 2023 17:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513991.795838; Thu, 23 Mar 2023 17:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfOUI-0005Hs-2r; Thu, 23 Mar 2023 17:12:30 +0000
Received: by outflank-mailman (input) for mailman id 513991;
 Thu, 23 Mar 2023 17:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8edK=7P=citrix.com=prvs=439de8c1e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfOUH-0005Hm-6v
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 17:12:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e03f7fd8-c99d-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 18:12:26 +0100 (CET)
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
X-Inumbo-ID: e03f7fd8-c99d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679591546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7lEYqgPNVNpZMW75N0/B44VY1tAcWgU+ZE43/GEBEw=;
  b=Y6xbxeuuziCm19uERcFiSrVlf/vlgdfUQQIGBwZgdmREcHnMFxxzTGUw
   o/uUzPtCcXNXNsdL9yTibn420TqKJW58sXOHy3bxP5kgiNtP/8sDrkC9X
   C91QfgYKpjnjCMQDnIqQwiVW//ExeTvewdMwyY4t0Fk6j3PLtr4Le/tsn
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 102479570
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/22ZB6PNZLD5/hnvrR2Bl8FynXyQoLVcMsEvi/4bfWQNrUor3jUDy
 jRMXGuEPfjcY2T8fdhwa9i390MCvZ/Qm95mHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v15C2hAz
 d8IE2kibxWkrfyv0auQTcA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSH5kKzxvH/
 goq+UyiKS5EJsWH7gCh0U++tt6VpQzjXawNQejQGvlC3wTImz175ActfVm0u/6ikWalRslSb
 UcT/0IGqrMp6EGwUpz0Uxi5plaUsxgEQd1SHuYmrgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqU7rqOpCm+ETQUJ2QFIyQDSGM4D8LL+d9pyEiVF5A6TfDz14eucd3t/
 9yUhDMwjbwdte0b7PyU/FXgqSy1t4HiSSdgs207QVmZAhNFiJ+NPtL3uAOFsKYZd+51XXHa4
 iFaxpH2APQmSMjUyXfTGLhl8KSBva7tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JiCN/Ufj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhd9zPhnY
 M3BIZn3ZZr/NUiA5GTeegvg+eVzmnBWKZ37HPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnTg5B
 +13bpPQoz0GCbWWSnCOoeYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6eh+I9A4x/oJx7igE
 7PUchYw9WcTTEbvcW2iAk2Popu0NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:p5xG8Kr94EwcJDZhe7Qw+wEaV5oJeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90dC7MBThHP1OkOss1NWZPDUO0VHARL2Ki7GN/9SKIVycygcy78
 Zdmp9FebnN5AhB5voSODPIaerIGuP3iJxAWN2uqUuFkTsaEJ2IMT0JdzpyfSVNNXB7OaY=
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="102479570"
Date: Thu, 23 Mar 2023 17:12:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: osstest service owner <osstest-admin@xenproject.org>,
	<xen-devel@lists.xenproject.org>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [linux-linus test] 179607: regressions - trouble:
 fail/pass/starved
Message-ID: <352ef06d-f7a7-4633-89f6-2310a6a8dcad@perard>
References: <osstest-179607-mainreport@xen.org>
 <ea0532e0-12c4-674d-392f-216658071f77@suse.com>
 <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com>

On Thu, Mar 23, 2023 at 04:55:10PM +0100, Juergen Gross wrote:
> Anthony, as I can't reproduce the original problem, would it be possible to
> start an OSStest run of the linux-linus test with my patch applied to the
> used kernel?

Sure.

I've created flight 179901. It should CC you and xendevel once done.
I've added the patch on top of commit that was tested by the flight in
this thread:
    https://xenbits.xen.org/gitweb/?p=people/aperard/linux.git;a=shortlog;h=refs/heads/41ab8c98-ee53-8a21-56cb-2c6d801af0b8@suse.com

Hopeful, I didn't make a mistake when setting the flight up and it will
be done tomorrow.

Cheers,

-- 
Anthony PERARD

