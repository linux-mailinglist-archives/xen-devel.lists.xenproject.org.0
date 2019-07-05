Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24259602D8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 11:06:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjK7M-0005nr-KB; Fri, 05 Jul 2019 09:02:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjK7L-0005nf-80
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 09:02:55 +0000
X-Inumbo-ID: ac338e28-9f03-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac338e28-9f03-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 09:02:53 +0000 (UTC)
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
IronPort-SDR: Fsuc1cRXALklDhgUstxkfdXG4dQe4wtZ42w0lWwf43WLpY5cU3T0o/KvrWFIJTpE6e23k8GREp
 PBm5l4N5CQk7wPSxxBHpkaxYc4JxM3BDuqtPu5RJJBTQgUUbp97MvoGTF7xT16Z2TnB+lxTtUk
 R0rGDdI+6aSS3Ad8TFCDYBZHXR8vdvXUafRkNS1L+EmG1+nPR2SxLb78keM116yexZKGShliG+
 4Gv/B043rB3QVMf7G3ikodw6+Sa462uuRqzsa01iY0/Mshe6chF9HCikwoPCkIHvAJIHLU6C0G
 wGo=
X-SBRS: 2.7
X-MesageID: 2645011
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,454,1557201600"; 
   d="scan'208";a="2645011"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Jul 2019 10:02:47 +0100
Message-ID: <20190705090249.1935-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] xmalloc patches
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
ICAgfCAgNyArKysrKysrCiB4ZW4vY29tbW9uL3N0cmluZy5jICAgICAgIHwgMjAgKysrKysrKysr
KysrKysrKysrCiB4ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jIHwgNDQgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc3RyaW5nLmggIHwgIDIg
KysKIHhlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmggfCAgMiAtLQogNSBmaWxlcyBjaGFuZ2VkLCA0
MyBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKLS0tCiB2MjoKICAtIFBhdGNoICMxIG9m
IHYxIG9mIHRoZSBzZXJpZXMgYWxyZWFkeSBjb21tbWl0dGVkLCBzbyBkcm9wcGVkCiAgLSBQYXRj
aCAjMiBub3cgcmVtb3ZlcyB0aGUgaW5pdF9yZWdpb24KCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBl
dS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
