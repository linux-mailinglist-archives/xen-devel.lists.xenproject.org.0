Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BFD2A88BF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 22:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20190.45889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kamb7-0003bI-Sw; Thu, 05 Nov 2020 21:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20190.45889; Thu, 05 Nov 2020 21:15:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kamb7-0003at-Pl; Thu, 05 Nov 2020 21:15:09 +0000
Received: by outflank-mailman (input) for mailman id 20190;
 Thu, 05 Nov 2020 21:15:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kamb6-0003an-IY
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 21:15:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 215af06f-87c6-4754-914e-9f4172478095;
 Thu, 05 Nov 2020 21:15:07 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0426920724;
 Thu,  5 Nov 2020 21:15:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kamb6-0003an-IY
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 21:15:08 +0000
X-Inumbo-ID: 215af06f-87c6-4754-914e-9f4172478095
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 215af06f-87c6-4754-914e-9f4172478095;
	Thu, 05 Nov 2020 21:15:07 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0426920724;
	Thu,  5 Nov 2020 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604610906;
	bh=elF/Vxj2afwaRZRW6dqOS+Fhq/qJJgeJJ1Y621Iu2JA=;
	h=Date:From:To:cc:Subject:From;
	b=oP67AJyC7TFmD/Rd8exjUFC6dOnMB03jKiMiDgBfYDlG5hYtQ5cIv+uvhCw5qO7Gc
	 xn7rZ1i1RyvcNc9imOzyIvtUDpB7Ay7SGUlqe7TsFQpB5sBT74JvMbDaJrh1kLdf3Q
	 qdHE2vSh6cN4mWziqxl7jNiCXskegwSm1k1lsZk0=
Date: Thu, 5 Nov 2020 13:15:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: takahiro.akashi@linaro.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ian.jackson@eu.citrix.com, wl@xen.org, 
    anthony.perard@citrix.com, sstabellini@kernel.org
Subject: [PATCH] libxl: set vuart_gfn in libxl__build_hvm
Message-ID: <alpine.DEB.2.21.2011051312120.2323@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

libxl: set vuart_gfn in libxl__build_hvm

Setting vuart_gfn was missed when switching ARM guests to the PVH build.
Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
dom->vuart_gfn.

Without this change, xl console cannot connect to the vuart console (-t
vuart), see https://marc.info/?l=xen-devel&m=160402342101366.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index f8661e90d4..36fe8915e7 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
         LOG(ERROR, "hvm build set params failed");
         goto out;
     }
+    state->vuart_gfn = dom->vuart_gfn;
 
     rc = hvm_build_set_xs_values(gc, domid, dom, info);
     if (rc != 0) {

