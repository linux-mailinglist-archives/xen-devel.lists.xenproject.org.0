Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A7971C8E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:09:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxIx-0001St-TM; Tue, 23 Jul 2019 16:06:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTna=VU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpxIw-0001RO-9x
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:06:18 +0000
X-Inumbo-ID: ccfb6b9c-ad63-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ccfb6b9c-ad63-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 16:06:16 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Jezki6YgTBGUF0IGnguhCbQm9oarsjF/EwH5kXBkSq5mnskjog/Q0wnF4Tt1Vs/YUQicRCUfh/
 2/5wlciElefgKebQW+Wes20lE4e16WqU4NoZ3s+wqujdHwyq9bb56IQoPoL2N7gZAokqT8mt88
 fckeZd6c4slBoSYKVkS9j7jXkrz5Jd5bK3Wo2U05XxdugzGE/mHZmctcJTUSjTcmQsx5e+LYS3
 XSRhUqgW2w4mt3izO+PiilGaMZfXiZWg65cBZS6dQ+S7Y/vLEZfoN7PRmLdHqYnK6pU4+p2Ssw
 tpE=
X-SBRS: 2.7
X-MesageID: 3410783
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3410783"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:06:08 +0100
Message-ID: <20190723160609.2177-6-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190723160609.2177-1-paul.durrant@citrix.com>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/6] domain: remove the 'is_xenstore' flag
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
 Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgY29udmVuaWVuY2UgbWFjcm8sIGlzX3hlbnN0b3JlX2Rv
bWFpbigpLCB3aGljaAp0ZXN0cyB0aGUgZG9tYWluICdjcmVhdGVmbGFncycgZGlyZWN0bHkgYW5k
IHRoZW4gdXNlcyB0aGF0IGluIHBsYWNlIG9mCnRoZSAnaXNfeGVuc3RvcmUnIGZsYWcuCgpTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Q2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8u
bnNhLmdvdj4KLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICB8IDUgKy0tLS0KIHhlbi9jb21t
b24vZG9tY3RsLmMgICAgIHwgMiArLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA3ICsrKysr
LS0KIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21h
aW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggNmY0MDVkMjU0MS4uNTcwM2RhMzU3ZiAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5j
CkBAIC00MjksMTEgKzQyOSw4IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRf
dCBkb21pZCwKICAgICAgICAgd2F0Y2hkb2dfZG9tYWluX2luaXQoZCk7CiAgICAgICAgIGluaXRf
c3RhdHVzIHw9IElOSVRfd2F0Y2hkb2c7CiAKLSAgICAgICAgaWYgKCBkLT5jcmVhdGVmbGFncyAm
IFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbiApCi0gICAgICAgIHsKLSAgICAgICAgICAgIGQtPmlz
X3hlbnN0b3JlID0gMTsKKyAgICAgICAgaWYgKCBpc194ZW5zdG9yZV9kb21haW4oZCkgKQogICAg
ICAgICAgICAgZC0+ZGlzYWJsZV9taWdyYXRlID0gMTsKLSAgICAgICAgfQogCiAgICAgICAgIGQt
PmlvbWVtX2NhcHMgPSByYW5nZXNldF9uZXcoZCwgIkkvTyBNZW1vcnkiLCBSQU5HRVNFVEZfcHJl
dHR5cHJpbnRfaGV4KTsKICAgICAgICAgZC0+aXJxX2NhcHMgICA9IHJhbmdlc2V0X25ldyhkLCAi
SW50ZXJydXB0cyIsIDApOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9j
b21tb24vZG9tY3RsLmMKaW5kZXggZWY2NzE0YzBhYS4uZjJiNTgyODEyYyAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9kb21jdGwuYworKysgYi94ZW4vY29tbW9uL2RvbWN0bC5jCkBAIC0xODYsNyAr
MTg2LDcgQEAgdm9pZCBnZXRkb21haW5pbmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5f
ZG9tY3RsX2dldGRvbWFpbmluZm8gKmluZm8pCiAgICAgICAgIChkLT5pc19zaHV0X2Rvd24gICAg
ICAgICAgICAgICAgPyBYRU5fRE9NSU5GX3NodXRkb3duICA6IDApIHwKICAgICAgICAgKGQtPmNv
bnRyb2xsZXJfcGF1c2VfY291bnQgPiAwICA/IFhFTl9ET01JTkZfcGF1c2VkICAgIDogMCkgfAog
ICAgICAgICAoZC0+ZGVidWdnZXJfYXR0YWNoZWQgICAgICAgICAgID8gWEVOX0RPTUlORl9kZWJ1
Z2dlZCAgOiAwKSB8Ci0gICAgICAgIChkLT5pc194ZW5zdG9yZSAgICAgICAgICAgICAgICAgPyBY
RU5fRE9NSU5GX3hzX2RvbWFpbiA6IDApIHwKKyAgICAgICAgKGlzX3hlbnN0b3JlX2RvbWFpbihk
KSAgICAgICAgICA/IFhFTl9ET01JTkZfeHNfZG9tYWluIDogMCkgfAogICAgICAgICAoaXNfaHZt
X2RvbWFpbihkKSAgICAgICAgICAgICAgID8gWEVOX0RPTUlORl9odm1fZ3Vlc3QgOiAwKSB8CiAg
ICAgICAgIGQtPnNodXRkb3duX2NvZGUgPDwgWEVOX0RPTUlORl9zaHV0ZG93bnNoaWZ0OwogCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCmluZGV4IDlhOTg4NTcyMzcuLjEwMzNjYTBlOGMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0zNzQsOCArMzc0
LDYgQEAgc3RydWN0IGRvbWFpbgogICAgIGJvb2wgICAgICAgICAgICAgaXNfcHJpdmlsZWdlZDsK
ICAgICAvKiBDYW4gdGhpcyBndWVzdCBhY2Nlc3MgdGhlIFhlbiBjb25zb2xlPyAqLwogICAgIGJv
b2wgICAgICAgICAgICAgaXNfY29uc29sZTsKLSAgICAvKiBJcyB0aGlzIGEgeGVuc3RvcmUgZG9t
YWluIChub3QgZG9tMCk/ICovCi0gICAgYm9vbCAgICAgICAgICAgICBpc194ZW5zdG9yZTsKICAg
ICAvKiBOb24tbWlncmF0YWJsZSBhbmQgbm9uLXJlc3RvcmVhYmxlPyAqLwogICAgIGJvb2wgICAg
ICAgICAgICAgZGlzYWJsZV9taWdyYXRlOwogICAgIC8qIElzIHRoaXMgZ3Vlc3QgYmVpbmcgZGVi
dWdnZWQgYnkgZG9tMD8gKi8KQEAgLTk3Miw2ICs5NzAsMTEgQEAgc3RhdGljIGlubGluZSBib29s
IGlzX3ZjcHVfb25saW5lKGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQogICAgIHJldHVybiAhdGVzdF9i
aXQoX1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3MpOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wg
aXNfeGVuc3RvcmVfZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCit7CisgICAgcmV0dXJu
IGQtPmNyZWF0ZWZsYWdzICYgWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluOworfQorCiBleHRlcm4g
Ym9vbCBzY2hlZF9zbXRfcG93ZXJfc2F2aW5nczsKIAogZXh0ZXJuIGVudW0gY3B1ZnJlcV9jb250
cm9sbGVyIHsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oIGIveGVuL2luY2x1
ZGUveHNtL2R1bW15LmgKaW5kZXggZWY1MmJiMTc2NC4uYjhlMTg1ZTZmYSAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUveHNtL2R1bW15LmgKKysrIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgKQEAg
LTc5LDcgKzc5LDcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgaW50IHhzbV9kZWZhdWx0X2FjdGlv
bigKICAgICAgICAgewogICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgY2FzZSBYU01fWFNfUFJJ
VjoKLSAgICAgICAgICAgIGlmICggc3JjLT5pc194ZW5zdG9yZSApCisgICAgICAgICAgICBpZiAo
IGlzX3hlbnN0b3JlX2RvbWFpbihzcmMpICkKICAgICAgICAgICAgICAgICByZXR1cm4gMDsKICAg
ICAgICAgfQogICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KLS0gCjIuMjAuMS4yLmdiMjFlYmI2
NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
