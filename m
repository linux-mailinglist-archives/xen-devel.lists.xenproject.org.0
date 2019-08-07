Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B784ABE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 13:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKDY-000267-FL; Wed, 07 Aug 2019 11:34:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvKDX-000261-Pc
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 11:34:55 +0000
X-Inumbo-ID: 5fd1758f-b907-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5fd1758f-b907-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 11:34:53 +0000 (UTC)
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
IronPort-SDR: YaoXaSCECJGWCJMDSsDg3ZdHwNMfmD0FaYyX2yrg0ZIcJ4mViRy35jAdTenY9QhNa7mZP0SlzU
 BpDXwZSmDKpDa052amB6/pIJ4XOfrlKfltxSvS4rzo6/6qxk4iAI1MS5hnPJmCQDHUPiA5QNuL
 2D1hRV3/sxQ4PJa5Tt9jMR2Olbp8Lh1dowkFClI53DzFw+OyQ/13fwjJlz3+ubCJlyDhDpzHKM
 p+742nFmDZ7ex3G/WuH860azzousUoVk64FI1e3Uo51HcCNZQrerWAQZz36bD+NW0E0TNFmoPI
 rxM=
X-SBRS: 2.7
X-MesageID: 4010750
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4010750"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 7 Aug 2019 12:34:39 +0100
Message-ID: <20190807113439.12802-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Set Accessed bits in boot_cpu_{,
 compat_}gdt_table[]
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

VGhlcmUgaXMgbm8gcG9pbnQgY2F1c2luZyB0aGUgQ1BVIHRvIHBlcmZvcm1lZCBhIGxvY2tlZCB1
cGRhdGUgb2YgdGhlCmRlc2NyaXB0b3JzIG9uIGZpcnN0IHVzZS4KClJlcG9ydGVkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TIHwg
MjYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC94
ODZfNjQuUyBiL3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCmluZGV4IGNmNDdlMDE5ZjUuLjBl
YWY5ZDJhMDcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCisrKyBiL3hl
bi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCkBAIC01NSwxMyArNTUsMTMgQEAgR0xPQkFMKHN0YWNr
X3N0YXJ0KQogICAgICAgICAuYWxpZ24gUEFHRV9TSVpFLCAwCiBHTE9CQUwoYm9vdF9jcHVfZ2R0
X3RhYmxlKQogICAgICAgICAucXVhZCAweDAwMDAwMDAwMDAwMDAwMDAgICAgIC8qIHVudXNlZCAq
LwotICAgICAgICAucXVhZCAweDAwYWY5YTAwMDAwMGZmZmYgICAgIC8qIDB4ZTAwOCByaW5nIDAg
Y29kZSwgNjQtYml0IG1vZGUgICAqLwotICAgICAgICAucXVhZCAweDAwY2Y5MjAwMDAwMGZmZmYg
ICAgIC8qIDB4ZTAxMCByaW5nIDAgZGF0YSAgICAgICAgICAgICAgICAqLworICAgICAgICAucXVh
ZCAweDAwYWY5YjAwMDAwMGZmZmYgICAgIC8qIDB4ZTAwOCByaW5nIDAgY29kZSwgNjQtYml0IG1v
ZGUgICAqLworICAgICAgICAucXVhZCAweDAwY2Y5MzAwMDAwMGZmZmYgICAgIC8qIDB4ZTAxMCBy
aW5nIDAgZGF0YSAgICAgICAgICAgICAgICAqLwogICAgICAgICAucXVhZCAweDAwMDAwMDAwMDAw
MDAwMDAgICAgIC8qIHJlc2VydmVkICAgICAgICAgICAgICAgICAgICAgICAgICAqLwotICAgICAg
ICAucXVhZCAweDAwY2ZmYTAwMDAwMGZmZmYgICAgIC8qIDB4ZTAyMyByaW5nIDMgY29kZSwgY29t
cGF0aWJpbGl0eSAqLwotICAgICAgICAucXVhZCAweDAwY2ZmMjAwMDAwMGZmZmYgICAgIC8qIDB4
ZTAyYiByaW5nIDMgZGF0YSAgICAgICAgICAgICAgICAqLwotICAgICAgICAucXVhZCAweDAwYWZm
YTAwMDAwMGZmZmYgICAgIC8qIDB4ZTAzMyByaW5nIDMgY29kZSwgNjQtYml0IG1vZGUgICAqLwot
ICAgICAgICAucXVhZCAweDAwY2Y5YTAwMDAwMGZmZmYgICAgIC8qIDB4ZTAzOCByaW5nIDAgY29k
ZSwgY29tcGF0aWJpbGl0eSAqLworICAgICAgICAucXVhZCAweDAwY2ZmYjAwMDAwMGZmZmYgICAg
IC8qIDB4ZTAyMyByaW5nIDMgY29kZSwgY29tcGF0aWJpbGl0eSAqLworICAgICAgICAucXVhZCAw
eDAwY2ZmMzAwMDAwMGZmZmYgICAgIC8qIDB4ZTAyYiByaW5nIDMgZGF0YSAgICAgICAgICAgICAg
ICAqLworICAgICAgICAucXVhZCAweDAwYWZmYjAwMDAwMGZmZmYgICAgIC8qIDB4ZTAzMyByaW5n
IDMgY29kZSwgNjQtYml0IG1vZGUgICAqLworICAgICAgICAucXVhZCAweDAwY2Y5YjAwMDAwMGZm
ZmYgICAgIC8qIDB4ZTAzOCByaW5nIDAgY29kZSwgY29tcGF0aWJpbGl0eSAqLwogICAgICAgICAu
ZmlsbCAoUEVSX0NQVV9HRFRfRU5UUlkgLSBfX0hZUEVSVklTT1JfQ1MzMiAvIDggLSAxKSwgOCwg
MAogICAgICAgICAucXVhZCAweDAwMDA5MTAwMDAwMDAwMDAgICAgIC8qIHBlci1DUFUgZW50cnkg
KGxpbWl0ID09IGNwdSkgICAgICAqLwogCkBAIC03MCwxMyArNzAsMTMgQEAgR0xPQkFMKGJvb3Rf
Y3B1X2dkdF90YWJsZSkKIC8qICAgICAoY29tcGF0aWJpbGl0eSkgbWFjaGluZS0+cGh5c2ljYWwg
bWFwcGluZyB0YWJsZSBsaXZlcyB0aGVyZS4gICAgICAgKi8KIEdMT0JBTChib290X2NwdV9jb21w
YXRfZ2R0X3RhYmxlKQogICAgICAgICAucXVhZCAweDAwMDAwMDAwMDAwMDAwMDAgICAgIC8qIHVu
dXNlZCAqLwotICAgICAgICAucXVhZCAweDAwYWY5YTAwMDAwMGZmZmYgICAgIC8qIDB4ZTAwOCBy
aW5nIDAgY29kZSwgNjQtYml0IG1vZGUgICAqLwotICAgICAgICAucXVhZCAweDAwY2Y5MjAwMDAw
MGZmZmYgICAgIC8qIDB4ZTAxMCByaW5nIDAgZGF0YSAgICAgICAgICAgICAgICAqLwotICAgICAg
ICAucXVhZCAweDAwY2ZiYTAwMDAwMGZmZmYgICAgIC8qIDB4ZTAxOSByaW5nIDEgY29kZSwgY29t
cGF0aWJpbGl0eSAqLwotICAgICAgICAucXVhZCAweDAwY2ZiMjAwMDAwMGZmZmYgICAgIC8qIDB4
ZTAyMSByaW5nIDEgZGF0YSAgICAgICAgICAgICAgICAqLwotICAgICAgICAucXVhZCAweDAwY2Zm
YTAwMDAwMGZmZmYgICAgIC8qIDB4ZTAyYiByaW5nIDMgY29kZSwgY29tcGF0aWJpbGl0eSAqLwot
ICAgICAgICAucXVhZCAweDAwY2ZmMjAwMDAwMGZmZmYgICAgIC8qIDB4ZTAzMyByaW5nIDMgZGF0
YSAgICAgICAgICAgICAgICAqLwotICAgICAgICAucXVhZCAweDAwY2Y5YTAwMDAwMGZmZmYgICAg
IC8qIDB4ZTAzOCByaW5nIDAgY29kZSwgY29tcGF0aWJpbGl0eSAqLworICAgICAgICAucXVhZCAw
eDAwYWY5YjAwMDAwMGZmZmYgICAgIC8qIDB4ZTAwOCByaW5nIDAgY29kZSwgNjQtYml0IG1vZGUg
ICAqLworICAgICAgICAucXVhZCAweDAwY2Y5MzAwMDAwMGZmZmYgICAgIC8qIDB4ZTAxMCByaW5n
IDAgZGF0YSAgICAgICAgICAgICAgICAqLworICAgICAgICAucXVhZCAweDAwY2ZiYjAwMDAwMGZm
ZmYgICAgIC8qIDB4ZTAxOSByaW5nIDEgY29kZSwgY29tcGF0aWJpbGl0eSAqLworICAgICAgICAu
cXVhZCAweDAwY2ZiMzAwMDAwMGZmZmYgICAgIC8qIDB4ZTAyMSByaW5nIDEgZGF0YSAgICAgICAg
ICAgICAgICAqLworICAgICAgICAucXVhZCAweDAwY2ZmYjAwMDAwMGZmZmYgICAgIC8qIDB4ZTAy
YiByaW5nIDMgY29kZSwgY29tcGF0aWJpbGl0eSAqLworICAgICAgICAucXVhZCAweDAwY2ZmMzAw
MDAwMGZmZmYgICAgIC8qIDB4ZTAzMyByaW5nIDMgZGF0YSAgICAgICAgICAgICAgICAqLworICAg
ICAgICAucXVhZCAweDAwY2Y5YjAwMDAwMGZmZmYgICAgIC8qIDB4ZTAzOCByaW5nIDAgY29kZSwg
Y29tcGF0aWJpbGl0eSAqLwogICAgICAgICAuZmlsbCAoUEVSX0NQVV9HRFRfRU5UUlkgLSBfX0hZ
UEVSVklTT1JfQ1MzMiAvIDggLSAxKSwgOCwgMAogICAgICAgICAucXVhZCAweDAwMDA5MTAwMDAw
MDAwMDAgICAgIC8qIHBlci1DUFUgZW50cnkgKGxpbWl0ID09IGNwdSkgICAgICAqLwogICAgICAg
ICAuYWxpZ24gUEFHRV9TSVpFLCAwCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
