Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A6325AFA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 01:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90017.170179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFR2N-0000Do-GZ; Fri, 26 Feb 2021 00:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90017.170179; Fri, 26 Feb 2021 00:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFR2N-0000DP-DH; Fri, 26 Feb 2021 00:31:19 +0000
Received: by outflank-mailman (input) for mailman id 90017;
 Fri, 26 Feb 2021 00:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECYH=H4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFR2L-0000DK-4N
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 00:31:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8fcf235-cc93-4927-9ffb-a44e9af1f18a;
 Fri, 26 Feb 2021 00:31:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0759964F1B;
 Fri, 26 Feb 2021 00:31:14 +0000 (UTC)
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
X-Inumbo-ID: c8fcf235-cc93-4927-9ffb-a44e9af1f18a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614299475;
	bh=TLsaYaUNbkdsZYgpv6PcmHyRPTWbYAQZ+92LaE8FPdU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZrMjXja7kOTV6uBjgJfkLBEa3Q23wzEv3xbm+D5W+sUUhVdMQ4RCGzeWdUcpmxWlR
	 jlGHB3L8K0fXuaSruoeUdgecbJUeuizqaa3xIY/JoBkmIuR6eEte8Mz61fy+ufr5y3
	 y5iTrO6QXW+Qkq/cNA0SMSwKEdfruGJIlxcl9lSdL2Lgh6ZZnyiLbm0eJ+v6avD2FA
	 s9NXLbvlQv51dQeZrUcXl0kLN7DJBo3kB1wDHGP+fY5dLwUS7Uhmr873NXtOZcFEdL
	 Hdyk/ApeFKBz5YkiMHeoxfcagdWVjMpFT8c07eEG91gIAYlWc2VH3jbjNda7tQb77A
	 HunHOIzRCLtOA==
Date: Thu, 25 Feb 2021 16:31:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Connor Davis <connojdavis@gmail.com>
cc: xen-devel@lists.xenproject.org, Bobby Eshleman <bobbyeshleman@gmail.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH for-next 6/6] automation: add container for riscv64
 builds
In-Reply-To: <a7829e62734a73993cd41cdbc18e1d16e4bb06d9.1614265718.git.connojdavis@gmail.com>
Message-ID: <alpine.DEB.2.21.2102251630382.3234@sstabellini-ThinkPad-T480s>
References: <cover.1614265718.git.connojdavis@gmail.com> <a7829e62734a73993cd41cdbc18e1d16e4bb06d9.1614265718.git.connojdavis@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Feb 2021, Connor Davis wrote:
> Add a container for cross-compiling xen to riscv64.
> This just includes the cross-compiler and necessary packages for
> building xen itself (packages for tools, stubdoms, etc., can be
> added later).
> 
> To build xen in the container run the following:
> 
> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>

The container build failed for me with:

Creating user git (git daemon user) with uid 977 and gid 977.
:: Running post-transaction hooks...
( 1/13) Creating system user accounts...
( 2/13) Updating journal message catalog...
( 3/13) Reloading system manager configuration...
  Skipped: Current root is not booted.
( 4/13) Updating udev hardware database...
( 5/13) Applying kernel sysctl settings...
  Skipped: Current root is not booted.
( 6/13) Creating temporary files...
/usr/lib/tmpfiles.d/journal-nocow.conf:26: Failed to resolve specifier: uninitialized /etc detected, skipping
All rules containing unresolvable specifiers will be skipped.
( 7/13) Reloading device manager configuration...
  Skipped: Device manager is not running.
( 8/13) Arming ConditionNeedsUpdate...
( 9/13) Rebuilding certificate stores...
(10/13) Reloading system bus configuration...
  Skipped: Current root is not booted.
(11/13) Warn about old perl modules
(12/13) Cleaning up package cache...
(13/13) Updating the info directory file...
Removing intermediate container 81e02adffada
 ---> 575bfaafc6af
Step 4/9 : RUN pacman --noconfirm -Syu     pixman     python     sh
 ---> Running in 9010bd7932b5
error: failed to initialize alpm library
(could not find or read directory: /var/lib/pacman/)
The command '/bin/sh -c pacman --noconfirm -Syu     pixman     python     sh' returned a non-zero code: 255


> ---
>  automation/build/archlinux/riscv64.dockerfile | 32 +++++++++++++++++++
>  automation/scripts/containerize               |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 automation/build/archlinux/riscv64.dockerfile
> 
> diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
> new file mode 100644
> index 0000000000..d94048b6c3
> --- /dev/null
> +++ b/automation/build/archlinux/riscv64.dockerfile
> @@ -0,0 +1,32 @@
> +FROM archlinux/base
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +# Packages needed for the build
> +RUN pacman --noconfirm -Syu \
> +    base-devel \
> +    gcc \
> +    git
> +
> +# Packages needed for QEMU
> +RUN pacman --noconfirm -Syu \
> +    pixman \
> +    python \
> +    sh
> +
> +# There is a regression in GDB that causes an assertion error
> +# when setting breakpoints, use this commit until it is fixed!
> +RUN git clone --recursive -j$(nproc) --progress https://github.com/riscv/riscv-gnu-toolchain && \
> +    cd riscv-gnu-toolchain/riscv-gdb && \
> +    git checkout 1dd588507782591478882a891f64945af9e2b86c && \
> +    cd  .. && \
> +    ./configure --prefix=/opt/riscv && \
> +    make linux -j$(nproc) && \
> +    rm -R /riscv-gnu-toolchain
> +
> +# Add compiler path
> +ENV PATH=/opt/riscv/bin/:${PATH}
> +
> +RUN useradd --create-home user
> +USER user
> +WORKDIR /build
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index da45baed4e..1901e8c0ef 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -25,6 +25,7 @@ die() {
>  BASE="registry.gitlab.com/xen-project/xen"
>  case "_${CONTAINER}" in
>      _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
> +    _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
>      _centos7) CONTAINER="${BASE}/centos:7" ;;
>      _centos72) CONTAINER="${BASE}/centos:7.2" ;;
>      _fedora) CONTAINER="${BASE}/fedora:29";;
> -- 
> 2.27.0
> 
> 

