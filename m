Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDE158163
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 18:31:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Crd-0006Wo-Uu; Mon, 10 Feb 2020 17:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1Crc-0006Wj-F7
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 17:28:52 +0000
X-Inumbo-ID: cd772d62-4c2a-11ea-852a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd772d62-4c2a-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581355731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hhR+V+OaGDNndGEWK0lGVMj7XjQx6MPrG0kWQRKYZ2I=;
 b=ElZzerSmpeDONwdPM41bzyRwhPKQFR+0/oF52QWnuCeGR26pXKR5KodI
 /uHaq3uiWuVgJrgff2A+IWxSSXZZm15sEm+MFmqwNDmGqYvu+KrcCIp7K
 BD8Yi5zkVO2KRHAzG2fYw9ILWROPc69ME/ELdY6EsJ/O2PyOR7JcZFmII o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: seX99mzUSVz01UIA+5sVaTiNhcgAbaN6e6nDjBkk77n6ztpzhigbz1A4k7YGAJEccewvoMPDU9
 epL4fKdrlhMmMYADsHAvWfXXWwY5NGod0l2h5nwMb14yGbsckv3fC0fR1zeb47p/CmJqkVi+68
 8PqIsxufudbWutIpIrerl0GOPb2eIZrlhmcUM1Ay6fTym8KHb9GHvV3KB0tOQkCrRQv1WsMsBl
 ArQk1fe+NgVvBRntkzbryublVY0JzEQKqInxg03WN/bvovIOSSzNvxeLZODxNKWHs4RdMUyi79
 /Us=
X-SBRS: 2.7
X-MesageID: 12589322
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12589322"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 18:28:22 +0100
Message-ID: <20200210172829.43604-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/7] x86: improve assisted tlb flush and use
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
aWRpYW4gVExCIGZsdXNoIGFzc2lzdCAoaWU6IFdpbmRvd3MpLgoKVGhhbmtzLCBSb2dlci4KClJv
Z2VyIFBhdSBNb25uZSAoNyk6CiAgeDg2L2h2bTogYWxsb3cgQVNJRCBmbHVzaCB3aGVuIHYgIT0g
Y3VycmVudAogIHg4Ni9wYWdpbmc6IGFkZCBUTEIgZmx1c2ggaG9va3MKICB4ODYvaGFwOiBpbXBy
b3ZlIGh5cGVydmlzb3IgYXNzaXN0ZWQgZ3Vlc3QgVExCIGZsdXNoCiAgeDg2L3RsYjogaW50cm9k
dWNlIGEgZmx1c2ggZ3Vlc3RzIFRMQiBmbGFnCiAgeDg2L3RsYjogYWxsb3cgZGlzYWJsaW5nIHRo
ZSBUTEIgY2xvY2sKICB4ZW4vZ3Vlc3Q6IHByZXBhcmUgaHlwZXJ2aXNvciBvcHMgdG8gdXNlIGFs
dGVybmF0aXZlIGNhbGxzCiAgeDg2L3RsYjogdXNlIFhlbiBMMCBhc3Npc3RlZCBUTEIgZmx1c2gg
d2hlbiBhdmFpbGFibGUKCiB4ZW4vYXJjaC94ODYvZmx1c2h0bGIuYyAgICAgICAgICAgICAgICB8
IDI0ICsrKysrKy0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyAgICAgfCAg
MiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgfCA1MSArKysrKysr
KysrLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgICAgICAgIHwgIDgg
KystCiB4ZW4vYXJjaC94ODYvaHZtL2FzaWQuYyAgICAgICAgICAgICAgICB8ICA2ICstLQogeGVu
L2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgICAgICAgfCA1MSArKy0tLS0tLS0tLS0tLS0t
LS0KIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgICAgICAgICAgICAgIHwgNTIgKysrKysrKysr
KysrKysrKysrKwogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYyAgICAgICAgfCA3MSAr
KysrKysrKysrKysrKysrKysrKysrKy0tLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYyAg
ICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0aS5jICAgICAgICAg
fCAxNiArKystLS0KIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgICAgICAgICAgICAgIHwgMTEg
KysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oICAgICAgICAgfCAxOSArKysrKyst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDE3ICsrKysrKwogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9oYXAuaCAgICAgICAgICAgICAgfCAgMyArKwogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9zaGFkb3cuaCAgICAgICAgICAgfCAxMiArKysrKwogMTUgZmlsZXMgY2hhbmdlZCwg
MjQ2IGluc2VydGlvbnMoKyksIDk5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
