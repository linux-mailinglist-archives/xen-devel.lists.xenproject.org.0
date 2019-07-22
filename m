Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35464703DC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpaIi-0000yd-L2; Mon, 22 Jul 2019 15:32:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbCh=VT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpaIh-0000yY-56
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:32:31 +0000
X-Inumbo-ID: e921aad6-ac95-11e9-be2b-93a2cec446b9
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e921aad6-ac95-11e9-be2b-93a2cec446b9;
 Mon, 22 Jul 2019 15:32:27 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oibxTNG5m7SdrtCLa9M+3ZNokdBWEzCvfmEHZRnweS1YWBFys7t08nKgNVP8tvTWgIbMH5yyUU
 f2GoJ8lW1jxmpwDfP/RZ1q2NUM/AGXYKD4ZpcTcD0gbqhkyEBbyX1yAKl35N73AajBTQV7jrsY
 L1ogwmfxgAxxr3RL+2dUAjssQr4+8zoQ2Y74vw8OZysuo1g4TunrUl8Ev2tvGOuNYWlOxXyobe
 MTDevnZ6ZMAa5TlIsw0tqoqX9K5XTeZTiKxqGSfoq6TMV7aDq44Y+qitdiktkNBiKMJSEl7AfR
 4Jc=
X-SBRS: 2.7
X-MesageID: 3367546
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3367546"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 22 Jul 2019 17:32:09 +0200
Message-ID: <20190722153209.73107-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/p2m: fix non-translated handling of iommu
 mappings
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
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgdXNhZ2Ugb2YgbmVlZF9pb21tdV9wdF9zeW5jIGluIHAybSBmb3Igbm9uLXRy
YW5zbGF0ZWQKZ3Vlc3RzIGlzIHdyb25nIGJlY2F1c2UgaXQgZG9lc24ndCBjb3JyZWN0bHkgaGFu
ZGxlIGEgcmVsYXhlZCBQVgpoYXJkd2FyZSBkb21haW4sIHRoYXQgaGFzIG5lZWRfc3luYyBzZXQg
dG8gZmFsc2UsIGJ1dCBzdGlsbCBuZWVkCmVudHJpZXMgdG8gYmUgYWRkZWQgZnJvbSBjYWxscyB0
byB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkuCgpBZGp1c3QgdGhlIGNvZGUgaW4gZ3Vl
c3RfcGh5c21hcF9hZGRfcGFnZSB0byBhbHNvIGNoZWNrIHdoZXRoZXIgdGhlCmRvbWFpbiBoYXMg
YW4gaW9tbXUgaW5zdGVhZCBvZiB3aGV0aGVyIGl0IG5lZWRzIHN5bmNpbmcgb3Igbm90IGluCm9y
ZGVyIHRvIHRha2UgYSByZWZlcmVuY2UgdG8gYSBwYWdlIHRvIGJlIG1hcHBlZC4KClNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogUGF1bCBEdXJyYW50IDxQYXVs
LkR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKaW5k
ZXggZmVmOTdjODJmNi4uODhhMjQzMGM4YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3Ay
bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtODM2LDcgKzgzNiw3IEBAIGd1ZXN0
X3BoeXNtYXBfYWRkX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBtZm5fdCBtZm4s
CiAgICAgICAgICAqLwogICAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgxVUwgPDwgcGFnZV9vcmRl
cik7ICsraSwgKytwYWdlICkKICAgICAgICAgewotICAgICAgICAgICAgaWYgKCAhbmVlZF9pb21t
dV9wdF9zeW5jKGQpICkKKyAgICAgICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSApCiAgICAg
ICAgICAgICAgICAgLyogbm90aGluZyAqLzsKICAgICAgICAgICAgIGVsc2UgaWYgKCBnZXRfcGFn
ZV9hbmRfdHlwZShwYWdlLCBkLCBQR1Rfd3JpdGFibGVfcGFnZSkgKQogICAgICAgICAgICAgICAg
IHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwpAQCAtMTM0MSw3ICsxMzQxLDcgQEAgaW50IHNldF9p
ZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCwK
IAogICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQogICAgIHsK
LSAgICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKKyAgICAgICAgaWYgKCAhaGFz
X2lvbW11X3B0KGQpICkKICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgICByZXR1cm4gaW9t
bXVfbGVnYWN5X21hcChkLCBfZGZuKGdmbl9sKSwgX21mbihnZm5fbCksIFBBR0VfT1JERVJfNEss
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJsZSB8IElPTU1V
Rl93cml0YWJsZSk7CkBAIC0xNDMyLDcgKzE0MzIsNyBAQCBpbnQgY2xlYXJfaWRlbnRpdHlfcDJt
X2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wpCiAKICAgICBpZiAo
ICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQogICAgIHsKLSAgICAgICAgaWYgKCAhbmVlZF9p
b21tdV9wdF9zeW5jKGQpICkKKyAgICAgICAgaWYgKCAhaGFzX2lvbW11X3B0KGQpICkKICAgICAg
ICAgICAgIHJldHVybiAwOwogICAgICAgICByZXR1cm4gaW9tbXVfbGVnYWN5X3VubWFwKGQsIF9k
Zm4oZ2ZuX2wpLCBQQUdFX09SREVSXzRLKTsKICAgICB9Ci0tIAoyLjIwLjEgKEFwcGxlIEdpdC0x
MTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
