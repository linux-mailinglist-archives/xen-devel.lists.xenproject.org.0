Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E5246B9D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:59:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hXO-00077g-FR; Mon, 17 Aug 2020 15:59:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7hXN-00073P-3N
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:59:05 +0000
X-Inumbo-ID: 51b78f9d-fad0-4c41-a9e0-5c7261eb96e8
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51b78f9d-fad0-4c41-a9e0-5c7261eb96e8;
 Mon, 17 Aug 2020 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597679940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F/Ls1vXs3JLCaDO3OMKs0GkvZz4YTpGo+BI7GjCWN+A=;
 b=Ju688uKMZP8oM6iW5pYVm6sT6VpHCOb6d/+jNCy0E6tygRBsYUDnhM3V
 LPhBCCtaeLzXd4EUmT1V9S1FMDk6nCx8huqfmqNFr9VXg/GcBC3XcK9qL
 qxqtcdPX3Ni2uluM9JzWeVx3aiFGI47EefBthoO30jhrvo5ylkVpsFWuE s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OqmOhAaQ34hFtLweGTvGmfWDIiPIs06YVkYMJRpw6AFmKK0+l1Txm31nZnCnpQM9eVpSLo7Skb
 0aXOrZAPGA411m/oYh8YdsWjiQPIIW/ZJZsFHZxcHpSed2tDJMb4Jh712xdb4yTzGvi9k/Q5X6
 Ue9f8wyRs56iaQdwhT2M6ZsUXH2Wf4tv1CEWRq9PSQoCFbFkT303lbN/N8qheDf6RR+4w6ifAm
 hhenlmGVldRPNfPkMQphPMZwq1fGTwlJ21WQbQ6m+nke3V44SQOa6LChrQ/7vEq2IO4RgFtej5
 XjI=
X-SBRS: 2.7
X-MesageID: 24673333
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24673333"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/8] x86/pv: allow reading APIC_BASE MSR
Date: Mon, 17 Aug 2020 17:57:54 +0200
Message-ID: <20200817155757.3372-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817155757.3372-1-roger.pau@citrix.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linux PV guests will attempt to read the APIC_BASE MSR, so just report
a default value to make Linux happy.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index ff87c7d769..554a95ae8d 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -872,6 +872,13 @@ static int read_msr(unsigned int reg, uint64_t *val,
 
     switch ( reg )
     {
+    case MSR_APIC_BASE:
+        /* Linux PV guests will attempt to read APIC_BASE. */
+        *val = APIC_BASE_ENABLE | APIC_DEFAULT_PHYS_BASE;
+        if ( !curr->vcpu_id )
+            *val |= APIC_BASE_BSP;
+        return X86EMUL_OKAY;
+
     case MSR_FS_BASE:
         if ( is_pv_32bit_domain(currd) )
             break;
-- 
2.28.0


