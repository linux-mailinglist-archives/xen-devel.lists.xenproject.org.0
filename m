Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20CABF433
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:38:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTww-0000Yo-Lb; Thu, 26 Sep 2019 13:36:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pmHm=XV=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iDTwv-0000Yi-An
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 13:36:49 +0000
X-Inumbo-ID: b03361aa-e062-11e9-9654-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id b03361aa-e062-11e9-9654-12813bfff9fa;
 Thu, 26 Sep 2019 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569505008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gLn9425sUw7wSjmm3RrcNAtrhU0yvYtnHREweJrQA54=;
 b=ATpVfbt5/CPZ/0PzNqwPM3dmzQzhR7ID05MYO4MJtQOi3aKL3IqSUIUq
 StCWOtXN1zsn61nLHHzfhq5LRl2iANXgLleTU8LVr2sVa49hnv4acOo7q
 kb8mhCYfg6jHYFOz77vnXC0wSfef7xcTVHBniSzo7FqlUFyLFmeBYBm0i I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R2OGPts+/G192iYDTmeEcN6z532bxe/65x8In8aSXsa/Yyo9lE3PD1v4xhW74pIGSVgzHQ6U7C
 K+12lDDaMHYVUoworxNqfkzr5aGiXpNmndI/515itOxUOELRnbju5ThEr4uvLUO7mD/t4Re6oz
 TWlp9vbInQCUPOxQttU4/F0CmhR9mscz6whYZn0t2CAVtlkexGyoMGeWtqG+Cjf4Lt8KiVb1JS
 7wskLOYHg9odydL0uQ82H8l1uxEbZQ7EuKdVu3sNl+2jZbKfV87l8Z4PrPhscKVcFF8c56P02r
 b38=
X-SBRS: 2.7
X-MesageID: 6394211
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,552,1559534400"; 
   d="scan'208";a="6394211"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Thu, 26 Sep 2019 14:36:18 +0100
Message-ID: <20190926133618.24083-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/shim: fix ballooning down the guest
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IGJhbGxvb25pbmcgZG93biBhIHB2c2hpbSBndWVzdCBjYXVzZXMgdGhlIGZvbGxv
d2luZyBlcnJvcnMKaW5zaWRlIHRoZSBzaGltOgoKICAgIGQzdjAgZmFpbGVkIHRvIHJlc2VydmUg
NTEyIGV4dGVudHMgb2Ygb3JkZXIgNTEyIGZvciBvZmZsaW5pbmcKCkFuZCB0aGUgYmFsbG9vbmVk
LW91dCBwYWdlcyBzdGF5IGluc2lkZSBzaGltIGFuZCBkb24ndCByZWFjaCBMMCBYZW4uCgpGaXgg
dGhpcyBieSBwYXNzaW5nIHRoZSBjb3JyZWN0IGFyZ3VtZW50cyB0byBwdl9zaGltX29mZmxpbmVf
bWVtb3J5KCkKZHVyaW5nIGEgWEVOTUVNX2RlY3JlYXNlX3Jlc2VydmF0aW9uIHJlcXVlc3QuCgpT
aWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0t
LQpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vY29tbW9uL21l
bW9yeS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9tZW1vcnkuYyBiL3hlbi9jb21tb24vbWVtb3J5
LmMKaW5kZXggNzM2NGZkMmMzMy4uMzA5ZTg3MmVkZiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9t
ZW1vcnkuYworKysgYi94ZW4vY29tbW9uL21lbW9yeS5jCkBAIC0xMjI1LDcgKzEyMjUsNyBAQCBs
b25nIGRvX21lbW9yeV9vcCh1bnNpZ25lZCBsb25nIGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh2b2lkKSBhcmcpCiAgICAgICAgICAgICAgKiBoeXBlcmNhbGwgaGFzIGZhaWxlZCBhbmQgb25s
eSBwYXJ0IG9mIHRoZSBleHRlbnRzIHdoZXJlCiAgICAgICAgICAgICAgKiBwcm9jZXNzZWQuCiAg
ICAgICAgICAgICAgKi8KLSAgICAgICAgICAgIHB2X3NoaW1fb2ZmbGluZV9tZW1vcnkoYXJncy5u
cl9leHRlbnRzLCBhcmdzLm5yX2RvbmUpOworICAgICAgICAgICAgcHZfc2hpbV9vZmZsaW5lX21l
bW9yeShhcmdzLm5yX2RvbmUsIGFyZ3MuZXh0ZW50X29yZGVyKTsKICNlbmRpZgogCiAgICAgICAg
IGJyZWFrOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
