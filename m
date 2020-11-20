Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE912BB518
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 20:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32557.63662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgBwv-0003KP-MO; Fri, 20 Nov 2020 19:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32557.63662; Fri, 20 Nov 2020 19:20:01 +0000
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
	id 1kgBwv-0003JI-FO; Fri, 20 Nov 2020 19:20:01 +0000
Received: by outflank-mailman (input) for mailman id 32557;
 Fri, 20 Nov 2020 18:32:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M2Yq=E2=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
 id 1kgBDL-0006fA-AT
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:32:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4aa6d7ba-f755-4dda-9a45-df51910e4b61;
 Fri, 20 Nov 2020 18:32:53 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E38B524197;
 Fri, 20 Nov 2020 18:32:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=M2Yq=E2=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
	id 1kgBDL-0006fA-AT
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:32:55 +0000
X-Inumbo-ID: 4aa6d7ba-f755-4dda-9a45-df51910e4b61
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4aa6d7ba-f755-4dda-9a45-df51910e4b61;
	Fri, 20 Nov 2020 18:32:53 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E38B524197;
	Fri, 20 Nov 2020 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605897173;
	bh=GZOB0IrDdnCJYoRPlfA0gPLtj77XQYyYZviKM6e//7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxwEEcwauxahs/YS06KosdG+kfU0QYX/CNXJsLjFY/I/IEeXbs3S6BntDjjFzARac
	 ehmJRMC3REHriA8zRE/J/MIeGvJ2lsg9FlcRz6tF5irxnVizR03hvPO8OiHUmwm6qr
	 ZjzUvYeaIBKuXmmG1X82Jc6XpGzzMvcigHSA+hYc=
Date: Fri, 20 Nov 2020 12:32:58 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 058/141] xen-blkfront: Fix fall-through warnings for Clang
Message-ID: <33057688012c34dd60315ad765ff63f070e98c0c.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/block/xen-blkfront.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 48629d3433b4..34b028be78ab 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2462,6 +2462,7 @@ static void blkback_changed(struct xenbus_device *dev,
 			break;
 		if (talk_to_blkback(dev, info))
 			break;
+		break;
 	case XenbusStateInitialising:
 	case XenbusStateInitialised:
 	case XenbusStateReconfiguring:
-- 
2.27.0


