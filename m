Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937C9B1E7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 16:28:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1AVV-0005Vh-3f; Fri, 23 Aug 2019 14:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Rn6=WT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i1AVT-0005Vc-Nm
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 14:25:35 +0000
X-Inumbo-ID: ddc64b80-c5b1-11e9-b95f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddc64b80-c5b1-11e9-b95f-bc764e2007e4;
 Fri, 23 Aug 2019 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566570333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qgGX/NLbWiKh09NcGoY8Bc6X9frZtpF0tDa9+e3hV60=;
 b=QDx8GncJm+nKt5Fk+YREg27HtdW8b44+El1hyDZy+RTsOzBIvHPtOIkA
 Rs5MYfnYNtsiz5WPVoNlNR3R/IpTfNZOvCMyPneHZ1S8tv1T3d8rEmx9p
 pZUIyg+Qyuu7rh4N4PZAlkpPdzB/cZscLUDMDkXyiQc3ii/SwzPc5LX7b Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7lK2TcUrJdtkWxdfuGwGsIr9xwcLxYo2VYurssJOXTXt8voB1czwIE6/hYMFvO7i1Eo6Opu6Il
 kVrxTxHBC75SYwXcaBH1Ql7ydWspVJ8G1egRUNm8DYHz32g9Z5J6vj2fL+PMLgsLPiD14bTgA5
 gcqFgep+SPoLT69nvwfVmT8aJAFTwGU2hfkF56LFOCjRSwdL/otoaDIG4WGLe9SW4xgU14x/uZ
 hqlQ4mLqV+srKCciJEwe/aAAD3v0w/Vv/H78qCutuexWd4fowPsA35EUeYWsuAQdr+d8Zl6a/v
 b/Q=
X-SBRS: 2.7
X-MesageID: 4857790
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,421,1559534400"; 
   d="scan'208";a="4857790"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 23 Aug 2019 15:25:29 +0100
Message-ID: <20190823142529.21521-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: Fold SVM into x86
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIG5vdyBkb3duIHRvIDAgU1ZNIG1haW50YWluZXJzIHdobyBhcmUgYWN0aXZlIGFuZCB3
aXNoIHRvIGhvbGQgdGhlCnBvc2l0aW9uLiAgRmFsbCBiYWNrIHRvIGdlbmVyYWwgeDg2IG1haW50
ZW5hbmNlIHVudGlsIHRoaXMgcG9zaXRpb24gY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogQm9yaXMgT3N0cm92
c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ0M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5p
dCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGV1LmNpdHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4K
Q0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFRpbSBEZWVnYW4g
PHRpbUB4ZW4ub3JnPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxMiAtLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVS
UyBiL01BSU5UQUlORVJTCmluZGV4IDI1MWJmZTIwMTYuLjVkN2MzODU3MjAgMTAwNjQ0Ci0tLSBh
L01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xNDQsMTggKzE0NCw2IEBAIEY6CXhl
bi9kcml2ZXJzL2FjcGkvCiBGOgl4ZW4vaW5jbHVkZS9hY3BpLwogRjoJdG9vbHMvbGliYWNwaS8K
IAotQU1EIElPTU1VCi1NOglTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxw
YW5pdEBhbWQuY29tPgotUzoJTWFpbnRhaW5lZAotRjoJeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kLwotCi1BTUQgU1ZNCi1NOglCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgotTToJU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRA
YW1kLmNvbT4KLVM6CVN1cHBvcnRlZAotRjoJeGVuL2FyY2gveDg2L2h2bS9zdm0vCi1GOgl4ZW4v
YXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKLQogQVJHTwogTToJQ2hyaXN0b3BoZXIgQ2xhcmsgPGNo
cmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPgogUzoJTWFpbnRhaW5lZAotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
