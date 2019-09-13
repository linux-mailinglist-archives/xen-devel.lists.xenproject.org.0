Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A2B23F8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 18:18:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8oFH-0006rx-UD; Fri, 13 Sep 2019 16:16:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8oFG-0006rs-EJ
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:16:26 +0000
X-Inumbo-ID: d5411166-d641-11e9-95af-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5411166-d641-11e9-95af-12813bfff9fa;
 Fri, 13 Sep 2019 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568391386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8lktQmvo710FTAvqAlwZPm3l/QaryvVGXj0ZgQ+Cpgw=;
 b=cWBhRvv7OoJJdDo7EhCOpDPWfIuGVMClQZ78rYbuWS99042aGnf3X1qK
 cYdoTDvPic+TsWuPOcxWNMzgGrCQL/Yj2J1q0pL88gRTpa8tv5gGkImGU
 ma22EJUFiLD7EpRajIBhOln/TJ4t17zQWmyo4sAqLcSJ3EGLZvgTMchTY U=;
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
IronPort-SDR: fNL1yNhaaXqybTrnjmsjBBVB/TBrDhMEere2UXG3EHJE21LDL6w17lMvLvGou7yjHe83Quh21g
 uN/jd+JUTEptL0QsL+i3nTEUsrozaCmbPXN+uxIg8zKmJsvwjgpWNuWZbLcoAVTrnHg14J9zGu
 6UPO6ZALWSxlWReI6LUJTdO17xYwxpeiCoYqjXFLFR1M377qBVY4OdhDMnj2cYI+SzlqylhvIK
 qkHXsVT84QerDCbvXhwu6ROircy5u3Bv95kArMKhfy3nVN8OepYz//Q0+5pktykcB0BIcSWzsj
 QxQ=
X-SBRS: 2.7
X-MesageID: 5547104
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5547104"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 17:16:21 +0100
Message-ID: <20190913161621.1120-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vpmu: Drop "VPMU: disabled" message
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJpbnRpbmcgIiRmb28gZGlzYWJsZWQiIGlzIHVubmVjZXNzYXJ5IG5vaXNlIGR1cmluZyBib290
LiAgQWxsIG90aGVyIFZQTVUKc2V0dGluZ3MgZW1pdCBhIG1lc3NhZ2UsIHNvIHRoaXMgZG9lc24n
dCByZXN1bHQgaW4gYW55IGFtYmlndWl0eS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jIHwgMyAt
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9jcHUvdnBtdS5jIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKaW5kZXggMzc1NTk5YWNh
NS4uZjM5NzE4M2VjMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKKysrIGIv
eGVuL2FyY2gveDg2L2NwdS92cG11LmMKQEAgLTg1NywxMCArODU3LDcgQEAgc3RhdGljIGludCBf
X2luaXQgdnBtdV9pbml0KHZvaWQpCiAgICAgaW50IHZlbmRvciA9IGN1cnJlbnRfY3B1X2RhdGEu
eDg2X3ZlbmRvcjsKIAogICAgIGlmICggIW9wdF92cG11X2VuYWJsZWQgKQotICAgIHsKLSAgICAg
ICAgcHJpbnRrKFhFTkxPR19JTkZPICJWUE1VOiBkaXNhYmxlZFxuIik7CiAgICAgICAgIHJldHVy
biAwOwotICAgIH0KIAogICAgIC8qIE5NSSB3YXRjaGRvZyB1c2VzIExWVFBDIGFuZCBIVyBjb3Vu
dGVyICovCiAgICAgaWYgKCBvcHRfd2F0Y2hkb2cgJiYgb3B0X3ZwbXVfZW5hYmxlZCApCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
