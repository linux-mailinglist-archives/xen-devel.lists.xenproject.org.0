Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B6A5B80
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 18:45:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4pOv-0000gv-Bx; Mon, 02 Sep 2019 16:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jggy=W5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i4pOt-0000gI-Mz
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 16:41:55 +0000
X-Inumbo-ID: 91141438-cda0-11e9-aea4-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91141438-cda0-11e9-aea4-12813bfff9fa;
 Mon, 02 Sep 2019 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567442515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1DCZ0BGjoPYTWaE4L9sHBAupmaX9w85d3OynHWl3eIo=;
 b=iBqrsOSpJODnRlU1MOzIZbjaGtvOank44GZuj3UIKMkZsg846Q/6NHPw
 9ZCiibMSDkzBkgC55UIEGrCGnXeY6NOcUXAjLwu7c4+CDKHIZODwgJv0n
 T/eugVxA5CizfRaLJjvaXRnwWOZC9eYng//iOFOVpN4cHFNOJnNR/QOZy c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BQ4qazOK3oQCfwtwvK5feWZnV6q+Buv08PxUqejUmZa99NwEoEdStsFD9UTlUKQp2zZDU1CgL5
 3hjifLFlA4IFgxeYNT3JeHP9YXrNuMS822cLGD8iO8da+fgiDMOvk14D4EZojebsUHuTflBU11
 o+S/39X0h45whw5gTy0kJZ7rC3yc5fn7A0Ao4VcC/68kuKMP+Gm5NXX0slRxZ9AWbhUP2Udc0S
 NyZqyTrM3G0CXjenk42nh0fKpFlkRti6UepsG5lwHcZ7nwhC4DfnlvUkrzmcyiov10KYAh3Zpb
 2b0=
X-SBRS: 2.7
X-MesageID: 5033358
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5033358"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 17:41:47 +0100
Message-ID: <20190902164148.28977-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190902164148.28977-1-andrew.cooper3@citrix.com>
References: <20190902164148.28977-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] tools/shim: Fix race condition creating
 linkfarm.stamp
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdGhlIGNhc2UgdGhlIHdoaWxlIGxvb3AgZ2V0cyBpbnRlcnJ1cHRlZCwgdGhlIHRhcmdldCBt
dXNuJ3QgYXBwZWFyIGFzCnVwLXRvLWRhdGUuICBUaGUgbW92ICRYLnRtcCAkWCBtdXN0IGJlIHRo
ZSBsYXN0IGFjdGlvbiBvZiB0aGUgcnVsZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24gPElhbi5KYWNr
c29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkND
OiBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4QGVpa2VsZW5ib29tLml0PgotLS0KIHRvb2xzL2Zp
cm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUveGVu
LWRpci9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKaW5kZXggNjk3
YmJiZDU3Yi4uZGYzZjVhNzAwNiAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9N
YWtlZmlsZQorKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCkBAIC0zMiw5ICsz
Miw5IEBAIGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKIAkJ
ZWNobyAkKGYpID4+IGxpbmtmYXJtLnN0YW1wLnRtcCA7KQogCWNtcCAtcyBsaW5rZmFybS5zdGFt
cC50bXAgbGlua2Zhcm0uc3RhbXAgJiYgXAogCQlybSBsaW5rZmFybS5zdGFtcC50bXAgfHwgeyBc
CisJCWNhdCBsaW5rZmFybS5zdGFtcC50bXAgfCB3aGlsZSByZWFkIGY7IFwKKwkJICBkbyBybSAt
ZiAiJChEKS8kJGYiOyBsbiAtcyAiJChYRU5fUk9PVCkvJCRmIiAiJChEKS8kJGYiOyBkb25lOyBc
CiAJCW12IGxpbmtmYXJtLnN0YW1wLnRtcCBsaW5rZmFybS5zdGFtcDsgXAotCQljYXQgbGlua2Zh
cm0uc3RhbXAgfCB3aGlsZSByZWFkIGY7IFwKLQkJICBkbyBybSAtZiAiJChEKS8kJGYiOyBsbiAt
cyAiJChYRU5fUk9PVCkvJCRmIiAiJChEKS8kJGYiOyBkb25lIFwKIAkJfQogCiAjIENvcHkgZW5v
dWdoIG9mIHRoZSB0cmVlIHRvIGJ1aWxkIHRoZSBzaGltIGh5cGVydmlzb3IKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
