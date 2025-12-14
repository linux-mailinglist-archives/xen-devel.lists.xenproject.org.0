Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC9CCBB7D7
	for <lists+xen-devel@lfdr.de>; Sun, 14 Dec 2025 09:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186353.1508026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUh6Y-0007iW-S6; Sun, 14 Dec 2025 08:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186353.1508026; Sun, 14 Dec 2025 08:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUh6Y-0007g2-P1; Sun, 14 Dec 2025 08:05:22 +0000
Received: by outflank-mailman (input) for mailman id 1186353;
 Sun, 14 Dec 2025 08:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=boK8=6U=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1vUh6X-0007fU-Bq
 for xen-devel@lists.xenproject.org; Sun, 14 Dec 2025 08:05:21 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a17bd8e1-d8c3-11f0-b15b-2bf370ae4941;
 Sun, 14 Dec 2025 09:05:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA6166016F;
 Sun, 14 Dec 2025 08:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66711C4CEF1;
 Sun, 14 Dec 2025 08:05:12 +0000 (UTC)
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
X-Inumbo-ID: a17bd8e1-d8c3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765699517;
	bh=ihizdAs5xDOev8/N37y8juDMqohuVvatea37UyTaRi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kty6VVwzTJtdeGkn/OL/sk2f7Vfnpv82H2rJ71SoVx5wLW/jb8lxm2RuFqMqpcEHB
	 9/ooTAhhdffBRwzl0rkjmLIVGEm8RBGaGHTqlxjBo6IhmNSozd/xIqpYfSV3HiEEuF
	 r9Ae5LH2yKrVwPDJsSlCF5IKvD6QnlpE6J1sYr19zntuAY/UyUwqETaiphNCCl6Fg0
	 OIfJqqcMaGaTZTfwoSpZdnCgyFEicpt76KiSaP7TH5N3yFXQRgkZp5SQtveJKUU8O8
	 qy/urqiNHzU11rrcFzoWeK/Trun7TjKtaJPlRq9DNhHOtzui8DMkvIIYEGKRnYClqr
	 1Dx2GzcDYarcA==
Date: Sun, 14 Dec 2025 09:05:09 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Denis Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
Message-ID: <aT5vtaefuHwLVsqy@gmail.com>
References: <20251126162018.5676-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126162018.5676-1-jgross@suse.com>


* Juergen Gross <jgross@suse.com> wrote:

> While looking at paravirt cleanups I stumbled over slow_down_io() and
> the related REALLY_SLOW_IO define.
>
> Especially REALLY_SLOW_IO is a mess, which is proven by 2 completely
> wrong use cases.
>
> Do several cleanups, resulting in a deletion of REALLY_SLOW_IO and the
> io_delay() paravirt function hook.
>
> Patches 2 and 3 are not changing any functionality, but maybe they
> should? As the potential bug has been present for more than a decade
> now, I went with just deleting the useless "#define REALLY_SLOW_IO".
> The alternative would be to do something similar as in patch 5.
>
> Juergen Gross (5):
>   x86/paravirt: Replace io_delay() hook with a bool
>   hwmon/lm78: Drop REALLY_SLOW_IO setting
>   hwmon/w83781d: Drop REALLY_SLOW_IO setting
>   block/floppy: Don't use REALLY_SLOW_IO for delays
>   x86/io: Remove REALLY_SLOW_IO handling
>
>  arch/x86/include/asm/floppy.h         | 27 ++++++++++++++++++++++-----
>  arch/x86/include/asm/io.h             | 12 +++++-------
>  arch/x86/include/asm/paravirt.h       | 11 +----------
>  arch/x86/include/asm/paravirt_types.h |  3 +--
>  arch/x86/kernel/cpu/vmware.c          |  2 +-
>  arch/x86/kernel/kvm.c                 |  8 +-------
>  arch/x86/kernel/paravirt.c            |  3 +--
>  arch/x86/xen/enlighten_pv.c           |  6 +-----
>  drivers/block/floppy.c                |  2 --
>  drivers/hwmon/lm78.c                  |  5 +++--
>  drivers/hwmon/w83781d.c               |  5 +++--
>  11 files changed, 39 insertions(+), 45 deletions(-)

I think we should get rid of *all* io_delay hacks, they might have been
relevant in the days of i386 systems, but we don't even support i386
CPUs anymore. Should it cause any regressions, it's easy to bisect to.
There's been enough changes around all these facilities that the
original timings are probably way off already, so we've just been
cargo-cult porting these to newer kernels essentially.

Thanks,

	Ingo

