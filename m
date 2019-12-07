Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C118F115D9D
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 17:58:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iddKF-0001Sb-DM; Sat, 07 Dec 2019 16:52:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iddKE-0001SW-6Z
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 16:52:58 +0000
X-Inumbo-ID: 0472a1a8-1912-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0472a1a8-1912-11ea-88e7-bc764e2007e4;
 Sat, 07 Dec 2019 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575737576;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3F6Hp3l5+l7fiaJ2yzqkxjeielInh5D/zoMiMEZl95s=;
 b=bnbRwxp58wO7SYfHzKEDE0hDcklHv7mwyUgK7KGeWze+6ShF5XfFpZcu
 JpNB6D6X5Yz7ixm6XHF0RyM73vOhRGSA1JWBYHHW9mt9ooSIGbQY0Xk6l
 3/9Ll5XA+mTXc6OrKmM+75bxxHzj2i6tuVSRJM8VBwJc9FwGfCFo/+74+ Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J5b6nVJymKT+OZ92aDPRrmbbt6Te4j2WPzM/1iwZh/3CL/m3wasAbWxjsx3Xr6ScDLZdtivf4p
 vVDDHFD/ZDOK06q/s5GLidKSnvQkLQsmjZCwAcz2U+pXBHe3cyfbzixsGfneaHvjOWNTp3WRZf
 4ogiHhTF6lhDJUfmYpyK5Wi8HQJS5VOXRkHi/tGjwP8xPA2WN0/kA/HAtZ+EvTvCZfgNW5vbj8
 ZAMi3SHt0zQvBZ8gCkr24GGtRE0m75IeZxDdZC/E0ROeN3IooXBBBot1BqIopSU5u7iwuMeCSA
 I/4=
X-SBRS: 2.7
X-MesageID: 9905135
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,288,1571716800"; 
   d="scan'208";a="9905135"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 16:52:50 +0000
Message-ID: <20191207165252.1045-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 0/2] xen: Build fixes related to Python3
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

UGF0Y2ggMiBpcyBhIGZpeCBmb3IgYSBwcm9ibGVtIHJlcG9ydGVkIG9uIElSQy4gIEl0IGlzIGEg
dmVyeS1uaWNlLXRvLWhhdmUKY29uc2lkZXJpbmcgb3VyIGF0dGVtcHQgdG8gbWFrZSBYZW4gNC4x
MyBQeTMtY2xlYW4uCgpXaGlsZSB0ZXN0aW5nIHBhdGNoIDIsIGl0IGJlY2FtZSBhcHBhcmVudCB0
aGF0IFhTTS9GbGFzayBpc24ndCBQeTMtY2xlYW4sIGFuZAp0aGlzIGlzIGEgYmxvY2tlci4gIEl0
IGlzIGFkZHJlc3NlZCBpbiBwYXRjaCAxLgoKQW5kcmV3IENvb3BlciAoMik6CiAgeGVuL2ZsYXNr
OiBGaXggUHl0aG9uIDMgcHJvYmxlbXMgd2l0aCBnZW4tcG9saWN5LnB5CiAgeGVuL2J1aWxkOiBB
dXRvbWF0aWNhbGx5IGxvY2F0ZSBhIHN1aXRhYmxlIHB5dGhvbiBpbnRlcnByZXRlcgoKIHhlbi9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgMiArKwogeGVuL3hzbS9mbGFzay9NYWtlZmlsZSAg
ICAgICB8ICA2ICsrLS0tLQogeGVuL3hzbS9mbGFzay9mbGFzay1wb2xpY3kuUyB8IDIwICsrKysr
KysrKysrKysrKysrKysrCiB4ZW4veHNtL2ZsYXNrL2dlbi1wb2xpY3kucHkgIHwgMjMgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjcg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3hzbS9mbGFzay9mbGFzay1wb2xp
Y3kuUwogZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weQoKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
