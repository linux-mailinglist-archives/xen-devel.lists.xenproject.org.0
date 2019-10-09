Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AAD0A00
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 10:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI7Po-0007v0-U7; Wed, 09 Oct 2019 08:33:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LyQK=YC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iI7Pn-0007uv-Je
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 08:33:47 +0000
X-Inumbo-ID: 826b6364-ea6f-11e9-80e3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 826b6364-ea6f-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570610026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6A1sQGAniOlPZhUjO1yap2vKJ5ys/ILjqGXAJosKfSM=;
 b=bVxJrnRdGwCCTJubSKmyC5hZetxMoNignK3yxjNMbPBDk7UV2g1uRxZ4
 bnsAW0CGYEB6yzQHxGlAZN7VUe5RaEplyZPCRQx/WRbuDy+XdrryvwHin
 eXecNmFsNtWLdZ3V3E4LF+22tzFqnlOOhrr0jCqRCWTy5vWJHvi1hXixC E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D1681cwg//u3uqcvvkZ5BoVUtdyIk8bnghMrwlHD2BXUGLob4dfFboo1DqDfgcNbCkhTSQFBv3
 0+8SmRwM8EvhQxIahEZwu5H/dWoV4l84DmQsLMM0tYm6vH356rqzmfSFByzdKSy1hy59rQ5Tjq
 4g7wySHQ2K6c9Qy8peY1j/PT5VxULtao9JbmLLGhXFA4aVpWigkSl72Ef2WhGDm5CJPubCcR+O
 RhPoSVOBRUDo7c7E2fd7YQzEmNYtC+d17WPw6zUDLOfqWYBdJxB4HzqvxCsYhQvwYECUhHSoYX
 oEw=
X-SBRS: 2.7
X-MesageID: 6909076
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,273,1566878400"; 
   d="scan'208";a="6909076"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 9 Oct 2019 10:33:21 +0200
Message-ID: <20191009083321.1743-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] pci: clear {host/guest}_maskall field on
 assign
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Spassov,
 Stanislav" <stanspas@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaG9zdF9tYXNrYWxsIG1ha2VzIGl0IHN0aWNr
eSBhY3Jvc3MKYXNzaWduIGFuZCBkZWFzc2lnbiBjYWxscywgd2hpY2ggbWVhbnMgdGhhdCBvbmNl
IGEgZ3Vlc3QgZm9yY2VzIFhlbiB0bwpzZXQgaG9zdF9tYXNrYWxsIHRoZSBtYXNrYWxsIGJpdCBp
cyBub3QgZ29pbmcgdG8gYmUgY2xlYXJlZCB1bnRpbCBhCmNhbGwgdG8gUEhZU0RFVk9QX3ByZXBh
cmVfbXNpeCBpcyBwZXJmb3JtZWQuIFN1Y2ggY2FsbCBob3dldmVyCnNob3VsZG4ndCBiZSBwYXJ0
IG9mIHRoZSBub3JtYWwgZmxvdyB3aGVuIGRvaW5nIFBDSSBwYXNzdGhyb3VnaCwgYW5kCmhlbmNl
IHRoZSBmbGFnIG5lZWRzIHRvIGJlIGNsZWFyZWQgd2hlbiBhc3NpZ25pbmcgaW4gb3JkZXIgdG8g
cHJldmVudApob3N0X21hc2thbGwgYmVpbmcgY2FycmllZCBvdmVyIGZyb20gcHJldmlvdXMgYXNz
aWduYXRpb25zLgoKTm90ZSB0aGF0IHRoZSBlbnRyeSBtYXNrYml0IGlzIHJlc2V0IHdoZW4gdGhl
IG1zaXggY2FwYWJpbGl0eSBpcwppbml0aWFsaXplZCwgYW5kIHRoZSBndWVzdF9tYXNrYWxsIGZp
ZWxkIGlzIGFsc28gY2xlYXJlZCBzbyB0aGF0IHRoZQpoYXJkd2FyZSB2YWx1ZSBtYXRjaGVzIFhl
bidzIGludGVybmFsIHN0YXRlIChoYXJkd2FyZSBtYXNrYWxsID0KaG9zdF9tYXNrYWxsIHzCoGd1
ZXN0X21hc2thbGwpLgoKQWxzbyBub3RlIHRoYXQgZG9pbmcgdGhlIHJlc2V0IG9mIGhvc3RfbWFz
a2FsbCB0aGVyZSB3b3VsZCBhbGxvdyB0aGUKZ3Vlc3QgdG8gcmVzZXQgc3VjaCBmaWVsZCBieSBl
bmFibGluZyBhbmQgZGlzYWJsaW5nIE1TSVgsIHdoaWNoIGlzIG5vdAppbnRlbmRlZC4KClNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6
IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CkNjOiAiU3Bhc3NvdiwgU3RhbmlzbGF2IiA8
c3RhbnNwYXNAYW1hem9uLmRlPgpDYzogUGFzaSBLw6Rya2vDpGluZW4gPHBhc2lrQGlraS5maT4K
LS0tCkNoYW8sIFN0YW5pc2xhdiwgY2FuIHlvdSBwbGVhc2UgY2hlY2sgaWYgdGhpcyBwYXRjaCBm
aXhlcyB5b3VyCmlzc3Vlcz8KLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIEFsc28gc2V0IGd1ZXN0
X21hc2thbGwuCiAtIFBsYWNlIHRoZSBjb2RlIGluIGEgaGVscGVyIGZ1bmN0aW9uIGluIHg4Ni9t
c2kuYwogLSBBZGQgYSBjb21tZW50IHRvIGRlc2NyaWJlIHRoZSBleHBlY3RlZCBzdGF0ZS4KIC0g
VGVzdCB0aGF0IG1hc2thbGwgaXMgbm90IHNldCBvbiBoYXJkd2FyZS4KLS0tCiB4ZW4vYXJjaC94
ODYvbXNpLmMgICAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgIDUgKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvbXNp
LmggICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21zaS5jIGIveGVuL2FyY2gveDg2L21zaS5jCmluZGV4IDc2ZDQw
MzRjNGYuLmMyMzlhMDBmYjEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tc2kuYworKysgYi94
ZW4vYXJjaC94ODYvbXNpLmMKQEAgLTEyNDksNiArMTI0OSwyOCBAQCB2b2lkIHBjaV9jbGVhbnVw
X21zaShzdHJ1Y3QgcGNpX2RldiAqcGRldikKICAgICBtc2lfZnJlZV9pcnFzKHBkZXYpOwogfQog
CitpbnQgcGNpX3Jlc2V0X21zaXhfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCit7CisgICAg
dW5zaWduZWQgaW50IHBvcyA9IHBjaV9maW5kX2NhcF9vZmZzZXQocGRldi0+c2VnLCBwZGV2LT5i
dXMsIHBkZXYtPnNiZGYuZGV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBkZXYtPnNiZGYuZm4sIFBDSV9DQVBfSURfTVNJWCk7CisKKyAgICBBU1NFUlQocG9z
KTsKKyAgICAvKgorICAgICAqIFhlbiBleHBlY3RzIHRoZSBkZXZpY2Ugc3RhdGUgdG8gYmUgdGhl
IGFmdGVyIHJlc2V0IG9uZSwgYW5kIGhlbmNlCisgICAgICogaG9zdF9tYXNrYWxsID0gZ3Vlc3Rf
bWFza2FsbCA9IGZhbHNlIGFuZCBhbGwgZW50cmllcyBzaG91bGQgaGF2ZSB0aGUKKyAgICAgKiBt
YXNrIGJpdCBzZXQuIFRlc3QgdGhhdCB0aGUgbWFza2FsbCBiaXQgaXMgbm90IHNldCwgaGF2aW5n
IGl0IHNldCBjb3VsZAorICAgICAqIHNpZ25hbCB0aGF0IHRoZSBkZXZpY2UgaGFzbid0IGJlZW4g
cmVzZXQgcHJvcGVybHkuCisgICAgICovCisgICAgaWYgKCBwY2lfY29uZl9yZWFkMTYocGRldi0+
c2JkZiwgbXNpeF9jb250cm9sX3JlZyhwb3MpKSAmCisgICAgICAgICBQQ0lfTVNJWF9GTEFHU19N
QVNLQUxMICkKKyAgICAgICAgcmV0dXJuIC1FQlVTWTsKKworICAgIHBkZXYtPm1zaXgtPmhvc3Rf
bWFza2FsbCA9IGZhbHNlOworICAgIHBkZXYtPm1zaXgtPmd1ZXN0X21hc2thbGwgPSBmYWxzZTsK
KworICAgIHJldHVybiAwOworfQorCiBpbnQgcGNpX21zaV9jb25mX3dyaXRlX2ludGVyY2VwdChz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzaXplLCB1aW50MzJfdCAqZGF0YSkKIHsKZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmMKaW5kZXggOTBjY2I4MzcwYi4uYmRjYzQ4MmQ4MSAxMDA2NDQKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMKQEAgLTE1MDUsNyArMTUwNSwxMiBAQCBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uo
c3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwgdTMyIGZsYWcpCiAg
ICAgfQogCiAgICAgaWYgKCBwZGV2LT5tc2l4ICkKKyAgICB7CisgICAgICAgIHJjID0gcGNpX3Jl
c2V0X21zaXhfc3RhdGUocGRldik7CisgICAgICAgIGlmICggcmMgKQorICAgICAgICAgICAgZ290
byBkb25lOwogICAgICAgICBtc2l4dGJsX2luaXQoZCk7CisgICAgfQogCiAgICAgcGRldi0+ZmF1
bHQuY291bnQgPSAwOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21zaS5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9tc2kuaAppbmRleCBkMGIwMDQ1ZDBkLi42ZTM1NzEzZWM3IDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21zaS5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbXNpLmgKQEAgLTkyLDYgKzkyLDcgQEAgZXh0ZXJuIGludCBfX3NldHVwX21zaV9pcnEo
c3RydWN0IGlycV9kZXNjICosIHN0cnVjdCBtc2lfZGVzYyAqLAogZXh0ZXJuIHZvaWQgdGVhcmRv
d25fbXNpX2lycShpbnQgaXJxKTsKIGV4dGVybiBpbnQgbXNpX2ZyZWVfdmVjdG9yKHN0cnVjdCBt
c2lfZGVzYyAqZW50cnkpOwogZXh0ZXJuIGludCBwY2lfcmVzdG9yZV9tc2lfc3RhdGUoc3RydWN0
IHBjaV9kZXYgKnBkZXYpOworZXh0ZXJuIGludCBwY2lfcmVzZXRfbXNpeF9zdGF0ZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldik7CiAKIHN0cnVjdCBtc2lfZGVzYyB7CiAJc3RydWN0IG1zaV9hdHRyaWIg
ewotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
