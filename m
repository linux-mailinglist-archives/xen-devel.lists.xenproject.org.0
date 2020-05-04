Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95091C3FF3
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 18:32:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVe02-0004vi-8i; Mon, 04 May 2020 16:31:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3Bs=6S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVe01-0004vd-1u
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 16:31:21 +0000
X-Inumbo-ID: af0370d4-8e24-11ea-9d37-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af0370d4-8e24-11ea-9d37-12813bfff9fa;
 Mon, 04 May 2020 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588609881;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UJ2gD1f2Ep4coTy/WS32mz12r1T5ew6EbcALSFcpFP4=;
 b=gEigX4dhZggxvcN3Hz7rbD+f1sLgss5P6mk5ymOB5MFag6xE/IaTzcOQ
 ST0vu2mWvyVKHZ0LaKzGuJWCoJyHsAlBeH9jvWoGvDmISfu9upR+iuHFX
 jWKXKJwuUE88674ohZ8VS5u+JZHVe9L4V/jsEgJXuyJHTU558y/ShtSSj s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BgK4pZaj3VCW72WVVesuZdmnrMhFY+dHu0CHuL+K/0nvouHf5PtiVRFYCy6xDD1psLrKxHcTcG
 cAozNAqecSOkAtx19eRiyP/erGtdW1yl9kPnl5YGYPbq5/04fPYSop1cWwlPOYVqKN4FRe8PXV
 nUAVo4HZRUupmdzs9qKX8pRZc3oMr1Ja+oLothXfCLf+facTIpNapNzDxC84rr84VkywljusEt
 Fuq+BJWj6r8JMtUTwNTxpJAcgXQqTLJbI0yX6nGaztFtGn0f/6oSEnDnDOlP1plEznflLqpHqh
 m0w=
X-SBRS: 2.7
X-MesageID: 16680042
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,352,1583211600"; d="scan'208";a="16680042"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/hvm: simplify hvm_physdev_op allowance control
Date: Mon, 4 May 2020 18:31:03 +0200
Message-ID: <20200504163103.7798-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PVHv1 dom0 was given access to all PHYSDEVOP hypercalls, and such
restriction was not removed when PVHv1 code was removed. As a result
the switch in hvm_physdev_op was more complicated than required, and
relied on PVHv2 dom0 not having PIRQ support in order to prevent
access to some PV specific PHYSDEVOPs.

Fix this by moving the default case to the bottom of the switch, since
there's no need for any fall through now. Also remove the hardware
domain check, as all the not explicitly listed PHYSDEVOPs are
forbidden for HVM domains.

Finally tighten the condition to allow usage of
PHYSDEVOP_pci_mmcfg_reserved: apart from having vPCI enabled it should
only be used by the hardware domain. Note that the code in
do_physdev_op is already restricting the call to privileged domains
only, but it can be further restricted to the hardware domain only, as
other privileged domains don't have access to MMCFG regions anyway.

Overall no functional change should arise from this change.

Reported-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hypercall.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 17ba0fe91b..c41c2179c9 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -82,26 +82,26 @@ static long hvm_grant_table_op(
 static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     const struct vcpu *curr = current;
+    const struct domain *currd = curr->domain;
 
     switch ( cmd )
     {
-    default:
-        if ( !is_hardware_domain(curr->domain) )
-            return -ENOSYS;
-        /* fall through */
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-        if ( !has_pirq(curr->domain) )
+        if ( !has_pirq(currd) )
             return -ENOSYS;
         break;
 
     case PHYSDEVOP_pci_mmcfg_reserved:
-        if ( !has_vpci(curr->domain) )
+        if ( !has_vpci(currd) || !is_hardware_domain(currd) )
             return -ENOSYS;
         break;
+
+    default:
+        return -ENOSYS;
     }
 
     if ( !curr->hcall_compat )
-- 
2.26.2


