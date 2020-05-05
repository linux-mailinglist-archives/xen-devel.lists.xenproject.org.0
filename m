Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDB1C5485
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 13:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVvrq-0004os-Lf; Tue, 05 May 2020 11:36:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3eM=6T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVvrp-0004on-Qm
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 11:36:05 +0000
X-Inumbo-ID: 9a5311bc-8ec4-11ea-9887-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a5311bc-8ec4-11ea-9887-bc764e2007e4;
 Tue, 05 May 2020 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588678564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lTq7CICoEDGNph2EL4IdzyBFICd4qnvEDY+8bJyNrWk=;
 b=U2dJUsaJl+/DCJ66udtViXKWuppljyZejpf0T3TMqNdlzDSt/LsLzO28
 vR9nplt6u20s9tJ9H7AKwixlBdxhfIQ/JKzjlQ4l6xFKJ0ImGBx2J+yql
 Ii/YiNiRyjT3iJ28Ls83Jr6f9edcXH7jR4giV7aH2Xy439BYDFBZHUkpW 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +9OMVbVe8bsqxerofCQojVVSJyGyInTtLhDaYmw6qBpxuZUC7IWDfRCsomMF1Sk0kEeIq46sW7
 lCfPoaAIBIg8OD1cRafzRt+0pin7F+f8c7piPTvRqzfXfXLQq4n1QGICSmSNUYWyZOi7g0qAYQ
 mUiivOvUttrQSnZU3+gsp+ArEQOB+zHQRRioUO8ss3yAsXhsBdQHOcZzEzTul+qg469zniVR9X
 nPxfjCxL2Gn9/Rl2RLnjbo1YbIbJQjQ96UeupiGKNSn+C9glpDvzUMTfiLi8hyTaF28sYEEJ9f
 itY=
X-SBRS: 2.7
X-MesageID: 17453108
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,354,1583211600"; d="scan'208";a="17453108"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/pv: Compile out emul-gate-op in !CONFIG_PV32 builds
Date: Tue, 5 May 2020 12:35:37 +0100
Message-ID: <20200505113537.29968-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The caller is already guarded by is_pv_32bit_vcpu().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/pv/Makefile b/xen/arch/x86/pv/Makefile
index cf28434ba9..75b01b0062 100644
--- a/xen/arch/x86/pv/Makefile
+++ b/xen/arch/x86/pv/Makefile
@@ -2,7 +2,7 @@ obj-y += callback.o
 obj-y += descriptor-tables.o
 obj-y += domain.o
 obj-y += emulate.o
-obj-y += emul-gate-op.o
+obj-$(CONFIG_PV32) += emul-gate-op.o
 obj-y += emul-inv-op.o
 obj-y += emul-priv-op.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
-- 
2.11.0


