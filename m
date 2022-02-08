Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFC4AD592
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268056.461833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNwk-0008FU-Qc; Tue, 08 Feb 2022 10:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268056.461833; Tue, 08 Feb 2022 10:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNwk-0008Dd-NK; Tue, 08 Feb 2022 10:42:06 +0000
Received: by outflank-mailman (input) for mailman id 268056;
 Tue, 08 Feb 2022 10:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWzo=SX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHNwj-0008DT-0q
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:42:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9c1504-88cb-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:42:03 +0100 (CET)
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
X-Inumbo-ID: bf9c1504-88cb-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644316923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T+yhHlH9l734PUFCoISLUYy+wVgqoXvgM7mDxOE3xWs=;
  b=Tmsx8LpMxPloqzrUvuu24drKfGebP9mj8jzYv7Tsp2wev0UQnA+ZgAM2
   ZuakEagKCJe2c99Gufwp8aW85IeW4ua6si6qCtVps1BYbi2v9VQBFWRRG
   0gcBdoivQs5ysxf4x6y7DkBTPmWE1gVT8yy48J+cznuUlTfwq1PxNO8H2
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lXhJmQvMdzhb29Bb5CJgDKGIcT0CcXcDATyzK6SoyCQ4r+tK4VtSNc6dSEELvjnXVCXW2wd+Pm
 JwKwYFL52pBmiWULSGu6QWKnhoVc/tiE66TF+sM1HoSJu6vFVhligDT2HVlstmF9pSOji1E4vk
 xqvyI6Jk4qtFIrnM1FqrKV4iZvpSAJ01ErxPa3fIu57BIz/f+k+na7rJ6LfaJkN1bGvJ4IeISJ
 PX+reJWmP0XaBoGvBPGsF5hAi6dlukVqt2KfZTLFuYJ1xxJHZTHutal7qztgfMQrKgIL6ztVBj
 Qp2HwtefiwNUFWi9VuZoq6Mo
X-SBRS: 5.1
X-MesageID: 63720056
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+gHE6a6UDaX1smoEhGXzUgxRtMPAchMFZxGqfqrLsTDasY5as4F+v
 jZKD2uPO/reMWTzeI8nboTn9x5Tv5KHzdBnTgQ6/3hgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2t4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zj
 +dShJeLT1gVL7zjtdQfcBNyGHh0IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRqmEP
 5JEN1KDajz8PwFOAWsoC6s4xu2q3l3aVmRxs2mK8P9fD2/7k1UqjemF3MDuUt6ASNhRn02Yj
 nnb5Gm/CRYfXPSd1D6E/3SEluLJ2yThV+o6D6ak//RnhFmSwG07CxAMU1a/5/6jhSaWWd1FL
 FcP0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTWg2UjoO2N+8nJAioT//TPVpOqXshMKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7EFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vWsWyKRBaJ9sldrVj
 Kj741I52XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8yORfBhjmzwRJ1ysnT3
 Kt3lu72XB4n5VlPlmLqF4/xL5d3rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/XrDYeGJORjp+Y8I9NJt8IuSJaYwOzbyWl
 px8M2cFoGfCaYrvc13VMys+M+O2Bv6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:tQVepKDJLNZPH0DlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="63720056"
Date: Tue, 8 Feb 2022 10:41:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/5] tools: remove include/xen-external directory
Message-ID: <YgJI9fqxMd1LwC02@perard.uk.xensource.com>
References: <20220207064147.9585-1-jgross@suse.com>
 <YgFgZADfaoLNor4T@perard.uk.xensource.com>
 <60aa8654-a40f-e5fa-e669-d8fba72a4866@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <60aa8654-a40f-e5fa-e669-d8fba72a4866@suse.com>

On Tue, Feb 08, 2022 at 06:32:10AM +0100, Juergen Gross wrote:
> On 07.02.22 19:09, Anthony PERARD wrote:
> > On Mon, Feb 07, 2022 at 07:41:42AM +0100, Juergen Gross wrote:
> > > The tools/include/xen-external directory contains a header file from
> > > FreeBSD used to generate Xen header files. This series is replacing the
> > > complete directory by a single header with the same semantics.
> > > 
> > > Changes in V2:
> > > - remove stale comment in patch 1
> > 
> > Just need to fix the build now, otherwise, the series looks fine:
> > https://gitlab.com/xen-project/patchew/xen/-/pipelines/464803007
> > ^ xentoolcore conversion seems unfinished.
> 
> Hmm, weird.
> 
> Seems I did only an incremental build, but I think it should have failed
> nevertheless. I suspect something is wrong with the dependencies.

Indeed, the dependencies aren't loaded. I've prepared a patch:

https://lore.kernel.org/xen-devel/20220208103959.21102-1-anthony.perard@citrix.com/

Thanks,

-- 
Anthony PERARD

