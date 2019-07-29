Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A03079245
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 19:42:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs9bl-0005pk-S2; Mon, 29 Jul 2019 17:38:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs9bk-0005pY-Nd
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 17:38:48 +0000
X-Inumbo-ID: b7d81a13-b227-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b7d81a13-b227-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 17:38:47 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hbfmVdnjpUKZbatcRGSl6t7JhipylCxKlnV/bJlfZFlDJ2OQDc9JzO7S1r18f8he7ARruUXR6K
 Ym5pi70rLSoXXAk33fx2W4hRvZhDyeArzdQMsPmigBnUQ6Iq1VqsVvWDorsSZoeHpPMh4OV83o
 zn+sz6iuHnoo20bpFxTi99OwNvKSUj/9mhYrpRwt2VBkACFdIEwRqevsWblMDObMt76czhkJjB
 UzsMXmxnFozS3JxdhRFRcYOkOdfJzx/H/bnsTJzrYtj1w2pIr+Z73vNt2im4ZrdwOxESGEEF7I
 VcU=
X-SBRS: 2.7
X-MesageID: 3716345
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3716345"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 18:38:41 +0100
Message-ID: <20190729173843.21586-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IGRhdGEgbGVha2FnZSBjYXVzZWQgYnkgaW5zdWZmaWNpZW50IGxpbmtlciBsZXZlbCBhbGln
bm1lbnQuCgpBbmRyZXcgQ29vcGVyICgyKToKICB4ZW4vbGluazogSW50cm9kdWNlIC5ic3MucGVy
Y3B1LnBhZ2VfYWxpZ25lZAogIHg4Ni94cHRpOiBEb24ndCBsZWFrIFRTUy1hZGphY2VudCBwZXJj
cHUgZGF0YSB2aWEgTWVsdGRvd24KCiB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TICAgICAgICAgIHwg
IDcgKysrKystLQogeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICB8ICAzIC0tLQogeGVu
L2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICB8ICA2ICsrKysrKwogeGVuL2FyY2gveDg2L3hl
bi5sZHMuUyAgICAgICAgICB8ICA5ICsrKysrKystLQogeGVuL2luY2x1ZGUvYXNtLWFybS9wZXJj
cHUuaCAgICB8ICA2ICsrLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wZXJjcHUuaCAgICB8ICA2
ICsrLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCB8ICA0ICsrLS0KIHhlbi9p
bmNsdWRlL3hlbi9wZXJjcHUuaCAgICAgICAgfCAxMCArKysrKysrKy0tCiA4IGZpbGVzIGNoYW5n
ZWQsIDMyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
