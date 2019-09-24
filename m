Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F3BC6F0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:35:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCj2N-00074o-9M; Tue, 24 Sep 2019 11:31:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LhKX=XT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCj2L-00073x-Dz
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:31:17 +0000
X-Inumbo-ID: d21338e0-debe-11e9-8c01-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id d21338e0-debe-11e9-8c01-bc764e2007e4;
 Tue, 24 Sep 2019 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569324677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DlM4GRbNaYBiA0hfv5e/nizzIbkDO3SKOfE5q0RfJQ=;
 b=HC9HkKheUmzAStW/gFErAYnNVhsovCNTvOzvHfVKjV58bTdyDdthW3XR
 VWp8NpcdWCNS93zwru1XkZnms+O+Cen2F3AJGsIC7TozNGNDiDdTqFd4H
 Dz6NiFxHHSeswljHNQt+7b7NdV97bhg3VJfl99KK5YRjtT4G8FoOwefam E=;
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
IronPort-SDR: 1XRKyC5jpJskBf3BmVHmqckP+HFJpoLHcRBZj09B9rUkoWyO61tZYq/rjJ1wWmylTj9dpfsT+q
 1h0AslIyvDt+/Xh4TEXaZUT9WfjoiJtgZr/AxUi3RFLy/kN5hkZLz2AZZbZLWWAh4nRT5l8q7G
 p4aaCyoshFtDo6jhq0ZV8eef7SSDWQDhHIn2aVU+hCaPPtBS05J4ol7oydPZ4os4GdI88ga4wV
 McEUZh2y3mIuGmptqkkncJlMz+e5298KDkDzVsPXfo7Xg/uTm1ARMidzXAJSs13oJd4acjbRTS
 lis=
X-SBRS: 2.7
X-MesageID: 5977602
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="5977602"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 24 Sep 2019 12:30:26 +0100
Message-ID: <20190924113026.255634-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924113026.255634-1-anthony.perard@citrix.com>
References: <20190924113026.255634-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 7/7] xen-bus: only set the xen device frontend
 state if it is missing
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTWFyayBTeW1zIDxtYXJrLnN5bXNAY2l0cml4LmNvbT4KClNvbWUgdG9vbHN0YWNrIGlt
cGxlbWVudGF0aW9ucyB3aWxsIHNldCB0aGUgZnJvbnRlbmQgeGVuc3RvcmUKa2V5cyB0byBJbml0
aWFsaXNpbmcgd2hpY2ggd2lsbCB0aGVuIHRyaWdnZXIgdGhlIGluIGd1ZXN0IFBWCmRyaXZlcnMg
dG8gYmVnaW4gaW5pdGlhbGlzaW5nIGFuZCBzb21lIGltcGxlbWVudGF0aW9ucyB3aWxsCnRoZW4g
c2V0IHRoZWlyIHN0YXRlIHRvIENsb3NpbmcuIElmIHRoaXMgaGFzIG9jY3VycmVkIHRoZW4KZGV2
aWNlIHJlYWxpemUgbXVzdCBub3Qgb3ZlcndyaXRlIHRoZSBmcm9udGVuZCBrZXlzIGFzIHRoZW4K
dGhlIGhhbmRzaGFrZSB3aWxsIHN0YWxsLgoKU2lnbmVkLW9mZi1ieTogTWFyayBTeW1zIDxtYXJr
LnN5bXNAY2l0cml4LmNvbT4KCkFsc28gYXZvaWQgY3JlYXRpbmcgdGhlIGZyb250ZW5kIGFyZWEg
aWYgaXQgYWxyZWFkeSBleGlzdHMuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDE5MDkxODExNTc0NS4zOTAwNi0xLXBh
dWwuZHVycmFudEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBody94ZW4veGVuLWJ1cy5jIHwgNDcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzMSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody94ZW4v
eGVuLWJ1cy5jIGIvaHcveGVuL3hlbi1idXMuYwppbmRleCA1NWMxNTczOTNkLi5jMmFkMjJhNDJk
IDEwMDY0NAotLS0gYS9ody94ZW4veGVuLWJ1cy5jCisrKyBiL2h3L3hlbi94ZW4tYnVzLmMKQEAg
LTg1Nyw2ICs4NTcsMTMgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9mcm9udGVuZF9jaGFuZ2Vk
KHZvaWQgKm9wYXF1ZSkKICAgICB9CiB9CiAKK3N0YXRpYyBib29sIHhlbl9kZXZpY2VfZnJvbnRl
bmRfZXhpc3RzKFhlbkRldmljZSAqeGVuZGV2KQoreworICAgIGVudW0geGVuYnVzX3N0YXRlIHN0
YXRlOworCisgICAgcmV0dXJuICh4ZW5fZGV2aWNlX2Zyb250ZW5kX3NjYW5mKHhlbmRldiwgInN0
YXRlIiwgIiV1IiwgJnN0YXRlKSA9PSAxKTsKK30KKwogc3RhdGljIHZvaWQgeGVuX2RldmljZV9m
cm9udGVuZF9jcmVhdGUoWGVuRGV2aWNlICp4ZW5kZXYsIEVycm9yICoqZXJycCkKIHsKICAgICBY
ZW5CdXMgKnhlbmJ1cyA9IFhFTl9CVVMocWRldl9nZXRfcGFyZW50X2J1cyhERVZJQ0UoeGVuZGV2
KSkpOwpAQCAtODY1LDE5ICs4NzIsMjUgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9mcm9udGVu
ZF9jcmVhdGUoWGVuRGV2aWNlICp4ZW5kZXYsIEVycm9yICoqZXJycCkKIAogICAgIHhlbmRldi0+
ZnJvbnRlbmRfcGF0aCA9IHhlbl9kZXZpY2VfZ2V0X2Zyb250ZW5kX3BhdGgoeGVuZGV2KTsKIAot
ICAgIHBlcm1zWzBdLmlkID0geGVuZGV2LT5mcm9udGVuZF9pZDsKLSAgICBwZXJtc1swXS5wZXJt
cyA9IFhTX1BFUk1fTk9ORTsKLSAgICBwZXJtc1sxXS5pZCA9IHhlbmJ1cy0+YmFja2VuZF9pZDsK
LSAgICBwZXJtc1sxXS5wZXJtcyA9IFhTX1BFUk1fUkVBRCB8IFhTX1BFUk1fV1JJVEU7CisgICAg
LyoKKyAgICAgKiBUaGUgZnJvbnRlbmQgYXJlYSBtYXkgaGF2ZSBhbHJlYWR5IGJlZW4gY3JlYXRl
ZCBieSBhIGxlZ2FjeQorICAgICAqIHRvb2xzdGFjay4KKyAgICAgKi8KKyAgICBpZiAoIXhlbl9k
ZXZpY2VfZnJvbnRlbmRfZXhpc3RzKHhlbmRldikpIHsKKyAgICAgICAgcGVybXNbMF0uaWQgPSB4
ZW5kZXYtPmZyb250ZW5kX2lkOworICAgICAgICBwZXJtc1swXS5wZXJtcyA9IFhTX1BFUk1fTk9O
RTsKKyAgICAgICAgcGVybXNbMV0uaWQgPSB4ZW5idXMtPmJhY2tlbmRfaWQ7CisgICAgICAgIHBl
cm1zWzFdLnBlcm1zID0gWFNfUEVSTV9SRUFEIHwgWFNfUEVSTV9XUklURTsKIAotICAgIGdfYXNz
ZXJ0KHhlbmJ1cy0+eHNoKTsKKyAgICAgICAgZ19hc3NlcnQoeGVuYnVzLT54c2gpOwogCi0gICAg
eHNfbm9kZV9jcmVhdGUoeGVuYnVzLT54c2gsIFhCVF9OVUxMLCB4ZW5kZXYtPmZyb250ZW5kX3Bh
dGgsIHBlcm1zLAotICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUocGVybXMpLCAmbG9jYWxf
ZXJyKTsKLSAgICBpZiAobG9jYWxfZXJyKSB7Ci0gICAgICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVw
ZW5kKGVycnAsIGxvY2FsX2VyciwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZh
aWxlZCB0byBjcmVhdGUgZnJvbnRlbmQ6ICIpOwotICAgICAgICByZXR1cm47CisgICAgICAgIHhz
X25vZGVfY3JlYXRlKHhlbmJ1cy0+eHNoLCBYQlRfTlVMTCwgeGVuZGV2LT5mcm9udGVuZF9wYXRo
LCBwZXJtcywKKyAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShwZXJtcyksICZsb2Nh
bF9lcnIpOworICAgICAgICBpZiAobG9jYWxfZXJyKSB7CisgICAgICAgICAgICBlcnJvcl9wcm9w
YWdhdGVfcHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiZmFpbGVkIHRvIGNyZWF0ZSBmcm9udGVuZDogIik7CisgICAgICAgICAgICBy
ZXR1cm47CisgICAgICAgIH0KICAgICB9CiAKICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlX3dh
dGNoID0KQEAgLTEyOTAsMTIgKzEzMDMsMTQgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9yZWFs
aXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkKICAgICB4ZW5fZGV2aWNlX2JhY2tl
bmRfc2V0X29ubGluZSh4ZW5kZXYsIHRydWUpOwogICAgIHhlbl9kZXZpY2VfYmFja2VuZF9zZXRf
c3RhdGUoeGVuZGV2LCBYZW5idXNTdGF0ZUluaXRXYWl0KTsKIAotICAgIHhlbl9kZXZpY2VfZnJv
bnRlbmRfcHJpbnRmKHhlbmRldiwgImJhY2tlbmQiLCAiJXMiLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHhlbmRldi0+YmFja2VuZF9wYXRoKTsKLSAgICB4ZW5fZGV2aWNlX2Zyb250
ZW5kX3ByaW50Zih4ZW5kZXYsICJiYWNrZW5kLWlkIiwgIiV1IiwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB4ZW5idXMtPmJhY2tlbmRfaWQpOworICAgIGlmICgheGVuX2RldmljZV9m
cm9udGVuZF9leGlzdHMoeGVuZGV2KSkgeworICAgICAgICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3By
aW50Zih4ZW5kZXYsICJiYWNrZW5kIiwgIiVzIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgeGVuZGV2LT5iYWNrZW5kX3BhdGgpOworICAgICAgICB4ZW5fZGV2aWNlX2Zyb250
ZW5kX3ByaW50Zih4ZW5kZXYsICJiYWNrZW5kLWlkIiwgIiV1IiwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgeGVuYnVzLT5iYWNrZW5kX2lkKTsKIAotICAgIHhlbl9kZXZpY2Vf
ZnJvbnRlbmRfc2V0X3N0YXRlKHhlbmRldiwgWGVuYnVzU3RhdGVJbml0aWFsaXNpbmcsIHRydWUp
OworICAgICAgICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3NldF9zdGF0ZSh4ZW5kZXYsIFhlbmJ1c1N0
YXRlSW5pdGlhbGlzaW5nLCB0cnVlKTsKKyAgICB9CiAKICAgICB4ZW5kZXYtPmV4aXQubm90aWZ5
ID0geGVuX2RldmljZV9leGl0OwogICAgIHFlbXVfYWRkX2V4aXRfbm90aWZpZXIoJnhlbmRldi0+
ZXhpdCk7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
