Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA426F53D5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:53:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9Kn-0007n9-9I; Fri, 08 Nov 2019 18:50:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9Kl-0007n4-GJ
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:11 +0000
X-Inumbo-ID: 970b4162-0258-11ea-b678-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 970b4162-0258-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=MSkFnuaj1LQRJcJZIh+SLhq5b4IuzZOdw0T7nasHnQs=;
 b=Yh/cKUI3iTRSHhnR5xLsJgmR889uyPcSmoVa60Y7gMcU9/t6qNIN3z5v
 B0JdOTbhxI+F4LNr3pT8dQhpmg2KYF7+BsHm0ub0KKglSAVx+wRfo0OMK
 WaFtEET5GsbsuwCmOQS+fIXn5Mh7dRGZ+S3huWAIwbD9297TpjH9z8cyV Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GWQKNE16H2UwU6HHn9kVRe4mGvxsxoewaO/efOBRNqVlXl3gO3JG1y/QV2+MGXs1k2LsBpD772
 xdmvN19f9zlYGpj1qPXIlaQtTsFzKewdYL+b5fhtCyRVtLbnU3cVG3uhCkQmGpLY2z8Ro4LYt2
 mgCcNnNXmSJRUx0PkmV8yoNawtIlOg0bQYz5stCNJpVAOuQMgSlB9OY1vKhGDmNU1eXToa1NHh
 CGcI8RJgWhql9nqOF+EGACbfBBCqADHWx0yh7LPPCUWeV8ZmRIhR2oeH0QznZTwmDW7t1396IK
 JHE=
X-SBRS: 2.7
X-MesageID: 8076033
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8076033"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:49 +0000
Message-ID: <20191108185001.3319-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 01/13] sg-report-host-history: Improve
 debugging output
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSB8IDEyICsrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2ctcmVw
b3J0LWhvc3QtaGlzdG9yeSBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKaW5kZXggYmQ3MzkxZTAu
LjQyZGVmNmJmIDEwMDc1NQotLS0gYS9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5CisrKyBiL3NnLXJl
cG9ydC1ob3N0LWhpc3RvcnkKQEAgLTEwMSw2ICsxMDEsOCBAQCBFTkQKICAgICAkbWluZmxpZ2h0
IC8vPSAwOwogCiAgICAgJGZsaWdodGNvbmQgPSAiKGZsaWdodCA+ICRtaW5mbGlnaHQpIjsKKwor
ICAgIHByaW50IERFQlVHICJNSU5GTElHSFQgJG1pbmZsaWdodFxuIjsKIH0KIAogc3ViIGpvYnF1
ZXJ5ICgkJCkgewpAQCAtMTI4LDE4ICsxMzAsMjIgQEAgRU5ECiAKICAgICBwdXNoIEBwYXJhbXMs
IHNjYWxhciBrZXlzICVob3N0czsKIAorICAgIHByaW50IERFQlVHICJNQUlOUVVFUlkuLi5cbiI7
CiAgICAgJHJ1bnZhcnEtPmV4ZWN1dGUoQHBhcmFtcyk7CiAKICAgICBwcmludCBERUJVRyAiRklS
U1QgUEFTU1xuIjsKICAgICB3aGlsZSAobXkgJGpyPSAkcnVudmFycS0+ZmV0Y2hyb3dfaGFzaHJl
ZigpKSB7Ci0JcHJpbnQgREVCVUcgIkpPQiAkanItPntmbGlnaHR9LiRqci0+e2pvYn0gIjsKKwlw
cmludCBERUJVRyAiICRqci0+e2ZsaWdodH0uJGpyLT57am9ifSAiOwogCXB1c2ggQHsgJGhvc3Rz
eyRqci0+e3ZhbH19IH0sICRqcjsKICAgICB9CisgICAgcHJpbnQgREVCVUcgIlxuIjsKIH0KIAog
c3ViIHJlcG9ydGhvc3QgKCQpIHsKICAgICBteSAoJGhvc3RuYW1lKSA9IEBfOwogCisgICAgcHJp
bnQgREVCVUcgIkhPU1QgJGhvc3RuYW1lLi4uXG4iOworCiAgICAgZGllIGlmICRob3N0bmFtZSA9
fiBtL1teLV8uKzAtOWEtel0vOwogCiAgICAgbXkgJGh0bWxfZmlsZT0gIiRodG1sb3V0LyRob3N0
bmFtZS5odG1sIjsKQEAgLTIwNCw3ICsyMTAsNyBAQCBFTkQKIAogICAgIG15IEByb3dzOwogICAg
IGZvcmVhY2ggbXkgJGpyIChAJGlucm93cykgewotCXByaW50IERFQlVHICJKT0IgJGpyLT57Zmxp
Z2h0fS4kanItPntqb2J9XG4iOworCXByaW50IERFQlVHICJKT0IgJGpyLT57ZmxpZ2h0fS4kanIt
Pntqb2J9ICI7CiAKIAlteSAkZW5kZWRyb3cgPSBqb2JxdWVyeSgkZW5kZWRxLCAkanIpOwogCWlm
ICghJGVuZGVkcm93KSB7CkBAIC0yMjIsNiArMjI4LDcgQEAgRU5ECiAKICAgICBteSAkYWx0ZXJu
YXRlID0gMDsKICAgICBmb3JlYWNoIG15ICRqciAoQHJvd3MpIHsKKyAgICAgICAgcHJpbnQgREVC
VUcgIkpSICRqci0+e2ZsaWdodH0uJGpyLT57am9ifVxuIjsKIAlteSAkaXIgPSBqb2JxdWVyeSgk
aW5mb3EsICRqcik7CiAJbXkgJGFyID0gam9icXVlcnkoJGFsbG9jZHEsICRqcik7CiAJbXkgJGlk
ZW50ID0gJGpyLT57bmFtZX07CkBAIC0zNDAsNiArMzQ3LDcgQEAgZm9yZWFjaCBteSAkaG9zdCAo
QEFSR1YpIHsKIEVORAogICAgICAgICAgICAgJGhvc3RzaW5mbGlnaHRxLT5leGVjdXRlKCRmbGln
aHQpOwogCSAgICB3aGlsZSAobXkgJHJvdyA9ICRob3N0c2luZmxpZ2h0cS0+ZmV0Y2hyb3dfaGFz
aHJlZigpKSB7CisgICAgICAgICAgICAgICAgcHJpbnQgREVCVUcgIkhSICRyb3ctPnt2YWx9XG4i
OwogCQkkaG9zdHN7JHJvdy0+e3ZhbH19ID0gWyBdOwogCSAgICB9CiAJfSk7Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
