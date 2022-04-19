Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D55506481
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 08:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307776.523062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghOr-0006sF-0Y; Tue, 19 Apr 2022 06:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307776.523062; Tue, 19 Apr 2022 06:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nghOq-0006pb-Tr; Tue, 19 Apr 2022 06:31:44 +0000
Received: by outflank-mailman (input) for mailman id 307776;
 Tue, 19 Apr 2022 06:31:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEip=U5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nghOp-0006pV-7z
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 06:31:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5f9ec291-bfaa-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 08:31:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A767E1042;
 Mon, 18 Apr 2022 23:31:41 -0700 (PDT)
Received: from [10.57.11.171] (unknown [10.57.11.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB0BB3F766;
 Mon, 18 Apr 2022 23:31:39 -0700 (PDT)
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
X-Inumbo-ID: 5f9ec291-bfaa-11ec-8fbe-03012f2f19d4
Message-ID: <6e01871e-9e47-2d92-617e-952dde2df3b2@arm.com>
Date: Tue, 19 Apr 2022 08:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com,
 anthony.perard@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2204151715100.915916@ubuntu-linux-20-04-desktop>
 <20220416001701.1301324-2-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220416001701.1301324-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 16.04.2022 02:17, Stefano Stabellini wrote:
> Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> the test-artifacts qemu container. The minimal test simply boots Xen
> (built from previous build stages) and Dom0.
> 
> The test needs a working kernel and minimal initrd for dom0. Instead of
> building our own kernel and initrd, which would mean maintaining one or
> two more builting scripts under automation/, we borrow a kernel and
> initrd from distros.
> 
> For the kernel we pick the Debian Bullseye kernel, which has everything
> we need already built-in. However, we cannot use the Debian Bullseye
> initrd because it is 22MB and the large size causes QEMU to core dump.
> 
> Instead, use the tiny busybox-based rootfs provided by Alpine Linux,
> which is really minimal: just 2.5MB. Note that we cannot use the Alpine
> Linux kernel because that doesn't boot on Xen.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v5:
> - use "virt" machine in QEMU

> +# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
> +# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
> +curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> +./qemu-system-arm \
> +   -machine virt \
You changed machine to virt here, but ...

> +rm -f smoke.serial
> +set +e
> +timeout -k 1 240 \
> +./qemu-system-arm \
> +   -machine virt-6.0 \
forgot to change it here as well.

Cheers,
Michal

