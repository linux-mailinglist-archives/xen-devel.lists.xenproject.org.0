Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AE602D9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 11:06:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjK7O-0005o6-64; Fri, 05 Jul 2019 09:02:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjK7M-0005np-7e
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 09:02:56 +0000
X-Inumbo-ID: ad48fcbb-9f03-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ad48fcbb-9f03-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 09:02:55 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4WTiIKA+HzA9PzSmHZH19teAf8MKeNhsXfRFxWz4kml4xrQDk39SkhcXpZBnC162u9dAmelHvx
 gAj3mUXn1eXPKXcDynaSH+c40FR+oEwabCU44lFyDRqr99tQuiQ6Rf0U6BSnsdl2ViDphRWORZ
 8bCZupwd+dLbx3KlDLHMNfCiTmpGT3dNd5w3cD+cV/oK+ZBPJrgt9hQU/MoXwH8pGLsS6RxwDG
 xLd/gUhYp1Yv/7WCVCQT0SMvZaEY2iXx7eoHIGkBe4815RHAcp9BNGgzHG1dUuBoDcNClBr37Q
 J9Y=
X-SBRS: 2.7
X-MesageID: 2623114
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,454,1557201600"; 
   d="scan'208";a="2623114"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Jul 2019 10:02:48 +0100
Message-ID: <20190705090249.1935-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190705090249.1935-1-paul.durrant@citrix.com>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] xmalloc: remove struct xmem_pool
 init_region
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
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBkaXNwZW5zZXMgd2l0aCB0aGUgaW5pdF9yZWdpb24uIEl0J3Mgc2ltcGx5IG5v
dCBuZWNlc3NhcnkKKHBvb2xzIHdpbGwgc3RpbGwgaGFwcGlseSBncm93IGFuZCBzaHJpbmsgb24g
ZGVtYW5kIGluIGl0cyBhYnNlbmNlKSBhbmQgdGhlCmNvZGUgY2FuIGJlIHNob3J0ZW5kZWQgYnkg
cmVtb3ZpbmcgaXQuIEl0IGFsc28gYXZvaWRzIHRoZSBzb2xlIGV2YWx1YXRpb24Kb2YgQUREX1JF
R0lPTiB3aXRob3V0IGhvbGRpbmcgdGhlIHBvb2wgbG9jayAod2hpY2ggaXMgdW5zYWZlKS4KClNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+ClN1Z2dl
c3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KQ2M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsg
PGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Cgp2MjoKIC0gcmVtb3ZlIGluaXRfcmVnaW9uIGluc3RlYWQgb2YgZml4aW5n
IHRoZSBsb2NraW5nCi0tLQogeGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyB8IDM0ICsrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmggfCAg
MiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMgYi94ZW4vY29tbW9uL3htYWxs
b2NfdGxzZi5jCmluZGV4IGY1ODUzODhkZmEuLmU0ZTQ3NmEyN2MgMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24veG1hbGxvY190bHNmLmMKKysrIGIveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYwpAQCAt
MTAxLDcgKzEwMSw2IEBAIHN0cnVjdCB4bWVtX3Bvb2wgewogCiAgICAgc3BpbmxvY2tfdCBsb2Nr
OwogCi0gICAgdW5zaWduZWQgbG9uZyBpbml0X3NpemU7CiAgICAgdW5zaWduZWQgbG9uZyBtYXhf
c2l6ZTsKICAgICB1bnNpZ25lZCBsb25nIGdyb3dfc2l6ZTsKIApAQCAtMTE1LDcgKzExNCw2IEBA
IHN0cnVjdCB4bWVtX3Bvb2wgewogCiAgICAgc3RydWN0IGxpc3RfaGVhZCBsaXN0OwogCi0gICAg
dm9pZCAqaW5pdF9yZWdpb247CiAgICAgY2hhciBuYW1lW01BWF9QT09MX05BTUVfTEVOXTsKIH07
CiAKQEAgLTI4NywxNCArMjg1LDEzIEBAIHN0cnVjdCB4bWVtX3Bvb2wgKnhtZW1fcG9vbF9jcmVh
dGUoCiAgICAgY29uc3QgY2hhciAqbmFtZSwKICAgICB4bWVtX3Bvb2xfZ2V0X21lbW9yeSBnZXRf
bWVtLAogICAgIHhtZW1fcG9vbF9wdXRfbWVtb3J5IHB1dF9tZW0sCi0gICAgdW5zaWduZWQgbG9u
ZyBpbml0X3NpemUsCiAgICAgdW5zaWduZWQgbG9uZyBtYXhfc2l6ZSwKICAgICB1bnNpZ25lZCBs
b25nIGdyb3dfc2l6ZSkKIHsKICAgICBzdHJ1Y3QgeG1lbV9wb29sICpwb29sOwogICAgIGludCBw
b29sX2J5dGVzLCBwb29sX29yZGVyOwogCi0gICAgQlVHX09OKG1heF9zaXplICYmIChtYXhfc2l6
ZSA8IGluaXRfc2l6ZSkpOworICAgIEJVR19PTihtYXhfc2l6ZSAmJiAobWF4X3NpemUgPCBncm93
X3NpemUpKTsKIAogICAgIHBvb2xfYnl0ZXMgPSBST1VORFVQX1NJWkUoc2l6ZW9mKCpwb29sKSk7
CiAgICAgcG9vbF9vcmRlciA9IGdldF9vcmRlcl9mcm9tX2J5dGVzKHBvb2xfYnl0ZXMpOwpAQCAt
MzA1LDIzICszMDIsMTggQEAgc3RydWN0IHhtZW1fcG9vbCAqeG1lbV9wb29sX2NyZWF0ZSgKICAg
ICBtZW1zZXQocG9vbCwgMCwgcG9vbF9ieXRlcyk7CiAKICAgICAvKiBSb3VuZCB0byBuZXh0IHBh
Z2UgYm91bmRhcnkgKi8KLSAgICBpbml0X3NpemUgPSBST1VORFVQX1BBR0UoaW5pdF9zaXplKTsK
ICAgICBtYXhfc2l6ZSA9IFJPVU5EVVBfUEFHRShtYXhfc2l6ZSk7CiAgICAgZ3Jvd19zaXplID0g
Uk9VTkRVUF9QQUdFKGdyb3dfc2l6ZSk7CiAKICAgICAvKiBwb29sIGdsb2JhbCBvdmVyaGVhZCBu
b3QgaW5jbHVkZWQgaW4gdXNlZCBzaXplICovCiAgICAgcG9vbC0+dXNlZF9zaXplID0gMDsKIAot
ICAgIHBvb2wtPmluaXRfc2l6ZSA9IGluaXRfc2l6ZTsKICAgICBwb29sLT5tYXhfc2l6ZSA9IG1h
eF9zaXplOwogICAgIHBvb2wtPmdyb3dfc2l6ZSA9IGdyb3dfc2l6ZTsKICAgICBwb29sLT5nZXRf
bWVtID0gZ2V0X21lbTsKICAgICBwb29sLT5wdXRfbWVtID0gcHV0X21lbTsKICAgICBzdHJsY3B5
KHBvb2wtPm5hbWUsIG5hbWUsIHNpemVvZihwb29sLT5uYW1lKSk7CiAKLSAgICAvKiBhbHdheXMg
b2J0YWluIGluaXRfcmVnaW9uIGxhemlseSBub3cgdG8gZW5zdXJlIGl0IGlzIGdldF9tZW0nZAot
ICAgICAqIGluIHRoZSBzYW1lICJjb250ZXh0IiBhcyBhbGwgb3RoZXIgcmVnaW9ucyAqLwotCiAg
ICAgc3Bpbl9sb2NrX2luaXQoJnBvb2wtPmxvY2spOwogCiAgICAgc3Bpbl9sb2NrKCZwb29sX2xp
c3RfbG9jayk7CkBAIC0zNDAsNyArMzMyLDYgQEAgdW5zaWduZWQgbG9uZyB4bWVtX3Bvb2xfZ2V0
X3RvdGFsX3NpemUoc3RydWN0IHhtZW1fcG9vbCAqcG9vbCkKIHsKICAgICB1bnNpZ25lZCBsb25n
IHRvdGFsOwogICAgIHRvdGFsID0gUk9VTkRVUF9TSVpFKHNpemVvZigqcG9vbCkpCi0gICAgICAg
ICsgcG9vbC0+aW5pdF9zaXplCiAgICAgICAgICsgKHBvb2wtPm51bV9yZWdpb25zIC0gMSkgKiBw
b29sLT5ncm93X3NpemU7CiAgICAgcmV0dXJuIHRvdGFsOwogfQpAQCAtMzUyLDEzICszNDMsNiBA
QCB2b2lkIHhtZW1fcG9vbF9kZXN0cm95KHN0cnVjdCB4bWVtX3Bvb2wgKnBvb2wpCiAgICAgaWYg
KCBwb29sID09IE5VTEwgKQogICAgICAgICByZXR1cm47CiAKLSAgICAvKiBVc2VyIGlzIGRlc3Ry
b3lpbmcgd2l0aG91dCBldmVyIGFsbG9jYXRpbmcgZnJvbSB0aGlzIHBvb2wgKi8KLSAgICBpZiAo
IHhtZW1fcG9vbF9nZXRfdXNlZF9zaXplKHBvb2wpID09IEJIRFJfT1ZFUkhFQUQgKQotICAgIHsK
LSAgICAgICAgQVNTRVJUKCFwb29sLT5pbml0X3JlZ2lvbik7Ci0gICAgICAgIHBvb2wtPnVzZWRf
c2l6ZSAtPSBCSERSX09WRVJIRUFEOwotICAgIH0KLQogICAgIC8qIENoZWNrIGZvciBtZW1vcnkg
bGVha3MgaW4gdGhpcyBwb29sICovCiAgICAgaWYgKCB4bWVtX3Bvb2xfZ2V0X3VzZWRfc2l6ZShw
b29sKSApCiAgICAgICAgIHByaW50aygibWVtb3J5IGxlYWsgaW4gcG9vbDogJXMgKCVwKS4gIgpA
QCAtMzgwLDE0ICszNjQsNiBAQCB2b2lkICp4bWVtX3Bvb2xfYWxsb2ModW5zaWduZWQgbG9uZyBz
aXplLCBzdHJ1Y3QgeG1lbV9wb29sICpwb29sKQogICAgIGludCBmbCwgc2w7CiAgICAgdW5zaWdu
ZWQgbG9uZyB0bXBfc2l6ZTsKIAotICAgIGlmICggcG9vbC0+aW5pdF9yZWdpb24gPT0gTlVMTCAp
Ci0gICAgewotICAgICAgICBpZiAoIChyZWdpb24gPSBwb29sLT5nZXRfbWVtKHBvb2wtPmluaXRf
c2l6ZSkpID09IE5VTEwgKQotICAgICAgICAgICAgZ290byBvdXQ7Ci0gICAgICAgIEFERF9SRUdJ
T04ocmVnaW9uLCBwb29sLT5pbml0X3NpemUsIHBvb2wpOwotICAgICAgICBwb29sLT5pbml0X3Jl
Z2lvbiA9IHJlZ2lvbjsKLSAgICB9Ci0KICAgICBzaXplID0gKHNpemUgPCBNSU5fQkxPQ0tfU0la
RSkgPyBNSU5fQkxPQ0tfU0laRSA6IFJPVU5EVVBfU0laRShzaXplKTsKICAgICAvKiBSb3VuZGlu
ZyB1cCB0aGUgcmVxdWVzdGVkIHNpemUgYW5kIGNhbGN1bGF0aW5nIGZsIGFuZCBzbCAqLwogCkBA
IC00MDEsOCArMzc3LDcgQEAgdm9pZCAqeG1lbV9wb29sX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6
ZSwgc3RydWN0IHhtZW1fcG9vbCAqcG9vbCkKICAgICAgICAgLyogTm90IGZvdW5kICovCiAgICAg
ICAgIGlmICggc2l6ZSA+IChwb29sLT5ncm93X3NpemUgLSAyICogQkhEUl9PVkVSSEVBRCkgKQog
ICAgICAgICAgICAgZ290byBvdXRfbG9ja2VkOwotICAgICAgICBpZiAoIHBvb2wtPm1heF9zaXpl
ICYmIChwb29sLT5pbml0X3NpemUgKwotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
b29sLT5udW1fcmVnaW9ucyAqIHBvb2wtPmdyb3dfc2l6ZQorICAgICAgICBpZiAoIHBvb2wtPm1h
eF9zaXplICYmIChwb29sLT5udW1fcmVnaW9ucyAqIHBvb2wtPmdyb3dfc2l6ZQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA+IHBvb2wtPm1heF9zaXplKSApCiAgICAgICAgICAgICBn
b3RvIG91dF9sb2NrZWQ7CiAgICAgICAgIHNwaW5fdW5sb2NrKCZwb29sLT5sb2NrKTsKQEAgLTU1
MSw5ICs1MjYsOCBAQCBzdGF0aWMgdm9pZCAqeG1hbGxvY193aG9sZV9wYWdlcyh1bnNpZ25lZCBs
b25nIHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCiAKIHN0YXRpYyB2b2lkIHRsc2ZfaW5pdCh2
b2lkKQogewotICAgIHhlbnBvb2wgPSB4bWVtX3Bvb2xfY3JlYXRlKAotICAgICAgICAieG1hbGxv
YyIsIHhtYWxsb2NfcG9vbF9nZXQsIHhtYWxsb2NfcG9vbF9wdXQsCi0gICAgICAgIFBBR0VfU0la
RSwgMCwgUEFHRV9TSVpFKTsKKyAgICB4ZW5wb29sID0geG1lbV9wb29sX2NyZWF0ZSgieG1hbGxv
YyIsIHhtYWxsb2NfcG9vbF9nZXQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeG1h
bGxvY19wb29sX3B1dCwgMCwgUEFHRV9TSVpFKTsKICAgICBCVUdfT04oIXhlbnBvb2wpOwogfQog
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oIGIveGVuL2luY2x1ZGUveGVu
L3htYWxsb2MuaAppbmRleCBiNDg2ZmU0YjA2Li5mMDc1ZDJkYTkxIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS94ZW4veG1hbGxvYy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmgKQEAg
LTg0LDcgKzg0LDYgQEAgdHlwZWRlZiB2b2lkICh4bWVtX3Bvb2xfcHV0X21lbW9yeSkodm9pZCAq
cHRyKTsKICAqIEBuYW1lOiBuYW1lIG9mIHRoZSBwb29sCiAgKiBAZ2V0X21lbTogY2FsbGJhY2sg
ZnVuY3Rpb24gdXNlZCB0byBleHBhbmQgcG9vbAogICogQHB1dF9tZW06IGNhbGxiYWNrIGZ1bmN0
aW9uIHVzZWQgdG8gc2hyaW5rIHBvb2wKLSAqIEBpbml0X3NpemU6IGluaXRhbCBwb29sIHNpemUg
KGluIGJ5dGVzKQogICogQG1heF9zaXplOiBtYXhpbXVtIHBvb2wgc2l6ZSAoaW4gYnl0ZXMpIC0g
c2V0IHRoaXMgYXMgMCBmb3Igbm8gbGltaXQKICAqIEBncm93X3NpemU6IGFtb3VudCBvZiBtZW1v
cnkgKGluIGJ5dGVzKSBhZGRlZCB0byBwb29sIHdoZW5ldmVyIHJlcXVpcmVkCiAgKgpAQCAtOTQs
NyArOTMsNiBAQCBzdHJ1Y3QgeG1lbV9wb29sICp4bWVtX3Bvb2xfY3JlYXRlKAogICAgIGNvbnN0
IGNoYXIgKm5hbWUsCiAgICAgeG1lbV9wb29sX2dldF9tZW1vcnkgZ2V0X21lbSwKICAgICB4bWVt
X3Bvb2xfcHV0X21lbW9yeSBwdXRfbWVtLAotICAgIHVuc2lnbmVkIGxvbmcgaW5pdF9zaXplLAog
ICAgIHVuc2lnbmVkIGxvbmcgbWF4X3NpemUsCiAgICAgdW5zaWduZWQgbG9uZyBncm93X3NpemUp
OwogCi0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
