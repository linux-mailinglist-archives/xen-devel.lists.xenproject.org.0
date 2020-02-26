Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CEE16FE11
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v3x-0002vg-1a; Wed, 26 Feb 2020 11:41:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v3v-0002vE-Rz
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:11 +0000
X-Inumbo-ID: e0dfc5f8-588c-11ea-a490-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0dfc5f8-588c-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 11:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JXH6Cl6SSxEurf/6KHmX8r5IFZsw3kS1kkJBHspz3UY=;
 b=gdedwo2YeoKiVND+KC3CzREvCDXbhctRvOxmqMArPAsnKKTjfF97+81Q
 LGy8oNJJRxWS9yKSsT2ea/hEIeFgQq7cX/snuV3+BlBUl9klPNkq/HEWF
 qBf7t//Ir+w2S+PHiyXdM9P89kFSviZJqw5yDkGB5ua5gzYfkcYAwP65h U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: reAwUggB1XXFnLyc+HCbkRQQrxrfJgk0scWrwWrs8TIcdDK8W0t/8JbO8ayP6fiGRLdKLr7PYH
 hJHHr9Jf/hlL9EOO3K86aUMylKAWESUQozzFqGpmM5w5O28gLX0cfwjw5+uWxPKx6bWQnL1may
 xjkVEvvJFqCW9mUUrzbYCEIlQc0PeQ2Jwg5BluT4oztSrd9y6/YtOX+gmCXoevsyOh802oFMGB
 ytvj7qKh0rnr7h9V2SJPUl80DmWAds1Yl3G/6zIAuFsVcX5U4azOXVE02QeOimFNLmNjtrjuZl
 JIQ=
X-SBRS: 2.7
X-MesageID: 13658310
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13658310"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:50 +0000
Message-ID: <20200226113355.2532224-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 18/23] xen/build: use if_changed on
 built_in.o
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

SW4gdGhlIGNhc2Ugd2hlcmUgJChvYmoteSkgaXMgZW1wdHksIHdlIGFsc28gcmVwbGFjZSAkKGNf
ZmxhZ3MpIGJ5CiQoWEVOX0NGTEFHUykgdG8gYXZvaWQgZ2VuZXJhdGluZyBhbiAuJS5kIGRlcGVu
ZGVuY3kgZmlsZS4gVGhpcyBhdm9pZAptYWtlIHRyeWluZyB0byBpbmNsdWRlICUuaCBmaWxlIGlu
IHRoZSBsZCBjb21tYW5kIGlmICQob2JqLXkpIGlzbid0CmVtcHR5IGFueW1vcmUgb24gYSBzZWNv
bmQgcnVuLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQogeGVuL1J1bGVzLm1rIHwgMTMgKysrKysrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L1J1bGVzLm1rIGIveGVuL1J1bGVzLm1rCmluZGV4IGJiNGNlZDVmMGRkNC4uY2JmNGZlYmEwZTBm
IDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC0xMjYsMTQg
KzEyNiwyMSBAQCBpbmNsdWRlICQoQkFTRURJUikvYXJjaC8kKFRBUkdFVF9BUkNIKS9SdWxlcy5t
awogY19mbGFncyArPSAkKENGTEFHUy15KQogYV9mbGFncyArPSAkKENGTEFHUy15KSAkKEFGTEFH
Uy15KQogCi1idWlsdF9pbi5vOiAkKG9iai15KSAkKGV4dHJhLXkpCitxdWlldF9jbWRfbGRfYnVp
bHRpbiA9IExEICAgICAgJEAKK2NtZF9sZF9idWlsdGluID0gXAorICAgICQoTEQpICQoWEVOX0xE
RkxBR1MpIC1yIC1vICRAICQoZmlsdGVyLW91dCAkKGV4dHJhLXkpLCQocmVhbC1wcmVyZXFzKSkK
K3F1aWV0X2NtZF9jY19idWlsdGluID0gTEQgICAgICAkQAorY21kX2NjX2J1aWx0aW4gPSBcCisg
ICAgJChDQykgJChYRU5fQ0ZMQUdTKSAtYyAteCBjIC9kZXYvbnVsbCAtbyAkQAorCitidWlsdF9p
bi5vOiAkKG9iai15KSAkKGV4dHJhLXkpIEZPUkNFCiBpZmVxICgkKG9iai15KSwpCi0JJChDQykg
JChjX2ZsYWdzKSAtYyAteCBjIC9kZXYvbnVsbCAtbyAkQAorCSQoY2FsbCBpZl9jaGFuZ2VkLGNj
X2J1aWx0aW4pCiBlbHNlCiBpZmVxICgkKENPTkZJR19MVE8pLHkpCiAJJChMRF9MVE8pIC1yIC1v
ICRAICQoZmlsdGVyLW91dCAkKGV4dHJhLXkpLCReKQogZWxzZQotCSQoTEQpICQoWEVOX0xERkxB
R1MpIC1yIC1vICRAICQoZmlsdGVyLW91dCAkKGV4dHJhLXkpLCReKQorCSQoY2FsbCBpZl9jaGFu
Z2VkLGxkX2J1aWx0aW4pCiBlbmRpZgogZW5kaWYKIAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
