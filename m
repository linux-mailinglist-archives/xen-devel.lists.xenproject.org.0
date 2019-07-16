Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B66A6F6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 13:09:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnLHS-0002v1-Mg; Tue, 16 Jul 2019 11:05:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nepe=VN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hnLHQ-0002uw-D4
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 11:05:56 +0000
X-Inumbo-ID: ae67452a-a7b9-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae67452a-a7b9-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 11:05:55 +0000 (UTC)
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
IronPort-SDR: qx2Ffp2BsDuZr89ee68ZrXDGg7zdCwaMHWHskT5i+iwHez1nAFLR5H/rEhc7JsFjlx5RIanM0H
 im/sNNYO+rDTYsXsLl1T8gcYdHKXEe+57Ha450c2NsgIZ7ULNnOvhvxC+FNJk0OaLLTRL1sgch
 CDEbgSkZ0LMVYqBWGY3wbCsl7Q39HI/O+j79UbtdQ6Siwg/8UGEx6qV75twlvWnFE9UEUEBmOF
 3X+jOqtfz8cj6AkBonSdQaEJjiDkZODpIKoLTojoMcRFIaUj3l2LSkmNro8OxHOHzbGm4KqE7P
 jrg=
X-SBRS: 2.7
X-MesageID: 3007977
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3007977"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 16 Jul 2019 12:05:50 +0100
Message-ID: <20190716110550.19086-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] mm.h: fix BUG_ON() condition in
 put_page_alloc_ref()
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
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEJVR19PTigpIHdhcyBtaXNwbGFjZWQgd2hlbiB0aGlzIGZ1bmN0aW9uIHdhcyBpbnRyb2R1
Y2VkIGluIGNvbW1pdAplYzgzZjgyNSAibW0uaDogYWRkIGhlbHBlciBmdW5jdGlvbiB0byB0ZXN0
LWFuZC1jbGVhciBfUEdDX2FsbG9jYXRlZCIuCkl0IHdpbGwgZmlyZSBpbmNvcnJlY3RseSBpZiBf
UEdDX2FsbG9jYXRlZCBpcyBhbHJlYWR5IGNsZWFyIG9uIGVudHJ5LiBUaHVzCml0IHNob3VsZCBi
ZSBtb3ZlZCBhZnRlciB0aGUgaWYgc3RhdGVtZW50LgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBl
dS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgotLS0KIHhlbi9pbmNsdWRlL3hlbi9tbS5oIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L21tLmggYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAppbmRleCA1ZDBjMTlmMDExLi5jZmVhMzhmODAx
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbW0uaAorKysgYi94ZW4vaW5jbHVkZS94ZW4v
bW0uaApAQCAtNjY3LDkgKzY2NywxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHV0X3BhZ2VfYWxs
b2NfcmVmKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCiAgICAgICogdGhlIGNhbGxlciBob2xkaW5n
IGFuIGFkZGl0aW9uYWwgcmVmZXJlbmNlLiBJLmUuIHRoZSBhbGxvY2F0aW9uCiAgICAgICogcmVm
ZXJlbmNlIG11c3QgbmV2ZXIgYmUgdGhlIGxhc3QgcmVmZXJlbmNlIGhlbGQuCiAgICAgICovCi0g
ICAgQlVHX09OKChwYWdlLT5jb3VudF9pbmZvICYgUEdDX2NvdW50X21hc2spIDw9IDEpOwogICAg
IGlmICggdGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmcGFnZS0+Y291bnRfaW5m
bykgKQorICAgIHsKKyAgICAgICAgQlVHX09OKChwYWdlLT5jb3VudF9pbmZvICYgUEdDX2NvdW50
X21hc2spIDw9IDEpOwogICAgICAgICBwdXRfcGFnZShwYWdlKTsKKyAgICB9CiB9CiAKICNlbmRp
ZiAvKiBfX1hFTl9NTV9IX18gKi8KLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
