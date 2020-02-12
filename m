Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C651E15ADC0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:54:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vDP-0007pt-NJ; Wed, 12 Feb 2020 16:50:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zgzp=4A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1vDN-0007po-DJ
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:50:17 +0000
X-Inumbo-ID: bebad448-4db7-11ea-aa99-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bebad448-4db7-11ea-aa99-bc764e2007e4;
 Wed, 12 Feb 2020 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581526217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kR6pfS/4f3wUGf6gHUXBHV7FhntVRyrKckAmAh9NeDA=;
 b=ATBtWo7ZLoUS/NdLpQz4nUooRuOf5DXPBN/4VUpejHBaaJkH7dMhoZuU
 dWg/ebW8FJRHTQa9HtZhPBBTZqM9ijPd9pGJpKA9EODZguXI/CSQNcaJQ
 Z+tWAne5wyEPiYNk8GzonHG6ptOTIke8YwGVyOzA6c37q3NH7+7hMQL9c I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BsY4QULXFPvNS7GYb+fL/BDKsxY0JX5SrDPKXeiggw1pPGzWgWLS1spbG226iFvzdtqEKvtuo9
 clHtrSiJj7R9zsXXJCH83Gf2NuBuTaCPs6h6QaMX5IZ8I7YM41AkcgSs5et5czoFWmG2isCPL7
 7CK/D92P9kJ+n6duec/HVUHA+rhKNM3OSXFgtz1nnVbmMLgO3+WFfYKhtXbPpkW8PB58Z4zAaC
 4qq9uTMMTdQqzJJMuCpgWIG2SRi8gmDdLD+z829Vq7THPtWxS7eksdEmhvFNYUNZACrHCFmtA/
 gnI=
X-SBRS: 2.7
X-MesageID: 12353162
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="12353162"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 12 Feb 2020 17:49:46 +0100
Message-ID: <20200212164949.56434-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] x86: fixes/improvements for scratch cpumask
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDb21taXQ6Cgo1NTAwZDI2NWEyYThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1
Cng4Ni9zbXA6IHVzZSBBUElDIEFMTEJVVCBkZXN0aW5hdGlvbiBzaG9ydGhhbmQgd2hlbiBwb3Nz
aWJsZQoKSW50cm9kdWNlZCBhIGJvZ3VzIHVzYWdlIG9mIHRoZSBzY3JhdGNoIGNwdW1hc2s6IGl0
IHdhcyB1c2VkIGluIGEKZnVuY3Rpb24gdGhhdCBjb3VsZCBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1
cHQgY29udGV4dCwgYW5kIGhlbmNlIHVzaW5nCnRoZSBzY3JhdGNoIGNwdW1hc2sgdGhlcmUgaXMg
bm90IHNhZmUuIFBhdGNoICMyIGlzIGEgZml4IGZvciB0aGF0IHVzYWdlLgoKUGF0Y2ggIzMgYWRk
cyBzb21lIGRlYnVnIGluZnJhc3RydWN0dXJlIHRvIG1ha2Ugc3VyZSB0aGUgc2NyYXRjaCBjcHVt
YXNrCmlzIHVzZWQgaW4gdGhlIHJpZ2h0IGNvbnRleHQsIGFuZCBoZW5jZSBzaG91bGQgcHJldmVu
dCBmdXJ0aGVyIG1pc3N1c2VzLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoMyk6
CiAgeDg2L3NtcDogdW5pZnkgaGVhZGVyIGluY2x1ZGVzIGluIHNtcC5oCiAgeDg2L3NtcDogdXNl
IGEgZGVkaWNhdGVkIHNjcmF0Y2ggY3B1bWFzayBpbiBzZW5kX0lQSV9tYXNrCiAgeDg2OiBhZGQg
YWNjZXNzb3JzIGZvciBzY3JhdGNoIGNwdSBtYXNrCgogeGVuL2FyY2gveDg2L2lvX2FwaWMuYyAg
ICB8ICA2ICsrKystLQogeGVuL2FyY2gveDg2L2lycS5jICAgICAgICB8IDEzICsrKysrKysrKyst
LS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9tc2kuYyAgICAgICAgfCAgNCArKystCiB4ZW4vYXJjaC94
ODYvc21wLmMgICAgICAgIHwgMTQgKysrKysrKysrKysrKy0KIHhlbi9hcmNoL3g4Ni9zbXBib290
LmMgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHhlbi9pbmNsdWRl
L2FzbS14ODYvc21wLmggfCAxNSArKysrKysrKysrKy0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgOTQg
aW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
