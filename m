Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913F1619E7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3lN3-0000jY-NL; Mon, 17 Feb 2020 18:43:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3lN2-0000j9-Ku
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 18:43:52 +0000
X-Inumbo-ID: 7062c59c-51b5-11ea-ade5-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7062c59c-51b5-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581965031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PSjrpyWOnBjKZaPsxLjnCRSym2/6g9ulQp9N6kUFtqA=;
 b=SsAoDNzKmHqHhSj3forjuD2e3FSGGu/HVVdiIMnpJkIcmTNP1yCUhO7N
 5JpeTC/M4Xf4e+X/jO6cNLyMgzVuHpWFNHd0icVFjxdhEmVmd5bDxXm5d
 00uEhNHTB7mUzNgvuNvT8K5MqkNQ/qodnZDuKbFE7NF/QZN+uWJR//CGg 4=;
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
IronPort-SDR: /DGzG4OTu0h1VzVRsdkct73Cwkv9jIzLmMlXtN/wJy39ZjO/XAlPJz07tG9SBDCty3qJxJ1w1s
 EQCgeQuddCyb7svH3GvZawUi2xfuDmW+KA7Ad3QX/y63oqnOaDU6bDyUlRcXF3+8WrwxQ39VEh
 84i+T34cueae09OaLl4anG1bKS8ruIB0g/mRDLk5AVlZTGmExFBYf32NupQZa6EEgHlhrw102+
 nC99SysC+n61IG+SeQYXWybzSP6iG31DbTCqugJWqMwIyuX1AIV3pwOQuXNa0LMAJSr1OBzArd
 wrM=
X-SBRS: 2.7
X-MesageID: 12584066
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12584066"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 19:43:18 +0100
Message-ID: <20200217184324.73762-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/6] x86: fixes/improvements for scratch
 cpumask
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDb21taXQ6Cgo1NTAwZDI2NWEyYThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1
Cng4Ni9zbXA6IHVzZSBBUElDIEFMTEJVVCBkZXN0aW5hdGlvbiBzaG9ydGhhbmQgd2hlbiBwb3Nz
aWJsZQoKSW50cm9kdWNlZCBhIGJvZ3VzIHVzYWdlIG9mIHRoZSBzY3JhdGNoIGNwdW1hc2s6IGl0
IHdhcyB1c2VkIGluIGEKZnVuY3Rpb24gdGhhdCBjb3VsZCBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1
cHQgY29udGV4dCwgYW5kIGhlbmNlIHVzaW5nCnRoZSBzY3JhdGNoIGNwdW1hc2sgdGhlcmUgaXMg
bm90IHNhZmUuIFBhdGNoICM1IGlzIGEgZml4IGZvciB0aGF0IHVzYWdlLAp0b2dldGhlciB3aXRo
IGFsc28gcHJldmVudGluZyB0aGUgdXNhZ2Ugb2YgYW55IHBlci1DUFUgdmFyaWFibGVzIHdoZW4K
c2VuZF9JUElfbWFzayBpcyBjYWxsZWQgZnJvbSAjTUMgb3IgI05NSSBjb250ZXh0LiBQcmV2aW91
cyBwYXRjaGVzIGFyZQpwcmVwYXJhdG9yeSBjaGFuZ2VzLgoKUGF0Y2ggIzYgYWRkcyBzb21lIGRl
YnVnIGluZnJhc3RydWN0dXJlIHRvIG1ha2Ugc3VyZSB0aGUgc2NyYXRjaCBjcHVtYXNrCmlzIHVz
ZWQgaW4gdGhlIHJpZ2h0IGNvbnRleHQsIGFuZCBoZW5jZSBzaG91bGQgcHJldmVudCBmdXJ0aGVy
IG1pc3N1c2VzLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoNik6CiAgeDg2L3Nt
cDogdW5pZnkgaGVhZGVyIGluY2x1ZGVzIGluIHNtcC5oCiAgeDg2OiBpbnRyb2R1Y2UgYSBubWlf
Y291bnQgdHJhY2tpbmcgdmFyaWFibGUKICB4ODY6IHRyYWNrIHdoZW4gaW4gI01DIGNvbnRleHQK
ICB4ODY6IHRyYWNrIHdoZW4gaW4gI05NSSBjb250ZXh0CiAgeDg2L3NtcDogdXNlIGEgZGVkaWNh
dGVkIHNjcmF0Y2ggY3B1bWFzayBpbiBzZW5kX0lQSV9tYXNrCiAgeDg2OiBhZGQgYWNjZXNzb3Jz
IGZvciBzY3JhdGNoIGNwdSBtYXNrCgogeGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMgfCAg
MiArKwogeGVuL2FyY2gveDg2L2lvX2FwaWMuYyAgICAgICAgfCAgNiArKystLQogeGVuL2FyY2gv
eDg2L2lycS5jICAgICAgICAgICAgfCAxMyArKysrKystLS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAg
ICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKystLS0tLS0tCiB4ZW4vYXJjaC94ODYvbXNpLmMg
ICAgICAgICAgICB8ICA0ICsrLQogeGVuL2FyY2gveDg2L25taS5jICAgICAgICAgICAgfCAxMSAr
KysrLS0tLQogeGVuL2FyY2gveDg2L3NtcC5jICAgICAgICAgICAgfCA1MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICAgICAgfCAx
MCArKysrKy0tCiB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICB8IDEwICsrKysrKy0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvaGFyZGlycS5oIHwgMjMgKysrKysrKysrKysrKysrLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ubWkuaCAgICAgfCAgMiArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAu
aCAgICAgfCAxNSArKysrKysrKy0tLQogeGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmggfCAg
MSArCiAxMyBmaWxlcyBjaGFuZ2VkLCAxNDggaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0p
CgotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
