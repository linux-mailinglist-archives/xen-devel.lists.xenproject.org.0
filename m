Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A51913CD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 16:02:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGl2a-0003J9-Gz; Tue, 24 Mar 2020 15:00:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGl2Z-0003J4-Aj
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:00:27 +0000
X-Inumbo-ID: 319d031c-6de0-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 319d031c-6de0-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585062026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uz4Sy1jYWR9Vj5L6zBEJzx886dGphqoV9Swq2hMNCsc=;
 b=AT3dvgHHARMkSke+oB5uiZ2jevpOU/sYCoJfaTk/XAa6r/soPy5/gKIg
 /IVHjo9QRNa8eYPzhDzhXUdK+fzgKM/wej/3F9bllFZR9lBHmAiwx2qqd
 83iFpNfBigzYlbkUnNL8aoBevZyrrwDVs9hty32kFXn1x1xU9XuC1nKro M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YCwg7q0KwdVY96iyKyprGhvcUpIMhF5ZtrnBAK+bwM9Pfso8az5/0cXLxWjW0rbNRCmPQce0YJ
 xunPaMFS2oSKdxY5wn1t7mHyGBgWaX59MPoIp0Qzfkdlz5+B3yOzrxelV39hxfGRiZ8/1DuWUB
 DAR2gmxTdHlMbVOhR2+A2IZSwRt67js3hq2xZTgY9bZG1Bdi93cvBm/7jVXTvJ5G8Ju1JeclXk
 RYR1FKQkS3y4JvmUfE0PvGnnHY6DbuXqgxw++MAiud9kpB/aqGn0yd/or4ZEjxIbTD1EQlz4hQ
 J28=
X-SBRS: 2.7
X-MesageID: 15193080
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="15193080"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Date: Tue, 24 Mar 2020 16:00:15 +0100
Message-ID: <20200324150015.50496-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200324150015.50496-1-roger.pau@citrix.com>
References: <20200324150015.50496-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH 2/2] xen: enable BALLOON_MEMORY_HOTPLUG by
 default
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Without it a PVH dom0 is mostly useless, as it would balloon down huge
amounts of RAM in order get physical address space to map foreign
memory and grants, ultimately leading to an out of memory situation.

Such option is also needed for HVM or PVH driver domains, since they
also require mapping grants into physical memory regions.

Suggested-by: Ian Jackson <ian.jackson@eu.citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 57ddd6f4b729..c344bcffd89d 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -13,6 +13,7 @@ config XEN_BALLOON
 config XEN_BALLOON_MEMORY_HOTPLUG
 	bool "Memory hotplug support for Xen balloon driver"
 	depends on XEN_BALLOON && MEMORY_HOTPLUG
+	default y
 	help
 	  Memory hotplug support for Xen balloon driver allows expanding memory
 	  available for the system above limit declared at system startup.
-- 
2.25.0


