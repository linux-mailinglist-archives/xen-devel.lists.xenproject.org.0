Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F4B803A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0QI-0004DQ-Up; Thu, 19 Sep 2019 17:40:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0QH-0004CN-4e
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:40:53 +0000
X-Inumbo-ID: 99251016-db04-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99251016-db04-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P5gXE6loAUwR0Noo3tNpKxWqPNrwXEFLSMhwKLpISw4=;
 b=LwARxg7xsysCmsu9FVlo2UD+3AXf5LjmOATGqXAJwSnSB+gB6ZGTCMhl
 NNEXKvbmU6rzyShfA5/Qw5I4hxG/J3YT1hxUYDyPt/Esh5fegSCAkR37w
 naAmsqFemUjqFFKvFoh2MApbSlcqTw7O4tqTiEjtSEvIj9DuRuwtRNH8t Y=;
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
IronPort-SDR: T/4CIALplJSiaTi7Zo6kd1ZX1uvRN3k9L4KMpxVRy/wp8/PcPXPvcGgkm03pZ24AJdGQhpJBg/
 wn4dfGgbbBnVKE8FS6K+lKcfyYS02S6YScHWR2obd8md6aVsNxckuCRmqPSOUnAaINged2FVDJ
 fHTOb1AsBdHLs/NjmfQzMe6YYvM6XFThIOJG7JljNAKvrNf3DnOIgvM5Mp5oyxgiSbI5UjfjTM
 Z/5K351ta+79WiI1mJNqbewSdVWggcOMq29HEnEySL5yj3OnlzDvoCJXPxfES4wqKZZSXpR5JZ
 9/E=
X-SBRS: 2.7
X-MesageID: 5801748
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5801748"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:31 +0100
Message-ID: <20190919171656.899649-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 11/35] libxl_domain: Convert
 libxl_domain_resume to use libxl__domain_resume
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

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyB8IDIxICsrKysrKysrKysrKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4u
YwppbmRleCA4MDc5N2M1ZWQyMWMuLmQ3OGZmYTZiNjAxOSAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGwvbGlieGxfZG9tYWluLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKQEAgLTE3
NCwxNSArMTc0LDMyIEBAIGludCBsaWJ4bF9kb21haW5fcmVuYW1lKGxpYnhsX2N0eCAqY3R4LCB1
aW50MzJfdCBkb21pZCwKICAgICByZXR1cm4gcmM7CiB9CiAKK3N0YXRpYyB2b2lkIGRvbWFpbl9y
ZXN1bWVfZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSAqLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCByYyk7CisKIGludCBsaWJ4bF9kb21haW5fcmVzdW1lKGxpYnhsX2N0eCAqY3R4LCB1
aW50MzJfdCBkb21pZCwgaW50IHN1c3BlbmRfY2FuY2VsLAogICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdykKIHsKICAgICBBT19DUkVBVEUoY3R4
LCBkb21pZCwgYW9faG93KTsKLSAgICBpbnQgcmMgPSBsaWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXBy
ZWNhdGVkKGdjLCBkb21pZCwgc3VzcGVuZF9jYW5jZWwpOwotICAgIGxpYnhsX19hb19jb21wbGV0
ZShlZ2MsIGFvLCByYyk7CisgICAgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSAqZG1yczsKKworICAg
IEdDTkVXKGRtcnMpOworICAgIGRtcnMtPmFvID0gYW87CisgICAgZG1ycy0+ZG9taWQgPSBkb21p
ZDsKKyAgICBkbXJzLT5jYWxsYmFjayA9IGRvbWFpbl9yZXN1bWVfZG9uZTsKKyAgICBsaWJ4bF9f
ZG9tYWluX3Jlc3VtZShlZ2MsIGRtcnMsIHN1c3BlbmRfY2FuY2VsKTsKICAgICByZXR1cm4gQU9f
SU5QUk9HUkVTUzsKIH0KIAorc3RhdGljIHZvaWQgZG9tYWluX3Jlc3VtZV9kb25lKGxpYnhsX19l
Z2MgKmVnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZG1fcmVzdW1l
X3N0YXRlICpkbXJzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykKK3sK
KyAgICBTVEFURV9BT19HQyhkbXJzLT5hbyk7CisgICAgbGlieGxfX2FvX2NvbXBsZXRlKGVnYywg
YW8sIHJjKTsKK30KKwogLyoKICAqIFByZXNlcnZlcyBhIGRvbWFpbiBidXQgcmV3cml0ZXMgeGVu
c3RvcmUgZXRjIHRvIG1ha2UgaXQgdW5pcXVlIHNvCiAgKiB0aGF0IHRoZSBkb21haW4gY2FuIGJl
IHJlc3RhcnRlZC4KLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
