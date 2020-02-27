Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F4B1716F5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 13:19:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7I6A-00062x-Ht; Thu, 27 Feb 2020 12:17:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGbP=4P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j7I69-00062m-9j
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 12:17:01 +0000
X-Inumbo-ID: 0d69aacb-595b-11ea-9666-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d69aacb-595b-11ea-9666-12813bfff9fa;
 Thu, 27 Feb 2020 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582805820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8IRbE7fi2zeIru+YNuSvtho8VZpqQ7qeuz/NZSjvevc=;
 b=EMQzMwK74E2VrKi1emYKNl2PNM+rTlafISeHqoampcd43nely7qkqw7q
 ZuqMZeRH/90u79vpQuyVAbM+NKFa1py7TEF9mwsSHwzqQRsxDfiaQqwY6
 NiR6Orsz0Rn5Y5+dHh0gUH5eukKmSg1RYo66ydpGS892dM4VKVNziGzb4 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X6WABXO5my6vAqtmL3fiBTbQmtsXko+bec88TVAPgHel1loM5pe9b6lDJYGMLFykzkQJD3LscV
 pvpiVbdBGJSKyKaZGxq3MQJs6/Eb+AGJd4l9F5UMRiD7zaBjc3trGFsdIxOC9FvchDq004U5Sd
 qpUVchZJbN70SsEnDjFqRYRi107x+aNi6eoz4n8SOpRUc7kEMEDFe+zE0GudVz5M3wHmdyoxAI
 vvq3K+dVY6/byyAbyAPJhAfzx+5rsOR4a/rpu56dzTanZlMtYxfMj1SiAbYXCd+w5pPbfmUark
 vJ0=
X-SBRS: 2.7
X-MesageID: 13277762
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13277762"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 27 Feb 2020 12:16:43 +0000
Message-ID: <20200227121645.2601280-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227121645.2601280-1-anthony.perard@citrix.com>
References: <20200227121645.2601280-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 1/3] hw/xen/xen_pt_load_rom: Remove unused
 includes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKeGVuX3B0
X2xvYWRfcm9tLmMgZG9lcyBub3QgdXNlIGFueSBvZiB0aGVzZSBpbmNsdWRlcywgcmVtb3ZlIHRo
ZW0uCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhh
dC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KTWVzc2FnZS1J
ZDogPDIwMTkxMDE0MTQyMjQ2LjQ1MzgtOS1waGlsbWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogaHcveGVu
L3hlbl9wdF9sb2FkX3JvbS5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9ody94ZW4veGVuX3B0X2xvYWRfcm9tLmMgYi9ody94ZW4veGVuX3B0
X2xvYWRfcm9tLmMKaW5kZXggMzA3YTVjOTNlMjM1Li5hNTBhODA4MzdlYTIgMTAwNjQ0Ci0tLSBh
L2h3L3hlbi94ZW5fcHRfbG9hZF9yb20uYworKysgYi9ody94ZW4veGVuX3B0X2xvYWRfcm9tLmMK
QEAgLTMsMTIgKzMsOCBAQAogICovCiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUg
InFhcGkvZXJyb3IuaCIKLSNpbmNsdWRlICJody9pMzg2L3BjLmgiCiAjaW5jbHVkZSAicWVtdS9l
cnJvci1yZXBvcnQuaCIKLSNpbmNsdWRlICJ1aS9jb25zb2xlLmgiCiAjaW5jbHVkZSAiaHcvbG9h
ZGVyLmgiCi0jaW5jbHVkZSAibW9uaXRvci9tb25pdG9yLmgiCi0jaW5jbHVkZSAicWVtdS9yYW5n
ZS5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKICNpbmNsdWRlICJ4ZW5fcHQuaCIKIAotLSAK
QW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
