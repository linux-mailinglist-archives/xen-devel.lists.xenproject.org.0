Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A17FDE9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwZ-0005zp-H9; Fri, 02 Aug 2019 15:58:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwX-0005xR-HD
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:09 +0000
X-Inumbo-ID: 51e265e2-b53e-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51e265e2-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:07 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Zwo0tK+j90azTdoeZCpSfruYC0ajv+jLcIcd/1dwkrUU2YUdyF6Za4iMxcHxqkb4Arki+1N0r0
 H08NZPnMGQwbeJnVa5PiZYBsyMXhlGh5csnmL4VsM6vQJeWvvXO4ner4fIDDgqvA7yxWY3CBLA
 mf5Za5vn1MF1SXc+BdO8OJ+RbXf57qRxeqp7rYUN5Qyem1DSN1NH1KK2juDL9y4dGfKmsq6jSK
 GD7r9DDHKrG/BzhZypEMJolTe7+nlSDKWjjg0F24VGOF+bo4Jl/8nKmFml90h2zP1Wfbj0jUim
 g9g=
X-SBRS: 2.7
X-MesageID: 3911349
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3911349"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:48 +0100
Message-ID: <20190802153606.32061-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 17/35] libxl: Add libxl__ev_qmp to
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YGFvZGV2LT5xbXAnIGlzIGluaXRpYWxpc2VkIGluIGxpYnhsX19wcmVwYXJlX2FvX2RldmljZSgp
LCBidXQgc2luY2UKdGhlcmUgaXNuJ3QgYSBzaW5nbGUgZXhpdCBwYXRoIGZvciBhIGBsaWJ4bF9f
YW9fZGV2aWNlJywgdXNlcnMgb2YgdGhpcwpuZXcgYHFtcCcgZmllbGQgd2lsbCBoYXZlIHRvIGRp
c3Bvc2VkIG9mIGl0LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMgICB8IDIgKysK
IHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMgYi90
b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYwppbmRleCAxOTQxZmU3ODBhLi4xNDAyYjYxYTgxIDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYworKysgYi90b29scy9saWJ4bC9s
aWJ4bF9kZXZpY2UuYwpAQCAtNjQ0LDYgKzY0NCw4IEBAIHZvaWQgbGlieGxfX3ByZXBhcmVfYW9f
ZGV2aWNlKGxpYnhsX19hbyAqYW8sIGxpYnhsX19hb19kZXZpY2UgKmFvZGV2KQogICAgICAqIHdp
dGhvdXQgYWN0dWFsbHkgY2FsbGluZyBhbnkgaG90cGx1ZyBzY3JpcHQgKi8KICAgICBsaWJ4bF9f
YXN5bmNfZXhlY19pbml0KCZhb2Rldi0+YWVzKTsKICAgICBsaWJ4bF9fZXZfY2hpbGRfaW5pdCgm
YW9kZXYtPmNoaWxkKTsKKworICAgIGxpYnhsX19ldl9xbXBfaW5pdCgmYW9kZXYtPnFtcCk7CiB9
CiAKIC8qIG11bHRpZGV2ICovCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCA3Y2FiZmQ2MWI3Li5jYzkz
MThmMzNhIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTI2MjIsNiArMjYyMiw3IEBAIHN0cnVjdCBs
aWJ4bF9fYW9fZGV2aWNlIHsKICAgICBib29sIHVwZGF0ZV9qc29uOwogICAgIC8qIGZvciBhc3lu
Y2hyb25vdXMgZXhlY3V0aW9uIG9mIHN5bmNocm9ub3VzLW9ubHkgc3lzY2FsbHMgZXRjLiAqLwog
ICAgIGxpYnhsX19ldl9jaGlsZCBjaGlsZDsKKyAgICBsaWJ4bF9fZXZfcW1wIHFtcDsKIH07CiAK
IC8qCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
