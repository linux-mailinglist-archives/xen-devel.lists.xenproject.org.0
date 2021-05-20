Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B4C38B09E
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 15:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130993.245064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljj8t-00028o-AL; Thu, 20 May 2021 13:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130993.245064; Thu, 20 May 2021 13:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljj8t-000260-6t; Thu, 20 May 2021 13:55:15 +0000
Received: by outflank-mailman (input) for mailman id 130993;
 Thu, 20 May 2021 13:55:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vutm=KP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ljj8s-00025u-1n
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 13:55:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ddb2f5c-a05e-4062-a69f-86b4cc5cdf37;
 Thu, 20 May 2021 13:55:12 +0000 (UTC)
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
X-Inumbo-ID: 1ddb2f5c-a05e-4062-a69f-86b4cc5cdf37
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621518912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yFlLm1I8zfA7TB+HeiSRjDEgBiNva7cVF9o20o+moaY=;
  b=HAjtWbtPFhM/CAAtVvWSx9FH721hEpdyL7UDBt7margA11L6CwJgIY1+
   LT0JwKmeUMswd8Br9alwQT8Nrm6PkNEYkQNV76yBn0cvK7kvX3g/G9QMu
   XYh9bTR3vAxJeeplqEPISODxGtgJDpXBl4NwjdLcqneiUZYW+4xTEDw0R
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vSvPhW+kc8LkUwrPyaaLzIOi1LKpa9J3uXbpgex8wzo28tfUnEbJEebzwBKO8sOXoYVs3UEI/9
 lgjZmrc5fa7LiVOyrti6CvhqLCDpFHoOuRt51Wa9K4+bIsGRmb3WsjYcs8TWWyy79wnQMqIcMG
 z2JmO/ANiSTXJIRLqW5xJ6gponXvFDLU0/ZstW6pLXppCaRSXwL7ZanLqHhjiNmRwgacyU+eRd
 TTYm0VEzJJbfa6rnTk4lVEM19VcD7wqiPSj24oS9e8opj1XfE/6DW3C96HkgHb2INbG/t7tFs9
 g94=
X-SBRS: 5.1
X-MesageID: 44341743
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:S1z0Ia4NojWC++t43B5FaQxRtFjHchMFZxGqfqrLsTDasY5as4F+v
 jYdUGmEP/feN2vzeIh+Pti39klV6JXUm9diTlY9rXswHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG66yY6jclkf5KkYAL+EnkZqTRMFWFx03qPp8Zj2tQx2YXgUlvT0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSPCjUIEqLppd8RDUhSEHFCFvVsp4fudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvneL9ELAEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5ZFMmY2M0ibC/FJEg00DaM5u9/4v1WhbDZYgmPM4ps9yXeGmWSd15CyaYGIK7RmX/59n1maj
 nLL+XzjBRMXP8DZziCKmlqzgsffkCW9X5gdfJW0+Pdlj1yUwm07EwANWB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzhCFGcphMEaWNEeen8Y9
 3OGuu7SCWI+ur7FdVnF3OishGbnUcQKFlPudRPoXCNcvYO6+tBi30qSJjpwOPTr14WoQFkc1
 xjP/HBn3eRL5SIe//jjpTj6bySQSo8lp+LfzivQRH7tygpkaIO/a4Ws5DA3Bt4bd93AEDFtU
 JUe8vVyDdzi77nWzkRho81XRtlFAspp1xWG3DZS82EJrWjFxpJaVdk4DMtCyKJV3iAsImSBj
 Kj74lI52XOuFCL1PPUfj3yZUpt1pUQfKTgVfq+NNYcfCnSAXCSG4DtvdSatM5PFyxB3+ZzTz
 ayzLJb9ZV5HWP8P5GfnGI8gPUoDm3lWKZX7HsugkXxKENO2ORaodFvyGAvfNrxmtPvc/m04M
 b93bqO39vmWa8WmCgG/zGLZBQliwaQTbXwul/FqSw==
IronPort-HdrOrdr: A9a23:FFHTtKotqrgZXymw1BhZPsYaV5sLL9V00zEX/kB9WHVpmwKj5q
 WTdZUgpGTJYVMqMk3I9urhBEDtewK/yXcx2+gs1NSZLX3bURWTXfFfBOLZqlWKdkGQmNK1vp
 0QBJSWZueAbmRSvILW4BOzFt4hxNWLmZrY/Nv2/jNMZiUvQ54lwitFJiynMmtQLTM2eqYRJd
 69ze4CjwXlRlgtVOScIRA+Lpb+juyOtLnDJSQeDxoC7gSTiD+zrITxFQOVxH4lIk5y6IZn0U
 Pg1zbh7qGGtfymzxPHk1De9I5Xntz6o+EzePCku4w2Jjn0sAquee1aKtq/lQFwhcSJzko2m9
 /RpBpIBbUU15qoRBDQnTLdnzD61jAg8nnjzkLdr0fCjKXCNUAHIvsEvJledBTB7UomoZVb64
 Jkm0ykl7c/N2KyoMzGjeK4Hi1Cpw6MunwlnvcUj3tDFbcYU7NOkbc7lXklZavo2BiKnrzORo
 JVfbnhzecTe1ibYhnizxNS6c3pVH8rFgyLRVUDt6WuoklroEw=
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="44341743"
Date: Thu, 20 May 2021 14:55:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: QEMU backport necessary for building with "recent" toolchain (on
 openSUSE Tumbleweed)
Message-ID: <YKZqPMNawZUbR4eu@perard>
References: <f7738499f24f6682f4ae1c1c750e30f322dfdbf3.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f7738499f24f6682f4ae1c1c750e30f322dfdbf3.camel@suse.com>

On Tue, May 18, 2021 at 05:24:30PM +0200, Dario Faggioli wrote:
> Hello,
> 
> I think we need the following commit in our QEMU: bbd2d5a812077
> ("build: -no-pie is no functional linker flag").

Hi Dario,

I'm hoping to update qemu-xen to a newer version of QEMU (6.0) which
would have the fix, but that's need a fix of libxl,
    "Fix libxl with QEMU 6.0 + remove some more deprecated usages."
So I would prefer to avoid adding more to the current branch.

The branch stable-4.15 already have the fix if you need, in the mean
time.

Thanks,

-- 
Anthony PERARD

