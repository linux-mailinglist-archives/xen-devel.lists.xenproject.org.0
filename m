Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42F77EB52A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633027.987554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wiA-0000ip-Vf; Tue, 14 Nov 2023 16:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633027.987554; Tue, 14 Nov 2023 16:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wiA-0000gX-T3; Tue, 14 Nov 2023 16:56:26 +0000
Received: by outflank-mailman (input) for mailman id 633027;
 Tue, 14 Nov 2023 16:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GB7=G3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2wi9-0000gR-UT
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:56:25 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beb47a91-830e-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 17:56:24 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so32913791fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 08:56:24 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 11-20020a50874b000000b0053e2a64b5f8sm5443287edv.14.2023.11.14.08.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 08:56:24 -0800 (PST)
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
X-Inumbo-ID: beb47a91-830e-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699980984; x=1700585784; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RlfVu03uo+vrVvTuVoiOW3dTHrxtS+J2Ob+Drz7Eoj0=;
        b=jGa8AxhkCxojZyDIyI+znf/UyRU6FMhlK3zJ5OUEkJ3yoZCfVu7CwJOQF0+q7OZ2dj
         9cWctxz6dC3EpDKDMNOwvQgRU9TED0Z5jFqvgYQzI6r9iM7VWvN3/kw4VLniTnpecxrg
         nTMLnxi1Rc5XERAlS4lmegeHfStwnFhHbqPOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699980984; x=1700585784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RlfVu03uo+vrVvTuVoiOW3dTHrxtS+J2Ob+Drz7Eoj0=;
        b=n6BB5qV1qSKz7thFAY9mZf0evk15DzU+UwKn84R+gjeW3X1Q6P8RgSR8hS86G+M94w
         bgy5VsgAnMpPF/1nlDmYPaHyEhLvkDuZ3OpbJ4gDJIWuoVDL7+ou7hweoEyqFtkTHneE
         EKX8MM5F6i3A5h2+Z5keywM6oVuC5Q1FZLuzsII3VQWJvfIB7zUzsuH5sj8EczzE0b6V
         eleqtuyHEGC1YhsXVDN8yGR6UOwE3N7EYS7MQTvRa7dVcd4yMqMuwPJF0rQ2RCfCpupZ
         ANESQUh8Ms9gsHUuEg99J+ZO1RFKyPMf7u7mMaP4IZTT746xpazMHtB6p5fmbQJX9PD5
         gjmQ==
X-Gm-Message-State: AOJu0YxXr3+FDldlDBgcAfg0wvpsHCYqV849loUFGU+kM4xaqDqnnLMu
	FOM+2QzLjB29TeUYDuc27Mq2DQ==
X-Google-Smtp-Source: AGHT+IHwxmFSZVLlnZoI41lkf7yIXhFvDJLacmvauSIzC25CS3eZkky52lP4YGsU/xPFri1NVB8jFg==
X-Received: by 2002:ac2:5145:0:b0:507:cfbc:bf8d with SMTP id q5-20020ac25145000000b00507cfbcbf8dmr6539967lfd.16.1699980984245;
        Tue, 14 Nov 2023 08:56:24 -0800 (PST)
Date: Tue, 14 Nov 2023 17:56:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: set architecture in docker files
Message-ID: <ZVOmt3FI1qzyn6UM@macbook.local>
References: <20231113155701.52052-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311131608200.160649@ubuntu-linux-20-04-desktop>
 <ZVM3Ujf1nsws3Mxr@macbook.local>
 <886f6adb-5651-4c69-9d0b-ff68b5a1b094@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <886f6adb-5651-4c69-9d0b-ff68b5a1b094@perard>

On Tue, Nov 14, 2023 at 03:00:17PM +0000, Anthony PERARD wrote:
> On Tue, Nov 14, 2023 at 10:01:06AM +0100, Roger Pau Monné wrote:
> > On Mon, Nov 13, 2023 at 04:10:24PM -0800, Stefano Stabellini wrote:
> > > On Mon, 13 Nov 2023, Roger Pau Monne wrote:
> > > > Pass the desired architecture of the image in the FROM instruction if the
> > > > image is possibly multi-platform.
> > > > 
> > > > This allows using the x86 Dockerfiles on OS X on arm64 hardware.
> > > > 
> > > > No functional change intended.
> > > > 
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > 
> > > Although I am not opposed to this change, so far we have been using:
> > > arm64v8/alpine:3.18
> > > 
> > > for x86 it is not specified but it would be:
> > > amd64/alpine:3.18
> > > 
> > > Two options:
> > > 1) we add amd64/ everywhere and leave the arm containers alone
> > > 2) we change all containers, including the arm containers, to use the
> > > --platform option
> > > 
> > > I don't think is a good idea to have 2 different ways to specify the
> > > architecture for x86 and arm containers
> > 
> > I'm not an expert on this, but attempting to use (2):
> > 
> > -FROM arm64v8/alpine:3.18
> > +FROM --platform=linux/arm64v8 alpine:3.18
> > 
> > Does not work for me:
> > 
> > % make -C automation/build alpine/3.18-arm64v8
> > docker build --pull -t registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8 -f alpine/3.18-arm64v8.dockerfile alpine
> > [+] Building 1.4s (3/3) FINISHED                                                  docker:desktop-linux
> >  => [internal] load .dockerignore                                                                 0.0s
> >  => => transferring context: 2B                                                                   0.0s
> >  => [internal] load build definition from 3.18-arm64v8.dockerfile                                 0.0s
> >  => => transferring dockerfile: 818B                                                              0.0s
> >  => ERROR [internal] load metadata for docker.io/library/alpine:3.18                              1.4s
> > ------
> >  > [internal] load metadata for docker.io/library/alpine:3.18:
> > ------
> > 3.18-arm64v8.dockerfile:1
> > --------------------
> >    1 | >>> FROM --platform=linux/arm64v8 alpine:3.18
> >    2 |     LABEL maintainer.name="The Xen Project" \
> >    3 |           maintainer.email="xen-devel@lists.xenproject.org"
> > --------------------
> > ERROR: failed to solve: alpine:3.18: no match for platform in manifest sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978: not found
> > make: *** [alpine/3.18-arm64v8] Error 1
> > 
> > That's why I've left the prefixed images alone.
> > 
> > I could prefix the x86 images with amd64/ if that's preferred, I
> > didn't try that option, as the Docker manual suggested using
> > --platform.
> 
> So a few things to know, "--platform=linux/amd64" just select a
> different build of one container. For example, for the "alpine"
> containers, you can see all the different builds available on the docker
> hub, here a few links:
> - Official Docker, Alpine images, home:
>   https://hub.docker.com/_/alpine
> - The different builds: 
>   https://hub.docker.com/_/alpine/tags
> 
> So, for amd64v8, you probably want --platform=linux/arm64/v8

Interesting, I guess I was looking at an outdated documentation that
stated the tag as arm64v8 instead of arm64/v8.

> 
> Then, they are per-architecture repository that make it easier to deal
> with foreign architecture, and probably maintained by a different
> community. e.g. for alpine arm64v8:
>     https://hub.docker.com/r/arm64v8/alpine/
> 
> Those provide a build for a single architecture.

Right, so those two are not actually the same image.  I wonder whether
we would want to uniformly switch to using --platform when possible,
in order to make sure we are using the same (multi arch) image to
avoid surprises.

> 
> 
> Sometime, you actually need to "--platform=*" to select a particular
> architecture, like I did for "jessie-i386.dockerfile".
> 
> 
> One thing I've notice when using --platform is that, if for example I
> use the container "--platform=linux/amd64 alpine:3" then
> "--platform=linux/arm/v6 alpine:3"; later when I only specify
> "alpine:3", it's going to be the armv6, and I think docker is going to
> complain if I try tu use "--platform=linux/amd64 alpine:3" without
> "docker pull" first (or I guess docker build --pull).
> 
> Hope that help.
> 
> So I guess using containers "amd64/*" or "arm64v8/*" is fine, but
> sometime will need to use "--platform=*".

My take is that it's better to use --platform when possible, as then
all platforms share the same image, and the contents of the image
should be more consistent.

I guess we could see about switching some of the image that currently
use a prefix (like the Alpine one) in order to instead use --platform
and share the same image.  I wouldn't want to do it in this patch
however, as the change presented here should be non-functional, while
switching to the multi arch image might introduce changes.

Thanks, Roger.

