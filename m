Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B730F1A9BD1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfvy-0007Bh-Gk; Wed, 15 Apr 2020 11:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fIs=57=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOfvx-0007Bc-N1
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:10:21 +0000
X-Inumbo-ID: b1d31636-7f09-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1d31636-7f09-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586949020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bVsRmRMDDBof1U/c70ZBUtPRTiWlxPgX4Wung/sAkwo=;
 b=VfI87gXGVGmJRUDBisGG/oDsUIWgO+dhy5eN3tTCZPttWpWB3w3ZbSoP
 HkIUFN5PP84k+Pg//zfxhQIqNN4OD0G+2rWqTLDoItOz/2Wy4vHaKp96x
 jQo5neFlMLjlr1oASdCggWoFcnCnrYpd3SJMQIOpwxDmbkiY/gtP/QM58 o=;
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
IronPort-SDR: vQ1Zjyzalv6YIzO8e7qZHbLJW1pUFs3APvaY+9nCMhylLOvSkbnx4IEqIZ4FJaUm36k60mUQFN
 TB8ctmU4KxaXp97/gUnXmhUBLQEfysgFxs5XOyqKI+BRTPcJfs9yyklwxJUKr7L6Fz5SphpWH0
 RS4ZnRQD0MtJR2bVQQQb6nTZ58SqJ/6DUbl7n+s2x3O8GS51hS+5AMGGp/XDswxPpeF5NPRNZj
 7p8ljeQy1u8s21gMyrk+uPMvEV+EMu8ZLIJBeDpEQWrOfEwX2FwZn/nwdxwGefQjXuUnvJt3sN
 fQ4=
X-SBRS: 2.7
X-MesageID: 16379266
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="16379266"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/altp2m: add missing break
Date: Wed, 15 Apr 2020 13:09:39 +0200
Message-ID: <20200415110939.9481-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a missing break in the HVMOP_altp2m_set_visibility case, or else
code flow will continue into the default case and trigger the assert.

Fixes: 3fd3e9303ec4b1 ('x86/altp2m: hypercall to set altp2m view visibility')
Coverity-ID: 1461759
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6f6f3f73a8..45959d3412 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4798,6 +4798,7 @@ static int do_altp2m_op(
         else
             rc = p2m_set_altp2m_view_visibility(d, idx,
                                                 a.u.set_visibility.visible);
+        break;
     }
 
     default:
-- 
2.26.0


