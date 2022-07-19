Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64C579203
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 06:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370302.601972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDewZ-0001NN-0I; Tue, 19 Jul 2022 04:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370302.601972; Tue, 19 Jul 2022 04:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDewY-0001LU-Tb; Tue, 19 Jul 2022 04:34:46 +0000
Received: by outflank-mailman (input) for mailman id 370302;
 Tue, 19 Jul 2022 04:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s463=XY=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1oDewW-0001LO-Uz
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 04:34:45 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bfe23fa-071c-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 06:34:43 +0200 (CEST)
Received: by mail-vs1-xe33.google.com with SMTP id 125so1928204vsd.5
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jul 2022 21:34:43 -0700 (PDT)
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
X-Inumbo-ID: 1bfe23fa-071c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KxN37o8r5lialnTPBTEdzc7ULFbJA4Z5yiyB3T51vkw=;
        b=G3ktOcJmo8PVJOKfYcjNdXVYvWx5S8QQjxLle6d1sGKgfhjzxZHOkhdQl2f1dIwEh7
         N57cTovsIcLwo7/JcqYqxQHr0qI8aru7cjmHQ+eicraepSXgW0hG4OFzHoDRCKfTI6di
         mHQNH617iG3rCCYeJTblB53/vdyXYLLHNU3puMud+hy2fgjrSvhQQbbaICcH+DATfmY+
         wes7zW7XSnQlqFXh4+Rtv7joEW4/aLvnIMOQHBgKoIvAVcR6XfrxPg1OnOl9sdRjCYFp
         M09b+wSyNg7MM8wTnYruvyyH4KKkGO+AEed6LRPBmy0bvG6Kl3FRXeFyed8X6yArnCfV
         l3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KxN37o8r5lialnTPBTEdzc7ULFbJA4Z5yiyB3T51vkw=;
        b=ByrcQwBPMZm4c7xiRyLRNWx+OTJstF4J+yDC3h+C8kFB5qqk0ni1oLdC5knbu4ZNYa
         CxXc6kjKmNqRjnteGTCfVNmhpX/F6CCy80ZWaObIF7gGruHWVWtDSPSjDoEIOsUIaXvB
         KnTyYE1pc5d8mL3liNjyPSLpNP6+KzUxvn0SmzTN3+qv4OgSEu8Dvm6wtCPWJPwjpXqS
         yuqvPWBODFiYs4pCBHpnlbyb9zsg3Qxl84cr5/2v8ttXhAPsteD9/l0LZIy3iO082Ein
         u2jxP/8xefTzwUYzBspOvjwFAKMZmLRlQUjvxHYVZRbE/n7dRwFcUk6xjkDGUOtiK+1R
         Mtkg==
X-Gm-Message-State: AJIora/tMen0wmWEZvQUIsYPimKlq1fB5lK6CJWDgmI6kHPUoy/UFhrq
	Bfb5PmTxeOLNkep8I1vL3adPyGZyJ2xqwn+HTnulicbKmCY=
X-Google-Smtp-Source: AGRyM1up8TFtlPSzJY427jNjcd2VXBEu852uUcYdftZ8D+462MF4KQ9oZpvB+DN2LhQbRvP9K2OrJXO1+zUewLRar18=
X-Received: by 2002:a05:6102:667:b0:357:6577:a994 with SMTP id
 z7-20020a056102066700b003576577a994mr10446945vsf.77.1658205282412; Mon, 18
 Jul 2022 21:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657792818.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1657792818.git.bertrand.marquis@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 18 Jul 2022 21:34:31 -0700
Message-ID: <CACMJ4GZYweNCWAmWEru8eLLbHRSMkZf82CzFO0Y74mtQc5LqsQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Yocto Gitlab CI support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 3:10 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> This patch series is a first attempt to check if we could use Yocto in
> gitlab ci to build and run xen on qemu for arm, arm64 and x86.

Hi Bertrand, thanks for posting this.

I'm still making my way through it, and should be able to speak more
to the OE/Yocto aspects than the Xen automation integration but at
first pass, I think that this is work in the right direction.
A few quick early points:
- The build-yocto.sh script is clear to understand, which is helpful.
- The layers that you have selected to include in the build are good.
Might be worth considering using openembedded-core, which is poky's
upstream, but I think either is a valid choice.
    - listing the layers one-per-line in the script might make it
easier to patch in additional layers downstream, if needed
- The target image of 'xen-image-minimal' is the right start; it would
be nice to be able to pass that as an input from the dockerfile to
allow for using this with other images.
- Possibly worth mentioning somewhere in the series description that
this introduces coverage for x86-64 but not 32-bit x86 guests - it's
the right choice given that this is just booting to a dom0.

Christopher

> The first patch is creating a container with all elements required to
> build Yocto, a checkout of the yocto layers required and an helper
> script to build and run xen on qemu with yocto.
>
> The second patch is creating containers with a first build of yocto done
> so that susbsequent build with those containers would only rebuild what
> was changed and take the rest from the cache.
>
> This is is mainly for discussion and sharing as there are still some
> issues/problem to solve:
> - building the qemu* containers can take several hours depending on the
>   network bandwith and computing power of the machine where those are
>   created
> - produced containers containing the cache have a size between 8 and
>   12GB depending on the architecture. We might need to store the build
>   cache somewhere else to reduce the size. If we choose to have one
>   single image, the needed size is around 20GB and we need up to 40GB
>   during the build, which is why I splitted them.
> - during the build and run, we use a bit more then 20GB of disk which is
>   over the allowed size in gitlab
>
> Once all problems passed, this can be used to build and run dom0 on qemu
> with a modified Xen on the 3 archs in less than 10 minutes.
>
> Bertrand Marquis (2):
>   automation: Add elements for Yocto test and run
>   automation: Add yocto containers with cache
>
>  automation/build/Makefile                     |   2 +
>  automation/build/yocto/build-yocto.sh         | 322 ++++++++++++++++++
>  .../build/yocto/kirkstone-qemuarm.dockerfile  |  28 ++
>  .../yocto/kirkstone-qemuarm64.dockerfile      |  28 ++
>  .../yocto/kirkstone-qemux86-64.dockerfile     |  28 ++
>  automation/build/yocto/kirkstone.dockerfile   |  98 ++++++
>  6 files changed, 506 insertions(+)
>  create mode 100755 automation/build/yocto/build-yocto.sh
>  create mode 100644 automation/build/yocto/kirkstone-qemuarm.dockerfile
>  create mode 100644 automation/build/yocto/kirkstone-qemuarm64.dockerfile
>  create mode 100644 automation/build/yocto/kirkstone-qemux86-64.dockerfile
>  create mode 100644 automation/build/yocto/kirkstone.dockerfile
>
> --
> 2.25.1
>
>

