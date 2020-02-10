Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6C1582DA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 19:42:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Dxv-00059X-ON; Mon, 10 Feb 2020 18:39:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1Dxu-00059R-1U
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 18:39:26 +0000
X-Inumbo-ID: a852566c-4c34-11ea-b4f3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a852566c-4c34-11ea-b4f3-12813bfff9fa;
 Mon, 10 Feb 2020 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581359966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+tSoXxvJ0oZyn0ylh5HdyIqAa1PQknFB63jF4aFuiYo=;
 b=ClH70L8KhM5JfYEIzK1bh8JxLolatfMB21jjQqtn8c9tuxP1qzlsQFtO
 n7g5sq9XFIsCvhH84UilAHfU7V90OrzjzzT6rTTMhDq/4X9EUXs8HRHhO
 YPVd2ZS4PmoZFBTvQLFPNo349ZqSutP06N0qzRPl7bCRBaVBwxXh7w5+h g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8U9pKwznmyEj46a6RlELz+sgwWz3wsUOXhu/wZqu3P8pPO1TdXvwA1O5dar04ZXlKXq3QhJp/y
 6neeGF82Xh780B+z4FIdV7DqI61iMV5K6rIr7h1snO+5HhHWQndMzX9JYA+GsbDVYAwuV9EBCD
 zPkJhJNNihXhFJR1KeCHVpJ/EOOHuN2HSdl/T8rUwnJVJt1DGn0/vNMQ4xWBzl/QV1ZMNX46x7
 m3WQbd7RThlA/c+vtB++y0E8AM0uOc2H9KnBDbEmnwoXOTyoAASKjHgVmewxtIzjYWXUH7mE7I
 KyE=
X-SBRS: 2.7
X-MesageID: 12399739
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12399739"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 18:39:21 +0000
Message-ID: <20200210183921.23293-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/pvh: Adjust dom0's starting state
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

Rml4ZXM6IGIyNWZiMWEwNGUgInhlbi9wdmg6IEZpeCBzZWdtZW50IHNlbGVjdG9yIEFCSSIKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0t
CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgYi94
ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwppbmRleCA4MzEzMjUxNTBiLi4zODA0MTIxNTFi
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJj
aC94ODYvaHZtL2RvbTBfYnVpbGQuYwpAQCAtNjI2LDEwICs2MjYsMTIgQEAgc3RhdGljIGludCBf
X2luaXQgcHZoX3NldHVwX2NwdXMoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBlbnRyeSwKICAg
ICAgICAgLmNwdV9yZWdzLng4Nl8zMi5jcjAgPSBYODZfQ1IwX1BFIHwgWDg2X0NSMF9FVCwKICAg
ICAgICAgLmNwdV9yZWdzLng4Nl8zMi5jc19saW1pdCA9IH4wdSwKICAgICAgICAgLmNwdV9yZWdz
Lng4Nl8zMi5kc19saW1pdCA9IH4wdSwKKyAgICAgICAgLmNwdV9yZWdzLng4Nl8zMi5lc19saW1p
dCA9IH4wdSwKICAgICAgICAgLmNwdV9yZWdzLng4Nl8zMi5zc19saW1pdCA9IH4wdSwKICAgICAg
ICAgLmNwdV9yZWdzLng4Nl8zMi50cl9saW1pdCA9IDB4NjcsCiAgICAgICAgIC5jcHVfcmVncy54
ODZfMzIuY3NfYXIgPSAweGM5YiwKICAgICAgICAgLmNwdV9yZWdzLng4Nl8zMi5kc19hciA9IDB4
YzkzLAorICAgICAgICAuY3B1X3JlZ3MueDg2XzMyLmVzX2FyID0gMHhjOTMsCiAgICAgICAgIC5j
cHVfcmVncy54ODZfMzIuc3NfYXIgPSAweGM5MywKICAgICAgICAgLmNwdV9yZWdzLng4Nl8zMi50
cl9hciA9IDB4OGIsCiAgICAgfTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
