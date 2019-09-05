Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D33AA471
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 15:31:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5rnB-0005Bl-UA; Thu, 05 Sep 2019 13:27:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lv1E=XA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5rnA-0005Bg-IS
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 13:27:16 +0000
X-Inumbo-ID: e01f1cfc-cfe0-11e9-978d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e01f1cfc-cfe0-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567690035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ghzckbyBbcwqcly0CIDxbFxFK8UVz3syqzkrHF679Tc=;
 b=gSAKvdUB034CssgUmkHQ4lpIqH/yOH2UZ5wtGpeUqnMmSvt39Kzvifxz
 a9XbRNWhwouGJ+WyjzdqhbuBWd9QHVSQJ9rCzSim7mekx527miAAyEWKg
 aRh7kLd1sRMyRpuwkpdqdcgwCQtEnc0KvdKAaXHnK7MHflMIUVHMOeHEU Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BkhGeCUgk3eTdUqSm1hmzELIPKvvWl3qT6mRsjGd4ooKsHLXBagY/E1lkLODhh/X5g4yZMK41Q
 Ka2Y/xKdWzU8Ed+NDkQFNmax9KAZ4+k88yuD/YlacJYxS1L2LKKgZJ7HdsXcH3/hQymCGCgBaM
 FHK6tXRFr0pVfRfwwAn5BIeYuHxTBTQ+V4EGD0Sd+KmcHSJ10sfrfhPA8zAn13OMDVpmmghHCy
 z6PtRVLdZu+qc6Eo+lWUlHYeSEpzGwn3/34dYgJ78LioC2S3OTYyPYeCgGB8Yazd5mwAkFgDAE
 Mt4=
X-SBRS: 2.7
X-MesageID: 5408139
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5408139"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Sep 2019 15:27:02 +0200
Message-ID: <20190905132703.5554-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905132703.5554-1-roger.pau@citrix.com>
References: <20190905132703.5554-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] sysctl: report existing physcaps on ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBwaHlzY2FwcyBpbiBYRU5fU1lTQ1RMX3BoeXNpbmZvIGFyZSBvbmx5IHVzZWQgYnkg
eDg2LCBhbGJlaXQKdGhlIGNhcGFiaWxpdGllcyB0aGVtc2VsdmVzIGFyZSBub3QgeDg2IHNwZWNp
ZmljLgoKVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGFsc28gcmVwb3J0aW5nIHRoZSBjdXJy
ZW50IGNhcGFiaWxpdGllcyBvbgpBUk0gaGFyZHdhcmUuIE5vdGUgdGhhdCBvbiBBUk0gUEhZU0NB
UF9odm0gaXMgYWx3YXlzIHJlcG9ydGVkLCBhbmQKc2V0dGluZyBQSFlTQ0FQX2RpcmVjdGlvIGhh
cyBiZWVuIG1vdmVkIHRvIGNvbW1vbiBjb2RlIHNpbmNlIHRoZSBzYW1lCmxvZ2ljIHRvIHNldCBp
dCBpcyB1c2VkIGJ5IHg4NiBhbmQgQVJNLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgogLSBOZXcgaW4g
dGhpcyB2ZXJzaW9uLgotLS0KIHhlbi9hcmNoL2FybS9zeXNjdGwuYyAgICAgICB8IDUgKysrKy0K
IHhlbi9hcmNoL3g4Ni9zeXNjdGwuYyAgICAgICB8IDIgLS0KIHhlbi9jb21tb24vc3lzY3RsLmMg
ICAgICAgICB8IDIgKysKIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8IDYgKysrLS0tCiA0
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vc3lzY3RsLmMgYi94ZW4vYXJjaC9hcm0vc3lzY3RsLmMKaW5kZXgg
ZmJmZGI0NGVmZi4uOTJhYzk5YzkyOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3N5c2N0bC5j
CisrKyBiL3hlbi9hcmNoL2FybS9zeXNjdGwuYwpAQCAtMTIsNyArMTIsMTAgQEAKICNpbmNsdWRl
IDx4ZW4vaHlwZXJjYWxsLmg+CiAjaW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPgogCi12b2lkIGFy
Y2hfZG9fcGh5c2luZm8oc3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKSB7IH0KK3ZvaWQg
YXJjaF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpCit7CisgICAg
cGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaHZtOworfQogCiBsb25nIGFy
Y2hfZG9fc3lzY3RsKHN0cnVjdCB4ZW5fc3lzY3RsICpzeXNjdGwsCiAgICAgICAgICAgICAgICAg
ICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwppbmRl
eCBjNTBkOTEwYTFjLi43ZWM2MTc0ZTZiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc3lzY3Rs
LmMKKysrIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCkBAIC0xNjMsOCArMTYzLDYgQEAgdm9pZCBh
cmNoX2RvX3BoeXNpbmZvKHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvICpwaSkKICAgICAgICAg
cGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaHZtOwogICAgIGlmICggSVNf
RU5BQkxFRChDT05GSUdfUFYpICkKICAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lT
Q1RMX1BIWVNDQVBfcHY7Ci0gICAgaWYgKCBpb21tdV9lbmFibGVkICkKLSAgICAgICAgcGktPmNh
cGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW87CiB9CiAKIGxvbmcgYXJj
aF9kb19zeXNjdGwoCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3N5c2N0bC5jIGIveGVuL2NvbW1v
bi9zeXNjdGwuYwppbmRleCBmY2YyZDJmZDdjLi45MmI0ZWEwZDIxIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL3N5c2N0bC5jCisrKyBiL3hlbi9jb21tb24vc3lzY3RsLmMKQEAgLTI2Nyw2ICsyNjcs
OCBAQCBsb25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkg
dV9zeXNjdGwpCiAgICAgICAgIHBpLT5jcHVfa2h6ID0gY3B1X2toejsKICAgICAgICAgcGktPm1h
eF9tZm4gPSBnZXRfdXBwZXJfbWZuX2JvdW5kKCk7CiAgICAgICAgIGFyY2hfZG9fcGh5c2luZm8o
cGkpOworICAgICAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQorICAgICAgICAgICAgcGktPmNhcGFi
aWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW87CiAKICAgICAgICAgaWYgKCBj
b3B5X3RvX2d1ZXN0KHVfc3lzY3RsLCBvcCwgMSkgKQogICAgICAgICAgICAgcmV0ID0gLUVGQVVM
VDsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9zeXNjdGwuaAppbmRleCA5MWM0OGRjYWUwLi4zNmIzZjhjNDI5IDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5
c2N0bC5oCkBAIC04MSwxMyArODEsMTMgQEAgc3RydWN0IHhlbl9zeXNjdGxfdGJ1Zl9vcCB7CiAg
KiBHZXQgcGh5c2ljYWwgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGhvc3QgbWFjaGluZQogICovCiAv
KiBYRU5fU1lTQ1RMX3BoeXNpbmZvICovCi0gLyogKHg4NikgVGhlIHBsYXRmb3JtIHN1cHBvcnRz
IEhWTSBndWVzdHMuICovCisgLyogVGhlIHBsYXRmb3JtIHN1cHBvcnRzIEhWTSBndWVzdHMuICov
CiAjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfaHZtICAgICAgICAgIDAKICNkZWZpbmUgWEVO
X1NZU0NUTF9QSFlTQ0FQX2h2bSAgICAgICAgICAgKDF1PDxfWEVOX1NZU0NUTF9QSFlTQ0FQX2h2
bSkKLSAvKiAoeDg2KSBUaGUgcGxhdGZvcm0gc3VwcG9ydHMgUFYgZ3Vlc3RzLiAqLworIC8qIFRo
ZSBwbGF0Zm9ybSBzdXBwb3J0cyBQViBndWVzdHMuICovCiAjZGVmaW5lIF9YRU5fU1lTQ1RMX1BI
WVNDQVBfcHYgICAgICAgICAgIDEKICNkZWZpbmUgWEVOX1NZU0NUTF9QSFlTQ0FQX3B2ICAgICAg
ICAgICAgKDF1PDxfWEVOX1NZU0NUTF9QSFlTQ0FQX3B2KQotIC8qICh4ODYpIFRoZSBwbGF0Zm9y
bSBzdXBwb3J0cyBkaXJlY3QgYWNjZXNzIHRvIEkvTyBkZXZpY2VzIHdpdGggSU9NTVUuICovCisg
LyogVGhlIHBsYXRmb3JtIHN1cHBvcnRzIGRpcmVjdCBhY2Nlc3MgdG8gSS9PIGRldmljZXMgd2l0
aCBJT01NVS4gKi8KICNkZWZpbmUgX1hFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbyAgICAgMgog
I2RlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8gICgxdTw8X1hFTl9TWVNDVExfUEhZ
U0NBUF9kaXJlY3RpbykKIHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvIHsKLS0gCjIuMjIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
