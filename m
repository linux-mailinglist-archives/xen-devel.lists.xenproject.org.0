Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB4798E21
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 20:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598153.932704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qegEd-000404-1l; Fri, 08 Sep 2023 18:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598153.932704; Fri, 08 Sep 2023 18:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qegEc-0003wi-VF; Fri, 08 Sep 2023 18:29:38 +0000
Received: by outflank-mailman (input) for mailman id 598153;
 Fri, 08 Sep 2023 18:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qegEb-0003wc-Gc
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 18:29:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a85f1479-4e75-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 20:29:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F18CCB8219E;
 Fri,  8 Sep 2023 18:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDD0C433BA;
 Fri,  8 Sep 2023 18:29:30 +0000 (UTC)
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
X-Inumbo-ID: a85f1479-4e75-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694197771;
	bh=pFArEIYtp7JXVOzbdKuO9HDXw0t155hOhNYh8yagBFQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DcH7C5Sx67HMe6vOCiG066BZYSdi2neXtR3WYlqSDbBo4KtpqZXcwnZTMjwJktn65
	 +K/R5r04SZe0cw7TgQHmwI+1IMrfKg9iIX6k/0YyJHEaQiY6nxWiujVIU3Yq4HRAXT
	 S52ypLqFwC8hzndWuzjlxPqt4uTN8p+/3jQBO+fTP2qhGC8jHWpvFFB4uSxr6hFq4G
	 UeZmQ6DCRBuQ89TNl4Pa7QHnyN8GBBbiP7KYQDYJOFBM2ALYLb8E8uzCH83sRzhxDI
	 9Ulqy3zGbGuPnwX2po5MDNbiEcjtwvZs/EgLusB/O6Pmwvj0X4rFWCqKUI+u7JbZ8n
	 +/Oct9HSQYNiA==
Date: Fri, 8 Sep 2023 11:29:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 1/2] automation: Switch ppc64le tests to PowerNV
 machine type
In-Reply-To: <e30b9b9c-20ef-2382-b104-5369ca8499ef@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2309081128560.6458@ubuntu-linux-20-04-desktop>
References: <cover.1694044614.git.sanastasio@raptorengineering.com> <85b53762ba04a349ba099cf5629e7ac24f496d69.1694044614.git.sanastasio@raptorengineering.com> <alpine.DEB.2.22.394.2309061739490.6458@ubuntu-linux-20-04-desktop>
 <e30b9b9c-20ef-2382-b104-5369ca8499ef@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Sep 2023, Shawn Anastasio wrote:
> On 9/6/23 7:41 PM, Stefano Stabellini wrote:
> > On Wed, 6 Sep 2023, Shawn Anastasio wrote:
> >> Run ppc64le tests with the PowerNV machine type (bare metal) instead of
> >> the paravirtualized pseries machine. This requires a more modern version
> >> of QEMU than is present in debian bullseye's repository, so update the
> >> dockerfile to build QEMU from source.
> >>
> >> Support for booting on pseries was broken by 74b725a64d80 ('xen/ppc:
> >> Implement initial Radix MMU support') which resulted in CI failures. In
> >> preparation for removing pseries support entirely, switch the CI
> >> infrastructure to the PowerNV machine type.
> >>
> >> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> >> ---
> >>  .../build/debian/bullseye-ppc64le.dockerfile  | 37 ++++++++++++++++++-
> >>  automation/gitlab-ci/test.yaml                |  2 +-
> >>  2 files changed, 36 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
> >> index 8fad26e903..15827bbcf4 100644
> >> --- a/automation/build/debian/bullseye-ppc64le.dockerfile
> >> +++ b/automation/build/debian/bullseye-ppc64le.dockerfile
> >> @@ -1,4 +1,36 @@
> >> +FROM debian:bullseye-slim AS builder
> >> +
> >> +ENV DEBIAN_FRONTEND=noninteractive
> >> +ENV QEMU_TAG=stable-8.1
> >> +ENV USER root
> >> +
> >> +# dependencies for qemu build
> >> +RUN apt-get update && \
> >> +    apt-get --quiet --yes install \
> >> +        git \
> >> +        build-essential \
> >> +        python3-minimal \
> >> +        python3-elementpath \
> >> +        python3-pip \
> >> +        ninja-build \
> >> +        libglib2.0-dev \
> >> +        libpixman-1-dev
> >> +
> >> +RUN mkdir /build
> >> +WORKDIR /build
> >> +
> >> +# QEMU build from git
> >> +RUN git clone --depth 1 --branch "${QEMU_TAG}" https://github.com/qemu/qemu && \
> >> +    mkdir qemu/build && \
> >> +    cd qemu/build && \
> >> +    ../configure --target-list=ppc64-softmmu && \
> >> +    ninja && \
> >> +    ninja install
> > 
> > It is totally find to build your QEMU but please use a test-artifact
> > instead, see automation/tests-artifacts/qemu-system-aarch64/ and
> > qemu-system-aarch64-6.0.0-arm64-export as an example.
> 
> Thanks for letting me know -- I've submitted a v3 that uses this
> technique to build the QEMU binary based on the aarch64 example you
> provided.

I have already committed v3 :-)

