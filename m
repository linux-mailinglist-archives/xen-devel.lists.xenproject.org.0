Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B23512F8AD
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:09:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMfD-00048k-PE; Fri, 03 Jan 2020 13:06:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inMfC-00048B-91
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:06:50 +0000
X-Inumbo-ID: dfece334-2e29-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfece334-2e29-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578056798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Ghhi+RSLsrDx7pejd4UHQhkCE61aWmnYz3y2yoDz8/w=;
 b=SCEF8M0VC4OQh+e9ntA2UuepkqEKheJNASaXBY/4BXjSKpWRJl8+YM0H
 3YPToTX03KgLe1h8sDdPLkGxYBSSIcskVmwfeAk8YhfRLy6NxrOt14NY5
 yCW8jv9sk3FGmDNhNBHinOViVyFi7D6xcMAf7jvLfo5IPUm7KjHJ8s5nY k=;
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
IronPort-SDR: aB2mVbjZtYHDTHbjUbYCeOEa4582xLX2ykXXCFrAzpkOgfbtT9qex4e+5NXDYJ9jN8qEp1WPj8
 LhM+hGeirmpJJ1m2EtUAz3WN45BtiK09MPJW8fxFBqpg4DCUSiGna5Kel8zW7uGjHq+p6nsjsU
 yrwTEaQCQqdQy213LSy/izbtW3wvyZ2wxNKy4udzeW73n4IwI3OgcNjPyn0tJYiRzcv6+vDZS0
 D5g6OBxn/BhpLh1dnObTJQv3ntKvy5udt0k0nMkGFSGxjDEcpspKpiULz1+k2RKxRTRyhXAejW
 IYc=
X-SBRS: 2.7
X-MesageID: 10435307
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10435307"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 3 Jan 2020 13:06:15 +0000
Message-ID: <20200103130616.13724-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200103130616.13724-1-andrew.cooper3@citrix.com>
References: <20200103130616.13724-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 19/20] tools/libxl: Re-position CPUID handling
 during domain construction
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q1BVSUQgaGFuZGxpbmcgbmVlZHMgdG8gYmUgZWFybGllciBpbiBjb25zdHJ1Y3Rpb24uICBNb3Zl
IGl0IGZyb20gaXRzIGN1cnJlbnQKcG9zaXRpb24gaW4gbGlieGxfX2J1aWxkX3Bvc3QoKSB0byBs
aWJ4bF9fYnVpbGRfcHJlKCkgZm9yIGZyZXNoIGJ1aWxkcywgYW5kCmxpYnhsX19zcm1fY2FsbG91
dF9jYWxsYmFja19zdGF0aWNfZGF0YV9kb25lKCkgZm9yIHRoZSBtaWdyYXRpb24vcmVzdW1lIGNh
c2UuCgpJbiB0aGUgbWlncmF0aW9uIGNhc2UsIHRha2UgYWNjb3VudCBvZiBYR1JfU0REX01JU1NJ
TkdfQ1BVSUQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgpD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgMTkgKysrKysr
KysrKysrKysrKysrLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAgfCAxMiArKysrKysrKy0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2NyZWF0ZS5jCmluZGV4IGE4ZmE0Y2ExMWIuLjBkOWE5MWFlZWIgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBA
IC0xMzAzLDggKzEzMDMsMjUgQEAgaW50IGxpYnhsX19zcm1fY2FsbG91dF9jYWxsYmFja19zdGF0
aWNfZGF0YV9kb25lKHVuc2lnbmVkIGludCBtaXNzaW5nLAogICAgIGxpYnhsX19zYXZlX2hlbHBl
cl9zdGF0ZSAqc2hzID0gdXNlcjsKICAgICBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSAqZGNz
ID0gc2hzLT5jYWxsZXJfc3RhdGU7CiAgICAgU1RBVEVfQU9fR0MoZGNzLT5hbyk7CisgICAgbGli
eGxfY3R4ICpjdHggPSBsaWJ4bF9fZ2Nfb3duZXIoZ2MpOworCisgICAgY29uc3QgbGlieGxfZG9t
YWluX2NvbmZpZyAqZF9jb25maWcgPSBkY3MtPmd1ZXN0X2NvbmZpZzsKKyAgICBjb25zdCBsaWJ4
bF9kb21haW5fYnVpbGRfaW5mbyAqaW5mbyA9ICZkX2NvbmZpZy0+Yl9pbmZvOwogCi0gICAgLyog
VE9ETyAtIHNvbWV0aGluZyB1c2VmdWwuICovCisgICAgLyoKKyAgICAgKiBGb3IgcHJlLTQuMTQg
c3RyZWFtcywgbm8gQ1BVSUQvTVNSIGluZm9ybWF0aW9uIHdpbGwgYmUgc2VudC4gIFJldGFpbgor
ICAgICAqIHRoZSBvbGQgYmVoYXZpb3VyIGJ5IHJlZ2VuZXJhdGluZyBDUFVJRCBmcm9tIGZpcnN0
IHByaW5jaXBsZXMuCisgICAgICovCisgICAgaWYgKG1pc3NpbmcgJiBYR1JfU0REX01JU1NJTkdf
Q1BVSUQpCisgICAgICAgIGxpYnhsX2NwdWlkX2FwcGx5X3BvbGljeShjdHgsIGRjcy0+Z3Vlc3Rf
ZG9taWQpOworCisgICAgLyoKKyAgICAgKiBJbiBhbGwgY2FzZXMsIGNwdWlkPVtdIG5lZWRzIHJl
LWV2YWx1YXRpbmcuICBUaGUgY29tbW9uIGNhc2UgaXMgdGhhdCBpdAorICAgICAqIHdpbGwgbWF0
Y2ggbGlieGxfY3B1aWRfYXBwbHlfcG9saWN5KCkgYW5kL29yIHdoYXRldmVyIGlzIGluIHRoZSBz
dHJlYW0sCisgICAgICogYnV0IHRoZSBsZWdhY3kgWEVORCAnaycgbW9kaWZpZXIgcGFzc2VzIHRo
cm91Z2ggaG9zdCB2YWx1ZXMuCisgICAgICovCisgICAgaWYgKGluZm8tPmNwdWlkICE9IE5VTEwp
CisgICAgICAgIGxpYnhsX2NwdWlkX3NldChjdHgsIGRjcy0+Z3Vlc3RfZG9taWQsIGluZm8tPmNw
dWlkKTsKIAogICAgIHJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxf
ZG9tLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb20uYwppbmRleCAwMWFlZmE2Y2U0Li4wOTlhOTEz
MDE5IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kb20uYworKysgYi90b29scy9saWJ4
bC9saWJ4bF9kb20uYwpAQCAtMjU0LDYgKzI1NCw4IEBAIGludCBsaWJ4bF9fYnVpbGRfcHJlKGxp
YnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgIGludCByYzsKICAgICB1aW50NjRfdCBz
aXplOwogCisgICAgY29uc3QgaW50IHJlc3RvcmVfZmQgPSBkY3MtPnJlc3RvcmVfZmQ7CisKICAg
ICBpZiAoeGNfZG9tYWluX21heF92Y3B1cyhjdHgtPnhjaCwgZG9taWQsIGluZm8tPm1heF92Y3B1
cykgIT0gMCkgewogICAgICAgICBMT0coRVJST1IsICJDb3VsZG4ndCBzZXQgbWF4IHZjcHUgY291
bnQiKTsKICAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7CkBAIC0zNzYsNiArMzc4LDEyIEBAIGlu
dCBsaWJ4bF9fYnVpbGRfcHJlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgICAg
ICByZXR1cm4gRVJST1JfRkFJTDsKICAgICB9CiAKKyAgICBpZiAocmVzdG9yZV9mZCA8IDApIHsK
KyAgICAgICAgbGlieGxfY3B1aWRfYXBwbHlfcG9saWN5KGN0eCwgZG9taWQpOworICAgICAgICBp
ZiAoaW5mby0+Y3B1aWQgIT0gTlVMTCkKKyAgICAgICAgICAgIGxpYnhsX2NwdWlkX3NldChjdHgs
IGRvbWlkLCBpbmZvLT5jcHVpZCk7CisgICAgfQorCiAgICAgeHNfZG9taWQgPSB4c19yZWFkKGN0
eC0+eHNoLCBYQlRfTlVMTCwgIi90b29sL3hlbnN0b3JlZC9kb21pZCIsIE5VTEwpOwogICAgIHN0
YXRlLT5zdG9yZV9kb21pZCA9IHhzX2RvbWlkID8gYXRvaSh4c19kb21pZCkgOiAwOwogICAgIGZy
ZWUoeHNfZG9taWQpOwpAQCAtNDU2LDEwICs0NjQsNiBAQCBpbnQgbGlieGxfX2J1aWxkX3Bvc3Qo
bGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCiAgICAgaWYgKHJjKQogICAgICAgICByZXR1
cm4gcmM7CiAKLSAgICBsaWJ4bF9jcHVpZF9hcHBseV9wb2xpY3koY3R4LCBkb21pZCk7Ci0gICAg
aWYgKGluZm8tPmNwdWlkICE9IE5VTEwpCi0gICAgICAgIGxpYnhsX2NwdWlkX3NldChjdHgsIGRv
bWlkLCBpbmZvLT5jcHVpZCk7Ci0KICAgICBpZiAoaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5f
VFlQRV9IVk0KICAgICAgICAgJiYgIWxpYnhsX21zX3ZtX2dlbmlkX2lzX3plcm8oJmluZm8tPnUu
aHZtLm1zX3ZtX2dlbmlkKSkgewogICAgICAgICByYyA9IGxpYnhsX19tc192bV9nZW5pZF9zZXQo
Z2MsIGRvbWlkLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
