Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32641B0073
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:45:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84km-0004yE-H5; Wed, 11 Sep 2019 15:41:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bpM+=XG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i84kl-0004y9-Pu
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:41:55 +0000
X-Inumbo-ID: ae6dedc2-d4aa-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae6dedc2-d4aa-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568216515;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Q4Q0DGDQfXD8QJI3FX7XdUraPW2n7v5DZjROz3XZN1o=;
 b=eSDeLA30rl0kbyJNRvUAMnpC0h6uz8w0QDE4kr5VkjgVTWfeBFN+777V
 JUlbbgV/G9RlagpwmukFMOuUkeHjalYHiaCYPKY/4KkjW0UW6PVoSVLQH
 ZE8R6C1dnB8IR9+65UEKUfrdqYu717DUdHmsLkGCS3xNPUYDojNstjmQM 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yYCh3vbDop18y95yx1YnPcE9qhS0338dPRKGofhktFL1guhRIO5rI+V4zSUkBYy/gZvwltDa7R
 g53lVqjYxJzQxUK2meDiJqIv1sJYaiObUBRyb1wWvoXc/pSJHu6jZyYKzSCiz9goQJhXiYK5+n
 vd1D4Ely3/LqxraiUuLEw68CWq5wA6PeJzKNajytzqZoZDrXdH14uZIvyo4DQ9axXs43+yGW6y
 84xd+Z4AFEkpaqusnNGj0fXxKDMX46R7DMF6o39Aws9ws4j8imrGIwSxHuVJhB9wFeAwRqVVcb
 LA8=
X-SBRS: 2.7
X-MesageID: 5727686
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,493,1559534400"; 
   d="scan'208";a="5727686"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23929.5537.799665.824955@mariner.uk.xensource.com>
Date: Wed, 11 Sep 2019 16:41:21 +0100
To: Lars Kurth <lars.kurth@citrix.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <0b543489f930ab966d916e47a738d77de793b8c4.1567596460.git-series.lars.kurth@citrix.com>
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
 <0b543489f930ab966d916e47a738d77de793b8c4.1567596460.git-series.lars.kurth@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 3/3] Add logic to use V section entry in
 THE REST for identifying xen trees
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGFycyBLdXJ0aCB3cml0ZXMgKCJbWGVuLWRldmVsXSBbUEFUQ0ggdjQgMy8zXSBBZGQgbG9naWMg
dG8gdXNlIFYgc2VjdGlvbiBlbnRyeSBpbiBUSEUgUkVTVCBmb3IgaWRlbnRpZnlpbmcgeGVuIHRy
ZWVzIik6Cj4gU3BlY2lmaWNhbGx5Ogo+ICogTW92ZSBjaGVjayB1bnRpbCBhZnRlciB0aGUgTUFJ
TlRBSU5FUlMgZmlsZSBoYXMgYmVlbiByZWFkCj4gKiBBZGQgZ2V0X3hlbl9tYWludGFpbmVyc19m
aWxlX3ZlcnNpb24oKSBmb3IgY2hlY2sKPiAqIFJlbW92ZSB0b3Bfb2ZfdHJlZSBhcyBub3QgbmVl
ZGVkIGFueSBtb3JlCj4gKiBGYWlsIHdpdGggZXh0ZW5kZWQgZXJyb3IgbWVzc2FnZSB3aGVuIHVz
ZWQgb3V0IG9mIHRyZWUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
