Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D674FCB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:41:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdxz-00005c-Jp; Thu, 25 Jul 2019 13:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqdxy-00004z-DQ
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:39:30 +0000
X-Inumbo-ID: 9e72038e-aee1-11e9-93b5-3f982684f284
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e72038e-aee1-11e9-93b5-3f982684f284;
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
IronPort-SDR: tvCDlWXsc21oTiC0bVHRH6sjnB5NWjLw1wSfLD6tZ1roFNzJHKcWv/lWJ6n4WN+AaLW2Mu+uf+
 CP0+1hWIlkL+L5+juT4aXs5IocBpwy3U7bdnKHj91UUIjy00nRV4i11pLM4NyNgTHDt9wK9r8U
 7EFmgai14oDQ314Ph/zxjadYSVCFlx2JwJb59Whs/ohfJWsFgsDMPgeM3RaREwUTlv6wV0sM0M
 pdy+I479AzJOL++EuxY5dSpjIxN7y+hRc3ul7ysIxM4Q5F3oMA7XfA910dHJHpsKgZ7F+Ofgf/
 OAk=
X-SBRS: 2.7
X-MesageID: 3420484
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3420484"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Jul 2019 14:39:15 +0100
Message-ID: <20190725133920.40673-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190725133920.40673-1-paul.durrant@citrix.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
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

VGhlc2UgYXJlIGNhbm9uaWNhbCBzb3VyY2Ugb2YgZGF0YSB1c2VkIHRvIHNldCB2YXJpb3VzIG90
aGVyIGZsYWdzLiBJZgp0aGV5IGFyZSBhdmFpbGFibGUgZGlyZWN0bHkgaW4gc3RydWN0IGRvbWFp
biB0aGVuIHRoZSBvdGhlciBmbGFncyBhcmUgbm8KbG9uZ2VyIG5lZWRlZC4KClRoaXMgcGF0Y2gg
c2ltcGx5IGNvcGllcyB0aGUgZmxhZ3MgaW50byBhIG5ldyAnb3B0aW9ucycgZmllbGQgaW4Kc3Ry
dWN0IGRvbWFpbi4gU3Vic2VxdWVudCBwYXRjaGVzIHdpbGwgZG8gdGhlIHJlbGF0ZWQgY2xlYW4t
dXAgd29yay4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Q2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRp
bUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCnYyOgogLSBSZW5hbWUgJ2NyZWF0
ZWZsYWdzJyB0byAnb3B0aW9ucycKLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICB8IDYgKysr
Ky0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21h
aW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggYmM1NmE1MTgxNS4uZWVmNDg2YWYwNSAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5j
CkBAIC0zMzEsNiArMzMxLDggQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90
IGRvbWlkLAogICAgIGlmICggKGQgPSBhbGxvY19kb21haW5fc3RydWN0KCkpID09IE5VTEwgKQog
ICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKIAorICAgIGQtPm9wdGlvbnMgPSBjb25m
aWcgPyBjb25maWctPmZsYWdzIDogMDsKKwogICAgIC8qIFNvcnQgb3V0IG91ciBpZGVhIG9mIGlz
X3N5c3RlbV9kb21haW4oKS4gKi8KICAgICBkLT5kb21haW5faWQgPSBkb21pZDsKIApAQCAtMzUy
LDcgKzM1NCw3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwK
ICAgICB9CiAKICAgICAvKiBTb3J0IG91dCBvdXIgaWRlYSBvZiBpc197cHYsaHZtfV9kb21haW4o
KS4gIEFsbCBzeXN0ZW0gZG9tYWlucyBhcmUgUFYuICovCi0gICAgZC0+Z3Vlc3RfdHlwZSA9ICgo
Y29uZmlnICYmIChjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0KSkKKyAg
ICBkLT5ndWVzdF90eXBlID0gKChkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0
KQogICAgICAgICAgICAgICAgICAgICAgPyBndWVzdF90eXBlX2h2bSA6IGd1ZXN0X3R5cGVfcHYp
OwogCiAgICAgVFJBQ0VfMUQoVFJDX0RPTTBfRE9NX0FERCwgZC0+ZG9tYWluX2lkKTsKQEAgLTQy
OSw3ICs0MzEsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQs
CiAgICAgICAgIHdhdGNoZG9nX2RvbWFpbl9pbml0KGQpOwogICAgICAgICBpbml0X3N0YXR1cyB8
PSBJTklUX3dhdGNoZG9nOwogCi0gICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01D
VExfQ0RGX3hzX2RvbWFpbiApCisgICAgICAgIGlmICggZC0+b3B0aW9ucyAmIFhFTl9ET01DVExf
Q0RGX3hzX2RvbWFpbiApCiAgICAgICAgIHsKICAgICAgICAgICAgIGQtPmlzX3hlbnN0b3JlID0g
MTsKICAgICAgICAgICAgIGQtPmRpc2FibGVfbWlncmF0ZSA9IDE7CmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IGMxOTdl
OTNkNzMuLmNmZjI5OTBiMTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0zMDYsNiArMzA2LDcgQEAgZW51bSBndWVz
dF90eXBlIHsKIAogc3RydWN0IGRvbWFpbgogeworICAgIHVuc2lnbmVkIGludCAgICAgb3B0aW9u
czsgICAgICAgICAvKiBjb3B5IG9mIGNyZWF0ZWRvbWFpbiBmbGFncyAqLwogICAgIGRvbWlkX3Qg
ICAgICAgICAgZG9tYWluX2lkOwogCiAgICAgdW5zaWduZWQgaW50ICAgICBtYXhfdmNwdXM7Ci0t
IAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
