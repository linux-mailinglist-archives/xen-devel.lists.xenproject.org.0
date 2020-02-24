Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF9D16A449
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:49:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6BGT-0004sS-Dl; Mon, 24 Feb 2020 10:47:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6BGS-0004sN-Iy
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:47:04 +0000
X-Inumbo-ID: fe07af43-56f2-11ea-8ae3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe07af43-56f2-11ea-8ae3-12813bfff9fa;
 Mon, 24 Feb 2020 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582541225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MWHyeD07oUOwo4sfLYENLHhv2Nv2zqFX8I71C61dx00=;
 b=Oyz51k/17pBI0KTA9GBLBxGVMsqozSrYaSnUvD1uDWn3kIIbXFZmimY4
 KqZ1lKre2xhaykf7QxG3uqfYtm9hp6YAbw8dhqqsHcPzcx6umULBC8z21
 k+c1fQtBKYBgvJgWLaZfT2h6XPZuN7Zdo4y8Y0s8WccqxbjW91tMbfMRh w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RS+y95R9Z68u6dZfKl77gnpG+MAoKVXEF0RMCebD3nq/ho8/92Zwxddf1rMTVQGry0zfXjp0Jg
 eGf98GpEgZTCDlY5MpcYrVRd6pQvA6a4+6PPQCkHEALflDQlPhIih1UqqiiX7vYOFh1IIB4bAX
 o2xHmQEHAKr4Sm7fZ6gfkI+QkFKrQexFEdhvsm6PNBcfH16FC2t7P4/LjH2KTgG6gPYDwLTD2+
 pDugu/mof13z8k4qjwdtM/pEqPTk3CCnwnhyqAaWIBllMfQ0o+0Vtco/A2wv+tEgfB8221V7y6
 Asw=
X-SBRS: 2.7
X-MesageID: 13076646
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13076646"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 11:46:40 +0100
Message-ID: <20200224104645.96381-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/5] x86: fixes/improvements for scratch
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
c2VuZF9JUElfbWFzayBpcyBjYWxsZWQgZnJvbSAjTUMgb3IgI05NSSBjb250ZXh0LiBQcmV2aW91
cyBwYXRjaGVzIGFyZQpwcmVwYXJhdG9yeSBjaGFuZ2VzLgoKUGF0Y2ggIzUgYWRkcyBzb21lIGRl
YnVnIGluZnJhc3RydWN0dXJlIHRvIG1ha2Ugc3VyZSB0aGUgc2NyYXRjaCBjcHVtYXNrCmlzIHVz
ZWQgaW4gdGhlIHJpZ2h0IGNvbnRleHQsIGFuZCBoZW5jZSBzaG91bGQgcHJldmVudCBmdXJ0aGVy
IG1pc3N1c2VzLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoNSk6CiAgeDg2OiBp
bnRyb2R1Y2UgYSBubWlfY291bnQgdHJhY2tpbmcgdmFyaWFibGUKICB4ODY6IHRyYWNrIHdoZW4g
aW4gI05NSSBjb250ZXh0CiAgeDg2OiB0cmFjayB3aGVuIGluICNNQyBjb250ZXh0CiAgeDg2L3Nt
cDogdXNlIGEgZGVkaWNhdGVkIHNjcmF0Y2ggY3B1bWFzayBpbiBzZW5kX0lQSV9tYXNrCiAgeDg2
OiBhZGQgYWNjZXNzb3JzIGZvciBzY3JhdGNoIGNwdSBtYXNrCgogeGVuL2FyY2gveDg2L2NwdS9t
Y2hlY2svbWNlLmMgfCAgMiArKwogeGVuL2FyY2gveDg2L2lvX2FwaWMuYyAgICAgICAgfCAgNiAr
Ky0tCiB4ZW4vYXJjaC94ODYvaXJxLmMgICAgICAgICAgICB8IDEzICsrKysrKystLQogeGVuL2Fy
Y2gveDg2L21tLmMgICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKy0tLS0tLQogeGVuL2Fy
Y2gveDg2L21zaS5jICAgICAgICAgICAgfCAgNCArKy0KIHhlbi9hcmNoL3g4Ni9ubWkuYyAgICAg
ICAgICAgIHwgMTEgKysrKy0tLS0KIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgICAgIHwgNTIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHhlbi9hcmNoL3g4Ni9zbXBib290
LmMgICAgICAgIHwgMTAgKysrKystLQogeGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgfCAx
MCArKysrKystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaCB8IDEzICsrKysrKysrLQog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ubWkuaCAgICAgfCAgMiArKwogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9zbXAuaCAgICAgfCAxMCArKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4vaXJxX2NwdXN0YXQuaCB8
ICAxIC0KIDEzIGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMo
LSkKCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
