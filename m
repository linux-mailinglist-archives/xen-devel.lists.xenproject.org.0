Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3337A4DA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:42:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsObH-0008NU-T8; Tue, 30 Jul 2019 09:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsObG-0008N1-HD
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:39:18 +0000
X-Inumbo-ID: e537dbf2-b2ad-11e9-b6e1-5fb48bb40884
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e537dbf2-b2ad-11e9-b6e1-5fb48bb40884;
 Tue, 30 Jul 2019 09:39:15 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AnsnNj0yynucRqQAoHQlayD+IHCVFWtaDLhzRrdYunYTo0Vs2tSCBs3eOaL3wm0Du9/ib9Q17b
 T6FYkyWLnSpiYXEGkxXVNmRTkrgJBVzRZbhXXxuKzTnywWiCyOnMKMy+i3QZDhbmeohWRghrPo
 JZcxJYyRhsMawtt753VvAjjemtQoFIo8couR5mTl2G2lawx6z6JdkuYWbRhL7QPKvnaeaZtDQY
 q5UPn3l+t6u8Rxoo9LxNA6OdnwaqY3I+fv0H4KN/IDOBl9n9qeT9teeMpEOdlbqCOTpSHwXpc+
 xDE=
X-SBRS: 2.7
X-MesageID: 3748701
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3748701"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 10:39:04 +0100
Message-ID: <20190730093904.1794-6-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190730093904.1794-1-paul.durrant@citrix.com>
References: <20190730093904.1794-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 5/5] x86/domain: remove the 's3_integrity'
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

VGhlIGZsYWcgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUgZG9tYWluICdvcHRpb25zJyBjYW4gbm93
IGJlIHRlc3RlZApkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgoKdjM6CiAtIEFsc28gc2FuaXRpc2UgdGhlIGZsYWcgYWdhaW5zdCBDT05G
SUdfVEJPT1QgYmVpbmcgc2V0Ci0tLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICB8IDkg
KysrKysrKy0tCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgIHwgMiArLQogeGVuL2FyY2gv
eDg2L3Rib290LmMgICAgICAgICB8IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgg
fCAyIC0tCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWlu
LmMKaW5kZXggMGY0M2RhM2I2YS4uMTVhY2U3ZGY3MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtNDY2LDYgKzQ2NiwxMyBA
QCBpbnQgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0
ZWRvbWFpbiAqY29uZmlnKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAKKyAgICBp
ZiAoIChjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5KSAmJgorICAg
ICAgICAgIUlTX0VOQUJMRUQoVEJPT1QpICkKKyAgICB7CisgICAgICAgIGRwcmludGsoWEVOTE9H
X0lORk8sICJTMyBpbnRlZ3JpdHkgY2hlY2sgbm90IHZhbGlkIHdpdGhvdXQgQ09ORklHX1RCT09U
XG4iKTsKKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgfQorCiAgICAgcmV0dXJuIDA7CiB9
CiAKQEAgLTU0NCw4ICs1NTEsNiBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21h
aW4gKmQsCiAgICAgICAgICAgICAgICBkLT5kb21haW5faWQpOwogICAgIH0KIAotICAgIGQtPmFy
Y2guczNfaW50ZWdyaXR5ID0gY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX3MzX2ludGVn
cml0eTsKLQogICAgIGVtZmxhZ3MgPSBjb25maWctPmFyY2guZW11bGF0aW9uX2ZsYWdzOwogCiAg
ICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgaXNfcHZfZG9tYWluKGQpICkKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXgg
ZDIwMTE5MTBmYS4uZmRkMWYyYjQ4OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMK
KysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTY4OSw3ICs2ODksNyBAQCB2b2lkIF9faW5p
dCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgICAgICAuc3Rv
cF9iaXRzID0gMQogICAgIH07CiAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGRv
bTBfY2ZnID0gewotICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NERl9zM19pbnRlZ3JpdHks
CisgICAgICAgIC5mbGFncyA9IElTX0VOQUJMRUQoVEJPT1QpID8gWEVOX0RPTUNUTF9DREZfczNf
aW50ZWdyaXR5IDogMCwKICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLAogICAgICAgICAu
bWF4X2dyYW50X2ZyYW1lcyA9IG9wdF9tYXhfZ3JhbnRfZnJhbWVzLAogICAgICAgICAubWF4X21h
cHRyYWNrX2ZyYW1lcyA9IG9wdF9tYXhfbWFwdHJhY2tfZnJhbWVzLApkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L3Rib290LmMgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwppbmRleCBmM2ZkZWU0ZDM5
Li4zZGI4YThhOGQ4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGJvb3QuYworKysgYi94ZW4v
YXJjaC94ODYvdGJvb3QuYwpAQCAtMjEyLDcgKzIxMiw3IEBAIHN0YXRpYyB2b2lkIHRib290X2dl
bl9kb21haW5faW50ZWdyaXR5KGNvbnN0IHVpbnQ4X3Qga2V5W1RCX0tFWV9TSVpFXSwKICAgICB2
bWFjX3NldF9rZXkoKHVpbnQ4X3QgKilrZXksICZjdHgpOwogICAgIGZvcl9lYWNoX2RvbWFpbigg
ZCApCiAgICAgewotICAgICAgICBpZiAoICFkLT5hcmNoLnMzX2ludGVncml0eSApCisgICAgICAg
IGlmICggIShkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5KSApCiAgICAg
ICAgICAgICBjb250aW51ZTsKICAgICAgICAgcHJpbnRrKCJNQUNpbmcgRG9tYWluICV1XG4iLCBk
LT5kb21haW5faWQpOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCA1Zjk4OTk0NjljLi41YzAzOGEx
MDY1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvZG9tYWluLmgKQEAgLTI5NSw4ICsyOTUsNiBAQCBzdHJ1Y3QgYXJjaF9k
b21haW4KICAgICB1aW50MzJfdCBwY2lfY2Y4OwogICAgIHVpbnQ4X3QgY21vc19pZHg7CiAKLSAg
ICBib29sX3QgczNfaW50ZWdyaXR5OwotCiAgICAgdW5pb24gewogICAgICAgICBzdHJ1Y3QgcHZf
ZG9tYWluIHB2OwogICAgICAgICBzdHJ1Y3QgaHZtX2RvbWFpbiBodm07Ci0tIAoyLjIwLjEuMi5n
YjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
