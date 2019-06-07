Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846638704
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:27:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZB5a-0002Vo-Se; Fri, 07 Jun 2019 09:23:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GsDR=UG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hZB5Z-0002VZ-CR
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:23:09 +0000
X-Inumbo-ID: db180740-8905-11e9-ae4e-4b0b9ece4356
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db180740-8905-11e9-ae4e-4b0b9ece4356;
 Fri, 07 Jun 2019 09:23:06 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 57GmUDpFdwVTLah8OcNAhYP46KoPEK4x0g5OnmAxMn3PgJG+wif4XLunWLt42veJa+c1OZutxF
 nzlrwhYM0fBV17Fae3V4jtzIWSwBzT+xvF4YmsoLCSD5PIxqVSm2jFR0fzqhMUl9obxMhGChqK
 7zLtGMTCyg+7emLvYe5FtzKS/hscu36d5d1LAMYBxF+O8+7jYqx7gOQJkFQcz9Ckl9D+OjQ5k7
 BaQ0tiCGR+weFYtGPP3nyU3OPiRiGAvtZpTMg8Z00Nxjt/My8BHeGHd2wjOdaUWSbdoh5kMZxz
 aw4=
X-SBRS: -0.9
X-MesageID: 1438394
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,562,1557201600"; 
   d="scan'208";a="1438394"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 7 Jun 2019 11:22:22 +0200
Message-ID: <20190607092232.83179-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190607092232.83179-1-roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 03/13] pci: introduce a pci_sbdf_t field to
 pci_dev
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
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIHVzZSBhbiB1bmlvbiB3aXRoIHRoZSBjdXJyZW50IHNlZywgYnVzIGFuZCBkZXZmbiBmaWVs
ZHMgdG8gbWFrZQpmaWVsZHMgcG9pbnQgdG8gdGhlIHNhbWUgdW5kZXJseWluZyBkYXRhLgoKTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UuCgpTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
PgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KQ2hhbmdlcyBz
aW5jZSB2MjoKIC0gQ29uc3RpZnkgdGhlIHVuaW9uIGluc3RlYWQgb2YgZWFjaCBpbmRpdmlkdWFs
IGZpZWxkLgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNj
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYyB8ICA3ICsrLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgfCAxMiAr
KysrKysrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYwppbmRleCA5NDA5NGY1NTc5Li4yNThiOTFkZWVkIDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVy
LmMKQEAgLTQ2MSw5ICs0NjEsNiBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhzdHJ1Y3QgcGNpX2Rl
diAqcGRldikKICAgICB1bnNpZ25lZCBpbnQgaSwgbnVtX2JhcnMsIHJvbV9yZWc7CiAgICAgc3Ry
dWN0IHZwY2lfaGVhZGVyICpoZWFkZXIgPSAmcGRldi0+dnBjaS0+aGVhZGVyOwogICAgIHN0cnVj
dCB2cGNpX2JhciAqYmFycyA9IGhlYWRlci0+YmFyczsKLSAgICBwY2lfc2JkZl90IHNiZGYgPSB7
Ci0gICAgICAgIC5zYmRmID0gUENJX1NCREYzKHBkZXYtPnNlZywgcGRldi0+YnVzLCBwZGV2LT5k
ZXZmbiksCi0gICAgfTsKICAgICBpbnQgcmM7CiAKICAgICBzd2l0Y2ggKCBwY2lfY29uZl9yZWFk
OChwZGV2LT5zZWcsIHBkZXYtPmJ1cywgc2xvdCwgZnVuYywgUENJX0hFQURFUl9UWVBFKQpAQCAt
NTMwLDcgKzUyNyw3IEBAIHN0YXRpYyBpbnQgaW5pdF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQogICAgICAgICBlbHNlCiAgICAgICAgICAgICBiYXJzW2ldLnR5cGUgPSBWUENJX0JBUl9NRU0z
MjsKIAotICAgICAgICByYyA9IHBjaV9zaXplX21lbV9iYXIoc2JkZiwgcmVnLCAmYWRkciwgJnNp
emUsCisgICAgICAgIHJjID0gcGNpX3NpemVfbWVtX2JhcihwZGV2LT5zYmRmLCByZWcsICZhZGRy
LCAmc2l6ZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpID09IG51bV9iYXJzIC0g
MSkgPyBQQ0lfQkFSX0xBU1QgOiAwKTsKICAgICAgICAgaWYgKCByYyA8IDAgKQogICAgICAgICB7
CkBAIC01NjAsNyArNTU3LDcgQEAgc3RhdGljIGludCBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYg
KnBkZXYpCiAgICAgfQogCiAgICAgLyogQ2hlY2sgZXhwYW5zaW9uIFJPTS4gKi8KLSAgICByYyA9
IHBjaV9zaXplX21lbV9iYXIoc2JkZiwgcm9tX3JlZywgJmFkZHIsICZzaXplLCBQQ0lfQkFSX1JP
TSk7CisgICAgcmMgPSBwY2lfc2l6ZV9tZW1fYmFyKHBkZXYtPnNiZGYsIHJvbV9yZWcsICZhZGRy
LCAmc2l6ZSwgUENJX0JBUl9ST00pOwogICAgIGlmICggcmMgPiAwICYmIHNpemUgKQogICAgIHsK
ICAgICAgICAgc3RydWN0IHZwY2lfYmFyICpyb20gPSAmaGVhZGVyLT5iYXJzW251bV9iYXJzXTsK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2ku
aAppbmRleCBjNjFmZDdlMjYyLi5iMDM5MjdjZDI4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94
ZW4vcGNpLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCkBAIC04MSw5ICs4MSwxNSBAQCBz
dHJ1Y3QgcGNpX2RldiB7CiAgICAgc3RydWN0IGFyY2hfbXNpeCAqbXNpeDsKIAogICAgIHN0cnVj
dCBkb21haW4gKmRvbWFpbjsKLSAgICBjb25zdCB1MTYgc2VnOwotICAgIGNvbnN0IHU4IGJ1czsK
LSAgICBjb25zdCB1OCBkZXZmbjsKKworICAgIGNvbnN0IHVuaW9uIHsKKyAgICAgICAgc3RydWN0
IHsKKyAgICAgICAgICAgIHVpbnQ4X3QgZGV2Zm47CisgICAgICAgICAgICB1aW50OF90IGJ1czsK
KyAgICAgICAgICAgIHVpbnQxNl90IHNlZzsKKyAgICAgICAgfTsKKyAgICAgICAgcGNpX3NiZGZf
dCBzYmRmOworICAgIH07CiAKICAgICB1OCBwaGFudG9tX3N0cmlkZTsKIAotLSAKMi4yMC4xIChB
cHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
