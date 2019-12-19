Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3357812651E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 15:46:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihx0b-0007UY-47; Thu, 19 Dec 2019 14:42:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ynai=2J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihx0a-0007UQ-1s
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 14:42:32 +0000
X-Inumbo-ID: c3c5ee35-226d-11ea-91cf-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3c5ee35-226d-11ea-91cf-12813bfff9fa;
 Thu, 19 Dec 2019 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576766543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mZlcSNva71a8ScphlVLiZaz4clDPGOmGevigrs2OdN4=;
 b=SkLojATmbbEyCjE/yxy70ACVPtsmppCFW74J413n3/EEJ/h8HFj9YvPU
 glaboJebhs/xnFN4dI4CbwD8rA4dHt8bXzkAR+wEgIwgThqycq12bW0Dw
 9de+VPUxVThAzD7cNP3T1G1wIdchHnbMsdJIVDijgfiswNnaCIx1cdmqN c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aN2HoESqvoWhxaOguG5Y83Qj4cU8dP9gU7ZYqyEh262oXFYb6cK67S03M0dLtsN1YFl6sWBLXR
 ztcGwxKbW0n60dDoi0w5Qgcdts/gRff8NWGCUlz0WBkTT7jDPfV4jEsOLLnU9UGe0plmpASLe1
 WW0zFO/wsvx/qiyboxEIu7qPa9ZLzL0yDmCfYWWlEJs/zmUKHPzSjMJ35NdA0bqNmXBGm/AjXw
 Bn1TFHrYArcRO1n5gfnEt2sWHW+r1JjzYv4x3CS8URYRHiMSbydERa45RArCFKPpWCvfRVFMfu
 q2Y=
X-SBRS: 2.7
X-MesageID: 9949394
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; 
   d="scan'208";a="9949394"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 14:42:17 +0000
Message-ID: <20191219144217.305851-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219144217.305851-1-anthony.perard@citrix.com>
References: <20191219144217.305851-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 2/2] automation: Cache sub-project git tree
 in build jobs
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2l0TGFiIGhhdmUgYSBjYWNoaW5nIGNhcGFiaWxpdHksIHNlZSBbMV0uIExldCdzIHVzZSBpdCB0
byBhdm9pZCB1c2luZwpJbnRlcm5ldCB0b28gb2Z0ZW4uCgpUaGUgY2FjaGUgaXMgc2V0dXAgc28g
dGhhdCB3aGVuIHhlbi5naXQvQ29uZmlnLm1rIGlzIGNoYW5nZWQsIHRoZQpjYWNoZSB3aWxsIG5l
ZWQgdG8gYmUgcmVjcmVhdGVkLiBUaGlzIGhhcyBiZWVuIGNob3NlbiBiZWNhdXNlIHRoYXQgaXMK
d2hlcmUgdGhlIGluZm9ybWF0aW9uIGFib3V0IGhvdyB0byBjbG9uZSBzdWItcHJvamVjdCB0cmVl
cyBpcyBlbmNvZGVkCihyZXZpc2lvbnMpLiBUaGF0IG1heSBub3Qgd29yayBmb3IgcWVtdS14ZW4g
dHJlZSB3aGljaCB1c3VhbGx5IGlzCmBtYXN0ZXInLCBidXQgdGhhdCBzaG91bGQgYmUgZmluZSBm
b3Igbm93LgoKVGhlIGNhY2hlIGlzIHBvcHVsYXRlZCBvZiAiZ2l0IGJ1bmRsZSIgd2hpY2ggd2ls
bCBjb250YWluIGEgbWlycm9yIG9mCnRoZSBvcmlnaW5hbCByZXBvLCBhbmQgY2FuIGJlIGNsb25l
ZCBmcm9tLiBJZiB0aGUgYnVuZGxlIGV4aXN0LCB0aGUKc2NyaXB0IGhhdmUgdGhlIFhlbiBtYWtl
ZmlsZXMgY2xvbmUgZnJvbSBpdCwgb3RoZXJ3aXNlIGl0IHdpbGwgY2xvbmUKZnJvbSB0aGUgb3Jp
Z2luYWwgVVJMIGFuZCB0aGUgYnVuZGxlcyB3aWxsIGJlIGNyZWF0ZWQganVzdCBhZnRlci4KCldl
IGhhdmUgbW9yZSB0aGFuIG9uZSBydW5uZXIgaW4gR2l0TGFiLCBhbmQgbm8gc2hhcmVkIGNhY2hl
IGJldHdlZW4KdGhlbSwgc28gZXZlcnkgYnVpbGQgam9icyB3aWxsIGJlIHJlc3BvbnNpYmxlIHRv
IGNyZWF0ZSB0aGUgY2FjaGUuCgpbMV0gaHR0cHM6Ly9kb2NzLmdpdGxhYi5jb20vZWUvY2kveWFt
bC9SRUFETUUuaHRtbCNjYWNoZQoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFt
bCAgICAgfCAgOCArKysrKwogYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUtY2FjaGUuc2ggfCA1
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA3NTUgYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUt
Y2FjaGUuc2gKCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sIGIv
YXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbAppbmRleCAxZTYxZDMwYzg1NDUuLjhmOWY1
M2E0MjIyZiAxMDA2NDQKLS0tIGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbAorKysg
Yi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sCkBAIC0xLDYgKzEsMTQgQEAKIC5idWls
ZC10bXBsOiAmYnVpbGQKICAgc3RhZ2U6IGJ1aWxkCiAgIGltYWdlOiByZWdpc3RyeS5naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L3hlbi8ke0NPTlRBSU5FUn0KKyAgY2FjaGU6CisgICAga2V5OgorICAg
ICAgZmlsZXM6CisgICAgICAgIC0gQ29uZmlnLm1rCisgICAgcGF0aHM6CisgICAgICAtIGNpX2Nh
Y2hlCisgIGJlZm9yZV9zY3JpcHQ6CisgICAgLSAuL2F1dG9tYXRpb24vc2NyaXB0cy9wcmVwYXJl
LWNhY2hlLnNoCiAgIHNjcmlwdDoKICAgICAtIC4vYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIDI+
JjEgfCB0ZWUgYnVpbGQubG9nCiAgIGFydGlmYWN0czoKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24v
c2NyaXB0cy9wcmVwYXJlLWNhY2hlLnNoIGIvYXV0b21hdGlvbi9zY3JpcHRzL3ByZXBhcmUtY2Fj
aGUuc2gKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAwMDAwLi4wMTdmMWI4ZjA2
NzIKLS0tIC9kZXYvbnVsbAorKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvcHJlcGFyZS1jYWNoZS5z
aApAQCAtMCwwICsxLDUyIEBACisjIS9iaW4vYmFzaAorCitzZXQgLWV4CisKK2NhY2hlZGlyPSIk
e0NJX1BST0pFQ1RfRElSOj1gcHdkYH0vY2lfY2FjaGUiCitta2RpciAtcCAiJGNhY2hlZGlyIgor
CitkZWNsYXJlIC1BIHIKK3JbZXh0cmFzL21pbmktb3NdPU1JTklPU19VUFNUUkVBTV9VUkwKK3Jb
dG9vbHMvcWVtdS14ZW4tZGlyXT1RRU1VX1VQU1RSRUFNX1VSTAorclt0b29scy9xZW11LXhlbi10
cmFkaXRpb25hbC1kaXJdPVFFTVVfVFJBRElUSU9OQUxfVVJMCityW3Rvb2xzL2Zpcm13YXJlL292
bWYtZGlyXT1PVk1GX1VQU1RSRUFNX1VSTAorclt0b29scy9maXJtd2FyZS9zZWFiaW9zLWRpcl09
U0VBQklPU19VUFNUUkVBTV9VUkwKKworYnVuZGxlX2xvYygpIHsKKyAgICBlY2hvICIkY2FjaGVk
aXIvJHsxLy9cLy9ffS5naXQuYnVuZGxlIgorfQorZm9yIGQgaW4gJHshcltAXX07IGRvCisgICAg
aWYgWyAtZSAkKGJ1bmRsZV9sb2MgJGQpIF07IHRoZW4KKyAgICAgICAgZXhwb3J0ICR7clskZF19
PSQoYnVuZGxlX2xvYyAkZCkKKyAgICBmaQorZG9uZQorCitpZiAhIG1ha2Ugc3VidHJlZS1mb3Jj
ZS11cGRhdGUtYWxsOyB0aGVuCisgICAgIyBUaGVyZSdzIG1heWJlIGFuIGlzc3VlIHdpdGggb25l
IG9mIHRoZSBnaXQgYnVuZGxlLCBqdXN0IGNsZWFyIHRoZSBjYWNoZQorICAgICMgYW5kIGFsbG93
IGl0IHRvIGJlIHJlYnVpbHQgYnkgYSBkaWZmZXJlbnQgam9icy4KKyAgICAjIE1ha2Ugd2lsbCBy
ZWNsb25lIG1pc3NpbmcgY2xvbmVzIGZyb20gb3JpZ2luYWwgVVJMcyBpbnN0ZWFkIG9mIGZyb20g
dGhlCisgICAgIyBidW5kbGUuCisgICAgZm9yIGQgaW4gJHshcltAXX07IGRvCisgICAgICAgIHJt
IC1mICIkKGJ1bmRsZV9sb2MgJGQpIgorICAgIGRvbmUKKyAgICBleGl0CitmaQorCisKK3RtcGRp
cj0kKG1rdGVtcCAtZCAiJENJX1BST0pFQ1RfRElSL2NpLXRtcC5YWFgiKQorZm9yIGQgaW4gJHsh
cltAXX07IGRvCisgICAgYnVuZGxlPSQoYnVuZGxlX2xvYyAkZCkKKyAgICBpZiBbIC1lICRidW5k
bGUgXTsgdGhlbgorICAgICAgICAjIFdlIGRpZG4ndCBkb3dubG9hZCBhbnl0aGluZyBuZXcKKyAg
ICAgICAgY29udGludWUKKyAgICBmaQorICAgICMgV2UgY3JlYXRlIGEgbWlycm9yIHRvIGJlIGFi
bGUgdG8gY3JlYXRlIGEgYnVuZGxlIHRoYXQgaXMgYSBtaXJyb3Igb2YKKyAgICAjIHVwc3RyZWFt
LiBPdGhlcndpc2UsIHRoZSBidW5kbGUgbWF5IG5vdCBoYXZlIHJlZnMgdGhhdCB0aGUgYnVpbGQg
c3lzdGVtCisgICAgIyB3aWxsIHdhbnQsIGkuZS4gcmVmcy9oZWFkcy9tYXN0ZXIgd291bGQgYmUg
bWlzc2luZyBmcm9tIHRoZSBidW5kbGUuCisgICAgdXJsPSQoZ2l0IC0tZ2l0LWRpcj0kZC8uZ2l0
IGNvbmZpZyByZW1vdGUub3JpZ2luLnVybCkKKyAgICByZXBvX21pcnJvcmVkPSIkdG1wZGlyLyR7
ZC8vXC8vX30iCisgICAgZ2l0IGNsb25lIC0tYmFyZSAtLW1pcnJvciAtLXJlZmVyZW5jZSAiJGQi
ICIkdXJsIiAiJHJlcG9fbWlycm9yZWQiCisgICAgZ2l0IC0tZ2l0LWRpcj0iJHJlcG9fbWlycm9y
ZWQiIGJ1bmRsZSBjcmVhdGUgJGJ1bmRsZSAtLWFsbAorICAgIHJtIC1yZiAiJHJlcG9fbWlycm9y
ZWQiCitkb25lCitybWRpciAiJHRtcGRpciIKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
