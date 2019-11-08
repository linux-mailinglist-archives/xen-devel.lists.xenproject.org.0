Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA9F53CA
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9Kr-0007nO-J5; Fri, 08 Nov 2019 18:50:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9Kq-0007nI-GC
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:16 +0000
X-Inumbo-ID: 984c5a02-0258-11ea-b678-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 984c5a02-0258-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=k1b90qB8MaEVNGo6coBQqhxaA4IcQz5e6mbAnI00GQc=;
 b=ibQdcmBmpXCW6s8FOCG6aj1yKcU5Vcfv/wnSuH+IgVSYtRT8bgVHdr0h
 w1v/WvOKmRWeA2VBj4sNQnS4G0+wwhXXFgxX5BFeSm1mNxS6mJBFsM+yb
 qlXkdEWciCROgzvEbOXF5Jkx95jkTK3/zmleJzRth8zeHSkBHyluq4X/+ w=;
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
IronPort-SDR: PkXCYu8RiLjR27sGsX7g0yHXMUw70c1jn+NeXMOzFdjysZgCgInnI29MpCw5uxZlJnYWOXT/GP
 GogTrxucrPNgoMmy7TW8T3eCxY0J2McOtERS/AxWIhsa4MKWQ0p4lklaBctotrtgAnPVcrcRbX
 PTTFJe2r930QbARa1p2eOMyRmnlWhL0l6PgbBNdqYxwZl9aVtupemKBrsoZsqUoLCkODwhKNY+
 SoIujzU8KpBGzeFtC30nTMu6fBvZmnbZebV/h9ErgsVZVXWWprjXIZ76j1YtDQ4nASRoHT1mge
 dvw=
X-SBRS: 2.7
X-MesageID: 8076035
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8076035"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:59 +0000
Message-ID: <20191108185001.3319-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 11/13] sg-report-host-history: Move job
 runvars query later
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

VGhpcyBxdWVyeSBpcyBqdXN0IHVzZWQgZm9yIHRoZSBwb3dlciBtZXRob2RzLiAgUHV0IGl0IG5l
YXIgdGhlcmUuCkFsc28sIGluZGVudCBpdCBpbiBhIGBkbycgYmxvY2suICBUaGVzZSBjaGFuZ2Vz
IHdpbGwgbWFrZSB0aGUgbmV4dApjaGFuZ2UgZWFzaWVyIHRvIHJlYWQuCgpObyBmdW5jdGlvbmFs
IGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgotLS0KIHNnLXJlcG9ydC1ob3N0LWhpc3RvcnkgfCAyMSArKysrKysrKysrKystLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkgYi9zZy1yZXBvcnQtaG9zdC1oaXN0
b3J5CmluZGV4IGU2N2M3MzQ2Li43YzIxMTZkMyAxMDA3NTUKLS0tIGEvc2ctcmVwb3J0LWhvc3Qt
aGlzdG9yeQorKysgYi9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5CkBAIC0zMzIsMTEgKzMzMiw2IEBA
IEVORAogCW15ICRpciA9IGpvYnF1ZXJ5KCRpbmZvcSwgJGpyLCAnaScpOwogCW15ICRhciA9IGpv
YnF1ZXJ5KCRhbGxvY2RxLCAkanIsICdhJyk7CiAJbXkgJGlkZW50ID0gJGpyLT57bmFtZX07Ci0J
JGpydW52YXJxLT5leGVjdXRlKCRqci0+e2ZsaWdodH0sICRqci0+e2pvYn0sICRpZGVudCk7Ci0g
ICAgICAgIG15ICVydW52YXJzOwotICAgICAgICB3aGlsZSAobXkgKCRuLCAkdikgPSAkanJ1bnZh
cnEtPmZldGNocm93X2FycmF5KCkpIHsKLSAgICAgICAgICAgICRydW52YXJzeyRufSA9ICR2Owot
ICAgICAgICB9CiAKIAlteSAkYWx0Y29sb3VyID0gcmVwb3J0X2FsdGNvbG91cigkYWx0ZXJuYXRl
KTsKIAlwcmludCBIICI8dHIgJGFsdGNvbG91cj4iOwpAQCAtMzc3LDEwICszNzIsMTggQEAgRU5E
CiAJcHJpbnQgSCAiPHRkICRyaS0+e0NvbG91ckF0dHJ9PiRyaS0+e0NvbnRlbnR9PC90ZD5cbiI7
CiAKIAlteSAlcG93ZXJzOwotCWZvcmVhY2ggbXkgJHIgKHNvcnQga2V5cyAlcnVudmFycykgewot
CSAgICBuZXh0IHVubGVzcyAkciA9fiBte15cUSR7aWRlbnR9XEVfcG93ZXJffTsKLQkgICAgJHBv
d2Vyc3skJ30gPSAkcnVudmFyc3skcn07Ci0JfQorCWRvIHsKKwkgICAgJGpydW52YXJxLT5leGVj
dXRlKCRqci0+e2ZsaWdodH0sICRqci0+e2pvYn0sICRpZGVudCk7CisJICAgIG15ICVydW52YXJz
OworCSAgICB3aGlsZSAobXkgKCRuLCAkdikgPSAkanJ1bnZhcnEtPmZldGNocm93X2FycmF5KCkp
IHsKKwkJJHJ1bnZhcnN7JG59ID0gJHY7CisJICAgIH0KKworCSAgICBmb3JlYWNoIG15ICRyIChz
b3J0IGtleXMgJXJ1bnZhcnMpIHsKKwkJbmV4dCB1bmxlc3MgJHIgPX4gbXteXFEke2lkZW50fVxF
X3Bvd2VyX307CisJCSRwb3dlcnN7JCd9ID0gJHJ1bnZhcnN7JHJ9OworCSAgICB9CisJfTsKIAlt
eSAkc2tpcHBlZCA9IDA7CiAgICAgICAgIG15ICRhbnlfcG93ZXIgPSAwOwogICAgICAgICBteSAk
cHJfcG93ZXJfY29sb3VyID0gc3ViIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
