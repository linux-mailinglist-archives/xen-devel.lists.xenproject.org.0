Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195BD158D9B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 12:38:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1ThU-0001i0-4v; Tue, 11 Feb 2020 11:27:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEN5=37=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1ThS-0001hv-Rm
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 11:27:30 +0000
X-Inumbo-ID: 7c9834c6-4cc1-11ea-b573-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c9834c6-4cc1-11ea-b573-12813bfff9fa;
 Tue, 11 Feb 2020 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581420450;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=77z3sSGYgVGyw1+TviMiHLMehlZL8cObMlNcm54s09Y=;
 b=JiQSfMMiK/oSWu3bPfOrAFIn6K/cd/dNKGdrZIGp4WO/9TbiABuNKLln
 B41IqUx2kcwxUb3p8LoSpxnb9CLVgkSIWWQ835y9Ga7UwQi1AhAVU5fly
 nmI8Z9cNyFcPo7nCIEh5M08djQaO2EecdceuRTCL4qfmK3rCQIDZrxZOO s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q9iZaZqYgPl+/wPpywjCAcA4wRj/OpbDn9aQFyNwFpTp/Fn/+/mje5DMEcGS3ltHrMltLO76nM
 Df3AATb1c/jrTEisN37kah49+lw8u6AllqfNy2Tolr6xlo+fLzHuUqO8EpSCzJfMItJKNXFBhe
 5iG5/B/Wwai5IThiTZp4qxP0En0GyWx+BDqcQ26QuUr0kTwACtk5yK6oNV65gD9YRPsibEig20
 wMwikqU5uLiFgAEDDTsKwb0VECx79PtbiMtTgUg95iYteZqvYrr0TRUYz37/JtaOKisGrt+8T3
 TbQ=
X-SBRS: 2.7
X-MesageID: 12256870
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12256870"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 11 Feb 2020 11:27:26 +0000
Message-ID: <20200211112726.26639-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] AMD/IOMMU: Clean up the allocation helpers
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

Q29uZm9ybSB0byBzdHlsZSwgZHJvcCB1bm5lY2Vzc2FyeSBsb2NhbCB2YXJpYWJsZXMsIGFuZCBh
dm9pZCBvcGVuY29kaW5nCmNsZWFyX2RvbWFpbl9wYWdlKCkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkF2b2lkaW5nIG9wZW5jb2RpbmcgY2xl
YXJfZG9tYWluX3BhZ2UoKSBkcm9wcyBhIHN1cnByaXNpbmcgcXVhbnRpdHkgb2YgY29kZS4KCiAg
YWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzMgdXAvZG93bjogMC8tMjY5ICgtMjY5KQog
IEZ1bmN0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3
ICAgZGVsdGEKICBhbWRfaW9tbXVfYWxsb2Nfcm9vdC5wYXJ0ICAgICAgICAgICAgICAgICAgICAx
NjcgICAgIDExNiAgICAgLTUxCiAgaW9tbXVfcGRlX2Zyb21fZGZuICAgICAgICAgICAgICAgICAg
ICAgICAgICAxMDYxICAgICA5NTUgICAgLTEwNgogIGFtZF9pb21tdV9xdWFyYW50aW5lX2luaXQg
ICAgICAgICAgICAgICAgICAgIDY5NCAgICAgNTgyICAgIC0xMTIKICBUb3RhbDogQmVmb3JlPTMw
MTkwMzEsIEFmdGVyPTMwMTg3NjIsIGNoZyAtMC4wMSUKLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXUuaCB8IDI2ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmggYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvaW9tbXUuaAppbmRleCAxYWJmZGM2ODVhLi4xNmFmNDBiOGNkIDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaAorKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXUuaApAQCAtMzQxLDM0ICszNDEsMjggQEAgc3RhdGljIGlubGlu
ZSB1bnNpZ25lZCBsb25nIHJlZ2lvbl90b19wYWdlcyh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2ln
bmVkIGxvbmcgc2kKICAgICByZXR1cm4gKFBBR0VfQUxJR04oYWRkciArIHNpemUpIC0gKGFkZHIg
JiBQQUdFX01BU0spKSA+PiBQQUdFX1NISUZUOwogfQogCi1zdGF0aWMgaW5saW5lIHN0cnVjdCBw
YWdlX2luZm8qIGFsbG9jX2FtZF9pb21tdV9wZ3RhYmxlKHZvaWQpCitzdGF0aWMgaW5saW5lIHN0
cnVjdCBwYWdlX2luZm8gKmFsbG9jX2FtZF9pb21tdV9wZ3RhYmxlKHZvaWQpCiB7Ci0gICAgc3Ry
dWN0IHBhZ2VfaW5mbyAqcGc7Ci0gICAgdm9pZCAqdmFkZHI7Ci0KLSAgICBwZyA9IGFsbG9jX2Rv
bWhlYXBfcGFnZShOVUxMLCAwKTsKLSAgICBpZiAoIHBnID09IE5VTEwgKQotICAgICAgICByZXR1
cm4gMDsKLSAgICB2YWRkciA9IF9fbWFwX2RvbWFpbl9wYWdlKHBnKTsKLSAgICBtZW1zZXQodmFk
ZHIsIDAsIFBBR0VfU0laRSk7Ci0gICAgdW5tYXBfZG9tYWluX3BhZ2UodmFkZHIpOworICAgIHN0
cnVjdCBwYWdlX2luZm8gKnBnID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOworCisgICAg
aWYgKCBwZyApCisgICAgICAgIGNsZWFyX2RvbWFpbl9wYWdlKHBhZ2VfdG9fbWZuKHBnKSk7CisK
ICAgICByZXR1cm4gcGc7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBmcmVlX2FtZF9pb21tdV9w
Z3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBnKQogewotICAgIGlmICggcGcgIT0gMCApCisgICAg
aWYgKCBwZyApCiAgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKHBnKTsKIH0KIAotc3RhdGljIGlu
bGluZSB2b2lkKiBfX2FsbG9jX2FtZF9pb21tdV90YWJsZXMoaW50IG9yZGVyKQorc3RhdGljIGlu
bGluZSB2b2lkICpfX2FsbG9jX2FtZF9pb21tdV90YWJsZXModW5zaWduZWQgaW50IG9yZGVyKQog
ewotICAgIHZvaWQgKmJ1ZjsKLSAgICBidWYgPSBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVyLCAw
KTsKLSAgICByZXR1cm4gYnVmOworICAgIHJldHVybiBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVy
LCAwKTsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIF9fZnJlZV9hbWRfaW9tbXVfdGFibGVzKHZv
aWQgKnRhYmxlLCBpbnQgb3JkZXIpCitzdGF0aWMgaW5saW5lIHZvaWQgX19mcmVlX2FtZF9pb21t
dV90YWJsZXModm9pZCAqdGFibGUsIHVuc2lnbmVkIGludCBvcmRlcikKIHsKICAgICBmcmVlX3hl
bmhlYXBfcGFnZXModGFibGUsIG9yZGVyKTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
