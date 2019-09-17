Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEBDB5594
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 20:44:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAIQN-0005Vn-0i; Tue, 17 Sep 2019 18:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAIQL-0005VX-1Q
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 18:42:01 +0000
X-Inumbo-ID: d55f3ba0-d97a-11e9-a337-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d55f3ba0-d97a-11e9-a337-bc764e2007e4;
 Tue, 17 Sep 2019 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568745721;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DMGKwtHWMmBpOhHCypkXpmKwR6zRkmcg13cD4VG7SU0=;
 b=CB/Jj7JOV91QwpZiTGKS/+7g7I85p1EVjwvCMGZ3Z7ExqJ9VTxHgnDdg
 1Y6kI07E81y8EdQdHPaeWk9fSQhxtRph4bT8FQ0EZGyEIL00lHceoso1B
 zPDUt2TBaZJHTtfIEFw87/8BYpmJx0Fvui+/zmZvS4ZPEdZFS3JLJwMKo o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: opVH3QS2oa4aCgX+C+UTWMPnRo61+AlQCI9++CIogVwb5Q4cOQyarGl+HwO1Yu6nh1nYyfNGh+
 8/SxbEYacJcug9fLcxulVfkspKiVE+NoprAUCLFczNoqd1ikE4RbHMMns8fyqkqlCZj9wfSHB7
 teKpTIp3BxzwJ/s9Xb9Frm6XyFLOup3sJQlzveh04sOB+oVCR1v1zeuQ7zG6ftXz+IUBqy0FOw
 lyly3mWKRoYk8NlLo+orD8OPCHs8ONedabiolc5bBWHcKpL8o2kO+MjcGKUMkzyEV8nzkcz+0e
 Jg8=
X-SBRS: 2.7
X-MesageID: 5690188
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5690188"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.10484.891069.303350@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 19:41:56 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20190917183425.4826-1-andrew.cooper3@citrix.com>
References: <20190917183425.4826-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/libs: Fix build following c/s
 56dccee3f, take 2
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
Cc: Juergen
 Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIHRvb2xzL2xpYnM6IEZpeCBidWlsZCBmb2xs
b3dpbmcgYy9zIDU2ZGNjZWUzZiwgdGFrZSAyIik6Cj4gVGhlIGZpeCBmb3IgYy9zIDAxYmE4ZjYy
YjYxOCB3YXMgc3BlY3VsYXRpdmUgZ2l2ZW4gbm8gbG9jYWwgcmVwcm8uICBJdCB0dXJucwo+IG91
dCB0aGF0IGl0IGRpZG4ndCBmaXggdGhlIHByb2JsZW0uCj4gCj4gVGhlICQoQVVUT0lOQ1MpIHZh
cmlhYmxlIG5lZWRzIHRvIGJlIHZpc2libGUgYmVmb3JlIGxpYnMubWsgaXMgaW5jbHVkZWQsIHRv
Cj4gaGF2ZSBhbnkgZWZmZWN0LgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
