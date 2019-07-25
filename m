Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B474FD7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdxz-00005D-9X; Thu, 25 Jul 2019 13:39:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqdxw-0008Vu-V6
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:39:28 +0000
X-Inumbo-ID: 9f2170ee-aee1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f2170ee-aee1-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 13:39:27 +0000 (UTC)
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
IronPort-SDR: wfprLf+3w+Hl2GUE1rQVLob1fHJkSDtnlfzPVFTIAqOrKudbeXZrwrjhdWEXXSZGSsrAN4fQ8J
 vyNitq/16IZ5WaI/QO2fu8dyQKPgyEL/3B7qLDNJu2OrUnBNILM1hh8KUPUljlBLIavlf1N2XO
 j1p4ZeK3wTmcU/cGfG6NvGYepx/HPGIETuhba3dPUBGYdsnKN8SlNPlmoAnhdOfAvfX8T6wGtD
 b/nDG6aqruA6cl36v06n/6tahcFieM3RnDGK3Bp181vMVzuY/JlYpKOm0S/WMIzdQZuxBxxXQR
 +Aw=
X-SBRS: 2.7
X-MesageID: 3420491
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3420491"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Jul 2019 14:39:20 +0100
Message-ID: <20190725133920.40673-7-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190725133920.40673-1-paul.durrant@citrix.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 6/6] x86/domain: remove the 's3_integrity'
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>,
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
IDx3bEB4ZW4ub3JnPgpDYzogR2FuZyBXZWkgPGdhbmcud2VpQGludGVsLmNvbT4KQ2M6IFNoYW5l
IFdhbmcgPHNoYW5lLndhbmdAaW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAg
ICAgICAgfCAyIC0tCiB4ZW4vYXJjaC94ODYvdGJvb3QuYyAgICAgICAgIHwgMiArLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9kb21haW4uaCB8IDIgLS0KIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5j
IGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IDY1ZjQ3YTc2MjcuLjIyMDM4ODI0NDUgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWlu
LmMKQEAgLTUzOCw4ICs1MzgsNiBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21h
aW4gKmQsCiAgICAgICAgICAgICAgICBkLT5kb21haW5faWQpOwogICAgIH0KIAotICAgIGQtPmFy
Y2guczNfaW50ZWdyaXR5ID0gY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX3MzX2ludGVn
cml0eTsKLQogICAgIGVtZmxhZ3MgPSBjb25maWctPmFyY2guZW11bGF0aW9uX2ZsYWdzOwogCiAg
ICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgaXNfcHZfZG9tYWluKGQpICkKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni90Ym9vdC5jIGIveGVuL2FyY2gveDg2L3Rib290LmMKaW5kZXgg
ZjNmZGVlNGQzOS4uM2RiOGE4YThkOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Rib290LmMK
KysrIGIveGVuL2FyY2gveDg2L3Rib290LmMKQEAgLTIxMiw3ICsyMTIsNyBAQCBzdGF0aWMgdm9p
ZCB0Ym9vdF9nZW5fZG9tYWluX2ludGVncml0eShjb25zdCB1aW50OF90IGtleVtUQl9LRVlfU0la
RV0sCiAgICAgdm1hY19zZXRfa2V5KCh1aW50OF90ICopa2V5LCAmY3R4KTsKICAgICBmb3JfZWFj
aF9kb21haW4oIGQgKQogICAgIHsKLSAgICAgICAgaWYgKCAhZC0+YXJjaC5zM19pbnRlZ3JpdHkg
KQorICAgICAgICBpZiAoICEoZC0+b3B0aW9ucyAmIFhFTl9ET01DVExfQ0RGX3MzX2ludGVncml0
eSkgKQogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIHByaW50aygiTUFDaW5nIERvbWFp
biAldVxuIiwgZC0+ZG9tYWluX2lkKTsKIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9kb21haW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKaW5kZXggNWY5ODk5NDY5
Yy4uNWMwMzhhMTA2NSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAor
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCkBAIC0yOTUsOCArMjk1LDYgQEAgc3Ry
dWN0IGFyY2hfZG9tYWluCiAgICAgdWludDMyX3QgcGNpX2NmODsKICAgICB1aW50OF90IGNtb3Nf
aWR4OwogCi0gICAgYm9vbF90IHMzX2ludGVncml0eTsKLQogICAgIHVuaW9uIHsKICAgICAgICAg
c3RydWN0IHB2X2RvbWFpbiBwdjsKICAgICAgICAgc3RydWN0IGh2bV9kb21haW4gaHZtOwotLSAK
Mi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
