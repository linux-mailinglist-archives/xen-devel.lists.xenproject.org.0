Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0315060C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:22:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyahe-0007zg-1k; Mon, 03 Feb 2020 12:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyahc-0007z1-Eu
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:19:44 +0000
X-Inumbo-ID: 7115f95a-467f-11ea-8e54-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7115f95a-467f-11ea-8e54-12813bfff9fa;
 Mon, 03 Feb 2020 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580732377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0WFGWs7bnCUX3PGUbgIKTPEtr3wdb9zvoaxW+GaHoQA=;
 b=ZeyZpkMdhreBdWZH1Nax3zmOqrf2jzkw+mBgsX4XCqTJaD+OQT4wwrzl
 X9E9j50cAtbYUYGM83zlrryIr3mKx+iusxJr5I3VzpV81gQJCc2FHgdZa
 DA+J44wr5KKNQ1PjMb63Qoxjbwm2FBGJGPbLokwh0/9v3+AXw/hDcBtC0 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: me0qNDIzNnO8i9ku/mnoZSuYM1m9QbFkUvBQPbVdE9kQZ+Cm8Cdp/02CHRzdilRYuyWEvtDI6Z
 93le3OxuxWHKLrqNctY7z5fQtmOCmoD3r48Ai31Z8GjVRAajFoZxs7OAhQIdUhUFyVmL0lk+cE
 fZWIbY+pL8cpj1Zu3GNS19pcv3yabXOZA/eEd4r6Rp+6ZnX+Oa1Y1Rcd8qigJ7tUlHhgAZ23m5
 G6p5tWtJ4Fx2klj1+8241hT3xEUm0dZR6gEin0poUQpYz2Xi63lXf4iXIPlnbHSxfczcoA73oP
 Q4Q=
X-SBRS: 2.7
X-MesageID: 11851700
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="11851700"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 13:19:19 +0100
Message-ID: <20200203121919.15748-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200203121919.15748-1-roger.pau@citrix.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/4] Revert "tools/libxc: disable x2APIC when
 using nested virtualization"
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA3YjNjNWI3MGEzMjMwM2I0NmQwZDA1MWU2OTVmMThkNzJjY2U1
ZWQwIGFuZApyZS1lbmFibGVzIHRoZSB1c2FnZSBvZiB4MkFQSUMgd2l0aCBuZXN0ZWQgdmlydHVh
bGl6YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogdG9vbHMvbGlieGMv
eGNfY3B1aWRfeDg2LmMgfCAxMSAtLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jIGIvdG9vbHMv
bGlieGMveGNfY3B1aWRfeDg2LmMKaW5kZXggYWMzOGMxNDA2ZS4uMjU0MGFhMWUxYyAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfY3B1
aWRfeDg2LmMKQEAgLTY1MywxNyArNjUzLDYgQEAgaW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4
Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCiAgICAgICAgIHAtPmV4dGQuaXRzYyA9
IHRydWU7CiAgICAgICAgIHAtPmJhc2ljLnZteCA9IHRydWU7CiAgICAgICAgIHAtPmV4dGQuc3Zt
ID0gdHJ1ZTsKLQotICAgICAgICAvKgotICAgICAgICAgKiBCT0RHRTogZG9uJ3QgYW5ub3VuY2Ug
eDJBUElDIG1vZGUgd2hlbiB1c2luZyBuZXN0ZWQgdmlydHVhbGl6YXRpb24sCi0gICAgICAgICAq
IGFzIGl0IGRvZXNuJ3Qgd29yayBwcm9wZXJseS4gVGhpcyBzaG91bGQgYmUgcmVtb3ZlZCBvbmNl
IHRoZQotICAgICAgICAgKiB1bmRlcmx5aW5nIGJ1ZyhzKSBhcmUgZml4ZWQuCi0gICAgICAgICAq
LwotICAgICAgICByYyA9IHhjX2h2bV9wYXJhbV9nZXQoeGNoLCBkb21pZCwgSFZNX1BBUkFNX05F
U1RFREhWTSwgJnZhbCk7Ci0gICAgICAgIGlmICggcmMgKQotICAgICAgICAgICAgZ290byBvdXQ7
Ci0gICAgICAgIGlmICggdmFsICkKLSAgICAgICAgICAgIHAtPmJhc2ljLngyYXBpYyA9IGZhbHNl
OwogICAgIH0KIAogICAgIHJjID0geDg2X2NwdWlkX2NvcHlfdG9fYnVmZmVyKHAsIGxlYXZlcywg
Jm5yX2xlYXZlcyk7Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
