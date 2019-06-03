Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2232FA6
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXm3h-0002iT-Dk; Mon, 03 Jun 2019 12:27:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXm3g-0002iO-Hb
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:27:24 +0000
X-Inumbo-ID: eed7ffe6-85fa-11e9-9be6-cfe6b1c824ea
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eed7ffe6-85fa-11e9-9be6-cfe6b1c824ea;
 Mon, 03 Jun 2019 12:27:21 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Ty6Phr2GVWEJclTFj3bkiAoX+IXq1C/E2PNA2X5FzranmkKpNahXp8EVnHB+2w1xlvBz6jDfTj
 5tFIC+PCeg9iyNVYAOJV0CckG5f/RxfhUAn2K2SDpH8bPYcc8gH999DnQHZCc8X7KMCA2hiwvw
 YXqB5FWpwilYGEl0UwgNIr5PlXI2flawlvb5AEDUXNE4nLw6Qgm1jD5U9OSClyDDHhAwoJWqDN
 ArLIFanoqC3QBZxcndKGCj5E0cdAAYXk8O9C3mqzJfWUWffMusuvoyKna40GAyars+hJYX4HGn
 uzA=
X-SBRS: 2.7
X-MesageID: 1239336
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1239336"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 13:25:27 +0100
Message-ID: <1559564728-17167-5-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/5] xen/vm-event: Fix interactions with the
 vcpu list
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dm1fZXZlbnRfcmVzdW1lKCkgc2hvdWxkIHVzZSBkb21haW5fdmNwdSgpLCByYXRoZXIgdGhhbiBv
cGVuY29kaW5nIGl0CndpdGhvdXQgaXRzIFNwZWN0cmUgdjEgc2FmZXR5LgoKdm1fZXZlbnRfd2Fr
ZV9ibG9ja2VkKCkgY2FuJ3QgZXZlciBiZSBpbnZva2VkIGluIGEgY2FzZSB3aGVyZSBkLT52Y3B1
IGlzCk5VTEwsIHNvIGRyb3AgdGhlIG91dGVyIGlmKCkgYW5kIHJlaW5kZW50LCBmaXhpbmcgdXAg
c3R5bGUgaXNzdWVzLgoKVGhlIGNvbW1lbnQsIHdoaWNoIGlzIGxlZnQgYWxvbmUsIGlzIGZhbHNl
LiAgVGhpcyBhbGdvcml0aG0gc3RpbGwgaGFzCnN0YXJ2YXRpb24gaXNzdWVzIHdoZW4gdGhlcmUg
aXMgYW4gYXN5bWV0cmljIHJhdGUgb2YgZ2VuZXJhdGVkIGV2ZW50cy4KCkhvd2V2ZXIsIHRoZSBl
eGlzdGluZyBsb2dpYyBpcyBzdWZmaWNpZW50bHkgY29tcGxpY2F0ZWQgYW5kIGZyYWdpbGUgdGhh
dApJIGRvbid0IHRoaW5rIEkndmUgZm9sbG93ZWQgaXQgZnVsbHksIGFuZCBiZWNhdXNlIHdlJ3Jl
IHRyeWluZyB0bwpvYnNvbGV0ZSB0aGlzIGludGVyZmFjZSwgdGhlIHNhZmVzdCBjb3Vyc2Ugb2Yg
YWN0aW9uIGlzIHRvIGxlYXZlIGl0CmFsb25lLCByYXRoZXIgdGhhbiB0byBlbmQgdXAgbWFraW5n
IHRoaW5ncyBzdWJ0bHkgZGlmZmVyZW50LgoKVGhlcmVmb3JlLCBubyBwcmFjdGljYWwgY2hhbmdl
IHRoYXQgY2FsbGVycyB3b3VsZCBub3RpY2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IFJhenZhbiBDb2pvY2FydSA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4KQ0M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+
Ci0tLQogeGVuL2NvbW1vbi92bV9ldmVudC5jIHwgMzggKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3ZtX2V2ZW50LmMgYi94ZW4vY29tbW9u
L3ZtX2V2ZW50LmMKaW5kZXggZGNiYTk4Yy4uNzJmNDJiNCAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi92bV9ldmVudC5jCisrKyBiL3hlbi9jb21tb24vdm1fZXZlbnQuYwpAQCAtMTE5LDM0ICsxMTks
MjkgQEAgc3RhdGljIHVuc2lnbmVkIGludCB2bV9ldmVudF9yaW5nX2F2YWlsYWJsZShzdHJ1Y3Qg
dm1fZXZlbnRfZG9tYWluICp2ZWQpCiBzdGF0aWMgdm9pZCB2bV9ldmVudF93YWtlX2Jsb2NrZWQo
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZtX2V2ZW50X2RvbWFpbiAqdmVkKQogewogICAgIHN0
cnVjdCB2Y3B1ICp2OwotICAgIHVuc2lnbmVkIGludCBhdmFpbF9yZXEgPSB2bV9ldmVudF9yaW5n
X2F2YWlsYWJsZSh2ZWQpOworICAgIHVuc2lnbmVkIGludCBpLCBqLCBrLCBhdmFpbF9yZXEgPSB2
bV9ldmVudF9yaW5nX2F2YWlsYWJsZSh2ZWQpOwogCiAgICAgaWYgKCBhdmFpbF9yZXEgPT0gMCB8
fCB2ZWQtPmJsb2NrZWQgPT0gMCApCiAgICAgICAgIHJldHVybjsKIAogICAgIC8qIFdlIHJlbWVt
YmVyIHdoaWNoIHZjcHUgbGFzdCB3b2tlIHVwIHRvIGF2b2lkIHNjYW5uaW5nIGFsd2F5cyBsaW5l
YXJseQogICAgICAqIGZyb20gemVybyBhbmQgc3RhcnZpbmcgaGlnaGVyLW51bWJlcmVkIHZjcHVz
IHVuZGVyIGhpZ2ggbG9hZCAqLwotICAgIGlmICggZC0+dmNwdSApCisgICAgZm9yICggaSA9IHZl
ZC0+bGFzdF92Y3B1X3dha2VfdXAgKyAxLCBqID0gMDsgaiA8IGQtPm1heF92Y3B1czsgaSsrLCBq
KysgKQogICAgIHsKLSAgICAgICAgaW50IGksIGosIGs7Ci0KLSAgICAgICAgZm9yIChpID0gdmVk
LT5sYXN0X3ZjcHVfd2FrZV91cCArIDEsIGogPSAwOyBqIDwgZC0+bWF4X3ZjcHVzOyBpKyssIGor
KykKLSAgICAgICAgewotICAgICAgICAgICAgayA9IGkgJSBkLT5tYXhfdmNwdXM7Ci0gICAgICAg
ICAgICB2ID0gZC0+dmNwdVtrXTsKLSAgICAgICAgICAgIGlmICggIXYgKQotICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOworICAgICAgICBrID0gaSAlIGQtPm1heF92Y3B1czsKKyAgICAgICAgdiA9
IGQtPnZjcHVba107CisgICAgICAgIGlmICggIXYgKQorICAgICAgICAgICAgY29udGludWU7CiAK
LSAgICAgICAgICAgIGlmICggISh2ZWQtPmJsb2NrZWQpIHx8IGF2YWlsX3JlcSA9PSAwICkKLSAg
ICAgICAgICAgICAgIGJyZWFrOworICAgICAgICBpZiAoICF2ZWQtPmJsb2NrZWQgfHwgYXZhaWxf
cmVxID09IDAgKQorICAgICAgICAgICAgYnJlYWs7CiAKLSAgICAgICAgICAgIGlmICggdGVzdF9h
bmRfY2xlYXJfYml0KHZlZC0+cGF1c2VfZmxhZywgJnYtPnBhdXNlX2ZsYWdzKSApCi0gICAgICAg
ICAgICB7Ci0gICAgICAgICAgICAgICAgdmNwdV91bnBhdXNlKHYpOwotICAgICAgICAgICAgICAg
IGF2YWlsX3JlcS0tOwotICAgICAgICAgICAgICAgIHZlZC0+YmxvY2tlZC0tOwotICAgICAgICAg
ICAgICAgIHZlZC0+bGFzdF92Y3B1X3dha2VfdXAgPSBrOwotICAgICAgICAgICAgfQorICAgICAg
ICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdCh2ZWQtPnBhdXNlX2ZsYWcsICZ2LT5wYXVzZV9mbGFn
cykgKQorICAgICAgICB7CisgICAgICAgICAgICB2Y3B1X3VucGF1c2Uodik7CisgICAgICAgICAg
ICBhdmFpbF9yZXEtLTsKKyAgICAgICAgICAgIHZlZC0+YmxvY2tlZC0tOworICAgICAgICAgICAg
dmVkLT5sYXN0X3ZjcHVfd2FrZV91cCA9IGs7CiAgICAgICAgIH0KICAgICB9CiB9CkBAIC0zODIs
MTEgKzM3NywxMCBAQCBzdGF0aWMgaW50IHZtX2V2ZW50X3Jlc3VtZShzdHJ1Y3QgZG9tYWluICpk
LCBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCiAgICAgICAgIH0KIAogICAgICAgICAvKiBW
YWxpZGF0ZSB0aGUgdmNwdV9pZCBpbiB0aGUgcmVzcG9uc2UuICovCi0gICAgICAgIGlmICggKHJz
cC52Y3B1X2lkID49IGQtPm1heF92Y3B1cykgfHwgIWQtPnZjcHVbcnNwLnZjcHVfaWRdICkKKyAg
ICAgICAgdiA9IGRvbWFpbl92Y3B1KGQsIHJzcC52Y3B1X2lkKTsKKyAgICAgICAgaWYgKCAhdiAp
CiAgICAgICAgICAgICBjb250aW51ZTsKIAotICAgICAgICB2ID0gZC0+dmNwdVtyc3AudmNwdV9p
ZF07Ci0KICAgICAgICAgLyoKICAgICAgICAgICogSW4gc29tZSBjYXNlcyB0aGUgcmVzcG9uc2Ug
dHlwZSBuZWVkcyBleHRyYSBoYW5kbGluZywgc28gaGVyZQogICAgICAgICAgKiB3ZSBjYWxsIHRo
ZSBhcHByb3ByaWF0ZSBoYW5kbGVycy4KLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
