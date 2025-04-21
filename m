Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587EEA957E7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 23:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961520.1352916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yYf-00076U-4E; Mon, 21 Apr 2025 21:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961520.1352916; Mon, 21 Apr 2025 21:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yYf-00074S-14; Mon, 21 Apr 2025 21:20:05 +0000
Received: by outflank-mailman (input) for mailman id 961520;
 Mon, 21 Apr 2025 21:20:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6yYd-0006fC-6t
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 21:20:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61efc0e3-1ef6-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 23:20:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 61E4E6115F;
 Mon, 21 Apr 2025 21:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BCCC4CEE4;
 Mon, 21 Apr 2025 21:19:56 +0000 (UTC)
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
X-Inumbo-ID: 61efc0e3-1ef6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745270399;
	bh=lgTL+ijpOlR9d7mhJqFsS3mjCC6x6cHKkBHEy9O11ew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gMXR8evjiP/40QUlV7axCRBlT6Z3nS9RfNT6ZdSsa2c1JTzNnTA9QEVTHK4sG27E5
	 aOJAILbQCazX1O45RrOUcmsgHaUo8PrUOvWEED4lFdnWHs6f5lOfPd/5uFqrokhmBU
	 JNfOvA43H3iD+G2rclwMBdauMSVXfS2DiCa3p6xnUVzkngRNlYzlzL//TFXunYtU0c
	 xqdHsv3CQKvI26+cRSp3O/L1WVj9fmoov56ZFVyM1WDK8XDCET7TyyPl5wMHzJ35CB
	 ovis1SsqBxaiQ4h5BTwLUyoGS8M7y0cWhrQ7IRsCCuenXwWcxyeZA0e9vNBc5Gl4G7
	 kIsgTPCDTmGbw==
Date: Mon, 21 Apr 2025 14:19:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: Re: [PATCH v3 19/20] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
In-Reply-To: <20250421073723.3863060-20-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504211419320.785180@ubuntu-linux-20-04-desktop>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com> <20250421073723.3863060-20-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Apr 2025, Penny Zheng wrote:
> Function arch_do_sysctl is to perform arch-specific sysctl op.
> Some functions, like psr_get_info for x86, DTB overlay support for arm,
> are solely available through sysctl op, then they all shall be wrapped
> with CONFIG_SYSCTL
> 
> Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
> we put the guardian in Makefile for the whole file.
> Since PV_SHIM_EXCLUSIVE needs sorting as a prereq in the future, we move
> obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> - use "depends on" for config OVERLAY_DTB
> - no need to wrap declaration
> - add transient #ifdef in sysctl.c for correct compilation
> ---
> v2 -> v3
> - move obj-$(CONFIG_SYSCTL) += sysctl.o out of PV_SHIM_EXCLUSIVE condition
> - move copyback out of #ifdef
> - add #else process for default label


