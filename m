Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195C955F28E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 02:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357474.586037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6M2D-0004LR-CV; Wed, 29 Jun 2022 00:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357474.586037; Wed, 29 Jun 2022 00:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6M2D-0004Id-9q; Wed, 29 Jun 2022 00:58:25 +0000
Received: by outflank-mailman (input) for mailman id 357474;
 Wed, 29 Jun 2022 00:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6M2B-0004IX-KI
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 00:58:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c8bf73-f746-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 02:58:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F3B261AFE;
 Wed, 29 Jun 2022 00:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E470C341C8;
 Wed, 29 Jun 2022 00:58:18 +0000 (UTC)
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
X-Inumbo-ID: 91c8bf73-f746-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656464299;
	bh=qzXzyU3Yxwkc5XoKYIl4dSB/mDLg7UqRnK4AC6snhZQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hiakdTfXzYVHnt8rotaaK4/4vf9Jm1h+sYAUrz+zMLPSM5E4rWUFyo8rGX5PESKLl
	 SY2grO9EbqiR2Nh8X1DlSWeFnUzx1cg+HuylAwTsj3sr/+ORIBdOpNsXMOnWmuN6ka
	 e2KJOMM1+ScuOsUPDAC1TZ/o0/sRKF5JLy0VULpTw8abuMurRFrQ2sdxT5B5uo3PDr
	 DXaHPlaEBpEPp5jGAs1Zib5nV/ajkGe5CzC/WOwT8Mrm5V0CYmaFpYEomoQw4Cf14U
	 D6FpTXAQNTrIUIZxZWmpBkwKNqx6a/kMQOdKaXi3gnqvGIHJkYKlz1LMjrtMKpRGng
	 Lgc0rh6qy+uLA==
Date: Tue, 28 Jun 2022 17:58:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, x86@kernel.org, linux-s390@vger.kernel.org, 
    linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
    linux-arch@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
    Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] virtio: support requiring restricted access per
 device
In-Reply-To: <20220622063838.8854-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206281758050.4389@ubuntu-linux-20-04-desktop>
References: <20220622063838.8854-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jun 2022, Juergen Gross wrote:
> Instead of an all or nothing approach add support for requiring
> restricted memory access per device.
> 
> Changes in V3:
> - new patches 1 + 2
> - basically complete rework of patch 3
> 
> Juergen Gross (3):
>   virtio: replace restricted mem access flag with callback
>   kernel: remove platform_has() infrastructure
>   xen: don't require virtio with grants for non-PV guests


On the whole series:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  MAINTAINERS                            |  8 --------
>  arch/arm/xen/enlighten.c               |  4 +++-
>  arch/s390/mm/init.c                    |  4 ++--
>  arch/x86/mm/mem_encrypt_amd.c          |  4 ++--
>  arch/x86/xen/enlighten_hvm.c           |  4 +++-
>  arch/x86/xen/enlighten_pv.c            |  5 ++++-
>  drivers/virtio/Kconfig                 |  4 ++++
>  drivers/virtio/Makefile                |  1 +
>  drivers/virtio/virtio.c                |  4 ++--
>  drivers/virtio/virtio_anchor.c         | 18 +++++++++++++++++
>  drivers/xen/Kconfig                    |  9 +++++++++
>  drivers/xen/grant-dma-ops.c            | 10 ++++++++++
>  include/asm-generic/Kbuild             |  1 -
>  include/asm-generic/platform-feature.h |  8 --------
>  include/linux/platform-feature.h       | 19 ------------------
>  include/linux/virtio_anchor.h          | 19 ++++++++++++++++++
>  include/xen/xen-ops.h                  |  6 ++++++
>  include/xen/xen.h                      |  8 --------
>  kernel/Makefile                        |  2 +-
>  kernel/platform-feature.c              | 27 --------------------------
>  20 files changed, 84 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/virtio/virtio_anchor.c
>  delete mode 100644 include/asm-generic/platform-feature.h
>  delete mode 100644 include/linux/platform-feature.h
>  create mode 100644 include/linux/virtio_anchor.h
>  delete mode 100644 kernel/platform-feature.c
> 
> -- 
> 2.35.3
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

