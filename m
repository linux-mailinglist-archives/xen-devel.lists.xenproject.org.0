Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED268901
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 14:39:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn0EJ-0003ik-QP; Mon, 15 Jul 2019 12:37:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hn0EH-0003h7-Oy
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 12:37:17 +0000
X-Inumbo-ID: 463b21b4-a6fd-11e9-8ce6-6bff0d77bb51
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 463b21b4-a6fd-11e9-8ce6-6bff0d77bb51;
 Mon, 15 Jul 2019 12:37:15 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pjQJ11tP0MSHogiUAf0EWFfJxEtvf3FL14qUcExXJneeVMZKB3hqBt2+uKmK0TQJSmcSfgQCM2
 XDRWKa0k7dy1/GkIrN4dfRtia8WLyVmjAPXmtZFkFxipZ8tfb2o9A4IS7nUYoVqVHvKncAOEN4
 2mBsyih2cw5jXPBmgcSqfK/OY9NldEMwDcOMoOzo1jYtIqVT01ScJ8kS/0WoJ8+Qv+WBTuwUtH
 C5mCIt2qdF96NDIovQPS7mckYpDzLnS4Xw3sEVhGFwuRw3CPCodl233iwKo4OAsznNAV8qjk1+
 ElQ=
X-SBRS: 2.7
X-MesageID: 3026465
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3026465"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Jul 2019 13:37:06 +0100
Message-ID: <20190715123710.1780-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] iommu groups + cleanup
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaXMgYSBtaXh0dXJlIG9mIHRpZHlpbmcgYW5kIHNvbWUgcHJlcGFyYXRvcnkg
d29yayBmb3IgZ3JvdXBpbmcKUENJIGRldmljZXMgZm9yIHRoZSBwdXJwb3NlcyBvZiBhc3NpZ25t
ZW50LgoKUGF1bCBEdXJyYW50ICg0KToKICBpb21tdSAvIHg4NjogbW92ZSBjYWxsIHRvIHNjYW5f
cGNpX2RldmljZXMoKSBvdXQgb2YgdmVuZG9yIGNvZGUKICBwY2k6IGFkZCBhbGwtZGV2aWNlIGl0
ZXJhdG9yIGZ1bmN0aW9uLi4uCiAgaW9tbXU6IGludHJvZHVjZSBpb21tdV9ncm91cHMKICBpb21t
dSAvIHBjaTogcmUtaW1wbGVtZW50IFhFTl9ET01DVExfZ2V0X2RldmljZV9ncm91cC4uLgoKIHhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlICAgICAgICAgICAgfCAgIDEgKwogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyB8ICAgMyArLQogeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMgICAgICAgICAgICB8IDEzNSArKysrKysrKysrKysrKysr
KysrKysrCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAgICAgICAgICAgICAgIHwgMTcx
ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0
ZC9pb21tdS5jICAgICAgICAgfCAgIDQgLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lv
bW11LmMgICAgICAgICB8ICAxNCArKy0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAg
ICAgICAgICAgICAgfCAgIDkgKysKIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDMgKwogOCBmaWxlcyBjaGFuZ2VkLCAyMzIgaW5zZXJ0aW9ucygrKSwgMTA4
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2dyb3Vwcy5jCi0tLQp2MjoKIC0gRHJvcCBpb21tdV9nZXRfb3BzKCkgbW92ZSBhbmQgYWRkIGFs
bC1kZXZpY2UgaXRlcmF0b3IKCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpDYzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CkNjOiBHZW9yZ2Ug
RHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNj
OiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpD
YzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
