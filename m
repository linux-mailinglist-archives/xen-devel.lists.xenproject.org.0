Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76C36F65
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:05:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYoI3-0006cc-UJ; Thu, 06 Jun 2019 09:02:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYoI1-0006bo-Sl
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:02:29 +0000
X-Inumbo-ID: cef0fea5-8839-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cef0fea5-8839-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 09:02:28 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hiqc5se4jsXODpsj/onB2yZIsYtgy9Mmn95MKzCNWF2DBRMIV+RMoFn+RQtnBD1ZyijYaKYJQc
 X9S+nLSP3JYJHGB+7Yee7M0VcHQm1cCYNa5W/NzxDhRTqFkAjsB+cSBJWn7hA2S2k9NeYxP+CH
 zncAM6Oo/OC9cL5d1AvpOzKvr7GitVyupG05lcutw/JrQKXTj53nRKfKUpbLBsy7pNeNpFiP32
 xqa/xFaz1HUcwLlQ6cRGozJcBzxsJvDr2DNt/7xKzLc6lHvCG65k+1vni20QcX6lMRwZlq+VSh
 Vq4=
X-SBRS: -0.9
X-MesageID: 1364983
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,558,1557201600"; 
   d="scan'208";a="1364983"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 11:01:40 +0200
Message-ID: <20190606090146.77381-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190606090146.77381-1-roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 06/12] pci: switch pci_conf_read8 to use
 pci_sbdf_t
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
Cc: Kevin
 Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZWR1Y2VzIHRoZSBudW1iZXIgb2YgcGFyYW1ldGVycyBvZiB0aGUgZnVuY3Rpb24gdG8g
dHdvLCBhbmQKc2ltcGxpZmllcyBzb21lIG9mIHRoZSBjYWxsaW5nIHNpdGVzLgoKU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBHZW9yZ2UgRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNj
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRo
aWt1bHBhbml0QGFtZC5jb20+CkNjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4K
Q2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9j
cHUvYW1kLmMgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiB4ZW4vYXJjaC94ODYvbXNpLmMg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvcGNpLmMg
ICAgICAgICAgICAgICAgfCAyNSArKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJz
L2NoYXIvZWhjaS1kYmdwLmMgICAgICAgICAgICAgfCAgNSArKystLQogeGVuL2RyaXZlcnMvY2hh
ci9uczE2NTUwLmMgICAgICAgICAgICAgICB8ICA2ICsrKystLQogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X2luaXQuYyB8ICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYyAgICAgICAgICAgIHwgMjEgKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3Z0ZC9kbWFyLmMgICAgICAgfCAgNiArKystLS0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9xdWlya3MuYyAgICAgfCAgNiArKystLS0KIHhlbi9kcml2ZXJzL3BjaS9wY2ku
YyAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrLS0tLS0KIHhlbi9kcml2ZXJzL3ZpZGVvL3Zn
YS5jICAgICAgICAgICAgICAgICAgfCAgMyArLS0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMg
ICAgICAgICAgICAgICAgfCAgMyArLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgICAg
ICAgICAgICAgfCAgOCArKystLS0tLQogeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstLS0KIDE0IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDU3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgYi94ZW4v
YXJjaC94ODYvY3B1L2FtZC5jCmluZGV4IDIzZGUyNThjNzguLmZlNmU1NmE5NjcgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpA
QCAtNDIwLDEyICs0MjAsMTIgQEAgc3RhdGljIHZvaWQgZGlzYWJsZV9jMV9yYW1waW5nKHZvaWQp
CiAJbnJfbm9kZXMgPSAoKHBjaV9jb25mX3JlYWQzMigwLCAwLCAweDE4LCAweDAsIDB4NjApPj40
KSYweDA3KSsxOwogCWZvciAobm9kZSA9IDA7IG5vZGUgPCBucl9ub2Rlczsgbm9kZSsrKSB7CiAJ
CS8qIFBNTTc6IGJ1cz0wLCBkZXY9MHgxOCtub2RlLCBmdW5jdGlvbj0weDMsIHJlZ2lzdGVyPTB4
ODcuICovCi0JCXBtbTcgPSBwY2lfY29uZl9yZWFkOCgwLCAwLCAweDE4K25vZGUsIDB4MywgMHg4
Nyk7CisJCXBtbTcgPSBwY2lfY29uZl9yZWFkOChQQ0lfU0JERigwLCAwLCAweDE4ICsgbm9kZSwg
MyksIDB4ODcpOwogCQkvKiBJbnZhbGlkIHJlYWQgbWVhbnMgd2UndmUgdXBkYXRlZCBldmVyeSBO
b3J0aGJyaWRnZS4gKi8KIAkJaWYgKHBtbTcgPT0gMHhGRikKIAkJCWJyZWFrOwogCQlwbW03ICY9
IDB4RkM7IC8qIGNsZWFyIHBtbTdbMTowXSAqLwotCQlwY2lfY29uZl93cml0ZTgoMCwgMCwgMHgx
OCtub2RlLCAweDMsIDB4ODcsIHBtbTcpOworCQlwY2lfY29uZl93cml0ZTgoMCwgMCwgMHgxOCAr
IG5vZGUsIDB4MywgMHg4NywgcG1tNyk7CiAJCXByaW50ayAoIkFNRDogRGlzYWJsaW5nIEMxIENs
b2NrIFJhbXBpbmcgTm9kZSAjJXhcbiIsIG5vZGUpOwogCX0KIH0KZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9tc2kuYyBiL3hlbi9hcmNoL3g4Ni9tc2kuYwppbmRleCBiYWJjNDE0N2M0Li42NzMz
OWVkYzY4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbXNpLmMKKysrIGIveGVuL2FyY2gveDg2
L21zaS5jCkBAIC04MDAsNyArODAwLDcgQEAgc3RhdGljIHU2NCByZWFkX3BjaV9tZW1fYmFyKHUx
NiBzZWcsIHU4IGJ1cywgdTggc2xvdCwgdTggZnVuYywgdTggYmlyLCBpbnQgdmYpCiAgICAgICAg
IGRpc3AgPSB2ZiAqIHBkZXYtPnZmX3JsZW5bYmlyXTsKICAgICAgICAgbGltaXQgPSBQQ0lfU1JJ
T1ZfTlVNX0JBUlM7CiAgICAgfQotICAgIGVsc2Ugc3dpdGNoICggcGNpX2NvbmZfcmVhZDgoc2Vn
LCBidXMsIHNsb3QsIGZ1bmMsCisgICAgZWxzZSBzd2l0Y2ggKCBwY2lfY29uZl9yZWFkOChQQ0lf
U0JERihzZWcsIGJ1cywgc2xvdCwgZnVuYyksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQQ0lfSEVBREVSX1RZUEUpICYgMHg3ZiApCiAgICAgewogICAgIGNhc2UgUENJX0hFQURF
Ul9UWVBFX05PUk1BTDoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvcGNpLmMgYi94
ZW4vYXJjaC94ODYveDg2XzY0L3BjaS5jCmluZGV4IDZlM2Y1Y2YyMDMuLmI3MDM4M2ZiMDMgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvcGNpLmMKKysrIGIveGVuL2FyY2gveDg2L3g4
Nl82NC9wY2kuYwpAQCAtOCwyNyArOCwyNiBAQAogI2luY2x1ZGUgPHhlbi9wY2kuaD4KICNpbmNs
dWRlIDxhc20vaW8uaD4KIAotI2RlZmluZSBQQ0lfQ09ORl9BRERSRVNTKGJ1cywgZGV2LCBmdW5j
LCByZWcpIFwKLSAgICAoMHg4MDAwMDAwMCB8IChidXMgPDwgMTYpIHwgKGRldiA8PCAxMSkgfCAo
ZnVuYyA8PCA4KSB8IChyZWcgJiB+MykpCisjZGVmaW5lIFBDSV9DT05GX0FERFJFU1Moc2JkZiwg
cmVnKSBcCisgICAgKDB4ODAwMDAwMDAgfCAoKHNiZGYpLmJkZiA8PCA4KSB8ICgocmVnKSAmIH4z
KSkKIAotdWludDhfdCBwY2lfY29uZl9yZWFkOCgKLSAgICB1bnNpZ25lZCBpbnQgc2VnLCB1bnNp
Z25lZCBpbnQgYnVzLCB1bnNpZ25lZCBpbnQgZGV2LCB1bnNpZ25lZCBpbnQgZnVuYywKLSAgICB1
bnNpZ25lZCBpbnQgcmVnKQordWludDhfdCBwY2lfY29uZl9yZWFkOChwY2lfc2JkZl90IHNiZGYs
IHVuc2lnbmVkIGludCByZWcpCiB7Ci0gICAgdTMyIHZhbHVlOworICAgIHVpbnQzMl90IHZhbHVl
OwogCi0gICAgaWYgKCBzZWcgfHwgcmVnID4gMjU1ICkKKyAgICBpZiAoIHNiZGYuc2VnIHx8IHJl
ZyA+IDI1NSApCiAgICAgewotICAgICAgICBwY2lfbW1jZmdfcmVhZChzZWcsIGJ1cywgUENJX0RF
VkZOKGRldiwgZnVuYyksIHJlZywgMSwgJnZhbHVlKTsKKyAgICAgICAgcGNpX21tY2ZnX3JlYWQo
c2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldmZuLCByZWcsIDEsICZ2YWx1ZSk7CiAgICAgICAg
IHJldHVybiB2YWx1ZTsKICAgICB9Ci0gICAgZWxzZQotICAgIHsKLSAgICAgICAgQlVHX09OKChi
dXMgPiAyNTUpIHx8IChkZXYgPiAzMSkgfHwgKGZ1bmMgPiA3KSk7Ci0gICAgICAgIHJldHVybiBw
Y2lfY29uZl9yZWFkKFBDSV9DT05GX0FERFJFU1MoYnVzLCBkZXYsIGZ1bmMsIHJlZyksIHJlZyAm
IDMsIDEpOwotICAgIH0KKworICAgIHJldHVybiBwY2lfY29uZl9yZWFkKFBDSV9DT05GX0FERFJF
U1Moc2JkZiwgcmVnKSwgcmVnICYgMywgMSk7CiB9CiAKKyN1bmRlZiBQQ0lfQ09ORl9BRERSRVNT
CisjZGVmaW5lIFBDSV9DT05GX0FERFJFU1MoYnVzLCBkZXYsIGZ1bmMsIHJlZykgXAorICAgICgw
eDgwMDAwMDAwIHwgKGJ1cyA8PCAxNikgfCAoZGV2IDw8IDExKSB8IChmdW5jIDw8IDgpIHwgKHJl
ZyAmIH4zKSkKKwogdWludDE2X3QgcGNpX2NvbmZfcmVhZDE2KAogICAgIHVuc2lnbmVkIGludCBz
ZWcsIHVuc2lnbmVkIGludCBidXMsIHVuc2lnbmVkIGludCBkZXYsIHVuc2lnbmVkIGludCBmdW5j
LAogICAgIHVuc2lnbmVkIGludCByZWcpCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2Vo
Y2ktZGJncC5jIGIveGVuL2RyaXZlcnMvY2hhci9laGNpLWRiZ3AuYwppbmRleCA0NzVkYzQxNzY3
Li43MWYwYWFhNmFjIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2VoY2ktZGJncC5jCisr
KyBiL3hlbi9kcml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMKQEAgLTcxMyw3ICs3MTMsNyBAQCBzdGF0
aWMgdW5zaWduZWQgaW50IF9faW5pdCBmaW5kX2RiZ3Aoc3RydWN0IGVoY2lfZGJncCAqZGJncCwK
ICAgICAgICAgICAgICAgICBjYXAgPSBfX2ZpbmRfZGJncChidXMsIHNsb3QsIGZ1bmMpOwogICAg
ICAgICAgICAgICAgIGlmICggIWNhcCB8fCBlaGNpX251bS0tICkKICAgICAgICAgICAgICAgICB7
Ci0gICAgICAgICAgICAgICAgICAgIGlmICggIWZ1bmMgJiYgIShwY2lfY29uZl9yZWFkOCgwLCBi
dXMsIHNsb3QsIGZ1bmMsCisgICAgICAgICAgICAgICAgICAgIGlmICggIWZ1bmMgJiYgIShwY2lf
Y29uZl9yZWFkOChQQ0lfU0JERigwLCBidXMsIHNsb3QsIGZ1bmMpLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0hFQURFUl9UWVBFKSAmIDB4
ODApICkKICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKQEAgLTEzMTIsNyArMTMxMiw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlaGNp
X2RiZ3BfaW5pdF9wcmVpcnEoc3RydWN0IHNlcmlhbF9wb3J0ICpwb3J0KQogICAgIG9mZnNldCA9
IChkZWJ1Z19wb3J0ID4+IDE2KSAmIDB4ZmZmOwogCiAgICAgLyogZG91YmxlIGNoZWNrIGlmIHRo
ZSBtZW0gc3BhY2UgaXMgZW5hYmxlZCAqLwotICAgIGRiZ3AtPnBjaV9jciA9IHBjaV9jb25mX3Jl
YWQ4KDAsIGRiZ3AtPmJ1cywgZGJncC0+c2xvdCwgZGJncC0+ZnVuYywKKyAgICBkYmdwLT5wY2lf
Y3IgPSBwY2lfY29uZl9yZWFkOChQQ0lfU0JERigwLCBkYmdwLT5idXMsIGRiZ3AtPnNsb3QsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGJncC0+ZnVuYyksCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0NPTU1BTkQpOwogICAgIGlmICgg
IShkYmdwLT5wY2lfY3IgJiBQQ0lfQ09NTUFORF9NRU1PUlkpICkKICAgICB7CmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5j
CmluZGV4IDE4OWUxMjFiN2UuLjU0NzI3MGQwZTEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL2No
YXIvbnMxNjU1MC5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCkBAIC0xMTg4LDgg
KzExODgsMTAgQEAgcGNpX3VhcnRfY29uZmlnKHN0cnVjdCBuczE2NTUwICp1YXJ0LCBib29sX3Qg
c2tpcF9hbXQsIHVuc2lnbmVkIGludCBpZHgpCiAgICAgICAgICAgICAgICAgdWFydC0+YmFyNjQg
PSBiYXJfNjQ7CiAgICAgICAgICAgICAgICAgdWFydC0+aW9fc2l6ZSA9IG1heCg4VSA8PCBwYXJh
bS0+cmVnX3NoaWZ0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFyYW0t
PnVhcnRfb2Zmc2V0KTsKLSAgICAgICAgICAgICAgICB1YXJ0LT5pcnEgPSBwY2lfY29uZl9yZWFk
OCgwLCBiLCBkLCBmLCBQQ0lfSU5URVJSVVBUX1BJTikgPwotICAgICAgICAgICAgICAgICAgICBw
Y2lfY29uZl9yZWFkOCgwLCBiLCBkLCBmLCBQQ0lfSU5URVJSVVBUX0xJTkUpIDogMDsKKyAgICAg
ICAgICAgICAgICB1YXJ0LT5pcnEgPSBwY2lfY29uZl9yZWFkOChQQ0lfU0JERigwLCBiLCBkLCBm
KSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfSU5URVJS
VVBUX1BJTikgPworICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9jb25mX3JlYWQ4KFBD
SV9TQkRGKDAsIGIsIGQsIGYpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9JTlRFUlJVUFRfTElORSkgOiAwOwogCiAgICAgICAgICAgICAgICAgcmV0dXJu
IDA7CiAgICAgICAgICAgICB9CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfaW5pdC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQu
YwppbmRleCA3MmVhODgyNGIwLi4zMGRlNjg0ZjZkIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9pbml0LmMKQEAgLTEyNDEsNyArMTI0MSw3IEBAIHN0YXRpYyBib29sX3QgX19p
bml0IGFtZF9zcDUxMDBfZXJyYXR1bTI4KHZvaWQpCiAgICAgICAgIGlmICh2ZW5kb3JfaWQgIT0g
MHgxMDAyIHx8IGRldl9pZCAhPSAweDQzODUpCiAgICAgICAgICAgICBjb250aW51ZTsKIAotICAg
ICAgICBieXRlID0gcGNpX2NvbmZfcmVhZDgoMCwgYnVzLCAweDE0LCAwLCAweGFkKTsKKyAgICAg
ICAgYnl0ZSA9IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGKDAsIGJ1cywgMHgxNCwgMCksIDB4YWQp
OwogICAgICAgICBpZiAoIChieXRlID4+IDMpICYgMSApCiAgICAgICAgIHsKICAgICAgICAgICAg
IHByaW50ayhYRU5MT0dfV0FSTklORyAiQU1ELVZpOiBTUDUxMDAgZXJyYXR1bSAyOCBkZXRlY3Rl
ZCwgZGlzYWJsaW5nIElPTU1VLlxuIgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwppbmRleCAzOTY0ZDJhOTNl
Li5hNGM3N2JlOGYxIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwor
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwpAQCAtMjYwLDcgKzI2MCw3IEBAIHN0
YXRpYyB2b2lkIGNoZWNrX3BkZXYoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAgICAgICAg
IH0KICAgICB9CiAKLSAgICBzd2l0Y2ggKCBwY2lfY29uZl9yZWFkOChzZWcsIGJ1cywgZGV2LCBm
dW5jLCBQQ0lfSEVBREVSX1RZUEUpICYgMHg3ZiApCisgICAgc3dpdGNoICggcGNpX2NvbmZfcmVh
ZDgocGRldi0+c2JkZiwgUENJX0hFQURFUl9UWVBFKSAmIDB4N2YgKQogICAgIHsKICAgICBjYXNl
IFBDSV9IRUFERVJfVFlQRV9CUklER0U6CiAgICAgICAgIGlmICggIWJyaWRnZV9jdGxfbWFzayAp
CkBAIC0zNzAsMTAgKzM3MCw4IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqYWxsb2NfcGRldihz
dHJ1Y3QgcGNpX3NlZyAqcHNlZywgdTggYnVzLCB1OCBkZXZmbikKIAogICAgICAgICBjYXNlIERF
Vl9UWVBFX1BDSWUyUENJX0JSSURHRToKICAgICAgICAgY2FzZSBERVZfVFlQRV9MRUdBQ1lfUENJ
X0JSSURHRToKLSAgICAgICAgICAgIHNlY19idXMgPSBwY2lfY29uZl9yZWFkOChwc2VnLT5uciwg
YnVzLCBQQ0lfU0xPVChkZXZmbiksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUENJX0ZVTkMoZGV2Zm4pLCBQQ0lfU0VDT05EQVJZX0JVUyk7Ci0gICAgICAgICAgICBzdWJf
YnVzID0gcGNpX2NvbmZfcmVhZDgocHNlZy0+bnIsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9GVU5DKGRldmZuKSwgUENJX1NV
Qk9SRElOQVRFX0JVUyk7CisgICAgICAgICAgICBzZWNfYnVzID0gcGNpX2NvbmZfcmVhZDgocGRl
di0+c2JkZiwgUENJX1NFQ09OREFSWV9CVVMpOworICAgICAgICAgICAgc3ViX2J1cyA9IHBjaV9j
b25mX3JlYWQ4KHBkZXYtPnNiZGYsIFBDSV9TVUJPUkRJTkFURV9CVVMpOwogCiAgICAgICAgICAg
ICBzcGluX2xvY2soJnBzZWctPmJ1czJicmlkZ2VfbG9jayk7CiAgICAgICAgICAgICBmb3IgKCA7
IHNlY19idXMgPD0gc3ViX2J1czsgc2VjX2J1cysrICkKQEAgLTQzNiwxNiArNDM0LDEyIEBAIHN0
YXRpYyB2b2lkIGZyZWVfcGRldihzdHJ1Y3QgcGNpX3NlZyAqcHNlZywgc3RydWN0IHBjaV9kZXYg
KnBkZXYpCiAgICAgLyogdXBkYXRlIGJ1czJicmlkZ2UgKi8KICAgICBzd2l0Y2ggKCBwZGV2LT50
eXBlICkKICAgICB7Ci0gICAgICAgIHU4IGRldiwgZnVuYywgc2VjX2J1cywgc3ViX2J1czsKKyAg
ICAgICAgdWludDhfdCBzZWNfYnVzLCBzdWJfYnVzOwogCiAgICAgICAgIGNhc2UgREVWX1RZUEVf
UENJZTJQQ0lfQlJJREdFOgogICAgICAgICBjYXNlIERFVl9UWVBFX0xFR0FDWV9QQ0lfQlJJREdF
OgotICAgICAgICAgICAgZGV2ID0gUENJX1NMT1QocGRldi0+ZGV2Zm4pOwotICAgICAgICAgICAg
ZnVuYyA9IFBDSV9GVU5DKHBkZXYtPmRldmZuKTsKLSAgICAgICAgICAgIHNlY19idXMgPSBwY2lf
Y29uZl9yZWFkOChwc2VnLT5uciwgcGRldi0+YnVzLCBkZXYsIGZ1bmMsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NFQ09OREFSWV9CVVMpOwotICAgICAgICAgICAg
c3ViX2J1cyA9IHBjaV9jb25mX3JlYWQ4KHBzZWctPm5yLCBwZGV2LT5idXMsIGRldiwgZnVuYywK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfU1VCT1JESU5BVEVfQlVT
KTsKKyAgICAgICAgICAgIHNlY19idXMgPSBwY2lfY29uZl9yZWFkOChwZGV2LT5zYmRmLCBQQ0lf
U0VDT05EQVJZX0JVUyk7CisgICAgICAgICAgICBzdWJfYnVzID0gcGNpX2NvbmZfcmVhZDgocGRl
di0+c2JkZiwgUENJX1NVQk9SRElOQVRFX0JVUyk7CiAKICAgICAgICAgICAgIHNwaW5fbG9jaygm
cHNlZy0+YnVzMmJyaWRnZV9sb2NrKTsKICAgICAgICAgICAgIGZvciAoIDsgc2VjX2J1cyA8PSBz
dWJfYnVzOyBzZWNfYnVzKysgKQpAQCAtMTA4Miw3ICsxMDc2LDggQEAgc3RhdGljIGludCBfX2lu
aXQgX3NjYW5fcGNpX2RldmljZXMoc3RydWN0IHBjaV9zZWcgKnBzZWcsIHZvaWQgKmFyZykKICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAgICAgICAgICAgICAgICAgfQogCi0g
ICAgICAgICAgICAgICAgaWYgKCAhZnVuYyAmJiAhKHBjaV9jb25mX3JlYWQ4KHBzZWctPm5yLCBi
dXMsIGRldiwgZnVuYywKKyAgICAgICAgICAgICAgICBpZiAoICFmdW5jICYmICEocGNpX2NvbmZf
cmVhZDgoUENJX1NCREYocHNlZy0+bnIsIGJ1cywgZGV2LAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jKSwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0hFQURFUl9UWVBFKSAmIDB4ODAp
ICkKICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICB9CmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL2RtYXIuYwppbmRleCBiODU4ZmU3YzgwLi45Yzk0ZGVhYzBiIDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCisrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3Z0ZC9kbWFyLmMKQEAgLTM0OCw3ICszNDgsNyBAQCBzdGF0aWMgaW50IF9faW5p
dCBhY3BpX3BhcnNlX2Rldl9zY29wZSgKIAogICAgICAgICB3aGlsZSAoIC0tZGVwdGggPiAwICkK
ICAgICAgICAgewotICAgICAgICAgICAgYnVzID0gcGNpX2NvbmZfcmVhZDgoc2VnLCBidXMsIHBh
dGgtPmRldiwgcGF0aC0+Zm4sCisgICAgICAgICAgICBidXMgPSBwY2lfY29uZl9yZWFkOChQQ0lf
U0JERihzZWcsIGJ1cywgcGF0aC0+ZGV2LCBwYXRoLT5mbiksCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBQQ0lfU0VDT05EQVJZX0JVUyk7CiAgICAgICAgICAgICBwYXRoKys7CiAg
ICAgICAgIH0KQEAgLTM1Niw5ICszNTYsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNl
X2Rldl9zY29wZSgKICAgICAgICAgc3dpdGNoICggYWNwaV9zY29wZS0+ZW50cnlfdHlwZSApCiAg
ICAgICAgIHsKICAgICAgICAgY2FzZSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9CUklER0U6Ci0gICAg
ICAgICAgICBzZWNfYnVzID0gcGNpX2NvbmZfcmVhZDgoc2VnLCBidXMsIHBhdGgtPmRldiwgcGF0
aC0+Zm4sCisgICAgICAgICAgICBzZWNfYnVzID0gcGNpX2NvbmZfcmVhZDgoUENJX1NCREYoc2Vn
LCBidXMsIHBhdGgtPmRldiwgcGF0aC0+Zm4pLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFBDSV9TRUNPTkRBUllfQlVTKTsKLSAgICAgICAgICAgIHN1Yl9idXMgPSBwY2lf
Y29uZl9yZWFkOChzZWcsIGJ1cywgcGF0aC0+ZGV2LCBwYXRoLT5mbiwKKyAgICAgICAgICAgIHN1
Yl9idXMgPSBwY2lfY29uZl9yZWFkOChQQ0lfU0JERihzZWcsIGJ1cywgcGF0aC0+ZGV2LCBwYXRo
LT5mbiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NVQk9SRElO
QVRFX0JVUyk7CiAgICAgICAgICAgICBpZiAoIGlvbW11X3ZlcmJvc2UgKQogICAgICAgICAgICAg
ICAgIHByaW50ayhWVERQUkVGSVgKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC9xdWlya3MuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xdWlya3MuYwppbmRl
eCBkNmRiODYyNjc4Li5mZjczYjBlN2Y0IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvcXVpcmtzLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3F1aXJr
cy5jCkBAIC05Miw4ICs5Miw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjYW50aWdhX2IzX2VycmF0
YV9pbml0KHZvaWQpCiAgICAgaWYgKCB2aWQgIT0gMHg4MDg2ICkKICAgICAgICAgcmV0dXJuOwog
Ci0gICAgZGlkX2hpID0gcGNpX2NvbmZfcmVhZDgoMCwgMCwgSUdEX0RFViwgMCwgMyk7Ci0gICAg
cmlkID0gcGNpX2NvbmZfcmVhZDgoMCwgMCwgSUdEX0RFViwgMCwgOCk7CisgICAgZGlkX2hpID0g
cGNpX2NvbmZfcmVhZDgoUENJX1NCREYoMCwgMCwgSUdEX0RFViwgMCksIDMpOworICAgIHJpZCA9
IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGKDAsIDAsIElHRF9ERVYsIDApLCA4KTsKIAogICAgIGlm
ICggKGRpZF9oaSA9PSAweDJBKSAmJiAocmlkID09IDB4NykgKQogICAgICAgICBpc19jYW50aWdh
X2IzID0gMTsKQEAgLTI4MSw3ICsyODEsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgdHlsZXJzYnVy
Z19pbnRyZW1hcF9xdWlyayh2b2lkKQogICAgIHsKICAgICAgICAgLyogTWF0Y2ggb24gU3lzdGVt
IE1hbmFnZW1lbnQgUmVnaXN0ZXJzIG9uIERldmljZSAyMCBGdW5jdGlvbiAwICovCiAgICAgICAg
IGRldmljZSA9IHBjaV9jb25mX3JlYWQzMigwLCBidXMsIDIwLCAwLCBQQ0lfVkVORE9SX0lEKTsK
LSAgICAgICAgcmV2ID0gcGNpX2NvbmZfcmVhZDgoMCwgYnVzLCAyMCwgMCwgUENJX1JFVklTSU9O
X0lEKTsKKyAgICAgICAgcmV2ID0gcGNpX2NvbmZfcmVhZDgoUENJX1NCREYoMCwgYnVzLCAyMCwg
MCksIFBDSV9SRVZJU0lPTl9JRCk7CiAKICAgICAgICAgaWYgKCByZXYgPT0gMHgxMyAmJiBkZXZp
Y2UgPT0gMHgzNDJlODA4NiApCiAgICAgICAgIHsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bj
aS9wY2kuYyBiL3hlbi9kcml2ZXJzL3BjaS9wY2kuYwppbmRleCAxYzgwOGQ2NjMyLi5lM2Y4ODNm
YzVjIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wY2kvcGNpLmMKKysrIGIveGVuL2RyaXZlcnMv
cGNpL3BjaS5jCkBAIC0yMSwxMiArMjEsMTIgQEAgaW50IHBjaV9maW5kX2NhcF9vZmZzZXQodTE2
IHNlZywgdTggYnVzLCB1OCBkZXYsIHU4IGZ1bmMsIHU4IGNhcCkKIAogICAgIHdoaWxlICggbWF4
X2NhcC0tICkKICAgICB7Ci0gICAgICAgIHBvcyA9IHBjaV9jb25mX3JlYWQ4KHNlZywgYnVzLCBk
ZXYsIGZ1bmMsIHBvcyk7CisgICAgICAgIHBvcyA9IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGKHNl
ZywgYnVzLCBkZXYsIGZ1bmMpLCBwb3MpOwogICAgICAgICBpZiAoIHBvcyA8IDB4NDAgKQogICAg
ICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgcG9zICY9IH4zOwotICAgICAgICBpZCA9IHBjaV9j
b25mX3JlYWQ4KHNlZywgYnVzLCBkZXYsIGZ1bmMsIHBvcyArIFBDSV9DQVBfTElTVF9JRCk7Cisg
ICAgICAgIGlkID0gcGNpX2NvbmZfcmVhZDgoUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYyks
IHBvcyArIFBDSV9DQVBfTElTVF9JRCk7CiAKICAgICAgICAgaWYgKCBpZCA9PSAweGZmICkKICAg
ICAgICAgICAgIGJyZWFrOwpAQCAtNDYsMTMgKzQ2LDEyIEBAIGludCBwY2lfZmluZF9uZXh0X2Nh
cCh1MTYgc2VnLCB1OCBidXMsIHVuc2lnbmVkIGludCBkZXZmbiwgdTggcG9zLCBpbnQgY2FwKQog
CiAgICAgd2hpbGUgKCB0dGwtLSApCiAgICAgewotICAgICAgICBwb3MgPSBwY2lfY29uZl9yZWFk
OChzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksIHBvcyk7CisgICAg
ICAgIHBvcyA9IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGMyhzZWcsIGJ1cywgZGV2Zm4pLCBwb3Mp
OwogICAgICAgICBpZiAoIHBvcyA8IDB4NDAgKQogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAg
ICAgcG9zICY9IH4zOwotICAgICAgICBpZCA9IHBjaV9jb25mX3JlYWQ4KHNlZywgYnVzLCBQQ0lf
U0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQpOworICAgICAgICBpZCA9IHBjaV9jb25mX3JlYWQ4KFBD
SV9TQkRGMyhzZWcsIGJ1cywgZGV2Zm4pLCBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQpOwogCiAgICAg
ICAgIGlmICggaWQgPT0gMHhmZiApCiAgICAgICAgICAgICBicmVhazsKZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3ZpZGVvL3ZnYS5jIGIveGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMKaW5kZXggNmE2
NGZkOTAxMy4uNzg1MzNhZDBiMSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMK
KysrIGIveGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMKQEAgLTEzNiw4ICsxMzYsNyBAQCB2b2lkIF9f
aW5pdCB2aWRlb19lbmRib290KHZvaWQpCiAgICAgICAgICAgICAgICAgICAgICAgICBiID0gMDsK
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgICAgICBjYXNl
IDE6Ci0gICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggKCBwY2lfY29uZl9yZWFkOCgwLCBi
LCBQQ0lfU0xPVChkZiksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQQ0lfRlVOQyhkZiksCisgICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggKCBw
Y2lfY29uZl9yZWFkOChQQ0lfU0JERjMoMCwgYiwgZGYpLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0hFQURFUl9UWVBFKSApCiAgICAgICAgICAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgICBjYXNlIFBDSV9IRUFERVJf
VFlQRV9CUklER0U6CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYwppbmRleCAwNDZiMWM2MTBlLi5jNDg4M2YxZDkxIDEwMDY0
NAotLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kv
aGVhZGVyLmMKQEAgLTQ2Myw4ICs0NjMsNyBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhzdHJ1Y3Qg
cGNpX2RldiAqcGRldikKICAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhcnMgPSBoZWFkZXItPmJhcnM7
CiAgICAgaW50IHJjOwogCi0gICAgc3dpdGNoICggcGNpX2NvbmZfcmVhZDgocGRldi0+c2VnLCBw
ZGV2LT5idXMsIHNsb3QsIGZ1bmMsIFBDSV9IRUFERVJfVFlQRSkKLSAgICAgICAgICAgICAmIDB4
N2YgKQorICAgIHN3aXRjaCAoIHBjaV9jb25mX3JlYWQ4KHBkZXYtPnNiZGYsIFBDSV9IRUFERVJf
VFlQRSkgJiAweDdmICkKICAgICB7CiAgICAgY2FzZSBQQ0lfSEVBREVSX1RZUEVfTk9STUFMOgog
ICAgICAgICBudW1fYmFycyA9IFBDSV9IRUFERVJfTk9STUFMX05SX0JBUlM7CmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCmluZGV4
IDRmMWY5NWFiNjkuLjkyOWVhNDliYmYgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCkBAIC0yMjIsOCArMjIyLDcgQEAgc3Rh
dGljIHVpbnQzMl90IHZwY2lfcmVhZF9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCBy
ZWcsCiAgICAgICAgICAqLwogICAgICAgICBpZiAoIHJlZyAmIDEgKQogICAgICAgICB7Ci0gICAg
ICAgICAgICBkYXRhID0gcGNpX2NvbmZfcmVhZDgoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRl
diwgc2JkZi5mdW5jLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyk7Cisg
ICAgICAgICAgICBkYXRhID0gcGNpX2NvbmZfcmVhZDgoc2JkZiwgcmVnKTsKICAgICAgICAgICAg
IGRhdGEgfD0gcGNpX2NvbmZfcmVhZDE2KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNi
ZGYuZnVuYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyArIDEpIDw8
IDg7CiAgICAgICAgIH0KQEAgLTIzMSw4ICsyMzAsNyBAQCBzdGF0aWMgdWludDMyX3QgdnBjaV9y
ZWFkX2h3KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywKICAgICAgICAgewogICAg
ICAgICAgICAgZGF0YSA9IHBjaV9jb25mX3JlYWQxNihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYu
ZGV2LCBzYmRmLmZ1bmMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyk7
Ci0gICAgICAgICAgICBkYXRhIHw9IHBjaV9jb25mX3JlYWQ4KHNiZGYuc2VnLCBzYmRmLmJ1cywg
c2JkZi5kZXYsIHNiZGYuZnVuYywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnICsgMikgPDwgMTY7CisgICAgICAgICAgICBkYXRhIHw9IHBjaV9jb25mX3JlYWQ4KHNiZGYs
IHJlZyArIDIpIDw8IDE2OwogICAgICAgICB9CiAgICAgICAgIGJyZWFrOwogCkBAIC0yNDEsNyAr
MjM5LDcgQEAgc3RhdGljIHVpbnQzMl90IHZwY2lfcmVhZF9odyhwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsCiAgICAgICAgIGJyZWFrOwogCiAgICAgY2FzZSAxOgotICAgICAgICBk
YXRhID0gcGNpX2NvbmZfcmVhZDgoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5m
dW5jLCByZWcpOworICAgICAgICBkYXRhID0gcGNpX2NvbmZfcmVhZDgoc2JkZiwgcmVnKTsKICAg
ICAgICAgYnJlYWs7CiAKICAgICBkZWZhdWx0OgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCmluZGV4IDExOGM3MDEzYzguLjg0NzZlOGU0
NmIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAorKysgYi94ZW4vaW5jbHVkZS94
ZW4vcGNpLmgKQEAgLTE3Miw5ICsxNzIsNyBAQCBzdHJ1Y3QgcGNpX2RldiAqcGNpX2dldF9wZGV2
X2J5X2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICosIGludCBzZWcsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgYnVzLCBpbnQgZGV2Zm4pOwogdm9pZCBwY2lf
Y2hlY2tfZGlzYWJsZV9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbik7CiAKLXVpbnQ4
X3QgcGNpX2NvbmZfcmVhZDgoCi0gICAgdW5zaWduZWQgaW50IHNlZywgdW5zaWduZWQgaW50IGJ1
cywgdW5zaWduZWQgaW50IGRldiwgdW5zaWduZWQgaW50IGZ1bmMsCi0gICAgdW5zaWduZWQgaW50
IHJlZyk7Cit1aW50OF90IHBjaV9jb25mX3JlYWQ4KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQg
aW50IHJlZyk7CiB1aW50MTZfdCBwY2lfY29uZl9yZWFkMTYoCiAgICAgdW5zaWduZWQgaW50IHNl
ZywgdW5zaWduZWQgaW50IGJ1cywgdW5zaWduZWQgaW50IGRldiwgdW5zaWduZWQgaW50IGZ1bmMs
CiAgICAgdW5zaWduZWQgaW50IHJlZyk7Ci0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
