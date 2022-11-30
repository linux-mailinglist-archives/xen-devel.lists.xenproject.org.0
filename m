Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0063DA89
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449994.707084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ptq-0004WK-KB; Wed, 30 Nov 2022 16:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449994.707084; Wed, 30 Nov 2022 16:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Ptq-0004TI-Gt; Wed, 30 Nov 2022 16:25:30 +0000
Received: by outflank-mailman (input) for mailman id 449994;
 Wed, 30 Nov 2022 16:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQKT=36=citrix.com=prvs=326f52c84=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p0Pto-0004Sv-Rf
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:25:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988cbdf4-70cb-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 17:25:27 +0100 (CET)
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
X-Inumbo-ID: 988cbdf4-70cb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669825527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ga+gI1mDKVulqMUXPWmUjyJ8WnmzxiTH6hZr9qJ6ac=;
  b=IZiQNSx1kDBvwKOVUUnOyy7GdZRCxDTkHjae07EL33z7xHlV2eHZ0vFg
   Dh4EsyUTbL2/8ba9kjF2pobrO1ThJ2OTP931DMPeteml3BPbqFnq+w6Af
   1L9DTDDu0WbAGDvyo+Bp9J/X7teMO2bxposaZ4T9CMSdE6YGkI/r1HjQu
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88412782
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RgkRoKA6FcRjYhVW//7jw5YqxClBgxIJ4kV8jS/XYbTApDkggmYGx
 mQcWD+OOPreZWP3Kd50O4zk8BkBsZLVzYNqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpD5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3/dNC25N9
 aIjKDkHcRqKrOSrmryYRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFKoDTH5oFxC50o
 Erj8W6jUyM6EeCD1DuA/VmP2uHdswHSDdd6+LqQqacx3Qz7KnYoIBYfT1e8rNGyg1SyXN8ZI
 EsRkgI1trQ7/kGvStj7XjW7rWSCsxpaXMBfe8U/6QqNw66S5ByLC2wsRztNLtchsaceTzEwy
 kWAmd+vADV1qaCUUlqU7LLSpjS3UQAFIGlHaSIaQA8t59j4vJp1nh/JVsxkEqO+kpvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZisk3A/YXWL71QNwbpGvbqeu9ALVzvkVee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW8zaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlifdpEmChmbKhQgBdXTAdolhU
 ap3ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOi/KFelbbQXSMr5RAEa4TOP9q
 Y432yyikkU3bQEDSnOPrd57wa4ichDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/09qws8x
 VnkAhUw4AOm1RX6xfCiNigLhEXHAcwu8hrW/EUEYT6V5pTUSdzwtPpBL8tsIeVPGS4K5accc
 sTpsv6oWpxnIgkrMRxHBXUhhOSOrCiWuD8=
IronPort-HdrOrdr: A9a23:l2CC+KqCrdc5WIVk9edn4qQaV5oReYIsimQD101hICG9JPbo8P
 xG+85rtiMc6QxwZJhOo7u90cW7K080lqQV3WByB9iftVLdyQ+VxehZhOPfKlvbdhEWndQy6U
 4PScRD4HKbNykdsS5XijPIcerJYbO8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,206,1665460800"; 
   d="scan'208";a="88412782"
Date: Wed, 30 Nov 2022 16:25:14 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 1/3] automation: Create Yocto docker images
Message-ID: <Y4eD6r0zWVp3Upr2@perard.uk.xensource.com>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <18861c0c9c547959900532e38df11b2d67f0a1cc.1669810269.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <18861c0c9c547959900532e38df11b2d67f0a1cc.1669810269.git.bertrand.marquis@arm.com>

On Wed, Nov 30, 2022 at 12:15:07PM +0000, Bertrand Marquis wrote:
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index a4b2b85178cf..72a5335baec1 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -1,13 +1,18 @@
>  
>  # the base of where these containers will appear
>  REGISTRY := registry.gitlab.com/xen-project/xen
> -CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
> +CONTAINERS = $(filter-out yocto/%,$(subst .dockerfile,,$(wildcard */*.dockerfile)))

Nit: while there, could you use ":=" instead of "=" ? The value of
CONTAINERS is always going to be evaluated by make because it's used as
a prerequisite of "all", so we can at least tell make to evaluate the
value right away.

> +CONTAINERS_EXTRA =
>  DOCKER_CMD ?= docker
>  
> +include yocto/yocto.inc
> +
>  help:
>  	@echo "Builds containers for building Xen based on different distros"
>  	@echo "To build one run 'make DISTRO/VERSION'. Available containers:"
>  	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
> +	@echo "Extra containers (not built using make all):"
> +	@$(foreach file,$(sort $(CONTAINERS_EXTRA)),echo ${file};)

I wonder why the help syntax uses both ${} and $() for make variables, is
it to confuse people? :-)

You can write $(file) instead of ${file}, I think this would be less
confusing. I rarely see ${} been used in make, so seen ${} can be
confusing. I've learned (relearned?) this alternative syntax only a few
weeks ago as it's used by automake or autoconf.

>  	@echo "To push container builds, set the env var PUSH"
>  
>  %: %.dockerfile ## Builds containers
> @@ -16,5 +21,10 @@ help:
>  		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>  	fi
>  
> -.PHONY: all
> +.PHONY: all clean
>  all: $(CONTAINERS)
> +
> +# Remove generated dockerfiles for yocto
> +clean:
> +	rm -f yocto/*.dockerfiles

There's an extra 's', I guess you want to remove "*.dockerfile" instead
of "*.dockerfiles".

You could also add those to a .gitignore, even if there are likely to be
removed by make.


Cheers,

-- 
Anthony PERARD

