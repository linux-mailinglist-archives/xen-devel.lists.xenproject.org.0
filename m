Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23B14A669
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:43:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5ZM-00039T-QZ; Mon, 27 Jan 2020 14:40:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5ZL-000384-42
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:40:51 +0000
X-Inumbo-ID: 0302d7e2-4113-11ea-aecd-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0302d7e2-4113-11ea-aecd-bc764e2007e4;
 Mon, 27 Jan 2020 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580136051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=re8wKPUa0WJZ1jfdK9kaNjyJi81i0wauyu8vDs8BsBc=;
 b=eakj0HNqS09H1FxmZLtH+hn+UwUX/lAC7+DfInymYu/jAF7/NsAKuym1
 XrbmkEeW5Y5rQacVvFkUM6bLZtPcuJzbHne4S1CWCXEhffgvmyMAG4BZ7
 h9UajohiPNuwrNRQDmvPPb8iRPoMWxlZAT3Wejv772HTshD/YFpBs/ogm Q=;
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
IronPort-SDR: NSvsbcCY1KsInLzIjJtOPUfe8nbLneMsgrZwbGmlM3lJVZpuaxwXPPGPwdotHEeAv7B9eBay1g
 Gtsohfo1AcQm87G/D1wDMWRQlJvJTvk/kUAusIYeQB4zvPMQo4aROHKkrjoewpVAxEgvhNeq58
 F0iwZ0rfYCKI/lvTjy+fBmii5CKxKWEdnZg9v+S4iadhTOCXiCc8eq0WHFQIiGLJT32oiRpKFc
 R0K9OZmXRmksIO5YgLaUFt7z1h8TYRVeLpA5OgyOaWAccMJXVYJm96OCvEX9EMi3+8Yk/4SjsH
 ue4=
X-SBRS: 2.7
X-MesageID: 11507064
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11507064"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:38 +0000
Message-ID: <20200127143444.25538-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 11/17] tools/libxl: Re-position CPUID
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
bnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCAg
OCArKysrKysrLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAgfCAxNiArKysrKysrKysrKyst
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9saWJ4
bF9jcmVhdGUuYwppbmRleCAxZDJlMTkzNTA5Li4wOWY4NDg1OGQ1IDEwMDY0NAotLS0gYS90b29s
cy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwpA
QCAtMTMwMyw4ICsxMzAzLDE0IEBAIGludCBsaWJ4bF9fc3JtX2NhbGxvdXRfY2FsbGJhY2tfc3Rh
dGljX2RhdGFfZG9uZSh2b2lkICp1c2VyKQogICAgIGxpYnhsX19zYXZlX2hlbHBlcl9zdGF0ZSAq
c2hzID0gdXNlcjsKICAgICBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSAqZGNzID0gc2hzLT5j
YWxsZXJfc3RhdGU7CiAgICAgU1RBVEVfQU9fR0MoZGNzLT5hbyk7CisgICAgbGlieGxfY3R4ICpj
dHggPSBsaWJ4bF9fZ2Nfb3duZXIoZ2MpOworCisgICAgY29uc3QgbGlieGxfZG9tYWluX2NvbmZp
ZyAqZF9jb25maWcgPSBkY3MtPmd1ZXN0X2NvbmZpZzsKKyAgICBjb25zdCBsaWJ4bF9kb21haW5f
YnVpbGRfaW5mbyAqaW5mbyA9ICZkX2NvbmZpZy0+Yl9pbmZvOwogCi0gICAgLyogTm90aGluZyB0
byBkbyAoeWV0KS4gKi8KKyAgICBsaWJ4bF9fY3B1aWRfYXBwbHlfcG9saWN5KGN0eCwgZGNzLT5n
dWVzdF9kb21pZCk7CisgICAgaWYgKGluZm8tPmNwdWlkICE9IE5VTEwpCisgICAgICAgIGxpYnhs
X19jcHVpZF9zZXQoY3R4LCBkY3MtPmd1ZXN0X2RvbWlkLCBpbmZvLT5jcHVpZCk7CiAKICAgICBy
ZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jIGIvdG9vbHMv
bGlieGwvbGlieGxfZG9tLmMKaW5kZXggMWJhYzI3NzM1MS4uNWRjODM2OWVkYSAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMK
QEAgLTM4OSw2ICszODksMTggQEAgaW50IGxpYnhsX19idWlsZF9wcmUobGlieGxfX2djICpnYywg
dWludDMyX3QgZG9taWQsCiAKICAgICByYyA9IGxpYnhsX19hcmNoX2RvbWFpbl9jcmVhdGUoZ2Ms
IGRfY29uZmlnLCBkb21pZCk7CiAKKyAgICAvKiBDb25zdHJ1Y3QgYSBDUFVJRCBwb2xpY3ksIGJ1
dCBvbmx5IGZvciBicmFuZCBuZXcgZG9tYWlucy4gIERvbWFpbnMKKyAgICAgKiBiZWluZyBtaWdy
YXRlZC1pbi9yZXN0b3JlZCBoYXZlIENQVUlEIGhhbmRsZWQgZHVyaW5nIHRoZQorICAgICAqIHN0
YXRpY19kYXRhX2RvbmUoKSBjYWxsYmFjay4gKi8KKyAgICBpZiAoIXJlc3RvcmUpIHsKKyAgICAg
ICAgLyogRm9yIHg4NiBhdCBsZWFzdCwgbGlieGxfY3B1aWRfYXBwbHlfcG9saWN5KCkgdGFrZXMg
YW4gaW1wbGljaXQKKyAgICAgICAgICogcGFyYW1ldGVyLCBIVk1fUEFSQU1fUEFFX0VOQUJMRUQs
IHdoaWNoIGlzIG9ubHkgc2V0IHVwIGluCisgICAgICAgICAqIGxpYnhsX19hcmNoX2RvbWFpbl9j
cmVhdGUoKS4gKi8KKyAgICAgICAgbGlieGxfY3B1aWRfYXBwbHlfcG9saWN5KGN0eCwgZG9taWQp
OworICAgICAgICBpZiAoaW5mby0+Y3B1aWQgIT0gTlVMTCkKKyAgICAgICAgICAgIGxpYnhsX2Nw
dWlkX3NldChjdHgsIGRvbWlkLCBpbmZvLT5jcHVpZCk7CisgICAgfQorCiAgICAgcmV0dXJuIHJj
OwogfQogCkBAIC00NTYsMTAgKzQ2OCw2IEBAIGludCBsaWJ4bF9fYnVpbGRfcG9zdChsaWJ4bF9f
Z2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICBpZiAocmMpCiAgICAgICAgIHJldHVybiByYzsK
IAotICAgIGxpYnhsX19jcHVpZF9hcHBseV9wb2xpY3koY3R4LCBkb21pZCk7Ci0gICAgaWYgKGlu
Zm8tPmNwdWlkICE9IE5VTEwpCi0gICAgICAgIGxpYnhsX19jcHVpZF9zZXQoY3R4LCBkb21pZCwg
aW5mby0+Y3B1aWQpOwotCiAgICAgaWYgKGluZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVf
SFZNCiAgICAgICAgICYmICFsaWJ4bF9tc192bV9nZW5pZF9pc196ZXJvKCZpbmZvLT51Lmh2bS5t
c192bV9nZW5pZCkpIHsKICAgICAgICAgcmMgPSBsaWJ4bF9fbXNfdm1fZ2VuaWRfc2V0KGdjLCBk
b21pZCwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
