Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9A1343C2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 14:25:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipBIN-0008VT-K3; Wed, 08 Jan 2020 13:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipBIM-0008VL-2E
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 13:22:46 +0000
X-Inumbo-ID: f4abd1c4-3219-11ea-b7f4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4abd1c4-3219-11ea-b7f4-12813bfff9fa;
 Wed, 08 Jan 2020 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578489766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GWTtW/iClDApFXi8woALVRB6iPRyx6+Wv9Jkh+1vvNk=;
 b=VIq/bkkqs9egIgcVrYAVRN3GThiwLxnN7pf4wLekSXXoxcmc+BFLhOrW
 kUiPblEtdWQCkn7KGPubku2C96OqNHcx5uBfM+nrxhhqtmmD5Mi8XfQ9i
 S5wSz9TUqZLDM4ExzOJrItmD1HlqIH7zrN/vuwKP9foMpSrrmEBPJsv8Z I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HsNKVDwso4S4crO/12IiqoarTcb8SopdsbXAHVmQxfjSNdReOk6qx5nuKyahshuocDK/fmdvVH
 Qcug2d7/0EIVrOUUVyAYAHalyO7W9PjmgotFpRy2KUZFTiu76KEbY0t3Yzu+gbCI35clCEOUXx
 5LTuzepj+adm2Qbf4jJK7bWbYXHflqq3J8osobGdVMs8eH6c9GvTzdolKbS2kTOL1drTqLTmNU
 uT7qxipnMskD5QhVCh8a6bYJFKSkDZPhWdlvERm4zi6n+DpGmZoq4uHVGiw20fzcJymDtvM2TE
 SH0=
X-SBRS: 2.7
X-MesageID: 10638348
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10638348"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 8 Jan 2020 13:22:41 +0000
Message-ID: <20200108132241.8564-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Simplify BSS zeroing
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

VGhlcmUgaXMgbm8gbmVlZCB0byBsb2FkIGEgbm9uLWZsYXQgJWVzIHRvIHplcm8gdGhlIEJTUy4g
IFVzZSBzeW1fZXNpKCkKaW5zdGVhZCwgd2hpY2ggaXMgZWFzaWVyIHRvIGZvbGxvdywgZmFzdGVy
IChhdm9pZHMgdHdvIHNlZ21lbnQgbG9hZHMpIGFuZApkb2Vzbid0IHJlcXVpcmUgdXNlIG9mIHRo
ZSBzdGFjay4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgoKTG9va2luZyB0aHJvdWdoIHRoZSBjb2RlLCBhbG1vc3QgZXZlcnl0aGluZyB0aGF0IHVz
ZXMgc3ltX2ZzKCkgd291bGQgYmUgYmV0dGVyCnVzaW5nIHN5bV9lc2koKS4gIEl0IGlzIHVubmVj
ZXNzYXJ5IGV4dHJhIGluc3RydWN0aW9uIHN0cmVhbSBieXRlcywgYW5kIEFHVQpoaXQgZm9yIGV2
ZXJ5IG1lbW9yeSBvcGVyYW5kLgoKTW9zdCBpbXBvcnRhbnRseSBob3dldmVyLCB0aGUgY29kZSBp
cyBmYXIgbW9yZSBzaW1wbGUgdG8gcmVhc29uIGFib3V0IHdoZW4gaXQKaXMgY29uc2l0ZW50IGFi
b3V0IGJlaW5nIGZsYXQsIHJhdGhlciB0aGFuIG1peGluZyBhbmQgbWF0Y2hpbmcgYmV0d2VlbiBm
bGF0CmFuZCBub24tZmxhdCB2aWV3cyBvZiB0aGUgc2FtZSBtZW1vcnkuCi0tLQogeGVuL2FyY2gv
eDg2L2Jvb3QvaGVhZC5TIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFk
LlMgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKaW5kZXggODIzOTVlOTFkZC4uMWI3MjljMzdm
OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4
Ni9ib290L2hlYWQuUwpAQCAtNjE3LDE2ICs2MTcsMTIgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAg
ICAgICAgam56ICAgICAxZgogCiAgICAgICAgIC8qIEluaXRpYWxpemUgQlNTIChubyBuYXN0eSBz
dXJwcmlzZXMhKS4gKi8KLSAgICAgICAgbW92ICAgICAkc3ltX29mZnMoX19ic3Nfc3RhcnQpLCVl
ZGkKLSAgICAgICAgbW92ICAgICAkc3ltX29mZnMoX19ic3NfZW5kKSwlZWN4Ci0gICAgICAgIHB1
c2ggICAgJWZzCi0gICAgICAgIHBvcCAgICAgJWVzCisgICAgICAgIGxlYSAgICAgc3ltX2VzaShf
X2Jzc19zdGFydCksICVlZGkKKyAgICAgICAgbGVhICAgICBzeW1fZXNpKF9fYnNzX2VuZCksICVl
Y3gKICAgICAgICAgc3ViICAgICAlZWRpLCVlY3gKICAgICAgICAgeG9yICAgICAlZWF4LCVlYXgK
ICAgICAgICAgc2hyICAgICAkMiwlZWN4CiAgICAgICAgIHJlcCBzdG9zbAotICAgICAgICBwdXNo
ICAgICVkcwotICAgICAgICBwb3AgICAgICVlcwogCiAxOgogICAgICAgICAvKiBJbnRlcnJvZ2F0
ZSBDUFUgZXh0ZW5kZWQgZmVhdHVyZXMgdmlhIENQVUlELiAqLwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
