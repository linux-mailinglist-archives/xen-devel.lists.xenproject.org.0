Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F44E1D9A
	for <lists+xen-devel@lfdr.de>; Sun, 20 Mar 2022 20:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292648.496974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nW1CU-0004N7-35; Sun, 20 Mar 2022 19:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292648.496974; Sun, 20 Mar 2022 19:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nW1CT-0004KU-Vc; Sun, 20 Mar 2022 19:26:49 +0000
Received: by outflank-mailman (input) for mailman id 292648;
 Sun, 20 Mar 2022 19:26:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nW1CS-0004KO-Qp
 for xen-devel@lists.xenproject.org; Sun, 20 Mar 2022 19:26:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nW1CR-0006ke-HL; Sun, 20 Mar 2022 19:26:47 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nW1CR-0007W4-B2; Sun, 20 Mar 2022 19:26:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=I2o92GoVK4YrLOy0mcK6nGmjdjcCTTh/HmqDISF+Tvs=; b=FB+3FjRm6IlggjH0Xx5p748QNu
	ngHdT87Vma6pJwjgfZPy1AtVm1NneA8iBsENwdtEtIjpyhyqI1uuPoZ2NeXb8vFLArTOQG2XbYA4+
	FZAvEOAmKi9t7NE8vBUwsU3mEDvHZhNCBFIe3ahO5lLN0l/MxhFnhdWIbfpNVBHSMZ2g=;
Message-ID: <684d65b8-5de4-779c-d869-bac28e073091@xen.org>
Date: Sun, 20 Mar 2022 19:26:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org,
 andrew.cooper3@citrix.com, anthony.perard@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop>
 <20220319003221.3012314-2-sstabellini@kernel.org>
 <alpine.DEB.2.22.394.2203191842280.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <alpine.DEB.2.22.394.2203191842280.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/03/2022 01:46, Stefano Stabellini wrote:
> On Fri, 18 Mar 2022, Stefano Stabellini wrote:
>> Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
>> the test-artifacts qemu container. The minimal test simply boots Xen
>> (built from previous build stages) and Dom0. The test is fetching the
>> Dom0 kernel and initrd from Debian Jessie: they work just fine and this
>> way we don't have to maintain a build for them too.
> 
> 
> Thanks to the Xen fix recently submitted
> (https://marc.info/?l=xen-devel&m=164774063802402) I'll be able to
> update this script to use Debian Bullseye. I am thinking of merging the
> below directly with this patch.
> 
> 
> ---
> 
> automation: upgrade Debian to Bullseye for testing Xen aarch32
> 
> Also change initrd. As the new netboot initrd from Debian Bullseye is
> huge (22MB), use a tiny initrd from Alpine Linux instead (only 2.5MB).

This is sounds odd to me. So we are going to use Bullseye but not really 
because we want to use a different initrd.

Why can't you get everything from the same place?

> 
> Also note that the huge Debian Bullseye initrd would cause QEMU to
> crash due to the -device loader parameter.

Can you provide more details? Was this reported to QEMU?

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> index 162922ace5..d554de7939 100755
> --- a/automation/scripts/qemu-smoke-arm32.sh
> +++ b/automation/scripts/qemu-smoke-arm32.sh
> @@ -5,11 +5,20 @@ set -ex
>   export DEBIAN_FRONTENT=noninteractive
>   apt-get -qy update
>   apt-get -qy install --no-install-recommends device-tree-compiler \
> -                                            curl
> +                                            curl \
> +                                            cpio
>   
>   cd binaries
> -curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
> -curl --fail --silent --show-error --location --output initrd.gz http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz
> +# Use the kernel from Debian
> +curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> +# Use a tiny initrd based on busybox from Alpine Linux
> +curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
> +
> +mkdir rootfs
> +cd rootfs
> +tar xvzf ../initrd.tar.gz
> +find . | cpio -H newc -o | gzip > ../initrd.gz
> +cd ..
>   
>   kernel=`stat -L --printf="%s" vmlinuz`
>   initrd=`stat -L --printf="%s" initrd.gz`
> @@ -68,5 +77,5 @@ timeout -k 1 240 \
>      -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
>   
>   set -e
> -(grep -q "^BusyBox" smoke.serial) || exit 1
> +(grep -q "^/ #" smoke.serial) || exit 1
>   exit 0
> 

Cheers,

-- 
Julien Grall

