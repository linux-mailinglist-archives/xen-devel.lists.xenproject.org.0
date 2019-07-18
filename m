Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C166D0CC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:14:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho84D-0002Aj-9s; Thu, 18 Jul 2019 15:11:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho84C-0002Ae-1G
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:11:32 +0000
X-Inumbo-ID: 5237da33-a96e-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5237da33-a96e-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:11:30 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /HGtfdXzaiq29209u8eKNistqpxcUVEepPM4nFduCnu9cEuIu66CUX3RMsu9ggwGhzLVDXD6Yi
 ld5Ia2+d8uKfbiig6ELCtgMyerENvQbOqOYpH18x2eLfJwR83yg5i3L9FYy6Knj9YaVffFbGa8
 qXKxtcE++w18VaAj9nnyQSV1hneldyTF2oiT2zVaFdUZjPT/FJUAkjS5F15lUfFgDKX+a4N6z0
 1hpjgfXdXAKxJyUqh2cmOUOoB210eQn2SXaRI71cdxbDOuvvzRi/9AK72uwWgoEfBitoKakp5O
 4qw=
X-SBRS: 2.7
X-MesageID: 3206120
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3206120"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 18 Jul 2019 16:11:19 +0100
Message-ID: <20190718151119.17270-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86emul: Ignore ssse3-{aes, pclmul}.[hc] as well
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQog
LmdpdGlnbm9yZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhLy5naXRpZ25vcmUgYi8uZ2l0aWdub3JlCmluZGV4IDhhMTlj
OGFmMDQuLjNjOTQ3YWM5NDggMTAwNjQ0Ci0tLSBhLy5naXRpZ25vcmUKKysrIGIvLmdpdGlnbm9y
ZQpAQCAtMjMzLDcgKzIzMyw3IEBAIHRvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9hc20KIHRvb2xz
L3Rlc3RzL3g4Nl9lbXVsYXRvci9hdngqLltjaF0KIHRvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9i
bG93ZmlzaC5oCiB0b29scy90ZXN0cy94ODZfZW11bGF0b3IvZm1hKi5bY2hdCi10b29scy90ZXN0
cy94ODZfZW11bGF0b3Ivc3NlKi5bY2hdCit0b29scy90ZXN0cy94ODZfZW11bGF0b3IvKnNzZSou
W2NoXQogdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9yCiB0b29scy90
ZXN0cy94ODZfZW11bGF0b3IveDg2X2VtdWxhdGUKIHRvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci94
b3AqLltjaF0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
