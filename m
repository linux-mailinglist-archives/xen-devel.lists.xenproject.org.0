Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E96BEF36
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:05:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQcL-0005e7-PR; Thu, 26 Sep 2019 10:03:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8zHT=XV=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDQcJ-0005do-TA
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:03:20 +0000
X-Inumbo-ID: dc667050-e044-11e9-964d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id dc667050-e044-11e9-964d-12813bfff9fa;
 Thu, 26 Sep 2019 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569492199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WVMPze2Myz22GLhKiReOVR3N1VDCT6fqUUjsf9O0hJY=;
 b=LeUVMj+7Pydf9YP3QMAuErNj153nrtwwViCCtGLZlcxXrm9Z3Nf3BlHY
 UNS+yv4ww1N+KfELBoNY5jgEgkXTHtyGbZBmP8zBZ9MXn2iCxlCMsWusH
 00se57ZgNsrKqt+9jGwB8PG4FFrnQJLX+8AIP9RpL+StUs0vcFe0Ijnoz A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WEkMoh8dAka5Gb1BFYIU+6fuOyfl9tuJOPDHDGoBAxNOzACEd9QnLmmLCj2vzkB1iCGWYGs7ZD
 Nab6wlFtveYfc5+lteQyr7SD/n0j0bUKR8Ysmu1NhieufQfaliZgy6VF5Gozd6sq5G/9b9xlXZ
 umB3FoOsOhQShqZzfJJaDkxf9gq+9ZLSvBXgab0/GuVkcfCGRnimdNT+WifFq0oejbU0vc27Ld
 afUJ2qBvs/ciIpXuXmPxvu8iG84mUNZZsKxDlZNiTk+ciGiHej2JuCz45ZUVs/5ix8KEa451IQ
 8EQ=
X-SBRS: 2.7
X-MesageID: 6173953
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6173953"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 11:03:08 +0100
Message-ID: <20190926100308.33936-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] iommu: avoid triggering ASSERT_UNREACHABLE() on
 ARM...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4ud2hlbiB0aGUgSU9NTVUgaXMgbm90IGVuYWJsZWQuCgo4MGZmM2QzMzhkYzkgImlvbW11OiB0
aWR5IHVwIGlvbW11X3VzZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkKbWFjcm9z
IiBpbnRyb2R1Y2VkIENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFSRSwgd2hpY2ggY2F1c2VzIHRo
ZSBnbG9iYWwKJ2lvbW11X2hhcF9wdF9zaGFyZScgb3B0aW9uIHRvIGJlIHJlcGxhY2VkIHdpdGgg
YSAjZGVmaW5lLWQgdmFsdWUgb2YgdHJ1ZS4KSW4gdGhpcyBjb25maWd1cmF0aW9uLCBjYWxsaW5n
IGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpbGwgcmVzdWx0CnRyaWdnZXIgdGhlIGFmb3Jl
bWVudGlvbmVkIEFTU0VSVC4KCkNPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFSRSBpcyBhbHdheXMg
c2VsZWN0ZWQgZm9yIEFSTSBidWlsZHMgYW5kLApiZWNhdXNlIGNsZWFyX2lvbW11X2hhcF9wdF9z
aGFyZSgpIGlzIGNhbGxlZCBieSB0aGUgY29tbW9uIGlvbW11X3NldHVwKCkKZnVuY3Rpb24gaWYg
dGhlIElPTU1VIGlzIG5vdCBlbmFibGVkLCBpdCBpcyBubyBsb25nZXIgc2FmZSB0byBkaXNhYmxl
IHRoZQpJT01NVSBvbiBBUk0gc3lzdGVtcy4KCkhvd2V2ZXIsIHJ1bm5pbmcgd2l0aCB0aGUgSU9N
TVUgZGlzYWJsZWQgaXMgYSB2YWxpZCBjb25maWd1cmF0aW9uIGZvciBBUk0Kc3lzdGVtcywgc28g
dGhpcyBwYXRjaCByZWN0aWZpZXMgdGhlIHByb2JsZW0gYnkgcmVtb3ZpbmcgdGhlIGNhbGwgdG8K
Y2xlYXJfaW9tbXVfaGFwX3B0X3NoYXJlKCkgZnJvbSBjb21tb24gY29kZS4gQXMgYSBzaWRlIGVm
ZmVjdCBvZiB0aGlzLApob3dldmVyLCBpdCBiZWNvbWVzIHBvc3NpYmxlIG9uIHg4NiBzeXN0ZW1z
IGZvciBpb21tdV9lbmFibGVkIHRvIGJlIGZhbHNlCmJ1dCBpb21tdV9oYXBfcHRfc2hhcmUgdG8g
YmUgdHJ1ZS4gVGh1cyB0aGUgY29kZSBpbiBzeXNjdGwuYwpuZWVkcyB0byBiZSBjaGFuZ2VkIHRv
IG1ha2Ugc3VyZSB0aGF0IFhFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmUKaXMg
bm90IGVycm9uZW91c2x5IGFkdmVydGlzZWQgd2hlbiB0aGUgSU9NTVUgaGFzIGJlZW4gZGlzYWJs
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
PgpSZXBvcnRlZC1ieTogT2xla3NhbmRyIDxvbGVrc3R5c2hAZ21haWwuY29tPgotLS0KQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFw
IDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVr
IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgICAgICB8
IDYgKysrKy0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIHwgMSAtCiAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3N5c2N0bC5jIGIveGVuL2NvbW1vbi9zeXNjdGwuYwppbmRleCBlODc2M2M3ZmRm
Li5mODhhMjg1ZTdmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jCisrKyBiL3hlbi9j
b21tb24vc3lzY3RsLmMKQEAgLTI2OCw5ICsyNjgsMTEgQEAgbG9uZyBkb19zeXNjdGwoWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQogICAgICAgICBwaS0+bWF4
X21mbiA9IGdldF91cHBlcl9tZm5fYm91bmQoKTsKICAgICAgICAgYXJjaF9kb19waHlzaW5mbyhw
aSk7CiAgICAgICAgIGlmICggaW9tbXVfZW5hYmxlZCApCisgICAgICAgIHsKICAgICAgICAgICAg
IHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvOwotICAgICAg
ICBpZiAoIGlvbW11X2hhcF9wdF9zaGFyZSApCi0gICAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVz
IHw9IFhFTl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmU7CisgICAgICAgICAgICBp
ZiAoIGlvbW11X2hhcF9wdF9zaGFyZSApCisgICAgICAgICAgICAgICAgcGktPmNhcGFiaWxpdGll
cyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlOworICAgICAgICB9CiAK
ICAgICAgICAgaWYgKCBjb3B5X3RvX2d1ZXN0KHVfc3lzY3RsLCBvcCwgMSkgKQogICAgICAgICAg
ICAgcmV0ID0gLUVGQVVMVDsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lv
bW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCmluZGV4IGU4ZmRkYzJkYzcu
LmMzM2NhNzBlYzkgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMK
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpAQCAtNDU2LDcgKzQ1Niw2IEBA
IGludCBfX2luaXQgaW9tbXVfc2V0dXAodm9pZCkKICAgICBpZiAoICFpb21tdV9lbmFibGVkICkK
ICAgICB7CiAgICAgICAgIGlvbW11X2ludHJlbWFwID0gMDsKLSAgICAgICAgY2xlYXJfaW9tbXVf
aGFwX3B0X3NoYXJlKCk7CiAgICAgfQogCiAgICAgaWYgKCAoZm9yY2VfaW9tbXUgJiYgIWlvbW11
X2VuYWJsZWQpIHx8Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
