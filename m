Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6117FE01
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwl-0006G0-9Y; Fri, 02 Aug 2019 15:58:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwi-0006AN-6m
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:20 +0000
X-Inumbo-ID: 5784d0f8-b53e-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5784d0f8-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:17 +0000 (UTC)
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
IronPort-SDR: M9oMceXj7vBExvf/ooJQ0YtkC+NKuIB339bDPGQuVersbVgQCMtzA1QTPMftsf3MpNCB9zf25v
 dom3nLaxRJNAHCL9AOJvRqmqPjAMKqf0ojox/pC4y8uDPb807toro67+0U8quIydV2QAZCd5Lx
 lLld6WsFfsxZIOtx4esqCkyiB0C8vRl6a+QFmchgcPNGP0GexwxQhJrdptH5YJ9OWgczEEbsy7
 L+w9Azm2aYeDSOxCRYkh0jVHToUnzaLaaUO/T1S6RVxboHcPwnRiWC1nMThBO57JsWCmYF3fT8
 qFg=
X-SBRS: 2.7
X-MesageID: 3787841
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3787841"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:59 +0100
Message-ID: <20190802153606.32061-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 28/35] libxl_pci: Use ev_qmp in do_pci_add
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

VGhpcyBwYXRjaCBhbHNvIHJlcGxhY2VzIHRoZSB1c2Ugb2YKbGlieGxfX3dhaXRfZm9yX2Rldmlj
ZV9tb2RlbF9kZXByZWNhdGVkKCkgYnkgaXRzIGVxdWl2YWxlbnQKd2l0aG91dCB0aGUgbmVlZCBm
b3IgYSB0aHJlYWQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgICAxIC0K
IHRvb2xzL2xpYnhsL2xpYnhsX3BjaS5jICAgICAgfCAyODggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAgfCAgOTYgLS0tLS0t
LS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDI2NSBpbnNlcnRpb25zKCspLCAxMjAgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggZGQ5OTM0MTQxZi4uMjc3ZTMyMmUwOSAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oCkBAIC0xOTgxLDcgKzE5ODEsNiBAQCB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9f
cW1wX2hhbmRsZXIgbGlieGxfX3FtcF9oYW5kbGVyOwogICovCiBfaGlkZGVuIGxpYnhsX19xbXBf
aGFuZGxlciAqbGlieGxfX3FtcF9pbml0aWFsaXplKGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkKTsK
LV9oaWRkZW4gaW50IGxpYnhsX19xbXBfcGNpX2FkZChsaWJ4bF9fZ2MgKmdjLCBpbnQgZCwgbGli
eGxfZGV2aWNlX3BjaSAqcGNpZGV2KTsKIF9oaWRkZW4gaW50IGxpYnhsX19xbXBfcGNpX2RlbChs
aWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KTsKIC8qIFJlc3VtZSBodm0gZG9tYWluICovCmRpZmYg
LS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5j
CmluZGV4IDUwM2RiNmMyNjAuLjM0NzdmM2FiYTYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3BjaS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jCkBAIC0yMyw2ICsyMyw3IEBA
CiAjZGVmaW5lIFBDSV9CREZfVkRFVkZOICAgICAgICAgIiUwNHg6JTAyeDolMDJ4LiUwMXhAJTAy
eCIKICNkZWZpbmUgUENJX09QVElPTlMgICAgICAgICAgICAibXNpdHJhbnNsYXRlPSVkLHBvd2Vy
X21nbXQ9JWQiCiAjZGVmaW5lIFBDSV9CREZfWFNQQVRIICAgICAgICAgIiUwNHgtJTAyeC0lMDJ4
LSUwMXgiCisjZGVmaW5lIFBDSV9QVF9RREVWX0lEICAgICAgICAgInBjaS1wdC0lMDJ4XyUwMngu
JTAxeCIKIAogc3RhdGljIHVuc2lnbmVkIGludCBwY2lkZXZfZW5jb2RlX2JkZihsaWJ4bF9kZXZp
Y2VfcGNpICpwY2lkZXYpCiB7CkBAIC05OTEsMzMgKzk5Miw0MCBAQCB0eXBlZGVmIHN0cnVjdCBw
Y2lfYWRkX3N0YXRlIHsKICAgICB2b2lkICgqY2FsbGJhY2spKGxpYnhsX19lZ2MgKiwgc3RydWN0
IHBjaV9hZGRfc3RhdGUgKiwgaW50IHJjKTsKIAogICAgIC8qIHByaXZhdGUgdG8gZG9fcGNpX2Fk
ZCAqLworICAgIGxpYnhsX194c3dhaXRfc3RhdGUgeHN3YWl0OworICAgIGxpYnhsX19ldl9xbXAg
cW1wOworICAgIGxpYnhsX19ldl90aW1lIHRpbWVvdXQ7CiAgICAgbGlieGxfZGV2aWNlX3BjaSAq
cGNpZGV2OwogICAgIGludCBwY2lfZG9taWQ7CiB9IHBjaV9hZGRfc3RhdGU7CiAKK3N0YXRpYyB2
b2lkIHBjaV9hZGRfcWVtdV90cmFkX3dhdGNoX3N0YXRlX2NiKGxpYnhsX19lZ2MgKmVnYywKKyAg
ICBsaWJ4bF9feHN3YWl0X3N0YXRlICp4c3dhLCBpbnQgcmMsIGNvbnN0IGNoYXIgKnN0YXRlKTsK
K3N0YXRpYyB2b2lkIHBjaV9hZGRfcW1wX2RldmljZV9hZGQobGlieGxfX2VnYyAqLCBwY2lfYWRk
X3N0YXRlICopOworc3RhdGljIHZvaWQgcGNpX2FkZF9xbXBfZGV2aWNlX2FkZF9jYihsaWJ4bF9f
ZWdjICosCisgICAgbGlieGxfX2V2X3FtcCAqLCBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKiwg
aW50IHJjKTsKK3N0YXRpYyB2b2lkIHBjaV9hZGRfcW1wX3F1ZXJ5X3BjaV9jYihsaWJ4bF9fZWdj
ICosCisgICAgbGlieGxfX2V2X3FtcCAqLCBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKiwgaW50
IHJjKTsKK3N0YXRpYyB2b2lkIHBjaV9hZGRfdGltZW91dChsaWJ4bF9fZWdjICplZ2MsIGxpYnhs
X19ldl90aW1lICpldiwKKyAgICBjb25zdCBzdHJ1Y3QgdGltZXZhbCAqcmVxdWVzdGVkX2Ficywg
aW50IHJjKTsKK3N0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICosCisgICAg
cGNpX2FkZF9zdGF0ZSAqLCBpbnQgcmMpOworCiBzdGF0aWMgdm9pZCBkb19wY2lfYWRkKGxpYnhs
X19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9taWQgZG9taWQsCiAg
ICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldiwKICAgICAgICAg
ICAgICAgICAgICAgICAgcGNpX2FkZF9zdGF0ZSAqcGFzKQogewogICAgIFNUQVRFX0FPX0dDKHBh
cy0+YW9kZXYtPmFvKTsKLSAgICBsaWJ4bF9jdHggKmN0eCA9IGxpYnhsX19nY19vd25lcihnYyk7
CiAgICAgbGlieGxfZG9tYWluX3R5cGUgdHlwZSA9IGxpYnhsX19kb21haW5fdHlwZShnYywgZG9t
aWQpOwotICAgIGNoYXIgKnN5c2ZzX3BhdGg7Ci0gICAgRklMRSAqZjsKLSAgICB1bnNpZ25lZCBs
b25nIGxvbmcgc3RhcnQsIGVuZCwgZmxhZ3MsIHNpemU7Ci0gICAgaW50IGlycSwgaSwgcmMsIGh2
bSA9IDA7Ci0gICAgdWludDMyX3QgZmxhZyA9IFhFTl9ET01DVExfREVWX1JETV9SRUxBWEVEOwot
ICAgIHVpbnQzMl90IGRvbWFpbmlkID0gZG9taWQ7Ci0gICAgYm9vbCBpc3N0dWJkb20gPSBsaWJ4
bF9pc19zdHViZG9tKGN0eCwgZG9taWQsICZkb21haW5pZCk7Ci0gICAgaW50IHI7Ci0KLSAgICAv
KiBDb252ZW5pZW5jZSBhbGlhc2VzICovCi0gICAgYm9vbCBzdGFydGluZyA9IHBhcy0+c3RhcnRp
bmc7CisgICAgaW50IHJjOwogCiAgICAgLyogaW5pdCBwY2lfYWRkX3N0YXRlICovCisgICAgbGli
eGxfX3hzd2FpdF9pbml0KCZwYXMtPnhzd2FpdCk7CisgICAgbGlieGxfX2V2X3FtcF9pbml0KCZw
YXMtPnFtcCk7CiAgICAgcGFzLT5wY2lkZXYgPSBwY2lkZXY7CiAgICAgcGFzLT5wY2lfZG9taWQg
PSBkb21pZDsKKyAgICBsaWJ4bF9fZXZfdGltZV9pbml0KCZwYXMtPnRpbWVvdXQpOwogCiAgICAg
aWYgKHR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSU5WQUxJRCkgewogICAgICAgICByYyA9IEVS
Uk9SX0ZBSUw7CkBAIC0xMDI1LDI2ICsxMDMzLDI1OSBAQCBzdGF0aWMgdm9pZCBkb19wY2lfYWRk
KGxpYnhsX19lZ2MgKmVnYywKICAgICB9CiAKICAgICBpZiAodHlwZSA9PSBMSUJYTF9ET01BSU5f
VFlQRV9IVk0pIHsKLSAgICAgICAgaHZtID0gMTsKICAgICAgICAgc3dpdGNoIChsaWJ4bF9fZGV2
aWNlX21vZGVsX3ZlcnNpb25fcnVubmluZyhnYywgZG9taWQpKSB7CiAgICAgICAgICAgICBjYXNl
IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOX1RSQURJVElPTkFMOgotICAgICAg
ICAgICAgICAgIGlmIChsaWJ4bF9fd2FpdF9mb3JfZGV2aWNlX21vZGVsX2RlcHJlY2F0ZWQoZ2Ms
IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgInJ1bm5pbmciLCBOVUxMLCBOVUxMLCBO
VUxMKSA8IDApIHsKLSAgICAgICAgICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOwotICAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKLSAgICAgICAgICAgICAgICB9Ci0gICAgICAgICAgICAg
ICAgcmMgPSBxZW11X3BjaV9hZGRfeGVuc3RvcmUoZ2MsIGRvbWlkLCBwY2lkZXYpOwotICAgICAg
ICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgICAgIHBhcy0+eHN3YWl0LmFvID0gYW87Cisg
ICAgICAgICAgICAgICAgcGFzLT54c3dhaXQud2hhdCA9ICJEZXZpY2UgTW9kZWwiOworICAgICAg
ICAgICAgICAgIHBhcy0+eHN3YWl0LnBhdGggPSBERVZJQ0VfTU9ERUxfWFNfUEFUSChnYywKKyAg
ICAgICAgICAgICAgICAgICAgbGlieGxfZ2V0X3N0dWJkb21faWQoQ1RYLCBkb21pZCksIGRvbWlk
LCAiL3N0YXRlIik7CisgICAgICAgICAgICAgICAgcGFzLT54c3dhaXQudGltZW91dF9tcyA9IExJ
QlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1FT1VUICogMTAwMDsKKyAgICAgICAgICAgICAgICBw
YXMtPnhzd2FpdC5jYWxsYmFjayA9IHBjaV9hZGRfcWVtdV90cmFkX3dhdGNoX3N0YXRlX2NiOwor
ICAgICAgICAgICAgICAgIHJjID0gbGlieGxfX3hzd2FpdF9zdGFydChnYywgJnBhcy0+eHN3YWl0
KTsKKyAgICAgICAgICAgICAgICBpZiAocmMpIGdvdG8gb3V0OworICAgICAgICAgICAgICAgIHJl
dHVybjsKICAgICAgICAgICAgIGNhc2UgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9Y
RU46Ci0gICAgICAgICAgICAgICAgcmMgPSBsaWJ4bF9fcW1wX3BjaV9hZGQoZ2MsIGRvbWlkLCBw
Y2lkZXYpOwotICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgICAgIHBjaV9hZGRf
cW1wX2RldmljZV9hZGQoZWdjLCBwYXMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KKyAgICAgICAgICAg
ICAgICByZXR1cm47CiAgICAgICAgICAgICBkZWZhdWx0OgogICAgICAgICAgICAgICAgIHJjID0g
RVJST1JfSU5WQUw7CisgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KLSAgICAgICAg
aWYgKCByYyApCisgICAgfQorCisgICAgcmMgPSAwOworCitvdXQ6CisgICAgcGNpX2FkZF9kbV9k
b25lKGVnYywgcGFzLCByYyk7IC8qIG11c3QgYmUgbGFzdCAqLworfQorCitzdGF0aWMgdm9pZCBw
Y2lfYWRkX3FlbXVfdHJhZF93YXRjaF9zdGF0ZV9jYihsaWJ4bF9fZWdjICplZ2MsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9feHN3YWl0X3N0YXRl
ICp4c3dhLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IHJjLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqc3RhdGUpCit7CisgICAgcGNpX2FkZF9zdGF0ZSAqcGFzID0gQ09OVEFJTkVSX09GKHhz
d2EsICpwYXMsIHhzd2FpdCk7CisgICAgU1RBVEVfQU9fR0MocGFzLT5hb2Rldi0+YW8pOworCisg
ICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLworICAgIGxpYnhsX2RvbWlkIGRvbWlkID0gcGFz
LT5kb21pZDsKKyAgICBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYgPSBwYXMtPnBjaWRldjsKKwor
ICAgIGlmIChyYykgeworICAgICAgICBpZiAocmMgPT0gRVJST1JfVElNRURPVVQpIHsKKyAgICAg
ICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAiJXMgbm90IHJlYWR5IiwgeHN3YS0+d2hhdCk7Cisg
ICAgICAgIH0KKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorCisgICAgaWYgKCFzdGF0ZSkKKyAg
ICAgICAgcmV0dXJuOworICAgIGlmIChzdHJjbXAoc3RhdGUsICJydW5uaW5nIikpCisgICAgICAg
IHJldHVybjsKKworICAgIHJjID0gcWVtdV9wY2lfYWRkX3hlbnN0b3JlKGdjLCBkb21pZCwgcGNp
ZGV2KTsKK291dDoKKyAgICBsaWJ4bF9feHN3YWl0X3N0b3AoZ2MsIHhzd2EpOworICAgIHBjaV9h
ZGRfZG1fZG9uZShlZ2MsIHBhcywgcmMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KK30KKworc3RhdGlj
IHZvaWQgcGNpX2FkZF9xbXBfZGV2aWNlX2FkZChsaWJ4bF9fZWdjICplZ2MsIHBjaV9hZGRfc3Rh
dGUgKnBhcykKK3sKKyAgICBTVEFURV9BT19HQyhwYXMtPmFvZGV2LT5hbyk7CisgICAgbGlieGxf
X2pzb25fb2JqZWN0ICphcmdzID0gTlVMTDsKKyAgICBpbnQgcmM7CisKKyAgICAvKiBDb252ZW5p
ZW5jZSBhbGlhc2VzICovCisgICAgbGlieGxfZG9taWQgZG9taWQgPSBwYXMtPmRvbWlkOworICAg
IGxpYnhsX2RldmljZV9wY2kgKnBjaWRldiA9IHBhcy0+cGNpZGV2OworICAgIGxpYnhsX19ldl9x
bXAgKmNvbnN0IHFtcCA9ICZwYXMtPnFtcDsKKworICAgIHJjID0gbGlieGxfX2V2X3RpbWVfcmVn
aXN0ZXJfcmVsKGFvLCAmcGFzLT50aW1lb3V0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBjaV9hZGRfdGltZW91dCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBMSUJYTF9RTVBfQ01EX1RJTUVPVVQgKiAxMDAwKTsKKyAgICBpZiAocmMpIGdvdG8g
b3V0OworCisgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgImRyaXZl
ciIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ4ZW4tcGNpLXBhc3N0aHJvdWdo
Iik7CisgICAgUU1QX1BBUkFNRVRFUlNfU1BSSU5URigmYXJncywgImlkIiwgUENJX1BUX1FERVZf
SUQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lkZXYtPmJ1cywgcGNpZGV2LT5kZXYs
IHBjaWRldi0+ZnVuYyk7CisgICAgUU1QX1BBUkFNRVRFUlNfU1BSSU5URigmYXJncywgImhvc3Rh
ZGRyIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICIlMDR4OiUwMng6JTAyeC4lMDF4Iiwg
cGNpZGV2LT5kb21haW4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lkZXYtPmJ1cywg
cGNpZGV2LT5kZXYsIHBjaWRldi0+ZnVuYyk7CisgICAgaWYgKHBjaWRldi0+dmRldmZuKSB7Cisg
ICAgICAgIFFNUF9QQVJBTUVURVJTX1NQUklOVEYoJmFyZ3MsICJhZGRyIiwgIiV4LiV4IiwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfU0xPVChwY2lkZXYtPnZkZXZmbiksCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0ZVTkMocGNpZGV2LT52ZGV2Zm4pKTsK
KyAgICB9CisgICAgLyoKKyAgICAgKiBWZXJzaW9uIG9mIFFFTVUgcHJpb3IgdG8gdGhlIFhTQS0x
MzEgZml4IGRpZCBub3Qgc3VwcG9ydAorICAgICAqIHRoaXMgcHJvcGVydHkgYW5kIHdlcmUgZWZm
ZWN0aXZlbHkgYWx3YXlzIGluIHBlcm1pc3NpdmUKKyAgICAgKiBtb2RlLiBUaGUgZml4IGZvciBY
U0EtMTMxIHN3aXRjaGVkIHRoZSBkZWZhdWx0IHRvIGJlCisgICAgICogcmVzdHJpY3RlZCBieSBk
ZWZhdWx0IGFuZCBhZGRlZCB0aGUgcGVybWlzc2l2ZSBwcm9wZXJ0eS4KKyAgICAgKgorICAgICAq
IFRoZXJlZm9yZSBpbiBvcmRlciB0byBzdXBwb3J0IGJvdGggb2xkIGFuZCBuZXcgUUVNVSB3ZSBv
bmx5CisgICAgICogc2V0IHRoZSBwZXJtaXNzaXZlIGZsYWcgaWYgaXQgaXMgdHJ1ZS4gVXNlcnMg
b2Ygb2xkZXIgUUVNVQorICAgICAqIGhhdmUgbm8gcmVhc29uIHRvIHNldCB0aGUgZmxhZyBzbyB0
aGlzIGlzIG9rLgorICAgICAqLworICAgIGlmIChwY2lkZXYtPnBlcm1pc3NpdmUpCisgICAgICAg
IGxpYnhsX19xbXBfcGFyYW1fYWRkX2Jvb2woZ2MsICZhcmdzLCAicGVybWlzc2l2ZSIsIHRydWUp
OworCisgICAgcW1wLT5hbyA9IHBhcy0+YW9kZXYtPmFvOworICAgIHFtcC0+ZG9taWQgPSBkb21p
ZDsKKyAgICBxbXAtPnBheWxvYWRfZmQgPSAtMTsKKyAgICBxbXAtPmNhbGxiYWNrID0gcGNpX2Fk
ZF9xbXBfZGV2aWNlX2FkZF9jYjsKKyAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1w
LCAiZGV2aWNlX2FkZCIsIGFyZ3MpOworICAgIGlmIChyYykgZ290byBvdXQ7CisgICAgcmV0dXJu
OworCitvdXQ6CisgICAgcGNpX2FkZF9kbV9kb25lKGVnYywgcGFzLCByYyk7IC8qIG11c3QgYmUg
bGFzdCAqLworfQorCitzdGF0aWMgdm9pZCBwY2lfYWRkX3FtcF9kZXZpY2VfYWRkX2NiKGxpYnhs
X19lZ2MgKmVnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxf
X2V2X3FtcCAqcW1wLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBsaWJ4bF9fanNvbl9vYmplY3QgKnJlc3BvbnNlLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpbnQgcmMpCit7CisgICAgRUdDX0dDOworICAgIHBjaV9hZGRfc3RhdGUg
KnBhcyA9IENPTlRBSU5FUl9PRihxbXAsICpwYXMsIHFtcCk7CisKKyAgICBpZiAocmMpIGdvdG8g
b3V0OworCisgICAgcW1wLT5jYWxsYmFjayA9IHBjaV9hZGRfcW1wX3F1ZXJ5X3BjaV9jYjsKKyAg
ICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAicXVlcnktcGNpIiwgTlVMTCk7Cisg
ICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICByZXR1cm47CisKK291dDoKKyAgICBwY2lfYWRkX2Rt
X2RvbmUoZWdjLCBwYXMsIHJjKTsgLyogbXVzdCBiZSBsYXN0ICovCit9CisKK3N0YXRpYyB2b2lk
IHBjaV9hZGRfcW1wX3F1ZXJ5X3BjaV9jYihsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2V2X3FtcCAqcW1wLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqcmVzcG9u
c2UsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKQoreworICAg
IEVHQ19HQzsKKyAgICBwY2lfYWRkX3N0YXRlICpwYXMgPSBDT05UQUlORVJfT0YocW1wLCAqcGFz
LCBxbXApOworICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqYnVzID0gTlVMTDsKKyAgICBj
aGFyICphc2tlZF9pZDsKKyAgICBpbnQgaSwgajsKKyAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmpl
Y3QgKmRldmljZXMgPSBOVUxMOworICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqZGV2aWNl
ID0gTlVMTDsKKyAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKm8gPSBOVUxMOworICAgIGNv
bnN0IGNoYXIgKmlkID0gTlVMTDsKKyAgICBpbnQgZGV2X3Nsb3QsIGRldl9mdW5jOworCisgICAg
LyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLworICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldiA9
IHBhcy0+cGNpZGV2OworCisgICAgaWYgKHJjKSBnb3RvIG91dDsKKworICAgIC8qIGBxdWVyeS1w
Y2knIHJldHVybnM6CisgICAgICogWworICAgICAqICAgeydidXMnOiAnaW50JywKKyAgICAgKiAg
ICAnZGV2aWNlcyc6IFsKKyAgICAgKiAgICAgICB7J2J1cyc6ICdpbnQnLCAnc2xvdCc6ICdpbnQn
LCAnZnVuY3Rpb24nOiAnaW50JywKKyAgICAgKiAgICAgICAgJ2NsYXNzX2luZm8nOiAnUGNpRGV2
aWNlQ2xhc3MnLCAnaWQnOiAnUGNpRGV2aWNlSWQnLAorICAgICAqICAgICAgICAnKmlycSc6ICdp
bnQnLCAncWRldl9pZCc6ICdzdHInLAorICAgICAqICAgICAgICAnKnBjaV9icmlkZ2UnOiAnUGNp
QnJpZGdlSW5mbycsCisgICAgICogICAgICAgICdyZWdpb25zJzogWydQY2lNZW1vcnlSZWdpb24n
XQorICAgICAqICAgICAgIH0KKyAgICAgKiAgICBdCisgICAgICogICB9CisgICAgICogXQorICAg
ICAqIChTZWUgcWVtdS5naXQvcWFwaS8gZm9yIHRoZSBzdHJ1Y3QgdGhhdCBhcmVuJ3QgZGV0YWls
ZWQgaGVyZSkKKyAgICAgKi8KKworICAgIGFza2VkX2lkID0gR0NTUFJJTlRGKFBDSV9QVF9RREVW
X0lELAorICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWRldi0+YnVzLCBwY2lkZXYtPmRldiwg
cGNpZGV2LT5mdW5jKTsKKworICAgIGZvciAoaSA9IDA7IChidXMgPSBsaWJ4bF9fanNvbl9hcnJh
eV9nZXQocmVzcG9uc2UsIGkpKTsgaSsrKSB7CisgICAgICAgIGRldmljZXMgPSBsaWJ4bF9fanNv
bl9tYXBfZ2V0KCJkZXZpY2VzIiwgYnVzLCBKU09OX0FSUkFZKTsKKyAgICAgICAgaWYgKCFkZXZp
Y2VzKSB7CisgICAgICAgICAgICByYyA9IEVSUk9SX1FFTVVfQVBJOwogICAgICAgICAgICAgZ290
byBvdXQ7CisgICAgICAgIH0KKworICAgICAgICBmb3IgKGogPSAwOyAoZGV2aWNlID0gbGlieGxf
X2pzb25fYXJyYXlfZ2V0KGRldmljZXMsIGopKTsgaisrKSB7CisgICAgICAgICAgICAgbyA9IGxp
YnhsX19qc29uX21hcF9nZXQoInFkZXZfaWQiLCBkZXZpY2UsIEpTT05fU1RSSU5HKTsKKyAgICAg
ICAgICAgICBpZiAoIW8pIHsKKyAgICAgICAgICAgICAgICAgcmMgPSBFUlJPUl9RRU1VX0FQSTsK
KyAgICAgICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgICAgICAgfQorICAgICAgICAgICAg
IGlkID0gbGlieGxfX2pzb25fb2JqZWN0X2dldF9zdHJpbmcobyk7CisgICAgICAgICAgICAgaWYg
KCFpZCB8fCBzdHJjbXAoYXNrZWRfaWQsIGlkKSkKKyAgICAgICAgICAgICAgICAgY29udGludWU7
CisKKyAgICAgICAgICAgICBvID0gbGlieGxfX2pzb25fbWFwX2dldCgic2xvdCIsIGRldmljZSwg
SlNPTl9JTlRFR0VSKTsKKyAgICAgICAgICAgICBpZiAoIW8pIHsKKyAgICAgICAgICAgICAgICAg
cmMgPSBFUlJPUl9RRU1VX0FQSTsKKyAgICAgICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAg
ICAgICAgfQorICAgICAgICAgICAgIGRldl9zbG90ID0gbGlieGxfX2pzb25fb2JqZWN0X2dldF9p
bnRlZ2VyKG8pOworICAgICAgICAgICAgIG8gPSBsaWJ4bF9fanNvbl9tYXBfZ2V0KCJmdW5jdGlv
biIsIGRldmljZSwgSlNPTl9JTlRFR0VSKTsKKyAgICAgICAgICAgICBpZiAoIW8pIHsKKyAgICAg
ICAgICAgICAgICAgcmMgPSBFUlJPUl9RRU1VX0FQSTsKKyAgICAgICAgICAgICAgICAgZ290byBv
dXQ7CisgICAgICAgICAgICAgfQorICAgICAgICAgICAgIGRldl9mdW5jID0gbGlieGxfX2pzb25f
b2JqZWN0X2dldF9pbnRlZ2VyKG8pOworCisgICAgICAgICAgICAgcGNpZGV2LT52ZGV2Zm4gPSBQ
Q0lfREVWRk4oZGV2X3Nsb3QsIGRldl9mdW5jKTsKKworICAgICAgICAgICAgIHJjID0gMDsKKyAg
ICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgfQogICAgIH0KIAorICAgIHJjID0gRVJST1Jf
RkFJTDsKKyAgICBMT0dEKEVSUk9SLCBxbXAtPmRvbWlkLAorICAgICAgICAgIlBDSSBkZXZpY2Ug
aWQgJyVzJyB3YXNuJ3QgZm91bmQgaW4gUUVNVSdzICdxdWVyeS1wY2knIHJlc3BvbnNlLiIsCisg
ICAgICAgICBhc2tlZF9pZCk7CisKK291dDoKKyAgICBpZiAocmMgPT0gRVJST1JfUUVNVV9BUEkp
IHsKKyAgICAgICAgTE9HRChFUlJPUiwgcW1wLT5kb21pZCwKKyAgICAgICAgICAgICAiVW5leHBl
Y3RlZCByZXNwb25zZSB0byBRTVAgY21kICdxdWVyeS1wY2knLCByZWNlaXZlZDpcbiVzIiwKKyAg
ICAgICAgICAgICBKU09OKHJlc3BvbnNlKSk7CisgICAgfQorICAgIHBjaV9hZGRfZG1fZG9uZShl
Z2MsIHBhcywgcmMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KK30KKworc3RhdGljIHZvaWQgcGNpX2Fk
ZF90aW1lb3V0KGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3RpbWUgKmV2LAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB0aW1ldmFsICpyZXF1ZXN0ZWRfYWJzLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykKK3sKKyAgICBwY2lfYWRkX3N0YXRl
ICpwYXMgPSBDT05UQUlORVJfT0YoZXYsICpwYXMsIHRpbWVvdXQpOworCisgICAgcGNpX2FkZF9k
bV9kb25lKGVnYywgcGFzLCByYyk7Cit9CisKK3N0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShs
aWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2FkZF9zdGF0
ZSAqcGFzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYykKK3sKKyAgICBTVEFU
RV9BT19HQyhwYXMtPmFvZGV2LT5hbyk7CisgICAgbGlieGxfY3R4ICpjdHggPSBsaWJ4bF9fZ2Nf
b3duZXIoZ2MpOworICAgIGxpYnhsX2RvbWlkIGRvbWlkID0gcGFzLT5wY2lfZG9taWQ7CisgICAg
Y2hhciAqc3lzZnNfcGF0aDsKKyAgICBGSUxFICpmOworICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBz
dGFydCwgZW5kLCBmbGFncywgc2l6ZTsKKyAgICBpbnQgaXJxLCBpOworICAgIGludCByOworICAg
IHVpbnQzMl90IGZsYWcgPSBYRU5fRE9NQ1RMX0RFVl9SRE1fUkVMQVhFRDsKKyAgICB1aW50MzJf
dCBkb21haW5pZCA9IGRvbWlkOworICAgIGJvb2wgaXNzdHViZG9tID0gbGlieGxfaXNfc3R1YmRv
bShjdHgsIGRvbWlkLCAmZG9tYWluaWQpOworCisgICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAq
LworICAgIGJvb2wgc3RhcnRpbmcgPSBwYXMtPnN0YXJ0aW5nOworICAgIGxpYnhsX2RldmljZV9w
Y2kgKnBjaWRldiA9IHBhcy0+cGNpZGV2OworICAgIGJvb2wgaHZtID0gbGlieGxfX2RvbWFpbl90
eXBlKGdjLCBkb21pZCkgPT0gTElCWExfRE9NQUlOX1RZUEVfSFZNOworCisgICAgbGlieGxfX2V2
X3FtcF9kaXNwb3NlKGdjLCAmcGFzLT5xbXApOworCisgICAgaWYgKHJjKSBnb3RvIG91dDsKKwog
ICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL3Jlc291
cmNlIiwgcGNpZGV2LT5kb21haW4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lkZXYt
PmJ1cywgcGNpZGV2LT5kZXYsIHBjaWRldi0+ZnVuYyk7CiAgICAgZiA9IGZvcGVuKHN5c2ZzX3Bh
dGgsICJyIik7CkBAIC0xMTQ1LDYgKzEzODYsNyBAQCBzdGF0aWMgdm9pZCBkb19wY2lfYWRkKGxp
YnhsX19lZ2MgKmVnYywKICAgICBlbHNlCiAgICAgICAgIHJjID0gMDsKIG91dDoKKyAgICBsaWJ4
bF9fZXZfdGltZV9kZXJlZ2lzdGVyKGdjLCAmcGFzLT50aW1lb3V0KTsKICAgICBwYXMtPmNhbGxi
YWNrKGVnYywgcGFzLCByYyk7CiB9CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3Ft
cC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggYzc4ZWY0NjM3ZC4uMzhiYTYzZDVi
OSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfcW1wLmMKQEAgLTczNiw1NCArNzM2LDYgQEAgdm9pZCBsaWJ4bF9fcW1wX2NsZWFudXAo
bGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQpCiAgICAgfQogfQogCi1zdGF0aWMgaW50IHBj
aV9hZGRfY2FsbGJhY2sobGlieGxfX3FtcF9oYW5kbGVyICpxbXAsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpyZXNwb25zZSwgdm9pZCAqb3Bh
cXVlKQotewotICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldiA9IG9wYXF1ZTsKLSAgICBjb25z
dCBsaWJ4bF9fanNvbl9vYmplY3QgKmJ1cyA9IE5VTEw7Ci0gICAgR0NfSU5JVChxbXAtPmN0eCk7
Ci0gICAgaW50IGksIGosIHJjID0gLTE7Ci0gICAgY2hhciAqYXNrZWRfaWQgPSBHQ1NQUklOVEYo
UENJX1BUX1FERVZfSUQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpZGV2LT5i
dXMsIHBjaWRldi0+ZGV2LCBwY2lkZXYtPmZ1bmMpOwotCi0gICAgZm9yIChpID0gMDsgKGJ1cyA9
IGxpYnhsX19qc29uX2FycmF5X2dldChyZXNwb25zZSwgaSkpOyBpKyspIHsKLSAgICAgICAgY29u
c3QgbGlieGxfX2pzb25fb2JqZWN0ICpkZXZpY2VzID0gTlVMTDsKLSAgICAgICAgY29uc3QgbGli
eGxfX2pzb25fb2JqZWN0ICpkZXZpY2UgPSBOVUxMOwotICAgICAgICBjb25zdCBsaWJ4bF9fanNv
bl9vYmplY3QgKm8gPSBOVUxMOwotICAgICAgICBjb25zdCBjaGFyICppZCA9IE5VTEw7Ci0KLSAg
ICAgICAgZGV2aWNlcyA9IGxpYnhsX19qc29uX21hcF9nZXQoImRldmljZXMiLCBidXMsIEpTT05f
QVJSQVkpOwotCi0gICAgICAgIGZvciAoaiA9IDA7IChkZXZpY2UgPSBsaWJ4bF9fanNvbl9hcnJh
eV9nZXQoZGV2aWNlcywgaikpOyBqKyspIHsKLSAgICAgICAgICAgICBvID0gbGlieGxfX2pzb25f
bWFwX2dldCgicWRldl9pZCIsIGRldmljZSwgSlNPTl9TVFJJTkcpOwotICAgICAgICAgICAgIGlk
ID0gbGlieGxfX2pzb25fb2JqZWN0X2dldF9zdHJpbmcobyk7Ci0KLSAgICAgICAgICAgICBpZiAo
aWQgJiYgc3RyY21wKGFza2VkX2lkLCBpZCkgPT0gMCkgewotICAgICAgICAgICAgICAgICBpbnQg
ZGV2X3Nsb3QsIGRldl9mdW5jOwotCi0gICAgICAgICAgICAgICAgIG8gPSBsaWJ4bF9fanNvbl9t
YXBfZ2V0KCJzbG90IiwgZGV2aWNlLCBKU09OX0lOVEVHRVIpOwotICAgICAgICAgICAgICAgICBp
ZiAoIW8pCi0gICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKLSAgICAgICAgICAgICAgICAg
ZGV2X3Nsb3QgPSBsaWJ4bF9fanNvbl9vYmplY3RfZ2V0X2ludGVnZXIobyk7Ci0gICAgICAgICAg
ICAgICAgIG8gPSBsaWJ4bF9fanNvbl9tYXBfZ2V0KCJmdW5jdGlvbiIsIGRldmljZSwgSlNPTl9J
TlRFR0VSKTsKLSAgICAgICAgICAgICAgICAgaWYgKCFvKQotICAgICAgICAgICAgICAgICAgICAg
Z290byBvdXQ7Ci0gICAgICAgICAgICAgICAgIGRldl9mdW5jID0gbGlieGxfX2pzb25fb2JqZWN0
X2dldF9pbnRlZ2VyKG8pOwotCi0gICAgICAgICAgICAgICAgIHBjaWRldi0+dmRldmZuID0gUENJ
X0RFVkZOKGRldl9zbG90LCBkZXZfZnVuYyk7Ci0KLSAgICAgICAgICAgICAgICAgcmMgPSAwOwot
ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKLSAgICAgICAgICAgICB9Ci0gICAgICAgIH0KLSAg
ICB9Ci0KLQotb3V0OgotICAgIEdDX0ZSRUU7Ci0gICAgcmV0dXJuIHJjOwotfQotCiBzdGF0aWMg
aW50IHBjaV9kZWxfY2FsbGJhY2sobGlieGxfX3FtcF9oYW5kbGVyICpxbXAsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpyZXNwb25zZSwgdm9p
ZCAqb3BhcXVlKQogewpAQCAtODMzLDU0ICs3ODUsNiBAQCBzdGF0aWMgaW50IHFtcF9ydW5fY29t
bWFuZChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsCiAgICAgcmV0dXJuIHJjOwogfQogCi1pbnQg
bGlieGxfX3FtcF9wY2lfYWRkKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwgbGlieGxfZGV2aWNl
X3BjaSAqcGNpZGV2KQotewotICAgIGxpYnhsX19xbXBfaGFuZGxlciAqcW1wID0gTlVMTDsKLSAg
ICBsaWJ4bF9fanNvbl9vYmplY3QgKmFyZ3MgPSBOVUxMOwotICAgIGNoYXIgKmhvc3RhZGRyID0g
TlVMTDsKLSAgICBpbnQgcmMgPSAwOwotCi0gICAgcW1wID0gbGlieGxfX3FtcF9pbml0aWFsaXpl
KGdjLCBkb21pZCk7Ci0gICAgaWYgKCFxbXApCi0gICAgICAgIHJldHVybiAtMTsKLQotICAgIGhv
c3RhZGRyID0gR0NTUFJJTlRGKCIlMDR4OiUwMng6JTAyeC4lMDF4IiwgcGNpZGV2LT5kb21haW4s
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgcGNpZGV2LT5idXMsIHBjaWRldi0+ZGV2LCBwY2lk
ZXYtPmZ1bmMpOwotICAgIGlmICghaG9zdGFkZHIpCi0gICAgICAgIHJldHVybiAtMTsKLQotICAg
IGxpYnhsX19xbXBfcGFyYW1fYWRkX3N0cmluZyhnYywgJmFyZ3MsICJkcml2ZXIiLCAieGVuLXBj
aS1wYXNzdGhyb3VnaCIpOwotICAgIFFNUF9QQVJBTUVURVJTX1NQUklOVEYoJmFyZ3MsICJpZCIs
IFBDSV9QVF9RREVWX0lELAotICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpZGV2LT5idXMs
IHBjaWRldi0+ZGV2LCBwY2lkZXYtPmZ1bmMpOwotICAgIGxpYnhsX19xbXBfcGFyYW1fYWRkX3N0
cmluZyhnYywgJmFyZ3MsICJob3N0YWRkciIsIGhvc3RhZGRyKTsKLSAgICBpZiAocGNpZGV2LT52
ZGV2Zm4pIHsKLSAgICAgICAgUU1QX1BBUkFNRVRFUlNfU1BSSU5URigmYXJncywgImFkZHIiLCAi
JXguJXgiLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TTE9UKHBjaWRldi0+
dmRldmZuKSwgUENJX0ZVTkMocGNpZGV2LT52ZGV2Zm4pKTsKLSAgICB9Ci0gICAgLyoKLSAgICAg
KiBWZXJzaW9uIG9mIFFFTVUgcHJpb3IgdG8gdGhlIFhTQS0xMzEgZml4IGRpZCBub3Qgc3VwcG9y
dCB0aGlzCi0gICAgICogcHJvcGVydHkgYW5kIHdlcmUgZWZmZWN0aXZlbHkgYWx3YXlzIGluIHBl
cm1pc3NpdmUgbW9kZS4gVGhlCi0gICAgICogZml4IGZvciBYU0EtMTMxIHN3aXRjaGVkIHRoZSBk
ZWZhdWx0IHRvIGJlIHJlc3RyaWN0ZWQgYnkKLSAgICAgKiBkZWZhdWx0IGFuZCBhZGRlZCB0aGUg
cGVybWlzc2l2ZSBwcm9wZXJ0eS4KLSAgICAgKgotICAgICAqIFRoZXJlZm9yZSBpbiBvcmRlciB0
byBzdXBwb3J0IGJvdGggb2xkIGFuZCBuZXcgUUVNVSB3ZSBvbmx5IHNldAotICAgICAqIHRoZSBw
ZXJtaXNzaXZlIGZsYWcgaWYgaXQgaXMgdHJ1ZS4gVXNlcnMgb2Ygb2xkZXIgUUVNVSBoYXZlIG5v
Ci0gICAgICogcmVhc29uIHRvIHNldCB0aGUgZmxhZyBzbyB0aGlzIGlzIG9rLgotICAgICAqLwot
ICAgIGlmIChwY2lkZXYtPnBlcm1pc3NpdmUpCi0gICAgICAgIGxpYnhsX19xbXBfcGFyYW1fYWRk
X2Jvb2woZ2MsICZhcmdzLCAicGVybWlzc2l2ZSIsIHRydWUpOwotCi0gICAgcmMgPSBxbXBfc3lu
Y2hyb25vdXNfc2VuZChxbXAsICJkZXZpY2VfYWRkIiwgYXJncywKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE5VTEwsIE5VTEwsIHFtcC0+dGltZW91dCk7Ci0gICAgaWYgKHJjID09IDAp
IHsKLSAgICAgICAgcmMgPSBxbXBfc3luY2hyb25vdXNfc2VuZChxbXAsICJxdWVyeS1wY2kiLCBO
VUxMLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9hZGRfY2FsbGJhY2ss
IHBjaWRldiwgcW1wLT50aW1lb3V0KTsKLSAgICB9Ci0KLSAgICBsaWJ4bF9fcW1wX2Nsb3NlKHFt
cCk7Ci0gICAgcmV0dXJuIHJjOwotfQotCiBzdGF0aWMgaW50IHFtcF9kZXZpY2VfZGVsKGxpYnhs
X19nYyAqZ2MsIGludCBkb21pZCwgY2hhciAqaWQpCiB7CiAgICAgbGlieGxfX2pzb25fb2JqZWN0
ICphcmdzID0gTlVMTDsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
