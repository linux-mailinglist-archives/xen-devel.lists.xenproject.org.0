Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A728177D53
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:23:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9BEB-0007Q5-K4; Tue, 03 Mar 2020 17:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dy3W=4U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9BE9-0007Pu-QR
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 17:21:05 +0000
X-Inumbo-ID: 5bff284d-5d73-11ea-a1d1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bff284d-5d73-11ea-a1d1-12813bfff9fa;
 Tue, 03 Mar 2020 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583256064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hgehW7pdoO+PQgde3bE5c4X784+ZWJe3Ly61wUKLYwk=;
 b=ejk1IitSkpqbIYDVgxULRQOPUiWrSQ6xfiNy02eas3DNIokr5ZijpYyz
 KNSix7XJrelUJ3vFXvlCnUp0YMo3rvGHJGOSOCHdwuCnWeICphr7X6FgB
 XmF/zB1TtoTBNR80oI/jhaiPhwJ0QIIHbE56hSM6kf+xCuuBJKJkP7h7c w=;
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
IronPort-SDR: LBDJ2/MNGqI/p7cha3O5ULmg5Gkjpyj0dz4V2eqwBE+8vmKHdv0SO5bo/l+2GDUbWh+Jkng1dW
 Dvx+0NXcNexvVOTx4C/sCpGJdgEfcnvvtnVkYFRLMcVgKYV0XmQxhP1QnLypdqIDBxVaxnPd37
 xr0hfQAJ4joUSnMBjAz4VQKr8hX7vXb6noaNWTGSY3UePjRHl+NPsmWGH6KPs9XzX1XdxmqEno
 TvH9dnvE/SdNmOlwX3QWHFUbMls1Cl2p5NW3ZscZJEiILRDh5bn6vIj1GFntt+qvETlNo7wa2u
 Lu4=
X-SBRS: 2.7
X-MesageID: 13353941
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13353941"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Mar 2020 18:20:40 +0100
Message-ID: <20200303172046.50569-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 0/6] x86: improve assisted tlb flush and use
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
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
aWVsZCBpbiBwYXRjaAojNy4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDYpOgog
IHg4Ni9odm06IGFsbG93IEFTSUQgZmx1c2ggd2hlbiB2ICE9IGN1cnJlbnQKICB4ODYvcGFnaW5n
OiBhZGQgVExCIGZsdXNoIGhvb2tzCiAgeDg2L2hhcDogaW1wcm92ZSBoeXBlcnZpc29yIGFzc2lz
dGVkIGd1ZXN0IFRMQiBmbHVzaAogIHg4Ni90bGI6IGludHJvZHVjZSBhIGZsdXNoIGd1ZXN0cyBU
TEIgZmxhZwogIHg4Ni90bGI6IGFsbG93IGRpc2FibGluZyB0aGUgVExCIGNsb2NrCiAgeDg2L3Rs
YjogdXNlIFhlbiBMMCBhc3Npc3RlZCBUTEIgZmx1c2ggd2hlbiBhdmFpbGFibGUKCiB4ZW4vYXJj
aC94ODYvZmx1c2h0bGIuYyAgICAgICAgICAgICAgICB8IDI0ICsrKysrKy0tLQogeGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCAxNCArKysrKwogeGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi94ZW4uYyAgICAgICAgICAgfCAgNiArKysKIHhlbi9hcmNoL3g4Ni9odm0vYXNpZC5j
ICAgICAgICAgICAgICAgIHwgIDYgKy0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAg
ICAgICAgICB8IDU2ICstLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3Zpcmlk
aWFuL3ZpcmlkaWFuLmMgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jICAgICAg
ICAgICAgICB8IDUwICsrKysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9j
b21tb24uYyAgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrKysrKy0tLQogeGVuL2FyY2gv
eDg2L21tL3NoYWRvdy9odm0uYyAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tL3No
YWRvdy9tdWx0aS5jICAgICAgICAgfCAxNyArKystLS0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
cHJpdmF0ZS5oICAgICAgIHwgIDQgKysKIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgICAgICAg
ICAgICAgIHwgIDcgKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmggICAgICAgICB8
IDIzICsrKysrKysrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmggfCAx
NyArKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oICAgICAgICAgIHwgIDMgLS0K
IHhlbi9pbmNsdWRlL2FzbS14ODYvcGFnaW5nLmggICAgICAgICAgIHwgMTAgKysrKwogMTYgZmls
ZXMgY2hhbmdlZCwgMjI0IGluc2VydGlvbnMoKyksIDg4IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
