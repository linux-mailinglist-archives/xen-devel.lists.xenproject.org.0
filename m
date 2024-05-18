Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B58C8EF6
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 02:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724536.1129800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8895-0001Qz-J0; Sat, 18 May 2024 00:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724536.1129800; Sat, 18 May 2024 00:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8895-0001P6-FA; Sat, 18 May 2024 00:41:55 +0000
Received: by outflank-mailman (input) for mailman id 724536;
 Sat, 18 May 2024 00:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+vq=MV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s8894-0001Ja-PF
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 00:41:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b8d2fae-14af-11ef-909e-e314d9c70b13;
 Sat, 18 May 2024 02:41:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 809B76163C;
 Sat, 18 May 2024 00:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEE2C2BD10;
 Sat, 18 May 2024 00:41:51 +0000 (UTC)
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
X-Inumbo-ID: 6b8d2fae-14af-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715992912;
	bh=V8Q5MWxedopOTHvDYQ3KV3TQEh3uHjrguKJ0NZRj8fk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y960RWJ1oDVK3TKob1KcAOHoVZHdue6UheYYR9+Ad8RiUIbPYbdyrvCW0eM+uO4wv
	 pPgDT7F+uoiDUeXZe5zxLKLXUCh+Go+gjvkdQAnSD6kkA/nyrif09bj88CpDBKXwOl
	 UgSb4RyuijzpikHP91GS25NxoTnFVzfDJZ2sdH9eR7P3ZQYtVTX/WZVbCruD9GF5KX
	 lFDT+15sj5+Itdk4MnfM5jajWK2ldZCbV/8YDqoLOt2sG5hz5CDxiU/I/3fEd4Nc4c
	 RMNIf4XPt+roAtuDoBTIwXf34uNJhd3k+2mHcFkWxGGxt0RzaRVRk8TdWCpLlmfyXF
	 OAQx+ak3sTA1A==
Date: Fri, 17 May 2024 17:41:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 10/12] automation: stubdom test with PCI passthrough
In-Reply-To: <16c7001cfec1cb7a601414b745655656ea63fe29.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171741160.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <16c7001cfec1cb7a601414b745655656ea63fe29.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1808204904-1715992912=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1808204904-1715992912=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> Based on the initial stubdomain test and existing PCI passthrough tests,
> add one that combines both.
> Schedule it on the AMD runner, as it has less tests right now.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

With the caveat that if we do tftp boot this might have to change:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml     |  8 ++++++++
>  automation/scripts/qubes-x86-64.sh | 30 +++++++++++++++++++++++++-----
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index e3910f4c1a9f..76cc430ae00f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -231,6 +231,14 @@ zen3p-pci-hvm-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.19-gcc-debug
>  
> +zen3p-pci-stubdom-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-stubdom 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.19-gcc-debug
> +
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index fc73403dbadf..816c16fbab3e 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -98,8 +98,8 @@ ping -c 10 192.168.0.2 || exit 1
>  echo \"${passed}\"
>  "
>  
> -### test: pci-pv, pci-hvm
> -elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
> +### test: pci-pv, pci-hvm, pci-stubdom
> +elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ] || [ "${test_variant}" = "pci-stubdom" ]; then
>  
>      if [ -z "$PCIDEV" ]; then
>          echo "Please set 'PCIDEV' variable with BDF of test network adapter" >&2
> @@ -109,15 +109,35 @@ elif [ "${test_variant}" = "pci-pv" ] || [ "${test_variant}" = "pci-hvm" ]; then
>  
>      passed="pci test passed"
>  
> -    domU_config='
> +    domain_type="${test_variant#pci-}"
> +    if [ "$test_variant" = "pci-stubdom" ]; then
> +        domain_type="hvm"
> +        domU_config='
> +type = "hvm"
> +disk = [ "/srv/disk.img,format=raw,vdev=xvda" ]
> +device_model_version = "qemu-xen"
> +device_model_stubdomain_override = 1
> +on_reboot = "destroy"
> +# libxl configures vkb backend to be dom0 instead of the stubdomain, defer
> +# changing that until there is consensus what to do about VGA output (VNC)
> +vkb_device = 0
> +'
> +        domU_disk_path=/srv/disk.img
> +    else
> +        domU_config='
>  type = "'${test_variant#pci-}'"
> -name = "domU"
>  kernel = "/boot/vmlinuz"
>  ramdisk = "/boot/initrd-domU"
>  extra = "root=/dev/ram0 console=hvc0 earlyprintk=xen"
> +disk = [ ]
> +'
> +    fi
> +
> +    # common part
> +    domU_config="$domU_config"'
> +name = "domU"
>  memory = 512
>  vif = [ ]
> -disk = [ ]
>  pci = [ "'$PCIDEV',seize=1" ]
>  on_reboot = "destroy"
>  '
> -- 
> git-series 0.9.1
> 
--8323329-1808204904-1715992912=:1052252--

