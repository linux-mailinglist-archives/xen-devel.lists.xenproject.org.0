Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFBCB0A5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 22:59:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG89S-00050c-QS; Thu, 03 Oct 2019 20:56:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hAba=X4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iG89Q-00050K-Os
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 20:56:40 +0000
X-Inumbo-ID: 47c5a77c-e620-11e9-8c93-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47c5a77c-e620-11e9-8c93-bc764e2007e4;
 Thu, 03 Oct 2019 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570136193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=30OKogFyaLUoOPEbKKzM8p6/WDDwpWl9n95tKfgISxM=;
 b=hLZhEb5Fahc+l0ynNzwFdzSc7iDC3xbicfofSkKcNPMT+Kr8+D5juSWD
 N4D1MhiMaff88RXCV8rPq7O2bSrtnh28zEyWK+KgHF6YE+gD29sq/wu9X
 IcTRlkeReqxphycGrUVdz3jBWEdqX5uP1Wqgv+64L/F39bJG3fcah52Kg o=;
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
IronPort-SDR: XdZqhFxNrTVzcQbuQORjfZmViqm8fy2LksKI+K/Wz3gqlSEEEJQUGBswrej7/BgRoXfrB1VszA
 YII6f6ipM1U30bnDBsd19fJ8eZ/Zr9DgJm/2Bne7uf2bO6vHdCn9U9xOMCCQNbEFYkX7CktLZF
 4mnfng+Sxn4DxIO9gOjonDLzoxpPMybnb1rQLGs0rpwcnJWyl7jTHbYAFY7PVOV4v2oR6pj201
 vaZ+ljc9WFgQrEYBv/2liwXsqKsn3tNsMC732HQnh/fl80u2NI/jkr0xOtzlepugOaybwyUgjj
 xCI=
X-SBRS: 2.7
X-MesageID: 6810846
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,253,1566878400"; 
   d="scan'208";a="6810846"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 21:56:20 +0100
Message-ID: <20191003205623.20839-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/4] docs/sphinx
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Rich Persaud <persaur@gmail.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFyaW91cyBwaWVjZXMgb2YgU3BoaW54IGRvY3VtZW50YXRpb24gaW1wcm92ZW1lbnRzIGludGVu
ZGVkIGZvciBpbmNsdXNpb24KaW50byBYZW4gNC4xMy4gIFJlbmRlcmVkIHJlc3VsdHMgY2FuIGJl
IHZpZXdlZCBhdAoKICBodHRwczovL2FuZHJld2Nvb3AteGVuLnJlYWR0aGVkb2NzLmlvL2VuL2Rv
Y3MtZGV2ZWwvaW5kZXguaHRtbAoKd2l0aAoKICBodHRwczovL2FuZHJld2Nvb3AteGVuLnJlYWR0
aGVkb2NzLmlvL2VuL2RvY3MtZGV2ZWwvYWRtaW4tZ3VpZGUvaW50cm9kdWN0aW9uLmh0bWwKICBo
dHRwczovL2FuZHJld2Nvb3AteGVuLnJlYWR0aGVkb2NzLmlvL2VuL2RvY3MtZGV2ZWwvZ2xvc3Nh
cnkuaHRtbAogIGh0dHBzOi8vYW5kcmV3Y29vcC14ZW4ucmVhZHRoZWRvY3MuaW8vZW4vZG9jcy1k
ZXZlbC9taXNjL3RlY2gtZGVidC5odG1sCgpiZWluZyB0aGUgbm90YWJsZSBhZGRpdGlvbnMgZnJv
bSB0aGlzIHNlcmllcy4KCkFuZHJldyBDb29wZXIgKDQpOgogIGRvY3Mvc3BoaW54OiBMaWNlbnNl
IGNvbnRlbnQgd2l0aCBDQy1CWS00LjAKICBkb2NzL3NwaGlueDogSW5kZW50IGNsZWFudXAKICBk
b2NzL3NwaGlueDogSW50cm9kdWN0aW9uCiAgZG9jcy9zcGhpbng6IFRlY2huaWNhbCBEZWJ0Cgog
Q09QWUlORyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArCiBkb2NzL1JF
QURNRS5zb3VyY2UgICAgICAgICAgICAgICAgICAgICAgIHwgIDMyICsrKysrKysrCiBkb2NzL2Fk
bWluLWd1aWRlL2luZGV4LnJzdCAgICAgICAgICAgICAgIHwgICA1ICstCiBkb2NzL2FkbWluLWd1
aWRlL2ludHJvZHVjdGlvbi5yc3QgICAgICAgIHwgIDQwICsrKysrKysrKysKIGRvY3MvYWRtaW4t
Z3VpZGUvbWljcm9jb2RlLWxvYWRpbmcucnN0ICAgfCAgIDIgKwogZG9jcy9hZG1pbi1ndWlkZS94
ZW4tb3ZlcnZpZXcuZHJhd2lvLnN2ZyB8ICA5NyArKysrKysrKysrKysrKysrKysrKysrKwogZG9j
cy9jb25mLnB5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArKy0KIGRvY3MvZ2xv
c3NhcnkucnN0ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTIgKysrKysrKysrKysrKwogZG9j
cy9ndWVzdC1ndWlkZS9pbmRleC5yc3QgICAgICAgICAgICAgICB8ICAgNiArLQogZG9jcy9ndWVz
dC1ndWlkZS94ODYvaHlwZXJjYWxsLWFiaS5yc3QgICB8ICA1MiArKysrKysrLS0tLS0tCiBkb2Nz
L2d1ZXN0LWd1aWRlL3g4Ni9pbmRleC5yc3QgICAgICAgICAgIHwgICA2ICstCiBkb2NzL2h5cGVy
dmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QgIHwgICA2ICstCiBkb2NzL2h5cGVydmlzb3It
Z3VpZGUvaW5kZXgucnN0ICAgICAgICAgIHwgICA2ICstCiBkb2NzL2luZGV4LnJzdCAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDM4ICsrKysrKystLQogZG9jcy9taXNjL3RlY2gtZGVidC5y
c3QgICAgICAgICAgICAgICAgICB8IDEzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAxNSBmaWxlcyBjaGFuZ2VkLCA0NDQgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9SRUFETUUuc291cmNlCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZG9jcy9hZG1pbi1ndWlkZS9pbnRyb2R1Y3Rpb24ucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9j
cy9hZG1pbi1ndWlkZS94ZW4tb3ZlcnZpZXcuZHJhd2lvLnN2ZwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRvY3MvZ2xvc3NhcnkucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9taXNjL3RlY2gtZGVi
dC5yc3QKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
