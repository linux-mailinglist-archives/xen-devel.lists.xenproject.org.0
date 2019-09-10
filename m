Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6FAE9F6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:06:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7esi-0007WZ-GY; Tue, 10 Sep 2019 12:04:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7esh-0007WA-62
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:04:23 +0000
X-Inumbo-ID: 1fb6163d-d3c3-11e9-ac1c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fb6163d-d3c3-11e9-ac1c-12813bfff9fa;
 Tue, 10 Sep 2019 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=dcgFpQQZzlVp1i9Js2oXBFHAKxoLk1E6Q+Rz+K4CjKs=;
 b=Wqv93lzam67MWRh/c58xKEqITcvhKo3mSWeA4rkNpM7AWhcTHEvnwpTj
 F9RNHm4WPQ2oO7kLAe4nWd0tQbZSy57SB2KD7H6OO4adFxDr4tjBmCDq2
 F+LuV51PiqU5zPQmEkIcLlJuTxsDAsF140eY4v7MzvtP3Bdvg4RzTrAdJ Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gAyK/eVkDz7CMQK97CdQlC0vs25oYMMAXK9ST9aDVXBBMwAOafyYPSHhke6cTrKF3dbxcLS+Yp
 d8WwhMSybOtbfB/UWOJGuRygN9q5k3MtEKRB5moJuDehxGC/U/KdiSdWcjwu8pS9CzqvhEqzZM
 dYDSnexpy7JSg3hpVDT5e7C9jQVZZ1O+ZUMVQreGjEa7ovntNI94uKiOhCTQl6Fm11Sw2N3J/O
 YIOjaoVXKp1kHikammvPtIVsgXDAWqz4ANiyEJQtYJFaZbKDzslkua8tWJ9V6zcJHqqOu9WF/z
 r54=
X-SBRS: 2.7
X-MesageID: 5555931
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5555931"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:01 +0100
Message-ID: <20190910120207.10358-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 06/12] tools/ocaml: abi handling: Provide
 ocaml->C conversion/check
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCk5vIHVzZXJz
IG9mIHRoaXMgeWV0IHNvIG5vIG92ZXJhbGwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvb2NhbWwvbGlicy94
Yy9hYmktY2hlY2sgICAgICAgfCAgMyArKy0KIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9z
dHVicy5jIHwgMTUgKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL2Fi
aS1jaGVjayBiL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCmluZGV4IGNjYzM1ZTc5ZTku
LmE0NzBjMDVlMGIgMTAwNzU1Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCisr
KyBiL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCkBAIC0yMiw2ICsyMiw3IEBAIG91ciAk
ZWk7CiAKICMgUGFyc2UgdGhlIEMgZmlsZSBsb29raW5nIGZvciBjYWxscyB0bzoKICMgICBjX2Jp
dG1hcF90b19vY2FtbF9saXN0KCkKKyMgICBvY2FtbF9saXN0X3RvX2NfYml0bWFwKCkKICMKICMg
Zm9sbG93ZWQgYnkgYW5vdGF0aW9ucyBvZiB0aGUgZm9sbG93aW5nIGZvcm06CiAjICAgLyogISBP
VHlwZSBPUHJlZml4IE1hbmdsZSAqLwpAQCAtMzAsNyArMzEsNyBAQCBvdXIgJGVpOwogIyBUaGUg
ZnVuY3Rpb24gZGVmaW5pdGlvbnMgdXNlIC8qICEgKi8gd2hpY2ggc2ltcGx5IHNraXBzIHRoYXQg
aW5zdGFuY2UuCiB3aGlsZSAoPD4pIHsKICAgICBpZiAoJGNsaW5lID09IC0xKSB7Ci0gICAgICAg
IGlmIChtL2NfYml0bWFwX3RvX29jYW1sX2xpc3QvKSB7CisgICAgICAgIGlmIChtL2NfYml0bWFw
X3RvX29jYW1sX2xpc3R8b2NhbWxfbGlzdF90b19jX2JpdG1hcC8pIHsKICAgICAgICAgICAgICRj
bGluZSA9IDA7CiAgICAgICAgICAgICAkZWkgPSB7IH07CiAgICAgICAgIH0KZGlmZiAtLWdpdCBh
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsX3N0dWJzLmMKaW5kZXggMzUyYTZiZDJkNi4uYzc0YzJiNDNhMCAxMDA2NDQKLS0t
IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKKysrIGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKQEAgLTE1Myw2ICsxNTMsMjEgQEAgc3RhdGljIHZhbHVl
IGNfYml0bWFwX3RvX29jYW1sX2xpc3QKIAlDQU1McmV0dXJuKGxpc3QpOwogfQogCitzdGF0aWMg
dW5zaWduZWQgaW50IG9jYW1sX2xpc3RfdG9fY19iaXRtYXAodmFsdWUgbCkKKyAgICAgICAgICAg
ICAvKiAhICovCisgICAgICAgICAgICAgLyoKKwkgICAgICAqIEFsbCBjYWxscyB0byB0aGlzIGZ1
bmN0aW9uIG11c3QgYmUgaW4gYSBmb3JtIHN1aXRhYmxlCisJICAgICAgKiBmb3IgeGVuY3RybF9h
YmlfY2hlY2suICBUaGUgcGFyc2luZyB0aGVyZSBpcyBhZC1ob2MuCisJICAgICAgKi8KK3sKKwl1
bnNpZ25lZCBpbnQgdmFsOworCisJZm9yICggOyBsICE9IFZhbF9ub25lOyBsID0gRmllbGQobCwg
MSkgKQorCQl2YWwgfD0gMXUgPDwgSW50X3ZhbChGaWVsZChsLCAwKSk7CisKKwlyZXR1cm4gdmFs
OworfQorCiBDQU1McHJpbSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUgeGNoLCB2
YWx1ZSBjb25maWcpCiB7CiAJQ0FNTHBhcmFtMih4Y2gsIGNvbmZpZyk7Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
