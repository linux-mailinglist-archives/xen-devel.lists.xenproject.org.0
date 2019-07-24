Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5CC735C6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 19:46:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqLIH-0007ly-VY; Wed, 24 Jul 2019 17:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ItzJ=VV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hqLIG-0007lP-Ag
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 17:43:12 +0000
X-Inumbo-ID: 7f6a1348-ae3a-11e9-982c-a73c5ac53a78
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f6a1348-ae3a-11e9-982c-a73c5ac53a78;
 Wed, 24 Jul 2019 17:43:08 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v7Ms+EyEfea2oxGN5QbO6fjXG7JdIH1aLDupw5c5rDLgxk6csQfyixPsIvxJSBwVosh6iyHINj
 MXNlvIh6sv9v4m+bg+9nIvbs5ymCR2gP61V3mGptQJzxhKofL4VlDreulwHGdTcB9d4P11aCHd
 IQUHPmC7nI4XvILjDj+sUppG+dhQoTXhvchH3Egog7XLXI1f/kX7dWG0nU72GrkwVl8MTTjy+M
 4CGpmsM2+SLvJyDLRArsCv8bIo0W6VHCvQDp3fW/HHchzFlclPn6nkxaPExuzUBgznByrcIr0J
 UGo=
X-SBRS: 2.7
X-MesageID: 3383300
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3383300"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 24 Jul 2019 18:42:54 +0100
Message-ID: <20190724174256.5295-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190724174256.5295-1-andrew.cooper3@citrix.com>
References: <20190724174256.5295-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] x86: Drop CONFIG_ACPI_SLEEP
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBvcHRpb24gaXMgaGFyZGNvZGVkIHRvIDEsIGFuZCB0aGUgI2lmZGVmLWFyeSBkb2Vzbid0
IGV4Y2x1ZGUgd2FrZXVwLlMsCndoaWNoIG1ha2VzIGl0IHVzZWxlc3MgY29kZSBub2lzZS4KClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQW4gYWx0
ZXJuYXRpdmUgd291bGQgYmUgdG8gd2lyZSBpdCBpbnRvIEtjb25maWcgcHJvcGVybHkgYW5kIHBy
b3Blcmx5IGV4Y2x1ZGUKd2FrZXVwLlMsIGJ1dCB0aGF0IGlzIG1vcmUgY29tcGxpY2F0ZWQgdGhh
biBJIGhhdmUgdGltZSBmb3IuICBUaG91Z2h0cz8KLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9ib290
LmMgICAgIHwgNCAtLS0tCiB4ZW4vYXJjaC94ODYvZG1pX3NjYW4uYyAgICAgIHwgNyArKy0tLS0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2FjcGkuaCAgIHwgNCAtLS0tCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2NvbmZpZy5oIHwgMSAtCiA0IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvYm9vdC5jIGIveGVu
L2FyY2gveDg2L2FjcGkvYm9vdC5jCmluZGV4IDEzODJiNGRjZDAuLjE1NTQyYTliZGYgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2Jvb3QuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9i
b290LmMKQEAgLTMzMiw3ICszMzIsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX2ludmFsaWRh
dGVfYmdydChzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlKQogCXJldHVybiAwOwogfQog
Ci0jaWZkZWYgQ09ORklHX0FDUElfU0xFRVAKICNkZWZpbmUgYWNwaV9mYWR0X2NvcHlfYWRkcmVz
cyhkc3QsIHNyYywgbGVuKSBkbyB7CQkJXAogCWlmIChmYWR0LT5oZWFkZXIucmV2aXNpb24gPj0g
RkFEVDJfUkVWSVNJT05fSUQgJiYJCVwKIAkgICAgZmFkdC0+aGVhZGVyLmxlbmd0aCA+PSBBQ1BJ
X0ZBRFRfVjJfU0laRSkJCQlcCkBAIC00NTcsNyArNDU2LDYgQEAgYWNwaV9mYWR0X3BhcnNlX3Ns
ZWVwX2luZm8oc3RydWN0IGFjcGlfdGFibGVfZmFkdCAqZmFkdCkKIAltZW1zZXQoJmFjcGlfc2lu
Zm8uc2xlZXBfc3RhdHVzICsgMSwgMCwKIAkgICAgICAgKGxvbmcpKCZhY3BpX3NpbmZvICsgMSkg
LSAobG9uZykoJmFjcGlfc2luZm8uc2xlZXBfc3RhdHVzICsgMSkpOwogfQotI2VuZGlmCiAKIHN0
YXRpYyBpbnQgX19pbml0IGFjcGlfcGFyc2VfZmFkdChzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIg
KnRhYmxlKQogewpAQCAtNTAxLDkgKzQ5OSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFjcGlfcGFy
c2VfZmFkdChzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlKQogCWFjcGlfZW5hYmxlX3Zh
bHVlICA9IGZhZHQtPmFjcGlfZW5hYmxlOwogCWFjcGlfZGlzYWJsZV92YWx1ZSA9IGZhZHQtPmFj
cGlfZGlzYWJsZTsKIAotI2lmZGVmIENPTkZJR19BQ1BJX1NMRUVQCiAJYWNwaV9mYWR0X3BhcnNl
X3NsZWVwX2luZm8oZmFkdCk7Ci0jZW5kaWYKIAogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2RtaV9zY2FuLmMgYi94ZW4vYXJjaC94ODYvZG1pX3NjYW4uYwppbmRleCAz
MWNhYWQxMzNlLi43MDYzYzJjNzk5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG1pX3NjYW4u
YworKysgYi94ZW4vYXJjaC94ODYvZG1pX3NjYW4uYwpAQCAtNDg4LDE0ICs0ODgsMTIgQEAgc3Rh
dGljIGludCBfX2luaXQgaWNoMTBfYmlvc19xdWlyayhzdHJ1Y3QgZG1pX3N5c3RlbV9pZCAqZCkK
ICAgICByZXR1cm4gMDsKIH0KIAotI2lmZGVmIENPTkZJR19BQ1BJX1NMRUVQCiBzdGF0aWMgX19p
bml0IGludCByZXNldF92aWRlb21vZGVfYWZ0ZXJfczMoc3RydWN0IGRtaV9ibGFja2xpc3QgKmQp
CiB7Ci0JLyogU2VlIGFjcGlfd2FrZXVwLlMgKi8KKwkvKiBTZWUgd2FrZXVwLlMgKi8KIAlhY3Bp
X3ZpZGVvX2ZsYWdzIHw9IDI7CiAJcmV0dXJuIDA7CiB9Ci0jZW5kaWYKIAogc3RhdGljIF9faW5p
dCBpbnQgZG1pX2Rpc2FibGVfYWNwaShzdHJ1Y3QgZG1pX2JsYWNrbGlzdCAqZCkgCiB7IApAQCAt
NTQxLDEyICs1MzksMTEgQEAgc3RhdGljIF9faW5pdGRhdGEgc3RydWN0IGRtaV9ibGFja2xpc3Qg
ZG1pX2JsYWNrbGlzdFtdPXsKIAkJCU1BVENIKERNSV9QUk9EVUNUX05BTUUsICJTNDAzMENEVC80
LjMiKSwKIAkJCU5PX01BVENILCBOT19NQVRDSCwgTk9fTUFUQ0gKIAkJCX0gfSwKLSNpZmRlZiBD
T05GSUdfQUNQSV9TTEVFUAorCiAJeyByZXNldF92aWRlb21vZGVfYWZ0ZXJfczMsICJUb3NoaWJh
IFNhdGVsbGl0ZSA0MDMwY2R0IiwgeyAvKiBSZXNldCB2aWRlbyBtb2RlIGFmdGVyIHJldHVybmlu
ZyBmcm9tIEFDUEkgUzMgc2xlZXAgKi8KIAkJCU1BVENIKERNSV9QUk9EVUNUX05BTUUsICJTNDAz
MENEVC80LjMiKSwKIAkJCU5PX01BVENILCBOT19NQVRDSCwgTk9fTUFUQ0gKIAkJCX0gfSwKLSNl
bmRpZgogCiAJeyBpY2gxMF9iaW9zX3F1aXJrLCAiSW50ZWwgYm9hcmQgJiBCSU9TIiwKIAkJLyoK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYWNwaS5oIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9hY3BpLmgKaW5kZXggYTEwNWQxMTg2Yy4uNzAzMmYzYTAwMSAxMDA2NDQKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9hY3BpLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hY3BpLmgK
QEAgLTEwNSw4ICsxMDUsNiBAQCBleHRlcm4gczggYWNwaV9udW1hOwogZXh0ZXJuIGludCBhY3Bp
X3NjYW5fbm9kZXModTY0IHN0YXJ0LCB1NjQgZW5kKTsKICNkZWZpbmUgTlJfTk9ERV9NRU1CTEtT
IChNQVhfTlVNTk9ERVMqMikKIAotI2lmZGVmIENPTkZJR19BQ1BJX1NMRUVQCi0KIGV4dGVybiBz
dHJ1Y3QgYWNwaV9zbGVlcF9pbmZvIGFjcGlfc2luZm87CiAjZGVmaW5lIGFjcGlfdmlkZW9fZmxh
Z3MgYm9vdHN5bSh2aWRlb19mbGFncykKIHN0cnVjdCB4ZW5wZl9lbnRlcl9hY3BpX3NsZWVwOwpA
QCAtMTM0LDggKzEzMiw2IEBAIHN0cnVjdCBhY3BpX3NsZWVwX2luZm8gewogICAgIGJvb2xfdCBz
bGVlcF9leHRlbmRlZDsKIH07CiAKLSNlbmRpZiAvKiBDT05GSUdfQUNQSV9TTEVFUCAqLwotCiAj
ZGVmaW5lIE1BWF9NQURUX0VOVFJJRVMJTUFYKDI1NiwgMiAqIE5SX0NQVVMpCiBleHRlcm4gdTMy
IHg4Nl9hY3BpaWRfdG9fYXBpY2lkW107CiAjZGVmaW5lIE1BWF9MT0NBTF9BUElDCQlNQVgoMjU2
LCA0ICogTlJfQ1BVUykKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5oCmluZGV4IDllZjlkMDNjYTcuLjZlNGYyOGQ5
MzQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9jb25maWcuaApAQCAtMzQsNyArMzQsNiBAQAogLyogSW50ZWwgUDQgY3Vy
cmVudGx5IGhhcyBsYXJnZXN0IGNhY2hlIGxpbmUgKEwyIGxpbmUgc2l6ZSBpcyAxMjggYnl0ZXMp
LiAqLwogI2RlZmluZSBDT05GSUdfWDg2X0wxX0NBQ0hFX1NISUZUIDcKIAotI2RlZmluZSBDT05G
SUdfQUNQSV9TTEVFUCAxCiAjZGVmaW5lIENPTkZJR19BQ1BJX05VTUEgMQogI2RlZmluZSBDT05G
SUdfQUNQSV9TUkFUIDEKICNkZWZpbmUgQ09ORklHX0FDUElfQ1NUQVRFIDEKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
