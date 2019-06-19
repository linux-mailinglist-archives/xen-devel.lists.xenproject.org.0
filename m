Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083F4B6AE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:06:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYN2-0002Ej-4S; Wed, 19 Jun 2019 11:03:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdYN0-0002ET-RI
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:03:14 +0000
X-Inumbo-ID: d4e5315d-9281-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d4e5315d-9281-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 11:03:13 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tanGDZs7S97/LIP1WvxXxx3MMCvMDlCrFIqHJ65c3edoLGMzPGjscjLjOrGT9UwYuqcOcxamw1
 Q/FvJvEbYRJHD6SbVB+cdGAZR/Vhg+zzRADcTiBgl6MTNyc4yBTNubKCO8sWr1vezw97ibPCK2
 BPOHRVV3KhdfxnBOoCrECG/6QBkd5Lqz+OdxdaWCNzEdUxBeGiJx/NnOtJronQxXobv4jgON3o
 wB13kiVLjk0CrjY6FTf147XB5VCWeXwqeQh0c0RA0dBcIJvOj6Wb4NnHgQMcvW4vfnZ0GfTm06
 LVg=
X-SBRS: 2.7
X-MesageID: 1926700
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1926700"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 13:02:47 +0200
Message-ID: <20190619110250.18881-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190619110250.18881-1-roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] xz: use initconst for hypervisor build
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T3IgZWxzZSBjbGFuZyBhZGRzIGEgLmluaXQucm9kYXRhLmNzdDggc2VjdGlvbiB0byB0aGUgcmVz
dWx0aW5nIG9iamVjdApmaWxlLCB3aGljaCBpcyBub3QgaGFuZGxlZCBieSB0aGUgWGVuIGxpbmtl
ciBzY3JpcHQgYW5kIGNhbiBlbmQgdXAKYmVmb3JlIHRoZSB0ZXh0IHNlY3Rpb24gd2hpY2ggY29u
dGFpbnMgdGhlIGhlYWRlcnMsIHRodXMgcmVzdWx0aW5nIGluCmEgbm90IHVzYWJsZSBiaW5hcnku
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFk
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5v
cmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhlbi9jb21tb24vZGVjb21wcmVzcy5o
ICAgIHwgMiArKwogeGVuL2NvbW1vbi94ei9kZWNfYmNqLmMgICAgfCA2ICsrKy0tLQogeGVuL2Nv
bW1vbi94ei9kZWNfc3RyZWFtLmMgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RlY29tcHJlc3Mu
aCBiL3hlbi9jb21tb24vZGVjb21wcmVzcy5oCmluZGV4IDY0N2I3YjFlODMuLjRhNDI5YmNhMTIg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZGVjb21wcmVzcy5oCisrKyBiL3hlbi9jb21tb24vZGVj
b21wcmVzcy5oCkBAIC0xMCw2ICsxMCw3IEBACiAjZGVmaW5lIFNUQVRJQwogI2RlZmluZSBJTklU
IF9faW5pdAogI2RlZmluZSBJTklUREFUQSBfX2luaXRkYXRhCisjZGVmaW5lIElOSVRDT05TVCBf
X2luaXRjb25zdAogCiAjZGVmaW5lIG1hbGxvYyB4bWFsbG9jX2J5dGVzCiAjZGVmaW5lIGZyZWUg
eGZyZWUKQEAgLTIyLDYgKzIzLDcgQEAKICNkZWZpbmUgU1RBVElDIHN0YXRpYwogI2RlZmluZSBJ
TklUCiAjZGVmaW5lIElOSVREQVRBCisjZGVmaW5lIElOSVRDT05TVAogCiAjZGVmaW5lIGxhcmdl
X21hbGxvYyBtYWxsb2MKICNkZWZpbmUgbGFyZ2VfZnJlZSBmcmVlCmRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL3h6L2RlY19iY2ouYyBiL3hlbi9jb21tb24veHovZGVjX2Jjai5jCmluZGV4IDg2YzEx
OTIxOTkuLjBhOWE0NWRlMmIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24veHovZGVjX2Jjai5jCisr
KyBiL3hlbi9jb21tb24veHovZGVjX2Jjai5jCkBAIC04NywxMCArODcsMTAgQEAgc3RhdGljIGlu
bGluZSBpbnQgSU5JVCBiY2pfeDg2X3Rlc3RfbXNieXRlKHVpbnQ4X3QgYikKIAogc3RhdGljIHNp
emVfdCBJTklUIGJjal94ODYoc3RydWN0IHh6X2RlY19iY2ogKnMsIHVpbnQ4X3QgKmJ1Ziwgc2l6
ZV90IHNpemUpCiB7Ci0Jc3RhdGljIGNvbnN0IGJvb2xfdCBtYXNrX3RvX2FsbG93ZWRfc3RhdHVz
WzhdCisJc3RhdGljIGNvbnN0IGJvb2xfdCBJTklUQ09OU1QgbWFza190b19hbGxvd2VkX3N0YXR1
c1s4XQogCQk9IHsgdHJ1ZSwgdHJ1ZSwgdHJ1ZSwgZmFsc2UsIHRydWUsIGZhbHNlLCBmYWxzZSwg
ZmFsc2UgfTsKIAotCXN0YXRpYyBjb25zdCB1aW50OF90IG1hc2tfdG9fYml0X251bVs4XSA9IHsg
MCwgMSwgMiwgMiwgMywgMywgMywgMyB9OworCXN0YXRpYyBjb25zdCB1aW50OF90IElOSVRDT05T
VCBtYXNrX3RvX2JpdF9udW1bOF0gPSB7IDAsIDEsIDIsIDIsIDMsIDMsIDMsIDMgfTsKIAogCXNp
emVfdCBpOwogCXNpemVfdCBwcmV2X3BvcyA9IChzaXplX3QpLTE7CkBAIC0xODAsNyArMTgwLDcg
QEAgc3RhdGljIHNpemVfdCBJTklUIGJjal9wb3dlcnBjKHN0cnVjdCB4el9kZWNfYmNqICpzLCB1
aW50OF90ICpidWYsIHNpemVfdCBzaXplKQogI2lmZGVmIFhaX0RFQ19JQTY0CiBzdGF0aWMgc2l6
ZV90IElOSVQgYmNqX2lhNjQoc3RydWN0IHh6X2RlY19iY2ogKnMsIHVpbnQ4X3QgKmJ1Ziwgc2l6
ZV90IHNpemUpCiB7Ci0Jc3RhdGljIGNvbnN0IHVpbnQ4X3QgYnJhbmNoX3RhYmxlWzMyXSA9IHsK
KwlzdGF0aWMgY29uc3QgdWludDhfdCBJTklUQ09OU1QgYnJhbmNoX3RhYmxlWzMyXSA9IHsKIAkJ
MCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwKIAkJMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwKIAkJNCwg
NCwgNiwgNiwgMCwgMCwgNywgNywKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24veHovZGVjX3N0cmVh
bS5jIGIveGVuL2NvbW1vbi94ei9kZWNfc3RyZWFtLmMKaW5kZXggYjhiNTY2MzA3Yy4uNjFlYjJm
ZmI1NSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi94ei9kZWNfc3RyZWFtLmMKKysrIGIveGVuL2Nv
bW1vbi94ei9kZWNfc3RyZWFtLmMKQEAgLTEzOCw3ICsxMzgsNyBAQCBzdHJ1Y3QgeHpfZGVjIHsK
IAogI2lmZGVmIFhaX0RFQ19BTllfQ0hFQ0sKIC8qIFNpemVzIG9mIHRoZSBDaGVjayBmaWVsZCB3
aXRoIGRpZmZlcmVudCBDaGVjayBJRHMgKi8KLXN0YXRpYyBjb25zdCB1aW50OF90IGNoZWNrX3Np
emVzWzE2XSA9IHsKK3N0YXRpYyBjb25zdCB1aW50OF90IElOSVRDT05TVCBjaGVja19zaXplc1sx
Nl0gPSB7CiAJMCwKIAk0LCA0LCA0LAogCTgsIDgsIDgsCi0tIAoyLjIwLjEgKEFwcGxlIEdpdC0x
MTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
