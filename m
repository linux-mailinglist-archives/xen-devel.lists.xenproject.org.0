Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389E93DC5D
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 02:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765785.1176431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXV9i-0000Cf-RH; Sat, 27 Jul 2024 00:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765785.1176431; Sat, 27 Jul 2024 00:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXV9i-00009G-Mg; Sat, 27 Jul 2024 00:19:26 +0000
Received: by outflank-mailman (input) for mailman id 765785;
 Sat, 27 Jul 2024 00:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sXV9g-000096-LE
 for xen-devel@lists.xenproject.org; Sat, 27 Jul 2024 00:19:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deba9698-4bad-11ef-8776-851b0ebba9a2;
 Sat, 27 Jul 2024 02:19:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B5606199D;
 Sat, 27 Jul 2024 00:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C71C4AF0A;
 Sat, 27 Jul 2024 00:19:19 +0000 (UTC)
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
X-Inumbo-ID: deba9698-4bad-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722039560;
	bh=vz2izZP2K4EhzYPagaCKR85TIn2qAdiJ27WrJJYbp5o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KSZeSx4eOhtEckztNo4wrt7uXpwy31yqST3luFagtHldU8gzVP1oXycbZ1rNu+kKW
	 wlqMHdXe9PHoRjoIJADHl68O/kZqVrH6AAXaC30He+P9oRK40vHLbKiFEwQ9NKX/Ex
	 t7W7t5M39XrpYy0B9LRQKhrkKUNmKAnCkhSFLD7eIXZTq1cgucsyAgL87UvUp7bz5q
	 J6ht3M+xTFrrX7Kt5N8UTC8ZPCVi9mv52XaI9LsCoE3iDDGygnKxLFCt3QsNf+G3F3
	 3OfT+LQLQfr0AZS8xx/uadv5Wo8edLhKMfxSzw5x23cygHLXHxGvUNsxCgGWIeq/tK
	 fQPSB8EL7SyaQ==
Date: Fri, 26 Jul 2024 17:19:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com, 
    andrew.cooper3@citrix.com, cardoe@cardoe.com
Subject: Re: [PATCH] automation: upgrade Yocto to scarthgap
In-Reply-To: <alpine.DEB.2.22.394.2407251715040.4857@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2407261639080.4857@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2407251715040.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jul 2024, Stefano Stabellini wrote:
> Upgrade Yocto to a newer version. Use ext4 as image format for testing
> with QEMU on ARM and ARM64 as the default is WIC and it is not available
> for our xen-image-minimal target.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

This patch has a couple of issues, I'll send an update

> ---
> I am running one last test (that takes hours) I'll make sure it passes
> before I commit anything.
> ---
>  automation/build/yocto/build-yocto.sh | 9 +++++++--
>  automation/build/yocto/yocto.inc      | 4 ++--
>  automation/gitlab-ci/build.yaml       | 2 +-
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
> index 93ce81ce82..e7a03c4b10 100755
> --- a/automation/build/yocto/build-yocto.sh
> +++ b/automation/build/yocto/build-yocto.sh
> @@ -25,6 +25,7 @@ TARGET_SUPPORTED="qemuarm qemuarm64 qemux86-64"
>  VERBOSE="n"
>  TARGETLIST=""
>  BUILDJOBS="8"
> +EXT4="ext4"
>  
>  # actions to do
>  do_clean="n"
> @@ -38,8 +39,9 @@ build_result=0
>  # layers to include in the project
>  build_layerlist="poky/meta poky/meta-poky poky/meta-yocto-bsp \
>                   meta-openembedded/meta-oe meta-openembedded/meta-python \
> +                 meta-openembedded/meta-networking \
>                   meta-openembedded/meta-filesystems \
> -                 meta-openembedded/meta-networking meta-virtualization"
> +                 meta-virtualization"
>  
>  # yocto image to build
>  build_image="xen-image-minimal"
> @@ -83,6 +85,9 @@ function run_task() {
>  function project_create() {
>      target="${1:?}"
>      destdir="${BUILDDIR}/${target}"
> +    if [ $target = "qemux86-64" ]; then
> +        EXT4=""
> +    fi
>  
>      (
>          # init yocto project
> @@ -196,7 +201,7 @@ function project_run() {
>  
>          /usr/bin/expect <<EOF
>  set timeout 1000
> -spawn bash -c "runqemu serialstdio nographic slirp"
> +spawn bash -c "runqemu serialstdio nographic slirp ${EXT4}"
>  
>  expect_after {
>      -re "(.*)\r" {
> diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yocto.inc
> index 2f3b1a5b2a..209df7dde9 100644
> --- a/automation/build/yocto/yocto.inc
> +++ b/automation/build/yocto/yocto.inc
> @@ -6,10 +6,10 @@
>  # YOCTOVERSION-TARGET for x86_64 hosts
>  # YOCTOVERSION-TARGET-arm64v8 for arm64 hosts
>  # For example you can build an arm64 container with the following command:
> -# make yocto/kirkstone-qemuarm64-arm64v8
> +# make yocto/scarthgap-qemuarm64-arm64v8
>  
>  # Yocto versions we are currently using.
> -YOCTO_VERSION = kirkstone
> +YOCTO_VERSION = scarthgap
>  
>  # Yocto BSPs we want to build for.
>  YOCTO_TARGETS = qemuarm64 qemuarm qemux86-64
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 7ce88d38e7..32045cef0c 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -212,7 +212,7 @@
>    script:
>      - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
>    variables:
> -    YOCTO_VERSION: kirkstone
> +    YOCTO_VERSION: scarthgap
>      CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}${YOCTO_HOST}
>    artifacts:
>      paths:
> -- 
> 2.25.1
> 

