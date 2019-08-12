Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E428B05D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:59:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQju-0004bI-3R; Tue, 13 Aug 2019 06:57:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxQjs-0004Zp-0n
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:57:00 +0000
X-Inumbo-ID: e737a8f2-bd29-11e9-9829-e706058a444a
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e737a8f2-bd29-11e9-9829-e706058a444a;
 Mon, 12 Aug 2019 17:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565632328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CvaysdAuP9fY5tgMszP62ebzI1j1AzwADOXDgH3HlRQ=;
 b=BgJ6X19hKXlhTbMvZOMBPHGCheOMb4sVdfujEv/wsBzOFlY1AKUxA5YQ
 KEu7IeNwyGQLvTuDRkK8ACS1BZ0DyovNR4rmywypLRgmwSk7OecWZ9Kf3
 SvV80T+NAETrGX3dmUgHHq6VaNIozXtFKEp5buxlE8jGT4cusZqkjxm4L A=;
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
IronPort-SDR: BLs6zp28b5DtWqQEOtH68QGcJYKxrQVtGeWLsAKNkJ2GNr66ojIznLiiqwOBlFZDDUApoBrFFX
 aE4+2ITOaCsZK3eHuFABzWvhM5kilqXtZwxgEjUMSi8pHryDsDNQpIH42chhPl38Fr5hBxUpCS
 LuCh1i3HGWN8WK69AcGl85r/9DOUv8OU0gvl7rl1tyYdFjmMVAJc4HEg7ri9oJooHfJCH9jlFm
 XW/Ift/mjmO3r6g+/F0x0aD88v0HGBKAZuLeDf6xRhBSvI7fL/GBHg0MrEGHwNMzMkv9GcB5L3
 Nhs=
X-SBRS: 2.7
X-MesageID: 4315423
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,378,1559534400"; 
   d="scan'208";a="4315423"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 12 Aug 2019 18:52:05 +0100
Message-ID: <20190812175205.29143-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/AMD-Vi: Fold exit paths of {enable,
 disable}_iommu()
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHRvIGF2b2lkIGhhdmluZyBtdWx0aXBsZSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCkgY2Fs
bHMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Q0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNDOiBTdXJh
dmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpDQzogQnJp
YW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CgpJbnRlcmVzdGluZ2x5IEdDQyA2LjMgbWFu
YWdlZCB0byBmb2xkIGRpc2FibGVfaW9tbXUoKSBhdXRvbWF0aWNhbGx5LiAgVGhlcmUgaXMKc29t
ZSBwYXJ0aWFsIGZvbGRpbmcgZm9yIGVuYWJsZV9pb21tdSgpIChpbnNvZmFyIGFzIHRoZXJlIGlz
IG9ubHkgYSBzaW5nbGUKY2FsbCB0byBfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSBlbWl0dGVkKSwg
YnV0IHRoaXMgZGVsdGEgeWVpbGRzCgogIGFkZC9yZW1vdmU6IDAvMCBncm93L3NocmluazogMC8x
IHVwL2Rvd246IDAvLTIwICgtMjApCiAgRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQogIGVuYWJsZV9pb21tdSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMTg0NCAgICAxODI0ICAgICAtMjAKICBUb3RhbDogQmVmb3Jl
PTMzNDAyOTksIEFmdGVyPTMzNDAyNzksIGNoZyAtMC4wMCUKCndoaWNoIG1lYW5zIHRoYXQgc29t
ZXRoaW5nIHdhc24ndCBkb25lIGF1dG9tYXRpY2FsbHkuCgpOb3RpY2VkIHdoaWxlIGludmVzdGln
YXRpbmcgdGhlIFMzIHJlZ3Jlc3Npb24uCi0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11X2luaXQuYyB8IDE3ICsrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11X2luaXQuYwppbmRleCBiYjlmMzNlMjY0Li5iYjVhM2U1N2M5IDEwMDY0NAotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKQEAgLTg5OSwxMSArODk5LDggQEAgc3RhdGlj
IHZvaWQgZW5hYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQogCiAgICAgc3Bpbl9s
b2NrX2lycXNhdmUoJmlvbW11LT5sb2NrLCBmbGFncyk7CiAKLSAgICBpZiAoIGlvbW11LT5lbmFi
bGVkICkKLSAgICB7Ci0gICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11LT5sb2Nr
LCBmbGFncyk7IAotICAgICAgICByZXR1cm47Ci0gICAgfQorICAgIGlmICggdW5saWtlbHkoaW9t
bXUtPmVuYWJsZWQpICkKKyAgICAgICAgZ290byBvdXQ7CiAKICAgICBhbWRfaW9tbXVfZXJyYXR1
bV83NDZfd29ya2Fyb3VuZChpb21tdSk7CiAKQEAgLTk1Nyw2ICs5NTQsOCBAQCBzdGF0aWMgdm9p
ZCBlbmFibGVfaW9tbXUoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCiAgICAgICAgIGFtZF9pb21t
dV9mbHVzaF9hbGxfY2FjaGVzKGlvbW11KTsKIAogICAgIGlvbW11LT5lbmFibGVkID0gMTsKKwor
IG91dDoKICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxhZ3MpOwog
fQogCkBAIC05NjYsMTEgKzk2NSw4IEBAIHN0YXRpYyB2b2lkIGRpc2FibGVfaW9tbXUoc3RydWN0
IGFtZF9pb21tdSAqaW9tbXUpCiAKICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPmxvY2ss
IGZsYWdzKTsKIAotICAgIGlmICggIWlvbW11LT5lbmFibGVkICkKLSAgICB7Ci0gICAgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11LT5sb2NrLCBmbGFncyk7Ci0gICAgICAgIHJldHVy
bjsKLSAgICB9CisgICAgaWYgKCB1bmxpa2VseSghaW9tbXUtPmVuYWJsZWQpICkKKyAgICAgICAg
Z290byBvdXQ7CiAKICAgICBpZiAoICFpb21tdS0+Y3RybC5pbnRfY2FwX3h0X2VuICkKICAgICAg
ICAgYW1kX2lvbW11X21zaV9lbmFibGUoaW9tbXUsIElPTU1VX0NPTlRST0xfRElTQUJMRUQpOwpA
QCAtOTg4LDYgKzk4NCw3IEBAIHN0YXRpYyB2b2lkIGRpc2FibGVfaW9tbXUoc3RydWN0IGFtZF9p
b21tdSAqaW9tbXUpCiAKICAgICBpb21tdS0+ZW5hYmxlZCA9IDA7CiAKKyBvdXQ6CiAgICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPmxvY2ssIGZsYWdzKTsKIH0KIAotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
