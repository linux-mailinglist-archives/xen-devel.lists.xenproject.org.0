Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAADABAF3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:33:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6FG9-0001Wo-CH; Fri, 06 Sep 2019 14:30:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6FG7-0001Wd-Qm
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:30:43 +0000
X-Inumbo-ID: e7eb46a4-d0b2-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7eb46a4-d0b2-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567780242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ylv0RYKNCWlWLlE/xBicfe1vVV1JFnK3J0WIm4JCfGw=;
 b=I0r2XXnit5FHvLq5bFbV93ppbZiUySJ93ikotCOR2o288Nb9C1Z/zj1+
 gMkl+ONXRkjG++wtKPmCssaAIp5eDaMArP2FICA3HO5Dw9ymvB1VrLMuS
 YsIxwriEX6Xd/3DWfmP/4Wo3GIayG1LAxEL/G9ELvzcLbD3te6Y8qJhg5 c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zesjd3T7R99QvmwIe9CqUYy9fFnJiC5IODoBU8UlKOczLAXStfImkmFV2TrZEPRceyGoJCk5eN
 3mF7iooBcWB+M/AakvvYqJWOD+/SPj4e0BTEHP2VAOPPVeRS99OKIFRBhKWtavSyjvolZziWAC
 UaTkKLXIfMQ9Z8Cao2qWsr0qcAYczgl3ksr/QbBv+9WxI8Z//a4RTF/rmmh4D2t+RFY0B5TycX
 u5q9aQQ/NerVt9VGoQOenn2zHreBA5Qc5YpOwnDceX0caER1u3jMFI0RxZjbbFTA4gC/Mxyo0W
 ZEc=
X-SBRS: 2.7
X-MesageID: 5516283
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5516283"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Sep 2019 16:30:21 +0200
Message-ID: <20190906143021.28261-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190906143021.28261-1-roger.pau@citrix.com>
References: <20190906143021.28261-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/2] sysctl/libxl: choose a sane default for
 HAP
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBsaWJ4bCBjb2RlIHdpbGwgYWx3YXlzIGVuYWJsZSBIYXJkd2FyZSBBc3Npc3RlZCBQ
YWdpbmcgKEhBUCksCmV4cGVjdGluZyB0aGF0IHRoZSBoeXBlcnZpc29yIHdpbGwgZmFsbGJhY2sg
dG8gc2hhZG93IGlmIEhBUCBpcyBub3QKYXZhaWxhYmxlLiBXaXRoIHRoZSBjaGFuZ2VzIHRvIHRo
ZSBkb21haW4gYnVpbGRlciB0aGF0J3Mgbm90IHRoZSBjYXNlCmFueSBsb25nZXIsIGFuZCB0aGUg
aHlwZXJ2aXNvciB3aWxsIHJhaXNlIGFuIGVycm9yIGlmIEhBUCBpcyBub3QKYXZhaWxhYmxlIGlu
c3RlYWQgb2Ygc2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIHNoYWRvdy4KCkluIG9yZGVyIHRvIGtl
ZXAgdGhlIHByZXZpb3VzIGZ1bmN0aW9uYWxpdHkgcmVwb3J0IHdoZXRoZXIgSEFQIGlzCmF2YWls
YWJsZSBvciBub3QgaW4gWEVOX1NZU0NUTF9waHlzaW5mbywgc28gdGhhdCB0aGUgdG9vbHN0YWNr
IGNhbgpzZWxlY3QgYSBzYW5lIGRlZmF1bHQgaWYgdGhlcmUncyBubyBleHBsaWNpdCB1c2VyIHNl
bGVjdGlvbiBvZiB3aGV0aGVyCkhBUCBzaG91bGQgYmUgdXNlZC4KCk5vdGUgdGhhdCBvbiBBUk0g
aGFyZHdhcmUgSEFQIGNhcGFiaWxpdHkgaXMgYWx3YXlzIHJlcG9ydGVkIHNpbmNlIGl0J3MKYSBy
ZXF1aXJlZCBmZWF0dXJlIGluIG9yZGVyIHRvIHJ1biBYZW4uCgpGaXhlczogZDBjMGJhN2QzZGUg
KCd4ODYvaHZtL2RvbWFpbjogcmVtb3ZlIHRoZSAnaGFwX2VuYWJsZWQnIGZsYWcnKQpTaWduZWQt
b2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpDYzogUGF1bCBEdXJyYW50IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIEFkZCBhIExJQlhMX0hB
VkVfUEhZU0lORk9fQ0FQX0hBUCBmb3IgY29tcGF0aWJpbGl0eS4KCkNoYW5nZXMgc2luY2UgdjE6
CiAtIEFsc28gcmVwb3J0IEhBUCBjYXBhYmlsaXR5IGZvciBBUk0uCiAtIFByaW50IGhhcCBjYXBh
YmlsaXR5IGluIHhsIGluZm8uCi0tLQogdG9vbHMvbGlieGwvbGlieGwuYyAgICAgICAgIHwgMSAr
CiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAgfCA3ICsrKysrKysKIHRvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jICB8IDggKysrKysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCB8
IDEgKwogdG9vbHMveGwveGxfaW5mby5jICAgICAgICAgIHwgNSArKystLQogeGVuL2FyY2gvYXJt
L3N5c2N0bC5jICAgICAgIHwgMiArLQogeGVuL2FyY2gveDg2L3N5c2N0bC5jICAgICAgIHwgMiAr
KwogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIHwgNCArKysrCiA4IGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGwuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmMKaW5kZXggZWM3MTU3NGU5OS4uNWMwZmNm
MzIwZSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuYworKysgYi90b29scy9saWJ4bC9s
aWJ4bC5jCkBAIC0zOTksNiArMzk5LDcgQEAgaW50IGxpYnhsX2dldF9waHlzaW5mbyhsaWJ4bF9j
dHggKmN0eCwgbGlieGxfcGh5c2luZm8gKnBoeXNpbmZvKQogICAgIHBoeXNpbmZvLT5jYXBfcHYg
PSAhISh4Y3BoeXNpbmZvLmNhcGFiaWxpdGllcyAmIFhFTl9TWVNDVExfUEhZU0NBUF9wdik7CiAg
ICAgcGh5c2luZm8tPmNhcF9odm1fZGlyZWN0aW8gPQogICAgICAgICAhISh4Y3BoeXNpbmZvLmNh
cGFiaWxpdGllcyAmIFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3Rpbyk7CisgICAgcGh5c2luZm8t
PmNhcF9oYXAgPSAhISh4Y3BoeXNpbmZvLmNhcGFiaWxpdGllcyAmIFhFTl9TWVNDVExfUEhZU0NB
UF9oYXApOwogCiAgICAgR0NfRlJFRTsKICAgICByZXR1cm4gMDsKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4bC9saWJ4bC5oCmluZGV4IDliYWNmYjk3ZjAuLjNm
ZjY3NzkyYTcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsLmgKKysrIGIvdG9vbHMvbGli
eGwvbGlieGwuaApAQCAtMzk0LDYgKzM5NCwxMyBAQAogICovCiAjZGVmaW5lIExJQlhMX0hBVkVf
RVhURU5ERURfVktCIDEKIAorLyoKKyAqIExJQlhMX0hBVkVfUEhZU0lORk9fQ0FQX0hBUCBpbmRp
Y2F0ZXMgdGhhdCBsaWJ4bF9waHlzaW5mbyBoYXMgYSBjYXBfaGFwCisgKiBmaWVsZCB0aGF0IGlu
ZGljYXRlcyB3aGV0aGVyIHRoZSBoYXJkd2FyZSBzdXBwb3J0cyBIYXJkd2FyZSBBc3Npc3RlZAor
ICogUGFnaW5nLgorICovCisjZGVmaW5lIExJQlhMX0hBVkVfUEhZU0lORk9fQ0FQX0hBUCAxCisK
IC8qCiAgKiBsaWJ4bCBBQkkgY29tcGF0aWJpbGl0eQogICoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggMDNj
ZTE2NmY0Zi4uNmE1NTZkZWE4ZiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTM4LDcgKzM4LDEzIEBAIGlu
dCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKICAg
ICBsaWJ4bF9fYXJjaF9kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChnYywgY19pbmZvKTsK
IAogICAgIGlmIChjX2luZm8tPnR5cGUgIT0gTElCWExfRE9NQUlOX1RZUEVfUFYpIHsKLSAgICAg
ICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZjX2luZm8tPmhhcCwgdHJ1ZSk7CisgICAgICAg
IGxpYnhsX3BoeXNpbmZvIGluZm87CisgICAgICAgIGludCByYyA9IGxpYnhsX2dldF9waHlzaW5m
byhDVFgsICZpbmZvKTsKKworICAgICAgICBpZiAocmMpCisgICAgICAgICAgICByZXR1cm4gcmM7
CisKKyAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZjX2luZm8tPmhhcCwgaW5mby5j
YXBfaGFwKTsKICAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZjX2luZm8tPm9vcywg
dHJ1ZSk7CiAgICAgfQogCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwg
Yi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKaW5kZXggYjYxMzk5Y2UzNi4uOWUxZjg1MTVk
MyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCisrKyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX3R5cGVzLmlkbApAQCAtMTAyNSw2ICsxMDI1LDcgQEAgbGlieGxfcGh5c2luZm8g
PSBTdHJ1Y3QoInBoeXNpbmZvIiwgWwogICAgICgiY2FwX2h2bSIsIGJvb2wpLAogICAgICgiY2Fw
X3B2IiwgYm9vbCksCiAgICAgKCJjYXBfaHZtX2RpcmVjdGlvIiwgYm9vbCksICMgTm8gbG9uZ2Vy
IEhWTSBzcGVjaWZpYworICAgICgiY2FwX2hhcCIsIGJvb2wpLAogICAgIF0sIGRpcj1ESVJfT1VU
KQogCiBsaWJ4bF9jb25uZWN0b3JpbmZvID0gU3RydWN0KCJjb25uZWN0b3JpbmZvIiwgWwpkaWZm
IC0tZ2l0IGEvdG9vbHMveGwveGxfaW5mby5jIGIvdG9vbHMveGwveGxfaW5mby5jCmluZGV4IDQ2
ZDljOWY3MTIuLmFhNjcyNGJjN2YgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX2luZm8uYworKysg
Yi90b29scy94bC94bF9pbmZvLmMKQEAgLTIxMCwxMSArMjEwLDEyIEBAIHN0YXRpYyB2b2lkIG91
dHB1dF9waHlzaW5mbyh2b2lkKQogICAgICAgICAgaW5mby5od19jYXBbNF0sIGluZm8uaHdfY2Fw
WzVdLCBpbmZvLmh3X2NhcFs2XSwgaW5mby5od19jYXBbN10KICAgICAgICAgKTsKIAotICAgIG1h
eWJlX3ByaW50ZigidmlydF9jYXBzICAgICAgICAgICAgICA6JXMlcyVzJXNcbiIsCisgICAgbWF5
YmVfcHJpbnRmKCJ2aXJ0X2NhcHMgICAgICAgICAgICAgIDolcyVzJXMlcyVzXG4iLAogICAgICAg
ICAgaW5mby5jYXBfcHYgPyAiIHB2IiA6ICIiLAogICAgICAgICAgaW5mby5jYXBfaHZtID8gIiBo
dm0iIDogIiIsCiAgICAgICAgICBpbmZvLmNhcF9odm0gJiYgaW5mby5jYXBfaHZtX2RpcmVjdGlv
ID8gIiBodm1fZGlyZWN0aW8iIDogIiIsCi0gICAgICAgICBpbmZvLmNhcF9wdiAmJiBpbmZvLmNh
cF9odm1fZGlyZWN0aW8gPyAiIHB2X2RpcmVjdGlvIiA6ICIiCisgICAgICAgICBpbmZvLmNhcF9w
diAmJiBpbmZvLmNhcF9odm1fZGlyZWN0aW8gPyAiIHB2X2RpcmVjdGlvIiA6ICIiLAorICAgICAg
ICAgaW5mby5jYXBfaGFwID8gIiBoYXAiIDogIiIKICAgICAgICAgKTsKIAogICAgIHZpbmZvID0g
bGlieGxfZ2V0X3ZlcnNpb25faW5mbyhjdHgpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3N5
c2N0bC5jIGIveGVuL2FyY2gvYXJtL3N5c2N0bC5jCmluZGV4IDkyYWM5OWM5MjguLmY4Nzk0NGU4
NDcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zeXNjdGwuYworKysgYi94ZW4vYXJjaC9hcm0v
c3lzY3RsLmMKQEAgLTE0LDcgKzE0LDcgQEAKIAogdm9pZCBhcmNoX2RvX3BoeXNpbmZvKHN0cnVj
dCB4ZW5fc3lzY3RsX3BoeXNpbmZvICpwaSkKIHsKLSAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhF
Tl9TWVNDVExfUEhZU0NBUF9odm07CisgICAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RM
X1BIWVNDQVBfaHZtIHwgWEVOX1NZU0NUTF9QSFlTQ0FQX2hhcDsKIH0KIAogbG9uZyBhcmNoX2Rv
X3N5c2N0bChzdHJ1Y3QgeGVuX3N5c2N0bCAqc3lzY3RsLApkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3N5c2N0bC5jIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCmluZGV4IDdlYzYxNzRlNmIuLjU3
NzdhMDVmZmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYworKysgYi94ZW4vYXJj
aC94ODYvc3lzY3RsLmMKQEAgLTE2Myw2ICsxNjMsOCBAQCB2b2lkIGFyY2hfZG9fcGh5c2luZm8o
c3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKQogICAgICAgICBwaS0+Y2FwYWJpbGl0aWVz
IHw9IFhFTl9TWVNDVExfUEhZU0NBUF9odm07CiAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19Q
VikgKQogICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9wdjsK
KyAgICBpZiAoIGh2bV9oYXBfc3VwcG9ydGVkKCkgKQorICAgICAgICBwaS0+Y2FwYWJpbGl0aWVz
IHw9IFhFTl9TWVNDVExfUEhZU0NBUF9oYXA7CiB9CiAKIGxvbmcgYXJjaF9kb19zeXNjdGwoCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJs
aWMvc3lzY3RsLmgKaW5kZXggMzZiM2Y4YzQyOS4uZTAyZDdjZTRjNiAxMDA2NDQKLS0tIGEveGVu
L2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwu
aApAQCAtOTAsNiArOTAsMTAgQEAgc3RydWN0IHhlbl9zeXNjdGxfdGJ1Zl9vcCB7CiAgLyogVGhl
IHBsYXRmb3JtIHN1cHBvcnRzIGRpcmVjdCBhY2Nlc3MgdG8gSS9PIGRldmljZXMgd2l0aCBJT01N
VS4gKi8KICNkZWZpbmUgX1hFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbyAgICAgMgogI2RlZmlu
ZSBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8gICgxdTw8X1hFTl9TWVNDVExfUEhZU0NBUF9k
aXJlY3RpbykKKy8qIFRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBIYXJkd2FyZSBBc3Npc3RlZCBQYWdp
bmcuICovCisjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfaGFwICAgICAgICAgIDMKKyNkZWZp
bmUgWEVOX1NZU0NUTF9QSFlTQ0FQX2hhcCAgICAgICAgICAgKDF1PDxfWEVOX1NZU0NUTF9QSFlT
Q0FQX2hhcCkKKwogc3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gewogICAgIHVpbnQzMl90IHRo
cmVhZHNfcGVyX2NvcmU7CiAgICAgdWludDMyX3QgY29yZXNfcGVyX3NvY2tldDsKLS0gCjIuMjIu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
