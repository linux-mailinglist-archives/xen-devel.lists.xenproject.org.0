Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059B12A2EA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 16:21:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijlyK-0000Ch-Co; Tue, 24 Dec 2019 15:19:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AG6B=2O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ijlyJ-0000Ca-2S
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 15:19:43 +0000
X-Inumbo-ID: cbed5031-2660-11ea-97e5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbed5031-2660-11ea-97e5-12813bfff9fa;
 Tue, 24 Dec 2019 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577200777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RX6Blgk0Xk4ef64Q6qEVWGRgYRDhAIECGhmmf5qsoUQ=;
 b=M/gB5q6jPNTOJF77OwiN9xA+lq/hw4cFXR6QqWpdfl1EMJEjV6VUaOcz
 ziKyq9U9iGZH0ldJna2AV4LP0ubHQy/utbc5Jy8+/X0N+/XhPzNhE5VII
 md5vaZIlIgmlzNTZiflVybX8OgO5ccv0baBxEgHEHfeQNEo8wQI7Bsh3Y k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gYdQIRzRpFKEcwEDoefh1V9O9dVPRkOm1Fo2KiWurvODCjmfnI7J6rsi+6QuY8DzTQL+lddk8B
 mHufNCvRT3R8NDUo8j9/G0p/Q1yw8kqh5Ngn2W44lK8eXdw+Wihn3QLg6w0pACS3GAjJGDQ8ka
 DZAE84FqHiBxpjc8wTowdlGCphM1eQBQBNrcP4I/5apIVUu8zO3kJv4nkNx7EvEm11WaSRqY2c
 /p75Q4DUiuebHvQWqmYIeIDQmj16/k32i0p9zdtYi/rLhHRpq63ktxqOKRHQIk/17Vj4vK8BUq
 oXo=
X-SBRS: 2.7
X-MesageID: 10482745
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10482745"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 15:19:21 +0000
Message-ID: <20191224151932.6304-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191224151932.6304-1-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 01/12] libxc/save: Shrink code volume where
 possible
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
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBwcm9wZXJ0eSBvZiBob3cgdGhlIGVycm9yIGhhbmRsaW5nICgwIG9uIHN1Y2Nlc3MsIG5vbnpl
cm8gb3RoZXJ3aXNlKQphbGxvd3MgdGhlc2UgY2FsbHMgdG8gYmUgY2hhaW5lZCB0b2dldGhlciB3
aXRoIHRoZSB0ZXJuYXJ5IG9wZXJhdGlvci4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLCBidXQgZmFy
IGxlc3MgYm9pbGVycGxhdGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24gPElhbi5KYWNrc29u
QGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHRvb2xzL2xpYnhjL3hj
X3NyX3NhdmUuYyAgICAgICAgIHwgIDcgKystLS0KIHRvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2
X2h2bS5jIHwgMjEgKysrLS0tLS0tLS0tLS0tCiB0b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9w
di5jICB8IDU4ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmls
ZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZS5jIGIvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZS5jCmlu
ZGV4IGY4OWUxMmM5OWYuLjk3NjRhYTc0M2YgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3Ny
X3NhdmUuYworKysgYi90b29scy9saWJ4Yy94Y19zcl9zYXZlLmMKQEAgLTg0NSwxMSArODQ1LDgg
QEAgc3RhdGljIGludCBzYXZlKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgsIHVpbnQxNl90IGd1
ZXN0X3R5cGUpCiAKICAgICB4Y19yZXBvcnRfcHJvZ3Jlc3Nfc2luZ2xlKHhjaCwgIlN0YXJ0IG9m
IHN0cmVhbSIpOwogCi0gICAgcmMgPSB3cml0ZV9oZWFkZXJzKGN0eCwgZ3Vlc3RfdHlwZSk7Ci0g
ICAgaWYgKCByYyApCi0gICAgICAgIGdvdG8gZXJyOwotCi0gICAgcmMgPSBjdHgtPnNhdmUub3Bz
LnN0YXJ0X29mX3N0cmVhbShjdHgpOworICAgIHJjID0gKHdyaXRlX2hlYWRlcnMoY3R4LCBndWVz
dF90eXBlKSA/OgorICAgICAgICAgIGN0eC0+c2F2ZS5vcHMuc3RhcnRfb2Zfc3RyZWFtKGN0eCkp
OwogICAgIGlmICggcmMgKQogICAgICAgICBnb3RvIGVycjsKIApkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGMveGNfc3Jfc2F2ZV94ODZfaHZtLmMgYi90b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9o
dm0uYwppbmRleCAzZDg2Y2IwNjAwLi5kOTI1YTgxOTk5IDEwMDY0NAotLS0gYS90b29scy9saWJ4
Yy94Y19zcl9zYXZlX3g4Nl9odm0uYworKysgYi90b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9o
dm0uYwpAQCAtMTg3LDI0ICsxODcsOSBAQCBzdGF0aWMgaW50IHg4Nl9odm1fY2hlY2tfdm1fc3Rh
dGUoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCkKIAogc3RhdGljIGludCB4ODZfaHZtX2VuZF9v
Zl9jaGVja3BvaW50KHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpCiB7Ci0gICAgaW50IHJjOwot
Ci0gICAgLyogV3JpdGUgdGhlIFRTQyByZWNvcmQuICovCi0gICAgcmMgPSB3cml0ZV94ODZfdHNj
X2luZm8oY3R4KTsKLSAgICBpZiAoIHJjICkKLSAgICAgICAgcmV0dXJuIHJjOwotCi0gICAgLyog
V3JpdGUgdGhlIEhWTV9DT05URVhUIHJlY29yZC4gKi8KLSAgICByYyA9IHdyaXRlX2h2bV9jb250
ZXh0KGN0eCk7Ci0gICAgaWYgKCByYyApCi0gICAgICAgIHJldHVybiByYzsKLQotICAgIC8qIFdy
aXRlIEhWTV9QQVJBTVMgcmVjb3JkIGNvbnRhaW5zIGFwcGxpY2FibGUgSFZNIHBhcmFtcy4gKi8K
LSAgICByYyA9IHdyaXRlX2h2bV9wYXJhbXMoY3R4KTsKLSAgICBpZiAoIHJjICkKLSAgICAgICAg
cmV0dXJuIHJjOwotCi0gICAgcmV0dXJuIDA7CisgICAgcmV0dXJuICh3cml0ZV94ODZfdHNjX2lu
Zm8oY3R4KSA/OgorICAgICAgICAgICAgd3JpdGVfaHZtX2NvbnRleHQoY3R4KSA/OgorICAgICAg
ICAgICAgd3JpdGVfaHZtX3BhcmFtcyhjdHgpKTsKIH0KIAogc3RhdGljIGludCB4ODZfaHZtX2Ns
ZWFudXAoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCkKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhj
L3hjX3NyX3NhdmVfeDg2X3B2LmMgYi90b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9wdi5jCmlu
ZGV4IDNlYmM1YTJiZjguLjk0ZDBmNjg5MTEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3Ny
X3NhdmVfeDg2X3B2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYwpAQCAt
NzY4LDE5ICs3NjgsMTAgQEAgc3RhdGljIGludCB3cml0ZV9hbGxfdmNwdV9pbmZvcm1hdGlvbihz
dHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQogICAgICAgICBpZiAoICF2aW5mby5vbmxpbmUgKQog
ICAgICAgICAgICAgY29udGludWU7CiAKLSAgICAgICAgcmMgPSB3cml0ZV9vbmVfdmNwdV9iYXNp
YyhjdHgsIGkpOwotICAgICAgICBpZiAoIHJjICkKLSAgICAgICAgICAgIHJldHVybiByYzsKLQot
ICAgICAgICByYyA9IHdyaXRlX29uZV92Y3B1X2V4dGVuZGVkKGN0eCwgaSk7Ci0gICAgICAgIGlm
ICggcmMgKQotICAgICAgICAgICAgcmV0dXJuIHJjOwotCi0gICAgICAgIHJjID0gd3JpdGVfb25l
X3ZjcHVfeHNhdmUoY3R4LCBpKTsKLSAgICAgICAgaWYgKCByYyApCi0gICAgICAgICAgICByZXR1
cm4gcmM7Ci0KLSAgICAgICAgcmMgPSB3cml0ZV9vbmVfdmNwdV9tc3JzKGN0eCwgaSk7CisgICAg
ICAgIHJjID0gKHdyaXRlX29uZV92Y3B1X2Jhc2ljKGN0eCwgaSkgPzoKKyAgICAgICAgICAgICAg
d3JpdGVfb25lX3ZjcHVfZXh0ZW5kZWQoY3R4LCBpKSA/OgorICAgICAgICAgICAgICB3cml0ZV9v
bmVfdmNwdV94c2F2ZShjdHgsIGkpID86CisgICAgICAgICAgICAgIHdyaXRlX29uZV92Y3B1X21z
cnMoY3R4LCBpKSk7CiAgICAgICAgIGlmICggcmMgKQogICAgICAgICAgICAgcmV0dXJuIHJjOwog
ICAgIH0KQEAgLTEwMzEsMjUgKzEwMjIsMTAgQEAgc3RhdGljIGludCB4ODZfcHZfbm9ybWFsaXNl
X3BhZ2Uoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCwgeGVuX3Bmbl90IHR5cGUsCiAgKi8KIHN0
YXRpYyBpbnQgeDg2X3B2X3NldHVwKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpCiB7Ci0gICAg
aW50IHJjOwotCi0gICAgcmMgPSB4ODZfcHZfZG9tYWluX2luZm8oY3R4KTsKLSAgICBpZiAoIHJj
ICkKLSAgICAgICAgcmV0dXJuIHJjOwotCi0gICAgcmMgPSB4ODZfcHZfbWFwX20ycChjdHgpOwot
ICAgIGlmICggcmMgKQotICAgICAgICByZXR1cm4gcmM7Ci0KLSAgICByYyA9IG1hcF9zaGluZm8o
Y3R4KTsKLSAgICBpZiAoIHJjICkKLSAgICAgICAgcmV0dXJuIHJjOwotCi0gICAgcmMgPSBtYXBf
cDJtKGN0eCk7Ci0gICAgaWYgKCByYyApCi0gICAgICAgIHJldHVybiByYzsKLQotICAgIHJldHVy
biAwOworICAgIHJldHVybiAoeDg2X3B2X2RvbWFpbl9pbmZvKGN0eCkgPzoKKyAgICAgICAgICAg
IHg4Nl9wdl9tYXBfbTJwKGN0eCkgPzoKKyAgICAgICAgICAgIG1hcF9zaGluZm8oY3R4KSA/Ogor
ICAgICAgICAgICAgbWFwX3AybShjdHgpKTsKIH0KIAogc3RhdGljIGludCB4ODZfcHZfc3RhcnRf
b2Zfc3RyZWFtKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpCkBAIC0xMDgwLDIxICsxMDU2LDkg
QEAgc3RhdGljIGludCB4ODZfcHZfc3RhcnRfb2ZfY2hlY2twb2ludChzdHJ1Y3QgeGNfc3JfY29u
dGV4dCAqY3R4KQogCiBzdGF0aWMgaW50IHg4Nl9wdl9lbmRfb2ZfY2hlY2twb2ludChzdHJ1Y3Qg
eGNfc3JfY29udGV4dCAqY3R4KQogewotICAgIGludCByYzsKLQotICAgIHJjID0gd3JpdGVfeDg2
X3RzY19pbmZvKGN0eCk7Ci0gICAgaWYgKCByYyApCi0gICAgICAgIHJldHVybiByYzsKLQotICAg
IHJjID0gd3JpdGVfc2hhcmVkX2luZm8oY3R4KTsKLSAgICBpZiAoIHJjICkKLSAgICAgICAgcmV0
dXJuIHJjOwotCi0gICAgcmMgPSB3cml0ZV9hbGxfdmNwdV9pbmZvcm1hdGlvbihjdHgpOwotICAg
IGlmICggcmMgKQotICAgICAgICByZXR1cm4gcmM7Ci0KLSAgICByZXR1cm4gMDsKKyAgICByZXR1
cm4gKHdyaXRlX3g4Nl90c2NfaW5mbyhjdHgpID86CisgICAgICAgICAgICB3cml0ZV9zaGFyZWRf
aW5mbyhjdHgpID86CisgICAgICAgICAgICB3cml0ZV9hbGxfdmNwdV9pbmZvcm1hdGlvbihjdHgp
KTsKIH0KIAogc3RhdGljIGludCB4ODZfcHZfY2hlY2tfdm1fc3RhdGUoc3RydWN0IHhjX3NyX2Nv
bnRleHQgKmN0eCkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
