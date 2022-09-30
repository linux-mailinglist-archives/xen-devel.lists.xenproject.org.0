Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2C5F08D6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 12:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414099.658193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDA8-0003fc-2t; Fri, 30 Sep 2022 10:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414099.658193; Fri, 30 Sep 2022 10:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDA7-0003d1-Vp; Fri, 30 Sep 2022 10:22:31 +0000
Received: by outflank-mailman (input) for mailman id 414099;
 Fri, 30 Sep 2022 10:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sanW=2B=citrix.com=prvs=26598d84a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oeDA6-0003cv-Dg
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 10:22:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7794aa1-40a9-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 12:22:29 +0200 (CEST)
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
X-Inumbo-ID: c7794aa1-40a9-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664533348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=f3fBpBJIOAqOcNPfoBhqYqPs8zVDx2UAQszlf+fEb6I=;
  b=DgJ4d9HIQAPPbTETs9c/iCSO7Z83jj6ff6R24TLA+9tAhSKSqqmzTh57
   v8iamcTh09NZd6UBW45qZmK70Jn5MV6+AhuQ6BHC3bl07HFaHZL2SxlOx
   g0W2pm7aSrtlKtk3CC/0XXFolv16zSHHOlvj1a8aYWpYvgQqGj0hQ2q9i
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81347272
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wCl5cK+iehaQg2Uvdi/sDrUDVH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WJNWjqBafeDZGCnfIsgbIjnp0kF65fWzNVkQFRvrSo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvnrRC9H5qyo4mtJ5QRmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sprInNQ/
 PomEyw2cTugo7Od5ZyceuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9KoXRGZoPwRzwS
 mTu3l7EDRU6L9+m0T+54muwg82Wn3qkcddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiF6JuAQNHeVZFeIS4RuIjKHT5m6xLGUeUiRIbtBgkcYsXCErz
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsRA4OsofLu5s4gFTJQ8oLOKmulcH4Ai21y
 jyPrS4Wl7gVldQM1aiw4RbAmT3Em3TSZldrvEONBDvjt14nIt7+D2C11bTFxdpcD5SHR1+/h
 2Q/hOO9yLElKL+qpCPYFY3hA4qVz/qCNTTdh3tmEJ8g6ymh9hafQGxA3N1tDBw3a5hZIFcFd
 GeW4FoMv8ELYBNGeIctO+qM59IWIb8M/DgPftTddZJwb5d4b2drFwk+NBfLjwgBfKXB+JzT2
 Kt3k+72VR726ow9llJaotvxNpd0rh3SPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BaZfWlEsAAbKnP3G/HWsvwbcichAG6W3e8ZQLJoZv3CI/cI3eNxMh6ex4INE090ikvuzJ4
 mu8Sidl9bYLvlWecF3iV5yWQOmwNXqJhS5kYHdE0JfB8yRLXLtDG49GK8ZtJ+R7qb09pRO2J
 tFcE/i97j10Ymyv01wggVPV9uSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:CH0UaqyJG+5PVlVro7wKKrPwFL1zdoMgy1knxilNoRw8SK2lfu
 SV7ZMmPHjP+VAssRAb6LS90ca7LU80maQb3WBVB8baYOCEghrMEGgB1/qA/9SIIUSXnYQx6U
 4jSdkdNDSZNykDsS+Q2mmF+rgbruW6zA==
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="81347272"
Date: Fri, 30 Sep 2022 11:22:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <amc96@srcf.net>, osstest service owner
	<osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [xen-unstable-smoke test] 173362: regressions - FAIL
Message-ID: <YzbDWSAiRBhnqKOF@perard.uk.xensource.com>
References: <osstest-173362-mainreport@xen.org>
 <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net>
 <b3242791-3d30-ce72-010c-c31db05b175e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3242791-3d30-ce72-010c-c31db05b175e@suse.com>

On Fri, Sep 30, 2022 at 08:31:20AM +0200, Jan Beulich wrote:
> On 29.09.2022 18:25, Andrew Cooper wrote:
> > On 29/09/2022 17:22, osstest service owner wrote:
> >> flight 173362 xen-unstable-smoke real [real]
> >> http://logs.test-lab.xenproject.org/osstest/logs/173362/
> >>
> >> Regressions :-(
> >>
> >> Tests which did not succeed and are blocking,
> >> including tests which could not be run:
> >>  build-arm64-xsm               6 xen-build                fail REGR. vs. 173347
> > 
> > arch/arm/gic-v3-its.c: In function 'gicv3_its_deny_access':
> > arch/arm/gic-v3-its.c:905:32: error: passing argument 1 of
> > 'iomem_deny_access' discards 'const' qualifier from pointer target type
> > [-Werror=discarded-qualifiers]
> >          rc = iomem_deny_access(d, mfn, mfn + nr);
> >                                 ^
> > In file included from arch/arm/gic-v3-its.c:24:
> > ./include/xen/iocap.h:32:52: note: expected 'struct domain *' but
> > argument is of type 'const struct domain *'
> >  static inline int iomem_deny_access(struct domain *d, unsigned long s,
> >                                      ~~~~~~~~~~~~~~~^
> > cc1: all warnings being treated as errors
> 
> I've sent a patch, but this raises another question: Why does the smoke
> test (try to) build an unsupported configuration? HAS_ITS (which is
> necessary to be set for the issue to surface) has its prompt depend on
> UNSUPPORTED, and (implicitly) defaults to N.

According to osstest sources:
    # ITS driver is required to boot the Hardware Domain
    # on Xen. For now (Xen 4.10/4.11 at at least),
    # will be not built by default and gated by expert mode
    echo >>xen/.config CONFIG_HAS_ITS=y

https://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=ts-xen-build;h=c294a51eafc26e53b5417529b943224902870acf;hb=HEAD#l131

> 
> Jan
> 

-- 
Anthony PERARD

