Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FE71C37
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:52:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpx2A-0007Fz-So; Tue, 23 Jul 2019 15:48:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=079Z=VU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpx29-0007Fk-77
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:48:57 +0000
X-Inumbo-ID: 60c23d50-ad61-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 60c23d50-ad61-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 15:48:56 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5c1fSqWdcYmxRezgLVYWOVoPayknzFTuBy+R2TB0SqNR4YfoDgIycVdP8XVoETTAf4ri9aJhZy
 vjiv9hUCYRiHncLx+gcCniRU4VFODMkSd1FJwsjG+di/vBs75GAmfetfFaG1rXQN/Lapks/scM
 nt7AYIM9h+uoYZYhJJx45IfMZHYxcTOWJWgyHwyg3GtTBZdFavFTXE3IoEL91MFH/8SFDLmc8S
 G9yEpEbTd/WUxIxRUk2C6qdCeipEMpO3ITdLbE9+j7hEUKmmewQJy1AQzhxgp9ZL5Rnqj6m5jG
 uh0=
X-SBRS: 2.7
X-MesageID: 3321387
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3321387"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:48:50 +0200
Message-ID: <20190723154851.77627-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190723154851.77627-1-roger.pau@citrix.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/iommu: avoid mapping the interrupt
 address range for hwdom
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBjb2RlIG9ubHkgcHJldmVudCBtYXBwaW5nIHRoZSBsYXBpYyBwYWdlIGludG8gdGhl
IGd1ZXN0CnBoeXNpY2FsIG1lbW9yeSBtYXAuIEV4cGFuZCB0aGUgcmFuZ2UgdG8gYmUgMHhGRUV4
X3h4eHggYXMgZGVzY3JpYmVkCmluIHRoZSBJbnRlbCBWVGQgc3BlY2lmaWNhdGlvbiBzZWN0aW9u
IDMuMTMgIkhhbmRsaW5nIFJlcXVlc3RzIHRvCkludGVycnVwdCBBZGRyZXNzIFJhbmdlIi4KCkFN
RCBhbHNvIGxpc3RzIHRoaXMgYWRkcmVzcyByYW5nZSBpbiB0aGUgQU1EIFNSNTY5MCBEYXRhYm9v
aywgc2VjdGlvbgoyLjQuNCAiTVNJIEludGVycnVwdCBIYW5kbGluZyBhbmQgTVNJIHRvIEhUIElu
dGVycnVwdCBDb252ZXJzaW9uIi4KClJlcXVlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gveDg2L2lvbW11LmMKaW5kZXggMGZhNmRjYzNmZC4uODhhODdjZjdhNCAxMDA2NDQK
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKQEAgLTIyNiwxOSArMjI2LDkgQEAgc3RhdGljIGJv
b2wgX19od2RvbV9pbml0IGh3ZG9tX2lvbW11X21hcChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAog
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwogICAgIH0KIAotICAgIC8qCi0gICAgICogQ2hlY2sg
dGhhdCBpdCBkb2Vzbid0IG92ZXJsYXAgd2l0aCB0aGUgTEFQSUMKLSAgICAgKiBUT0RPOiBpZiB0
aGUgZ3Vlc3QgcmVsb2NhdGVzIHRoZSBNTUlPIGFyZWEgb2YgdGhlIExBUElDIFhlbiBzaG91bGQg
bWFrZQotICAgICAqIHN1cmUgdGhlcmUncyBub3RoaW5nIGluIHRoZSBuZXcgYWRkcmVzcyB0aGF0
IHdvdWxkIHByZXZlbnQgdHJhcHBpbmcuCi0gICAgICovCi0gICAgaWYgKCBoYXNfdmxhcGljKGQp
ICkKLSAgICB7Ci0gICAgICAgIGNvbnN0IHN0cnVjdCB2Y3B1ICp2OwotCi0gICAgICAgIGZvcl9l
YWNoX3ZjcHUoZCwgdikKLSAgICAgICAgICAgIGlmICggcGZuID09IFBGTl9ET1dOKHZsYXBpY19i
YXNlX2FkZHJlc3ModmNwdV92bGFwaWModikpKSApCi0gICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwotICAgIH0KKyAgICAvKiBDaGVjayB0aGF0IGl0IGRvZXNuJ3Qgb3ZlcmxhcCB3aXRoIHRo
ZSBJbnRlcnJ1cHQgQWRkcmVzcyBSYW5nZS4gKi8KKyAgICBpZiAoIHBmbiA+PSAweGZlZTAwICYm
IHBmbiA8PSAweGZlZWZmICkKKyAgICAgICAgcmV0dXJuIGZhbHNlOwogICAgIC8qIC4uLiBvciB0
aGUgSU8tQVBJQyAqLwogICAgIGZvciAoIGkgPSAwOyBoYXNfdmlvYXBpYyhkKSAmJiBpIDwgZC0+
YXJjaC5odm0ubnJfdmlvYXBpY3M7IGkrKyApCiAgICAgICAgIGlmICggcGZuID09IFBGTl9ET1dO
KGRvbWFpbl92aW9hcGljKGQsIGkpLT5iYXNlX2FkZHJlc3MpICkKLS0gCjIuMjAuMSAoQXBwbGUg
R2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
