Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ECD5089F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 12:20:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfM2a-00026X-40; Mon, 24 Jun 2019 10:17:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TGna=UX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfM2Y-000261-Cv
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 10:17:34 +0000
X-Inumbo-ID: 472b224f-9669-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 472b224f-9669-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 10:17:32 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vcZY91gw9NUpVNiDBKrFKna45VwhhCLqdL1UbvdMqKANtG3BlwPpQTsVcJed8+MhEUjkPOTS5v
 IsOGkC3uDstIVtjXE6myWW/FkDldScjN4nLRuFILIJcuTQAvw1Broc9Hq9qbakdw04KBBV+CQH
 WbxEjJ65D0eKL87QWw9HDEFI/3GDSenVWi4NzX+0Jj36mRn6ZYPkRS6aRUBthrU8cFxUFtUezz
 6QEf3/upIoc16ek+QT9zfxypZBrqX2VXeSsaSdtcWTwUPYB8Tp45LiFmqu7U7dy387zqmoWxAO
 h2c=
X-SBRS: 2.7
X-MesageID: 2131194
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,411,1557201600"; 
   d="scan'208";a="2131194"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Jun 2019 11:17:21 +0100
Message-ID: <20190624101723.23291-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] xen/ubsan: Multiple fixes
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgZml4ZXMgYnVpbGRpbmcgd2l0aCBHQ0MgOCBhbmQgbGF0ZXIsIGFuZCBmaXhl
cyBib290aW5nIG5hdGl2ZSB3aXRoCkdDQyA1IGFuZCBsYXRlci4KCkFuZHJldyBDb29wZXIgKDIp
OgogIHhlbi91YnNhbjogRG9uJ3QgcGVyZm9ybSBhbGlnbm1lbnQgY2hlY2tpbmcgb24gc3VwcG9y
dGluZyBjb21waWxlcnMKICB4ZW4vdWJzYW46IFN1cHBvcnQgZm9yIC1mc2FuaXRpc2U9YnVpbHRp
bgoKIHhlbi9SdWxlcy5tayAgICAgICAgICAgICB8ICA0ICsrKy0KIHhlbi9jb21tb24vdWJzYW4v
dWJzYW4uYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwogeGVuL2NvbW1vbi91YnNhbi91YnNh
bi5oIHwgIDkgKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
