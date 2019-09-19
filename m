Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D7B8042
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0Qp-0004lI-Kw; Thu, 19 Sep 2019 17:41:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0Qn-0004il-B0
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:25 +0000
X-Inumbo-ID: b26c6ccc-db04-11e9-966e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b26c6ccc-db04-11e9-966e-12813bfff9fa;
 Thu, 19 Sep 2019 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ECqT2JZeGmajyZeTmnC9t4OeRYaTVuKKADJwtHtxIE=;
 b=VqnPWQUE408t+9zUzCWjlDdkwXjtySN+TdPKJMOaoYW66HLaUSwyIWxS
 Fw/0dIG2HpDq2hpJAM1q4Yc7zdyr9c5Fz1X2QslcPhiI4pIfTgzco4jqT
 AWnyCoZW8wI0dlpEOJQtWlUGI/vxmTJuKVQQy9XMGiwX0+EYi1OhyjD6Q I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: itYXpBqAFAzQZ77khrodyuZNTYbWa4JDaQwLMyaY6JOa5pFIToTW/GdzsTwqM9riq0rJG895Nq
 RykU9V4zS8TS/AiGddZEPMj9dLH7u3/g0FnzfnIAJ/Uge+1B3Z0AfOFXYg06iHUbrFZ9Cvt833
 SMCJ+WQd+Fu/fDwOl4th+jrh8j/A8yTsLekJwl9FpAS3zHX5IY8wMJQLIc1ZRwDvWRZ4mEEgB+
 yc3DL4oqOeIHpR+QS3KpjNbf1DwzLEoYZTKnWVxJ0VriyMEfi1c5fGoBrEUMeVhvocJFrj/0qm
 V/k=
X-SBRS: 2.7
X-MesageID: 5806223
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5806223"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:37 +0100
Message-ID: <20190919171656.899649-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 17/35] libxl: Add libxl__ev_qmp to
 libxl__ao_device
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YGFvZGV2LT5xbXAnIGlzIGluaXRpYWxpc2VkIGluIGxpYnhsX19wcmVwYXJlX2FvX2RldmljZSgp
LCBidXQgc2luY2UKdGhlcmUgaXNuJ3QgYSBzaW5nbGUgZXhpdCBwYXRoIGZvciBhIGBsaWJ4bF9f
YW9fZGV2aWNlJywgdXNlcnMgb2YgdGhpcwpuZXcgYHFtcCcgZmllbGQgd2lsbCBoYXZlIHRvIGRp
c3Bvc2VkIG9mIGl0LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHYyOgogICAgLSBBZGRlZCBhIGNvbW1lbnQgdG8gbGli
eGxfX3ByZXBhcmVfYW9fZGV2aWNlIGFib3V0IGZpZWxkcyBsaWtlIGBxbXAnCiAgICAgIHdoaWNo
IG1pZ2h0IG5lZWRzIHRvIGJlIGNsZWFuZWQgdXAgYnkgdGhlIGNhbGxlci4KCiB0b29scy9saWJ4
bC9saWJ4bF9kZXZpY2UuYyAgIHwgMiArKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8
IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMgYi90b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYwpp
bmRleCAxOTQxZmU3ODBhYzAuLjE0MDJiNjFhODEwYiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfZGV2aWNlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMKQEAgLTY0NCw2
ICs2NDQsOCBAQCB2b2lkIGxpYnhsX19wcmVwYXJlX2FvX2RldmljZShsaWJ4bF9fYW8gKmFvLCBs
aWJ4bF9fYW9fZGV2aWNlICphb2RldikKICAgICAgKiB3aXRob3V0IGFjdHVhbGx5IGNhbGxpbmcg
YW55IGhvdHBsdWcgc2NyaXB0ICovCiAgICAgbGlieGxfX2FzeW5jX2V4ZWNfaW5pdCgmYW9kZXYt
PmFlcyk7CiAgICAgbGlieGxfX2V2X2NoaWxkX2luaXQoJmFvZGV2LT5jaGlsZCk7CisKKyAgICBs
aWJ4bF9fZXZfcW1wX2luaXQoJmFvZGV2LT5xbXApOwogfQogCiAvKiBtdWx0aWRldiAqLwpkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmgKaW5kZXggMTE0NGFhYTNhNTY5Li40M2E0MzFmNTM1NjUgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50
ZXJuYWwuaApAQCAtMjU5Miw2ICsyNTkyLDEwIEBAIHR5cGVkZWYgdm9pZCBsaWJ4bF9fZGV2aWNl
X2NhbGxiYWNrKGxpYnhsX19lZ2MqLCBsaWJ4bF9fYW9fZGV2aWNlKik7CiAgKiBPbmNlIF9wcmVw
YXJlIGhhcyBiZWVuIGNhbGxlZCBvbiBhIGxpYnhsX19hb19kZXZpY2UsIGl0IGlzIHNhZmUgdG8g
anVzdAogICogZGlzY2FyZCB0aGlzIHN0cnVjdCwgdGhlcmUncyBubyBuZWVkIHRvIGNhbGwgYW55
IGRlc3Ryb3kgZnVuY3Rpb24uCiAgKiBfcHJlcGFyZSBjYW4gYWxzbyBiZSBjYWxsZWQgbXVsdGlw
bGUgdGltZXMgd2l0aCB0aGUgc2FtZSBsaWJ4bF9fYW9fZGV2aWNlLgorICoKKyAqIEJ1dCBpZiBh
bnkgb2YgdGhlIGZpZWxkcyBgYmFja2VuZF9kcycsIGB0aW1lb3V0JywgYHhzd2FpdCcsIGBxbXAn
IGlzCisgKiB1c2VkIGJ5IGEgY2FsbGVyIG9mIF9wcmVwYXJlLCB0aGUgY2FsbGVyIHdpbGwgaGF2
ZSB0byBhcnJhbmdlIHRvIGNsZWFuCisgKiBvciBkaXNwb3NlIG9mIHRoZW0uCiAgKi8KIF9oaWRk
ZW4gdm9pZCBsaWJ4bF9fcHJlcGFyZV9hb19kZXZpY2UobGlieGxfX2FvICphbywgbGlieGxfX2Fv
X2RldmljZSAqYW9kZXYpOwogCkBAIC0yNjIzLDYgKzI2MjcsNyBAQCBzdHJ1Y3QgbGlieGxfX2Fv
X2RldmljZSB7CiAgICAgYm9vbCB1cGRhdGVfanNvbjsKICAgICAvKiBmb3IgYXN5bmNocm9ub3Vz
IGV4ZWN1dGlvbiBvZiBzeW5jaHJvbm91cy1vbmx5IHN5c2NhbGxzIGV0Yy4gKi8KICAgICBsaWJ4
bF9fZXZfY2hpbGQgY2hpbGQ7CisgICAgbGlieGxfX2V2X3FtcCBxbXA7CiB9OwogCiAvKgotLSAK
QW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
