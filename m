Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5813972A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:11:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3DD-0008Oj-7G; Mon, 13 Jan 2020 17:09:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir3DB-0008My-1Q
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:09:09 +0000
X-Inumbo-ID: 5dfbe8a7-3627-11ea-82b0-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dfbe8a7-3627-11ea-82b0-12813bfff9fa;
 Mon, 13 Jan 2020 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578935331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=i/55sdG8xIe88aFcUASAUUGWec9k6tBxqpCiGBrwGIU=;
 b=N0R5WWzvTedp+Rty+f16ABmZ7ZVgALd0RA5ZfmB9RFe3LU63PnvuBdh5
 bqN9693f3+WLsfvIe2FfMnrBUbKoDVDivKJ4qMoFbnqc4tMK59cgl8XMk
 XNhFN0xEpuVPyCiaORQB097RuVjhe+UvGFfmdbU9TdoE9vP59V7zPsqmq E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V7IggCX+hpcQJ1xg5arxneKMdF4QXUncrTwZnqGTFKs3pfd5Geq30vNavlBXdNOXPFX38PpCv+
 XFJ9emFmzA7bDrO31udFhffEvkJJ65/U0WDOTQ9df3MKIktKES3w1godrHuUeOSnR5hGtoXqCM
 vlHS1K2tNUN6X4iYd9YspuJxT2Mpn0BCIZWQ2hRHL7TSuOFmWtWmUu9lwq5qR80A8+lQYPDbVp
 JpjDqyeu4YleAGn/bX257PtC+7LP1tx8k6wdeNamsLTqF42ilypDMMqc3F75+wlacHhCOpUHN7
 188=
X-SBRS: 2.7
X-MesageID: 10838969
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="10838969"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:08:41 +0000
Message-ID: <20200113170843.21332-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 08/10] libxl: event: Break out baton_wake
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

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCnYyOiBOb3cgaXQgdGFrZXMgYSBnYywgbm90IGFuIGVn
Yy4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIHwgMjEgKysrKysrKysrKysrKy0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIGIvdG9vbHMvbGlieGwvbGlieGxf
ZXZlbnQuYwppbmRleCAzZTc2ZmE1YWY1Li40NWNjNjc5NDJkIDEwMDY0NAotLS0gYS90b29scy9s
aWJ4bC9saWJ4bF9ldmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKQEAgLTE0
MCw2ICsxNDAsMTggQEAgc3RhdGljIHZvaWQgcG9sbGVyc19ub3RlX29zZXZlbnRfYWRkZWQobGli
eGxfY3R4ICpjdHgpIHsKICAgICAgICAgcG9sbGVyLT5vc2V2ZW50c19hZGRlZCA9IDE7CiB9CiAK
K3N0YXRpYyB2b2lkIGJhdG9uX3dha2UobGlieGxfX2djICpnYywgbGlieGxfX3BvbGxlciAqd2Fr
ZSkKK3sKKyAgICBsaWJ4bF9fcG9sbGVyX3dha2V1cChnYywgd2FrZSk7CisKKyAgICB3YWtlLT5v
c2V2ZW50c19hZGRlZCA9IDA7CisgICAgLyogVGhpcyBzZXJ2ZXMgdG8gbWFrZSBfMV9iYXRvbiBp
ZGVtcG90ZW50LiAgSXQgaXMgT0sgZXZlbiB0aG91Z2gKKyAgICAgKiB0aGF0IHBvbGxlciBtYXkg
Y3VycmVudGx5IGJlIHNsZWVwaW5nIG9uIG9ubHkgb2xkIG9zZXZlbnRzLAorICAgICAqIGJlY2F1
c2UgaXQgaXMgZ29pbmcgdG8gd2FrZSB1cCBiZWNhdXNlIHdlJ3ZlIGp1c3QgcHJvZGRlZCBpdCwK
KyAgICAgKiBhbmQgaXQgcGljayB1cCBuZXcgb3NldmVudHMgb24gaXRzIG5leHQgaXRlcmF0aW9u
IChvciBwYXNzCisgICAgICogb24gdGhlIGJhdG9uKS4gKi8KK30KKwogdm9pZCBsaWJ4bF9fZWdj
X2FvX2NsZWFudXBfMV9iYXRvbihsaWJ4bF9fZ2MgKmdjKQogICAgIC8qIEFueSBwb2xsZXIgd2Ug
aGFkIG11c3QgaGF2ZSBiZWVuIGBwdXQnIGFscmVhZHkuICovCiB7CkBAIC0xNjAsMTQgKzE3Miw3
IEBAIHZvaWQgbGlieGxfX2VnY19hb19jbGVhbnVwXzFfYmF0b24obGlieGxfX2djICpnYykKICAg
ICAgICAgLyogbm8tb25lIGluIGxpYnhsIHdhaXRpbmcgZm9yIGFueSBldmVudHMgKi8KICAgICAg
ICAgcmV0dXJuOwogCi0gICAgbGlieGxfX3BvbGxlcl93YWtldXAoZ2MsIHdha2UpOwotCi0gICAg
d2FrZS0+b3NldmVudHNfYWRkZWQgPSAwOwotICAgIC8qIFRoaXMgc2VydmVzIHRvIG1ha2UgXzFf
YmF0b24gaWRlbXBvdGVudC4gIEl0IGlzIE9LIGV2ZW4gdGhvdWdoCi0gICAgICogdGhhdCBwb2xs
ZXIgbWF5IGN1cnJlbnRseSBiZSBzbGVlcGluZyBvbiBvbmx5IG9sZCBvc2V2ZW50cywKLSAgICAg
KiBiZWNhdXNlIGl0IGlzIGdvaW5nIHRvIHdha2UgdXAgYmVjYXVzZSB3ZSd2ZSBqdXN0IHByb2Rk
ZWQgaXQsCi0gICAgICogYW5kIGl0IHBpY2sgdXAgbmV3IG9zZXZlbnRzIG9uIGl0cyBuZXh0IGl0
ZXJhdGlvbiAob3IgcGFzcwotICAgICAqIG9uIHRoZSBiYXRvbikuICovCisgICAgYmF0b25fd2Fr
ZShnYywgd2FrZSk7CiB9CiAKIC8qCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
