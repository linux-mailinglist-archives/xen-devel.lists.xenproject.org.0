Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF07FDF3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwn-0006Kp-TJ; Fri, 02 Aug 2019 15:58:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwl-0006Hd-NF
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:23 +0000
X-Inumbo-ID: 5a10cc76-b53e-11e9-b58a-734243b1be32
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a10cc76-b53e-11e9-b58a-734243b1be32;
 Fri, 02 Aug 2019 15:58:22 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JqPNpPvZKuLmcup7YZzxGt53j9Zomfs4TauNqrxjrz3+CgjnlPCY4h1IA82EKX1hf1fLN9XMpV
 zE7FiE6tyLXw8mVdDcx9J5uSfqFNbhkGz4b8sBKvvoRTI22osV4CIYiLfAnKJ54zpXpzmoAIH5
 Fgbz8iTskuyBu/LI2BH0/d4tt/LTF1mptGp1drnN/4/2fe+K7EGZ3o9vO8HPh/StwXKIrgjiUn
 hXPszKNQMe2+1Dh6al68z9yjyixUCegi5CPoUdw2WKRWOlNd+azQxhRFrBLxQ6Yh7dtNWBQ5wb
 3RA=
X-SBRS: 2.7
X-MesageID: 3931690
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3931690"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:36:01 +0100
Message-ID: <20190802153606.32061-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 30/35] libxl_pci: Use ev_qmp for pci_remove
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
cmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIEluIGRvX3BjaV9yZW1vdmUsIGluc3RlYWQg
b2YgdXNpbmcgYSBwb2xsIGxvb3AgeyBldl90aW1lciA7IHF1ZXJ5LXBjaSB9LAogICAgaXQgY291
bGQgYmUgcG9zc2libGUgdG8gbGlzdGVuIHRvIGV2ZW50cyBzZW50IGJ5IFFFTVUgdmlhIFFNUDsg
aW4gb3JkZXIKICAgIHRvIHdhaXQgZm9yIHRoZSBwYXNzdGhyb3VnaCBwY2kgZGV2aWNlIHRvIGJl
IHJlbW92ZWQgZnJvbSBRRU1VLgogICAgKHBvc3NpYmxlIGltcHJvdmVtZW50KQoKIHRvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmggfCAgIDIgLQogdG9vbHMvbGlieGwvbGlieGxfcGNpLmMgICAg
ICB8IDIxOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogdG9vbHMvbGlieGwv
bGlieGxfcW1wLmMgICAgICB8ICA3NyAtLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjA3
IGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IGNh
M2QzYzcwOTAuLjNlN2NiNDAwNWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMTk4Myw4ICsxOTgz
LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgbGlieGxfX3FtcF9oYW5kbGVyIGxpYnhsX19xbXBfaGFuZGxl
cjsKICAqLwogX2hpZGRlbiBsaWJ4bF9fcW1wX2hhbmRsZXIgKmxpYnhsX19xbXBfaW5pdGlhbGl6
ZShsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCBkb21pZCk7Ci1faGlkZGVuIGludCBsaWJ4bF9fcW1wX3BjaV9k
ZWwobGlieGxfX2djICpnYywgaW50IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldik7CiAvKiBSZXN1bWUgaHZtIGRvbWFpbiAqLwog
X2hpZGRlbiBpbnQgbGlieGxfX3FtcF9zeXN0ZW1fd2FrZXVwKGxpYnhsX19nYyAqZ2MsIGludCBk
b21pZCk7CiAvKiBSZXN1bWUgUUVNVS4gKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhs
X3BjaS5jIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKaW5kZXggYTVmNzAwZjBiZi4uYzRhYzY3
N2YzZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKKysrIGIvdG9vbHMvbGli
eGwvbGlieGxfcGNpLmMKQEAgLTE3NDAsNiArMTc0MCwxMCBAQCB0eXBlZGVmIHN0cnVjdCBwY2lf
cmVtb3ZlX3N0YXRlIHsKICAgICB1bnNpZ25lZCBpbnQgcGZ1bmNfbWFzazsKICAgICBpbnQgbmV4
dF9mdW5jOwogICAgIGxpYnhsX19hb19kZXZpY2Ugc3R1YmRvbV9hb2RldjsKKyAgICBsaWJ4bF9f
eHN3YWl0X3N0YXRlIHhzd2FpdDsKKyAgICBsaWJ4bF9fZXZfcW1wIHFtcDsKKyAgICBsaWJ4bF9f
ZXZfdGltZSB0aW1lb3V0OworICAgIGxpYnhsX19ldl90aW1lIHJldHJ5X3RpbWVyOwogfSBwY2lf
cmVtb3ZlX3N0YXRlOwogCiBzdGF0aWMgdm9pZCBsaWJ4bF9fZGV2aWNlX3BjaV9yZW1vdmVfY29t
bW9uKGxpYnhsX19lZ2MgKmVnYywKQEAgLTE3NDcsMTAgKzE3NTEsMjMgQEAgc3RhdGljIHZvaWQg
bGlieGxfX2RldmljZV9wY2lfcmVtb3ZlX2NvbW1vbihsaWJ4bF9fZWdjICplZ2MsCiAgICAgbGli
eGxfX2FvX2RldmljZSAqYW9kZXYpOwogc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9yZW1vdmVfY29t
bW9uX25leHQobGlieGxfX2VnYyAqZWdjLAogICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycywgaW50
IHJjKTsKKworc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9xZW11X3RyYWRfd2F0Y2hfc3RhdGVfY2Io
bGlieGxfX2VnYyAqZWdjLAorICAgIGxpYnhsX194c3dhaXRfc3RhdGUgKnhzd2EsIGludCByYywg
Y29uc3QgY2hhciAqc3RhdGUpOworc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9xbXBfZGV2aWNlX2Rl
bChsaWJ4bF9fZWdjICplZ2MsCisgICAgcGNpX3JlbW92ZV9zdGF0ZSAqcHJzKTsKK3N0YXRpYyB2
b2lkIHBjaV9yZW1vdmVfcW1wX2RldmljZV9kZWxfY2IobGlieGxfX2VnYyAqZWdjLAorICAgIGxp
YnhsX19ldl9xbXAgKnFtcCwgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpyZXNwb25zZSwgaW50
IHJjKTsKK3N0YXRpYyB2b2lkIHBjaV9yZW1vdmVfcW1wX3JldHJ5X3RpbWVyX2NiKGxpYnhsX19l
Z2MgKmVnYywKKyAgICBsaWJ4bF9fZXZfdGltZSAqZXYsIGNvbnN0IHN0cnVjdCB0aW1ldmFsICpy
ZXF1ZXN0ZWRfYWJzLCBpbnQgcmMpOworc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9xbXBfcXVlcnlf
Y2IobGlieGxfX2VnYyAqZWdjLAorICAgIGxpYnhsX19ldl9xbXAgKnFtcCwgY29uc3QgbGlieGxf
X2pzb25fb2JqZWN0ICpyZXNwb25zZSwgaW50IHJjKTsKIHN0YXRpYyB2b2lkIHBjaV9yZW1vdmVf
ZGV0YXRjaGVkKGxpYnhsX19lZ2MgKmVnYywKICAgICBwY2lfcmVtb3ZlX3N0YXRlICpwcnMsIGlu
dCByYyk7CiBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX3N0dWJkb21fZG9uZShsaWJ4bF9fZWdjICpl
Z2MsCiAgICAgbGlieGxfX2FvX2RldmljZSAqYW9kZXYpOworc3RhdGljIHZvaWQgcGNpX3JlbW92
ZV90aW1lb3V0KGxpYnhsX19lZ2MgKmVnYywKKyAgICBsaWJ4bF9fZXZfdGltZSAqZXYsIGNvbnN0
IHN0cnVjdCB0aW1ldmFsICpyZXF1ZXN0ZWRfYWJzLCBpbnQgcmMpOwogc3RhdGljIHZvaWQgcGNp
X3JlbW92ZV9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAgICBwY2lfcmVtb3ZlX3N0YXRlICpwcnMs
IGludCByYyk7CiAKQEAgLTE3ODQsMjIgKzE4MDEsMjIgQEAgc3RhdGljIHZvaWQgZG9fcGNpX3Jl
bW92ZShsaWJ4bF9fZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICBwcnMtPmh2bSA9
IHRydWU7CiAgICAgICAgIHN3aXRjaCAobGlieGxfX2RldmljZV9tb2RlbF92ZXJzaW9uX3J1bm5p
bmcoZ2MsIGRvbWlkKSkgewogICAgICAgICBjYXNlIExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9O
X1FFTVVfWEVOX1RSQURJVElPTkFMOgotICAgICAgICAgICAgaWYgKGxpYnhsX193YWl0X2Zvcl9k
ZXZpY2VfbW9kZWxfZGVwcmVjYXRlZChnYywgZG9taWQsCi0gICAgICAgICAgICAgICAgICAgICJy
dW5uaW5nIiwgTlVMTCwgTlVMTCwgTlVMTCkgPCAwKQotICAgICAgICAgICAgICAgIGdvdG8gb3V0
X2ZhaWw7Ci0gICAgICAgICAgICByYyA9IHFlbXVfcGNpX3JlbW92ZV94ZW5zdG9yZShnYywgZG9t
aWQsIHBjaWRldiwgZm9yY2UpOwotICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICBwcnMt
Pnhzd2FpdC5hbyA9IGFvOworICAgICAgICAgICAgcHJzLT54c3dhaXQud2hhdCA9ICJEZXZpY2Ug
TW9kZWwiOworICAgICAgICAgICAgcHJzLT54c3dhaXQucGF0aCA9IERFVklDRV9NT0RFTF9YU19Q
QVRIKGdjLAorICAgICAgICAgICAgICAgIGxpYnhsX2dldF9zdHViZG9tX2lkKENUWCwgZG9taWQp
LCBkb21pZCwgIi9zdGF0ZSIpOworICAgICAgICAgICAgcHJzLT54c3dhaXQudGltZW91dF9tcyA9
IExJQlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1FT1VUICogMTAwMDsKKyAgICAgICAgICAgIHBy
cy0+eHN3YWl0LmNhbGxiYWNrID0gcGNpX3JlbW92ZV9xZW11X3RyYWRfd2F0Y2hfc3RhdGVfY2I7
CisgICAgICAgICAgICByYyA9IGxpYnhsX194c3dhaXRfc3RhcnQoZ2MsICZwcnMtPnhzd2FpdCk7
CisgICAgICAgICAgICBpZiAocmMpIGdvdG8gb3V0X2ZhaWw7CisgICAgICAgICAgICByZXR1cm47
CiAgICAgICAgIGNhc2UgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU46Ci0gICAg
ICAgICAgICByYyA9IGxpYnhsX19xbXBfcGNpX2RlbChnYywgZG9taWQsIHBjaWRldik7Ci0gICAg
ICAgICAgICBicmVhazsKKyAgICAgICAgICAgIHBjaV9yZW1vdmVfcW1wX2RldmljZV9kZWwoZWdj
LCBwcnMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KKyAgICAgICAgICAgIHJldHVybjsKICAgICAgICAg
ZGVmYXVsdDoKICAgICAgICAgICAgIHJjID0gRVJST1JfSU5WQUw7CiAgICAgICAgICAgICBnb3Rv
IG91dF9mYWlsOwogICAgICAgICB9Ci0gICAgICAgIGlmIChyYyAmJiAhZm9yY2UpIHsKLSAgICAg
ICAgICAgIHJjID0gRVJST1JfRkFJTDsKLSAgICAgICAgICAgIGdvdG8gb3V0X2ZhaWw7Ci0gICAg
ICAgIH0KICAgICB9IGVsc2UgewogICAgICAgICBhc3NlcnQodHlwZSA9PSBMSUJYTF9ET01BSU5f
VFlQRV9QVik7CiAKQEAgLTE4NjEsOSArMTg3OCwxNjAgQEAgc3RhdGljIHZvaWQgZG9fcGNpX3Jl
bW92ZShsaWJ4bF9fZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLAogc2tpcF9pcnE6CiAgICAgcmMg
PSAwOwogb3V0X2ZhaWw6CisgICAgcGNpX3JlbW92ZV9kZXRhdGNoZWQoZWdjLCBwcnMsIHJjKTsg
LyogbXVzdCBiZSBsYXN0ICovCit9CisKK3N0YXRpYyB2b2lkIHBjaV9yZW1vdmVfcWVtdV90cmFk
X3dhdGNoX3N0YXRlX2NiKGxpYnhsX19lZ2MgKmVnYywKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX194c3dhaXRfc3RhdGUgKnhzd2EsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpz
dGF0ZSkKK3sKKyAgICBwY2lfcmVtb3ZlX3N0YXRlICpwcnMgPSBDT05UQUlORVJfT0YoeHN3YSwg
KnBycywgeHN3YWl0KTsKKyAgICBTVEFURV9BT19HQyhwcnMtPmFvZGV2LT5hbyk7CisKKyAgICAv
KiBDb252ZW5pZW5jZSBhbGlhc2VzICovCisgICAgbGlieGxfZG9taWQgZG9taWQgPSBwcnMtPmRv
bWlkOworICAgIGxpYnhsX2RldmljZV9wY2kgKmNvbnN0IHBjaWRldiA9IHBycy0+cGNpZGV2Owor
CisgICAgaWYgKHJjKSB7CisgICAgICAgIGlmIChyYyA9PSBFUlJPUl9USU1FRE9VVCkgeworICAg
ICAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsICIlcyBub3QgcmVhZHkiLCB4c3dhLT53aGF0KTsK
KyAgICAgICAgfQorICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICBpZiAoIXN0YXRlKQor
ICAgICAgICByZXR1cm47CisgICAgaWYgKHN0cmNtcChzdGF0ZSwgInJ1bm5pbmciKSkKKyAgICAg
ICAgcmV0dXJuOworCisgICAgcmMgPSBxZW11X3BjaV9yZW1vdmVfeGVuc3RvcmUoZ2MsIGRvbWlk
LCBwY2lkZXYsIHBycy0+Zm9yY2UpOworCitvdXQ6CisgICAgbGlieGxfX3hzd2FpdF9zdG9wKGdj
LCB4c3dhKTsKICAgICBwY2lfcmVtb3ZlX2RldGF0Y2hlZChlZ2MsIHBycywgcmMpOwogfQogCitz
dGF0aWMgdm9pZCBwY2lfcmVtb3ZlX3FtcF9kZXZpY2VfZGVsKGxpYnhsX19lZ2MgKmVnYywKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX3JlbW92ZV9zdGF0ZSAqcHJz
KQoreworICAgIFNUQVRFX0FPX0dDKHBycy0+YW9kZXYtPmFvKTsKKyAgICBsaWJ4bF9fanNvbl9v
YmplY3QgKmFyZ3MgPSBOVUxMOworICAgIGludCByYzsKKworICAgIC8qIENvbnZlbmllbmNlIGFs
aWFzZXMgKi8KKyAgICBsaWJ4bF9kZXZpY2VfcGNpICpjb25zdCBwY2lkZXYgPSBwcnMtPnBjaWRl
djsKKworICAgIHJjID0gbGlieGxfX2V2X3RpbWVfcmVnaXN0ZXJfcmVsKGFvLCAmcHJzLT50aW1l
b3V0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9yZW1vdmVfdGlt
ZW91dCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBMSUJYTF9RTVBfQ01E
X1RJTUVPVVQgKiAxMDAwKTsKKyAgICBpZiAocmMpIGdvdG8gb3V0OworCisgICAgUU1QX1BBUkFN
RVRFUlNfU1BSSU5URigmYXJncywgImlkIiwgUENJX1BUX1FERVZfSUQsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwY2lkZXYtPmJ1cywgcGNpZGV2LT5kZXYsIHBjaWRldi0+ZnVuYyk7Cisg
ICAgcHJzLT5xbXAuY2FsbGJhY2sgPSBwY2lfcmVtb3ZlX3FtcF9kZXZpY2VfZGVsX2NiOworICAg
IHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGdjLCAmcHJzLT5xbXAsICJkZXZpY2VfZGVsIiwgYXJn
cyk7CisgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICByZXR1cm47CisKK291dDoKKyAgICBwY2lf
cmVtb3ZlX2RldGF0Y2hlZChlZ2MsIHBycywgcmMpOworfQorCitzdGF0aWMgdm9pZCBwY2lfcmVt
b3ZlX3FtcF9kZXZpY2VfZGVsX2NiKGxpYnhsX19lZ2MgKmVnYywKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2V2X3FtcCAqcW1wLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKnJl
c3BvbnNlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMp
Cit7CisgICAgRUdDX0dDOworICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycyA9IENPTlRBSU5FUl9P
RihxbXAsICpwcnMsIHFtcCk7CisKKyAgICBpZiAocmMpIGdvdG8gb3V0OworCisgICAgLyogTm93
IHRoYXQgdGhlIGNvbW1hbmQgaXMgc2VudCwgd2Ugd2FudCB0byB3YWl0IHVudGlsIFFFTVUgaGFz
CisgICAgICogY29tZmlybWVkIHRoYXQgdGhlIGRldmljZSBpcyByZW1vdmVkLiAqLworICAgIHBj
aV9yZW1vdmVfcW1wX3JldHJ5X3RpbWVyX2NiKGVnYywgJnBycy0+cmV0cnlfdGltZXIsIE5VTEws
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVJST1JfVElNRURPVVQpOworICAg
IHJldHVybjsKKworb3V0OgorICAgIHBjaV9yZW1vdmVfZGV0YXRjaGVkKGVnYywgcHJzLCByYyk7
Cit9CisKK3N0YXRpYyB2b2lkIHBjaV9yZW1vdmVfcW1wX3JldHJ5X3RpbWVyX2NiKGxpYnhsX19l
Z2MgKmVnYywgbGlieGxfX2V2X3RpbWUgKmV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHRpbWV2YWwgKnJlcXVlc3RlZF9hYnMsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCit7CisgICAgRUdD
X0dDOworICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycyA9IENPTlRBSU5FUl9PRihldiwgKnBycywg
cmV0cnlfdGltZXIpOworCisgICAgcHJzLT5xbXAuY2FsbGJhY2sgPSBwY2lfcmVtb3ZlX3FtcF9x
dWVyeV9jYjsKKyAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgJnBycy0+cW1wLCAicXVl
cnktcGNpIiwgTlVMTCk7CisgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICByZXR1cm47CisKK291
dDoKKyAgICBwY2lfcmVtb3ZlX2RldGF0Y2hlZChlZ2MsIHBycywgcmMpOworfQorCitzdGF0aWMg
dm9pZCBwY2lfcmVtb3ZlX3FtcF9xdWVyeV9jYihsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZXZfcW1wICpxbXAsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKnJlc3Bv
bnNlLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKQoreworICAg
IEVHQ19HQzsKKyAgICBwY2lfcmVtb3ZlX3N0YXRlICpwcnMgPSBDT05UQUlORVJfT0YocW1wLCAq
cHJzLCBxbXApOworICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqYnVzID0gTlVMTDsKKyAg
ICBjb25zdCBjaGFyICphc2tlZF9pZDsKKyAgICBpbnQgaSwgajsKKworICAgIC8qIENvbnZlbmll
bmNlIGFsaWFzZXMgKi8KKyAgICBsaWJ4bF9fYW8gKmNvbnN0IGFvID0gcHJzLT5hb2Rldi0+YW87
CisgICAgbGlieGxfZGV2aWNlX3BjaSAqY29uc3QgcGNpZGV2ID0gcHJzLT5wY2lkZXY7CisKKyAg
ICBpZiAocmMpIGdvdG8gb3V0OworCisgICAgYXNrZWRfaWQgPSBHQ1NQUklOVEYoUENJX1BUX1FE
RVZfSUQsCisgICAgICAgICAgICAgICAgICAgICAgICAgcGNpZGV2LT5idXMsIHBjaWRldi0+ZGV2
LCBwY2lkZXYtPmZ1bmMpOworCisgICAgLyogcXVlcnktcGNpIHJlc3BvbnNlOgorICAgICAqIFt7
ICdkZXZpY2VzJzogWyAncWRldl9pZCc6ICdzdHInLCAuLi4gIF0sIC4uLiB9XQorICAgICAqICov
CisKKyAgICBmb3IgKGkgPSAwOyAoYnVzID0gbGlieGxfX2pzb25fYXJyYXlfZ2V0KHJlc3BvbnNl
LCBpKSk7IGkrKykgeworICAgICAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKmRldmljZXMg
PSBOVUxMOworICAgICAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKmRldmljZSA9IE5VTEw7
CisgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqbyA9IE5VTEw7CisgICAgICAgIGNv
bnN0IGNoYXIgKmlkID0gTlVMTDsKKworICAgICAgICBkZXZpY2VzID0gbGlieGxfX2pzb25fbWFw
X2dldCgiZGV2aWNlcyIsIGJ1cywgSlNPTl9BUlJBWSk7CisgICAgICAgIGlmICghZGV2aWNlcykg
eworICAgICAgICAgICAgcmMgPSBFUlJPUl9RRU1VX0FQSTsKKyAgICAgICAgICAgIGdvdG8gb3V0
OworICAgICAgICB9CisKKyAgICAgICAgZm9yIChqID0gMDsgKGRldmljZSA9IGxpYnhsX19qc29u
X2FycmF5X2dldChkZXZpY2VzLCBqKSk7IGorKykgeworICAgICAgICAgICAgIG8gPSBsaWJ4bF9f
anNvbl9tYXBfZ2V0KCJxZGV2X2lkIiwgZGV2aWNlLCBKU09OX1NUUklORyk7CisgICAgICAgICAg
ICAgaWYgKCFvKSB7CisgICAgICAgICAgICAgICAgIHJjID0gRVJST1JfUUVNVV9BUEk7CisgICAg
ICAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICAgICAgIH0KKyAgICAgICAgICAgICBpZCA9
IGxpYnhsX19qc29uX29iamVjdF9nZXRfc3RyaW5nKG8pOworCisgICAgICAgICAgICAgaWYgKGlk
ICYmICFzdHJjbXAoYXNrZWRfaWQsIGlkKSkgeworICAgICAgICAgICAgICAgICAvKiBEZXZpY2Ug
c3RpbGwgaW4gUUVNVSwgbmVlZCB0byB3YWl0IGxvbmd1ZXIuICovCisgICAgICAgICAgICAgICAg
IHJjID0gbGlieGxfX2V2X3RpbWVfcmVnaXN0ZXJfcmVsKGFvLCAmcHJzLT5yZXRyeV90aW1lciwK
KyAgICAgICAgICAgICAgICAgICAgIHBjaV9yZW1vdmVfcW1wX3JldHJ5X3RpbWVyX2NiLCAxMDAw
KTsKKyAgICAgICAgICAgICAgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICAgICAgICAgICAgICAg
cmV0dXJuOworICAgICAgICAgICAgIH0KKyAgICAgICAgfQorICAgIH0KKworb3V0OgorICAgIHBj
aV9yZW1vdmVfZGV0YXRjaGVkKGVnYywgcHJzLCByYyk7IC8qIG11c3QgYmUgbGFzdCAqLworfQor
CiBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX2RldGF0Y2hlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfcmVtb3ZlX3N0YXRlICpwcnMsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCkBAIC0xODc3LDcgKzIwNDUsOCBA
QCBzdGF0aWMgdm9pZCBwY2lfcmVtb3ZlX2RldGF0Y2hlZChsaWJ4bF9fZWdjICplZ2MsCiAgICAg
bGlieGxfZGV2aWNlX3BjaSAqY29uc3QgcGNpZGV2ID0gcHJzLT5wY2lkZXY7CiAgICAgbGlieGxf
ZG9taWQgZG9taWQgPSBwcnMtPmRvbWlkOwogCi0gICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICBp
ZiAocmMgJiYgIXBycy0+Zm9yY2UpCisgICAgICAgIGdvdG8gb3V0OwogCiAgICAgaXNzdHViZG9t
ID0gbGlieGxfaXNfc3R1YmRvbShDVFgsIGRvbWlkLCAmZG9tYWluaWQpOwogCkBAIC0xOTIzLDYg
KzIwOTIsMTUgQEAgc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9zdHViZG9tX2RvbmUobGlieGxfX2Vn
YyAqZWdjLAogICAgIHBjaV9yZW1vdmVfZG9uZShlZ2MsIHBycywgMCk7CiB9CiAKK3N0YXRpYyB2
b2lkIHBjaV9yZW1vdmVfdGltZW91dChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl90aW1lICpl
diwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdGltZXZhbCAq
cmVxdWVzdGVkX2FicywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCit7
CisgICAgcGNpX3JlbW92ZV9zdGF0ZSAqcHJzID0gQ09OVEFJTkVSX09GKGV2LCAqcHJzLCB0aW1l
b3V0KTsKKworICAgIHBjaV9yZW1vdmVfZG9uZShlZ2MsIHBycywgcmMpOworfQorCiBzdGF0aWMg
dm9pZCBwY2lfcmVtb3ZlX2RvbmUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBjaV9yZW1vdmVfc3RhdGUgKnBycywKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgcmMpCkBAIC0xOTMxLDYgKzIxMDksMTAgQEAgc3RhdGljIHZvaWQgcGNpX3JlbW92
ZV9kb25lKGxpYnhsX19lZ2MgKmVnYywKIAogICAgIGlmIChyYykgZ290byBvdXQ7CiAKKyAgICBs
aWJ4bF9fZXZfcW1wX2Rpc3Bvc2UoZ2MsICZwcnMtPnFtcCk7CisgICAgbGlieGxfX2V2X3RpbWVf
ZGVyZWdpc3RlcihnYywgJnBycy0+dGltZW91dCk7CisgICAgbGlieGxfX2V2X3RpbWVfZGVyZWdp
c3RlcihnYywgJnBycy0+cmV0cnlfdGltZXIpOworCiAgICAgbGlieGxfX2RldmljZV9wY2lfcmVt
b3ZlX3hlbnN0b3JlKGdjLCBwcnMtPmRvbWlkLCBwcnMtPnBjaWRldik7CiBvdXQ6CiAgICAgZGV2
aWNlX3BjaV9yZW1vdmVfY29tbW9uX25leHQoZWdjLCBwcnMsIHJjKTsKQEAgLTE5NTEsNiArMjEz
MywxMyBAQCBzdGF0aWMgdm9pZCBsaWJ4bF9fZGV2aWNlX3BjaV9yZW1vdmVfY29tbW9uKGxpYnhs
X19lZ2MgKmVnYywKICAgICBwcnMtPmRvbWlkID0gZG9taWQ7CiAgICAgcHJzLT5wY2lkZXYgPSBw
Y2lkZXY7CiAgICAgcHJzLT5mb3JjZSA9IGZvcmNlOworICAgIGxpYnhsX194c3dhaXRfaW5pdCgm
cHJzLT54c3dhaXQpOworICAgIGxpYnhsX19ldl9xbXBfaW5pdCgmcHJzLT5xbXApOworICAgIHBy
cy0+cW1wLmFvID0gcHJzLT5hb2Rldi0+YW87CisgICAgcHJzLT5xbXAuZG9taWQgPSBwcnMtPmRv
bWlkOworICAgIHBycy0+cW1wLnBheWxvYWRfZmQgPSAtMTsKKyAgICBsaWJ4bF9fZXZfdGltZV9p
bml0KCZwcnMtPnRpbWVvdXQpOworICAgIGxpYnhsX19ldl90aW1lX2luaXQoJnBycy0+cmV0cnlf
dGltZXIpOwogCiAgICAgcHJzLT5vcmlnX3ZkZXYgPSBwY2lkZXYtPnZkZXZmbiAmIH43VTsKIApA
QCAtMTk3NCw2ICsyMTYzLDggQEAgc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9yZW1vdmVfY29tbW9u
X25leHQobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGNpX3JlbW92ZV9zdGF0ZSAqcHJzLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50IHJjKQogeworICAgIEVHQ19HQzsKKwogICAgIC8qIENvbnZl
bmllbmNlIGFsaWFzZXMgKi8KICAgICBsaWJ4bF9kb21pZCBkb21pZCA9IHBycy0+ZG9taWQ7CiAg
ICAgbGlieGxfZGV2aWNlX3BjaSAqY29uc3QgcGNpZGV2ID0gcHJzLT5wY2lkZXY7CkBAIC0yMDAw
LDYgKzIxOTEsMTAgQEAgc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9yZW1vdmVfY29tbW9uX25leHQo
bGlieGxfX2VnYyAqZWdjLAogCiAgICAgcmMgPSAwOwogb3V0OgorICAgIGxpYnhsX19ldl9xbXBf
ZGlzcG9zZShnYywgJnBycy0+cW1wKTsKKyAgICBsaWJ4bF9feHN3YWl0X3N0b3AoZ2MsICZwcnMt
Pnhzd2FpdCk7CisgICAgbGlieGxfX2V2X3RpbWVfZGVyZWdpc3RlcihnYywgJnBycy0+dGltZW91
dCk7CisgICAgbGlieGxfX2V2X3RpbWVfZGVyZWdpc3RlcihnYywgJnBycy0+cmV0cnlfdGltZXIp
OwogICAgIGFvZGV2LT5yYyA9IHJjOwogICAgIGFvZGV2LT5jYWxsYmFjayhlZ2MsIGFvZGV2KTsK
IH0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGli
eGxfcW1wLmMKaW5kZXggMzhiYTYzZDViOS4uOGZhYzczN2ZhZCAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfcW1wLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTg3LDcg
Kzg3LDYgQEAKIAogI2RlZmluZSBRTVBfUkVDRUlWRV9CVUZGRVJfU0laRSA0MDk2CiAjZGVmaW5l
IFFNUF9NQVhfU0laRV9SWF9CVUYgTUIoMSkKLSNkZWZpbmUgUENJX1BUX1FERVZfSUQgInBjaS1w
dC0lMDJ4XyUwMnguJTAxeCIKIAogLyoKICAqIHFtcF9jYWxsYmFja190IGlzIGNhbGwgd2hlbmV2
ZXIgYSBtZXNzYWdlIGZyb20gUU1QIGNvbnRhaW4gdGhlICJpZCIKQEAgLTczNiwzOCArNzM1LDYg
QEAgdm9pZCBsaWJ4bF9fcW1wX2NsZWFudXAobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQp
CiAgICAgfQogfQogCi1zdGF0aWMgaW50IHBjaV9kZWxfY2FsbGJhY2sobGlieGxfX3FtcF9oYW5k
bGVyICpxbXAsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25f
b2JqZWN0ICpyZXNwb25zZSwgdm9pZCAqb3BhcXVlKQotewotICAgIGNvbnN0IGNoYXIgKmFza2Vk
X2lkID0gb3BhcXVlOwotICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqYnVzID0gTlVMTDsK
LSAgICBHQ19JTklUKHFtcC0+Y3R4KTsKLSAgICBpbnQgaSwgaiwgcmMgPSAwOwotCi0gICAgZm9y
IChpID0gMDsgKGJ1cyA9IGxpYnhsX19qc29uX2FycmF5X2dldChyZXNwb25zZSwgaSkpOyBpKysp
IHsKLSAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpkZXZpY2VzID0gTlVMTDsKLSAg
ICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpkZXZpY2UgPSBOVUxMOwotICAgICAgICBj
b25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKm8gPSBOVUxMOwotICAgICAgICBjb25zdCBjaGFyICpp
ZCA9IE5VTEw7Ci0KLSAgICAgICAgZGV2aWNlcyA9IGxpYnhsX19qc29uX21hcF9nZXQoImRldmlj
ZXMiLCBidXMsIEpTT05fQVJSQVkpOwotCi0gICAgICAgIGZvciAoaiA9IDA7IChkZXZpY2UgPSBs
aWJ4bF9fanNvbl9hcnJheV9nZXQoZGV2aWNlcywgaikpOyBqKyspIHsKLSAgICAgICAgICAgICBv
ID0gbGlieGxfX2pzb25fbWFwX2dldCgicWRldl9pZCIsIGRldmljZSwgSlNPTl9TVFJJTkcpOwot
ICAgICAgICAgICAgIGlkID0gbGlieGxfX2pzb25fb2JqZWN0X2dldF9zdHJpbmcobyk7Ci0KLSAg
ICAgICAgICAgICBpZiAoaWQgJiYgc3RyY21wKGFza2VkX2lkLCBpZCkgPT0gMCkgewotICAgICAg
ICAgICAgICAgICByYyA9IDE7Ci0gICAgICAgICAgICAgICAgIGdvdG8gb3V0OwotICAgICAgICAg
ICAgIH0KLSAgICAgICAgfQotICAgIH0KLQotb3V0OgotICAgIEdDX0ZSRUU7Ci0gICAgcmV0dXJu
IHJjOwotfQotCiBzdGF0aWMgaW50IHFtcF9ydW5fY29tbWFuZChsaWJ4bF9fZ2MgKmdjLCBpbnQg
ZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpjbWQsIGxpYnhs
X19qc29uX29iamVjdCAqYXJncywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIHFtcF9jYWxs
YmFja190IGNhbGxiYWNrLCB2b2lkICpvcGFxdWUpCkBAIC03ODUsNTAgKzc1Miw2IEBAIHN0YXRp
YyBpbnQgcW1wX3J1bl9jb21tYW5kKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwKICAgICByZXR1
cm4gcmM7CiB9CiAKLXN0YXRpYyBpbnQgcW1wX2RldmljZV9kZWwobGlieGxfX2djICpnYywgaW50
IGRvbWlkLCBjaGFyICppZCkKLXsKLSAgICBsaWJ4bF9fanNvbl9vYmplY3QgKmFyZ3MgPSBOVUxM
OwotICAgIGxpYnhsX19xbXBfaGFuZGxlciAqcW1wID0gTlVMTDsKLSAgICBpbnQgcmMgPSAwOwot
Ci0gICAgcW1wID0gbGlieGxfX3FtcF9pbml0aWFsaXplKGdjLCBkb21pZCk7Ci0gICAgaWYgKCFx
bXApCi0gICAgICAgIHJldHVybiBFUlJPUl9GQUlMOwotCi0gICAgbGlieGxfX3FtcF9wYXJhbV9h
ZGRfc3RyaW5nKGdjLCAmYXJncywgImlkIiwgaWQpOwotICAgIHJjID0gcW1wX3N5bmNocm9ub3Vz
X3NlbmQocW1wLCAiZGV2aWNlX2RlbCIsIGFyZ3MsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBOVUxMLCBOVUxMLCBxbXAtPnRpbWVvdXQpOwotICAgIGlmIChyYyA9PSAwKSB7Ci0gICAg
ICAgIHVuc2lnbmVkIGludCByZXRyeSA9IDA7Ci0KLSAgICAgICAgZG8gewotICAgICAgICAgICAg
cmMgPSBxbXBfc3luY2hyb25vdXNfc2VuZChxbXAsICJxdWVyeS1wY2kiLCBOVUxMLAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZGVsX2NhbGxiYWNrLCBpZCwgcW1w
LT50aW1lb3V0KTsKLSAgICAgICAgICAgIGlmIChyYyAhPSAxKSB7Ci0gICAgICAgICAgICAgICAg
YnJlYWs7Ci0gICAgICAgICAgICB9Ci0gICAgICAgICAgICBzbGVlcCgxKTsKLSAgICAgICAgfSB3
aGlsZSAocmV0cnkrKyA8IDUpOwotCi0gICAgICAgIGlmIChyYyAhPSAwKSB7Ci0gICAgICAgICAg
ICBMT0dEKFdBUk4sIHFtcC0+ZG9taWQsCi0gICAgICAgICAgICAgICAgICJkZXZpY2UgbW9kZWwg
bWF5IG5vdCBjb21wbGV0ZSByZW1vdmluZyBkZXZpY2UgJXMiLCBpZCk7Ci0gICAgICAgIH0KLSAg
ICB9Ci0KLSAgICBsaWJ4bF9fcW1wX2Nsb3NlKHFtcCk7Ci0gICAgcmV0dXJuIHJjOwotfQotCi1p
bnQgbGlieGxfX3FtcF9wY2lfZGVsKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwgbGlieGxfZGV2
aWNlX3BjaSAqcGNpZGV2KQotewotICAgIGNoYXIgKmlkID0gTlVMTDsKLQotICAgIGlkID0gR0NT
UFJJTlRGKFBDSV9QVF9RREVWX0lELCBwY2lkZXYtPmJ1cywgcGNpZGV2LT5kZXYsIHBjaWRldi0+
ZnVuYyk7Ci0KLSAgICByZXR1cm4gcW1wX2RldmljZV9kZWwoZ2MsIGRvbWlkLCBpZCk7Ci19Ci0K
IGludCBsaWJ4bF9fcW1wX3N5c3RlbV93YWtldXAobGlieGxfX2djICpnYywgaW50IGRvbWlkKQog
ewogICAgIHJldHVybiBxbXBfcnVuX2NvbW1hbmQoZ2MsIGRvbWlkLCAic3lzdGVtX3dha2V1cCIs
IE5VTEwsIE5VTEwsIE5VTEwpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
