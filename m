Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E592B06FEA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 10:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044922.1414952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxBx-0005MC-FO; Wed, 16 Jul 2025 08:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044922.1414952; Wed, 16 Jul 2025 08:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxBx-0005Kl-Bw; Wed, 16 Jul 2025 08:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1044922;
 Wed, 16 Jul 2025 08:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AX+7=Z5=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1ubxBw-0005Kf-1Q
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 08:08:40 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 131b3372-621c-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 10:08:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 385B943431;
 Wed, 16 Jul 2025 08:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12419C4CEF0;
 Wed, 16 Jul 2025 08:08:35 +0000 (UTC)
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
X-Inumbo-ID: 131b3372-621c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752653316;
	bh=HIfZ2WyLhan5ssXSdB5gQZDLA9YqfEoaAfStUdGlXFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clYWrTZkp/rq0rCVhswSXVqfKlXYciP2uM3S5iUrcQP9HIZSlHaFyZZ8e6FhKU9/U
	 Lh3gBy5Ev81QSMIFUAWFwXwi2wp+9D4NRDiE1O/qfo1Dw1EYsEpURuycj9dvpTzLyL
	 hncH3tuUa6Vr1A5Z6VLty6GPo6W0f4WqF8Ccqj7s=
Date: Wed, 16 Jul 2025 10:08:33 +0200
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
Message-ID: <2025071607-outbid-heat-b0ba@gregkh>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>

On Tue, Jul 15, 2025 at 09:44:05PM +0800, WangYuli wrote:
> There is a spelling mistake of 'notifer' in the comment which
> should be 'notifier'.
> 
> Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Is your name all one word like that, or should there be a " " between
them?

Also, as others said, don't link to your own patch.

thanks,

greg k-h

