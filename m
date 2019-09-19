Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77980B7FE4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB03f-00015z-SG; Thu, 19 Sep 2019 17:17:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB03f-00015N-1l
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:17:31 +0000
X-Inumbo-ID: 56c2f84e-db01-11e9-966e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56c2f84e-db01-11e9-966e-12813bfff9fa;
 Thu, 19 Sep 2019 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568913442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OGLtYZfyPHawWBYlYohVh3qmyAkClcP/WYK0TFX9JA=;
 b=LuR//gjMGI/21MLKgbPuPOkQJ7/ol0XzmnoGqqoBpuw7uD9lI2n+bJRz
 krwW5kOSTwPQPSjyGMP3QksWCzMvgjujgkk3o2YMV8/b91AH1AsyZMTE/
 sr2T7eRRdUbryHWqmdpnDURfoqljb2t4xnGBDQV3WjGCcc0Zkngh8LgGq 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IrjH5+7w8Q72AUdumyl7zOv0XLTP4FfkTudINQ4GjgXr6EaBdqpXksUU3p+AI0OKHENxet4O3v
 F3UfyBteWsULz233sB4h/ROVjT3AB+2QwCXM1Xto8E0cZhi6OC8RDwHUXHPyVy9K/q91zXVZna
 HdRg6sIu7FYBRZfpu1dEeTIKGspB74znXvX3SckTgqQYteQbQmwOS03TDPxKVAGFYGihEkUVpL
 Y4uEexMd7SLKeOyQLnjkSNwbgeOWGPO4IxPiLfDr0SAiLD4+3w7qFeeb4r0/BoEN+xw8fuGrsp
 whk=
X-SBRS: 2.7
X-MesageID: 5800425
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5800425"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:27 +0100
Message-ID: <20190919171656.899649-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 07/35] libxl: Move "qmp_initializations" to
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
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
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwv
bGlieGxfY3JlYXRlLmMgfCAxMCAtLS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5jICAg
ICB8ICA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29s
cy9saWJ4bC9saWJ4bF9jcmVhdGUuYwppbmRleCAzZjMxZjJlYmNkMWYuLjkzZmJlMWQ3NDA2NyAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfY3JlYXRlLmMKQEAgLTE1NTcsMjEgKzE1NTcsMTEgQEAgc3RhdGljIHZvaWQgZG9tY3Jl
YXRlX2Rldm1vZGVsX3N0YXJ0ZWQobGlieGxfX2VnYyAqZWdjLAogICAgIFNUQVRFX0FPX0dDKGRt
c3MtPnNwYXduLmFvKTsKICAgICBpbnQgZG9taWQgPSBkY3MtPmd1ZXN0X2RvbWlkOwogCi0gICAg
LyogY29udmVuaWVuY2UgYWxpYXNlcyAqLwotICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmNvbnN0
IGRfY29uZmlnID0gZGNzLT5ndWVzdF9jb25maWc7Ci0KICAgICBpZiAocmV0KSB7CiAgICAgICAg
IExPR0QoRVJST1IsIGRvbWlkLCAiZGV2aWNlIG1vZGVsIGRpZCBub3Qgc3RhcnQ6ICVkIiwgcmV0
KTsKICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAgICAgfQogCi0gICAgaWYgKGRjcy0+c2Rzcy5k
bS5ndWVzdF9kb21pZCkgewotICAgICAgICBpZiAoZF9jb25maWctPmJfaW5mby5kZXZpY2VfbW9k
ZWxfdmVyc2lvbgotICAgICAgICAgICAgPT0gTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVN
VV9YRU4pIHsKLSAgICAgICAgICAgIGxpYnhsX19xbXBfaW5pdGlhbGl6YXRpb25zKGdjLCBkb21p
ZCwgZF9jb25maWcpOwotICAgICAgICB9Ci0gICAgfQotCiAgICAgZGNzLT5kZXZpY2VfdHlwZV9p
ZHggPSAtMTsKICAgICBkb21jcmVhdGVfYXR0YWNoX2RldmljZXMoZWdjLCAmZGNzLT5tdWx0aWRl
diwgMCk7CiAgICAgcmV0dXJuOwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggMDBkYTU5MTUzZDY3Li41YTJlMzQ5Nzc2OWQg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKKysrIGIvdG9vbHMvbGlieGwvbGli
eGxfZG0uYwpAQCAtMjc0NCw2ICsyNzQ0LDkgQEAgc3RhdGljIHZvaWQgZGV2aWNlX21vZGVsX3Nw
YXduX291dGNvbWUobGlieGxfX2VnYyAqZWdjLAogICAgIFNUQVRFX0FPX0dDKGRtc3MtPnNwYXdu
LmFvKTsKICAgICBpbnQgcmV0MjsKIAorICAgIC8qIENvbnZlbmllbmNlIGFsaWFzZXMgKi8KKyAg
ICBsaWJ4bF9kb21haW5fY29uZmlnICpjb25zdCBkX2NvbmZpZyA9IGRtc3MtPmd1ZXN0X2NvbmZp
ZzsKKwogICAgIGlmIChyYykKICAgICAgICAgTE9HRChFUlJPUiwgZG1zcy0+Z3Vlc3RfZG9taWQs
CiAgICAgICAgICAgICAgIiVzOiBzcGF3biBmYWlsZWQgKHJjPSVkKSIsIGRtc3MtPnNwYXduLndo
YXQsIHJjKTsKQEAgLTI3NjAsNiArMjc2MywxMSBAQCBzdGF0aWMgdm9pZCBkZXZpY2VfbW9kZWxf
c3Bhd25fb3V0Y29tZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgIH0KICAgICB9CiAKKyAgICBp
ZiAoZF9jb25maWctPmJfaW5mby5kZXZpY2VfbW9kZWxfdmVyc2lvbgorICAgICAgICAgICAgPT0g
TElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU4pIHsKKyAgICAgICAgbGlieGxfX3Ft
cF9pbml0aWFsaXphdGlvbnMoZ2MsIGRtc3MtPmd1ZXN0X2RvbWlkLCBkX2NvbmZpZyk7CisgICAg
fQorCiAgb3V0OgogICAgIGRtc3NfZGlzcG9zZShnYywgZG1zcyk7CiAgICAgZG1zcy0+Y2FsbGJh
Y2soZWdjLCBkbXNzLCByYyk7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
