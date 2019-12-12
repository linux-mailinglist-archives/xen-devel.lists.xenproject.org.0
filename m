Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59711D423
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 18:35:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifSKH-0002Ss-0u; Thu, 12 Dec 2019 17:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NkF/=2C=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ifSKF-0002Sd-1O
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 17:32:31 +0000
X-Inumbo-ID: 5a835abe-1d05-11ea-b6f1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a835abe-1d05-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576171942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jw/cU+CNSh6q4WZ2n89Uh4Tp70MUiLcEZZCsARw5wdE=;
 b=Mh7Z6KOeHqLO5YTol+2DGkdGfsuSVgTGt0eb85jwIEQxtc2y1vaByV24
 LN9GygBvzNgXpL5qq9QSyyAK35msqBfF0KoIlkfmirbL/TfK7eqhdItRp
 /22id2pG3yZGjEfzXWiBhymTEzm1DUkVLGtmetvBzIwZf30i+cTVeTLR1 E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tD8YE+tezriJC93MOE+XVY8OwN9iY3Fjz0OG+DpBBo/HMp3dacNTt2sGHwf4aTv7zrfmjadkPr
 nzvqNGL1zERxie3z1ahKhScXiR92YkJInWq6lVxOBvwOLv5ycAFWYC02QqHzru8Ad7JzbLwClr
 uq41LgxrnmddfRAROujjQ6ps48DLNl9n0bAgZWT3ToA1/tj/0kSmwHlSKJ1w+bHzOkwqVeBpFE
 vcdIsIrJj8vFGIR7WWX4frSP/C85BDSO4hyIiJt27sEbhFZC2GFLjKL6Mdeqh+sCJ3HrTMeiBI
 8ow=
X-SBRS: 2.7
X-MesageID: 9961408
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9961408"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 17:31:59 +0000
Message-ID: <20191212173203.1692762-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] Post-299 cleanups
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaW1wbGVtZW50cyBhIG51bWJlciBvZiBjbGVhbnVwcyB0byBtYWtlIHRoZSBj
b2RlIHNpbXBsZXIKYW5kIGVhc2llciB0byBmb2xsb3cuICBObyBmdW5jdGlvbmFsIGNoYW5nZXMg
aW50ZW5kZWQuCgpHZW9yZ2UgRHVubGFwICg0KToKICB4ODYvbW06IFJlZmFjdG9yIHB1dF9wYWdl
X2Zyb21fbCplIHRvIHJlZHVjZSBjb2RlIGR1cGxpY2F0aW9uCiAgeDg2L21tOiBJbXBsZW1lbnQg
Y29tbW9uIHB1dF9kYXRhX3BhZ2VzIGZvciBwdXRfcGFnZV9mcm9tX2xbMjNdZQogIHg4Ni9tbTog
VXNlIGEgbW9yZSBkZXNjcmlwdGl2ZSBuYW1lIGZvciBwYWdldGFibGUgbWZucwogIHg4Ni9tbTog
TW9yZSBkaXNjcmlwdGl2ZSBuYW1lcyBmb3IgcGFnZSBkZS92YWxpZGF0aW9uIGZ1bmN0aW9ucwoK
IHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L21tLmMgICAg
ICAgIHwgMjQzICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9tbS5oIHwgICA0ICstCiAzIGZpbGVzIGNoYW5nZWQsIDEwMiBpbnNlcnRp
b25zKCspLCAxNDcgZGVsZXRpb25zKC0pCgotLQpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCjIu
MjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
