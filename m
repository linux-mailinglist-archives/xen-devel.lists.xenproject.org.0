Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81F5526F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 16:47:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfmfv-00031N-Vt; Tue, 25 Jun 2019 14:43:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ot0M=UY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfmfu-00031G-89
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 14:43:58 +0000
X-Inumbo-ID: a7d63838-9757-11e9-9671-eb07b6a3f544
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7d63838-9757-11e9-9671-eb07b6a3f544;
 Tue, 25 Jun 2019 14:43:55 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ogToQMOcus1H8JzHtO4pX1p3ml0ZVclSWPYY+24PoOtDrW+YL4Xhk5BGItWiY9r+lECDeBCTcC
 DZgGHi4DmL1HapnOTCxYuLlo33ediz6C+ccJ1tR55mAuKDa3ZIPKLXay4Sozc5UUcXFG2RcyBN
 0/FexJLHKFyF76HSUJhT/ocPOirnob/bHmErdc+4LuUP1h+SxE37c+ukrAHfIN8qnye8bWiPCq
 f4RnvrxU230PHshLzDmTom0WnPAC6w76yzHMxCf6tMFpjDMyooSLATMiGMLi+2zQY3FALTVF0j
 gp4=
X-SBRS: 2.7
X-MesageID: 2196852
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2196852"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 25 Jun 2019 15:43:47 +0100
Message-ID: <20190625144350.6176-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] nodemask: API cleanup and fixes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgc3VwZXJzZWRlcyB0aGUgc2luZ2xlICJwYWdlLWFsbG9jOiBDbGFtcCBnZXRf
ZnJlZV9idWRkeSgpIHRvCm9ubGluZSBub2RlcyIgcGF0Y2gsIGFuZCBwZXJmb3JtcyBzb21lIHBy
ZXBhcmF0b3J5IGNsZWFudXAuCgpBbmRyZXcgQ29vcGVyICgzKToKICBwYWdlLWFsbG9jOiBSZW5h
bWUgdGhlIGZpcnN0X25vZGUgbG9jYWwgdmFyaWFibGUKICBub2RlbWFzazogUmVtb3ZlIGltcGxp
Y2l0IGFkZHJlc3NvZiBmcm9tIHRoZSBBUEkKICBwYWdlLWFsbG9jOiBDbGFtcCBnZXRfZnJlZV9i
dWRkeSgpIHRvIG9ubGluZSBub2RlcwoKIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgIHwgIDEy
ICstLQogeGVuL2FyY2gveDg2L251bWEuYyAgICAgICAgfCAgIDggKy0KIHhlbi9hcmNoL3g4Ni9z
cmF0LmMgICAgICAgIHwgIDE1ICsrLS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgIHwgICA4
ICstCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgICB8ICA0MCArKysrKy0tLS0tCiB4ZW4vY29t
bW9uL3NjaGVkX2NyZWRpdC5jICB8ICAgMiArLQogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAg
fCAgIDIgKy0KIHhlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5oIHwgMTgxICsrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCAxMTggaW5z
ZXJ0aW9ucygrKSwgMTUwIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
