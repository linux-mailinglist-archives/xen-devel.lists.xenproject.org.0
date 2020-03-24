Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F31913D0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 16:03:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGl2f-0003Jo-QV; Tue, 24 Mar 2020 15:00:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGl2e-0003Je-BO
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:00:32 +0000
X-Inumbo-ID: 32540df0-6de0-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32540df0-6de0-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585062027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ssXAEeDvel0Jf7gmmpPeu8hMRNYSVWL/a7oAMPsVjt4=;
 b=CXqxsWswotXjfTgXdqENKoOI66cO5CaBE2hUYXZMoh3LiGhw9nqOTdzK
 xMCzh1QzBpUtkeZbCHKcF4CtJNLVH4mxzdDqu/XpnNfpwN2SGQmBW7hmN
 W3DjYDBj7O19DeFhfd2n+7oM5UIvbp52wj6cDYjC9wiQzxLANcpXCKi2R s=;
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
IronPort-SDR: 229YkSUPjTs2vF4LrHxAgXY+0/Cxpb0vjzrzH+SAqyCmieLe/OXnOTr2iYuhQQYLYQGzbEhzZ2
 LVaJsD+YCTD7R5RnydHpvwGjcWkpBXoBE2bYSPnPELLfD66DWK7DKj71KdmYeJEKXWxPA3FmTk
 lO7BeEP9kxCvTYODa9N22iDd5RWV+Is0Stno94+OksnMGfdPoqSmqX3Ie7W7tDpQQDvU0q6ixo
 H4UR9U5rhZ8+5qOxxNeAa1Rb7ooSq5lKz1fJ8zNdGSi+vDaldHSaGfgFhtlSX5QXFf1TG77Izk
 s+s=
X-SBRS: 2.7
X-MesageID: 15193081
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="15193081"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Date: Tue, 24 Mar 2020 16:00:14 +0100
Message-ID: <20200324150015.50496-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH 1/2] xen: expand BALLOON_MEMORY_HOTPLUG
 description
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To mention it's also useful for PVH or HVM domains that require
mapping foreign memory or grants.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 61212fc7f0c7..57ddd6f4b729 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -19,6 +19,10 @@ config XEN_BALLOON_MEMORY_HOTPLUG
 	  It is very useful on critical systems which require long
 	  run without rebooting.
 
+	  It's also very useful for translated domains (PVH or HVM) to obtain
+	  unpopulated physical memory ranges to use in order to map foreign
+	  memory or grants.
+
 	  Memory could be hotplugged in following steps:
 
 	    1) target domain: ensure that memory auto online policy is in
-- 
2.25.0


