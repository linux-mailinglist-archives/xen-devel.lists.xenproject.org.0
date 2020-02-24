Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BC16AC1D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:49:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Gt0-0005yL-Ge; Mon, 24 Feb 2020 16:47:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6Gsy-0005y6-LN
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:47:12 +0000
X-Inumbo-ID: 4cdb7d57-5725-11ea-921c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cdb7d57-5725-11ea-921c-12813bfff9fa;
 Mon, 24 Feb 2020 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582562831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CbW+A+PCwjUpf1AMIEbJgtjuLe7jBLJtBWOyo43HCvg=;
 b=RYhLVCXnXs6or8u/nN21wl9DG1wf5F2A5Q8A3YBpjWqFCLhYgInORr/Y
 FJnYL1yp2WGMHEJmVsfTzviwNjlZc3Kz9LVNztqkAjvBrfBF4mNL7JJQL
 2Cg6I6aPYJifBXwANMTNJfdpuLMW5XOH8bYbytQXnZktqbC/dvGubfN4j E=;
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
IronPort-SDR: +YE4lnFiyaDqr09iO1zQLXIM0UqcmRMYbV9Zo6BksUFFZkS39CD4nmOeK9Spkc3lRiby5tNeQe
 pvqebujqPCZcZmxGNMzjSMftXWlrS4LN+/bpHHXVPqjKkxKK9PjtpGOAQS+4K+rv+r2cEnyPOw
 JgQMmLJ5gY2XM5WsBixC/nKt9gHOeE9FxJx6RctMx47xGN2iKZV+rpM/TSRujiGBx7H8D/I+k1
 RgdM3oqOM/9KkwyEo5p6ekGYEMUU4CI79R3woS3HAqkr4n10Bn3Wsty5aRpjaxKBOtrpfEmPxR
 xBI=
X-SBRS: 2.7
X-MesageID: 13275304
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13275304"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 16:46:55 +0000
Message-ID: <20200224164655.30230-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-12-andrew.cooper3@citrix.com>
References: <20200127143444.25538-12-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2.1 11/17] tools/libxl: Re-position CPUID
 handling during domain construction
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
c2UuCgpMYXRlciBjaGFuZ2VzIHdpbGwgbWFrZSB0aGUgbWlncmF0aW9uL3Jlc3VtZSBjYXNlIGNv
bmRpdGlvbmFsIG9uIHdoZXRoZXIgQ1BVSUQKZGF0YSB3YXMgcHJlc2VudCBpbiB0aGUgbWlncmF0
aW9uIHN0cmVhbSwgYW5kIHRoZSBsaWJ4YyBsYXllciB0b29rIGNhcmUgb2YKcmVzdG9yaW5nIGl0
LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJp
eC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Cgp2Mi4xOgogKiBSZWJhc2Ugb3ZlciBsaWJ4bF9fY3B1aWRf
bGVnYWN5KCkgY2hhbmdlcwotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgNiArKysr
Ky0KIHRvb2xzL2xpYnhsL2xpYnhsX2RvbS5jICAgIHwgOCArKysrKystLQogMiBmaWxlcyBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXgg
Y2I2NjVhNDRjYy4uMmMxY2JkZmIyYSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTEzMTMsOCArMTMxMywx
MiBAQCBpbnQgbGlieGxfX3NybV9jYWxsb3V0X2NhbGxiYWNrX3N0YXRpY19kYXRhX2RvbmUodm9p
ZCAqdXNlcikKICAgICBsaWJ4bF9fc2F2ZV9oZWxwZXJfc3RhdGUgKnNocyA9IHVzZXI7CiAgICAg
bGlieGxfX2RvbWFpbl9jcmVhdGVfc3RhdGUgKmRjcyA9IHNocy0+Y2FsbGVyX3N0YXRlOwogICAg
IFNUQVRFX0FPX0dDKGRjcy0+YW8pOworICAgIGxpYnhsX2N0eCAqY3R4ID0gbGlieGxfX2djX293
bmVyKGdjKTsKKworICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnID0gZGNzLT5ndWVz
dF9jb25maWc7CisgICAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmluZm8gPSAmZF9jb25maWct
PmJfaW5mbzsKIAotICAgIC8qIE5vdGhpbmcgdG8gZG8gKHlldCkuICovCisgICAgbGlieGxfX2Nw
dWlkX2xlZ2FjeShjdHgsIGRjcy0+Z3Vlc3RfZG9taWQsIGluZm8pOwogCiAgICAgcmV0dXJuIDA7
CiB9CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kb20uYyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2RvbS5jCmluZGV4IGQzNzMxZTViOGYuLjFkYTIzZGU1YjkgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2RvbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jCkBAIC0zODks
NiArMzg5LDEyIEBAIGludCBsaWJ4bF9fYnVpbGRfcHJlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90
IGRvbWlkLAogCiAgICAgcmMgPSBsaWJ4bF9fYXJjaF9kb21haW5fY3JlYXRlKGdjLCBkX2NvbmZp
ZywgZG9taWQpOwogCisgICAgLyogQ29uc3RydWN0IGEgQ1BVSUQgcG9saWN5LCBidXQgb25seSBm
b3IgYnJhbmQgbmV3IGRvbWFpbnMuICBEb21haW5zCisgICAgICogYmVpbmcgbWlncmF0ZWQtaW4v
cmVzdG9yZWQgaGF2ZSBDUFVJRCBoYW5kbGVkIGR1cmluZyB0aGUKKyAgICAgKiBzdGF0aWNfZGF0
YV9kb25lKCkgY2FsbGJhY2suICovCisgICAgaWYgKCFyZXN0b3JlKQorICAgICAgICBsaWJ4bF9f
Y3B1aWRfbGVnYWN5KGN0eCwgZG9taWQsIGluZm8pOworCiAgICAgcmV0dXJuIHJjOwogfQogCkBA
IC00NTYsOCArNDYyLDYgQEAgaW50IGxpYnhsX19idWlsZF9wb3N0KGxpYnhsX19nYyAqZ2MsIHVp
bnQzMl90IGRvbWlkLAogICAgIGlmIChyYykKICAgICAgICAgcmV0dXJuIHJjOwogCi0gICAgbGli
eGxfX2NwdWlkX2xlZ2FjeShjdHgsIGRvbWlkLCBpbmZvKTsKLQogICAgIGlmIChpbmZvLT50eXBl
ID09IExJQlhMX0RPTUFJTl9UWVBFX0hWTQogICAgICAgICAmJiAhbGlieGxfbXNfdm1fZ2VuaWRf
aXNfemVybygmaW5mby0+dS5odm0ubXNfdm1fZ2VuaWQpKSB7CiAgICAgICAgIHJjID0gbGlieGxf
X21zX3ZtX2dlbmlkX3NldChnYywgZG9taWQsCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
