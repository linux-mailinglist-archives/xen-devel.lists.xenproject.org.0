Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5CE696BC8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 18:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495469.765836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRzBi-00078M-Op; Tue, 14 Feb 2023 17:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495469.765836; Tue, 14 Feb 2023 17:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRzBi-00075n-Lk; Tue, 14 Feb 2023 17:33:54 +0000
Received: by outflank-mailman (input) for mailman id 495469;
 Tue, 14 Feb 2023 17:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHuR=6K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pRzBg-00075h-TM
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 17:33:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be44dc8b-ac8d-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 18:33:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A2F95CE2169;
 Tue, 14 Feb 2023 17:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EB8C433EF;
 Tue, 14 Feb 2023 17:33:41 +0000 (UTC)
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
X-Inumbo-ID: be44dc8b-ac8d-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676396022;
	bh=4FxFdAzCF2rvXNmbuIkOoQ5OZXy8XSYFQtGAVovy1Eg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JP0V0DhQaMXMX5diqWB9FYcFPfgFx307Zlpee8DeH6KjUACB4belW1CkqYm7yqgTf
	 bFncVUNSim8iIoYRjZFRGaot7sWGue7KY5LJhHy2sXbAHmd7N4KArl2ABL6NHALhSE
	 W3UEGyhXP3QZ8zFam6htC10zB8Kk0+ivF3TWd5RvZc1w+aWOXJab0GnmRq6UwQEFI2
	 3OU3S6VX3ZJMnfr7NbuwSdDZxq2FlC92wIa3RilQ/p2tU7tXVDavs0M/dFrGmfyWMI
	 u19tYzavnWiRWt2kQNBaO68/G/+TrDJLCw+MT1mmUyaQp5Gbv3uRXzlftwjgpkUf+x
	 WngKf0Yd1ayqg==
Date: Tue, 14 Feb 2023 09:33:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] automation: Add container and build jobs to run
 cppcheck analysis
In-Reply-To: <59da3abf-7c56-7a46-03a3-b11537d0527b@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2302140933150.2025117@ubuntu-linux-20-04-desktop>
References: <20230214153945.15719-1-michal.orzel@amd.com> <59da3abf-7c56-7a46-03a3-b11537d0527b@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-14625239-1676396022=:2025117"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-14625239-1676396022=:2025117
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 14 Feb 2023, Andrew Cooper wrote:
> On 14/02/2023 3:39 pm, Michal Orzel wrote:
> > diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
> > new file mode 100644
> > index 000000000000..54b99f87dfec
> > --- /dev/null
> > +++ b/automation/build/debian/unstable-cppcheck.dockerfile
> > @@ -0,0 +1,37 @@
> > +FROM arm64v8/debian:unstable
> > +LABEL maintainer.name="The Xen Project" \
> > +      maintainer.email="xen-devel@lists.xenproject.org"
> > +
> > +ENV DEBIAN_FRONTEND=noninteractive
> > +ENV CPPCHECK_VERSION=2.7
> > +ENV USER root
> > +
> > +RUN mkdir /build
> > +WORKDIR /build
> > +
> > +# dependencies for cppcheck and Xen-only build/cross-build
> > +RUN apt-get update && \
> > +    apt-get --quiet --yes install \
> > +        build-essential \
> > +        curl \
> > +        python-is-python3 \
> > +        libpcre3-dev \
> > +        flex \
> > +        bison \
> > +        gcc-arm-linux-gnueabihf \
> > +        gcc-x86-64-linux-gnu
> > +
> > +# cppcheck release build (see cppcheck readme.md)
> > +RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
> > +    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
> > +    cd cppcheck-"$CPPCHECK_VERSION" && \
> > +    make install -j$(nproc) \
> > +        MATCHCOMPILER=yes \
> > +        FILESDIR=/usr/share/cppcheck \
> > +        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
> 
> I think you want to be using a mutli-FROM dockerfile here, otherwise
> you're including all the intermediate build artefacts in the final image.
> 
> See debian/buster-gcc-ibt.dockerfile for an example.
> 
> That said, I'm not sure we want to be making custom containers for every
> minor tweak we have on a build environment.  What's wrong with just
> putting CPPCHECK in the normal container?

cppcheck is not large but needs to be built from source (as part of the
Dockerfile). So we thought it would be best to keep it separate from the
regular containers.

I don't foresee another case like cppcheck at the moment.

Also by having it separate it is clearer that this container is
"special".

I think it would be preferable to keep it in its own separate container
but it would be OK either way.
--8323329-14625239-1676396022=:2025117--

