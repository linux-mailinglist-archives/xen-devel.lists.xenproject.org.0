Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5EB0B34
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 11:20:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8LEn-0006Ol-Nv; Thu, 12 Sep 2019 09:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pnqf=XH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i8LEl-0006Oe-Hk
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 09:17:59 +0000
X-Inumbo-ID: 3603dbd2-d53e-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3603dbd2-d53e-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568279879;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=i1lzIMC0128NVvSdATRYp4ILbsldN2eT1Lay11YSqwg=;
 b=ZLRbbEFGvYO21vrhlCOqoEJGgNFEwlXXub0Yqw2AixBJAWegs36BbuHx
 7Pi3oA8pzj04wUy9JK5/2hd6r1e9sQcfVgXueJG1/Wk8u9NV/oWMWfipR
 TgCL32155aqoUY2FoARkO2XYoJ87eebIOFvokLTd3fHjzBkPBwj2CTVz/ 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bEHvGYx61Q9K41AHdIFlTycXOoZR5W+9j5ZUSbhmBwoz59m4UP01Fq4jaZCCHEczN5nNRK1lc9
 z6IA8xn88jDpSAy49y5OntnG5a22iL6oRKQquFNOUbnNkHYd8beJAccf6U3moSMOTVZIA5/k7w
 EnFEiEXW3Xstt6lXE6+ui0/7Kl/BqHhJnF96b58r0lIgFfJqpcBv+istGtDTl3bxPz/xNGP3VS
 zObXcUiHCty8+aF9NLt1WKp1WNApNb5kqvDLdQBu7037plAuFDDDC8hWqgVJwrIVCVnOiHL2oH
 t3k=
X-SBRS: 2.7
X-MesageID: 5526337
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5526337"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23930.3365.698301.123366@mariner.uk.xensource.com>
Date: Thu, 12 Sep 2019 10:17:25 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190910112753.34545-1-roger.pau@citrix.com>
References: <20190910112753.34545-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] freebsd-build: fix building efifat after
 r351831
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

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSF0gZnJlZWJzZC1idWlsZDogZml4IGJ1aWxk
aW5nIGVmaWZhdCBhZnRlciByMzUxODMxIik6Cj4gRnJlZUJTRCByZXZpc2lvbnMgYWZ0ZXIgcjM1
MTgzMSBubyBsb25nZXIgYXV0b21hdGljYWxseSBidWlsZCBhbgo+IGVmaWZhdCBwYXJ0aXRpb24g
aW1hZ2UsIGFuZCBtYWtlZnMgc2hvdWxkIGJlIHVzZWQgaW5zdGVhZCBpZiBzdWNoIGZpbGUKPiBp
cyByZXF1aXJlZC4KPiAKPiBEbyB0aGlzIGFuZCBhZGQgbG9naWMgdG8gYnVpbGQgdGhlIGVmaWZh
dCBwYXJ0aXRpb24gb3Vyc2VsdmVzIGlmIGl0J3MKPiBub3QgcHJlc2VudCBpbiB0aGUgb3V0cHV0
IG9mIHRoZSBidWlsZC4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KCkFuZCBwdXNoZWQgdG8gcHJldGVzdCwgdGhhbmtzLgoKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
