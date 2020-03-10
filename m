Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401FE180291
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:56:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhBn-0003vl-Hw; Tue, 10 Mar 2020 15:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ti7X=43=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBhBm-0003vd-QK
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:53:02 +0000
X-Inumbo-ID: 38b7b5c4-62e7-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38b7b5c4-62e7-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583855582;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=d/t+M84sknvmmNdJLglGxx9L/CrvzVs/g6pOREMbwio=;
 b=ebQuENHVUkNjb2GZUnazQJSROAi9mQvl7iUxZNeowUa7KXRxFH+rYtms
 cMxz4+IX7XSFEvDqav4WphC+Wy+gRw19sBOyrDQxJbAl1zkKMCOZCs4s7
 kK6QQPPdDMbVNfye79qh6l5t3Ea686sKosdH8ktrOZ70OvIQakkp8p0eS o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6KyB08aIAJ8Rp6JkDKliJfngnH/v0t0mb1tm6Dpzf6kS1IpL1mvgMK3s47sm+8cRp/TIsrS5ey
 ngoC+aG/7u56coBW3P6/AV7JhmwQUnXJRlE4YsKvNjWJNmHHVHYWJQmn42/354daA2t0mmw4UR
 kS4QwcnTbxv0AYUF4bOerV0+Scu+CL5raUUb7lQw8R2dVSV9KcXglCl5smbJjerjDsqnlTaPvG
 dD+lv1ZS75bUU6DsYKS5vEYkXBT2VwuU/bK7cTwq2xF/coLYaDvWYgnKb55m0arsepqBajbY4g
 gz8=
X-SBRS: 2.7
X-MesageID: 13893901
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="13893901"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24167.47064.327387.933129@mariner.uk.xensource.com>
Date: Tue, 10 Mar 2020 15:52:56 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200310134635.99810-2-roger.pau@citrix.com>
References: <20200310134635.99810-1-roger.pau@citrix.com>
 <20200310134635.99810-2-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v2 2/2] make-flight: add dom0 PVH
 test
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHYyIDIvMl0gbWFrZS1mbGln
aHQ6IGFkZCBkb20wIFBWSCB0ZXN0Iik6Cj4gQWRkIGEgZG9tMCBQVkggdGVzdCwgdGhlIHRlc3Qg
dG8gYmUgcnVuIGlzIGxhdW5jaGluZyBhIFBWIGd1ZXN0Cj4gKHRlc3QtZGViaWFuKS4gTm90ZSB0
aGUgUFZIIGRvbTAgdGVzdHMgYXJlIG9ubHkgZW5hYmxlZCBmb3IgWGVuID49Cj4gNC4xMy4KPiAK
PiBUaGUgcnVudmFyIGRpZmZlcmVuY2UgaXM6CgpBcmUgeW91IHN1cmUgdGhpcyBpcyBzdGlsbCB0
cnVlID8gIEl0IGRvZXNuJ3QgbWVudGlvbiB0aGUgaW9tbXUgaG9zdApmbGFnIHdoaWNoCgo+ICsg
ICAgICBqb2JfY3JlYXRlX3Rlc3QgdGVzdC0keGVuYXJjaCRrZXJuLSRkb20wYXJjaC1kb20wcHZo
LXhsLSRjcHV2ZW5kb3IgXAo+ICsgICAgICAgICAgICAgICAgdGVzdC1kZWJpYW4geGwgJHhlbmFy
Y2ggJGRvbTBhcmNoICRkZWJpYW5fcnVudmFycyBcCj4gKyAgICAgICAgICAgICAgICBhbGxfaG9z
dGZsYWdzPSRtb3N0X2hvc3RmbGFncyxodm0tJGNwdXZlbmRvcixpb21tdSBcCj4gKyAgICAgICAg
ICAgICAgICB4ZW5fYm9vdF9hcHBlbmQ9J2RvbTA9cHZoLHZlcmJvc2UnCgphcHBlYXJzIGhlcmUu
ICBTbyBwbGVhc2UgcmVnZW5lcmF0ZSB0aGlzLgoKSSBnYXZlIHlvdXIgcHJldmlvdXMgdmVyc2lv
biBhIFJldmlld2VkLWJ5LiAgSXMgdGhpcyB0aGUgb25seSB0aGluZwp5b3UgY2hhbmdlZCA/CgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
