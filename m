Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BAB802D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0QU-0004Mt-Th; Thu, 19 Sep 2019 17:41:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0QT-0004Li-8M
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:05 +0000
X-Inumbo-ID: a34a8ee0-db04-11e9-966e-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a34a8ee0-db04-11e9-966e-12813bfff9fa;
 Thu, 19 Sep 2019 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bhstzX2mGHbhKF9lCVRjufmTTbBG4VgbHRlhgrTDgu4=;
 b=G6K9m0RXlLLdzgNENmBDE7staeo7OqMAyESsvd49lEXNfo5lP0WjLW22
 EVZPzkeskbzbE6gAnuEOJPLp4ci5QYUFfA+8luWlrSFqiSM2wHRRVGFGY
 n7SWtvUbzL3e6utFEo7uv985d9ABDjUQliKRfHes+E2ksZwJRdTqwQOmG A=;
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
IronPort-SDR: OxqnILM6xHPZunjTQl8vEjlVqkyHoaR+FVqYgeGd4GVaKygtzWDeTRF7WD0XZX6COhrYMdXYeg
 7MkzB6UYvbIbK1Y0CQls1QWdJKUlvtOyo6p41axMjNXKahSpoVkzttuErB/B50eFjL8pBxglXo
 UG7kTn4VvvrnscsBBJhLXNmoAkT7Tt30Ea6N+rqipiFHZ5VGhpxqj2UcTYjEUBijDfTh9hjV5F
 oGvH9+WEKVvy0HkxxBM4AvpTpyhmpgqnCXQlWVbHdkGMPV1Tcs//xLF4f2NCbK7AEIETAv2Uzf
 0IE=
X-SBRS: 2.7
X-MesageID: 6125259
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6125259"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:38 +0100
Message-ID: <20190919171656.899649-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 18/35] libxl: Add device_{config,
 type} to libxl__ao_device
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

VGhlc2UgdHdvIGZpZWxkcyBoZWxwIHRvIGdpdmUgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
ZGV2aWNlIGJlZW4KaG90cGx1Zy9ob3R1bnBsdWcgdG8gY2FsbGJhY2tzLgoKVGhlcmUgaXMgYWxy
ZWFkeSBgZGV2JyBvZiB0eXBlIGBsaWJ4bF9fZGV2aWNlJywgYnV0IGl0IGlzIG1vc3RseQp1c2Vm
dWwgd2hlbiB0aGUgYmFja2VuZC9mcm9udGVuZCBpcyB4ZW5zdG9yZS4gU29tZSBkZXZpY2UgKGxp
a2UKYHVzYmRldicpIGRvbid0IGhhdmUgZGV2aWQsIHNvIGBkZXYnIGNhbid0IGJlIHVzZWQuCgpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgg
Yi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IDQzYTQzMWY1MzU2NS4uNmMwOWI5
M2Y5MWYxIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTI2MjgsNiArMjYyOCwxMiBAQCBzdHJ1Y3Qg
bGlieGxfX2FvX2RldmljZSB7CiAgICAgLyogZm9yIGFzeW5jaHJvbm91cyBleGVjdXRpb24gb2Yg
c3luY2hyb25vdXMtb25seSBzeXNjYWxscyBldGMuICovCiAgICAgbGlieGxfX2V2X2NoaWxkIGNo
aWxkOwogICAgIGxpYnhsX19ldl9xbXAgcW1wOworICAgIC8qICdkZXZpY2VfY29uZmlnJyBjYW4g
YmUgdXNlZCB0byB0byBwYXNzIHRvIGNhbGxiYWNrcyBhIHBvaW50ZXIgb2Ygb25lCisgICAgICog
b2YgdGhlIHR5cGUgJ2xpYnhsX2RldmljZV8kdHlwZScgY29ycmVzcG9uZGluZyB0byB0aGUgZGV2
aWNlIGJlZW4KKyAgICAgKiBob3RwbHVnLiAnZGV2aWNlX3R5cGUnIHNob3VsZCBoYXZlIHRoZSBj
b3JyZXNwb25kaW5nCisgICAgICogJ2xpYnhsX18kdHlwZV9kZXZ0eXBlJy4gKi8KKyAgICB2b2lk
ICpkZXZpY2VfY29uZmlnOworICAgIGNvbnN0IGxpYnhsX19kZXZpY2VfdHlwZSAqZGV2aWNlX3R5
cGU7CiB9OwogCiAvKgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
