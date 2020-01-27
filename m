Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403A14A664
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:42:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5ZW-0003FH-Te; Mon, 27 Jan 2020 14:41:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5ZV-0003EQ-21
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:41:01 +0000
X-Inumbo-ID: 08733c9e-4113-11ea-aecd-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08733c9e-4113-11ea-aecd-bc764e2007e4;
 Mon, 27 Jan 2020 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580136059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lxptjlj048jFo1TZ9LyVIlXTZTWDMEbkHr8vGwFVWNg=;
 b=QNaJsMNitgmcH7Ot+yOOrBXZXgz9Jc0in8oZxsVpqHocT4jzHaszVlLE
 jEEcp9nNFwrzlxCGDH0TiORcp26aU0++6IG9c1s7beLtYm6QTZjVCefE6
 +SuELYQ/c4YRmjY1fG+4rRWY+Xm53IO3bnYkFN36hHxETc4c/lpaQUEAi s=;
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
IronPort-SDR: oXzaRxdCI02X1cK9/EbsP11aVANGkgCdNa7QuodbgXb5G2sOj4YYKeLtKt/3NYGEoerEfMfzGg
 rqWqpOc68f35SPndDt2gKLaul0kFNWxbK+K6yjt40ncg6PPerONjD0qkABil9SHkZOWz7HfVF7
 VXqIp+58GvUOcNta9gbywVYAPaC+I0k2HVj699etbbcVj7IwtibDFVihUZs9YReuiI6w50n/D/
 4QKzUOw+DcKmG9qt4eVXPQJ9HlP//RsJnOXBBpdFF740tDoNG59isTry0m8Q5RR3L9VB8j7WGs
 lBM=
X-SBRS: 2.7
X-MesageID: 11860148
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11860148"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:43 +0000
Message-ID: <20200127143444.25538-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 16/17] tools/libxc: Restore CPUID/MSR data
 found in the migration stream
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
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBhbGwgb3RoZXIgcGllY2VzIGluIHBsYWNlLCBpdCBpcyBub3cgc2FmZSB0byByZXN0b3Jl
IHRoZSBDUFVJRCBhbmQgTVNSCmRhdGEgaW4gdGhlIG1pZ3JhdGlvbiBzdHJlYW0sIHJhdGhlciB0
aGFuIGRpc2NhcmRpbmcgdGhlbSBhbmQgdXNpbmcgdGhlIGhpZ2hlcgpsZXZlbCB0b29sc3RhY2tz
IGNvbXBhdGliaWxpdHkgbG9naWMuCgpXaGlsZSB0aGlzIGlzIGEgc21hbGwgcGF0Y2gsIGl0IGhh
cyBsYXJnZSBpbXBsaWNhdGlvbnMgZm9yIG1pZ3JhdGVkL3Jlc3VtZWQKZG9tYWlucy4gIE1vc3Qg
b2J2aW91c2x5LCB0aGUgQ1BVIGZhbWlseS9tb2RlbC9zdGVwcGluZyBkYXRhLApjYWNoZS90bGIv
ZXRjLiB3aWxsIG5vIGxvbmdlciBjaGFuZ2UgYmVoaW5kIHRoZSBndWVzdHMgYmFjay4KCkFub3Ro
ZXIgY2hhbmdlIGlzIHRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGUgWGVuZCBjcHVpZCBzdHJpbmdz
LiAgVGhlICdrJwpvcHRpb24gaXMgbm90IGEgc2Vuc2libGUgdGhpbmcgdG8gaGF2ZSBldmVyIHN1
cHBvcnRlZCwgYW5kICdzJyBpcyBob3cgaG93IHRoZQpzdHJlYW0gd2lsbCBlbmQgdXAgYmVoYXZp
bmcuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Q0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KLS0tCiB0b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyAgICAgfCAgOCArKysrLS0t
LQogdG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5jIHwgMjYgKysrKysrKysrKysrKysrKysr
KysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyBiL3Rvb2xzL2xpYnhj
L3hjX2NwdWlkX3g4Ni5jCmluZGV4IGFjMzhjMTQwNmUuLmM3OGQwMGJiYzMgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4
Ni5jCkBAIC0yOTEsMTAgKzI5MSw5IEBAIGludCB4Y19zZXRfZG9tYWluX2NwdV9wb2xpY3koeGNf
aW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAogICogICAnMCcgLT4gZm9yY2UgdG8gMAog
ICogICAneCcgLT4gd2UgZG9uJ3QgY2FyZSAodXNlIGRlZmF1bHQpCiAgKiAgICdrJyAtPiBwYXNz
IHRocm91Z2ggaG9zdCB2YWx1ZQotICogICAncycgLT4gcGFzcyB0aHJvdWdoIHRoZSBmaXJzdCB0
aW1lIGFuZCB0aGVuIGtlZXAgdGhlIHNhbWUgdmFsdWUKLSAqICAgICAgICAgIGFjcm9zcyBzYXZl
L3Jlc3RvcmUgYW5kIG1pZ3JhdGlvbi4KKyAqICAgJ3MnIC0+IGxlZ2FjeSBhbGlhcyBmb3IgJ2sn
CiAgKgotICogRm9yICdzJyBhbmQgJ3gnIHRoZSBjb25maWd1cmF0aW9uIGlzIG92ZXJ3cml0dGVu
IHdpdGggdGhlIHZhbHVlIGFwcGxpZWQuCisgKiBJbiBhbGwgY2FzZXMsIHRoZSByZXR1cm5lZCBz
dHJpbmcgY29uc2lzdHMgb2YganVzdCAnMCcgYW5kICcxJy4KICAqLwogaW50IHhjX2NwdWlkX3Nl
dCgKICAgICB4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsIGNvbnN0IHVuc2lnbmVk
IGludCAqaW5wdXQsCkBAIC00MjAsNyArNDE5LDggQEAgaW50IHhjX2NwdWlkX3NldCgKICAgICAg
ICAgICAgICAgICBjbGVhcl9mZWF0dXJlKDMxIC0gaiwgcmVnc1tpXSk7CiAKICAgICAgICAgICAg
IGNvbmZpZ190cmFuc2Zvcm1lZFtpXVtqXSA9IGNvbmZpZ1tpXVtqXTsKLSAgICAgICAgICAgIGlm
ICggY29uZmlnW2ldW2pdID09ICdzJyApCisgICAgICAgICAgICAvKiBBbGwgbm9uIDAvMSB2YWx1
ZXMgZ2V0IG92ZXJ3cml0dGVuLiAqLworICAgICAgICAgICAgaWYgKCAoY29uZmlnW2ldW2pdICYg
fjEpICE9ICcwJyApCiAgICAgICAgICAgICAgICAgY29uZmlnX3RyYW5zZm9ybWVkW2ldW2pdID0g
JzAnICsgdmFsOwogICAgICAgICB9CiAgICAgfQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNf
c3JfY29tbW9uX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5jCmluZGV4IGE4
NDk4OTE2MzQuLjc3ZWEwNDRhNzQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3NyX2NvbW1v
bl94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmMKQEAgLTEzNCw4ICsx
MzQsMzAgQEAgaW50IGhhbmRsZV94ODZfbXNyX3BvbGljeShzdHJ1Y3QgeGNfc3JfY29udGV4dCAq
Y3R4LCBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpCiAKIGludCB4ODZfc3RhdGljX2RhdGFfY29t
cGxldGUoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCwgdW5zaWduZWQgaW50ICptaXNzaW5nKQog
ewotICAgIC8qIFRPRE86IEJlY29tZSBjb25kaXRpb25hbCBvbiB0aGVyZSBiZWluZyBubyBkYXRh
IGluIHRoZSBzdHJlYW0uICovCi0gICAgKm1pc3NpbmcgPSBYR1JfU0REX01JU1NJTkdfTVNSIHwg
WEdSX1NERF9NSVNTSU5HX0NQVUlEOworICAgIHhjX2ludGVyZmFjZSAqeGNoID0gY3R4LT54Y2g7
CisgICAgdWludDMyX3QgbnJfbGVhdmVzID0gMCwgbnJfbXNycyA9IDA7CisgICAgdWludDMyX3Qg
ZXJyX2wgPSB+MCwgZXJyX3MgPSB+MCwgZXJyX20gPSB+MDsKKworICAgIGlmICggY3R4LT54ODYu
cmVzdG9yZS5jcHVpZC5wdHIgKQorICAgICAgICBucl9sZWF2ZXMgPSBjdHgtPng4Ni5yZXN0b3Jl
LmNwdWlkLnNpemUgLyBzaXplb2YoeGVuX2NwdWlkX2xlYWZfdCk7CisgICAgZWxzZQorICAgICAg
ICAqbWlzc2luZyB8PSBYR1JfU0REX01JU1NJTkdfQ1BVSUQ7CisKKyAgICBpZiAoIGN0eC0+eDg2
LnJlc3RvcmUubXNyLnB0ciApCisgICAgICAgIG5yX21zcnMgPSBjdHgtPng4Ni5yZXN0b3JlLm1z
ci5zaXplIC8gc2l6ZW9mKHhlbl9tc3JfZW50cnlfdCk7CisgICAgZWxzZQorICAgICAgICAqbWlz
c2luZyB8PSBYR1JfU0REX01JU1NJTkdfTVNSOworCisgICAgaWYgKCAobnJfbGVhdmVzIHx8IG5y
X21zcnMpICYmCisgICAgICAgICB4Y19zZXRfZG9tYWluX2NwdV9wb2xpY3koeGNoLCBjdHgtPmRv
bWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX2xlYXZlcywgY3R4LT54
ODYucmVzdG9yZS5jcHVpZC5wdHIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bnJfbXNycywgICBjdHgtPng4Ni5yZXN0b3JlLm1zci5wdHIsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJmVycl9sLCAmZXJyX3MsICZlcnJfbSkgKQorICAgIHsKKyAgICAgICAg
UEVSUk9SKCJGYWlsZWQgdG8gc2V0IENQVUlEIHBvbGljeTogbGVhZiAlMDh4LCBzdWJsZWFmICUw
OHgsIG1zciAlMDh4IiwKKyAgICAgICAgICAgICAgIGVycl9sLCBlcnJfcywgZXJyX20pOworICAg
ICAgICByZXR1cm4gLTE7CisgICAgfQogCiAgICAgcmV0dXJuIDA7CiB9Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
