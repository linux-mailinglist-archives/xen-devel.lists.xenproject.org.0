Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6574C199BC0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 18:37:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJpY-0002wq-Cv; Tue, 31 Mar 2020 16:33:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=57j9=5Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jJJpW-0002wl-7u
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 16:33:34 +0000
X-Inumbo-ID: 5ba71f18-736d-11ea-ba30-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ba71f18-736d-11ea-ba30-12813bfff9fa;
 Tue, 31 Mar 2020 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585672413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3ML5Ku8Nr8+73e5+YVpSz60if+JZ5mLFgPr9jvVMLvU=;
 b=Ux5eTUnWSwR/0RNvthX2iSQcMwawnJSe52qfmWE1dxWO9BIifNBnX5lm
 aOWpzQo8LytXJnJtxyRxzYAp/dQCdieOC9NpMhkkGpwdBFJh60dLD33tX
 wHScG15z73hrQnqnS9rdBVOMevbJJWhWFgDFz1VHrPl4ShahNuJBr+vlI c=;
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
IronPort-SDR: ZMeOxcwmrmZEddxj/4BF4HmLkOm3lCM7ONWEu8y9gJBpDYIo5bkwYgkTOY3ZpI/jsHcHtzLtlq
 hrCzk682dSD4cXjh19sETQ0A6+RlUEGZqkhCdrmfUaxuatLMA4zY9CTcUvo3G4owwLUu2A/s6z
 jm7uQgTbNHEA+pg3LPNyiBJ2WAFKkVB+cz2dMUNXLsIOrWGHd1q96n34XxhVe9shUjNeq39cnb
 NKDj/aUeNBGhWSABopZh8lHEj/vatJ/tXInQJmPASebi6dUlvvW11QfWw77x6Lbmqgt6k2fzaH
 4iE=
X-SBRS: 2.7
X-MesageID: 15600630
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,328,1580792400"; d="scan'208";a="15600630"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/dom0: fix copy of low 1MB data for PVH
Date: Tue, 31 Mar 2020 18:33:02 +0200
Message-ID: <20200331163302.60617-1-roger.pau@citrix.com>
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

The orders of start and end are inverted in order to calculate the
size of the copy operation.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/dom0_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 2afd44c8a4..12a82c9d7c 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -463,7 +463,7 @@ static int __init pvh_populate_p2m(struct domain *d)
             enum hvm_translation_result res =
                  hvm_copy_to_guest_phys(mfn_to_maddr(_mfn(addr)),
                                         mfn_to_virt(addr),
-                                        d->arch.e820[i].addr - end,
+                                        end - d->arch.e820[i].addr,
                                         v);
 
             if ( res != HVMTRANS_okay )
-- 
2.26.0


