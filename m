Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E136085B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:51:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPWJ-00048N-4H; Fri, 05 Jul 2019 14:49:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjPWH-00048C-HB
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:49:01 +0000
X-Inumbo-ID: 05c3070a-9f34-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 05c3070a-9f34-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 14:48:59 +0000 (UTC)
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
IronPort-SDR: MONUJx6FUGYLA159S6r1li6q3hMgQKfIKzcYnKqVkGtJRghbnClrQgqEvmJxu0DKxOKMgig7OG
 nBzQiK808DW5rGmhZBS1p03f7j8PkWbjSu+au51wMHUfF3eegrAJ0C8n2LbEnkqZS7WGTp3tYK
 j9XvajnosnLKRf6KVUiSX0F8/JOeRYbVuHRl6WEa7gjuy/x6Ji9QJbI2x486rZeZENNMpdUiCb
 0ooJI2f2N7FcEnQkmGRQ+QGLFFr7eX6dGqMt8xJVtTsGaNVbsUxt5idwDuRqg0OwCosU0CTqm+
 BVw=
X-SBRS: 2.7
X-MesageID: 2620500
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2620500"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Jul 2019 15:48:53 +0100
Message-ID: <20190705144855.15259-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] xmalloc patches
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

VGhlc2UgYXJlIHRoZSByZW1haW5pbmcgcGF0Y2hlcyB0byB4bWFsbG9jX3Rsc2YuYyB0aGF0IHN0
ZW0gZnJvbSBkZWJ1Z2dpbmcKdGhlIHByb2JsZW0gdGhhdCBsZWQgdG8gY29tbWl0IDU2YWQ2MjY1
ICJ4ODYvbXNpOiBmaXggbG9vcCB0ZXJtaW5hdGlvbgpjb25kaXRpb24gaW4gcGNpX21zaV9jb25m
X3dyaXRlX2ludGVyY2VwdCgpIi4KClBhdWwgRHVycmFudCAoMik6CiAgeG1hbGxvYzogcmVtb3Zl
IHN0cnVjdCB4bWVtX3Bvb2wgaW5pdF9yZWdpb24KICB4bWFsbG9jOiBhZGQgYSBLY29uZmlnIG9w
dGlvbiB0byBwb2lzb24gZnJlZSBwb29sIG1lbW9yeQoKIHhlbi9LY29uZmlnLmRlYnVnICAgICAg
ICAgfCAgNyArKysrKysKIHhlbi9jb21tb24vc3RyaW5nLmMgICAgICAgfCAyMCArKysrKysrKysr
KysrKysrKwogeGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYyB8IDQ2ICsrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUveGVuL3N0cmluZy5oICB8ICAyICsr
CiB4ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oIHwgIDIgLS0KIDUgZmlsZXMgY2hhbmdlZCwgNDUg
aW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCiAtLS0KIHYzOgogIC0gRXh0cmEgbm90ZSBv
biBwYXRjaCAjMSBjb21taXQgY29tbWVudAogIC0gQ291cGxlIG9mIGZpeGVzIHRvIHBhdGNoICMy
CiAgCiB2MjoKICAtIFBhdGNoICMxIG9mIHYxIG9mIHRoZSBzZXJpZXMgYWxyZWFkeSBjb21tbWl0
dGVkLCBzbyBkcm9wcGVkCiAgLSBOZXcgcGF0Y2ggIzEgKG9sZCBwYXRjaCAjMikgbm93IHJlbW92
ZXMgdGhlIGluaXRfcmVnaW9uCgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
Q2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4K
Q2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBE
ZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0gCjIuMjAuMS4y
LmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
