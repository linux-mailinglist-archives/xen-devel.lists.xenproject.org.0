Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B495E74FCC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:41:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdxw-0008Vq-VO; Thu, 25 Jul 2019 13:39:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqdxv-0008VY-DR
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:39:27 +0000
X-Inumbo-ID: 9eb78409-aee1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9eb78409-aee1-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 13:39:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FRvNsKi2DiL7dPlV5f7wUcoQ3mwG1eVbRhn3b1+4mTpdODNOwgEo1bPY0zLslX9TP57pwntWN+
 aaXEiS/U5BnPyiDjfYnQaGm+Le7/vGLk+TXrFUiWAFKn30AYhReMd9MlIh3gGDiRjVBI8Xo+6Q
 ZXFmXIzEOTaYYnuEsgtBK+cbEAysB0J6I3EImOukcFR7hHPXJJ6JV3cwT17TluJdrNCrbzwa+P
 JC6JC/txfeAZ5nwC5d2XW2n5E/1f9uo6LIWhSktyCebFt9EOKA9RIEqd4Zv0uax847wEQKTBpn
 keY=
X-SBRS: 2.7
X-MesageID: 3420489
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3420489"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Jul 2019 14:39:17 +0100
Message-ID: <20190725133920.40673-4-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190725133920.40673-1-paul.durrant@citrix.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/6] x86/hvm/domain: remove the 'hap_enabled'
 flag
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGhhcF9lbmFibGVkKCkgbWFjcm8gY2FuIGRldGVybWluZSB3aGV0aGVyIHRoZSBmZWF0dXJl
IGlzIGF2YWlsYWJsZQp1c2luZyB0aGUgZG9tYWluICdvcHRpb25zJzsgdGhlcmUgaXMgbm8gbmVl
ZCBmb3IgYSBzZXBhcmF0ZSBmbGFnLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cgp2MjoKIC0gRGVmZXIgY2hhbmdlcyB0byBzaGFkb3dfZG9tYWluX2luaXQoKSB0byBw
YXRjaCAjNAotLS0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgIHwgNyArLS0tLS0t
CiB4ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMgICAgICAgICB8IDQgKystLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vZG9tYWluLmggfCA5ICsrKy0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9w
YWdpbmcuaCAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2Fy
Y2gveDg2L2RvbWFpbi5jCmluZGV4IGVhNTUxNjA4ODcuLjY1ZjQ3YTc2MjcgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAgLTU2
NCwxMiArNTY0LDcgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAog
ICAgIEhZUEVSVklTT1JfQ09NUEFUX1ZJUlRfU1RBUlQoZCkgPQogICAgICAgICBpc19wdl9kb21h
aW4oZCkgPyBfX0hZUEVSVklTT1JfQ09NUEFUX1ZJUlRfU1RBUlQgOiB+MHU7CiAKLSAgICAvKiBO
ZWVkIHRvIGRldGVybWluZSBpZiBIQVAgaXMgZW5hYmxlZCBiZWZvcmUgaW5pdGlhbGlzaW5nIHBh
Z2luZyAqLwotICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCi0gICAgICAgIGQtPmFyY2guaHZt
LmhhcF9lbmFibGVkID0KLSAgICAgICAgICAgIGh2bV9oYXBfc3VwcG9ydGVkKCkgJiYgKGNvbmZp
Zy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9oYXApOwotCi0gICAgaWYgKCAocmMgPSBwYWdpbmdf
ZG9tYWluX2luaXQoZCwgY29uZmlnLT5mbGFncykpICE9IDAgKQorICAgIGlmICggKHJjID0gcGFn
aW5nX2RvbWFpbl9pbml0KGQpKSAhPSAwICkKICAgICAgICAgZ290byBmYWlsOwogICAgIHBhZ2lu
Z19pbml0aWFsaXNlZCA9IHRydWU7CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wYWdp
bmcuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYwppbmRleCAwMTEwODkzNjhhLi4wOTdhMjdm
NjA4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKKysrIGIveGVuL2FyY2gv
eDg2L21tL3BhZ2luZy5jCkBAIC02MzIsNyArNjMyLDcgQEAgdm9pZCBwYWdpbmdfbG9nX2RpcnR5
X2luaXQoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGxvZ19kaXJ0eV9vcHMgKm9wcykK
IC8qICAgICAgICAgICBDT0RFIEZPUiBQQUdJTkcgU1VQUE9SVCAgICAgICAgICAgICovCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwogLyogRG9tYWlu
IHBhZ2luZyBzdHJ1Y3QgaW5pdGlhbGl6YXRpb24uICovCi1pbnQgcGFnaW5nX2RvbWFpbl9pbml0
KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBkb21jcl9mbGFncykKK2ludCBwYWdpbmdf
ZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBpbnQgcmM7CiAKQEAgLTY1Myw3
ICs2NTMsNyBAQCBpbnQgcGFnaW5nX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQsIHVuc2ln
bmVkIGludCBkb21jcl9mbGFncykKICAgICBpZiAoIGhhcF9lbmFibGVkKGQpICkKICAgICAgICAg
aGFwX2RvbWFpbl9pbml0KGQpOwogICAgIGVsc2UKLSAgICAgICAgcmMgPSBzaGFkb3dfZG9tYWlu
X2luaXQoZCwgZG9tY3JfZmxhZ3MpOworICAgICAgICByYyA9IHNoYWRvd19kb21haW5faW5pdChk
LCBkLT5vcHRpb25zKTsKIAogICAgIHJldHVybiByYzsKIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWlu
LmgKaW5kZXggNmM3YzRmNWFhNi4uNzg5N2UzNmI5NCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vZG9tYWluLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWlu
LmgKQEAgLTE1Niw3ICsxNTYsNiBAQCBzdHJ1Y3QgaHZtX2RvbWFpbiB7CiAKICAgICBzdHJ1Y3Qg
dmlyaWRpYW5fZG9tYWluICp2aXJpZGlhbjsKIAotICAgIGJvb2xfdCAgICAgICAgICAgICAgICAg
aGFwX2VuYWJsZWQ7CiAgICAgYm9vbF90ICAgICAgICAgICAgICAgICBtZW1fc2hhcmluZ19lbmFi
bGVkOwogICAgIGJvb2xfdCAgICAgICAgICAgICAgICAgcWVtdV9tYXBjYWNoZV9pbnZhbGlkYXRl
OwogICAgIGJvb2xfdCAgICAgICAgICAgICAgICAgaXNfczNfc3VzcGVuZGVkOwpAQCAtMTk1LDEx
ICsxOTQsOSBAQCBzdHJ1Y3QgaHZtX2RvbWFpbiB7CiAgICAgfTsKIH07CiAKLSNpZmRlZiBDT05G
SUdfSFZNCi0jZGVmaW5lIGhhcF9lbmFibGVkKGQpICAoaXNfaHZtX2RvbWFpbihkKSAmJiAoZCkt
PmFyY2guaHZtLmhhcF9lbmFibGVkKQotI2Vsc2UKLSNkZWZpbmUgaGFwX2VuYWJsZWQoZCkgICh7
KHZvaWQpKGQpOyBmYWxzZTt9KQotI2VuZGlmCisjZGVmaW5lIGhhcF9lbmFibGVkKGQpIFwKKyAg
ICAoaHZtX2hhcF9zdXBwb3J0ZWQoKSAmJiBpc19odm1fZG9tYWluKGQpICYmIFwKKyAgICAgZXZh
bHVhdGVfbm9zcGVjKGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl9oYXApKQogCiAjZW5kaWYg
LyogX19BU01fWDg2X0hWTV9ET01BSU5fSF9fICovCiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvcGFnaW5nLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2luZy5oCmluZGV4IGNm
NTdjYTcwOGQuLmFiNzg4N2YyM2MgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcGFn
aW5nLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdpbmcuaApAQCAtMjA3LDcgKzIwNyw3
IEBAIHZvaWQgcGFnaW5nX3ZjcHVfaW5pdChzdHJ1Y3QgdmNwdSAqdik7CiAKIC8qIFNldCB1cCB0
aGUgcGFnaW5nLWFzc2lzdGFuY2Utc3BlY2lmaWMgcGFydHMgb2YgYSBkb21haW4gc3RydWN0IGF0
CiAgKiBzdGFydCBvZiBkYXkuICBDYWxsZWQgZm9yIGV2ZXJ5IGRvbWFpbiBmcm9tIGFyY2hfZG9t
YWluX2NyZWF0ZSgpICovCi1pbnQgcGFnaW5nX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCBkb21jcl9mbGFncyk7CitpbnQgcGFnaW5nX2RvbWFpbl9pbml0KHN0cnVj
dCBkb21haW4gKmQpOwogCiAvKiBIYW5kbGVyIGZvciBwYWdpbmctY29udHJvbCBvcHM6IG9wZXJh
dGlvbnMgZnJvbSB1c2VyLXNwYWNlIHRvIGVuYWJsZQogICogYW5kIGRpc2FibGUgZXBoZW1lcmFs
IHNoYWRvdyBtb2RlcyAodGVzdCBtb2RlIGFuZCBsb2ctZGlydHkgbW9kZSkgYW5kCi0tIAoyLjIw
LjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
