Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C8AE92E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 13:31:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7eJm-0004CH-RF; Tue, 10 Sep 2019 11:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+U8=XF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i7eJl-0004CC-Nr
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 11:28:17 +0000
X-Inumbo-ID: 1537c232-d3be-11e9-a337-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1537c232-d3be-11e9-a337-bc764e2007e4;
 Tue, 10 Sep 2019 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568114897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bE8F89plhYcMb91WDZDkqQ5dfmHYrn79mGqUY1ferlM=;
 b=fPHnGfeH2hUDgVHO2xRVdL3241koRWT7TNuGBFHz5oGZMYgm8i3Fhlfh
 L4Ch1U0k4hIFyVDQVXs8KQXcJ1utLPaS8v7M/I1031LCOwvg3vmCo+tXS
 ifdtwe2vrcnYClL+2TtQlyiS3T5gAzGt9ps2XiO2x2qvo4HQNqCbid12q k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /3rBKYw756JVmZWgEzNPk0QLkn1eRRzisWUccutIRBnLAXIRS3YQnDwI2u9IHyaCFCUicMwmuB
 NQO2A298drC7Nm+Ymq0BCxe/mbb3E0GwZjzHNAR7Id9JkXT8LkClbUL78lon9ZUx+jtxKltA9g
 R5ye+JDm8t135M1CiWfzaVPw2ZdNYCt6oc3RvqNbBFnFxzAK/lWOdLG32JiwI1VffMkT91x3Ax
 SUQIP6usxQnxmd8dA7NZkJI3moZidPH2CMaqgifhZvig4Bs04ClZCan+TlDSGcynjAxvSWoOce
 Hp0=
X-SBRS: 2.7
X-MesageID: 5369321
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5369321"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:27:53 +0200
Message-ID: <20190910112753.34545-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] freebsd-build: fix building efifat after r351831
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJlZUJTRCByZXZpc2lvbnMgYWZ0ZXIgcjM1MTgzMSBubyBsb25nZXIgYXV0b21hdGljYWxseSBi
dWlsZCBhbgplZmlmYXQgcGFydGl0aW9uIGltYWdlLCBhbmQgbWFrZWZzIHNob3VsZCBiZSB1c2Vk
IGluc3RlYWQgaWYgc3VjaCBmaWxlCmlzIHJlcXVpcmVkLgoKRG8gdGhpcyBhbmQgYWRkIGxvZ2lj
IHRvIGJ1aWxkIHRoZSBlZmlmYXQgcGFydGl0aW9uIG91cnNlbHZlcyBpZiBpdCdzCm5vdCBwcmVz
ZW50IGluIHRoZSBvdXRwdXQgb2YgdGhlIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPElhbi5K
YWNrc29uQGNpdHJpeC5jb20+Ci0tLQogdHMtZnJlZWJzZC1idWlsZCB8IDEyICsrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy1mcmVl
YnNkLWJ1aWxkIGIvdHMtZnJlZWJzZC1idWlsZAppbmRleCBiZGY2NjZlYi4uYTM0ZDNhZTcgMTAw
NzU1Ci0tLSBhL3RzLWZyZWVic2QtYnVpbGQKKysrIGIvdHMtZnJlZWJzZC1idWlsZApAQCAtMTg5
LDYgKzE4OSwxOCBAQCBnemlwICRvdXRwdXQudG1wL2Jvb3Qva2VybmVsL2tlcm5lbAogCiBtYWtl
ZnMgLUIgbGl0dGxlICRvdXRwdXQucGFydCAkb3V0cHV0LnRtcAogCisjIE5COiBzaW5jZSByMzUx
ODMxIGVmaWZhdCBmaWxlcyBhcmUgbm8gbG9uZ2VyIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkLgor
aWYgWyAhIC1mICR0YXJnZXQvYm9vdC9ib290MS5lZmlmYXQgXTsgdGhlbgorICAgICMgQ3JlYXRl
IGFuIEVGSSBwYXJ0aXRpb24gdXNpbmcgdGhlIEZBVCBmaWxlc3lzdGVtCisgICAgbWtkaXIgLXAg
JG91dHB1dC5lZmkvRUZJL0JPT1QKKyAgICBjcCAkdGFyZ2V0L2Jvb3QvbG9hZGVyLmVmaSAkb3V0
cHV0LmVmaS9FRkkvQk9PVC9ib290eDY0LmVmaQorICAgIHNpemU9YHN0YXQgLWYleiAkb3V0cHV0
LmVmaS9FRkkvQk9PVC9ib290eDY0LmVmaWAKKyAgICBzaXplPWBleHByICRzaXplICsgJHNpemUg
LyAyYAorICAgIG1ha2VmcyAtdCBtc2RvcyAtbyBmYXRfdHlwZT0zMiAtbyBzZWN0b3JzX3Blcl9j
bHVzdGVyPTEgXAorICAgICAgICAtbyB2b2x1bWVfbGFiZWw9RUZJU1lTIC1zICRzaXplICR0YXJn
ZXQvYm9vdC9ib290MS5lZmlmYXQgJG91dHB1dC5lZmkKKyAgICBybSAtcmYgJG91dHB1dC5lZmkK
K2ZpCisKIG1raW1nIC1zIGdwdCAtYiAkdGFyZ2V0L2Jvb3QvcG1iciAtcCBlZmk6PSR0YXJnZXQv
Ym9vdC9ib290MS5lZmlmYXQgXAogICAgIC1wIGZyZWVic2QtYm9vdDo9JHRhcmdldC9ib290L2dw
dGJvb3QgLXAgZnJlZWJzZC11ZnM6PSRvdXRwdXQucGFydCBcCiAgICAgLXAgZnJlZWJzZC1zd2Fw
OjoxTSAtbyAkb3V0cHV0Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
