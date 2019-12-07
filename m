Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9170A115EBF
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 22:20:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idhRh-0005vn-TS; Sat, 07 Dec 2019 21:16:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idhRg-0005vL-Gb
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 21:16:56 +0000
X-Inumbo-ID: e2eea48b-1936-11ea-8621-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2eea48b-1936-11ea-8621-12813bfff9fa;
 Sat, 07 Dec 2019 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575753412;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=G2k+67YqIkNV8N2IUDSQSTGFUyAC8ujaT64QoyiO1II=;
 b=V+ts7Hr0+Iw7bUbgYeBwbm4aNToYZc4f95cJ7eAJUE9fpXuLyFBNt6cG
 118zGJ59N4PtBLx8Y0G3+DYcYpQDDeO2AAhZMEii5V1BBX9Vt05XaHtLh
 7GFD5jic39UiV70Fm2dS0DndczhSBkSXsNwdSuQVtcvXQXHB6MGrImVAZ Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tpRrdvpq5303JtA35vr75AT61r30HUxn3LFL+dRrzQ2uDrtuukvM1y+MHt1YyQJdhscFjt5XRl
 ikZgS6MgnndE34XRx7+N3/PqNZDSI+6+AE3Ex2+oU4cX3XVX7ltSb399jwe01DP4U5GKshMQfx
 nLWe+2z1FQvFbd0HfdBi7CdWYzjnA2RANBEM7NOgsBu5HNUByyhhJ4jmpdafyZMU7avm8uqIR+
 7hTcOvjqPHq3ya8Jgq4OBkV/9vIoh4Qpo36Cmyx5EUAm4sOkFiVmiaxCUS1hGjk+GZ5RBO8oYP
 5sA=
X-SBRS: 2.7
X-MesageID: 9355331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9355331"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 21:16:31 +0000
Message-ID: <20191207211634.9958-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v3 0/3] xen: Build fixes related to
 Python3
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggMyBpcyBhIGZpeCBmb3IgYSBwcm9ibGVtIHJlcG9ydGVkIG9uIElSQy4gIEl0IGlzIGEg
dmVyeS1uaWNlLXRvLWhhdmUKY29uc2lkZXJpbmcgb3VyIGF0dGVtcHQgdG8gbWFrZSBYZW4gNC4x
MyBQeTMtY2xlYW4uCgpXaGlsZSB0ZXN0aW5nIHBhdGNoIDMsIGl0IGJlY2FtZSBhcHBhcmVudCB0
aGF0IFhTTS9GbGFzayBpc24ndCBQeTMtY2xlYW4sIGFuZAp0aGlzIGlzIGEgYmxvY2tlci4gIEl0
IGlzIGFkZHJlc3NlZCBpbiBwYXRjaCAxLgoKUGF0Y2ggMiBhZGRyZXNzZXMgYSBidWcgc3BvdHRl
ZCBieSBHaXRsYWIgd2hpbGUgdGVzdGluZyB2MSBvZiB0aGlzIHNlcmllcy4gIEl0Cmlzbid0IHN0
cmljdGx5IGEgUHkzIGJ1ZywgYnV0IGlzIGEgYnVpbGQgc3lzdGVtIHJvYnVzdG5lc3MgZml4LgoK
djMgb2YgdGhpcyBzZXJpZXMgZml4ZXMgYWxsIFRyYXZpcyBhbmQgR2l0bGFiIGlkZW50aWZpZWQg
aXNzdWVzOgogIGh0dHBzOi8vdHJhdmlzLWNpLm9yZy9hbmR5aGhwL3hlbi9idWlsZHMvNjIyMDky
NTAzCiAgaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi9w
aXBlbGluZXMvMTAxNDE3ODYxCgpBbmRyZXcgQ29vcGVyICgzKToKICB4ZW4vZmxhc2s6IERyb3Ag
dGhlIGdlbi1wb2xpY3kucHkgc2NyaXB0CiAgeGVuL2Jhbm5lcjogRHJvcCB0aGUgZmlnLXRvLW9j
dC5weSBzY3JpcHQKICB4ZW4vYnVpbGQ6IEF1dG9tYXRpY2FsbHkgbG9jYXRlIGEgc3VpdGFibGUg
cHl0aG9uIGludGVycHJldGVyCgogeGVuL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICA3ICsr
KysrKy0KIHhlbi90b29scy9maWctdG8tb2N0LnB5ICAgICAgfCAxOCAtLS0tLS0tLS0tLS0tLS0t
LS0KIHhlbi90b29scy9wcm9jZXNzLWJhbm5lci5zZWQgfCAxNCArKysrKysrKysrKysrKwogeGVu
L3hzbS9mbGFzay9NYWtlZmlsZSAgICAgICB8ICA2ICsrLS0tLQogeGVuL3hzbS9mbGFzay9mbGFz
ay1wb2xpY3kuUyB8IDIwICsrKysrKysrKysrKysrKysrKysrCiB4ZW4veHNtL2ZsYXNrL2dlbi1w
b2xpY3kucHkgIHwgMjMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgeGVu
L3Rvb2xzL2ZpZy10by1vY3QucHkKIGNyZWF0ZSBtb2RlIDEwMDc1NSB4ZW4vdG9vbHMvcHJvY2Vz
cy1iYW5uZXIuc2VkCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3hzbS9mbGFzay9mbGFzay1wb2xp
Y3kuUwogZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weQoKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
