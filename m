Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F7E1D9DC5
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 19:21:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb5v0-0003vU-Gs; Tue, 19 May 2020 17:20:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B//R=7B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jb5uy-0003vI-Fx
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 17:20:40 +0000
X-Inumbo-ID: 0dc478a8-99f5-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dc478a8-99f5-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SOZlp61CWrsQD7qa0dasRDDLg9x7AQZ16sVemh7nqoo=; b=VlugWGv3QcqQsn6sakAdRX3wC+
 jaNvLHe2n3WAdZIvmI1rzb9fMEeBAk8bDRF0s/TStPZ2dxwYkgJiPS1FrEXBtGhFAKZptrSLBDCWq
 j0xnHURlEPqkzKUhfrclevpmamAyl9anxhdxDUvs1w1f2zjt7hZqvMLmoQmMxoYfRMnE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jb5ut-0006gs-Sx; Tue, 19 May 2020 17:20:35 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jb5ut-0003ie-Js; Tue, 19 May 2020 17:20:35 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 for-4.14 3/3] xen/arm: plat: Allocate as much as possible
 memory below 1GB for dom0 for RPI
Date: Tue, 19 May 2020 18:20:28 +0100
Message-Id: <20200519172028.31169-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519172028.31169-1-julien@xen.org>
References: <20200519172028.31169-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, Julien Grall <jgrall@amazon.com>,
 roman@zededa.com, jeff.kubascik@dornerworks.com, minyard@acm.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The raspberry PI 4 has devices that can only DMA into the first GB of
the RAM. Therefore we want allocate as much as possible memory below 1GB
for dom0.

Use the recently introduced dma_bitsize field to specify the DMA width
supported.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reported-by: Corey Minyard <minyard@acm.org>
Tested-by: Corey Minyard <cminyard@mvista.com>

---
    Changes in v2:
        - 1G is 30 bits not 10!
        - Add Corey's tested-by
---
 xen/arch/arm/platforms/brcm-raspberry-pi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
index b697fa2c6c0e..f5ae58a7d5f2 100644
--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
+++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
@@ -43,6 +43,7 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
 PLATFORM_START(rpi4, "Raspberry Pi 4")
     .compatible     = rpi4_dt_compat,
     .blacklist_dev  = rpi4_blacklist_dev,
+    .dma_bitsize    = 30,
 PLATFORM_END
 
 /*
-- 
2.17.1


