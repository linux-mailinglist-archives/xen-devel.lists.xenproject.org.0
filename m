Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7431AE9F7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7erC-0007E4-AJ; Tue, 10 Sep 2019 12:02:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7erA-0007Dz-Fr
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:02:48 +0000
X-Inumbo-ID: e76b6e9e-d3c2-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e76b6e9e-d3c2-11e9-b76c-bc764e2007e4;
 Tue, 10 Sep 2019 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568116967;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ZKVKVIUzFv2FTcRwaYj9ofZ1lGAr+kYBuVd9GT87GvA=;
 b=GQcMAk91AC/C6QKy93rA/2drk+MsGcsN4Ejk20JJ1UsMi0sb9Ik0V3J4
 jriDcQU5RhoQOxlJYBMiTiXF4peGacUI7W+wH1YIymJfyhbp+7C7t3DiG
 IsWnS0Hh2uTEBm1eVZyOyeC+AxAyN5tZtRNKmnrt720kTVSudxuTbTbEd U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AVj0C8tYO2f09uPy8GmSjYWwC1rI2D3t4H74U0lhCZP6r6o0TmcVuZk9pZICj8/F0v7uplnA4h
 p5F9YssN343mNEHWHeMIqfFnqEJoZdCMHmD5XLOs3WzYFwAj22uxm0J0giBzqfT3Oz0CQzbbZc
 mmduul69CpBuH+59cneuHLpo6+8pRO2AVY86RoDSsEaOG+ZrMMC1+keVo2kPTs6Uex558YhQvD
 2c2Vx1+TGM+iz6tapCBzp4bBsM1N4VfrG/Bu1KUV21N4pObY/CuZdiUfjnPSClmqf2qKFWqusS
 y5U=
X-SBRS: 2.7
X-MesageID: 5370447
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5370447"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:01:55 +0100
Message-ID: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 00/12] ocaml abi fixes
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
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBub3cgaGFzIGZ1cnRoZXIgdXBkYXRlcyBhbmQgaW1wcm92ZW1lbnRzLiAgUGF0Y2hlcyAx
LTMgYXJlIGFzCmJlZm9yZS4gIFBhdGNoZXMgNC0xMiBhcmUgbmV3LiAgVGhhbmtzIHRvIEFuZHkg
Zm9yIGhpcyB3b3JrIChpbgpwYXJ0aWN1bGFyLCBzb21lIGRlYnVnZ2luZyBhbmQgY29tbWVudGFy
eSBmb3IgbXkgc2NyaXB0KSB3aGljaCBJIGhhdmUKaW5jb3Jwb3JhdGVkIGhlcmUuCgpUaGlzIGlz
IGF2YWlsYWJsZSBhcyBhIGdpdCBicmFuY2ggaGVyZQogIGh0dHBzOi8veGVuYml0cy54ZW4ub3Jn
L2dpdHdlYi8/cD1wZW9wbGUvaXdqL3hlbi5naXQ7YT1zdW1tYXJ5CiAgLWIgd2lwLm9jYW1sLnYz
CgpBbmRyZXcgQ29vcGVyICg1KToKICB0b29scy9vY2FtbDogQWRkIG1pc3NpbmcgQ0FQX1BWCiAg
eGVuL2RvbWN0bDogRHJvcCBndWVzdCBzdWZmaXggZnJvbSBYRU5fRE9NQ1RMX0NERl9odm0KICB0
b29scy9vY2FtbDogYWJpIGhhbmRsaW5nOiBQcm92aWRlIG9jYW1sLT5DIGNvbnZlcnNpb24vY2hl
Y2sKICB0b29scy9vY2FtbDogUmVmb3JtYXQgZG9tYWluX2NyZWF0ZV9mbGFnCiAgdG9vbHMvb2Nh
bWw6IGFiaTogVXNlIGZvcm1hbCBjb252ZXJzaW9uIGFuZCBjaGVjayBpbiBtb3JlIHBsYWNlcwoK
SWFuIEphY2tzb24gKDcpOgogIHRvb2xzL29jYW1sOiBBZGQgbWlzc2luZyBYODZfRU1VX1ZQQ0kK
ICB0b29scy9vY2FtbDogSW50cm9kdWNlIHhlbmN0cmwgQUJJIGJ1aWxkLXRpbWUgY2hlY2tzCiAg
dG9vbHMvb2NhbWw6IGFiaS1jaGVjazogQWRkIGNvbW1lbnRzCiAgdG9vbHMvb2NhbWw6IGFiaS1j
aGVjazogSW1wcm92ZSBvdXRwdXQgYW5kIGVycm9yIG1lc3NhZ2VzCiAgdG9vbHMvb2NhbWw6IGFi
aS1jaGVjazogQ29wZSB3aXRoIG11bHRpcGxlIGNvbnZlcnNpb25zIG9mIHNhbWUgdHlwZQogIHRv
b2xzL29jYW1sOiBhYmktY2hlY2s6IENoZWNrIHByb3Blcmx5LgogIHRvb2xzL29jYW1sOiB0b29s
cy9vY2FtbDogQWRkIG1pc3NpbmcgQ0RGXyogdmFsdWVzCgogLmdpdGlnbm9yZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICAgICAg
ICAgfCAgIDIgKy0KIHRvb2xzL29jYW1sL2xpYnMveGMvTWFrZWZpbGUgICAgICAgIHwgICA1ICsr
CiB0b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjayAgICAgICB8IDExNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAg
ICAgIHwgICA5ICsrLQogdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSAgICAgfCAgMTMg
KysrLQogdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgfCAgOTUgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tCiB0b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMg
ICB8ICAgMiArLQogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgICAgICAgfCAgIDIgKy0K
IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2RvbWFpbi5j
ICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAg
ICAgIHwgICAyICstCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICAgICAgICB8ICAgNCAr
LQogeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgICAgICAgfCAgIDggKystCiB4ZW4vaW5j
bHVkZS9wdWJsaWMvc3lzY3RsLmggICAgICAgICB8ICAgNCArKwogeGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmggICAgICAgICAgICAgfCAgIDQgKy0KIDE3IGZpbGVzIGNoYW5nZWQsIDIzMiBpbnNlcnRp
b25zKCspLCA0MSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDc1NSB0b29scy9vY2FtbC9s
aWJzL3hjL2FiaS1jaGVjawoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
