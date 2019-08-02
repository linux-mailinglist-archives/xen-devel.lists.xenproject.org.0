Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A27E7FDEF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:00:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwg-00066e-Bq; Fri, 02 Aug 2019 15:58:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwe-00065E-FK
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:16 +0000
X-Inumbo-ID: 56240c68-b53e-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 56240c68-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:15 +0000 (UTC)
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
IronPort-SDR: FpxYhue0rTmDZ0Yc/0mvIIlQSJeM63NhVo4S7+ZLmf8MB3AkKsHqb931Qi3xncWFlHZIE0oN5/
 yhsGvCIAS8Vd50Lm461LfyVYpLdDpF0tKCuMw0WVnq6cs76Fam1eVIFGHWW8Y/joNA6iw+qOcx
 wvK81Rdk4YbiePSLAJaLerqsxg23v9LvoP79FWyqoOrxqiVIHrMnCWb31H86XzacFfF1zeORTb
 0t0cMXURFjZhN8XBCJLqTeNhF10nLJ477RVIECFTHhwWz7ZcRYWeuvjO+l8PBZD5P+xR0meKTb
 LxU=
X-SBRS: 2.7
X-MesageID: 3787824
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3787824"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:42 +0100
Message-ID: <20190802153606.32061-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 11/35] libxl_domain: Convert libxl_domain_resume
 to use libxl__domain_resume
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

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgfCAyMSArKysrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jIGIvdG9vbHMvbGlieGwvbGlieGxf
ZG9tYWluLmMKaW5kZXggODA3OTdjNWVkMi4uZDc4ZmZhNmI2MCAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfZG9tYWluLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKQEAg
LTE3NCwxNSArMTc0LDMyIEBAIGludCBsaWJ4bF9kb21haW5fcmVuYW1lKGxpYnhsX2N0eCAqY3R4
LCB1aW50MzJfdCBkb21pZCwKICAgICByZXR1cm4gcmM7CiB9CiAKK3N0YXRpYyB2b2lkIGRvbWFp
bl9yZXN1bWVfZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSAqLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGludCByYyk7CisKIGludCBsaWJ4bF9kb21haW5fcmVzdW1lKGxpYnhsX2N0eCAqY3R4
LCB1aW50MzJfdCBkb21pZCwgaW50IHN1c3BlbmRfY2FuY2VsLAogICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdykKIHsKICAgICBBT19DUkVBVEUo
Y3R4LCBkb21pZCwgYW9faG93KTsKLSAgICBpbnQgcmMgPSBsaWJ4bF9fZG9tYWluX3Jlc3VtZV9k
ZXByZWNhdGVkKGdjLCBkb21pZCwgc3VzcGVuZF9jYW5jZWwpOwotICAgIGxpYnhsX19hb19jb21w
bGV0ZShlZ2MsIGFvLCByYyk7CisgICAgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSAqZG1yczsKKwor
ICAgIEdDTkVXKGRtcnMpOworICAgIGRtcnMtPmFvID0gYW87CisgICAgZG1ycy0+ZG9taWQgPSBk
b21pZDsKKyAgICBkbXJzLT5jYWxsYmFjayA9IGRvbWFpbl9yZXN1bWVfZG9uZTsKKyAgICBsaWJ4
bF9fZG9tYWluX3Jlc3VtZShlZ2MsIGRtcnMsIHN1c3BlbmRfY2FuY2VsKTsKICAgICByZXR1cm4g
QU9fSU5QUk9HUkVTUzsKIH0KIAorc3RhdGljIHZvaWQgZG9tYWluX3Jlc3VtZV9kb25lKGxpYnhs
X19lZ2MgKmVnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZG1fcmVz
dW1lX3N0YXRlICpkbXJzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykK
K3sKKyAgICBTVEFURV9BT19HQyhkbXJzLT5hbyk7CisgICAgbGlieGxfX2FvX2NvbXBsZXRlKGVn
YywgYW8sIHJjKTsKK30KKwogLyoKICAqIFByZXNlcnZlcyBhIGRvbWFpbiBidXQgcmV3cml0ZXMg
eGVuc3RvcmUgZXRjIHRvIG1ha2UgaXQgdW5pcXVlIHNvCiAgKiB0aGF0IHRoZSBkb21haW4gY2Fu
IGJlIHJlc3RhcnRlZC4KLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
