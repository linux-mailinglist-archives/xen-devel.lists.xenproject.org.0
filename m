Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E442C25F8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 20:28:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF0Lp-0000by-U2; Mon, 30 Sep 2019 18:24:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pKq3=XZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iF0Lo-0000bi-H4
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 18:24:48 +0000
X-Inumbo-ID: 92e68514-e3af-11e9-97fb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 92e68514-e3af-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569867883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMdyn+lWoVrfKRvIL6B/G/OTZrSTH2mFHxDVJXSSADk=;
 b=XNbdCtKc0O/z96yLRNC0bYy8PL+gqQVJSanimJz1FAfMNPtaTYg1DJxO
 mgZpjurobcrL8bjjpeptqNhPaqXLEYvgchN8EEqhDFuksNfGApkzcIwbY
 a9SUCS6RaOsSJ32/6FNE1B+eYiHxmhpIZHqRDZFgyPhIsgsN7qglAebsL E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nXe/XpJHLVinRkvDT26EflYdgPqJ6k4MG41OPO9NrDLP0GIc5wwtj7ksK0MT8z615OaM+bV1gt
 AAYrt+66X7TPhhJH68xzQocxT+SAEq1cVTp2t73QM6HFNjTUN66k6u0RPT2qJ9S+wMV0jh6Cjy
 xOaOd9euDd/Kdxvly6k9rqHbf8fQCMZy1YxWAOpLQZuIZe5XEj8KrwIf3lAGA8l3rDiPitgKlQ
 CRINQ7dQcsMXWWMdFUG1v+3mzROTMt9TVE9BtjFVHLKkLX3RH8/ZDlylzF1MiTdeAcc8n+uRCF
 txQ=
X-SBRS: 2.7
X-MesageID: 6621883
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6621883"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 19:24:36 +0100
Message-ID: <20190930182437.25478-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930182437.25478-1-andrew.cooper3@citrix.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 1/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_ARRAY_HARDEN
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGxlZ2l0aW1hdGUgY2lyY3Vtc3RhbmNlIHdoZXJlIGFycmF5IGhhcmRlbmluZyBp
cyBub3Qgd2FudGVkIG9yCm5lZWRlZC4gIEFsbG93IGl0IHRvIGJlIHR1cm5lZCBvZmYuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0K
Q0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAg
fCAyMSArKysrKysrKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaCB8IDEy
ICsrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnCmluZGV4IDE2ODI5
ZjYyNzQuLjk2NDRjYzk5MTEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vS2NvbmZpZworKysgYi94
ZW4vY29tbW9uL0tjb25maWcKQEAgLTc3LDYgKzc3LDI3IEBAIGNvbmZpZyBIQVNfQ0hFQ0tQT0xJ
Q1kKIAlzdHJpbmcKIAlvcHRpb24gZW52PSJYRU5fSEFTX0NIRUNLUE9MSUNZIgogCittZW51ICJT
cGVjdWxhdGl2ZSBoYXJkZW5pbmciCisKK2NvbmZpZyBTUEVDVUxBVElWRV9BUlJBWV9IQVJERU4K
Kwlib29sICJTcGVjdWxhdGl2ZSBBcnJheSBIYXJkZW5pbmciCisJZGVmYXVsdCB5CisJLS0taGVs
cC0tLQorCSAgQ29udGVtcG9yYXJ5IHByb2Nlc3NvcnMgbWF5IHVzZSBzcGVjdWxhdGl2ZSBleGVj
dXRpb24gYXMgYQorCSAgcGVyZm9ybWFuY2Ugb3B0aW1pc2F0aW9uLCBidXQgdGhpcyBjYW4gcG90
ZW50aWFsbHkgYmUgYWJ1c2VkIGJ5IGFuCisJICBhdHRhY2tlciB0byBsZWFrIGRhdGEgdmlhIHNw
ZWN1bGF0aXZlIHNpZGVjaGFubmVscy4KKworCSAgT25lIHNvdXJjZSBvZiBkYXRhIGxlYWthZ2Ug
aXMgdmlhIHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZHMgYXJyYXkKKwkgIGFjY2Vzc2VzLgorCisJ
ICBXaGVuIGVuYWJsZWQsIHNwZWNpZmljIGFycmF5IGFjY2Vzc2VzIHdoaWNoIGhhdmUgYmVlbiBk
ZWVtZWQgbGlhYmxlCisJICB0byBiZSBzcGVjdWxhdGl2ZWx5IGFidXNlZCB3aWxsIGJlIGhhcmRl
bmVkIHRvIGF2b2lkIG91dC1vZi1ib3VuZHMKKwkgIGFjY2Vzc2VzLgorCisJICBJZiB1bnN1cmUs
IHNheSBZLgorCitlbmRtZW51CisKIGNvbmZpZyBLRVhFQwogCWJvb2wgImtleGVjIHN1cHBvcnQi
CiAJZGVmYXVsdCB5CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmggYi94ZW4v
aW5jbHVkZS94ZW4vbm9zcGVjLmgKaW5kZXggMmFjOGZlY2NjMi4uZTYyN2E0ZGE1MiAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUveGVuL25vc3BlYy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3Nw
ZWMuaApAQCAtMzMsNiArMzMsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJyYXlf
aW5kZXhfbWFza19ub3NwZWModW5zaWduZWQgbG9uZyBpbmRleCwKIH0KICNlbmRpZgogCisjaWZk
ZWYgQ09ORklHX1NQRUNVTEFUSVZFX0FSUkFZX0hBUkRFTgogLyoKICAqIGFycmF5X2luZGV4X25v
c3BlYyAtIHNhbml0aXplIGFuIGFycmF5IGluZGV4IGFmdGVyIGEgYm91bmRzIGNoZWNrCiAgKgpA
QCAtNTgsNiArNTksMTcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGFycmF5X2luZGV4
X21hc2tfbm9zcGVjKHVuc2lnbmVkIGxvbmcgaW5kZXgsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAg
KHR5cGVvZihfaSkpIChfaSAmIF9tYXNrKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiB9KQorI2Vsc2UKKy8qIE5vIGluZGV4IGhhcmRlbmluZy4gKi8KKyNkZWZp
bmUgYXJyYXlfaW5kZXhfbm9zcGVjKGluZGV4LCBzaXplKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICB0eXBlb2YoaW5kZXgpIF9pID0gKGlu
ZGV4KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICB0eXBl
b2Yoc2l6ZSkgX3MgPSAoc2l6ZSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAodm9pZClfczsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICBfaTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKK30pCisjZW5kaWYgLyogQ09ORklHX1NQRUNVTEFUSVZFX0FSUkFZX0hBUkRFTiAqLwog
CiAvKgogICogYXJyYXlfYWNjZXNzX25vc3BlYyAtIGFsbG93IG5vc3BlYyBhY2Nlc3MgZm9yIHN0
YXRpYyBzaXplIGFycmF5cwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
