Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A071881
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 14:47:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpu9B-0001XE-8w; Tue, 23 Jul 2019 12:44:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=079Z=VU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpu9A-0001X9-Ad
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 12:44:00 +0000
X-Inumbo-ID: 8a40b04a-ad47-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a40b04a-ad47-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 12:43:59 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5LT8cYir775hJkbzDi5LPuszfQAJiC7G0GzWPEIeKHLlp9+qHGn2vu7Rs3jV8gigLGgniJIMn9
 oh3gbYmLlEayqPgFlVbHxL2VWNCJ/gg3XTYXkUB23sCKuT+xXeD7IseyOLLCkG6qJn942ysQJa
 KgJlwbk6FoD3LTg8M5IEPG3D/1xJImDO8Jk3SLgtISoE+o6ZfZ1pureSVn3elEatRwX8ZHZTze
 rnC4L8KEZAmL+ITuNG/pwtALqxQyJmTaEtqUhtmXuL6mouiTBvoJhVFalfGftX8NlPV+4Ea4Yl
 4qk=
X-SBRS: 2.7
X-MesageID: 3347482
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3347482"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 14:43:43 +0200
Message-ID: <20190723124343.75872-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/p2m: fix non-translated handling of
 iommu mappings
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgdXNhZ2Ugb2YgbmVlZF9pb21tdV9wdF9zeW5jIGluIHAybSBmb3Igbm9uLXRy
YW5zbGF0ZWQKZ3Vlc3RzIGlzIHdyb25nIGJlY2F1c2UgaXQgZG9lc24ndCBjb3JyZWN0bHkgaGFu
ZGxlIGEgcmVsYXhlZCBQVgpoYXJkd2FyZSBkb21haW4sIHRoYXQgaGFzIG5lZWRfc3luYyBzZXQg
dG8gZmFsc2UsIGJ1dCBzdGlsbCBuZWVkCmVudHJpZXMgdG8gYmUgYWRkZWQgZnJvbSBjYWxscyB0
byB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CkNjOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29t
PgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gRHJvcCB0aGUgZ3Vlc3RfcGh5c21hcF9hZGRfcGFn
ZSBtb2RpZmljYXRpb24uCi0tLQogeGVuL2FyY2gveDg2L21tL3AybS5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCBmZWY5
N2M4MmY2Li4zNjA1NjE0YWFmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysr
IGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0xMzQxLDcgKzEzNDEsNyBAQCBpbnQgc2V0X2lk
ZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sLAog
CiAgICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKHAybS0+ZG9tYWluKSApCiAgICAgewot
ICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAoICFoYXNf
aW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVybiBpb21t
dV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wpLCBfbWZuKGdmbl9sKSwgUEFHRV9PUkRFUl80SywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVG
X3dyaXRhYmxlKTsKQEAgLTE0MzIsNyArMTQzMiw3IEBAIGludCBjbGVhcl9pZGVudGl0eV9wMm1f
ZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCkKIAogICAgIGlmICgg
IXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCiAgICAgewotICAgICAgICBpZiAoICFuZWVkX2lv
bW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQogICAgICAg
ICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2Rm
bihnZm5fbCksIFBBR0VfT1JERVJfNEspOwogICAgIH0KLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTEx
NykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
