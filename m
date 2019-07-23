Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C671C92
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:10:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxIu-0001Qa-84; Tue, 23 Jul 2019 16:06:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTna=VU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpxIs-0001QG-Kf
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:06:14 +0000
X-Inumbo-ID: cb7a8094-ad63-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb7a8094-ad63-11e9-8980-bc764e045a96;
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
IronPort-SDR: biCS4SYpFAFNGCVzYEry4n10akxTAHulQNkkFxBKdI8FiP0zWeufsIR38UKDAnCAbJV7clyzLQ
 okKns4HfJwy4VKQDWKXYakyackwcs7Dq7a9pX0WGFktf6MJP4v5nmvlRHJHgn1qAxnUoqEmm9D
 xRR/P6WwKInTKEiFEpaV5dSrfshz7tRM+1j84sPqFmBY9nCv6Aueeu3KHCruBiUKuLtfCnCI3C
 RBjoIUFD656em5sUX0ajEchVKbeKod/EWWqS/ou6puycuH0vWPdoDUq1WBaqN7ei8BSOVKmBPh
 Efg=
X-SBRS: 2.7
X-MesageID: 3410775
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3410775"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:06:04 +0100
Message-ID: <20190723160609.2177-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190723160609.2177-1-paul.durrant@citrix.com>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/6] domain: stash xen_domctl_createdomain flags
 in struct domain
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
c2ltcGx5IGNvcGllcyB0aGUgZmxhZ3MgaW50byBhIG5ldyAnY3JlYXRlZmxhZ3MnIGZpZWxkIGlu
CnN0cnVjdCBkb21haW4uIFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGRvIHRoZSByZWxhdGVkIGNs
ZWFuLXVwIHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2Fu
IDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL2NvbW1vbi9k
b21haW4uYyAgICAgfCA2ICsrKystLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAxICsKIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4IDU1YWE3
NTliNzUuLmQ1NTljODg5OGUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKKysrIGIv
eGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMzMzLDYgKzMzMyw4IEBAIHN0cnVjdCBkb21haW4gKmRv
bWFpbl9jcmVhdGUoZG9taWRfdCBkb21pZCwKICAgICBpZiAoIChkID0gYWxsb2NfZG9tYWluX3N0
cnVjdCgpKSA9PSBOVUxMICkKICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CiAKKyAg
ICBkLT5jcmVhdGVmbGFncyA9IGNvbmZpZyA/IGNvbmZpZy0+ZmxhZ3MgOiAwOworCiAgICAgLyog
U29ydCBvdXQgb3VyIGlkZWEgb2YgaXNfc3lzdGVtX2RvbWFpbigpLiAqLwogICAgIGQtPmRvbWFp
bl9pZCA9IGRvbWlkOwogCkBAIC0zNTQsNyArMzU2LDcgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWlu
X2NyZWF0ZShkb21pZF90IGRvbWlkLAogICAgIH0KIAogICAgIC8qIFNvcnQgb3V0IG91ciBpZGVh
IG9mIGlzX3twdixodm19X2RvbWFpbigpLiAgQWxsIHN5c3RlbSBkb21haW5zIGFyZSBQVi4gKi8K
LSAgICBkLT5ndWVzdF90eXBlID0gKChjb25maWcgJiYgKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9N
Q1RMX0NERl9odm1fZ3Vlc3QpKQorICAgIGQtPmd1ZXN0X3R5cGUgPSAoKGQtPmNyZWF0ZWZsYWdz
ICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0KQogICAgICAgICAgICAgICAgICAgICAgPyBndWVz
dF90eXBlX2h2bSA6IGd1ZXN0X3R5cGVfcHYpOwogCiAgICAgVFJBQ0VfMUQoVFJDX0RPTTBfRE9N
X0FERCwgZC0+ZG9tYWluX2lkKTsKQEAgLTQzMSw3ICs0MzMsNyBAQCBzdHJ1Y3QgZG9tYWluICpk
b21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCiAgICAgICAgIHdhdGNoZG9nX2RvbWFpbl9pbml0
KGQpOwogICAgICAgICBpbml0X3N0YXR1cyB8PSBJTklUX3dhdGNoZG9nOwogCi0gICAgICAgIGlm
ICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbiApCisgICAgICAgIGlm
ICggZC0+Y3JlYXRlZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl94c19kb21haW4gKQogICAgICAgICB7
CiAgICAgICAgICAgICBkLT5pc194ZW5zdG9yZSA9IDE7CiAgICAgICAgICAgICBkLT5kaXNhYmxl
X21pZ3JhdGUgPSAxOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCBiNDBjOGZkMTM4Li5lZGFlMzcyYzJiIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aApAQCAtMzA4LDYgKzMwOCw3IEBAIGVudW0gZ3Vlc3RfdHlwZSB7CiAKIHN0cnVjdCBkb21haW4K
IHsKKyAgICB1bnNpZ25lZCBpbnQgICAgIGNyZWF0ZWZsYWdzOwogICAgIGRvbWlkX3QgICAgICAg
ICAgZG9tYWluX2lkOwogCiAgICAgdW5zaWduZWQgaW50ICAgICBtYXhfdmNwdXM7Ci0tIAoyLjIw
LjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
