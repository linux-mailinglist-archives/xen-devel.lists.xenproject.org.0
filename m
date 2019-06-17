Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D649092
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 21:53:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcxdq-0006hZ-8R; Mon, 17 Jun 2019 19:50:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ct8y=UQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hcxdp-0006hU-E0
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 19:50:09 +0000
X-Inumbo-ID: 1bddde7e-9139-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bddde7e-9139-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 19:50:08 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Cbeve3Z9Qkc/lTSLFyhM/411DHzsSSv2ZGtwS8uZCH6kjKcErycj+nWnOfsRY409pLPwo0OTmj
 5rev5iYJ6DFansbKO1hsBMDxD+UDUNepCiTpV6e2XV0nehSoawKnog1onhYzcEv7YTEbq2docU
 9lX/IiPVQe7ZC/2yrkP+Uh361u08onAEim3H2x/snh/iYln54tvzdohUG9M8RQ43ebohXbBIJ9
 DJ9BZU5XjJeGCsrEues/Zqq8ATweXcYcWfXhE1oWqNRuAh2v57XkrVrJ6aXT6KZa0QPsD/X725
 rLY=
X-SBRS: 2.7
X-MesageID: 1836386
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,386,1557201600"; 
   d="scan'208";a="1836386"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 17 Jun 2019 20:49:59 +0100
Message-ID: <1560800999-11592-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/clear_page: Update clear_page_sse2() after
 dropping 32bit Xen
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjb2RlIHdhcyBuZXZlciB1cGRhdGVkIHdoZW4gdGhlIDMyYml0IGJ1aWxkIG9mIFhlbiB3
YXMgZHJvcHBlZC4KCiAqIEV4cGFuZCB0aGUgbm93LXJlZHVuZGFudCBwdHJfcmVnIG1hY3JvLgog
KiBUaGUgbnVtYmVyIG9mIGl0ZXJhdGlvbnMgaW4gdGhlIGxvb3AgY2FuIGJlIGhhbGZlZCBieSB1
c2luZyA2NGJpdCB3cml0ZXMsCiAgIHdpdGhvdXQgY29uc3VtaW5nIGFueSBleHRyYSBleGVjdXRp
b24gcmVzb3VyY2UgaW4gdGhlIHBpcGVsaW5lLiAgQWRqdXN0IGFsbAogICBudW1iZXJzL29mZnNl
dHMgYXBwcm9wcmlhdGVseS4KICogUmVwbGFjZSBkZWMgd2l0aCBzdWIgdG8gYXZvaWQgYSBlZmxh
Z3Mgc3RhbGwsIGFuZCBwb3NpdGlvbiBpdCB0byBiZQogICBtYWNyby1mdXNlZCB3aXRoIHRoZSBy
ZWxhdGVkIGptcC4KICogV2l0aCBubyBuZWVkIHRvIHByZXNlcnZlIGVmbGFncyBhY3Jvc3MgdGhl
IGJvZHkgb2YgdGhlIGxvb3AsIHJlcGxhY2UgbGVhCiAgIHdpdGggYWRkIHdoaWNoIGhhcyAxLzMn
cmQgdGhlIGxhdGVuY3kgb24gYmFzaWNhbGx5IGFsbCA2NGJpdCBoYXJkd2FyZS4KCkEgcXVpY2sg
dXNlcnNwYWNlIHBlcmYgdGVzdCBvbiBteSBIYXN3ZWxsIGRldiBib3ggaW5kaWNhdGVzIHRoYXQg
dGhlIG9sZAp2ZXJzaW9uIHRha2VzIH4xMzg1IGN5Y2xlcyBvbiBhdmVyYWdlIChpZ25vcmluZyBv
dXRsaWVycyksIGFuZCB0aGUgbmV3IHZlcnNpb24KdGFrZXMgfjEwNjAgY3lsZXMsIG9yIGFib3V0
IDc3JSBvZiB0aGUgdGltZS4KClJlcG9ydGVkLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jv
a0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KQ0M6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+CgpUaGVy
ZSBpcyBhbG1vc3QgY2VydGFpbmx5IGJldHRlciByb29tIGZvciBpbXByb3ZlbWVudCwgZXNwZWNp
YWxseSBub3cgdGhhdCB3ZQpoYXZlIGFsdGVybmF0aXZlcywgYnV0IHRoaXMgaXMgc3Vic3RhbnRp
YWwgaW1wcm92ZW1lbnQgd2hpY2ggaXMgdmVyeSBzYWZlIGZvcgpiYWNrcG9ydC4KLS0tCiB4ZW4v
YXJjaC94ODYvY2xlYXJfcGFnZS5TIHwgMTYgKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvY2xlYXJfcGFnZS5TIGIveGVuL2FyY2gveDg2L2NsZWFyX3BhZ2UuUwppbmRleCAyNDNh
NzY3Li4wODE3NjEwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY2xlYXJfcGFnZS5TCisrKyBi
L3hlbi9hcmNoL3g4Ni9jbGVhcl9wYWdlLlMKQEAgLTIsMTggKzIsMTYgQEAKIAogI2luY2x1ZGUg
PGFzbS9wYWdlLmg+CiAKLSNkZWZpbmUgcHRyX3JlZyAlcmRpCi0KIEVOVFJZKGNsZWFyX3BhZ2Vf
c3NlMikKLSAgICAgICAgbW92ICAgICAkUEFHRV9TSVpFLzE2LCAlZWN4CisgICAgICAgIG1vdiAg
ICAgJFBBR0VfU0laRS8zMiwgJWVjeAogICAgICAgICB4b3IgICAgICVlYXgsJWVheAogCi0wOiAg
ICAgIGRlYyAgICAgJWVjeAotICAgICAgICBtb3ZudGkgICVlYXgsIChwdHJfcmVnKQotICAgICAg
ICBtb3ZudGkgICVlYXgsIDQocHRyX3JlZykKLSAgICAgICAgbW92bnRpICAlZWF4LCA4KHB0cl9y
ZWcpCi0gICAgICAgIG1vdm50aSAgJWVheCwgMTIocHRyX3JlZykKLSAgICAgICAgbGVhICAgICAx
NihwdHJfcmVnKSwgcHRyX3JlZworMDogICAgICBtb3ZudGkgICVyYXgsICAwKCVyZGkpCisgICAg
ICAgIG1vdm50aSAgJXJheCwgIDgoJXJkaSkKKyAgICAgICAgbW92bnRpICAlcmF4LCAxNiglcmRp
KQorICAgICAgICBtb3ZudGkgICVyYXgsIDI0KCVyZGkpCisgICAgICAgIGFkZCAgICAgJDMyLCAl
cmRpCisgICAgICAgIHN1YiAgICAgJDEsICVlY3gKICAgICAgICAgam56ICAgICAwYgogCiAgICAg
ICAgIHNmZW5jZQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
