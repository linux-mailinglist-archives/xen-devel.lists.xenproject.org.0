Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F5B0D401
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052084.1420599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7sc-0005QD-0b; Tue, 22 Jul 2025 07:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052084.1420599; Tue, 22 Jul 2025 07:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue7sb-0005OD-UH; Tue, 22 Jul 2025 07:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1052084;
 Tue, 22 Jul 2025 07:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KViT=2D=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1ue7sa-0005O7-EN
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:57:40 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88e397ab-66d1-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 09:57:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EC9EA55D88;
 Tue, 22 Jul 2025 07:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9B5C4CEEB;
 Tue, 22 Jul 2025 07:57:35 +0000 (UTC)
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
X-Inumbo-ID: 88e397ab-66d1-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753171056;
	bh=wEUHDmsgHVPe5kSmdb1Wec3UqL9t1n89LTQEk85htD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdcFf6pgjhk/nGBgS+COUsHqDSedZPrRp7PmpD9jj0Sy18W7SgAXvzKROr973tS19
	 GmDs4Z2sApDs+Xt0VQpiOqw2NeYSo/wv/f2IDtHwKTBYe7ze0KkyW9m1MQ29aRc7hI
	 g+r9qkREXxILI6FRvwKRc9d4sfo0vJI9m3c+MSdQ=
Date: Tue, 22 Jul 2025 09:57:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org,
	alison.schofield@intel.com, andrew+netdev@lunn.ch,
	andriy.shevchenko@linux.intel.com, arend.vanspriel@broadcom.com,
	bp@alien8.de, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, colin.i.king@gmail.com,
	cvam0000@gmail.com, dan.j.williams@intel.com,
	dave.hansen@linux.intel.com, dave.jiang@intel.com,
	dave@stgolabs.net, davem@davemloft.net,
	dri-devel@lists.freedesktop.org, edumazet@google.com,
	guanwentao@uniontech.com, hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
	ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
	jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
	jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
	kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux@treblig.org,
	lucas.demarchi@intel.com, marcin.s.wojtas@gmail.com,
	ming.li@zohomail.com, mingo@kernel.org, mingo@redhat.com,
	netdev@vger.kernel.org, niecheng1@uniontech.com,
	oleksandr_tyshchenko@epam.com, pabeni@redhat.com,
	pbonzini@redhat.com, quic_ramess@quicinc.com, ragazenta@gmail.com,
	rodrigo.vivi@intel.com, seanjc@google.com, shenlichuan@vivo.com,
	simona@ffwll.ch, sstabellini@kernel.org, tglx@linutronix.de,
	thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com, zhanjun@uniontech.com
Subject: Re: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
Message-ID: <2025072252-halves-sadness-18dc@gregkh>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
 <2025071607-outbid-heat-b0ba@gregkh>
 <634BA467821D37FE+0b2ace38-07d9-4500-8bb7-5a4fa65c4b9f@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <634BA467821D37FE+0b2ace38-07d9-4500-8bb7-5a4fa65c4b9f@uniontech.com>

On Tue, Jul 22, 2025 at 03:22:18PM +0800, WangYuli wrote:
> Hi greg k-h,
> 
> On 2025/7/16 16:08, Greg KH wrote:
> > > Signed-off-by: WangYuli <wangyuli@uniontech.com>
> > Is your name all one word like that, or should there be a " " between
> > them?
> 
> If I were to follow Western naming conventions, my name would be written as
> 'Yuli Wang'.
> 
> However, frankly, I find it unnecessary and can't be bothered to follow
> their customs, unless a maintainer strongly insists. (For example, you can
> see that my signature on commits for the LoongArch subsystem is different
> from my other contributions).
> 
> Since Chinese names are written without any spaces in Chinese characters, I
> don't think it matters.

Then use your Chinese name, don't feel like you need to change it to any
other naming convention.  There's no requirement here at all to do so.

thanks,

greg k-h

