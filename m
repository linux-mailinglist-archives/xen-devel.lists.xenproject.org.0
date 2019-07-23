Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45271C8B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:09:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxIt-0001QU-Tw; Tue, 23 Jul 2019 16:06:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTna=VU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpxIs-0001QB-EJ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:06:14 +0000
X-Inumbo-ID: caf07b94-ad63-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id caf07b94-ad63-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 16:06:13 +0000 (UTC)
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
IronPort-SDR: MF0i8Pu7u1TEOLf3ll2DGaKvCLLXNr2NwTQzs5LCs6MOu+5Wj3gGnF7Bqqr0nZdMRWDW+GlI+Y
 EGQWkZuOpFxyplPwNtqkRkKiryQhTKnfatFAuk2Hi2Bh2G0KPUEZxNPV+xTBht8aBC6Ox9YLak
 CYJQq5rDkV2lwK5kCojEWmTGXKqd9MiZlaW2/veALqPq4ct0EVKwWy7QzrxISI2xhCELPp4pfv
 sufERxd4wLz5HeITt3mLVsVxDr7VZymul7FIZO5dZhHFli9ENMOIfIs6KJuiAlS42YCdEKPHbP
 mb0=
X-SBRS: 2.7
X-MesageID: 3410773
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3410773"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:06:03 +0100
Message-ID: <20190723160609.2177-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/6] stash domain create flags and then use them
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Gang Wei <gang.wei@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgc3RhcnRzIHdpdGggYSBwYXRjaCB0byBzdGFzaCB0aGUgZG9tYWluIGNyZWF0
ZSBmbGFncyBpbiBzdHJ1Y3QKZG9tYWluIHRoZW4gdGhlbiBmb2xsb3dzIHVwIHdpdGggdmFyaW91
cyBjbGVhbi11cCBwYXRjaGVzIHRoYXQgdGhpcwplbmFibGVzLgoKUGF1bCBEdXJyYW50ICg2KToK
ICBkb21haW46IHN0YXNoIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGZsYWdzIGluIHN0cnVjdCBk
b21haW4KICBkb21haW46IHJlbW92ZSAnZ3Vlc3RfdHlwZScgZmllbGQgKGFuZCBlbnVtIGd1ZXN0
X3R5cGUpCiAgeDg2L2h2bS9kb21haW46IHJlbW92ZSB0aGUgJ2hhcF9lbmFibGVkJyBmbGFnCiAg
eDg2L2RvbWFpbjogcmVtb3ZlIHRoZSAnb29zX29mZicgZmxhZwogIGRvbWFpbjogcmVtb3ZlIHRo
ZSAnaXNfeGVuc3RvcmUnIGZsYWcKICB4ODYvZG9tYWluOiByZW1vdmUgdGhlICdzM19pbnRlZ3Jp
dHknIGZsYWcKCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICB8ICA5ICstLS0tLS0t
LQogeGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAgfCAgNCArKy0tCiB4ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jICB8ICA1ICsrLS0tCiB4ZW4vYXJjaC94ODYvdGJvb3QuYyAg
ICAgICAgICAgICB8ICAyICstCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICAgICB8IDEx
ICsrKy0tLS0tLS0tCiB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgICB8IDEyICsrLS0t
LS0tLS0tLQogeGVuL2NvbW1vbi9rZXJuZWwuYyAgICAgICAgICAgICAgfCAgOSArKy0tLS0tLS0K
IHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggICAgIHwgIDMgLS0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9kb21haW4uaCB8ICA5ICsrKy0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9w
YWdpbmcuaCAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaCAgICAgfCAg
MiArLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgfCAyMiArKysrKysrKysrLS0t
LS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94c20vZHVtbXkuaCAgICAgICAgICB8ICAyICstCiAxMyBm
aWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkKLS0tCkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogRGFuaWVsIERlIEdy
YWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CkNjOiBHYW5nIFdlaSA8Z2FuZy53ZWlAaW50ZWwu
Y29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzog
IlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IFNoYW5lIFdhbmcg
PHNoYW5lLndhbmdAaW50ZWwuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
