Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B210CCFC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:45:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaMs2-0002ub-LC; Thu, 28 Nov 2019 16:42:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Xud=ZU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iaMs1-0002uW-4F
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:42:21 +0000
X-Inumbo-ID: 0b17161c-11fe-11ea-a3d5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b17161c-11fe-11ea-a3d5-12813bfff9fa;
 Thu, 28 Nov 2019 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574959339;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=IjrlJrv/Sdv8dJXXfkx697V+kvBj6H+iYuRhBjfxXA0=;
 b=U8zj3ePum8X9ZPGjHS8L2yYoC0vY349xCLc9AXPB0+Deg9lZVAWMY0uP
 7AUwA1hn6OzZ684cje6CHNf4YVsrsslF8hHBsQouIVdQrM1Te/CYhVKlJ
 8QqrLWRYVB88qBy56HY/9hh1LZ6DtvUEwOWdLYtO4VbX5fm7WN7xTxz2x M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MULBn8Xab5LPJD5UJqnIJ3qEjF+xHg4wJgzCbfRkcPxGrrJqzmzXEV3jeDuGPNXtEFRZ5PKNRn
 ti/Yz+LfAoVy9Eis+5GSU1eWxzGVdO5xngru9RSKqM4almpp8OOyHkP1zX4RWffEF10P5W1XBE
 O/76KzVLxjKA2k8V1RrcX4/Y9hJ3IKvt3xliC2kRQyN46gAxATlJY2XsrS5eZJa2pAB4Bz4J37
 eRCpW6yluSet+hOqzXKRb3OPMddjMoTtUb+TElsY7xU7paHBcL8JMlVgnrt2i6IAW1tuCjBEDN
 mCU=
X-SBRS: 2.7
X-MesageID: 9372157
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9372157"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24031.63719.734430.510061@mariner.uk.xensource.com>
Date: Thu, 28 Nov 2019 16:42:15 +0000
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
References: <20191128135813.8893-1-pdurrant@amazon.com>
 <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v4] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSC1mb3ItNC4xMyB2NF0gUmF0aW9uYWxpemUg
bWF4X2dyYW50X2ZyYW1lcyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBoYW5kbGluZyIpOgo+IE9u
IDI4LjExLjIwMTkgMTQ6NTgsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ICAgICAgdWludDMyX3Qg
bWF4X3ZjcHVzOwo+ID4gICAgICB1aW50MzJfdCBtYXhfZXZ0Y2huX3BvcnQ7Cj4gPiAtICAgIHVp
bnQzMl90IG1heF9ncmFudF9mcmFtZXM7Cj4gPiAtICAgIHVpbnQzMl90IG1heF9tYXB0cmFja19m
cmFtZXM7Cj4gPiArICAgIGludDMyX3QgbWF4X2dyYW50X2ZyYW1lczsKPiA+ICsgICAgaW50MzJf
dCBtYXhfbWFwdHJhY2tfZnJhbWVzOwo+IAo+IFdoaWxlIHRoaXMgbWF5IHdhbnQgYmFja3BvcnRp
bmcgYWl1aSwgd2UgbmVlZCB0byBiZSBhIGxpdHRsZQo+IGNhcmVmdWwgd2l0aCB0aGUgaW50ZXJm
YWNlIGNoYW5nZSBoZXJlLgoKQSBub3RlIGhlcmUgaW4gYSBsaXN0IGRpc2N1c3Npb24sIG9yIGV2
ZW4gaW4gYSBjb21taXQgbWVzc2FnZSwgaXMKcGVyaGFwcyBub3QgZ29pbmcgdG8gYmUgdmVyeSBl
ZmZlY3RpdmUgdG8gZGVhbCB3aXRoIHRoaXMuCgpIb3cgYmFkIHdvdWxkIGl0IGJlIHRvIGNoYW5n
ZSB0aGUgbmFtZXMgYXMgd2VsbCBhcyB0aGUgdHlwZXMgPwoKSWFuLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
