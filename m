Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A307FDBA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:39:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZbM-00034R-Aw; Fri, 02 Aug 2019 15:36:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZbK-00033A-0Y
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:36:14 +0000
X-Inumbo-ID: 4122ca74-b53b-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4122ca74-b53b-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:36:11 +0000 (UTC)
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
IronPort-SDR: iIopPvFFWRQPOo+6lnRf89Fm0ADPcMpK8VUCRqSfwdONB4aKP+K1fmUbqXZybzDXAbbuxmJC1W
 2RKan1AGhOL5OuWf1Z8dtBs+RFtJ1kciGQtmtn0SGDiJygGQZLFZ+/ers8LzfHrjoBAK7N1qAF
 gYT52Ipkzsejn4ugPPy+dPg2ttGlHeO5zIANz8dTzRaNgvwkg6lGHzI/ArOZNF6iYAcS6Xkw9H
 /SfcX++i/m6iD4tdgDG2UtnFf1yjpOgCgGg7hDBFCVFBP5ILjvgbl8AXUpmxzHAf+LWJg98r8/
 yng=
X-SBRS: 2.7
X-MesageID: 3950109
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3950109"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:40 +0100
Message-ID: <20190802153606.32061-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 09/35] libxl: Deprecate libxl__domain_{unpause,
 resume}
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgdHdvIGZ1bmN0aW9ucyBhcmUgdXNlZCBmcm9tIG1hbnkgcGxhY2VzIGluIGxpYnhsIGFu
ZCBuZWVkIHRvCmNoYW5nZSB0byBiZSBhYmxlIHRvIGFjY29tb2RhdGUgbGlieGxfX2V2X3FtcCBj
YWxscyBhbmQgdGh1cyBuZWVkcyB0bwpiZSBhc3luY2hyb25vdXMuCgooVGhlcmUgaXMgYWxzbyBs
aWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXZpY2VfbW9kZWwgaW4gdGhlIG1peC4pCgpBIGxhdGVyIHBh
dGNoIHdpbGwgaW50cm9kdWNlIGEgbmV3IGxpYnhsX19kb21haW5fcmVzdW1lIGFuZApsaWJ4bF9f
ZG9tYWluX3VucGF1c2Ugd2hpY2ggd2lsbCBtYWtlIHVzZSBvZiBsaWJ4bF9fZXZfcW1wLgoKU2ln
bmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0t
LQogdG9vbHMvbGlieGwvbGlieGxfY29sb19yZXN0b3JlLmMgfCAgNCArKy0tCiB0b29scy9saWJ4
bC9saWJ4bF9jb2xvX3NhdmUuYyAgICB8ICA0ICsrLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMg
ICAgICAgICAgIHwgIDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmMgIHwgIDYg
KysrLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyAgICAgICB8ICA4ICsrKystLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICAgICB8IDEyICsrKysrKysrLS0tLQogdG9vbHMv
bGlieGwvbGlieGxfcmVtdXMuYyAgICAgICAgfCAgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bF9jb2xvX3Jlc3RvcmUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NvbG9fcmVzdG9yZS5jCmlu
ZGV4IGFhYTcwNTUyYjguLmFhMzY1NjcwZmIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2NvbG9fcmVzdG9yZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NvbG9fcmVzdG9yZS5jCkBA
IC0xMjQsNyArMTI0LDcgQEAgc3RhdGljIHZvaWQgY29sb19yZXN1bWVfdm0obGlieGxfX2VnYyAq
ZWdjLAogICAgICAgICAgICAgICAgIHJldHVybjsKICAgICAgICAgICAgIH0KICAgICAgICAgfQot
ICAgICAgICByYyA9IGxpYnhsX19kb21haW5fcmVzdW1lKGdjLCBjcnMtPmRvbWlkLCAwKTsKKyAg
ICAgICAgcmMgPSBsaWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXByZWNhdGVkKGdjLCBjcnMtPmRvbWlk
LCAwKTsKICAgICAgICAgaWYgKHJjKQogICAgICAgICAgICAgTE9HRChFUlJPUiwgY3JzLT5kb21p
ZCwgImNhbm5vdCByZXN1bWUgc2Vjb25kYXJ5IHZtIik7CiAKQEAgLTg1Myw3ICs4NTMsNyBAQCBz
dGF0aWMgdm9pZCBjb2xvX3VucGF1c2Vfc3ZtKGxpYnhsX19lZ2MgKmVnYywKICAgICBFR0NfR0M7
CiAKICAgICAvKiBXZSBoYXZlIGVuYWJsZWQgc2Vjb25kYXJ5IHZtJ3MgbG9nZGlydHksIHNvIHdl
IGNhbiB1bnBhdXNlIGl0IG5vdyAqLwotICAgIHJjID0gbGlieGxfX2RvbWFpbl91bnBhdXNlKGdj
LCBkb21pZCk7CisgICAgcmMgPSBsaWJ4bF9fZG9tYWluX3VucGF1c2VfZGVwcmVjYXRlZChnYywg
ZG9taWQpOwogICAgIGlmIChyYykgewogICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgImNhbm5v
dCB1bnBhdXNlIHNlY29uZGFyeSB2bSIpOwogICAgICAgICBnb3RvIG91dDsKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2NvbG9fc2F2ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY29sb19z
YXZlLmMKaW5kZXggMWQyNjFhMTYzOS4uYjQ3ZjAzOGY2ZSAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGwvbGlieGxfY29sb19zYXZlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY29sb19zYXZlLmMK
QEAgLTQ3MCw3ICs0NzAsNyBAQCBzdGF0aWMgdm9pZCBjb2xvX3ByZXJlc3VtZV9jYihsaWJ4bF9f
ZWdjICplZ2MsCiAgICAgfQogCiAgICAgLyogUmVzdW1lcyB0aGUgZG9tYWluIGFuZCB0aGUgZGV2
aWNlIG1vZGVsICovCi0gICAgaWYgKGxpYnhsX19kb21haW5fcmVzdW1lKGdjLCBkc3MtPmRvbWlk
LCAvKiBGYXN0IFN1c3BlbmQgKi8xKSkgeworICAgIGlmIChsaWJ4bF9fZG9tYWluX3Jlc3VtZV9k
ZXByZWNhdGVkKGdjLCBkc3MtPmRvbWlkLCAvKiBGYXN0IFN1c3BlbmQgKi8xKSkgewogICAgICAg
ICBMT0dEKEVSUk9SLCBkc3MtPmRvbWlkLCAiY2Fubm90IHJlc3VtZSBwcmltYXJ5IHZtIik7CiAg
ICAgICAgIGdvdG8gb3V0OwogICAgIH0KQEAgLTQ4MCw3ICs0ODAsNyBAQCBzdGF0aWMgdm9pZCBj
b2xvX3ByZXJlc3VtZV9jYihsaWJ4bF9fZWdjICplZ2MsCiAgICAgICogbm8gZGlzayBtaWdyYXRp
b24uCiAgICAgICovCiAgICAgaWYgKGNzcy0+cGF1c2VkKSB7Ci0gICAgICAgIHJjID0gbGlieGxf
X2RvbWFpbl91bnBhdXNlKGdjLCBkc3MtPmRvbWlkKTsKKyAgICAgICAgcmMgPSBsaWJ4bF9fZG9t
YWluX3VucGF1c2VfZGVwcmVjYXRlZChnYywgZHNzLT5kb21pZCk7CiAgICAgICAgIGlmIChyYykg
ewogICAgICAgICAgICAgTE9HRChFUlJPUiwgZHNzLT5kb21pZCwgImNhbm5vdCB1bnBhdXNlIHBy
aW1hcnkgdm0iKTsKICAgICAgICAgICAgIGdvdG8gb3V0OwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggYmI1MzM5Nzg0ZS4u
MjQ2YzU3MDEyMSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29s
cy9saWJ4bC9saWJ4bF9kbS5jCkBAIC0yNDA0LDcgKzI0MDQsNyBAQCBzdGF0aWMgdm9pZCBzdHVi
ZG9tX3B2cWVtdV9jYihsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0K
IAotICAgIHJjID0gbGlieGxfX2RvbWFpbl91bnBhdXNlKGdjLCBkbV9kb21pZCk7CisgICAgcmMg
PSBsaWJ4bF9fZG9tYWluX3VucGF1c2VfZGVwcmVjYXRlZChnYywgZG1fZG9taWQpOwogICAgIGlm
IChyYykgZ290byBvdXQ7CiAKICAgICBzZHNzLT54c3dhaXQuYW8gPSBhbzsKZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb21f
c3VzcGVuZC5jCmluZGV4IGQxYWYzYTY1NzMuLjI0NjAwMjFlNWEgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tX3N1
c3BlbmQuYwpAQCAtNDIxLDcgKzQyMSw3IEBAIHN0YXRpYyB2b2lkIGRvbWFpbl9zdXNwZW5kX2Nh
bGxiYWNrX2NvbW1vbl9kb25lKGxpYnhsX19lZ2MgKmVnYywKIAogLyo9PT09PT09PT09PT09PT09
PT09PT09PSBEb21haW4gcmVzdW1lID09PT09PT09PT09PT09PT09PT09PT09PSovCiAKLWludCBs
aWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXZpY2VfbW9kZWwobGlieGxfX2djICpnYywgdWludDMyX3Qg
ZG9taWQpCitpbnQgbGlieGxfX2RvbWFpbl9yZXN1bWVfZGV2aWNlX21vZGVsX2RlcHJlY2F0ZWQo
bGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQpCiB7CiAgICAgY29uc3QgY2hhciAqcGF0aCwg
KnN0YXRlOwogCkBAIC00NDksNyArNDQ5LDcgQEAgaW50IGxpYnhsX19kb21haW5fcmVzdW1lX2Rl
dmljZV9tb2RlbChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCkKICAgICByZXR1cm4gMDsK
IH0KIAotaW50IGxpYnhsX19kb21haW5fcmVzdW1lKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRv
bWlkLCBpbnQgc3VzcGVuZF9jYW5jZWwpCitpbnQgbGlieGxfX2RvbWFpbl9yZXN1bWVfZGVwcmVj
YXRlZChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwgaW50IHN1c3BlbmRfY2FuY2VsKQog
ewogICAgIGludCByYyA9IDA7CiAKQEAgLTQ2MCw3ICs0NjAsNyBAQCBpbnQgbGlieGxfX2RvbWFp
bl9yZXN1bWUobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsIGludCBzdXNwZW5kX2NhbmNl
bCkKICAgICB9CiAKICAgICBpZiAodHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9IVk0pIHsKLSAg
ICAgICAgcmMgPSBsaWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXZpY2VfbW9kZWwoZ2MsIGRvbWlkKTsK
KyAgICAgICAgcmMgPSBsaWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXZpY2VfbW9kZWxfZGVwcmVjYXRl
ZChnYywgZG9taWQpOwogICAgICAgICBpZiAocmMpIHsKICAgICAgICAgICAgIExPR0QoRVJST1Is
IGRvbWlkLCAiZmFpbGVkIHRvIHJlc3VtZSBkZXZpY2UgbW9kZWw6JWQiLCByYyk7CiAgICAgICAg
ICAgICBnb3RvIG91dDsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jIGIv
dG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKaW5kZXggZjJkNWM4NjQyNy4uODA3OTdjNWVkMiAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfZG9tYWluLmMKQEAgLTE3OCw3ICsxNzgsNyBAQCBpbnQgbGlieGxfZG9tYWluX3Jlc3Vt
ZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsIGludCBzdXNwZW5kX2NhbmNlbCwKICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2FzeW5jb3BfaG93ICphb19ob3cpCiB7
CiAgICAgQU9fQ1JFQVRFKGN0eCwgZG9taWQsIGFvX2hvdyk7Ci0gICAgaW50IHJjID0gbGlieGxf
X2RvbWFpbl9yZXN1bWUoZ2MsIGRvbWlkLCBzdXNwZW5kX2NhbmNlbCk7CisgICAgaW50IHJjID0g
bGlieGxfX2RvbWFpbl9yZXN1bWVfZGVwcmVjYXRlZChnYywgZG9taWQsIHN1c3BlbmRfY2FuY2Vs
KTsKICAgICBsaWJ4bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOwogICAgIHJldHVybiBBT19J
TlBST0dSRVNTOwogfQpAQCAtNTkzLDcgKzU5Myw3IEBAIGludCBsaWJ4bF9kb21haW5fY29yZV9k
dW1wKGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICByZXR1cm4gQU9fSU5QUk9H
UkVTUzsKIH0KIAotaW50IGxpYnhsX19kb21haW5fdW5wYXVzZShsaWJ4bF9fZ2MgKmdjLCBsaWJ4
bF9kb21pZCBkb21pZCkKK2ludCBsaWJ4bF9fZG9tYWluX3VucGF1c2VfZGVwcmVjYXRlZChsaWJ4
bF9fZ2MgKmdjLCBsaWJ4bF9kb21pZCBkb21pZCkKIHsKICAgICBpbnQgciwgcmM7CiAKQEAgLTYw
NCw3ICs2MDQsNyBAQCBpbnQgbGlieGxfX2RvbWFpbl91bnBhdXNlKGxpYnhsX19nYyAqZ2MsIGxp
YnhsX2RvbWlkIGRvbWlkKQogICAgIH0KIAogICAgIGlmICh0eXBlID09IExJQlhMX0RPTUFJTl9U
WVBFX0hWTSkgewotICAgICAgICByYyA9IGxpYnhsX19kb21haW5fcmVzdW1lX2RldmljZV9tb2Rl
bChnYywgZG9taWQpOworICAgICAgICByYyA9IGxpYnhsX19kb21haW5fcmVzdW1lX2RldmljZV9t
b2RlbF9kZXByZWNhdGVkKGdjLCBkb21pZCk7CiAgICAgICAgIGlmIChyYyA8IDApIHsKICAgICAg
ICAgICAgIExPR0QoRVJST1IsIGRvbWlkLAogICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIHVu
cGF1c2UgZGV2aWNlIG1vZGVsIGZvciBkb21haW46ICVkIiwgcmMpOwpAQCAtNjI4LDcgKzYyOCw3
IEBAIGludCBsaWJ4bF9kb21haW5fdW5wYXVzZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9t
aWQsCiAgICAgQU9fQ1JFQVRFKGN0eCwgZG9taWQsIGFvX2hvdyk7CiAgICAgaW50IHJjID0gMDsK
IAotICAgIHJjID0gbGlieGxfX2RvbWFpbl91bnBhdXNlKGdjLCBkb21pZCk7CisgICAgcmMgPSBs
aWJ4bF9fZG9tYWluX3VucGF1c2VfZGVwcmVjYXRlZChnYywgZG9taWQpOwogICAgIGlmIChyYykg
Z290byBvdXQ7CiAKICAgICBsaWJ4bF9fYW9fY29tcGxldGUoZWdjLCBhbywgcmMpOwpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmgKaW5kZXggNWUwOWU2MDJlZC4uZGEzNjMxZDg1MyAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
CkBAIC0xMzE0LDcgKzEzMTQsOCBAQCBfaGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX3JlbmFtZShs
aWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGNoYXIgKm9sZF9uYW1lLCBjb25zdCBjaGFyICpuZXdfbmFtZSwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhzX3RyYW5zYWN0aW9uX3QgdHJhbnMpOwogCi1f
aGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXZpY2VfbW9kZWwobGlieGxfX2djICpn
YywgdWludDMyX3QgZG9taWQpOworLyogRGVwcmVjYXRlZCwgdXNlIGxpYnhsX19kbV9yZXN1bWUg
aW5zdGVhZC4gKi8KK19oaWRkZW4gaW50IGxpYnhsX19kb21haW5fcmVzdW1lX2RldmljZV9tb2Rl
bF9kZXByZWNhdGVkKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkKTsKIAogX2hpZGRlbiBj
b25zdCBjaGFyICpsaWJ4bF9fdXNlcmRhdGFfcGF0aChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBk
b21pZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqdXNlcmRhdGFfdXNlcmlkLApAQCAtMTMzMSw4ICsxMzMyLDEyIEBAIF9oaWRkZW4gaW50IGxp
YnhsX191c2VyZGF0YV9zdG9yZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICp1c2VyZGF0YV91c2VyaWQs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDhfdCAqZGF0YSwg
aW50IGRhdGFsZW4pOwogCi1faGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX3Jlc3VtZShsaWJ4bF9f
Z2MgKmdjLCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCBzdXNwZW5kX2NhbmNlbCk7CisvKiBEZXByZWNhdGVkLCB1c2UgbGlieGxfX2RvbWFpbl9y
ZXN1bWUgaW5zdGVhZCAqLworX2hpZGRlbiBpbnQgbGlieGxfX2RvbWFpbl9yZXN1bWVfZGVwcmVj
YXRlZChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IHN1c3BlbmRfY2FuY2VsKTsKKy8qIERlcHJlY2F0
ZWQsIHVzZSBsaWJ4bF9fZG9tYWluX3VucGF1c2UgaW5zdGVhZCAqLworX2hpZGRlbiBpbnQgbGli
eGxfX2RvbWFpbl91bnBhdXNlX2RlcHJlY2F0ZWQobGlieGxfX2djICosCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kb21pZCBkb21pZCk7CiAKIC8q
IHJldHVybnMgMCBvciAxLCBvciBhIGxpYnhsIGVycm9yIGNvZGUgKi8KIF9oaWRkZW4gaW50IGxp
YnhsX19kb21haW5fcHZjb250cm9sX2F2YWlsYWJsZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBk
b21pZCk7CkBAIC00MTAzLDcgKzQxMDgsNiBAQCBfaGlkZGVuIHZvaWQgbGlieGxfX3JlbXVzX3Rl
YXJkb3duKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IHJjKTsKIF9oaWRkZW4gdm9pZCBsaWJ4bF9fcmVtdXNfcmVzdG9yZV9zZXR1cChsaWJ4
bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGli
eGxfX2RvbWFpbl9jcmVhdGVfc3RhdGUgKmRjcyk7Ci1faGlkZGVuIGludCBsaWJ4bF9fZG9tYWlu
X3VucGF1c2UobGlieGxfX2djICosIGxpYnhsX2RvbWlkIGRvbWlkKTsKIAogCiAvKgpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcmVtdXMuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3JlbXVz
LmMKaW5kZXggMjlhNDc4MzhjOC4uNjMzOGExYmFlNSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfcmVtdXMuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9yZW11cy5jCkBAIC0yNjcsNyAr
MjY3LDcgQEAgc3RhdGljIHZvaWQgcmVtdXNfZGV2aWNlc19wcmVyZXN1bWVfY2IobGlieGxfX2Vn
YyAqZWdjLAogICAgICAgICBnb3RvIG91dDsKIAogICAgIC8qIFJlc3VtZXMgdGhlIGRvbWFpbiBh
bmQgdGhlIGRldmljZSBtb2RlbCAqLwotICAgIHJjID0gbGlieGxfX2RvbWFpbl9yZXN1bWUoZ2Ms
IGRzcy0+ZG9taWQsIC8qIEZhc3QgU3VzcGVuZCAqLzEpOworICAgIHJjID0gbGlieGxfX2RvbWFp
bl9yZXN1bWVfZGVwcmVjYXRlZChnYywgZHNzLT5kb21pZCwgLyogRmFzdCBTdXNwZW5kICovMSk7
CiAgICAgaWYgKHJjKQogICAgICAgICBnb3RvIG91dDsKIAotLSAKQW50aG9ueSBQRVJBUkQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
