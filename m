Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42ED1145B5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 18:19:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icukK-0000s3-EU; Thu, 05 Dec 2019 17:16:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7OMr=Z3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1icukJ-0000ry-7u
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 17:16:55 +0000
X-Inumbo-ID: 0872cf2a-1783-11ea-8232-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0872cf2a-1783-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 17:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575566214;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ksQGzCGe1ABNEL/nqUpyIkwM257m8pA9isBW30iOPGo=;
 b=Idvsrj0nNht0YGaP4T1+yXeJyOW5Tzj6wQSv0NljAsp92M/c7Rr+APX5
 U0V95UCFGD8ZKybF6SX84bI8fNVErMez0mlJPjkCrKJhOvUwfCNFipePT
 abI3qEsflZagk5n/aTjc9EbGbbq1I37y9T9wVd1e8G8uGn4bjLGrsiKOu E=;
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
IronPort-SDR: jZK0lxraBgzRREvOUnogZ5kbTJcE5u67JVAR8xWsYeyK+JQZSsom6xlp5OAql3RMy6sA3ahpcm
 cUVN8fYD9oTBH4kMJdZRF4JufCN6uvDI1PjoAgkJoJYvf/JfYyiOCqwzzgy3g3W8mKS9T3Z0rP
 AXeVv9hs0qx8XC9cLcFdvIMnRSik3u71pshoQNTFUCaqw6hCADm3kHZadcGAAXvwYr46L4B2jW
 5zmKvDVEjVoYrqxbh85GCjsmbzC29ZCLDBq9bCMTtnhhemVe75Ywx6mb6IA//Yq5MuGCazF3gL
 F8Q=
X-SBRS: 2.7
X-MesageID: 9259636
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,282,1571716800"; 
   d="scan'208";a="9259636"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 17:16:49 +0000
Message-ID: <20191205171649.10614-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] ts-xen-build-prep: Install
 python3-docutils
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgcGFja2FnZSAob3IsIG9uZSBvZiB0aGUgcGFja2FnZXMpIGNvbnRhaW5pbmcg
cnN0Mmh0bWwuClRoaXMgaXMgbm93IG5lZWRlZCBmb3IgYnVpbGRzIG9mIGxpYnZpcnQgdXBzdHJl
YW0uCgpSZWFsbHkgdGhpcyBwYWNrYWdlcyBpbnN0YWxsIGNhbGwgc2hvdWxkIGJlIHRzLWxpYnZp
cnQtYnVpbGQsIGJ1dDoKSGlzdG9yaWNhbGx5IHdlIGhhdmUgZG9uZSBpdCBhbGwgaW4gdHMteGVu
LWJ1aWxkLXByZXAuICBJbiB0aGUKbWVhbnRpbWUgd2UgaGF2ZSBwdXQgYSBsb2NrIGFyb3VuZCB0
aGUgY2FsbCB0byB0aGUgcGFja2FnZSBtYW5hZ2VyLApidXQgdGhpcyBoYXMgb25seSBiZWVuIGxp
Z2h0bHkgdGVzdGVkLiAgQXQgdGhpcyBzdGFnZSBvZiB0aGUgWGVuCnJlbGVhc2Ugd2Ugd291bGQg
cmF0aGVyIGJlIGNhdXRpb3VzLgoKQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdHMteGVuLWJ1aWxkLXByZXAgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL3RzLXhlbi1idWlsZC1wcmVwIGIvdHMteGVuLWJ1aWxkLXByZXAKaW5k
ZXggMGYwNzY0OGUuLjVkMmY1MGJhIDEwMDc1NQotLS0gYS90cy14ZW4tYnVpbGQtcHJlcAorKysg
Yi90cy14ZW4tYnVpbGQtcHJlcApAQCAtMjA4LDYgKzIwOCw3IEBAIHN1YiBwcmVwICgpIHsKICAg
ICAgICAgICAgICAgICAgICAgICBsaWJ4bWwyLXV0aWxzIGxpYnhtbDItZGV2CiAgICAgICAgICAg
ICAgICAgICAgICAgbGliZGV2bWFwcGVyLWRldiBsaWJ4bWwteHBhdGgtcGVybCBsaWJlbGYtZGV2
CiAgICAgICAgICAgICAgICAgICAgICAgY2NhY2hlIG5hc20gY2hlY2twb2xpY3kgZWJ0YWJsZXMK
KwkJICAgICAgcHl0aG9uMy1kb2N1dGlscwogICAgICAgICAgICAgICAgICAgICAgIGxpYmdudXRs
czI4LWRldik7CiAKICAgICBpZiAoJGhvLT57U3VpdGV9ID1+IG0vc3F1ZWV6ZXx3aGVlenl8amVz
c2llLykgewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
