Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36CD79001
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs822-0002bm-U7; Mon, 29 Jul 2019 15:57:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs820-0002b7-Ng
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:57:48 +0000
X-Inumbo-ID: 9c28501b-b219-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9c28501b-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:57:47 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wrJUj1XaM7oaaXvaT8/Yh/leDGNXWVR42DYj4i1k+WnBSiAeQRlqjScfgwDTlnOVtURlhUp5iq
 65bZgKwr9Q8pBbWrb+T3rL/gnvAks1CJUhIvPVe2L/8SppLKH00tzszi9+3T8cKa57+cFQNeu6
 yTRntO9csdxi8z2RGfNAJZGO5Wmu0va37r7Qi6jH2EPrPpN4vZ7VKbkiEPMjkcyuzonujMNc6d
 kFkU+wow70JHiJ3IvP/p0jOrScuimb/Dx3+kr2JvWb7de18WENhdZdbwAzZTUI4yI7+NNCqFZX
 9pA=
X-SBRS: 2.7
X-MesageID: 3710491
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3710491"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:33 +0100
Message-ID: <20190729153944.24239-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 24/35] OvmfPkg/XenPlatformPei: Reserve VGA
 memory region, to boot Linux
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXggcGFuaWMgaWYgdGhlIFZHQSByZWdpb24gaXNuJ3QgcmVzZXJ2ZWQuCgpXaGVuIExpbnV4
IGlzIGJvb3RlZCBvbiBFRkkgc3lzdGVtLCBpdCBleHBlY3RzIHRoZSBtZW1vcnkgYXQgMHhhMDAw
MCB0bwpfbm90XyBiZSBjb252ZW50aW9uYWwgbWVtb3J5LiBPdGhlcndpc2UgYSB2YXJpYWJsZSBp
c24ndCBpbml0aWFsaXNlZApwcm9wZXJseSBhbmQgTGludXggcGFuaWMgd2hlbiBhIHZpcnR1YWwg
Y29uc29sZS90ZXJtaW5hbCBpcyBhc2tlZCB0byBiZQpjcmVhdGVkLgoKU2VlIGZvciBtb3JlIGRl
dGFpbDoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE5LTAzL21zZzAyMTM5Lmh0bWwKClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUu
b3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtA
cmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHYzOgogICAgLSBmaXggY29tbWl0IG1lc3NhZ2UK
CiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIHwgMTYgKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCAxODJl
OTZjYzViLi5jM2VhYmU3ZmE0IDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKQEAgLTI5Miw2ICsyOTIsMTIg
QEAgWGVuUHVibGlzaFJhbVJlZ2lvbnMgKAogICBTdGF0dXMgPSBYZW5HZXRFODIwTWFwICgmRTgy
ME1hcCwgJkU4MjBFbnRyaWVzQ291bnQpOw0KICAgQVNTRVJUX0VGSV9FUlJPUiAoU3RhdHVzKTsN
CiANCisgIEFkZE1lbW9yeUJhc2VTaXplSG9iICgwLCAweEEwMDAwKTsNCisgIC8vDQorICAvLyBW
aWRlbyBtZW1vcnkgKyBMZWdhY3kgQklPUyByZWdpb24sIHRvIGFsbG93IExpbnV4IHRvIGJvb3Qu
DQorICAvLw0KKyAgQWRkUmVzZXJ2ZWRNZW1vcnlCYXNlU2l6ZUhvYiAoMHhBMDAwMCwgQkFTRV8x
TUIgLSAweEEwMDAwLCBUUlVFKTsNCisNCiAgIExvY2FsQXBpYyA9IFBjZEdldDMyKFBjZENwdUxv
Y2FsQXBpY0Jhc2VBZGRyZXNzKTsNCiAgIEFkZElvTWVtb3J5QmFzZVNpemVIb2IgKExvY2FsQXBp
YywgU0laRV8xTUIpOw0KIA0KQEAgLTMwNyw2ICszMTMsMTYgQEAgWGVuUHVibGlzaFJhbVJlZ2lv
bnMgKAogICAgIEJhc2UgPSBBTElHTl9WQUxVRSAoRW50cnktPkJhc2VBZGRyLCAoVUlOVDY0KUVG
SV9QQUdFX1NJWkUpOw0KICAgICBFbmQgPSAoRW50cnktPkJhc2VBZGRyICsgRW50cnktPkxlbmd0
aCkgJiB+KFVJTlQ2NClFRklfUEFHRV9NQVNLOw0KIA0KKyAgICAvLw0KKyAgICAvLyBJZ25vcmUg
dGhlIGZpcnN0IDFNQiwgdGhpcyBpcyBoYW5kbGVkIGJlZm9yZSB0aGUgbG9vcC4NCisgICAgLy8N
CisgICAgaWYgKEJhc2UgPCBCQVNFXzFNQikgew0KKyAgICAgIEJhc2UgPSBCQVNFXzFNQjsNCisg
ICAgfQ0KKyAgICBpZiAoQmFzZSA+PSBFbmQpIHsNCisgICAgICBjb250aW51ZTsNCisgICAgfQ0K
Kw0KICAgICBzd2l0Y2ggKEVudHJ5LT5UeXBlKSB7DQogICAgIGNhc2UgRWZpQWNwaUFkZHJlc3NS
YW5nZU1lbW9yeToNCiAgICAgICBBZGRNZW1vcnlSYW5nZUhvYiAoQmFzZSwgRW5kKTsNCi0tIApB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
