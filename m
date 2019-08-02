Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA57FDB6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:39:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZbJ-00032g-0B; Fri, 02 Aug 2019 15:36:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZbH-00032K-Id
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:36:11 +0000
X-Inumbo-ID: 40705e20-b53b-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 40705e20-b53b-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:36:10 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NOMjw+w0X2lefXBHn54FoG+DJ22oVErXqVJmdQXPXky6HFSuYDE6KorpoUfx+WPLcLLnbm8OpA
 v9eWTb0E8U7ikjexwxpMJ0a1C/R3BI2yVYHrYNr+TWZPswpbXUQ8KZ83T3TDadCbZF9Sih+uvQ
 PJxXV42gKjypLjSVE42VW2mqIE5XLqIAtT1AcPgZY99371HIzcxW0SNDtGWWVzcFIwAsezMnp1
 mTuXoSIjOyjqwl8bX2D9UATCdVmXbNcNr9kRGMxTQKgrsxNWomBaksF+8hvyn6jFuSwYdqM2pD
 VzQ=
X-SBRS: 2.7
X-MesageID: 3950106
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3950106"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:38 +0100
Message-ID: <20190802153606.32061-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 07/35] libxl: Move "qmp_initializations" to
 libxl_dm
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

bGlieGxfX3FtcF9pbml0aWFsaXphdGlvbnMgaXMgcGFydCBvZiB0aGUgZGV2aWNlIGRvbWFpbiBz
dGFydHVwLCBpdApxdWVyaWVzIGluZm9ybWF0aW9uIGFib3V0IHRoZSBuZXdseSBzcGF3bmVkIFFF
TVUgYW5kIGRvIHNvbWUKcG9zdC1zdGFydHVwIGNvbmZpZ3VyYXRpb24uIFNvIHRoZSBmdW5jdGlv
biBjYWxsIGRvZXNuJ3QgYmVsb25nIHRvIHRoZQpnZW5lcmFsIGRvbWFpbiBjcmVhdGlvbiwgYnV0
IG9ubHkgdG8gdGhlIGRldmljZSBtb2RlbCBwYXJ0IG9mIHRoZQpwcm9jZXNzLCB0aHVzIHRoZSBj
YWxsIGJlbG9uZyB0byBsaWJ4bF9kbSBhbmQgbGlieGxfX2RtX3NwYXduX3N0YXRlJ3MKbWFjaGlu
ZXJ5LgoKV2UgbW92ZSB0aGUgY2FsbCBhaGVhZCBvZiBhIGZvbGxvdy11cCBwYXRjaCB3aGljaCBn
b2luZyB0byAiaW5saW5lIgpsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xz
L2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgMTAgLS0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxf
ZG0uYyAgICAgfCAgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
IGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggOWY1Njg1MWJlMi4uNzE0NGQ2ZmY1
MyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGli
eGwvbGlieGxfY3JlYXRlLmMKQEAgLTE1NDMsMjEgKzE1NDMsMTEgQEAgc3RhdGljIHZvaWQgZG9t
Y3JlYXRlX2Rldm1vZGVsX3N0YXJ0ZWQobGlieGxfX2VnYyAqZWdjLAogICAgIFNUQVRFX0FPX0dD
KGRtc3MtPnNwYXduLmFvKTsKICAgICBpbnQgZG9taWQgPSBkY3MtPmd1ZXN0X2RvbWlkOwogCi0g
ICAgLyogY29udmVuaWVuY2UgYWxpYXNlcyAqLwotICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmNv
bnN0IGRfY29uZmlnID0gZGNzLT5ndWVzdF9jb25maWc7Ci0KICAgICBpZiAocmV0KSB7CiAgICAg
ICAgIExPR0QoRVJST1IsIGRvbWlkLCAiZGV2aWNlIG1vZGVsIGRpZCBub3Qgc3RhcnQ6ICVkIiwg
cmV0KTsKICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAgICAgfQogCi0gICAgaWYgKGRjcy0+c2Rz
cy5kbS5ndWVzdF9kb21pZCkgewotICAgICAgICBpZiAoZF9jb25maWctPmJfaW5mby5kZXZpY2Vf
bW9kZWxfdmVyc2lvbgotICAgICAgICAgICAgPT0gTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05f
UUVNVV9YRU4pIHsKLSAgICAgICAgICAgIGxpYnhsX19xbXBfaW5pdGlhbGl6YXRpb25zKGdjLCBk
b21pZCwgZF9jb25maWcpOwotICAgICAgICB9Ci0gICAgfQotCiAgICAgZGNzLT5kZXZpY2VfdHlw
ZV9pZHggPSAtMTsKICAgICBkb21jcmVhdGVfYXR0YWNoX2RldmljZXMoZWdjLCAmZGNzLT5tdWx0
aWRldiwgMCk7CiAgICAgcmV0dXJuOwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0u
YyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggMDBkYTU5MTUzZC4uNWEyZTM0OTc3NiAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4
bF9kbS5jCkBAIC0yNzQ0LDYgKzI3NDQsOSBAQCBzdGF0aWMgdm9pZCBkZXZpY2VfbW9kZWxfc3Bh
d25fb3V0Y29tZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgU1RBVEVfQU9fR0MoZG1zcy0+c3Bhd24u
YW8pOwogICAgIGludCByZXQyOwogCisgICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLworICAg
IGxpYnhsX2RvbWFpbl9jb25maWcgKmNvbnN0IGRfY29uZmlnID0gZG1zcy0+Z3Vlc3RfY29uZmln
OworCiAgICAgaWYgKHJjKQogICAgICAgICBMT0dEKEVSUk9SLCBkbXNzLT5ndWVzdF9kb21pZCwK
ICAgICAgICAgICAgICAiJXM6IHNwYXduIGZhaWxlZCAocmM9JWQpIiwgZG1zcy0+c3Bhd24ud2hh
dCwgcmMpOwpAQCAtMjc2MCw2ICsyNzYzLDExIEBAIHN0YXRpYyB2b2lkIGRldmljZV9tb2RlbF9z
cGF3bl9vdXRjb21lKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgfQogICAgIH0KIAorICAgIGlm
IChkX2NvbmZpZy0+Yl9pbmZvLmRldmljZV9tb2RlbF92ZXJzaW9uCisgICAgICAgICAgICA9PSBM
SUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTikgeworICAgICAgICBsaWJ4bF9fcW1w
X2luaXRpYWxpemF0aW9ucyhnYywgZG1zcy0+Z3Vlc3RfZG9taWQsIGRfY29uZmlnKTsKKyAgICB9
CisKICBvdXQ6CiAgICAgZG1zc19kaXNwb3NlKGdjLCBkbXNzKTsKICAgICBkbXNzLT5jYWxsYmFj
ayhlZ2MsIGRtc3MsIHJjKTsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
