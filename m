Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576A815359C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:53:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNtJ-0000P7-Ma; Wed, 05 Feb 2020 16:51:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TaP3=3Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1izNtH-0000OU-Dn
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:51:03 +0000
X-Inumbo-ID: b00855cc-4837-11ea-915c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b00855cc-4837-11ea-915c-12813bfff9fa;
 Wed, 05 Feb 2020 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580921460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l6ABXnTMOzBLCdMKU68iljWAMVV18hEqSinvaoRyvnQ=;
 b=Doiu5CjFjugarLXWJkBRWrDioIsUWC8n3PhLkiQx6YqM+6Xx6R8PT5j5
 Mu6TeiQRNblalY+Urw7/ijTZ+HvhRl6XcBvB2VAy5bbMooWvyPosMTc7q
 1IhnAD8ZBM5iCfhBzqHghynBdibnmW4m/l/xJVqv5ngDZUqjkeUZ07RyW A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8cavEgHaTdJdg24VDPaYIMDhp+XIBZUH0HpQKuO3agEzvdWTYrGKvZYD4KquWWw6bruBj79cAp
 tMMblk2BvPGL2KucWS4nDipJwb9BhcgqTnMWI9v5sF/PsjERu4F7nL23WunxwCpbTQ2J3N2Owh
 jrDJsUVLlU17xK3eIEFxWMjui6mwZj0+GgOqXHKWGat+7dZ+YC35rHbOXVmvxh9FltKzHPVOL5
 vyCKjy7telVOSpk1FLoXK0QMGjJkyywU1BVAIF+96Ipv2Jt7sJJ91Py0gZXqR48Cm59go0pcIM
 8aE=
X-SBRS: 2.7
X-MesageID: 12167915
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,406,1574139600"; d="scan'208";a="12167915"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 5 Feb 2020 16:50:50 +0000
Message-ID: <20200205165056.11734-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/6] tools: Rationalise legacy CPUID handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgYXR0ZW1wdHMgdG8gcmVtb3ZlIHNvbWUgb2YgdGhlIG1vcmUgaW5zYW5lIGJl
aGF2aW91cnMgZnJvbSBlYXJseQpDUFVJRCBoYW5kbGluZy4gIFRoaXMgaXMgYSBsaXR0bGUgUkZD
IHRvIGdldCBhIGZlZWwsIGJ1dCBJIGludGVuZCB0byBleHRlbmQKdGhlIHNhbWUga2luZCBvZiBo
YW5kbGluZyB0byBJVFNDIChhbmQgZ2V0IHJpZCBvZiBub21pZ3JhdGUpLCBhbmQgcHJvdmlkZSBz
b21lCnNsaWdodGx5IG5lc3RlZC12aXJ0IGJlaGF2aW91ciB1bnRpbCBpdCBjYW4gYmVjb21lIGEg
ZG9tYWluY3JlYXRlIHBhcmFtZXRlci4KClBhdGNoIDEgaGFzIGFscmVhZHkgYmVlbiBwb3N0ZWQg
dHdpY2UgYmVmb3JlLiAgT3RoZXJzIGFyZSBuZXcuICBJJ20gbGVhbmluZwp0b3dhcmRzIHJlYmFz
aW5nIHRoZSBsaWJ4bC9taWdyYXRpb24gd29yayBvdmVyIHRoaXMgc2VyaWVzLCBiZWNhdXNlIGl0
IHdpbGwKY2xlYW4gdXAgYSBmZXcgb2YgdGhlIHRyYW5zZm9ybWF0aW9uIHBhdGNoZXMuCgpBbmRy
ZXcgQ29vcGVyICg2KToKICB0b29scy9saWJ4bDogUmVtb3ZlIGxpYnhsX2NwdWlkX3tzZXQsYXBw
bHlfcG9saWN5fSgpIGZyb20gdGhlIEFQSQogIHRvb2xzL29jYW1sOiBEcm9wIGNwdWlkIGhlbHBl
cnMKICB0b29scy9weXRob246IERyb3AgY3B1aWQgaGVscGVycwogIHRvb2xzL2xpYnhsOiBDb21i
aW5lIGxlZ2FjeSBDUFVJRCBoYW5kbGluZyBsb2dpYwogIHRvb2xzL2xpYnhbY2xdOiBEb24ndCB1
c2UgSFZNX1BBUkFNX1BBRV9FTkFCTEVEIGFzIGEgZnVuY3Rpb24gcGFyYW1ldGVyCiAgeGVuL3B1
YmxpYzogT2Jzb2xldGUgSFZNX1BBUkFNX1BBRV9FTkFCTEVECgogdG9vbHMvbGlieGMvaW5jbHVk
ZS94ZW5jdHJsLmggICAgICAgfCAgMiArLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAg
ICAgICAgfCAxNSArKy0tLS0KIHRvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X2h2bS5jIHwg
MTAgKysrKwogdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfaHZtLmMgICAgfCAgMSAtCiB0b29s
cy9saWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICB8IDI2ICsrKysrKysrLS0KIHRvb2xzL2xp
YnhsL2xpYnhsX2NwdWlkLmMgICAgICAgICAgIHwgMjcgKysrKysrKy0tLQogdG9vbHMvbGlieGwv
bGlieGxfZG9tLmMgICAgICAgICAgICAgfCAgNCArLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuaCAgICAgICAgfCAgMyArKwogdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jICAgICAgICAg
fCAgOCArLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3g4Ni5jICAgICAgICAgICAgIHwgIDggKy0tCiB0
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAgICB8ICA3IC0tLQogdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1saSAgICAgfCAgNyAtLS0KIHRvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybF9zdHVicy5jIHwgNjIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHRvb2xzL3B5dGhvbi94
ZW4vbG93bGV2ZWwveGMveGMuYyAgIHwgOTggLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogeGVuL2FyY2gvYXJtL2h2bS5jICAgICAgICAgICAgICAgICAgfCAgMyArLQogeGVu
L2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgICAgfCAgMiArCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvaHZtL3BhcmFtcy5oICAgICB8ICAyICstCiAxNyBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRp
b25zKCspLCAyMTUgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
