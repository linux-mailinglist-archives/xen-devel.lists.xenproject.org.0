Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C490B052B3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043562.1413530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZzU-0005mp-VU; Tue, 15 Jul 2025 07:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043562.1413530; Tue, 15 Jul 2025 07:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZzU-0005ku-Sj; Tue, 15 Jul 2025 07:22:16 +0000
Received: by outflank-mailman (input) for mailman id 1043562;
 Tue, 15 Jul 2025 07:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j2+c=Z4=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1ubZzT-0005ko-KR
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:22:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad6ef5a-614c-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:22:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A65C05C5A39;
 Tue, 15 Jul 2025 07:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF12C4CEE3;
 Tue, 15 Jul 2025 07:22:06 +0000 (UTC)
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
X-Inumbo-ID: 6ad6ef5a-614c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752564127;
	bh=Rhik2SI+sxdIEG5rfGbMFjsf4x5xltoyJp8F3xN1GvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xV4ayyVHzmMklnAQs9ZPV19B42Zsk2m7JMrMJ9Ou80gk+ulgxsyLIhmhnUsk5ITkT
	 BIOD164QstgeLz9+xuFFZ01NuqUGgIn+VixhoplzD96lw9IWhOcL5obCmwa6Ivp5vT
	 /UdnZj44/JtIwtk6Q92BDyrCHIsNzPlEBMflYjVA=
Date: Tue, 15 Jul 2025 09:22:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com,
	lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
	marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, arend.vanspriel@broadcom.com,
	ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jirislaby@kernel.org, jgross@suse.com, sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com, akpm@linux-foundation.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	ming.li@zohomail.com, linux-cxl@vger.kernel.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, kvalo@kernel.org, johannes.berg@intel.com,
	quic_ramess@quicinc.com, ragazenta@gmail.com,
	jeff.johnson@oss.qualcomm.com, mingo@kernel.org, j@jannau.net,
	linux@treblig.org, linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
	shenlichuan@vivo.com, yujiaoliang@vivo.com, colin.i.king@gmail.com,
	cvam0000@gmail.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: [PATCH] treewide: Fix typo "notifer"
Message-ID: <2025071545-endnote-imprison-2b98@gregkh>
References: <B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com>

On Tue, Jul 15, 2025 at 03:12:45PM +0800, WangYuli wrote:
> There are some spelling mistakes of 'notifer' in comments which
> should be 'notifier'.
> 
> Fix them and add it to scripts/spelling.txt.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/x86/kvm/i8254.c                                        | 4 ++--
>  drivers/cxl/core/mce.h                                      | 2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h                            | 2 +-
>  drivers/net/ethernet/marvell/mvneta.c                       | 2 +-
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>  drivers/tty/serial/8250/8250_dw.c                           | 2 +-
>  include/xen/xenbus.h                                        | 2 +-
>  scripts/spelling.txt                                        | 1 +
>  8 files changed, 9 insertions(+), 8 deletions(-)

Please break this up into one-patch-per-subsystem, like is required for
things like this.

thanks,

greg k-h

