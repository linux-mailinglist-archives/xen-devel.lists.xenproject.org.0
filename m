Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ABEA3A1E3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891957.1300969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPyb-0005Mn-8d; Tue, 18 Feb 2025 15:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891957.1300969; Tue, 18 Feb 2025 15:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPyb-0005KD-5g; Tue, 18 Feb 2025 15:57:37 +0000
Received: by outflank-mailman (input) for mailman id 891957;
 Tue, 18 Feb 2025 15:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J8HI=VJ=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1tkPyY-0004rx-TM
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:57:35 +0000
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e25fb20-ee11-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 16:57:30 +0100 (CET)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37344)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkPy8-0002Wi-1o;
 Tue, 18 Feb 2025 15:57:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkPy4-0007NT-0f;
 Tue, 18 Feb 2025 15:57:04 +0000
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
X-Inumbo-ID: 0e25fb20-ee11-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KZBDJtxcaW+EbK7xr8lVciQc5WFsH1M+cUzHurUjtms=; b=TPgp3EXJIxknNdQRFhGKtjsSGD
	zh4oCSSNqtHdPQMgdkyQvRpsrKvYx+FfAcbjG1SEjN46nlQGNh1VzvYSPlgseTPRMjdLM/i9cpMj9
	fLr8mhI8SxYDvXtugtqKsWdgSXeq87xwkVhYvmajXXxibojsAq/8Wk39wKqtPz3T4beE9QXZafPNF
	soUyX6Y40/lic0qMOCa+I1W6Oi9kgpSzpKz0zAjPH5iiEZvMycxwI/2JnlVvGxZaUgUy6GfjlffP5
	GYZGJ2RSLoTewgKGctKEHMR4CVHcP5yxhFQXwUwiw1GhFZxNPyh87MOEhHyi/DyOlzN1euG+K476r
	oh59WZhw==;
Date: Tue, 18 Feb 2025 15:57:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 06/25] drm/armada: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <Z7St0O3A_mXEYK49@shell.armlinux.org.uk>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-7-tzimmermann@suse.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Feb 18, 2025 at 03:23:29PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>

armada_pitch() does have some special alignment (it aligns the pitch to
128 bytes). I've no idea what drm_mode_size_dumb() does. Can you check
whether it does the same please?

If it doesn't, then this patch is incorrect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

