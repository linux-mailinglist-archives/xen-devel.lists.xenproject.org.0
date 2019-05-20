Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FE23C7D
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:45:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkRX-0006o5-Aj; Mon, 20 May 2019 15:43:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSkRV-0006nc-7l
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:43:13 +0000
X-Inumbo-ID: f9434e59-7b15-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f9434e59-7b15-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 15:43:12 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0TTEQkWmNlb99UCq+fGMOKVRwTb0AyD0JIqyyfktnyBcc3cFT6NLSGBn8cm+v1QU3bFCJVx8VQ
 fhrE+8W+ryL/FQd/sEy6+jQ8YIMijO8S4xriZIacALGkEujcpGWp5ZqIVtDCRAGoWtb4hvICOi
 g8XcTVLUCEVbrZRt1fBNm71Rd+lx9dYQ0RElvGI9V6r76PsV9k41UUBWtVan9k4f9ai+BYPxpw
 hD2rMIsxkGJUow1j6cjflu2vAbIYnt60NZstdnx0t0IZ8lV76iJ/zFxKxM2Z9z05aGfV6zXgb/
 Cs4=
X-SBRS: 2.7
X-MesageID: 661831
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="661831"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 16:41:46 +0100
Message-ID: <20190520154147.30675-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
References: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 3/4] mg-repro-setup: Introduce
 `statictask' variable
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIG1ha2UgYSBtb2RlIHdoZXJlIHdlIGRvbid0IHNldCBPU1NURVNUX1RB
U0suICBUaGUKcmVzdWx0IGlzIHRoYXQgb3VyIHN1YnByb2Nlc3NlcyB3aWxsIGRvIHdoYXRldmVy
IHRoZXkgdXN1YWxseSBkby4KClRob3NlIGFyZSBtZy1hbGxvY2F0ZSAod2hpY2ggd291bGQgYWxs
b2NhdGUgZm9yIG91ciBzdGF0aWMgdGFzaykgYW5kCm1nLWV4ZWN1dGUtZmxpZ2h0IHdoaWNoIHdp
bGwgbWFrZSBhIGR5bmFtaWMgdGFzay4gIFdlIG11c3QgdGhlcmVmb3JlCnByZXZlbnQgbWctYWxs
b2NhdGUgZnJvbSBydW5uaW5nIHNpbmNlIHRoZSBhbGxvY2F0aW9ucyB3b3VsZCBub3QgYmUKdXNl
YWJsZSBmb3IgdGhlIGZsaWdodCBleGVjdXRpb24uCgpObyBmdW5jdGlvbmFsIGNoYW5nZSB5ZXQs
IHNpbmNlIG5vdGhpbmcgc2V0cyBzdGF0aWN0YXNrPWZhbHNlIGFuZAp0aGVyZWZvcmUgT1NTVEVT
VF9UQVNLIHdvdWxkIGFsd2F5cyBiZSBzZXQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZy1yZXByby1zZXR1cCB8IDI4ICsrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21nLXJlcHJvLXNldHVwIGIvbWctcmVwcm8t
c2V0dXAKaW5kZXggNWE1MmU2MTcuLmI2MDM4OWQ4IDEwMDc1NQotLS0gYS9tZy1yZXByby1zZXR1
cAorKysgYi9tZy1yZXByby1zZXR1cApAQCAtMTAzLDYgKzEwMyw3IEBAIGR1cmF0aW9uPTI4ZAog
Ymxlc3Npbmc9cGxheQogc2tpcGNhcHR1cmU9dHJ1ZQogYXV0b2FsbG9jPWZhbHNlCitzdGF0aWN0
YXNrPXRydWUKIAogd2hpbGUgdHJ1ZTsgZG8KIAljYXNlICIkMSIgaW4KQEAgLTExNyw3ICsxMTgs
NyBAQCB3aGlsZSB0cnVlOyBkbwogCS10PyopCQlkdXJhdGlvbj0ke2FyZyMtdH0JCTs7CiAJLS1y
b2d1ZSkJZHVyYXRpb249JycJCQk7OwogCS0tY2FwdHVyZSkJc2tpcGNhcHR1cmU9ZmFsc2UJCTs7
Ci0JLS1hdXRvYWxsb2Mtbm9mcmVlKSBhdXRvYWxsb2M9dHJ1ZQkJOzsKKwktLWF1dG9hbGxvYy1u
b2ZyZWUpIGF1dG9hbGxvYz10cnVlOyBzdGF0aWN0YXNrPXRydWUgOzsKIAktbCopCQlsb2dmaWxl
PSR7YXJnIy1sfQkJOzsKIAktcl4qfC1yISopCWFkanVzdHNldHMrPSgiJHthcmcjLXJ9IikJOzsK
IAkjIF4gdHdvIHBhdHRlcm5zIGJlY2F1c2UgdGhlcmUncyBubyB3YXkgaW4gYmFzaCB0byB3cml0
ZQpAQCAtMjU4LDE2ICsyNTksMjUgQEAgaWYgWyAieCRyZWJ1aWxkc19mbGlnaHQiICE9IHggXTsg
dGhlbgogCWZpCiBmaQogCi1PU1NURVNUX1RBU0s9JChwZXJsIC1lICcKLQl1c2UgT3NzdGVzdDsK
LQl1c2UgT3NzdGVzdDo6RXhlY3V0aXZlOwotCWNzcmVhZGNvbmZpZygpOwotCWZpbmR0YXNrKCk7
Ci0JcHJpbnRmICIlc1xuIiwgJEVOVnsnT1NTVEVTVF9UQVNLJ30gb3IgZGllICQhOwotJykKLWV4
cG9ydCBPU1NURVNUX1RBU0sKK2lmICRzdGF0aWN0YXNrOyB0aGVuCisgICAgICAgIE9TU1RFU1Rf
VEFTSz0kKHBlcmwgLWUgJworICAgICAgICAJdXNlIE9zc3Rlc3Q7CisgICAgICAgIAl1c2UgT3Nz
dGVzdDo6RXhlY3V0aXZlOworICAgICAgICAJY3NyZWFkY29uZmlnKCk7CisgICAgICAgIAlmaW5k
dGFzaygpOworICAgICAgICAJcHJpbnRmICIlc1xuIiwgJEVOVnsnT1NTVEVTVF9UQVNLJ30gb3Ig
ZGllICQhOworICAgICAgICAnKQorICAgICAgICBleHBvcnQgT1NTVEVTVF9UQVNLCitmaQogCiBp
ZiBbICIke2FsbG9jX2lkZW50c1sqXX0iIF07IHRoZW4KKyAgICAgICAgaWYgWyB4IiRPU1NURVNU
X1RBU0siID0geCBdOyB0aGVuCisgICAgICAgICAgICAgICAgIyBXZSB3b3VsZCBoYXZlIHRvIG1h
a2UgYSBkeW5hbWljIHRhc2sgYW5kIGhvbGQgdGhlCisgICAgICAgICAgICAgICAgIyAgZmQgZm9y
IGl0IGluIHRoaXMgc2NyaXB0LiAgV291bGQgYmUgcXVpdGUgYXdrd2FyZC4KKyAgICAgICAgICAg
ICAgICBlY2hvID4mMiAnY2Fubm90IGhhbmQtYWxsb2NhdGUgaW4gYSB3YXkgdGhhdCB3aWxsIGZy
ZWUnCisgICAgICAgICAgICAgICAgZXhpdCAxCisgICAgICAgIGZpCisKIAlwcm9ncmVzcyAiYWxs
b2NhdGluZyAke2FsbG9jX2lkZW50c1sqXX0gLi4uIgogCWFsbG9jX291dHB1dD10bXAvJGZsaWdo
dC5hbGxvY2F0aW9ucwogCS4vbWctYWxsb2NhdGUgXAotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
