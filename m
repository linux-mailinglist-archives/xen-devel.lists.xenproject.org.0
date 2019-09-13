Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA6B260D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8rEm-0006mj-9a; Fri, 13 Sep 2019 19:28:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8rEk-0006kM-9O
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:28:06 +0000
X-Inumbo-ID: 9ad9f737-d65c-11e9-95b9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ad9f737-d65c-11e9-95b9-12813bfff9fa;
 Fri, 13 Sep 2019 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568402886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBEMLZnLm26tjDsc8qn1/8XcgCfCIPk3+lDhvg0ZFL0=;
 b=EM7nLtYp2GgdRc4DJ/6JvC/efTaftgBOZUhUY+kogS8Hlz4r8Hj5nP1w
 XJ4r40sIA/l6y8uGYdvB6j1AJwwXoHV6A4wPDWPScmopOUMiwX9A8iQmR
 y6MRWl+qdZ1J4A6+N45p8TizTsy4BqaqxrYVFYTH6Ric3lDdFsACowp74 s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WIJNVgLDnCAc99Gi9yrvYIIDDJsyf74ZNdhpJQJAcucky4RduIMnRMEqGx8gtihtRO0wMe/rcK
 xsA1hfwpzjIIaP1J0KXJF0xVwwWb5R1HtXgFqUgvxavEiAgrz0dr21B3slg3/PQg8HEZ9HkmSM
 EoBenp0kUkYdhsCXHmO06CHxn3v08BHq9qyn66MZJ20G4erjMwIz+RT3THx8muwJw0ocG/5GG3
 VGEz4xshA1FBuX2TvKJcmbi6oPGUoPODgSFYRL0ilOb9pCIUgIfwwk41/PLF5DZ2AfXOxbCUul
 XgA=
X-SBRS: 2.7
X-MesageID: 5553055
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5553055"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 20:27:50 +0100
Message-ID: <20190913192759.10795-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190913192759.10795-1-andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 01/10] x86/msr: Offer CPUID Faulting to PVH
 control domains
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbnRyb2wgZG9tYWluIGV4Y2x1c2lvbiBmb3IgQ1BVSUQgRmF1bHRpbmcgcHJlZGF0ZXMg
ZG9tMCBQVkgsIGJ1dCB0aGUKcmVhc29uIGZvciB0aGUgZXhjbHVzaW9uICh0byBhbGxvdyB0aGUg
ZG9tYWluIGJ1aWxkZXIgdG8gc2VlIGhvc3QgQ1BVSUQKdmFsdWVzKSBpc24ndCBhcHBsaWNhYmxl
LgoKVGhlIGRvbWFpbiBidWlsZGVyICppcyogYnJva2VuIGluIFBWSCBjb250cm9sIGRvbWFpbnMs
IGFuZCByZXN0cmljdGluZyB0aGUgdXNlCm9mIENQVUlEIEZhdWx0aW5nIGRvZXNuJ3QgbWFrZSBp
dCBhbnkgbGVzcyBicm9rZW4uICBUd2VhayB0aGUgbG9naWMgdG8gb25seQpleGNsdWRlIFBWIGNv
bnRyb2wgZG9tYWlucy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKdjI6CiAqIE5ldwotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgfCA1
ICsrKy0tCiB4ZW4vYXJjaC94ODYvbXNyLmMgICAgICAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvY3B1L2NvbW1vbi5jIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwppbmRleCA5Mzdk
OGU4MmE4Li40YmY4NTJjOTQ4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKQEAgLTE2OSw3ICsxNjksNyBAQCB2b2lk
IGN0eHRfc3dpdGNoX2xldmVsbGluZyhjb25zdCBzdHJ1Y3QgdmNwdSAqbmV4dCkKIAkJaWYgKG5l
eHRkICYmIGlzX2lkbGVfZG9tYWluKG5leHRkKSkKIAkJCXJldHVybjsKIAkJLyoKLQkJICogV2Ug
KnNob3VsZCogYmUgZW5hYmxpbmcgZmF1bHRpbmcgZm9yIHRoZSBjb250cm9sIGRvbWFpbi4KKwkJ
ICogV2UgKnNob3VsZCogYmUgZW5hYmxpbmcgZmF1bHRpbmcgZm9yIFBWIGNvbnRyb2wgZG9tYWlu
cy4KIAkJICoKIAkJICogVW5mb3J0dW5hdGVseSwgdGhlIGRvbWFpbiBidWlsZGVyIChoYXZpbmcg
b25seSBldmVyIGJlZW4gYQogCQkgKiBQViBndWVzdCkgZXhwZWN0cyB0byBiZSBhYmxlIHRvIHNl
ZSBob3N0IGNwdWlkIHN0YXRlIGluIGEKQEAgLTE4NCw3ICsxODQsOCBAQCB2b2lkIGN0eHRfc3dp
dGNoX2xldmVsbGluZyhjb25zdCBzdHJ1Y3QgdmNwdSAqbmV4dCkKIAkJICogZ2VuZXJhdGluZyB0
aGUgbWF4aW11bSBmdWxsIGNwdWlkIHBvbGljeSBpbnRvIFhlbiwgYXQgd2hpY2gKIAkJICogdGhp
cyBwcm9ibGVtIHdpbGwgZGlzYXBwZWFyLgogCQkgKi8KLQkJc2V0X2NwdWlkX2ZhdWx0aW5nKG5l
eHRkICYmICFpc19jb250cm9sX2RvbWFpbihuZXh0ZCkgJiYKKwkJc2V0X2NwdWlkX2ZhdWx0aW5n
KG5leHRkICYmICghaXNfY29udHJvbF9kb21haW4obmV4dGQpIHx8CisJCQkJCSAgICAgIWlzX3B2
X2RvbWFpbihuZXh0ZCkpICYmCiAJCQkJICAgKGlzX3B2X2RvbWFpbihuZXh0ZCkgfHwKIAkJCQkg
ICAgbmV4dC0+YXJjaC5tc3JzLT4KIAkJCQkgICAgbWlzY19mZWF0dXJlc19lbmFibGVzLmNwdWlk
X2ZhdWx0aW5nKSk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbXNyLmMgYi94ZW4vYXJjaC94
ODYvbXNyLmMKaW5kZXggZTY1OTYxZmNjYi4uYTZjOGNjNzYyNyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L21zci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwpAQCAtOTEsOCArOTEsOCBAQCBp
bnQgaW5pdF9kb21haW5fbXNyX3BvbGljeShzdHJ1Y3QgZG9tYWluICpkKQogICAgIGlmICggIW1w
ICkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKLSAgICAvKiBTZWUgY29tbWVudCBpbiBpbnRl
bF9jdHh0X3N3aXRjaF9sZXZlbGxpbmcoKSAqLwotICAgIGlmICggaXNfY29udHJvbF9kb21haW4o
ZCkgKQorICAgIC8qIFNlZSBjb21tZW50IGluIGN0eHRfc3dpdGNoX2xldmVsbGluZygpICovCisg
ICAgaWYgKCBpc19jb250cm9sX2RvbWFpbihkKSAmJiBpc19wdl9kb21haW4oZCkgKQogICAgICAg
ICBtcC0+cGxhdGZvcm1faW5mby5jcHVpZF9mYXVsdGluZyA9IGZhbHNlOwogCiAgICAgZC0+YXJj
aC5tc3IgPSBtcDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
