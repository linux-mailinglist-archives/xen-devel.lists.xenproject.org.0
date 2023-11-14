Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069BE7EB2F4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632718.987119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utt-0001ND-A4; Tue, 14 Nov 2023 15:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632718.987119; Tue, 14 Nov 2023 15:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2utt-0001LV-75; Tue, 14 Nov 2023 15:00:25 +0000
Received: by outflank-mailman (input) for mailman id 632718;
 Tue, 14 Nov 2023 15:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJ5/=G3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r2utr-0000an-Ps
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:00:23 +0000
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 893b38e5-82fe-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:00:23 +0100 (CET)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso46873985e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:00:23 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm7974927wrz.82.2023.11.14.07.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:00:18 -0800 (PST)
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
X-Inumbo-ID: 893b38e5-82fe-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699974018; x=1700578818; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ap+ICSN9RyqjfxdC8R0tfXT0I3xaiCZxlJKUxY8JHNI=;
        b=oegryhsahx3/EebclXiy6Nir0DekZO5KnVOVdW/K+oe20MM+OTXt53DJ4EZ82h6+6d
         X9Ms/IONczTC5AqmQpn1nqoskeCGjv1Iyuj0Ae7ULqpZCtFnoRBw5xzrMDCjuvTSBHLG
         K+uVIeShvBoq4ejTP/BBPe8SX9olfj8W/il4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974018; x=1700578818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ap+ICSN9RyqjfxdC8R0tfXT0I3xaiCZxlJKUxY8JHNI=;
        b=BvMdGWsa9mm48FL2+f7yRbNdVvOPBlRyO0BAN1fVY8ibLXG6siTyrnh0zZOxOnBIYt
         nC31mz4WMGDkQsRPsP6wl0OjgUj1l2S/t+o21XsZ9NvpMwfzF7QAhyxPzJTrg4mNLx2J
         ZzSm3UXgmx0hySa5/FWJ+Xkxzq6S84vAkeZGFlT1KOpv8dOAx8g34PLY98vX3jLhD3dM
         gljwT2zz/faPOSLx8ehO2QVbpBpc3XOaSoOK5ItfGamsLDofzjmBvnYCyyEz0wi6fiK2
         EpjhDsVicppDZIdisE1vb1/gTQtYq6cypbsnRpCvlPZ0PDWGmVm6aDaEwh20YtwynIiz
         Rm9Q==
X-Gm-Message-State: AOJu0Yz6a1FX/3ceOXVNPo9OxshmqOZHkuZ/xQ3hE1p5TojLLbVv9hTh
	3iwQZ8sf54LgN8ridEXwUIogUQ==
X-Google-Smtp-Source: AGHT+IEXm507ZFWkedeR+sLODM9S9C/0tfgjAolvd0zgUyI+Hd+a5XuJSx4GQiL/geqhf1mMAi/1Fg==
X-Received: by 2002:a5d:4648:0:b0:32d:80e:6893 with SMTP id j8-20020a5d4648000000b0032d080e6893mr6290302wrs.36.1699974018645;
        Tue, 14 Nov 2023 07:00:18 -0800 (PST)
Date: Tue, 14 Nov 2023 15:00:17 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: set architecture in docker files
Message-ID: <886f6adb-5651-4c69-9d0b-ff68b5a1b094@perard>
References: <20231113155701.52052-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311131608200.160649@ubuntu-linux-20-04-desktop>
 <ZVM3Ujf1nsws3Mxr@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVM3Ujf1nsws3Mxr@macbook.local>

On Tue, Nov 14, 2023 at 10:01:06AM +0100, Roger Pau Monné wrote:
> On Mon, Nov 13, 2023 at 04:10:24PM -0800, Stefano Stabellini wrote:
> > On Mon, 13 Nov 2023, Roger Pau Monne wrote:
> > > Pass the desired architecture of the image in the FROM instruction if the
> > > image is possibly multi-platform.
> > > 
> > > This allows using the x86 Dockerfiles on OS X on arm64 hardware.
> > > 
> > > No functional change intended.
> > > 
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Although I am not opposed to this change, so far we have been using:
> > arm64v8/alpine:3.18
> > 
> > for x86 it is not specified but it would be:
> > amd64/alpine:3.18
> > 
> > Two options:
> > 1) we add amd64/ everywhere and leave the arm containers alone
> > 2) we change all containers, including the arm containers, to use the
> > --platform option
> > 
> > I don't think is a good idea to have 2 different ways to specify the
> > architecture for x86 and arm containers
> 
> I'm not an expert on this, but attempting to use (2):
> 
> -FROM arm64v8/alpine:3.18
> +FROM --platform=linux/arm64v8 alpine:3.18
> 
> Does not work for me:
> 
> % make -C automation/build alpine/3.18-arm64v8
> docker build --pull -t registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8 -f alpine/3.18-arm64v8.dockerfile alpine
> [+] Building 1.4s (3/3) FINISHED                                                  docker:desktop-linux
>  => [internal] load .dockerignore                                                                 0.0s
>  => => transferring context: 2B                                                                   0.0s
>  => [internal] load build definition from 3.18-arm64v8.dockerfile                                 0.0s
>  => => transferring dockerfile: 818B                                                              0.0s
>  => ERROR [internal] load metadata for docker.io/library/alpine:3.18                              1.4s
> ------
>  > [internal] load metadata for docker.io/library/alpine:3.18:
> ------
> 3.18-arm64v8.dockerfile:1
> --------------------
>    1 | >>> FROM --platform=linux/arm64v8 alpine:3.18
>    2 |     LABEL maintainer.name="The Xen Project" \
>    3 |           maintainer.email="xen-devel@lists.xenproject.org"
> --------------------
> ERROR: failed to solve: alpine:3.18: no match for platform in manifest sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978: not found
> make: *** [alpine/3.18-arm64v8] Error 1
> 
> That's why I've left the prefixed images alone.
> 
> I could prefix the x86 images with amd64/ if that's preferred, I
> didn't try that option, as the Docker manual suggested using
> --platform.

So a few things to know, "--platform=linux/amd64" just select a
different build of one container. For example, for the "alpine"
containers, you can see all the different builds available on the docker
hub, here a few links:
- Official Docker, Alpine images, home:
  https://hub.docker.com/_/alpine
- The different builds: 
  https://hub.docker.com/_/alpine/tags

So, for amd64v8, you probably want --platform=linux/arm64/v8

Then, they are per-architecture repository that make it easier to deal
with foreign architecture, and probably maintained by a different
community. e.g. for alpine arm64v8:
    https://hub.docker.com/r/arm64v8/alpine/

Those provide a build for a single architecture.


Sometime, you actually need to "--platform=*" to select a particular
architecture, like I did for "jessie-i386.dockerfile".


One thing I've notice when using --platform is that, if for example I
use the container "--platform=linux/amd64 alpine:3" then
"--platform=linux/arm/v6 alpine:3"; later when I only specify
"alpine:3", it's going to be the armv6, and I think docker is going to
complain if I try tu use "--platform=linux/amd64 alpine:3" without
"docker pull" first (or I guess docker build --pull).

Hope that help.

So I guess using containers "amd64/*" or "arm64v8/*" is fine, but
sometime will need to use "--platform=*".

Cheers,

-- 
Anthony PERARD

