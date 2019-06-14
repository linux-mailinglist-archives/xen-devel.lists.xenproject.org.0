Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BB645B66
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:28:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKH-0007RN-5s; Fri, 14 Jun 2019 11:24:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKE-0007R4-P0
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:24:54 +0000
X-Inumbo-ID: 06efa044-8e97-11e9-bf5f-0f5740848fb4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06efa044-8e97-11e9-bf5f-0f5740848fb4;
 Fri, 14 Jun 2019 11:24:52 +0000 (UTC)
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
IronPort-SDR: poLzMvH6Fod03BxScQ2jqc6QRto9O/UkuNyeY3nSy9U20CdFHW22Q6WNxhnMIlyoo3jy5GQlMO
 GOuFDN+TUQZ4enZHSt2UUC97zKTbVdyGi+MDz+3GOdnnaEsn6Ndd+6XBZ50RYTVTqKB85vCZ9W
 hRqIBAVAmaciBRiqD8TRrocgrJA+ZcJuf21MbYKDwKCckIj7pZzpk6BiBYfqmMSrtns+/KhrgT
 aFIzejhcUSfFAjUXXt1yQdSarwHoO+orB6CuoLWw8BA6BWUOVNo7lTSKu3DDf6tFeO8akRqBqF
 TCU=
X-SBRS: 2.7
X-MesageID: 1737464
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737464"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:33 +0100
Message-ID: <20190614112444.29980-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 04/15] libxl_pci: Constify arg `pcidev' of
 libxl__device_pci_add_xenstore
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGxfX2RldmljZV9wY2lfYWRkX3hlbnN0b3JlIGRvZXNuJ3QgbW9kaWZ5IGBwY2lkZXYnLCBz
byBpdCBjYW4gYmUKY29uc3RpZmllZC4gQWxzbywgd2UgZG9uJ3QgbmVlZCBwY2lkZXZfc2F2ZWQg
YW55bW9yZSwgc28gcmVtb3ZlIHRoZQpzYXZlZCBjb3B5LiAoZGV2aWNlX2FkZF9kb21haW5fY29u
ZmlnIGlzIGdvaW5nIHRvIG1ha2UgaXQncyBvd24gY29weQphbnl3YXkuKQoKVG8gYWNoaWV2ZSB0
aGlzLCBjb25zdGlmeSBwY2lkZXYgaW4gYWxsIGZ1bmN0aW9ucyB0aGF0CmxpYnhsX19kZXZpY2Vf
cGNpX2FkZF94ZW5zdG9yZSBjYWxscy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX3BjaS5jIHwgMjEgKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCmluZGV4IDBl
MDdmNzBmMjkuLmQyZDM3YmU3NWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCkBAIC00Nyw3ICs0NywxMCBAQCBzdGF0aWMg
dm9pZCBwY2lkZXZfc3RydWN0X2ZpbGwobGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2LCB1bnNpZ25l
ZCBpbnQgZG9tYWluLAogICAgIHBjaWRldi0+dmRldmZuID0gdmRldmZuOwogfQogCi1zdGF0aWMg
dm9pZCBsaWJ4bF9jcmVhdGVfcGNpX2JhY2tlbmRfZGV2aWNlKGxpYnhsX19nYyAqZ2MsIGZsZXhh
cnJheV90ICpiYWNrLCBpbnQgbnVtLCBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYpCitzdGF0aWMg
dm9pZCBsaWJ4bF9jcmVhdGVfcGNpX2JhY2tlbmRfZGV2aWNlKGxpYnhsX19nYyAqZ2MsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsZXhhcnJheV90ICpiYWNr
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbnVtLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9k
ZXZpY2VfcGNpICpwY2lkZXYpCiB7CiAgICAgZmxleGFycmF5X2FwcGVuZChiYWNrLCBHQ1NQUklO
VEYoImtleS0lZCIsIG51bSkpOwogICAgIGZsZXhhcnJheV9hcHBlbmQoYmFjaywgR0NTUFJJTlRG
KFBDSV9CREYsIHBjaWRldi0+ZG9tYWluLCBwY2lkZXYtPmJ1cywgcGNpZGV2LT5kZXYsIHBjaWRl
di0+ZnVuYykpOwpAQCAtNjQsNyArNjcsNyBAQCBzdGF0aWMgdm9pZCBsaWJ4bF9jcmVhdGVfcGNp
X2JhY2tlbmRfZGV2aWNlKGxpYnhsX19nYyAqZ2MsIGZsZXhhcnJheV90ICpiYWNrLCBpbgogfQog
CiBzdGF0aWMgdm9pZCBsaWJ4bF9fZGV2aWNlX2Zyb21fcGNpZGV2KGxpYnhsX19nYyAqZ2MsIHVp
bnQzMl90IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4
bF9kZXZpY2VfcGNpICpwY2lkZXYsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGxpYnhsX2RldmljZV9wY2kgKnBjaWRldiwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGlieGxfX2RldmljZSAqZGV2aWNlKQogewogICAgIGRldmljZS0+
YmFja2VuZF9kZXZpZCA9IDA7CkBAIC03Niw3ICs3OSw4IEBAIHN0YXRpYyB2b2lkIGxpYnhsX19k
ZXZpY2VfZnJvbV9wY2lkZXYobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCiB9CiAKIHN0
YXRpYyBpbnQgbGlieGxfX2NyZWF0ZV9wY2lfYmFja2VuZChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJf
dCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZp
Y2VfcGNpICpwY2lkZXYsIGludCBudW0pCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2LAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGludCBudW0pCiB7CiAgICAgZmxleGFycmF5X3QgKmZyb250ID0g
TlVMTDsKICAgICBmbGV4YXJyYXlfdCAqYmFjayA9IE5VTEw7CkBAIC0xMDksNyArMTEzLDEwIEBA
IHN0YXRpYyBpbnQgbGlieGxfX2NyZWF0ZV9wY2lfYmFja2VuZChsaWJ4bF9fZ2MgKmdjLCB1aW50
MzJfdCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsK
IH0KIAotc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGRfeGVuc3RvcmUobGlieGxfX2dj
ICpnYywgdWludDMyX3QgZG9taWQsIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldiwgaW50IHN0YXJ0
aW5nKQorc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGRfeGVuc3RvcmUobGlieGxfX2dj
ICpnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IGRvbWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
bGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50IHN0YXJ0aW5nKQogewogICAgIGZsZXhhcnJheV90ICpiYWNrOwogICAg
IGNoYXIgKm51bV9kZXZzLCAqYmVfcGF0aDsKQEAgLTExNywxMiArMTI0LDkgQEAgc3RhdGljIGlu
dCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGRfeGVuc3RvcmUobGlieGxfX2djICpnYywgdWludDMyX3Qg
ZG9taWQsIGxpYnhsX2QKICAgICB4c190cmFuc2FjdGlvbl90IHQgPSBYQlRfTlVMTDsKICAgICBp
bnQgcmM7CiAgICAgbGlieGxfZG9tYWluX2NvbmZpZyBkX2NvbmZpZzsKLSAgICBsaWJ4bF9kZXZp
Y2VfcGNpIHBjaWRldl9zYXZlZDsKICAgICBsaWJ4bF9fZG9tYWluX3VzZXJkYXRhX2xvY2sgKmxv
Y2sgPSBOVUxMOwogCiAgICAgbGlieGxfZG9tYWluX2NvbmZpZ19pbml0KCZkX2NvbmZpZyk7Ci0g
ICAgbGlieGxfZGV2aWNlX3BjaV9pbml0KCZwY2lkZXZfc2F2ZWQpOwotICAgIGxpYnhsX2Rldmlj
ZV9wY2lfY29weShDVFgsICZwY2lkZXZfc2F2ZWQsIHBjaWRldik7CiAKICAgICBiZV9wYXRoID0g
bGlieGxfX2RvbWFpbl9kZXZpY2VfYmFja2VuZF9wYXRoKGdjLCAwLCBkb21pZCwgMCwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIExJQlhMX19ERVZJQ0Vf
S0lORF9QQ0kpOwpAQCAtMTU4LDcgKzE2Miw3IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RldmljZV9w
Y2lfYWRkX3hlbnN0b3JlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kCiAg
ICAgaWYgKHJjKSBnb3RvIG91dDsKIAogICAgIGRldmljZV9hZGRfZG9tYWluX2NvbmZpZyhnYywg
JmRfY29uZmlnLCAmbGlieGxfX3BjaWRldl9kZXZ0eXBlLAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmcGNpZGV2X3NhdmVkKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNp
ZGV2KTsKIAogICAgIHJjID0gbGlieGxfX2RtX2NoZWNrX3N0YXJ0KGdjLCAmZF9jb25maWcsIGRv
bWlkKTsKICAgICBpZiAocmMpIGdvdG8gb3V0OwpAQCAtMTgwLDcgKzE4NCw2IEBAIHN0YXRpYyBp
bnQgbGlieGxfX2RldmljZV9wY2lfYWRkX3hlbnN0b3JlKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90
IGRvbWlkLCBsaWJ4bF9kCiBvdXQ6CiAgICAgbGlieGxfX3hzX3RyYW5zYWN0aW9uX2Fib3J0KGdj
LCAmdCk7CiAgICAgaWYgKGxvY2spIGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRhKGxvY2sp
OwotICAgIGxpYnhsX2RldmljZV9wY2lfZGlzcG9zZSgmcGNpZGV2X3NhdmVkKTsKICAgICBsaWJ4
bF9kb21haW5fY29uZmlnX2Rpc3Bvc2UoJmRfY29uZmlnKTsKICAgICByZXR1cm4gcmM7CiB9Ci0t
IApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
