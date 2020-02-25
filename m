Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDA16EBF3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 18:00:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6dWs-0003Xg-Ur; Tue, 25 Feb 2020 16:57:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZMDu=4N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6dWr-0003Xb-1u
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 16:57:53 +0000
X-Inumbo-ID: f58d5bca-57ef-11ea-8fc3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f58d5bca-57ef-11ea-8fc3-bc764e2007e4;
 Tue, 25 Feb 2020 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582649871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QiXCFQLc229JCoCO7jGrVffJefusghndv/ZjLSED+hE=;
 b=BsUJEwF8sdFAe6QfEywiBT0pdnYOSrWlY31LH7i/8NFoSiBYIq4RiFZD
 1B3nMzIFrNrbrmPPLWY4m0vz69ArOMLlC9yeGy+++fR767B89JEznD7zK
 oQ3dq+uyoC0IDP+IlcaQYb0vI/tRffpNbkPogp8pLAIXuz6k7bHcM4ode s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DdG045Dx2QMlJ87xLCG0Z++Xte7eNk+D7d74c1vCgyvNxxWx9Mcj4LPc4OD91436g6ZKOvpuuR
 wOhW17tWKX75mvLR7Wi6f7v/iP6+RS63SpXK6+HuCEUEyaExWXk0SCobDApXU0dFMLCfN39vJI
 5cUSJrsGDd8ERtCPiaBoc8qCOunqamUipySyjGY3MPn/M2pX8J4AVfvgyVdFbBTeHEB32106xG
 OKmUk1RXUuewkeebI7r92LjMQ1np1C9jSjgsBFvu9S0YSe3a4/TVXhAIFZtw8AhVvZFDpKDcjl
 168=
X-SBRS: 2.7
X-MesageID: 13342017
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="13342017"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 25 Feb 2020 16:57:48 +0000
Message-ID: <20200225165748.6531-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/gen-cpuid: Fix Py2/3 compatibility
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

VGhlcmUgaXMgYSBmZW5jZXBvc3QgZXJyb3Igb24gdGhlIHN5cy52ZXJzaW9uX2luZm8gY2hlY2sg
d2hpY2ggd2lsbCBicmVhayBvbgpQeXRob24gMy4wLiAgUmV2ZXJzZSB0aGUgbG9naWMgdG8gbWFr
ZSBweTIgY29tcGF0aWJsZSB3aXRoIHB5MyAocmF0aGVyIHRoYW4KcHkzIGNvbXBhdGlibGUgd2l0
aCBweTIpIHdoaWNoIHdpbGwgYmUgbW9yZSBuYXR1cmFsIHRvIGZvbGxvdyBhcyBweTIgdXNhZ2UK
cmVkdWNlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgotLS0KIHhlbi90b29scy9nZW4tY3B1aWQucHkgfCA5ICsrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
dG9vbHMvZ2VuLWNwdWlkLnB5IGIveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQppbmRleCAzNjJjZGI1
MzA2Li43MWVhNzhmNGViIDEwMDc1NQotLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5CisrKyBi
L3hlbi90b29scy9nZW4tY3B1aWQucHkKQEAgLTMsOSArMyw4IEBACiAKIGltcG9ydCBzeXMsIG9z
LCByZQogCi1pZiAoc3lzLnZlcnNpb25faW5mbyA+ICgzLCAwKSk6Ci0gICAgZGVmIHhyYW5nZSh4
KToKLSAgICAgICAgcmV0dXJuIHJhbmdlKHgpCitpZiBzeXMudmVyc2lvbl9pbmZvIDwgKDMsIDAp
OgorICAgIHJhbmdlID0geHJhbmdlCiAKIGNsYXNzIEZhaWwoRXhjZXB0aW9uKToKICAgICBwYXNz
CkBAIC0zMzAsMTAgKzMyOSwxMCBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOgogICAgICAg
ICBzdGF0ZS5kZWVwX2RlcHNba10gPSBmZWF0dXJlc2V0X3RvX3VpbnQzMnModiwgbnJfZW50cmll
cykKIAogICAgICMgQ2FsY3VsYXRlIHRoZSBiaXRmaWVsZCBuYW1lIGRlY2xhcmF0aW9ucwotICAg
IGZvciB3b3JkIGluIHhyYW5nZShucl9lbnRyaWVzKToKKyAgICBmb3Igd29yZCBpbiByYW5nZShu
cl9lbnRyaWVzKToKIAogICAgICAgICBuYW1lcyA9IFtdCi0gICAgICAgIGZvciBiaXQgaW4geHJh
bmdlKDMyKToKKyAgICAgICAgZm9yIGJpdCBpbiByYW5nZSgzMik6CiAKICAgICAgICAgICAgIG5h
bWUgPSBzdGF0ZS5uYW1lcy5nZXQod29yZCAqIDMyICsgYml0LCAiIikKIAotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
