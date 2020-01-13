Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D86A139729
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:11:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3Cx-0008E0-Av; Mon, 13 Jan 2020 17:08:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir3Cw-0008Dv-0U
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:08:54 +0000
X-Inumbo-ID: 5cb7a0bb-3627-11ea-82b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cb7a0bb-3627-11ea-82b0-12813bfff9fa;
 Mon, 13 Jan 2020 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578935329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=nz0uEznrsUjKsRIHJXu4bZ82O1eb9Hd8Ns9bcPj8spQ=;
 b=g+m0TFJpEZs4cYrzcywBItRGsR9YCxnLM3a/G05i+3xyiDzes8XTGptO
 JRb4ZC3RTQwQCYs/ZdZ3EDGGFTmCqKELoJ/y4M4sW5SpmVa5SQksm17wG
 SwPOqh8X72u+nI3q7eBhirAVOPS9diUkByP7LB6YQRzEqhpTzklK7dTCa A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wQhkiBW0GpXCP44SpTvUjTYdSRn0X6dlStCZFJ5kmqrWQ5qxjzkG+Sr7CTFtP0fYGkWZXDDGTn
 +o+mPqt9RbxYjgZhog6mLCIb3U1TH+q2I+625uVt5DZSZTq90iWXn9CFIKzDezHEeXtJqpPMT9
 Yr80no8QH17nzN2FUgeqFMvPtAIVvhPRxa+WeQDs+OvB3TKSPvpScOzJ4WnYsQ9Pe10Cwa+Lyw
 Sp/NCU66AwcK06UKQxaJ6eNjcoLNqoAMq5tTBctttw9b8XxSM5g1k+nvJpOXYIYkYytEo5pbKB
 tZI=
X-SBRS: 2.7
X-MesageID: 11009471
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11009471"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:08:38 +0000
Message-ID: <20200113170843.21332-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 05/10] libxl: event: Make
 libxl__poller_wakeup take a gc, not an egc
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gY2FsbCB0aGlzIGluIHRoZSBmb2xsb3dpbmcgc2l0dWF0
aW9uOgoKICogV2UgaGF2ZSBqdXN0IHNldCB1cCBhbiBhbywgd2hpY2ggaXMgdG8gY2FsbCBiYWNr
IC0gc28gYQogICBub24tc3luY2hyb25vdXMgb25lLiAgSXQgb3VnaHQgbm90IHRvIGNhbGwgdGhl
IGFwcGxpY2F0aW9uCiAgIGJhY2sgcmlnaHQgYXdheSwgc28gbm8gZWdjLgoKICogVGhlcmUgaXMg
YSBsaWJ4bCB0aHJlYWQgYmxvY2tpbmcgc29tZXdoZXJlIGJ1dCBpdCBpcyB1c2luZwogICB1c2lu
ZyBhbiBvdXQgb2YgZGF0ZSBmZCBvciB0aW1lb3V0IHNldCwgd2hpY2ggZG9lcyBub3QgdGFrZSBp
bnRvCiAgIGFjY291bnQgdGhlIGFvIHdlIGhhdmUganVzdCBzdGFydGVkLgoKICogV2UgdHJ5IHRv
IHdha2UgdGhhdCB0aHJlYWQgdXAsIGJ1dCBsaWJ4bF9fcG9sbGVyX3dha2V1cCBmYWlscy4KClNp
Z25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0K
djI6IE5ldyBwYXRjaAotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgICAgfCA3ICsrKy0t
LS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9ldmVudC5jIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwppbmRleCAxNmU2Nzg2
ODg5Li4yNjhhNWRhMTIwIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCisr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKQEAgLTE0NzcsNyArMTQ3Nyw3IEBAIHZvaWQg
bGlieGxfX2V2ZW50X29jY3VycmVkKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfZXZlbnQgKmV2ZW50
KQogICAgICAgICBsaWJ4bF9fcG9sbGVyICpwb2xsZXI7CiAgICAgICAgIExJQlhMX1RBSUxRX0lO
U0VSVF9UQUlMKCZDVFgtPm9jY3VycmVkLCBldmVudCwgbGluayk7CiAgICAgICAgIExJQlhMX0xJ
U1RfRk9SRUFDSChwb2xsZXIsICZDVFgtPnBvbGxlcnNfZXZlbnQsIGVudHJ5KQotICAgICAgICAg
ICAgbGlieGxfX3BvbGxlcl93YWtldXAoZWdjLCBwb2xsZXIpOworICAgICAgICAgICAgbGlieGxf
X3BvbGxlcl93YWtldXAoZ2MsIHBvbGxlcik7CiAgICAgfQogfQogCkBAIC0xNjY4LDkgKzE2Njgs
OCBAQCB2b2lkIGxpYnhsX19wb2xsZXJfcHV0KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9fcG9sbGVy
ICpwKQogICAgIExJQlhMX0xJU1RfSU5TRVJUX0hFQUQoJmN0eC0+cG9sbGVyc19pZGxlLCBwLCBl
bnRyeSk7CiB9CiAKLXZvaWQgbGlieGxfX3BvbGxlcl93YWtldXAobGlieGxfX2VnYyAqZWdjLCBs
aWJ4bF9fcG9sbGVyICpwKQordm9pZCBsaWJ4bF9fcG9sbGVyX3dha2V1cChsaWJ4bF9fZ2MgKmdj
LCBsaWJ4bF9fcG9sbGVyICpwKQogewotICAgIEVHQ19HQzsKICAgICBpbnQgZSA9IGxpYnhsX19z
ZWxmX3BpcGVfd2FrZXVwKHAtPndha2V1cF9waXBlWzFdKTsKICAgICBpZiAoZSkgTElCWExfX0VW
RU5UX0RJU0FTVEVSKGdjLCAiY2Fubm90IHBva2Ugd2F0Y2ggcGlwZSIsIGUsIDApOwogfQpAQCAt
MTkyNCw3ICsxOTIzLDcgQEAgdm9pZCBsaWJ4bF9fYW9fY29tcGxldGVfY2hlY2tfcHJvZ3Jlc3Nf
cmVwb3J0cyhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19hbyAqYW8pCiAgICAgICAgIGFzc2VydChh
by0+aW5faW5pdGlhdG9yKTsKICAgICAgICAgaWYgKCFhby0+Y29uc3RydWN0aW5nKQogICAgICAg
ICAgICAgLyogZG9uJ3QgYm90aGVyIHdpdGggdGhpcyBpZiB3ZSdyZSBub3QgaW4gdGhlIGV2ZW50
IGxvb3AgKi8KLSAgICAgICAgICAgIGxpYnhsX19wb2xsZXJfd2FrZXVwKGVnYywgYW8tPnBvbGxl
cik7CisgICAgICAgICAgICBsaWJ4bF9fcG9sbGVyX3dha2V1cChnYywgYW8tPnBvbGxlcik7CiAg
ICAgfSBlbHNlIGlmIChhby0+aG93LmNhbGxiYWNrKSB7CiAgICAgICAgIExPRyhERUJVRywgImFv
ICVwOiBjb21wbGV0ZSBmb3IgY2FsbGJhY2siLCBhbyk7CiAgICAgICAgIExJQlhMX1RBSUxRX0lO
U0VSVF9UQUlMKCZlZ2MtPmFvc19mb3JfY2FsbGJhY2ssIGFvLCBlbnRyeV9mb3JfY2FsbGJhY2sp
OwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmgKaW5kZXggMzI4ZWNmM2UxZS4uYjY4YWIyMThiNiAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9p
bnRlcm5hbC5oCkBAIC0xMzExLDcgKzEzMTEsNyBAQCBfaGlkZGVuIHZvaWQgbGlieGxfX3BvbGxl
cl9wdXQobGlieGxfY3R4KiwgbGlieGxfX3BvbGxlciAqcCAvKiBtYXkgYmUgTlVMTCAqLyk7CiAK
IC8qIE5vdGlmaWVzIHdob2V2ZXIgaXMgcG9sbGluZyB1c2luZyBwIHRoYXQgdGhleSBzaG91bGQg
d2FrZSB1cC4KICAqIGN0eCBtdXN0IGJlIGxvY2tlZC4gKi8KLV9oaWRkZW4gdm9pZCBsaWJ4bF9f
cG9sbGVyX3dha2V1cChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19wb2xsZXIgKnApOworX2hpZGRl
biB2b2lkIGxpYnhsX19wb2xsZXJfd2FrZXVwKGxpYnhsX19nYyAqZWdjLCBsaWJ4bF9fcG9sbGVy
ICpwKTsKIAogLyogSW50ZXJuYWwgdG8gZm9yayBhbmQgY2hpbGQgcmVhcGluZyBtYWNoaW5lcnkg
Ki8KIGV4dGVybiBjb25zdCBsaWJ4bF9jaGlsZHByb2NfaG9va3MgbGlieGxfX2NoaWxkcHJvY19k
ZWZhdWx0X2hvb2tzOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
