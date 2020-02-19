Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13152164C78
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:48:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4TOR-0001lD-8Z; Wed, 19 Feb 2020 17:44:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4TOP-0001l8-Ex
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:44:13 +0000
X-Inumbo-ID: 70492f53-533f-11ea-83f8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70492f53-533f-11ea-83f8-12813bfff9fa;
 Wed, 19 Feb 2020 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582134253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XFuw4V3DV7KmNKDN4acKnRUBAbUktxJuJM/lwTBWALA=;
 b=JVq8PGZzx+q6fecib84x4fuNwQlfUUbOddUslyPbpv5wY+wlqLfo71N8
 ODkt/fNhfsWidMaIlQmn+OSoV5EuFhKufzgjZnFk2o3okBDZqPLe79Bn+
 E9n2P7t4fuZx53k9k5XyrbErleogLbwvKx2RkMOST/GiZL4QT7qniaZo/ w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IRkK2lTZ6YaTHX+fmMUhd/+l8BjWFITEZp/wBhKNkpbg57VTPsby9fqMNIUsvRHwV+0+y0Q6bF
 Z8aCSZpEB87xj4S1c58EW8m2ln9bORhgLGeQLdQ2OhVzN6kumk0V+F7Mad1f39Z1UD8fezEU5w
 YVCZlPURGDVGZBxGw82nAkfYd6eMDTa9YTPx9TjGGqpgNICw+Q73lbqao1Oc0ascVJ8kiVLAWZ
 XrNcoMYZ6Qk+FuUr4IhLF0bIrwEMA6XyNT4EglhhoyYcQ4fQLn9c46j9S2npW3s5QuhbhPCtpJ
 Z9g=
X-SBRS: 2.7
X-MesageID: 12689418
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="12689418"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 18:43:47 +0100
Message-ID: <20200219174354.84726-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/7] x86: improve assisted tlb flush and use
 it in guest mode
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
Cc: Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhaW1zIHRvIGltcHJvdmUgdGhlIFRMQiBmbHVz
aCB0aW1lcyB3aGVuIHJ1bm5pbmcKbmVzdGVkIFhlbiwgYW5kIGl0J3Mgc3BlY2lhbGx5IGJlbmVm
aWNpYWwgd2hlbiBydW5uaW5nIGluIHNoaW0gbW9kZS4KCk9ubHkgdGhlIEhBUCBndWVzdCBUTEIg
Zmx1c2ggaXMgaW1wcm92ZWQsIHRoZSBzaGFkb3cgcGFnaW5nIFRMQiBmbHVzaCBpcwpsZWZ0IGFz
LWlzLCBhbmQgY2FuIGJlIGltcHJvdmVkIGxhdGVyIGlmIHRoZXJlJ3MgaW50ZXJlc3QuCgpGb3Ig
YSByZWZlcmVuY2Ugb24gdGhlIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IHNlZSBwYXRjaCAjNywg
YXMgaXQncyBhCmh1Z2UgaW5jcmVhc2Ugd2hpY2ggY2FuIGJlbmVmaXQgb3RoZXIgZ3Vlc3RzIHVz
aW5nIGFzc2lzdGVkIFRMQiBmbHVzaGVzLAphbmQgYWxzbyB0aGUgb25lcyB1c2luZyB0aGUgdmly
aWRpYW4gVExCIGZsdXNoIGFzc2lzdCAoaWU6IFdpbmRvd3MpLgoKQWxsIHBhdGNoZXMgaGF2ZSBh
dCBsZWFzdCBvbmUgUmV2aWV3ZWQtYnkgb3IgQWNrZWQtYnkgdGFnLCB0aGUgb25seSBjb2RlCmNo
YW5nZSB2cyB2NCBpcyBhIGZpeCB0byBleHRyYWN0IHRoZSBvcmRlciBmcm9tIHRoZSBmbGFncyBm
aWVsZCBpbiBwYXRjaAojNy4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDcpOgog
IHg4Ni9odm06IGFsbG93IEFTSUQgZmx1c2ggd2hlbiB2ICE9IGN1cnJlbnQKICB4ODYvcGFnaW5n
OiBhZGQgVExCIGZsdXNoIGhvb2tzCiAgeDg2L2hhcDogaW1wcm92ZSBoeXBlcnZpc29yIGFzc2lz
dGVkIGd1ZXN0IFRMQiBmbHVzaAogIHg4Ni90bGI6IGludHJvZHVjZSBhIGZsdXNoIGd1ZXN0cyBU
TEIgZmxhZwogIHg4Ni90bGI6IGFsbG93IGRpc2FibGluZyB0aGUgVExCIGNsb2NrCiAgeGVuL2d1
ZXN0OiBwcmVwYXJlIGh5cGVydmlzb3Igb3BzIHRvIHVzZSBhbHRlcm5hdGl2ZSBjYWxscwogIHg4
Ni90bGI6IHVzZSBYZW4gTDAgYXNzaXN0ZWQgVExCIGZsdXNoIHdoZW4gYXZhaWxhYmxlCgogeGVu
L2FyY2gveDg2L2ZsdXNodGxiLmMgICAgICAgICAgICAgICAgfCAyNCArKysrKystLS0KIHhlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgNTEgKysrKysrKysrKy0tLS0tLS0tCiB4ZW4vYXJj
aC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAgICB8ICA4ICsrLQogeGVuL2FyY2gveDg2L2h2
bS9hc2lkLmMgICAgICAgICAgICAgICAgfCAgNiArLS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMg
ICAgICAgICAgICAgICAgIHwgNTEgKystLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvbW0v
aGFwL2hhcC5jICAgICAgICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKIHhlbi9hcmNo
L3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysr
KystLS0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMgICAgICAgICAgIHwgIDIgKy0KIHhl
bi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYyAgICAgICAgIHwgMTYgKysrLS0tCiB4ZW4vYXJj
aC94ODYvc21wLmMgICAgICAgICAgICAgICAgICAgICB8IDExICsrKysKIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZmx1c2h0bGIuaCAgICAgICAgIHwgMTkgKysrKysrLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnZpc29yLmggfCAxNyArKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaGFw
LmggICAgICAgICAgICAgIHwgIDMgKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmggICAg
ICAgICAgIHwgMTIgKysrKysKIDE1IGZpbGVzIGNoYW5nZWQsIDI0NiBpbnNlcnRpb25zKCspLCA5
OSBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
