Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAE7FDF4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:00:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZx0-0006hk-NC; Fri, 02 Aug 2019 15:58:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwy-0006es-MJ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:36 +0000
X-Inumbo-ID: 62692693-b53e-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 62692693-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:35 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 34CbmWvo6apQGjTt0e89UZHXb4fHJDmovNUWyVIpigV+s4NAf7W1cx50ftz35zft4yIGgH7t+f
 OEzVbP5DiQ6zsf7gD3exgARxluxb9Jsk8L2CGbRcJODqeKnW3mxWm7SshdDDfrDMCxLlerVxkp
 OhQqb2QtpcfrgHTU04gDskmkw8NCCsqQHypDOGhfMPSIqiUmnRd+I8o9FEsMp64OroHk/+FbCk
 v5AU7U1MrqcUFKqFHkDiTa0eBcpvGjKMUPHO20C0VC3YnTeTmpkuwG9nJ9YzPCvZLc9O/052q2
 AS4=
X-SBRS: 2.7
X-MesageID: 3826803
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3826803"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:53 +0100
Message-ID: <20190802153606.32061-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 22/35] libxl: Use aodev for
 libxl__device_usbdev_remove
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

VGhpcyBhbHNvIG1lYW4gbGlieGxfX2luaXRpYXRlX2RldmljZV91c2JjdHJsX3JlbW92ZSwgd2hp
Y2ggdXNlcwpsaWJ4bF9fZGV2aWNlX3VzYmRldl9yZW1vdmUgc3luY2hyb25vdXNseSwgbmVlZHMg
dG8gYmUgdXBkYXRlZCB0byB1c2UKaXQgd2l0aCBtdWx0aWRldi4KClNpZ25lZC1vZmYtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhs
L2xpYnhsX3VzYi5jIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF91c2IuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3Vz
Yi5jCmluZGV4IDZiM2UzODhhMTguLjhlM2E0MTk4MDUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX3VzYi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3VzYi5jCkBAIC01NTYsOSArNTU2
LDExIEBAIHN0YXRpYyBpbnQgbGlieGxfX2RldmljZV91c2JkZXZfbGlzdF9mb3JfdXNiY3RybChs
aWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9kZXZpY2VfdXNiZGV2ICoqdXNiZGV2cywKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKm51bSk7
CiAKLXN0YXRpYyBpbnQgbGlieGxfX2RldmljZV91c2JkZXZfcmVtb3ZlKGxpYnhsX19nYyAqZ2Ms
IHVpbnQzMl90IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGlieGxfZGV2aWNlX3VzYmRldiAqdXNiZGV2KTsKK3N0YXRpYyB2b2lkIGxpYnhsX19kZXZpY2Vf
dXNiZGV2X3JlbW92ZShsaWJ4bF9fZWdjICplZ2MsCisgICAgdWludDMyX3QgZG9taWQsIGxpYnhs
X2RldmljZV91c2JkZXYgKnVzYmRldiwgbGlieGxfX2FvX2RldmljZSAqYW9kZXYpOwogCitzdGF0
aWMgdm9pZCBkZXZpY2VfdXNiY3RybF91c2JkZXZzX3JlbW92ZWQobGlieGxfX2VnYyAqLAorICAg
IGxpYnhsX19tdWx0aWRldiAqLCBpbnQgcmMpOwogc3RhdGljIHZvaWQgZGV2aWNlX3VzYmN0cmxf
cmVtb3ZlX3RpbWVvdXQobGlieGxfX2VnYyAqZWdjLAogICAgIGxpYnhsX19ldl90aW1lICpldiwg
Y29uc3Qgc3RydWN0IHRpbWV2YWwgKnJlcXVlc3RlZF9hYnMsIGludCByYyk7CiBzdGF0aWMgdm9p
ZCBkZXZpY2VfdXNiY3RybF9yZW1vdmVfcW1wX2NiKGxpYnhsX19lZ2MgKmVnYywKQEAgLTU2Niw2
ICs1NjgsMTEgQEAgc3RhdGljIHZvaWQgZGV2aWNlX3VzYmN0cmxfcmVtb3ZlX3FtcF9jYihsaWJ4
bF9fZWdjICplZ2MsCiBzdGF0aWMgdm9pZCBkZXZpY2VfdXNiY3RybF9yZW1vdmVfZG9uZShsaWJ4
bF9fZWdjICplZ2MsCiAgICAgbGlieGxfX2FvX2RldmljZSAqLCBpbnQgcmMpOwogCit0eXBlZGVm
IHN0cnVjdCB7CisgICAgbGlieGxfX211bHRpZGV2IG11bHRpZGV2OworICAgIGxpYnhsX19hb19k
ZXZpY2UgKmFvZGV2OworfSB1c2JjdHJsX3JlbW92ZV9zdGF0ZTsKKwogLyogQU8gZnVuY3Rpb24g
dG8gcmVtb3ZlIGEgdXNiIGNvbnRyb2xsZXIuCiAgKgogICogR2VuZXJhbGx5LCBpdCBkb2VzOgpA
QCAtNTg2LDYgKzU5MywxMiBAQCB2b2lkIGxpYnhsX19pbml0aWF0ZV9kZXZpY2VfdXNiY3RybF9y
ZW1vdmUobGlieGxfX2VnYyAqZWdjLAogICAgIHVpbnQzMl90IGRvbWlkID0gYW9kZXYtPmRldi0+
ZG9taWQ7CiAgICAgaW50IHVzYmN0cmxfZGV2aWQgPSBhb2Rldi0+ZGV2LT5kZXZpZDsKICAgICBs
aWJ4bF9kZXZpY2VfdXNiY3RybCAqdXNiY3RybDsKKyAgICB1c2JjdHJsX3JlbW92ZV9zdGF0ZSAq
dWNyczsKKworICAgIEdDTkVXKHVjcnMpOworICAgIHVjcnMtPmFvZGV2ID0gYW9kZXY7CisgICAg
dWNycy0+bXVsdGlkZXYuY2FsbGJhY2sgPSBkZXZpY2VfdXNiY3RybF91c2JkZXZzX3JlbW92ZWQ7
CisgICAgbGlieGxfX211bHRpZGV2X2JlZ2luKGFvLCAmdWNycy0+bXVsdGlkZXYpOwogCiAgICAg
R0NORVcodXNiY3RybCk7CiAgICAgbGlieGxfZGV2aWNlX3VzYmN0cmxfaW5pdCh1c2JjdHJsKTsK
QEAgLTYwMywxNCArNjE2LDI5IEBAIHZvaWQgbGlieGxfX2luaXRpYXRlX2RldmljZV91c2JjdHJs
X3JlbW92ZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgaWYgKHJjKSBnb3RvIG91dDsKIAogICAgIGZv
ciAoaSA9IDA7IGkgPCBudW1fdXNiZGV2OyBpKyspIHsKLSAgICAgICAgcmMgPSBsaWJ4bF9fZGV2
aWNlX3VzYmRldl9yZW1vdmUoZ2MsIGRvbWlkLCAmdXNiZGV2c1tpXSk7Ci0gICAgICAgIGlmIChy
YykgewotICAgICAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJsaWJ4bF9fZGV2aWNlX3VzYmRl
dl9yZW1vdmUgZmFpbGVkOiBjb250cm9sbGVyICVkLCAiCi0gICAgICAgICAgICAgICAgInBvcnQg
JWQiLCB1c2JkZXZzW2ldLmN0cmwsIHVzYmRldnNbaV0ucG9ydCk7Ci0gICAgICAgICAgICBnb3Rv
IG91dDsKLSAgICAgICAgfQorICAgICAgICBsaWJ4bF9fYW9fZGV2aWNlICp1c2JkZXZfYW9kZXYg
PQorICAgICAgICAgICAgbGlieGxfX211bHRpZGV2X3ByZXBhcmUoJnVjcnMtPm11bHRpZGV2KTsK
KyAgICAgICAgdXNiZGV2X2FvZGV2LT5hY3Rpb24gPSBMSUJYTF9fREVWSUNFX0FDVElPTl9SRU1P
VkU7CisgICAgICAgIGxpYnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZShlZ2MsIGRvbWlkLCAmdXNi
ZGV2c1tpXSwgdXNiZGV2X2FvZGV2KTsKICAgICB9CiAKK291dDoKKyAgICBsaWJ4bF9fbXVsdGlk
ZXZfcHJlcGFyZWQoZWdjLCAmdWNycy0+bXVsdGlkZXYsIHJjKTsgLyogbXVzdCBiZSBsYXN0ICov
Cit9CisKK3N0YXRpYyB2b2lkIGRldmljZV91c2JjdHJsX3VzYmRldnNfcmVtb3ZlZChsaWJ4bF9f
ZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGli
eGxfX211bHRpZGV2ICptdWx0aWRldiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgcmMpCit7CisgICAgdXNiY3RybF9yZW1vdmVfc3RhdGUgKnVjcnMgPQor
ICAgICAgICBDT05UQUlORVJfT0YobXVsdGlkZXYsICp1Y3JzLCBtdWx0aWRldik7CisgICAgbGli
eGxfX2FvX2RldmljZSAqYW9kZXYgPSB1Y3JzLT5hb2RldjsKKyAgICBTVEFURV9BT19HQyhhb2Rl
di0+YW8pOworICAgIGxpYnhsX2RldmljZV91c2JjdHJsICpjb25zdCB1c2JjdHJsID0gYW9kZXYt
PmRldmljZV9jb25maWc7CisKKyAgICBpZiAocmMpIGdvdG8gb3V0OworCisgICAgLyogUmVtb3Zl
IHVzYmN0cmwgKi8KICAgICBpZiAodXNiY3RybC0+dHlwZSA9PSBMSUJYTF9VU0JDVFJMX1RZUEVf
REVWSUNFTU9ERUwpIHsKICAgICAgICAgbGlieGxfX2V2X3FtcCAqY29uc3QgcW1wID0gJmFvZGV2
LT5xbXA7CiAKQEAgLTYyMCwxMCArNjQ4LDEwIEBAIHZvaWQgbGlieGxfX2luaXRpYXRlX2Rldmlj
ZV91c2JjdHJsX3JlbW92ZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgIGlmIChyYykgZ290byBv
dXQ7CiAKICAgICAgICAgcW1wLT5hbyA9IGFvOwotICAgICAgICBxbXAtPmRvbWlkID0gZG9taWQ7
CisgICAgICAgIHFtcC0+ZG9taWQgPSBhb2Rldi0+ZGV2LT5kb21pZDsKICAgICAgICAgcW1wLT5j
YWxsYmFjayA9IGRldmljZV91c2JjdHJsX3JlbW92ZV9xbXBfY2I7CiAgICAgICAgIHFtcC0+cGF5
bG9hZF9mZCA9IC0xOwotICAgICAgICByYyA9IGxpYnhsX19kZXZpY2VfdXNiY3RybF9kZWxfaHZt
KGdjLCBxbXAsIHVzYmN0cmxfZGV2aWQpOworICAgICAgICByYyA9IGxpYnhsX19kZXZpY2VfdXNi
Y3RybF9kZWxfaHZtKGdjLCBxbXAsIGFvZGV2LT5kZXYtPmRldmlkKTsKICAgICAgICAgaWYgKHJj
KSBnb3RvIG91dDsKICAgICAgICAgcmV0dXJuOwogICAgIH0KQEAgLTE4NDcsMjAgKzE4NzUsMzEg
QEAgc3RhdGljIExJQlhMX0RFRklORV9ERVZJQ0VTX0FERCh1c2JkZXYpCiAgKiAyKSByZW1vdmUg
dGhlIHVzYiBkZXZpY2UgZnJvbSB4ZW5zdG9yZSBjb250cm9sbGVyL3BvcnQuCiAgKiAzKSB1bmJp
bmQgdXNiIGRldmljZSBmcm9tIHVzYmJhY2sgYW5kIHJlYmluZCB0byBpdHMgb3JpZ2luYWwgZHJp
dmVyLgogICogICAgSWYgdXNiIGRldmljZSBoYXMgbWFueSBpbnRlcmZhY2VzLCBkbyBpdCB0byBl
YWNoIGludGVyZmFjZS4KKyAqCisgKiBCZWZvcmUgY2FsbGluZyB0aGlzIGZ1bmN0aW9uLCBhb2Rl
diBzaG91bGQgYmUgcHJvcGVybHkgZmlsbGVkOgorICogYW9kZXYtPmFvLCBhb2Rldi0+Y2FsbGJh
Y2ssIC4uLgogICovCi1zdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZShsaWJ4
bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpYnhsX2RldmljZV91c2JkZXYgKnVzYmRldikKK3N0YXRpYyB2b2lkIGxpYnhs
X19kZXZpY2VfdXNiZGV2X3JlbW92ZShsaWJ4bF9fZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RldmljZV91c2Jk
ZXYgKnVzYmRldiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4
bF9fYW9fZGV2aWNlICphb2RldikKIHsKKyAgICBTVEFURV9BT19HQyhhb2Rldi0+YW8pOwogICAg
IGludCByYzsKICAgICBjaGFyICpidXNpZDsKICAgICBsaWJ4bF9kZXZpY2VfdXNiY3RybCB1c2Jj
dHJsOwogCisgICAgLyogU3RvcmUgKnVzYmRldiB0byBiZSB1c2VkIGJ5IGNhbGxiYWNrcyAqLwor
ICAgIGFvZGV2LT5kZXZpY2VfY29uZmlnID0gdXNiZGV2OworICAgIGFvZGV2LT5kZXZpY2VfdHlw
ZSA9ICZsaWJ4bF9fdXNiZGV2X2RldnR5cGU7CisKKyAgICBsaWJ4bF9kZXZpY2VfdXNiY3RybF9p
bml0KCZ1c2JjdHJsKTsKKwogICAgIGlmICh1c2JkZXYtPmN0cmwgPCAwIHx8IHVzYmRldi0+cG9y
dCA8IDEpIHsKICAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICJJbnZhbGlkIFVTQiBkZXZpY2Ui
KTsKLSAgICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7CisgICAgICAgIHJjID0gRVJST1JfRkFJTDsK
KyAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCi0gICAgbGlieGxfZGV2aWNlX3VzYmN0cmxfaW5p
dCgmdXNiY3RybCk7CiAgICAgcmMgPSBsaWJ4bF9kZXZpZF90b19kZXZpY2VfdXNiY3RybChDVFgs
IGRvbWlkLCB1c2JkZXYtPmN0cmwsICZ1c2JjdHJsKTsKICAgICBpZiAocmMpIGdvdG8gb3V0Owog
CkBAIC0xOTQ2LDcgKzE5ODUsOCBAQCBzdGF0aWMgaW50IGxpYnhsX19kZXZpY2VfdXNiZGV2X3Jl
bW92ZShsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwKIAogb3V0OgogICAgIGxpYnhsX2Rl
dmljZV91c2JjdHJsX2Rpc3Bvc2UoJnVzYmN0cmwpOwotICAgIHJldHVybiByYzsKKyAgICBhb2Rl
di0+cmMgPSByYzsKKyAgICBhb2Rldi0+Y2FsbGJhY2soZWdjLCBhb2Rldik7CiB9CiAKIGludCBs
aWJ4bF9kZXZpY2VfdXNiZGV2X3JlbW92ZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQs
CkBAIC0xOTU1LDExICsxOTk1LDE0IEBAIGludCBsaWJ4bF9kZXZpY2VfdXNiZGV2X3JlbW92ZShs
aWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsCiAKIHsKICAgICBBT19DUkVBVEUoY3R4LCBk
b21pZCwgYW9faG93KTsKLSAgICBpbnQgcmM7CisgICAgbGlieGxfX2FvX2RldmljZSAqYW9kZXY7
CiAKLSAgICByYyA9IGxpYnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZShnYywgZG9taWQsIHVzYmRl
dik7CisgICAgR0NORVcoYW9kZXYpOworICAgIGxpYnhsX19wcmVwYXJlX2FvX2RldmljZShhbywg
YW9kZXYpOworICAgIGFvZGV2LT5hY3Rpb24gPSBMSUJYTF9fREVWSUNFX0FDVElPTl9SRU1PVkU7
CisgICAgYW9kZXYtPmNhbGxiYWNrID0gZGV2aWNlX2FkZHJtX2FvY29tcGxldGU7CisgICAgbGli
eGxfX2RldmljZV91c2JkZXZfcmVtb3ZlKGVnYywgZG9taWQsIHVzYmRldiwgYW9kZXYpOwogCi0g
ICAgbGlieGxfX2FvX2NvbXBsZXRlKGVnYywgYW8sIHJjKTsKICAgICByZXR1cm4gQU9fSU5QUk9H
UkVTUzsKIH0KIAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
