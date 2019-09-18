Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD28B619D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:44:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXOk-0002cP-RR; Wed, 18 Sep 2019 10:41:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cE4e=XN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iAXOj-0002bh-0d
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:41:21 +0000
X-Inumbo-ID: d7b708d4-da00-11e9-962b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7b708d4-da00-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568803277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LlUN1gxgESchk+0In5K67LWUiZmd1TPTJsdj/dMBxnY=;
 b=ZkRVDxWvoVOs6lqWYVBN+vbqkneiXBiRmHlCtDX/aaN62V3ED67Tti2T
 CfrMkzhhYWC2AJ1ZRdDFVqDo/8DosIfrqnzQz05xz8b6FosDmgzI1qEzG
 koJbE3so3fAd7dCHyYY0hAlGcLxuwdaLLbBui/RexCulLsf/65dhlYrKz o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xnDSIg8zLZn4hBDu1+0OoQBlbbUuVblMc+IIw5u9feJbBLcOUImQDp71Yl1ln8KWVJJqpm361M
 bFcdjp0hdw0KB98TKF1LvanMqykhPLrMA2YmWFgzRaab9vZnqIZISfiULNAicetMsgczsw09U5
 pHH+4+zZGeoADjgPjWvcj1UTbVNfok/zO1WS4abpfiCC81ykmiBT2myZszuGx+BP03wbV7+RtI
 w8mzyja4HC0VSnWwtdnBShY2473qCJrzAhAKgzRtdAqpoevVn17GCbtfKdEAyyfzOW/ZEzM1/+
 NVc=
X-SBRS: 2.7
X-MesageID: 5973465
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5973465"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Sep 2019 11:41:09 +0100
Message-ID: <20190918104113.3294-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIHRoZSByZW1haW5pbmcgdW5jb21taXR0ZWQgcGF0Y2hlcyBmcm9tIG15IHByZXZp
b3VzIHNlcmllczoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMTIwOC5odG1sCgpUaGUgb25seSBwYXRjaCB0aGF0IGhhcyBi
ZWVuIHJldmlzZWQgaXMgcGF0Y2ggIzQgKHByZXZpb3VzbHkgcGF0Y2ggIzYpLgoKSWFuIEphY2tz
b24gKDEpOgogIHRvb2xzL29jYW1sOiBhYmkgY2hlY2s6IENvcGUgd2l0aCBjb25zZWN1dGl2ZSBy
ZWxldmFudCBlbnVtcwoKUGF1bCBEdXJyYW50ICgzKToKICByZW1vdmUgbGF0ZSAob24tZGVtYW5k
KSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMKICBpb21tdTogdGlkeSB1cCBpb21t
dV91c2VfaGFwX3B0KCkgYW5kIG5lZWRfaW9tbXVfcHRfc3luYygpIG1hY3JvcwogIGludHJvZHVj
ZSBhICdwYXNzdGhyb3VnaCcgY29uZmlndXJhdGlvbiBvcHRpb24gdG8geGwuY2ZnLi4uCgogZG9j
cy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAgICAgICAgICB8ICA1NyArKysrKysrKysKIHRvb2xz
L2xpYnhsL2xpYnhsLmggICAgICAgICAgICAgICAgICAgfCAgMTYgKysrCiB0b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyAgICAgICAgICAgIHwgIDMwICsrKystCiB0b29scy9saWJ4bC9saWJ4bF9t
ZW0uYyAgICAgICAgICAgICAgIHwgICA2ICstCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwg
ICAgICAgICAgIHwgICA5ICsrCiB0b29scy9saWJ4bC9saWJ4bF91dGlscy5jICAgICAgICAgICAg
IHwgIDE1ICsrKwogdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuaCAgICAgICAgICAgICB8ICAgMSAr
CiB0b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjayAgICAgICAgIHwgIDE3ICstLQogdG9vbHMv
b2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICAgICAgICB8ICAgNCArCiB0b29scy9vY2FtbC9saWJz
L3hjL3hlbmN0cmwubWxpICAgICAgIHwgICA1ICsKIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jICAgfCAgMTcgKystCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgICAgICAg
ICAgIHwgMTc4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9hcmNoL2FybS9kb21haW4uYyAgICAgICAg
ICAgICAgICAgfCAgMTAgKy0KIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAgICAgICAgICAgICAg
fCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgICAgICAgICAgfCAgIDIgKy0K
IHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNo
L3g4Ni9odm0vbXRyci5jICAgICAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9hcmNoL3g4Ni9tbS9t
ZW1fc2hhcmluZy5jICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAg
ICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYyAgICAgICAgICAg
ICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyAgICAgICAgICAgICAgfCAgIDIg
Ky0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgICAgICAgfCAgIDcgKwogeGVuL2Nv
bW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgICAgICB8ICAxMyAtLQogeGVuL2NvbW1vbi9tZW1v
cnkuYyAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2NvbW1vbi92bV9ldmVudC5jICAg
ICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZyAg
ICAgICB8ICAgMyArCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jIHwgIDEx
IC0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jICAgICAgIHwgMTQ3ICsrKysrKy0t
LS0tLS0tLS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgICB8ICAx
MiAtLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICB8ICAxMCArLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICB8ICA5NyAtLS0tLS0tLS0tLS0tLQog
eGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oICAgICAgICAgICB8ICAgMyAtCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2lvbW11LmggICAgICAgICAgIHwgICA0IC0KIHhlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaCAgICAgICAgICAgfCAgMTAgKy0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAg
ICAgICAgICAgfCAgNDAgKysrLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAg
ICAgIHwgICA4IC0tCiAzNyBmaWxlcyBjaGFuZ2VkLCAzODggaW5zZXJ0aW9ucygrKSwgMzcwIGRl
bGV0aW9ucygtKQotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IERh
dmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4K
Q2M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CkNjOiAiUm9n
ZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBWb2xvZHlteXIg
QmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
