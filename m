Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD314CCB9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:48:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwobB-0007Ha-V8; Wed, 29 Jan 2020 14:45:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yA0q=3S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwobA-0007H8-4T
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:45:44 +0000
X-Inumbo-ID: 027d97d2-42a6-11ea-b211-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 027d97d2-42a6-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580309137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aTx9zYJ42cXd+ovOU1wPK7fiBk28ZOmSha7iU7SLwHg=;
 b=DVbGAiIcpubKKlNc9ABQvNZ/5ki592ilbEtby2IzI6VOlE2jDICJo9bs
 HrXx7f/Oa3wZtN8jPXpSU08MGa7wuWhIRR0pFP8CXbZKe1Q2kXtVP9PAC
 wUZLe6pvslQw/pVHXi9svXHd3ghGOz9htM7+Evw203XDxXdAHZQEOSRTJ Y=;
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
IronPort-SDR: BVU0H13PlxrLQdayLcY6I3StyS+HvCZ28CgG5gbndq0yP5VSwGFOLyWWxkqlic0homvtyeUVuV
 PNG0UmJGKj5AGOTSbjJJWXqyYT086acfCuxWDSUy68QUzqix3p226HTLvO5owiDqEqipVWtRnJ
 Lj5hnFOz1hpANy59FpWVSzT+hVocuvwqXHYiM15zIa03dIPN9CCZIqnw0ZMenumPczZTiQ1v22
 hmaKBy9akSadVJDzbWo3PEuBPM87NSWn+mpykpsf90IJDf7W9H9tIdJYr9MqQ9tbfBIRs2ZeAs
 5rg=
X-SBRS: 2.7
X-MesageID: 11633377
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,378,1574139600"; d="scan'208";a="11633377"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 15:45:14 +0100
Message-ID: <20200129144514.96686-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129144514.96686-1-roger.pau@citrix.com>
References: <20200129144514.96686-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/2] nvmx: always trap accesses to x2APIC MSRs
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TmVzdGVkIFZNWCBkb2Vzbid0IGV4cG9zZSBzdXBwb3J0IGZvcgpTRUNPTkRBUllfRVhFQ19WSVJU
VUFMSVpFX1gyQVBJQ19NT0RFLApTRUNPTkRBUllfRVhFQ19WSVJUVUFMX0lOVFJfREVMSVZFUlkg
b3IKU0VDT05EQVJZX0VYRUNfQVBJQ19SRUdJU1RFUl9WSVJULCBhbmQgaGVuY2UgdGhlIHgyQVBJ
QyBNU1JzIHNob3VsZAphbHdheXMgYmUgdHJhcHBlZCBpbiB0aGUgbmVzdGVkIGd1ZXN0IE1TUiBi
aXRtYXAsIG9yIGVsc2UgYSBuZXN0ZWQKZ3Vlc3QgY291bGQgYWNjZXNzIHRoZSBoYXJkd2FyZSB4
MkFQSUMgTVNScyBnaXZlbiBjZXJ0YWluIGNvbmRpdGlvbnMuCgpBY2Nlc3NpbmcgdGhlIGhhcmR3
YXJlIE1TUnMgY291bGQgYmUgYWNoaWV2ZWQgYnkgZm9yY2luZyB0aGUgTDAgWGVuIHRvCnVzZSBT
RUNPTkRBUllfRVhFQ19WSVJUVUFMSVpFX1gyQVBJQ19NT0RFIGFuZApTRUNPTkRBUllfRVhFQ19W
SVJUVUFMX0lOVFJfREVMSVZFUlkgb3IKU0VDT05EQVJZX0VYRUNfQVBJQ19SRUdJU1RFUl9WSVJU
IChpZiBzdXBwb3J0ZWQpLCBhbmQgdGhlbiBjcmVhdGluZyBhCkwyIGd1ZXN0IHdpdGggYSBNU1Ig
Yml0bWFwIHRoYXQgZG9lc24ndCB0cmFwIGFjY2Vzc2VzIHRvIHRoZSB4MkFQSUMKTVNSIHJhbmdl
LiBUaGVuIE9SJ2luZyBib3RoIEwwIGFuZCBMMSBNU1IgYml0bWFwcyB3b3VsZCByZXN1bHQgaW4g
YQpiaXRtYXAgdGhhdCBkb2Vzbid0IHRyYXAgY2VydGFpbiB4MkFQSUMgTVNScyBhbmQgYSBWTUNT
IHRoYXQgZG9lc24ndApoYXZlIFNFQ09OREFSWV9FWEVDX1ZJUlRVQUxJWkVfWDJBUElDX01PREUg
YW5kClNFQ09OREFSWV9FWEVDX1ZJUlRVQUxfSU5UUl9ERUxJVkVSWSBvcgpTRUNPTkRBUllfRVhF
Q19BUElDX1JFR0lTVEVSX1ZJUlQgc2V0IGVpdGhlci4KCkZpeCB0aGlzIGJ5IG1ha2luZyBzdXJl
IHgyQVBJQyBNU1JzIGFyZSBhbHdheXMgdHJhcHBlZCBpbiB0aGUgbmVzdGVkCk1TUiBiaXRtYXAu
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIE5ldyBpbiB0aGlzIHZlcnNpb24gKHNwbGl0IGZyb20g
IzEgcGF0Y2gpLgogLSBVc2Ugbm9uLWxvY2tlZCBzZXRfYml0LgotLS0KIHhlbi9hcmNoL3g4Ni9o
dm0vdm14L3Z2bXguYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2Fy
Y2gveDg2L2h2bS92bXgvdnZteC5jCmluZGV4IGMzNWI0YmFiODQuLjY5ZGQ0Y2Y2ZWEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZt
L3ZteC92dm14LmMKQEAgLTU4OSw2ICs1ODksMTYgQEAgc3RhdGljIHZvaWQgdXBkYXRlX21zcmJp
dG1hcChzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgICAgICAgdi0+YXJjaC5odm0udm14Lm1zcl9i
aXRtYXAtPndyaXRlX2hpZ2gsCiAgICAgICAgICAgICAgIHNpemVvZihtc3JfYml0bWFwLT53cml0
ZV9oaWdoKSAqIDgpOwogCisgICAgLyoKKyAgICAgKiBOZXN0ZWQgVk1YIGRvZXNuJ3Qgc3VwcG9y
dCBhbnkgeDJBUElDIGhhcmR3YXJlIHZpcnR1YWxpemF0aW9uLCBzbworICAgICAqIG1ha2Ugc3Vy
ZSBhbGwgdGhlIHgyQVBJQyBNU1JzIGFyZSB0cmFwcGVkLgorICAgICAqLworICAgIGZvciAoIG1z
ciA9IE1TUl9YMkFQSUNfRklSU1Q7IG1zciA8PSBNU1JfWDJBUElDX0ZJUlNUICsgMHhmZjsgbXNy
KysgKQorICAgIHsKKyAgICAgICAgX19zZXRfYml0KG1zciwgbXNyX2JpdG1hcC0+cmVhZF9sb3cp
OworICAgICAgICBfX3NldF9iaXQobXNyLCBtc3JfYml0bWFwLT53cml0ZV9sb3cpOworICAgIH0K
KwogICAgIHVubWFwX2RvbWFpbl9wYWdlKG1zcl9iaXRtYXApOwogCiAgICAgX192bXdyaXRlKE1T
Ul9CSVRNQVAsIHBhZ2VfdG9fbWFkZHIobnZteC0+bXNyX21lcmdlZCkpOwotLSAKMi4yNS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
