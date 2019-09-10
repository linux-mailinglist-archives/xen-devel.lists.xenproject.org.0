Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC2AE9FC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:07:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7etr-0007yt-F7; Tue, 10 Sep 2019 12:05:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7etq-0007yI-31
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:05:34 +0000
X-Inumbo-ID: 4a3fa81e-d3c3-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a3fa81e-d3c3-11e9-978d-bc764e2007e4;
 Tue, 10 Sep 2019 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JP8zQH/ueueckFwcv4VyM8ankZ08G9Ql82KkHtcPmIY=;
 b=Ib16Vb24s7lqsWtBckAQoR2d5YNx6wHi5HYMQPCWiONRe3o63T5XPkkz
 clK20h8cKEc9/KZjoq60VrCYZJNiuqRPy7wdDj9gxBy0sk4vmIzEJIhzY
 cPfLereX4uG/VBrFeYJbyx0ZFDFd+dD5lm2Jbsm1Rcn6SPsM64vnoB83K o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SvTqoal1meX0cWQl8Xq4+ob1gESHOxkUvLb3dZHL+f1ycxtuVuiRj4x8SH19IDEvREyJjKadUV
 B4OqMDyYkBMflbWm9EPH0RKBrf19rlxtt7UKA2nlF2ISvsrT4VOG7c5GUtsEFjnmtFjui87Mvi
 C/Gj2iA6nIjR7vPG6saXVC1HSmYj9Lbh2FErou8gh2zXDU2iS+Wb8I21lAKnm174VelFzymrOD
 O5PYdQ5jdwdMJFtdFkLCOwchFM+BD/+WvL2d0xuYrFSCEK7aXUmvARxBKoxtpfIyCpaVbLxvOn
 7Q0=
X-SBRS: 2.7
X-MesageID: 5416598
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5416598"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:06 +0100
Message-ID: <20190910120207.10358-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 11/12] tools/ocaml: tools/ocaml: Add missing
 CDF_* values
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICB8IDMgKysrCiB0b29scy9vY2FtbC9s
aWJzL3hjL3hlbmN0cmwubWxpIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sIGIvdG9vbHMv
b2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sCmluZGV4IDE3MTc0ZGViYjguLmU1NDRlZjg0ZGEgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbAorKysgYi90b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmwubWwKQEAgLTYwLDYgKzYwLDkgQEAgdHlwZSBhcmNoX2RvbWFpbmNv
bmZpZyA9CiB0eXBlIGRvbWFpbl9jcmVhdGVfZmxhZyA9CiAJfCBDREZfSFZNCiAJfCBDREZfSEFQ
CisJfCBDREZfUzNfSU5URUdSSVRZCisJfCBDREZfT09TX09GRgorCXwgQ0RGX1hTX0RPTUFJTgog
CiB0eXBlIGRvbWN0bF9jcmVhdGVfY29uZmlnID0KIHsKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1s
L2xpYnMveGMveGVuY3RybC5tbGkgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCmlu
ZGV4IDIyOGJjMDBhMWMuLjVhMzUwMDA3NjEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybC5tbGkKKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQpAQCAt
NTMsNiArNTMsOSBAQCB0eXBlIGFyY2hfZG9tYWluY29uZmlnID0KIHR5cGUgZG9tYWluX2NyZWF0
ZV9mbGFnID0KICAgfCBDREZfSFZNCiAgIHwgQ0RGX0hBUAorICB8IENERl9TM19JTlRFR1JJVFkK
KyAgfCBDREZfT09TX09GRgorICB8IENERl9YU19ET01BSU4KIAogdHlwZSBkb21jdGxfY3JlYXRl
X2NvbmZpZyA9IHsKICAgc3NpZHJlZjogaW50MzI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
