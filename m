Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFE72C6F8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547165.854424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iEc-0006t9-QX; Mon, 12 Jun 2023 14:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547165.854424; Mon, 12 Jun 2023 14:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iEc-0006rI-My; Mon, 12 Jun 2023 14:09:30 +0000
Received: by outflank-mailman (input) for mailman id 547165;
 Mon, 12 Jun 2023 14:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COfM=CA=citrix.com=prvs=5202ad488=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q8iEb-0006rC-TY
 for xen-devel@lists.xen.org; Mon, 12 Jun 2023 14:09:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd309563-092a-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:09:27 +0200 (CEST)
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
X-Inumbo-ID: bd309563-092a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686578967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+AjCExZWctvWDjgm8onw62W7TsimG4o7nTS8X4gt0Y=;
  b=NAH4kiaPJ2liZNzX/OJHyAHkz7lPV9hWkN/ztAUVT9l5LqdCAQT1/XYN
   or53kgyOTDzqKSaaIRMPKmJ0zA70RS9e+lJorx+3O5yKm5h+lJBIRcwxT
   0Y245qAVkXZUsTcSJXrSpguhnXxysiuDOhtGzJs++2jKvz1yDXQgKMgOK
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111219631
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:FIBFEa3sjYjnny+QevbD5ZF2kn2cJEfYwER7XKvMYLTBsI5bp2RVy
 TBJWm+Baf2LNzbwL99wYdji8kJXvMKGm9NqTwJopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJnP6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEXxo0
 vJGBG82Zz+Zh/Ob7pCxG+p0v5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwMxB/J+
 Dmfl4j/KgATG/KW2Sugy2uLiN/RoRLaQJ5PN6Lto5aGh3XMnzdOWXX6T2CTv/ijh1W+HdFCL
 kUO0i4vq6Eo8wqsVNaVdw21pjuIswARX/JUEvYm80edx6yS5ByWbkAGQSRGc8cOr9ItSHoh0
 Vrht9H0AT1itpWFRHTb8a2bxRusOC4eIGkeIyAZTBcZ5MXLpIA1hwjICNF5H8adlcHvEC332
 HWGoTYWgK1Wic8Qy779+VHBiiir4J/TQWYd7wHaTiSv4wV/aYONY42u4ELcq/FaI+6xS1Cdv
 HkJho6G6+EUDJyXvCiMRuwXG/ei4PPtGDrYjF10A4g69xyi/neiecZb5zQWDEpzM8VCYjTpY
 UvXuAVezJtSOnKwaulweY3ZI80ywLLpD9jNSvHeZd0IaZ90HDJr5wk3OxTWhTq01hFxz+dmY
 8zznduQ4WgyGblB6zToa7gm2JAxxjET60HZFJPj9kHyuVaBX0J5WYvpIXPXMLBntvPf+1SIm
 zpMH5DUkksCCYUSdgGSqNdOdg5ScBDXELis86Rqmvi/zh2K8Y3LI9vY2vsfdoNshMy5fc+Yr
 yjmCie0JLcS7EAryDlmiVg5MtsDpb4l8RoG0dUEZD5EIUQLb4e197s4fJAqZ7Qh/+EL5acqH
 6dYI5XcWqUXFmqvF9EhgX7V9tUKSfhWrVjWY3rNjMYXIvaMuDAlCve7J1CypUHi/wK8tNcko
 q3I6+8oacNreuiWN+6PMKjH5wro7RAgdBdaAxOgzi97JB+9r+CH6kXZ0pcKHi37AU+anmvBi
 1fHWElwSCuki9ZdzeQlTJus9++Be9aS1GIAd4UHxd5a7RXnw1c=
IronPort-HdrOrdr: A9a23:9pBM0Kl75oQgA8RNxbrZvIfqWK/pDfIA3DAbv31ZSRFFG/Fwwf
 re+8jzsiWZtN9xYh4dcLW7U5VoLkmzyXcY2+gs1NWZLWrbURqTTL2KhLGKq1eMJ8SZzJ856U
 4KSdkdNDSfNykDsS/S2njdL/8QhPWB7aC0laP/4h5WPHpXgnhbnmFE49CgYzRLeDU=
X-Talos-CUID: 9a23:7RP792xZL5kXJ8QFH3C/BgUEB+YCfCPxk0zZDFW4GEtHarfESkeprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AFKM0UA/S5sSbl/pdH6s+/+SQf9ZhzIqnGFEoqIw?=
 =?us-ascii?q?htfmaCR1RIyvAryviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111219631"
Date: Mon, 12 Jun 2023 15:09:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH V3 2/3] libxl: Call libxl__virtio_devtype.set_default()
 early enough
Message-ID: <cdca01bc-487c-4b02-8b0c-710d3adb2095@perard>
References: <cover.1685684586.git.viresh.kumar@linaro.org>
 <61727b8e00dd9acb0621e98528bd5051d3bd5c58.1685684586.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <61727b8e00dd9acb0621e98528bd5051d3bd5c58.1685684586.git.viresh.kumar@linaro.org>

On Fri, Jun 02, 2023 at 11:19:08AM +0530, Viresh Kumar wrote:
> The _setdefault() function for virtio devices is getting called after
> libxl__prepare_dtb(), which is late as libxl__prepare_dtb() expects the
> defaults to be already set by this time.
> 
> Call libxl__virtio_devtype.set_default() from
> libxl__domain_config_setdefault(), in a similar way as other devices
> like disk, etc.
> 
> Suggested-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

