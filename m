Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FECAABBE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 21:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5x3Q-0001zy-G8; Thu, 05 Sep 2019 19:04:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5x3P-0001zt-G2
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 19:04:23 +0000
X-Inumbo-ID: f880337e-d00f-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f880337e-d00f-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567710263;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hExIHzdIdg08QlNobWWYZCUCJXXAhRRk07yqRWjUBro=;
 b=TmycnDFqHSi2NVqCFWRghqXlaIx/BLV7OgOqQBXn0q6Ha/sVutgw/ZjN
 TzcmvBzBo6peThf8W/WUAoV8bViF1o+6P+GB+BOzmYYHgSX6g6svkvmks
 G0okUsKczygO3J9pNWpqC6ZXbJBgzKKxuqTYUaX9pHpw7ceZCLYb8jcm7 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HNF69+ZlEYzbkpnHp34yC+WZsEMuHwFL0uUPr+kDuWndPIlfpC34u0dB9ywVRxQAni+f4Bao76
 Dbd5MaAFeSXXmJbnwiMNfIt3bDxLprqnssxjr8aBIfcxTZlb7/uah9TqNt2scc4WRAZTVrjUSa
 hMOk661eds63YMifZ8sqF2vrx1O0+Zck2P1SOOpXoXGZViga8ZyashdQW0yFpYroi9xAh/3jtY
 2apBBQ2sfPfKv5devIL4KWeu5573qH6fVxxM/JOB7Am3BLZnvEq5YArBxcut2Dunm07zMq4snM
 0cQ=
X-SBRS: 2.7
X-MesageID: 5252875
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,471,1559534400"; 
   d="scan'208";a="5252875"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 5 Sep 2019 20:04:18 +0100
Message-ID: <20190905190418.15142-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Don't explicitly map the VGA region
 as UC-
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

QWxsIDY0LWJpdCBjYXBhYmxlIHByb2Nlc3NvcnMgdXNlIFBBVCwgYW5kIHdpdGggUEFULCBpdCBp
cyBleHBsaWNpdGx5CnBlcm1pdHRlZCB0byBoYXZlIG1hcHBpbmdzIHdpdGggYSBjYWNoZWFiaWxp
dHkgZGlmZmVyZW50IHRvIE1UUlJzLgoKT24gYSBuYXRpdmUgc3lzdGVtIHdpdGggYSByZWFsIGxl
Z2FjeSBWR0EgcmVnaW9uLCBNVFJScyB3aWxsIGNhdXNlIHRoZSByZWdpb24KdG8gYmUgVUMtLiAg
V2hlbiBib290aW5nIHZpcnR1YWxpc2VkLCB0aGlzIHJhbmdlIG1heSBiZSBSQU0gYW5kIG5vdCBh
IGxlZ2FjeQpWR0EgcmVnaW9uLCBhdCB3aGljaCBwb2ludCBpdCB3YW50cyB0byBiZSBXQi4KClVz
ZSBXQiBtYXBwaW5nIGluIHRoZSBwYWdldGFibGVzLCBzdWNoIHRoYXQgaW4gc3lzdGVtcyB3aXRo
b3V0IGEgbGVnYWN5IFZHQQpyZWdpb24sIHRoZSBSQU0gYmV0d2VlbiAweGEwMDAwIGFuZCAweGMw
MDAwIGRvZXNuJ3QgYmVjb21lIHVubmVjZXNzZXJpbHkgVUMtLgpIb3dldmVyLCB3ZSBzdGlsbCBt
dXN0IHVzZSBzbWFsbCBwYWdlcyB0byBhdm9pZCB0aGUgdW5kZWZpbmVkIGJlaGF2aW91ciBjYXVz
ZWQKYnkgc3VwZXJwYWdlcyBjcm9zc2luZyBNVFJScyBvZiBkaWZmZXJlbnQgY2FjaGVhYmlsaXR5
LgoKV2hpbGUgYWRqdXN0aW5nIHRoZSBwYWdldGFibGUgY29uc3RydWN0aW9uLCBzd2l0Y2ggZnJv
bSBwZm4gdG8gaWR4IGZvcgpjb25zaXN0ZW5jeSB3aXRoIGFsbCB0aGUgb3RoZXIgY29uc3RydWN0
aW9uIGxvZ2ljLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpBcyBhIGZ1dHVyZSBvcHRpbWlzYXRpb24sIFhlbiBjb3VsZCByZXdyaXRlIGwyX2lk
ZW50bWFwIHdpdGggYSBzdXBlcnBhZ2UgaWYgaXQKZmluZHMgdGhhdCBNVFJScyBhcmUgZGlzYWJs
ZWQuICBIb3dldmVyLCB0aGlzIHByb2JhYmx5IG5lZWRzIHRvIHdhaXQgdW50aWwgWGVuCm5vIGxv
bmdlciB1bmNvbmRpdGlvbmFsbHkgYXNzdW1lcyBhIGxlZ2FjeSBWR0EgcmVnaW9uIHRvIGJlIHBy
ZXNlbnQgaW4gdGhlCmU4MjAgaWYgaXQgZmluZHMgc29tZXRoaW5nIG90aGVyIHRoYW4gYSBob2xl
Ci0tLQogeGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgfCAxNCArKysrLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQu
UwppbmRleCA1YWIyNGQ3M2ZjLi4xY2E5ODZmODgyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
Ym9vdC94ODZfNjQuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpAQCAtNTEsMTkg
KzUxLDEzIEBAIEdMT0JBTChzdGFja19zdGFydCkKIC8qCiAgKiBNYXBwaW5nIG9mIGZpcnN0IDIg
bWVnYWJ5dGVzIG9mIG1lbW9yeS4gVGhpcyBpcyBtYXBwZWQgd2l0aCA0a0IgbWFwcGluZ3MKICAq
IHRvIGF2b2lkIHR5cGUgY29uZmxpY3RzIHdpdGggZml4ZWQtcmFuZ2UgTVRSUnMgY292ZXJpbmcg
dGhlIGxvd2VzdCBtZWdhYnl0ZQotICogb2YgcGh5c2ljYWwgbWVtb3J5LiBJbiBhbnkgY2FzZSB0
aGUgVkdBIGhvbGUgc2hvdWxkIGJlIG1hcHBlZCB3aXRoIHR5cGUgVUMuCi0gKiBVc2VzIDF4IDRr
IHBhZ2UuCisgKiBvZiBwaHlzaWNhbCBtZW1vcnkuICBVc2VzIDF4IDRrIHBhZ2UuCiAgKi8KIGwx
X2lkZW50bWFwOgotICAgICAgICBwZm4gPSAwCisgICAgICAgIGlkeCA9IDAKICAgICAgICAgLnJl
cHQgTDFfUEFHRVRBQkxFX0VOVFJJRVMKLSAgICAgICAgLyogVkdBIGhvbGUgKDB4YTAwMDAtMHhj
MDAwMCkgc2hvdWxkIGJlIG1hcHBlZCBVQy0uICovCi0gICAgICAgIC5pZiBwZm4gPj0gMHhhMCAm
JiBwZm4gPCAweGMwCi0gICAgICAgIC5xdWFkIChwZm4gPDwgUEFHRV9TSElGVCkgfCBQQUdFX0hZ
UEVSVklTT1JfVUNNSU5VUyB8IE1BUF9TTUFMTF9QQUdFUwotICAgICAgICAuZWxzZQotICAgICAg
ICAucXVhZCAocGZuIDw8IFBBR0VfU0hJRlQpIHwgUEFHRV9IWVBFUlZJU09SIHwgTUFQX1NNQUxM
X1BBR0VTCi0gICAgICAgIC5lbmRpZgotICAgICAgICBwZm4gPSBwZm4gKyAxCisgICAgICAgIC5x
dWFkIChpZHggPDwgUEFHRV9TSElGVCkgfCBQQUdFX0hZUEVSVklTT1IgfCBNQVBfU01BTExfUEFH
RVMKKyAgICAgICAgaWR4ID0gaWR4ICsgMQogICAgICAgICAuZW5kcgogICAgICAgICAuc2l6ZSBs
MV9pZGVudG1hcCwgLiAtIGwxX2lkZW50bWFwCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
