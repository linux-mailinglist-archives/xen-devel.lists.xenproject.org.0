Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B1E51FB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 19:07:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO31T-0000Cr-4z; Fri, 25 Oct 2019 17:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eA7w=YS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iO31R-0000Cb-Kf
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 17:05:09 +0000
X-Inumbo-ID: 98c37f84-f749-11e9-a531-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98c37f84-f749-11e9-a531-bc764e2007e4;
 Fri, 25 Oct 2019 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572023108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZArzNpHpPpwto8C5wZO6UU0W8B8tHq5yuGtVwWY6b8=;
 b=bMmjkAGDa6JTmJlmm+dQFD8ELEWMVJKEBxFhfvQpxJD0B/YCK7IPm8Qi
 qaadBjLg2r67PDKu1S7cgG01om5DpF4rflmI/t28KzLAouwoMprmj/Xof
 UZQa2RPgW5rL2rui4LRmrMJWIL4pk4bTIcWWIKLa08ZDNXD54pKRLCrB9 o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kbhoLUtLxotktq8FBwJPiHdnAQhZlAT+4Q6jMNzKWpWiVyemnllm7htwrLG85rULg0pGON8CVs
 ZqYNIQVQFHVvFZ1wNsSMX871S2WWYhRp19+Jb+d172YUwGrsXtH57D4SocDaACqw6Bj5xaGMg7
 PV921c1TWEDj5fkBPCiJtkoJctAaOXa1jM4jQwKmko4kFeaPkBRBdlWvKG8QxnSU56hnad/2ZR
 IP3xdagJbIn0jDoM7O7LoCs5xPJGXcqVNNmFBBc/tP26oP/3mYvg/UuWsKUoqcF8nfgIVE1+2g
 Z+8=
X-SBRS: 2.7
X-MesageID: 7443687
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7443687"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 18:05:02 +0100
Message-ID: <20191025170505.2834957-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025170505.2834957-1-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH for-4.13 1/4] libxl: Introduce
 libxl__ev_child_kill
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

QWxsb3cgdG8ga2lsbCBhIGNoaWxkIGFuZCBkZXJlZ2lzdGVyIHRoZSBjYWxsYmFjayBhc3NvY2lh
dGVkIHdpdGggaXQuCgpUaGUgZGVhdGggaXNuJ3QgaW1tZWRpYXRlIHdpbGwgbmVlZCB0byBiZSBj
b2xsZWN0ZWQgbGF0ZXIsIHNvIHRoZQpldl9jaGlsZCBtYWNoaW5lcnkgcmVnaXN0ZXIgaXRzIG93
biBjYWxsYmFjay4KCmxpYnhsX19ldl9jaGlsZF9raWxsKCkgbWlnaHQgYmUgY2FsbGVkIGJ5IGFu
IEFPIG9wZXJhdGlvbiB0aGF0IGlzCmZpbmlzaGluZy9jbGVhbmluZyB1cCB3aXRob3V0IGEgY2hh
bmNlIGZvciBsaWJ4bCB0byBiZSBub3RpZmllZCBvZiB0aGUKY2hpbGQgZGVhdGggKHZpYSBTSUdD
SExEKS4gU28gaXQgaXMgcG9zc2libGUgdGhhdCB0aGUgYXBwbGljYXRpb24KY2FsbHMgbGlieGxf
Y3R4X2ZyZWUoKSB3aGlsZSB0aGVyZSBhcmUgc3RpbGwgY2hpbGQgYXJvdW5kLiBUbyBhdm9pZAp0
aGUgYXBwbGljYXRpb24gZ2V0dGluZyB1bmV4cGVjdGVkIFNJR0NITEQsIHRoZSBsaWJ4bF9fYW8g
cmVzcG9uc2libGUKZm9yIGtpbGxpbmcgYSBjaGlsZCB3aWxsIGhhdmUgdG8gd2FpdCB1bnRpbCBp
dCBoYXMgYmVlbiBwcm9wZXJseQpyZWFwZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9ldmVu
dC5jICAgIHwgIDMgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYyAgICAgfCA1NSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmggfCAgOCArKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgYi90b29scy9s
aWJ4bC9saWJ4bF9ldmVudC5jCmluZGV4IDAzNzBiNmFjZGQxYy4uZjU3YzE2ZGExZmQ5IDEwMDY0
NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2V2ZW50LmMKQEAgLTE4OTEsNyArMTg5MSw4IEBAIHN0YXRpYyBib29sIGFvX3dvcmtfb3V0c3Rh
bmRpbmcobGlieGxfX2FvICphbykKICAgICAgKiBkZWNyZW1lbnQgcHJvZ3Jlc3NfcmVwb3J0c19v
dXRzdGFuZGluZywgYW5kIGNhbGwKICAgICAgKiBsaWJ4bF9fYW9fY29tcGxldGVfY2hlY2tfcHJv
Z3Jlc3NfcmVwb3J0cy4KICAgICAgKi8KLSAgICByZXR1cm4gIWFvLT5jb21wbGV0ZSB8fCBhby0+
cHJvZ3Jlc3NfcmVwb3J0c19vdXRzdGFuZGluZzsKKyAgICByZXR1cm4gIWFvLT5jb21wbGV0ZSB8
fCBhby0+cHJvZ3Jlc3NfcmVwb3J0c19vdXRzdGFuZGluZworICAgICAgICB8fCBhby0+b3V0c3Rh
bmRpbmdfa2lsbGVkX2NoaWxkOwogfQogCiB2b2lkIGxpYnhsX19hb19jb21wbGV0ZV9jaGVja19w
cm9ncmVzc19yZXBvcnRzKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2FvICphbykKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYwpp
bmRleCBlZWEzZDVkNGU2OGUuLmQ5OWQ0MDEwN2Y3MSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfZm9yay5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYwpAQCAtNjc4LDYgKzY3
OCw2MSBAQCBpbnQgbGlieGxfX2V2X2NoaWxkX3hlbnN0b3JlX3Jlb3BlbihsaWJ4bF9fZ2MgKmdj
LCBjb25zdCBjaGFyICp3aGF0KSB7CiAgICAgcmV0dXJuIHJjOwogfQogCit0eXBlZGVmIHN0cnVj
dCBldl9jaGlsZF9raWxsZWQgeworICAgIGxpYnhsX19hbyAqYW87CisgICAgbGlieGxfX2V2X2No
aWxkIGNoOworfSBldl9jaGlsZF9raWxsZWQ7CitzdGF0aWMgdm9pZCBkZXJlZ2lzdGVyZWRfY2hp
bGRfY2FsbGJhY2sobGlieGxfX2VnYyAqLCBsaWJ4bF9fZXZfY2hpbGQgKiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaWRfdCwgaW50IHN0YXR1cyk7CisKKy8qCisg
KiBBbGxvdyB0byBzZW5kIGEgU0lHS0lMTCBzaWduYWwgdG8gYSBjaGlsZCBhbmQgZGVyZWdpc3Rl
ciB0aGUgZGVhdGgKKyAqIGNhbGxiYWNrLgorICogc3RhdGU6IEFjdGl2ZS9JZGxlIC0+IElkbGUK
KyAqLwordm9pZCBsaWJ4bF9fZXZfY2hpbGRfa2lsbChsaWJ4bF9fYW8gKmFvLCBsaWJ4bF9fZXZf
Y2hpbGQgKmNoKQoreworICAgIEFPX0dDOworCisgICAgaWYgKCFsaWJ4bF9fZXZfY2hpbGRfaW51
c2UoY2gpKQorICAgICAgICByZXR1cm47CisKKyAgICBwaWRfdCBwaWQgPSBjaC0+cGlkOworCisg
ICAgZXZfY2hpbGRfa2lsbGVkICpuZXdfY2ggPSBHQ05FVyhuZXdfY2gpOworICAgIG5ld19jaC0+
YW8gPSBhbzsKKyAgICBuZXdfY2gtPmNoLnBpZCA9IHBpZDsKKyAgICBuZXdfY2gtPmNoLmNhbGxi
YWNrID0gZGVyZWdpc3RlcmVkX2NoaWxkX2NhbGxiYWNrOworICAgIExJQlhMX0xJU1RfSU5TRVJU
X0hFQUQoJkNUWC0+Y2hpbGRyZW4sICZuZXdfY2gtPmNoLCBlbnRyeSk7CisgICAgYW8tPm91dHN0
YW5kaW5nX2tpbGxlZF9jaGlsZCsrOworCisgICAgTElCWExfTElTVF9SRU1PVkUoY2gsIGVudHJ5
KTsKKyAgICBjaC0+cGlkID0gLTE7CisgICAgaW50IHIgPSBraWxsKHBpZCwgU0lHS0lMTCk7Cisg
ICAgaWYgKHIpCisgICAgICAgIExPR0UoRVJST1IsICJmYWlsZWQgdG8ga2lsbCBjaGlsZCBbJWxk
XSIsCisgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpcGlkKTsKK30KKworc3RhdGljIHZvaWQg
ZGVyZWdpc3RlcmVkX2NoaWxkX2NhbGxiYWNrKGxpYnhsX19lZ2MgKmVnYywKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZXZfY2hpbGQgKmNoLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpZF90IHBpZCwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgc3RhdHVzKQoreworICAgIGV2X2NoaWxk
X2tpbGxlZCAqY2sgPSBDT05UQUlORVJfT0YoY2gsICpjaywgY2gpOworICAgIEVHQ19HQzsKKwor
ICAgIGlmIChzdGF0dXMpIHsKKyAgICAgICAgbGlieGxfcmVwb3J0X2NoaWxkX2V4aXRzdGF0dXMo
Q1RYLCBYVExfRVJST1IsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJr
aWxsZWQgZm9yayAoZHlpbmcgYXMgZXhwZWN0ZWQpIiwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGlkLCBzdGF0dXMpOworICAgIH0gZWxzZSB7CisgICAgICAgIExPRyhE
RUJVRywgImtpbGxlZCBjaGlsZCBleGl0IGNsZWFubHksIHVuZXhwZWN0ZWQiKTsKKyAgICB9Cisg
ICAgY2stPmFvLT5vdXRzdGFuZGluZ19raWxsZWRfY2hpbGQtLTsKKyAgICBsaWJ4bF9fYW9fY29t
cGxldGVfY2hlY2tfcHJvZ3Jlc3NfcmVwb3J0cyhlZ2MsIGNrLT5hbyk7Cit9CisKIC8qCiAgKiBM
b2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBkMmQ1YWY3
NDZiNTAuLjU4MjM4OTA3MDNhZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC03MjcsNiArNzI3LDcg
QEAgc3RydWN0IGxpYnhsX19hbyB7CiAgICAgbGlieGxfX3BvbGxlciAqcG9sbGVyOwogICAgIHVp
bnQzMl90IGRvbWlkOwogICAgIExJQlhMX1RBSUxRX0VOVFJZKGxpYnhsX19hbykgZW50cnlfZm9y
X2NhbGxiYWNrOworICAgIGludCBvdXRzdGFuZGluZ19raWxsZWRfY2hpbGQ7CiB9OwogCiAjZGVm
aW5lIExJQlhMX0lOSVRfR0MoZ2MsY3R4KSBkb3sgICAgICAgICAgICAgICBcCkBAIC0xMTY4LDYg
KzExNjksMTMgQEAgc3RhdGljIGlubGluZSBpbnQgbGlieGxfX2V2X2NoaWxkX2ludXNlKGNvbnN0
IGxpYnhsX19ldl9jaGlsZCAqY2hpbGR3X291dCkKICAqIG1lc3NhZ2U+Ii4gKi8KIF9oaWRkZW4g
aW50IGxpYnhsX19ldl9jaGlsZF94ZW5zdG9yZV9yZW9wZW4obGlieGxfX2djICpnYywgY29uc3Qg
Y2hhciAqd2hhdCk7CiAKKy8qCisgKiBBbGxvdyB0byBzZW5kIGEgU0lHS0lMTCBzaWduYWwgdG8g
YSBjaGlsZCBhbmQgZGVyZWdpc3RlciB0aGUgZGVhdGgKKyAqIGNhbGxiYWNrLgorICogc3RhdGU6
IEFjdGl2ZS9JZGxlIC0+IElkbGUKKyAqLworX2hpZGRlbiB2b2lkIGxpYnhsX19ldl9jaGlsZF9r
aWxsKGxpYnhsX19hbyAqYW8sIGxpYnhsX19ldl9jaGlsZCAqY2gpOworCiAKIC8qCiAgKiBPdGhl
ciBldmVudC1oYW5kbGluZyBzdXBwb3J0IHByb3ZpZGVkIGJ5IHRoZSBsaWJ4bCBldmVudCBjb3Jl
IHRvCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
