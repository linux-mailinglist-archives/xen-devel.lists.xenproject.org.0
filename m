Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9529E13612A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 20:35:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipdY0-0001st-4o; Thu, 09 Jan 2020 19:32:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipdXy-0001sn-TN
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 19:32:46 +0000
X-Inumbo-ID: cf77ea0c-3316-11ea-ba61-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf77ea0c-3316-11ea-ba61-12813bfff9fa;
 Thu, 09 Jan 2020 19:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578598366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZTwWQNbg0S0AKLJqv46yumP41x9a48ykIF80fwlRrE=;
 b=eccMJ2B0wAeZNwrNRvHyRtcupDubhxM1pDLPGkN9wSvmynhJjZKJBG9H
 5PCegakCi9QUzpWd7LVEdHk3iOLVbHo16iJyOaTgsn4PuJj0UMcK02WSB
 uqLOvhnmVoWqSTApmcE/Dz5ASRUpBVj8/UTJb4YM2FHWmHBwHsrXBewjj A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pZmrBTM9kRGUFdAcnrVNKi0dQ2LzeV+QFKQ2XjbagF+jvYi+ogcM31TtMkg6Wh8In5PKuzBMKC
 A28CKm+0CzssApKC59SLZy6OAWEd+gXFKSODCGWGIprqeccEtV8cB0tknRv3P/3vtmVGz5Unft
 7AfctBaM/xBnUOZLxV1thLdvyDb3GEmTETHkB2AologjFaQ+z/2xYd9anaZDVa1SPtsDZZLsFd
 0QgizmXQp0FoKU8X2W4/nwurqlM2ZSWu6oiZmcWlebdEkZVh9fu90Zdi18QVFeeuwczrAGC3X2
 m0k=
X-SBRS: 2.7
X-MesageID: 10692243
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="10692243"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 19:32:37 +0000
Message-ID: <20200109193241.14542-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] x86/boot: Remove mappings at 0
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
 Julien Grall <jgrall@amazon.com>, Hongyan Xia <hongyxia@amazon.com>,
 Jan Beulich <JBeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgKGxvbmcgb3ZlcmR1ZSkgc2VyaWVzIHdoaWNoIGZpbmFsbHkgcmVtb3ZlcyB0
aGUgbWFwcGluZyBhdCAwCmR1cmluZyBlYXJseSBib290LCB3aGljaCBoYXMgYml0dGVuIHVzIGlu
IHRoZSBwYXN0LiAgSXQgYWxzbyByZW1vdmVzIGFuIFJXWApnYWRnZXQgd2hpY2ggcGVyc2lzdHMg
cGFzdCBib290IGluIHRoZSBpZGxlIHBhZ2V0YWJsZXMuCgpNb3N0IG9mIHRoZSBjb21wbGV4aXR5
IHdhcyBkb3duIHRvIHRoZSBkaWZmZXJpbmcgKGFuZCBoYXJkLXRvLWZvbGxvdykgdXNlcyBvZgp0
aGUgYm9vdG1hcC4gIEkgZmlyc3Qgb3B0ZWQgdG8gZ2V0IHJpZCBvZiB0aGUgYm9vdG1hcCBlbnRp
cmVseS4gIFdoaWxlIHRoaXMgaXMKcG9zc2libGUgZm9yIHRoZSBjdXJyZW50IE11bHRpYm9vdCBw
YXRocywgaXQgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIEVGSSBib290CnBhdGgsIGFuZCB3b3Jr
cyBhZ2FpbnN0IERhdmlkJ3MgZXhpc3RpbmcgcGxhbnMgdG8gbm90IHVzZSB0aGUgdHJhbXBvbGlu
ZSBhdAphbGwuCgpGdXJ0aGVyIGlkZWFzOiAobm90IGFkZHJlc3NlZCBoZXJlIGJlY2F1c2UgLUVU
SU1FIG9uIG15IGJlaGFsZi4pCgoxKSBHZXQgUFYtc2hpbSB0byB1c2UgaHlwZXJjYWxscyBmb3Ig
QVAgc3RhcnR1cCwgYXQgd2hpY2ggcG9pbnQgd2UgY2FuIGNvbXBpbGUKICAgb3V0IHRoZSB0cmFt
cG9saW5lIGVudGlyZWx5LiAgVGhpcyBpcyBwcm9iYWJseSBoZWxwZnVsIGZvciByb2J1c3RuZXNz
CiAgIHRlc3RpbmcgaW4gY29tYmluYXRpb24gd2l0aCBEYXZpZCdzIHBsYW5zLgoKMikgRHJvcCBC
T09UU1RSQVBfTUFQX3tCQVNFLExJTUlUfSBhbmQgaGF2ZSBib290c3RyYXBfbWFwKCkgcG9wdWxh
dGUgaW50byB0aGUKICAgZGlyZWN0bWFwLCBhcyB3ZSBvbmx5IHJlcXVlc3QgUkFNIG1hcHBpbmdz
LiAgVGhpcyB3b3VsZCBhbGxvdyB1cyB0byBkcm9wIDMKICAgb2YgdGhlIGJvb3RtYXAgcGFnZXRh
Ymxlcy4gIEhvd2V2ZXIsIEknbSBub3QgZW50aXJlbHkgY29udmluY2VkIHRoZSBsYXRlcgogICBs
b2dpYyB3aWxsIGNvcGUgd2l0aCBjYWNoZWFiaWxpdHkgYm91bmRhcmllcyBmb3JjaW5nIHRoZSB1
c2Ugb2Ygc21hbGwKICAgbWFwcGluZ3MuCgpUaGlzIHNlcmllcyBoYXMgaGFkIGNvbXBsZXRlIHRl
c3RpbmcgZm9yIE1CIGFuZCBFRkkgYm9vdCBwYXRocy4gIEl0IHR1cm5zIG91dAp0aGF0IGdydWIg
Y2FuIGNoYWlubG9hZCB4ZW4uZWZpIGFuZCB0ZXN0IHRob3NlIHBhdGhzLgoKdjI6CiAgKiBUd28g
cGF0Y2hlcyBhbHJlYWR5IGNvbW1pdHRlZC4gIFNlZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIG90
aGVyIGNoYW5nZXMuCgpBbmRyZXcgQ29vcGVyICg0KToKICB4ODYvYm9vdDogUmVtb3ZlIHRoZSBw
cmVjb25zdHJ1Y3RlZCBsb3cgMTZNIHN1cGVycGFnZSBtYXBwaW5ncwogIHg4Ni9ib290OiBDbGVh
biB1cCBsP19ib290bWFwW10gY29uc3RydWN0aW9uCiAgeDg2L2Jvb3Q6IERvbid0IG1hcCAwIGR1
cmluZyBib290CiAgeDg2L2Jvb3Q6IERyb3AgSU5WQUxJRF9WQ1BVCgogeGVuL2FyY2gveDg2L2Jv
b3QvaGVhZC5TICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0K
IHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TICAgICAgICB8IDIxICsrKysrKysrKystLS0tLS0t
LS0tLQogeGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMgICAgIHwgIDIgKy0KIHhlbi9hcmNo
L3g4Ni9kb21haW5fcGFnZS5jICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1i
b290LmggICAgICAgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQogeGVuL2FyY2gveDg2L3NldHVw
LmMgICAgICAgICAgICAgIHwgMTYgKysrKysrKystLS0tLS0tLQogeGVuL2FyY2gveDg2L3Rib290
LmMgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvYXNtLW9mZnNldHMu
YyB8ICAzIC0tLQogeGVuL2FyY2gveDg2L3hlbi5sZHMuUyAgICAgICAgICAgIHwgIDMgKysrCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmggICAgICAgfCAgMyAtLS0KIDEwIGZpbGVzIGNoYW5n
ZWQsIDUzIGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
