Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E360F16FED6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:23:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vfU-0007VN-Li; Wed, 26 Feb 2020 12:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6vfT-0007VI-If
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:19:59 +0000
X-Inumbo-ID: 4e25e2aa-5892-11ea-a490-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e25e2aa-5892-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582719599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ct6m3bHGnLAGkMfOIJv/JmXdFrdUhc9DzAOxHslsCXI=;
 b=HFTB7BTjaRGxbAP+UNwX5vBl0gWXNnpj0JE7F+dK8l6MBVO15DqPR3Bk
 9HSquoS8bbznKEWPLG7iuHEid3A+9bkIqLJPWr4QgFTgsvI/AGBVtlBRw
 0sbna/HxcfI8+fIc2fwJdnBtQPwSf7IR/7fQiXKOHTmfZo45w8ZFJyQd5 Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2Mgr4a6FAUvMG+cR1n0+uJZbdeXILwKB2Y7VGQHx03XGh7BdbPc6p4hZRkIzZRqZwBGRpYlCAL
 eO+nPiGdPIM+vjPPSTQ6909oT4NFpdz/8ADVG0T+bKTYPJ4rvI8ScXrcBlvX2VIlG9dgILj1h1
 XnKZ6SWGcX70XGuRFvAoERtP529uBKlpJ5upQfvIP6morB8MK33VjVvmzExmvbInDU/MtQwjRt
 ujYkXeGH4sO4aYVMY5kyCOzlalJ2sDStT/oKZv5Zs5rMPiJf/kXG8EmyGaPOG+5CT2Rf7ZPKet
 cC0=
X-SBRS: 2.7
X-MesageID: 13659717
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13659717"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 13:19:17 +0100
Message-ID: <20200226121921.28627-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/4] x86/smp: fix send_IPI_mask usage of
 scratch_cpumask
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
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
bm90IHNhZmUuIFBhdGNoICM0IGlzIGEgZml4IGZvciB0aGF0IHVzYWdlLAp0b2dldGhlciB3aXRo
IGFsc28gcHJldmVudGluZyB0aGUgdXNhZ2Ugb2YgYW55IHBlci1DUFUgdmFyaWFibGVzIHdoZW4K
c2VuZF9JUElfbWFzayBpcyBjYWxsZWQgZnJvbSAjTUMgb3IgTk1JIGNvbnRleHQuIFByZXZpb3Vz
IHBhdGNoZXMgYXJlCnByZXBhcmF0b3J5IGNoYW5nZXMuCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIg
UGF1IE1vbm5lICg0KToKICB4ODY6IGludHJvZHVjZSBhIG5taV9jb3VudCB0cmFja2luZyB2YXJp
YWJsZQogIHg4NjogdHJhY2sgd2hlbiBpbiBOTUkgY29udGV4dAogIHg4NjogdHJhY2sgd2hlbiBp
biAjTUMgY29udGV4dAogIHg4Ni9zbXA6IGRvIG5vdCB1c2Ugc2NyYXRjaF9jcHVtYXNrIHdoZW4g
aW4gaW50ZXJydXB0IG9yIGV4Y2VwdGlvbgogICAgY29udGV4dAoKIHhlbi9hcmNoL3g4Ni9jcHUv
bWNoZWNrL21jZS5jIHwgIDIgKysKIHhlbi9hcmNoL3g4Ni9ubWkuYyAgICAgICAgICAgIHwgMTEg
KysrKystLS0tLS0KIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgICAgIHwgMTIgKysrKysrKysr
KysrCiB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICB8IDEwICsrKysrKysrKy0KIHhlbi9p
bmNsdWRlL2FzbS14ODYvaGFyZGlycS5oIHwgMTMgKysrKysrKysrKysrLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9ubWkuaCAgICAgfCAgMiArKwogeGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0Lmgg
fCAgMSAtCiA3IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
