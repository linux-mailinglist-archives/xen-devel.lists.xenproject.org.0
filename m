Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5807245AA4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 12:40:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbjay-0002jJ-02; Fri, 14 Jun 2019 10:38:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbjaw-0002j5-LO
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 10:38:06 +0000
X-Inumbo-ID: 7dff395f-8e90-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7dff395f-8e90-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 10:38:05 +0000 (UTC)
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
IronPort-SDR: 5gtorxkl8LYECn1Ov2NnvxxUI8ASWkI7WAs/qOhio6tJEYHT287iy7rhRr/LWIwaUSoDZQwvg9
 Fns3B8LV8jbDApbXU8AkVaJtgLR03jS5LmfNWWUzBNDRQJxcX6fzxEetDYQFbrcH4Rso1eqwDC
 wY+HDaNXSbZF+9BI7d3rX4D3+4YuuJ0ZVt27kow9WbBK8Am/wmRDCAcwsN8Y9Lm8CcYKpbgmLx
 87axoCjgxSWc8SIY3AlIE8H+dIDOmJiNov2SPDUudckY4zLbMStFeNH4zEJ0dKbSBxfaMFCDhc
 kUQ=
X-SBRS: 2.7
X-MesageID: 1736049
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1736049"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 11:37:59 +0100
Message-ID: <20190614103801.22619-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614103801.22619-1-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 7/9] libxl_disk: Implement missing timeout
 for libxl_cdrom_insert
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

QWZ0ZXIgdGhlIHBhdGNoICJsaWJ4bF9kaXNrOiBVc2UgZXZfcW1wIGluIGxpYnhsX2Nkcm9tX2lu
c2VydCIKdGhlcmUgd2lsbCBub3QgYmUgYW55IGtpbmQgb2YgdGltZW91dCwgYWRkIG9uZSBiYWNr
LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CgpOb3RlczoKICAgIElhbiwgaW4gdGhpcyBwYXRjaCwgdGhlIHRpbWVvdXQgaXMgc2V0dXAgYWZ0
ZXIgd2UgaGF2ZSBhcXVpcmVkIHRoZSBsb2NrLgogICAgU2hvdWxkIHdlIGNoYW5nZSB0aGF0IHRv
IGFsc28gaGF2ZSBhIHRpbWVvdXQgd2FpdGluZyBmb3IgdGhlIGxvY2sgdG8gYmUKICAgIHJlbGVh
c2VkPwogICAgCiAgICB2MjoKICAgIC0gcGF0Y2ggbW92ZSBlYXJsaWVyIGluIHRoZSBzZXJpZXMg
dG8ga2VlcCBiaXNlY3RhYmlsaXR5LgoKIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyB8IDIxICsr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgYi90b29scy9saWJ4bC9saWJ4bF9k
aXNrLmMKaW5kZXggNWYxM2E2MjJmOS4uNzMyOGEwM2U4YSAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
eGwvbGlieGxfZGlzay5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYwpAQCAtNjQ5LDYg
KzY0OSw3IEBAIHR5cGVkZWYgc3RydWN0IHsKICAgICBsaWJ4bF9kZXZpY2VfZGlzayBkaXNrX3Nh
dmVkOwogICAgIGxpYnhsX19ldl9sb2NrIHFtcF9sb2NrOwogICAgIGludCBkbV92ZXI7CisgICAg
bGlieGxfX2V2X3RpbWUgdGltZTsKIH0gbGlieGxfX2Nkcm9tX2luc2VydF9zdGF0ZTsKIAogc3Rh
dGljIHZvaWQgY2Ryb21faW5zZXJ0X2xvY2tfYWNxdWlyZWQobGlieGxfX2VnYyAqLCBsaWJ4bF9f
ZXZfbG9jayAqLApAQCAtNjU3LDYgKzY1OCw5IEBAIHN0YXRpYyB2b2lkIGNkcm9tX2luc2VydF9l
amVjdGVkKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGUgKmNpcyk7CiBzdGF0aWMgdm9pZCBjZHJvbV9pbnNl
cnRfaW5zZXJ0ZWQobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGUgKmNpcyk7CitzdGF0aWMgdm9pZCBjZHJv
bV9pbnNlcnRfdGltb3V0KGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3RpbWUgKmV2LAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdGltZXZhbCAqcmVxdWVz
dGVkX2FicywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKIHN0YXRp
YyB2b2lkIGNkcm9tX2luc2VydF9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGUgKmNpcywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCByYyk7CkBAIC02NzksNiArNjgzLDcgQEAgaW50IGxp
YnhsX2Nkcm9tX2luc2VydChsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsIGxpYnhsX2Rl
dmljZV9kaXNrICpkaXNrLAogICAgIGxpYnhsX19ldl9sb2NrX2luaXQoJmNpcy0+cW1wX2xvY2sp
OwogICAgIGNpcy0+cW1wX2xvY2suYW8gPSBhbzsKICAgICBjaXMtPnFtcF9sb2NrLmRvbWlkID0g
ZG9taWQ7CisgICAgbGlieGxfX2V2X3RpbWVfaW5pdCgmY2lzLT50aW1lKTsKIAogICAgIGxpYnhs
X2RvbWFpbl90eXBlIHR5cGUgPSBsaWJ4bF9fZG9tYWluX3R5cGUoZ2MsIGRvbWlkKTsKICAgICBp
ZiAodHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9JTlZBTElEKSB7CkBAIC03NDcsNiArNzUyLDEx
IEBAIHN0YXRpYyB2b2lkIGNkcm9tX2luc2VydF9sb2NrX2FjcXVpcmVkKGxpYnhsX19lZ2MgKmVn
YywKIAogICAgIGlmIChyYykgZ290byBvdXQ7CiAKKyAgICByYyA9IGxpYnhsX19ldl90aW1lX3Jl
Z2lzdGVyX3JlbChhbywgJmNpcy0+dGltZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjZHJvbV9pbnNlcnRfdGltb3V0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIExJQlhMX0hPVFBMVUdfVElNRU9VVCAqIDEwMDApOworICAgIGlmIChyYykgZ290
byBvdXQ7CisKICAgICAvKiBXZSBuZWVkIHRvIGVqZWN0IHRoZSBvcmlnaW5hbCBpbWFnZSBmaXJz
dC4gVGhpcyBpcyBpbXBsZW1lbnRlZAogICAgICAqIGJ5IGluc2VydGluZyBlbXB0eSBtZWRpYS4g
SlNPTiBpcyBub3QgdXBkYXRlZC4KICAgICAgKi8KQEAgLTk1MCwxMiArOTYwLDIzIEBAIHN0YXRp
YyB2b2lkIGNkcm9tX2luc2VydF9pbnNlcnRlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAgY2Ryb21f
aW5zZXJ0X2RvbmUoZWdjLCBjaXMsIHJjKTsgLyogbXVzdCBiZSBsYXN0ICovCiB9CiAKK3N0YXRp
YyB2b2lkIGNkcm9tX2luc2VydF90aW1vdXQobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfdGlt
ZSAqZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB0aW1l
dmFsICpyZXF1ZXN0ZWRfYWJzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
cmMpCit7CisgICAgRUdDX0dDOworICAgIGxpYnhsX19jZHJvbV9pbnNlcnRfc3RhdGUgKmNpcyA9
IENPTlRBSU5FUl9PRihldiwgKmNpcywgdGltZSk7CisgICAgTE9HRChFUlJPUiwgY2lzLT5kb21p
ZCwgImNkcm9tIGluc2VydGlvbiB0aW1lZCBvdXQiKTsKKyAgICBjZHJvbV9pbnNlcnRfZG9uZShl
Z2MsIGNpcywgcmMpOworfQorCiBzdGF0aWMgdm9pZCBjZHJvbV9pbnNlcnRfZG9uZShsaWJ4bF9f
ZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fY2Ryb21faW5z
ZXJ0X3N0YXRlICpjaXMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCiB7
CiAgICAgRUdDX0dDOwogCisgICAgbGlieGxfX2V2X3RpbWVfZGVyZWdpc3RlcihnYywgJmNpcy0+
dGltZSk7CiAgICAgbGlieGxfX2V2X3VubG9jayhnYywgJmNpcy0+cW1wX2xvY2spOwogICAgIGxp
YnhsX2RldmljZV9kaXNrX2Rpc3Bvc2UoJmNpcy0+ZGlza19zYXZlZCk7CiAgICAgbGlieGxfX2Fv
X2NvbXBsZXRlKGVnYywgY2lzLT5hbywgcmMpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
