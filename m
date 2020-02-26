Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8E16FE07
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v3u-0002u8-Ok; Wed, 26 Feb 2020 11:41:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v3t-0002td-4g
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:09 +0000
X-Inumbo-ID: de2e7336-588c-11ea-93ff-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de2e7336-588c-11ea-93ff-12813bfff9fa;
 Wed, 26 Feb 2020 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1C3sq6ciml3sSWJH7FufJavHe1bHtiazhqc4dzppJs=;
 b=BiTpyhoqaHKHscgFLQwdrm8NgDuR5onYugsCljUDc7G5BR99xbM3bGpf
 aE89G0R2kcH5YseIIynmQ2X5f4YDnDKBbz6YmjrQLBCMnwW2KsFofiatu
 dLrdBnhZ7hRGInhJNvjW1+eNXYXvLqsvuf2NGotlwQBZAD9MUTkfWIgm4 w=;
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
IronPort-SDR: Hq5zwvtxQ6dRTbcLc+q1L7THti5pS0RlOpScqeKW2aWHYvnyvT+HEXwZzbFCPNCA0JRP1F/I30
 xZhYh1VuodvD7njQZMWh3CLyJnwaiMO8noLbfVl42tyApwsbPNzvtrtK19X6W8/DxqVOoInGE7
 3bnrWrhwOHERa7tQaTNn/YoTWXo6h9c7bvQ+Pa6DKZzFRm2or9+q+7szKp7JYGaBe3f1QmTrp9
 mPmtnP/6I4jmapQ6e1xHPnQ9i6bN4FQFKnVWRgdQghyDnbJJfkq7dzFokfUGcicJnAGpQJW5gn
 tPo=
X-SBRS: 2.7
X-MesageID: 13012973
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13012973"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:43 +0000
Message-ID: <20200226113355.2532224-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 11/23] xen/build: make tests in test/
 directly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgdW5uZWNlc3NhcnkgdG8gbWFrZSBfdGVzdHMgdmlhIFJ1bGVzLm1rIGJlY2F1c2UgdGhl
IHRhcmdldAp1c2UgUnVsZXMubWsgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9NYWtlZmlsZSB8IDggKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL01ha2VmaWxlIGIveGVuL01ha2VmaWxlCmluZGV4IDEwYmM0YmYzNjQ2Yy4uODI2N2FjZTUx
YjBkIDEwMDY0NAotLS0gYS94ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC01MSw4
ICs1MSw4IEBAIGRpc3Q6IGluc3RhbGwKIAogYnVpbGQgaW5zdGFsbDo6IGluY2x1ZGUvY29uZmln
L2F1dG8uY29uZgogCi0uUEhPTlk6IGJ1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGNsZWFuIGRpc3Rj
bGVhbiBNQVAgdGVzdHMKLWJ1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGRlYnVnIGNsZWFuIGRpc3Rj
bGVhbiBNQVAgdGVzdHM6OgorLlBIT05ZOiBidWlsZCBpbnN0YWxsIHVuaW5zdGFsbCBjbGVhbiBk
aXN0Y2xlYW4gTUFQCitidWlsZCBpbnN0YWxsIHVuaW5zdGFsbCBkZWJ1ZyBjbGVhbiBkaXN0Y2xl
YW4gTUFQOjoKIGlmbmVxICgkKFhFTl9UQVJHRVRfQVJDSCkseDg2XzMyKQogCSQoTUFLRSkgLWYg
UnVsZXMubWsgXyRACiBlbHNlCkBAIC05Miw4ICs5Miw4IEBAIF9pbnN0YWxsOiAkKFRBUkdFVCkk
KENPTkZJR19YRU5fSU5TVEFMTF9TVUZGSVgpCiAJCWZpOyBcCiAJZmkKIAotLlBIT05ZOiBfdGVz
dHMKLV90ZXN0czoKKy5QSE9OWTogdGVzdHMKK3Rlc3RzOgogCSQoTUFLRSkgLWYgJChCQVNFRElS
KS9SdWxlcy5tayAtQyB0ZXN0IHRlc3RzCiAuUEhPTlk6IGluc3RhbGwtdGVzdHMKIGluc3RhbGwt
dGVzdHM6Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
